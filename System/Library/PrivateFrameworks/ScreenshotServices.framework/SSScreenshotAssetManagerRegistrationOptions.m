@interface SSScreenshotAssetManagerRegistrationOptions
- (NSArray)harvestedMetadata;
- (NSString)applicationBundleID;
- (NSString)assetDescription;
- (SSUIServiceOptionsAssetMetadata)assetMetadata;
- (unint64_t)saveLocation;
- (void)setApplicationBundleID:(id)a3;
- (void)setAssetMetadata:(id)a3;
- (void)setHarvestedMetadata:(id)a3;
- (void)setSaveLocation:(unint64_t)a3;
@end

@implementation SSScreenshotAssetManagerRegistrationOptions

- (NSString)assetDescription
{
  if (!_SSLinksInPhotosEnabled())
  {
    v9 = 0;
    goto LABEL_10;
  }
  v3 = [(SSScreenshotAssetManagerRegistrationOptions *)self harvestedMetadata];
  v4 = [v3 firstObject];

  if (!v4)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v5 = [v4 userActivityTitle];
  uint64_t v6 = [v4 userActivityURL];
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = &stru_26D055B20;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26D055B20];
  v9 = [&stru_26D055B20 stringByAppendingFormat:@"Title: %@", v8];

  if (v7)
  {
LABEL_5:
    v10 = [v7 absoluteURL];
    uint64_t v11 = [(__CFString *)v9 stringByAppendingFormat:@"\nURL: %@", v10];

    v9 = (__CFString *)v11;
  }
LABEL_6:

LABEL_9:
LABEL_10:
  return (NSString *)v9;
}

- (unint64_t)saveLocation
{
  return self->_saveLocation;
}

- (void)setSaveLocation:(unint64_t)a3
{
  self->_saveLocation = a3;
}

- (SSUIServiceOptionsAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
}

- (NSArray)harvestedMetadata
{
  return self->_harvestedMetadata;
}

- (void)setHarvestedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestedMetadata, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
}

@end