@interface CRThemeAssetDownloadRequest
- (BOOL)isEqual:(id)a3;
- (CRThemeAssetDownloadRequest)initWithAssetIdentifier:(id)a3 maximumSDKVersion:(id)a4 maximumCompatibilityVersion:(unint64_t)a5;
- (NSString)assetIdentifier;
- (NSString)maximumSDKVersion;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maximumCompatibilityVersion;
@end

@implementation CRThemeAssetDownloadRequest

- (CRThemeAssetDownloadRequest)initWithAssetIdentifier:(id)a3 maximumSDKVersion:(id)a4 maximumCompatibilityVersion:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRThemeAssetDownloadRequest;
  v11 = [(CRThemeAssetDownloadRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetIdentifier, a3);
    objc_storeStrong((id *)&v12->_maximumSDKVersion, a4);
    v12->_maximumCompatibilityVersion = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRThemeAssetDownloadRequest *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CRThemeAssetDownloadRequest *)self assetIdentifier];
      v6 = [(CRThemeAssetDownloadRequest *)v4 assetIdentifier];
      if ([v5 isEqual:v6])
      {
        v7 = [(CRThemeAssetDownloadRequest *)self maximumSDKVersion];
        v8 = [(CRThemeAssetDownloadRequest *)v4 maximumSDKVersion];
        if ([v7 isEqual:v8])
        {
          id v9 = [(CRThemeAssetDownloadRequest *)self maximumCompatibilityVersion];
          BOOL v10 = v9 == (id)[(CRThemeAssetDownloadRequest *)v4 maximumCompatibilityVersion];
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRThemeAssetDownloadRequest *)self assetIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(CRThemeAssetDownloadRequest *)self maximumSDKVersion];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(CRThemeAssetDownloadRequest *)self maximumCompatibilityVersion];

  return v7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CRThemeAssetDownloadRequest;
  v3 = [(CRThemeAssetDownloadRequest *)&v8 description];
  unint64_t v4 = [(CRThemeAssetDownloadRequest *)self assetIdentifier];
  v5 = [(CRThemeAssetDownloadRequest *)self maximumSDKVersion];
  unint64_t v6 = +[NSString stringWithFormat:@"%@ { assetID: %@, sdkVersion: %@, compatibilityVersion: %lu }", v3, v4, v5, [(CRThemeAssetDownloadRequest *)self maximumCompatibilityVersion]];

  return v6;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)maximumSDKVersion
{
  return self->_maximumSDKVersion;
}

- (unint64_t)maximumCompatibilityVersion
{
  return self->_maximumCompatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumSDKVersion, 0);

  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end