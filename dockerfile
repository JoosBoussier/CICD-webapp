# 1. Gebruik Node.js versie 20.x.x LTS als basisimage
FROM node:20

# 2. Stel de werkdirectory in naar /app in de container
WORKDIR /app

# 3. Kopieer package.json en yarn.lock naar de container om de afhankelijkheden te installeren
COPY package.json yarn.lock ./

# 4. Installeer de afhankelijkheden met de optie --frozen-lockfile
RUN yarn install --frozen-lockfile

# 5. Kopieer de rest van de applicatie naar de container
COPY . .

# 6. Stel de omgeving variabele in voor de serverpoort (optioneel)
ENV PORT=3000

# 7. Exposeer poort 3000
EXPOSE 3000

# 8. Start de applicatie met 'yarn start'
CMD ["yarn", "start"]

