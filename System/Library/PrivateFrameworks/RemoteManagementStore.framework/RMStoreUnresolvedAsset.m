@interface RMStoreUnresolvedAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnresolvedAsset:(id)a3;
- (NSDictionary)queryParameters;
- (NSString)assetIdentifier;
- (NSString)extensionToken;
- (NSURL)downloadURL;
- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4;
- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5;
- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4;
- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5;
- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 resolveAs:(int64_t)a4 queryParameters:(id)a5 downloadURL:(id)a6 extensionToken:(id)a7;
- (RMStoreUnresolvedAsset)initWithCoder:(id)a3;
- (int64_t)resolveAs;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionToken:(id)a3;
@end

@implementation RMStoreUnresolvedAsset

- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4
{
  id v6 = a4;
  v7 = [a3 declarationIdentifier];
  v8 = [(RMStoreUnresolvedAsset *)self initWithAssetIdentifier:v7 resolveAs:0 queryParameters:v6 downloadURL:0 extensionToken:0];

  return v8;
}

- (RMStoreUnresolvedAsset)initWithAsset:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 declarationIdentifier];
  v11 = [(RMStoreUnresolvedAsset *)self initWithAssetIdentifier:v10 resolveAs:1 queryParameters:v9 downloadURL:v8 extensionToken:0];

  return v11;
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4
{
  return [(RMStoreUnresolvedAsset *)self initWithAssetIdentifier:a3 resolveAs:0 queryParameters:a4 downloadURL:0 extensionToken:0];
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 queryParameters:(id)a4 downloadURL:(id)a5
{
  return [(RMStoreUnresolvedAsset *)self initWithAssetIdentifier:a3 resolveAs:1 queryParameters:a4 downloadURL:a5 extensionToken:0];
}

- (RMStoreUnresolvedAsset)initWithAssetIdentifier:(id)a3 resolveAs:(int64_t)a4 queryParameters:(id)a5 downloadURL:(id)a6 extensionToken:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RMStoreUnresolvedAsset;
  v17 = [(RMStoreUnresolvedAsset *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetIdentifier, a3);
    v18->_resolveAs = a4;
    objc_storeStrong((id *)&v18->_queryParameters, a5);
    objc_storeStrong((id *)&v18->_downloadURL, a6);
    objc_storeStrong((id *)&v18->_extensionToken, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreUnresolvedAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-identifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"resolve-as"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"query-parameters"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"download-url"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extension-token"];

  id v13 = [(RMStoreUnresolvedAsset *)self initWithAssetIdentifier:v5 resolveAs:v6 queryParameters:v10 downloadURL:v11 extensionToken:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMStoreUnresolvedAsset *)self assetIdentifier];
  [v4 encodeObject:v5 forKey:@"asset-identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[RMStoreUnresolvedAsset resolveAs](self, "resolveAs"), @"resolve-as");
  uint64_t v6 = [(RMStoreUnresolvedAsset *)self queryParameters];
  [v4 encodeObject:v6 forKey:@"query-parameters"];

  v7 = [(RMStoreUnresolvedAsset *)self downloadURL];
  [v4 encodeObject:v7 forKey:@"download-url"];

  id v8 = [(RMStoreUnresolvedAsset *)self extensionToken];
  [v4 encodeObject:v8 forKey:@"extension-token"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMStoreUnresolvedAsset *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMStoreUnresolvedAsset *)self isEqualToUnresolvedAsset:v4];
  }

  return v5;
}

- (BOOL)isEqualToUnresolvedAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMStoreUnresolvedAsset *)self assetIdentifier];
  uint64_t v6 = [v4 assetIdentifier];
  if ([v5 isEqualToString:v6])
  {
    int64_t v7 = [(RMStoreUnresolvedAsset *)self resolveAs];
    if (v7 == [v4 resolveAs])
    {
      id v8 = [(RMStoreUnresolvedAsset *)self queryParameters];
      id v9 = [v4 queryParameters];
      id v10 = v8;
      id v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
      }
      else
      {
        char v13 = 0;
        id v14 = v11;
        id v15 = v10;
        if (!v10 || !v11) {
          goto LABEL_24;
        }
        int v16 = [v10 isEqual:v11];

        if (!v16)
        {
          char v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v27 = v12;
      v17 = [(RMStoreUnresolvedAsset *)self downloadURL];
      v18 = [v4 downloadURL];
      id v15 = v17;
      id v19 = v18;
      id v14 = v19;
      if (v15 == v19)
      {
      }
      else
      {
        char v13 = 0;
        objc_super v20 = v19;
        id v21 = v15;
        if (!v15 || !v19)
        {
LABEL_22:

          goto LABEL_23;
        }
        int v22 = [v15 isEqual:v19];

        if (!v22)
        {
          char v13 = 0;
LABEL_23:
          v12 = v27;
LABEL_24:

          goto LABEL_25;
        }
      }
      v23 = [(RMStoreUnresolvedAsset *)self extensionToken];
      v24 = [v4 extensionToken];
      id v21 = v23;
      id v25 = v24;
      objc_super v20 = v25;
      if (v21 == v25)
      {
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        if (v21 && v25) {
          char v13 = [v21 isEqual:v25];
        }
      }

      goto LABEL_22;
    }
  }
  char v13 = 0;
LABEL_26:

  return v13;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (int64_t)resolveAs
{
  return self->_resolveAs;
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (NSString)extensionToken
{
  return self->_extensionToken;
}

- (void)setExtensionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionToken, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end