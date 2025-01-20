@interface _LTDAnalyticsAssetSnapshot
- (BOOL)hasAllData;
- (NSString)assetBuild;
- (NSString)expectedAssetVersion;
- (NSString)installedAssetVersion;
- (_LTDAnalyticsAssetSnapshot)initWithAssetBuild:(id)a3 expectedAssetVersion:(id)a4 installedAssetVersion:(id)a5;
- (id)description;
@end

@implementation _LTDAnalyticsAssetSnapshot

- (_LTDAnalyticsAssetSnapshot)initWithAssetBuild:(id)a3 expectedAssetVersion:(id)a4 installedAssetVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDAnalyticsAssetSnapshot;
  v11 = [(_LTDAnalyticsAssetSnapshot *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    assetBuild = v11->_assetBuild;
    v11->_assetBuild = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    expectedAssetVersion = v11->_expectedAssetVersion;
    v11->_expectedAssetVersion = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    installedAssetVersion = v11->_installedAssetVersion;
    v11->_installedAssetVersion = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)hasAllData
{
  return self->_assetBuild && self->_expectedAssetVersion && self->_installedAssetVersion != 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_LTDAnalyticsAssetSnapshot *)self assetBuild];
  v7 = [(_LTDAnalyticsAssetSnapshot *)self expectedAssetVersion];
  id v8 = [(_LTDAnalyticsAssetSnapshot *)self installedAssetVersion];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; assetBuild: %@; expectedAssetVersion: %@; installedAssetVersion: %@>",
    v5,
    self,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

- (NSString)assetBuild
{
  return self->_assetBuild;
}

- (NSString)expectedAssetVersion
{
  return self->_expectedAssetVersion;
}

- (NSString)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAssetVersion, 0);
  objc_storeStrong((id *)&self->_expectedAssetVersion, 0);
  objc_storeStrong((id *)&self->_assetBuild, 0);
}

@end