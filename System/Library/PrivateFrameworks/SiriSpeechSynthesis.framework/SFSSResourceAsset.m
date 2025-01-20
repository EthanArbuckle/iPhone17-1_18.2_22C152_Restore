@interface SFSSResourceAsset
+ (id)generateResourceAssetFromResourceKeyString:(id)a3;
- (NSString)assetPath;
- (NSString)language;
- (SFSSResourceAsset)initWithPath:(id)a3;
- (id)init:(id)a3 contentVersion:(int64_t)a4;
- (id)key;
- (int64_t)contentVersion;
- (void)setAssetPath:(id)a3;
@end

@implementation SFSSResourceAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (NSString)language
{
  return self->_language;
}

- (void)setAssetPath:(id)a3
{
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (id)key
{
  v2 = NSString;
  language = self->_language;
  v4 = [NSNumber numberWithInteger:self->_contentVersion];
  v5 = [v4 stringValue];
  v6 = [v2 stringWithFormat:@"%@:%@", language, v5];

  return v6;
}

- (id)init:(id)a3 contentVersion:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSSResourceAsset;
  v7 = [(SFSSResourceAsset *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    language = v7->_language;
    v7->_language = (NSString *)v8;

    v7->_contentVersion = a4;
  }
  v10 = SFSSGetLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [(SFSSResourceAsset *)v7 key];
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_impl(&dword_22B575000, v10, OS_LOG_TYPE_INFO, "Init ResourceAsset with key=%@", buf, 0xCu);
  }
  return v7;
}

- (SFSSResourceAsset)initWithPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSSResourceAsset;
  id v6 = [(SFSSResourceAsset *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetPath, a3);
    uint64_t v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      assetPath = v7->_assetPath;
      *(_DWORD *)buf = 138412290;
      objc_super v13 = assetPath;
      _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Init ResourceAsset with assetPath=%@", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)generateResourceAssetFromResourceKeyString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@":"];
  v4 = [v3 objectAtIndex:0];
  id v5 = [v3 objectAtIndex:1];
  uint64_t v6 = [v5 integerValue];

  id v7 = [[SFSSResourceAsset alloc] init:v4 contentVersion:v6];
  return v7;
}

@end