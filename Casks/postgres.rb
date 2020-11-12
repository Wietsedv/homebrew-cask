cask "postgres" do
  version "2.4.1"
  sha256 "c09c182ce8bbba0c374f216040f90e47ccd40ea5b9349c292691ba5f8de2f3e6"

  # github.com/PostgresApp/PostgresApp/ was verified as official when first introduced to the cask
  url "https://github.com/PostgresApp/PostgresApp/releases/download/v#{version}/Postgres-#{version}-9.5-9.6-10-11-12-13.dmg"
  appcast "https://github.com/PostgresApp/PostgresApp/releases.atom"
  name "Postgres"
  homepage "https://postgresapp.com/"

  auto_updates true
  depends_on macos: ">= :sierra"

  app "Postgres.app"

  uninstall launchctl: "com.postgresapp.Postgres#{version.major}LoginHelper",
            quit:      [
              "com.postgresapp.Postgres#{version.major}",
              "com.postgresapp.Postgres#{version.major}MenuHelper",
            ]

  zap trash: [
    "~/Library/Application Support/Postgres",
    "~/Library/Caches/com.postgresapp.Postgres#{version.major}",
    "~/Library/Cookies/com.postgresapp.Postgres#{version.major}.binarycookies",
    "~/Library/Preferences/com.postgresapp.Postgres#{version.major}.plist",
  ]
end
