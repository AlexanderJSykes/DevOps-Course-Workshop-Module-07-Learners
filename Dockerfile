FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
COPY . /app
WORKDIR /app
RUN dotnet build --configuration Release

RUN dotnet restore

# copy everything else and build app
WORKDIR /app/DotnetTemplate.Web
RUN dotnet publish -c release -o /build 

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /build ./
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll"]