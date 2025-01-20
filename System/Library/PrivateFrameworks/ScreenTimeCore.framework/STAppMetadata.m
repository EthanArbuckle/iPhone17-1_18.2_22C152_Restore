@interface STAppMetadata
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)ratingLabel;
- (NSString)software;
- (NSString)vendorName;
- (NSURL)artworkURL;
- (STAppMetadata)initWithBundleIdentifier:(id)a3 displayName:(id)a4 artworkURL:(id)a5 vendorName:(id)a6 ratingLabel:(id)a7 software:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setArtworkURL:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setSoftware:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation STAppMetadata

- (STAppMetadata)initWithBundleIdentifier:(id)a3 displayName:(id)a4 artworkURL:(id)a5 vendorName:(id)a6 ratingLabel:(id)a7 software:(id)a8
{
  v33.receiver = self;
  v33.super_class = (Class)STAppMetadata;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(STAppMetadata *)&v33 init];
  uint64_t v20 = objc_msgSend(v18, "copy", v33.receiver, v33.super_class);

  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v20;

  uint64_t v22 = [v17 copy];
  displayName = v19->_displayName;
  v19->_displayName = (NSString *)v22;

  uint64_t v24 = [v16 copy];
  artworkURL = v19->_artworkURL;
  v19->_artworkURL = (NSURL *)v24;

  uint64_t v26 = [v15 copy];
  vendorName = v19->_vendorName;
  v19->_vendorName = (NSString *)v26;

  uint64_t v28 = [v14 copy];
  ratingLabel = v19->_ratingLabel;
  v19->_ratingLabel = (NSString *)v28;

  uint64_t v30 = [v13 copy];
  software = v19->_software;
  v19->_software = (NSString *)v30;

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  bundleIdentifier = self->_bundleIdentifier;
  displayName = self->_displayName;
  vendorName = self->_vendorName;
  ratingLabel = self->_ratingLabel;
  software = self->_software;
  artworkURL = self->_artworkURL;
  return (id)[v4 initWithBundleIdentifier:bundleIdentifier displayName:displayName artworkURL:artworkURL vendorName:vendorName ratingLabel:ratingLabel software:software];
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

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end