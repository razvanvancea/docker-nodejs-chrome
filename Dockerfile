FROM node:18.18.0-slim

RUN apt-get update
RUN apt-get install -y gnupg wget
RUN npm install -g npm@9.5.1

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable unzip \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' \
           "/opt/google/chrome/google-chrome"

RUN google-chrome --version   

