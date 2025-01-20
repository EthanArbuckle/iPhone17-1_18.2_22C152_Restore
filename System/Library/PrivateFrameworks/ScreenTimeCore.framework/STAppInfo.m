@interface STAppInfo
- (BOOL)distributorIsThirdParty;
- (NSData)artworkData;
- (NSString)bundleIdentifier;
- (NSString)developerName;
- (NSString)displayName;
- (NSString)distributorID;
- (NSString)ratingLabel;
- (NSURL)artworkURL;
- (NSURL)localURL;
- (id)description;
- (int64_t)source;
- (signed)platform;
- (unint64_t)adamID;
- (unint64_t)betaVersionIdentifier;
- (unint64_t)versionIdentifier;
- (void)setAdamID:(unint64_t)a3;
- (void)setArtworkData:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setBetaVersionIdentifier:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDistributorID:(id)a3;
- (void)setDistributorIsThirdParty:(BOOL)a3;
- (void)setLocalURL:(id)a3;
- (void)setPlatform:(signed __int16)a3;
- (void)setRatingLabel:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setVersionIdentifier:(unint64_t)a3;
@end

@implementation STAppInfo

- (id)description
{
  v3 = NSString;
  v4 = [(STAppInfo *)self bundleIdentifier];
  v5 = [(STAppInfo *)self displayName];
  v6 = [(STAppInfo *)self developerName];
  v7 = [v3 stringWithFormat:@"<%p ID: %@ Name: %@ Developer: %@, AdamID: %llu>", self, v4, v5, v6, -[STAppInfo adamID](self, "adamID")];

  return v7;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (signed)platform
{
  return self->_platform;
}

- (void)setPlatform:(signed __int16)a3
{
  self->_platform = a3;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (NSString)distributorID
{
  return self->_distributorID;
}

- (void)setDistributorID:(id)a3
{
}

- (BOOL)distributorIsThirdParty
{
  return self->_distributorIsThirdParty;
}

- (void)setDistributorIsThirdParty:(BOOL)a3
{
  self->_distributorIsThirdParty = a3;
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(unint64_t)a3
{
  self->_versionIdentifier = a3;
}

- (unint64_t)betaVersionIdentifier
{
  return self->_betaVersionIdentifier;
}

- (void)setBetaVersionIdentifier:(unint64_t)a3
{
  self->_betaVersionIdentifier = a3;
}

- (NSString)developerName
{
  return self->_developerName;
}

- (void)setDeveloperName:(id)a3
{
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void)setLocalURL:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSData)artworkData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setArtworkData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end