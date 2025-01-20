@interface WLKVideoAsset
- (NSString)URL;
- (NSString)assetID;
- (NSString)programID;
- (WLKVideoAsset)initWithDictionary:(id)a3;
@end

@implementation WLKVideoAsset

- (WLKVideoAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKVideoAsset;
  v5 = [(WLKVideoAsset *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"hlsUrl");
    URL = v5->_URL;
    v5->_URL = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"programId");
    programID = v5->_programID;
    v5->_programID = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"assetId");
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v10;
  }
  return v5;
}

- (NSString)URL
{
  return self->_URL;
}

- (NSString)programID
{
  return self->_programID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_programID, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end