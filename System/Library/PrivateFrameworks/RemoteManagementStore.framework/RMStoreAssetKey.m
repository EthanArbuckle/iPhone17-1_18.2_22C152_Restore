@interface RMStoreAssetKey
+ (id)newAssetKey:(id)a3;
+ (id)newAssetKeyWithAsset:(id)a3;
+ (id)newAssetKeyWithAssetIdentifier:(id)a3 assetServerToken:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)assetIdentifier;
- (NSString)assetServerToken;
- (NSString)key;
- (RMStoreAssetKey)initWithAsset:(id)a3;
- (RMStoreAssetKey)initWithAssetIdentifier:(id)a3 assetServerToken:(id)a4;
- (RMStoreAssetKey)initWithAssetKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation RMStoreAssetKey

+ (id)newAssetKey:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreAssetKey alloc] initWithAssetKey:v3];

  return v4;
}

+ (id)newAssetKeyWithAsset:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreAssetKey alloc] initWithAsset:v3];

  return v4;
}

+ (id)newAssetKeyWithAssetIdentifier:(id)a3 assetServerToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[RMStoreAssetKey alloc] initWithAssetIdentifier:v6 assetServerToken:v5];

  return v7;
}

- (RMStoreAssetKey)initWithAssetKey:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMStoreAssetKey;
  id v6 = [(RMStoreAssetKey *)&v17 init];
  if (v6)
  {
    v7 = [v5 componentsSeparatedByString:@"."];
    if ([v7 count] == 2)
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
      uint64_t v10 = [[NSString alloc] initWithData:v9 encoding:4];

      assetIdentifier = v6->_assetIdentifier;
      v6->_assetIdentifier = (NSString *)v10;

      v12 = [v7 objectAtIndexedSubscript:1];
      v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
      uint64_t v14 = [[NSString alloc] initWithData:v13 encoding:4];

      assetServerToken = v6->_assetServerToken;
      v6->_assetServerToken = (NSString *)v14;

      objc_storeStrong((id *)&v6->_key, a3);
    }
  }
  return v6;
}

- (RMStoreAssetKey)initWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 declarationIdentifier];
  id v6 = [v4 declarationServerToken];

  v7 = [(RMStoreAssetKey *)self initWithAssetIdentifier:v5 assetServerToken:v6];
  return v7;
}

- (RMStoreAssetKey)initWithAssetIdentifier:(id)a3 assetServerToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RMStoreAssetKey;
  v9 = [(RMStoreAssetKey *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetIdentifier, a3);
    objc_storeStrong((id *)&v10->_assetServerToken, a4);
    v11 = NSString;
    v12 = [(NSString *)v10->_assetIdentifier dataUsingEncoding:4];
    v13 = [v12 base64EncodedStringWithOptions:0];

    uint64_t v14 = [(NSString *)v10->_assetServerToken dataUsingEncoding:4];
    v15 = [v14 base64EncodedStringWithOptions:0];

    uint64_t v16 = [v11 stringWithFormat:@"%@.%@", v13, v15];
    key = v10->_key;
    v10->_key = (NSString *)v16;
  }
  return v10;
}

- (BOOL)isValid
{
  v2 = [(RMStoreAssetKey *)self key];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(RMStoreAssetKey *)self assetIdentifier];
  id v7 = [(RMStoreAssetKey *)self assetServerToken];
  id v8 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, serverToken = %@ }>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMStoreAssetKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(RMStoreAssetKey *)self key];
      id v6 = [(RMStoreAssetKey *)v4 key];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(RMStoreAssetKey *)self key];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v3 = [(RMStoreAssetKey *)self key];
  id v4 = +[RMStoreAssetKey newAssetKey:v3];

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)assetServerToken
{
  return self->_assetServerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetServerToken, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end