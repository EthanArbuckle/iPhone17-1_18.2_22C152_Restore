@interface PHAWallpaperDemoDescriptorConfig
- (NSString)assetUUID;
- (NSString)styleCategory;
- (NSString)titleKey;
- (PHAWallpaperDemoDescriptorConfig)initWithDictionary:(id)a3;
- (void)setAssetUUID:(id)a3;
- (void)setStyleCategory:(id)a3;
- (void)setTitleKey:(id)a3;
@end

@implementation PHAWallpaperDemoDescriptorConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_styleCategory, 0);

  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setStyleCategory:(id)a3
{
}

- (NSString)styleCategory
{
  return self->_styleCategory;
}

- (void)setAssetUUID:(id)a3
{
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (PHAWallpaperDemoDescriptorConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PHAWallpaperDemoDescriptorConfig *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AssetUUID"];
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    if (!v5->_assetUUID)
    {
      v12 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"StyleCategory"];
    styleCategory = v5->_styleCategory;
    v5->_styleCategory = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"TitleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v10;
  }
  v12 = v5;
LABEL_6:

  return v12;
}

@end