@interface PKAMSLookupItem
- (ASCArtwork)artwork;
- (NSNumber)appStoreIdentifier;
- (NSString)displayName;
- (NSString)distributionIdentifier;
- (PKAMSLookupItem)init;
- (PKAMSLookupItem)initWithDict:(id)a3;
- (UIImage)iconImage;
- (void)setArtwork:(id)a3;
- (void)setIconImage:(id)a3;
@end

@implementation PKAMSLookupItem

- (PKAMSLookupItem)init
{
  return 0;
}

- (PKAMSLookupItem)initWithDict:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKAMSLookupItem;
    v5 = [(PKAMSLookupItem *)&v17 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4BB40]];
      uint64_t v7 = [v6 numberValue];
      appStoreIdentifier = v5->_appStoreIdentifier;
      v5->_appStoreIdentifier = (NSNumber *)v7;

      uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4BB50]];
      artwork = v5->_artwork;
      v5->_artwork = (ASCArtwork *)v9;

      uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4BB68]];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v11;

      uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4BB48]];
      distributionIdentifier = v5->_distributionIdentifier;
      v5->_distributionIdentifier = (NSString *)v13;
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSNumber)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSString)distributionIdentifier
{
  return self->_distributionIdentifier;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_distributionIdentifier, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
}

@end