@interface ICStoreFileAssetFairPlayInfo
- (ICStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3;
- (NSData)dpInfoData;
- (NSData)pinfData;
- (NSData)sinf2Data;
- (NSData)sinfData;
- (NSDictionary)purchaseBundleSinfDictionary;
- (NSDictionary)responseSinfDictionary;
- (int64_t)identifier;
@end

@implementation ICStoreFileAssetFairPlayInfo

- (void).cxx_destruct
{
}

- (NSDictionary)responseSinfDictionary
{
  return self->_responseSinfDictionary;
}

- (NSDictionary)purchaseBundleSinfDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"id"];

  if (v4)
  {
    int64_t v5 = [(ICStoreFileAssetFairPlayInfo *)self identifier];
    v6 = [NSNumber numberWithLongLong:v5];
    [v3 setObject:v6 forKey:@"id"];
  }
  v7 = [(ICStoreFileAssetFairPlayInfo *)self dpInfoData];
  if (v7) {
    [v3 setObject:v7 forKey:@"dpInfo"];
  }
  v8 = [(ICStoreFileAssetFairPlayInfo *)self pinfData];
  if (v8) {
    [v3 setObject:v8 forKey:@"pinf"];
  }
  v9 = [(ICStoreFileAssetFairPlayInfo *)self sinfData];
  if (v9) {
    [v3 setObject:v9 forKey:@"sinf"];
  }
  v10 = [(ICStoreFileAssetFairPlayInfo *)self sinf2Data];
  if (v10) {
    [v3 setObject:v10 forKey:@"sinf2"];
  }

  return (NSDictionary *)v3;
}

- (NSData)sinf2Data
{
  v2 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"sinf2"];
  id v3 = _ICStoreFileAssetFairPlayInfoValueForValue(v2);

  return (NSData *)v3;
}

- (NSData)sinfData
{
  v2 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"sinf"];
  id v3 = _ICStoreFileAssetFairPlayInfoValueForValue(v2);

  return (NSData *)v3;
}

- (NSData)pinfData
{
  v2 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"pinf"];
  id v3 = _ICStoreFileAssetFairPlayInfoValueForValue(v2);

  return (NSData *)v3;
}

- (NSData)dpInfoData
{
  v2 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"dpInfo"];
  id v3 = _ICStoreFileAssetFairPlayInfoValueForValue(v2);

  return (NSData *)v3;
}

- (int64_t)identifier
{
  v2 = [(NSDictionary *)self->_responseSinfDictionary objectForKey:@"id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (ICStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICStoreFileAssetFairPlayInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseSinfDictionary = v5->_responseSinfDictionary;
    v5->_responseSinfDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end