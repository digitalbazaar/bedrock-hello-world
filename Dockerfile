FROM node:14-alpine AS base
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
WORKDIR /home/node/app

FROM base AS build-setup
RUN apk add --no-cache git bash autoconf automake libtool binutils gcc g++ make python

FROM build-setup AS build
# this is required only if private scoped packages are required
# ARG NODE_AUTH_TOKEN
USER node
COPY --chown=node:node . .
# this is required only if private scoped packages are required
# RUN echo -e "@some-private-scope:registry=https://npm.pkg.github.com/\n//npm.pkg.github.com/:_authToken=${NODE_AUTH_TOKEN}" > .npmrc
RUN npm i --no-optional --package-lock --production

FROM build AS test
# run a test suite if applicable
# RUN rm .npmrc

FROM base AS release
COPY --from=test --chown=node:node /home/node/app ./
EXPOSE 10443
ENV NODE_ENV=production
CMD [ "node", "helloworld"]
