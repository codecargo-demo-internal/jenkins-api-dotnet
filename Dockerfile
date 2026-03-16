FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY src/RedknotApi/RedknotApi.csproj src/RedknotApi/
RUN dotnet restore src/RedknotApi/RedknotApi.csproj
COPY . .
RUN dotnet publish src/RedknotApi/RedknotApi.csproj -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "RedknotApi.dll"]
