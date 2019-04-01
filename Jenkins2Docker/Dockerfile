FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 65074
EXPOSE 44321

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY Jenkins2Docker/Jenkins2Docker.csproj Jenkins2Docker/
RUN dotnet restore Jenkins2Docker/Jenkins2Docker.csproj
COPY . .
WORKDIR /src/Jenkins2Docker
RUN dotnet build Jenkins2Docker.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Jenkins2Docker.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Jenkins2Docker.dll"]
