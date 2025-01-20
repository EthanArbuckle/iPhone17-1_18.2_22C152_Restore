@interface STStatusRequest_MessagesItemStatesItemAssetsUsedItem
+ (NSSet)allowedKeys;
+ (id)buildRequiredOnlyWithAssetIdentifier:(id)a3 withServerHash:(id)a4;
+ (id)buildWithAssetIdentifier:(id)a3 withServerHash:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)assetIdentifier;
- (NSString)serverHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setAssetIdentifier:(id)a3;
- (void)setServerHash:(id)a3;
@end

@implementation STStatusRequest_MessagesItemStatesItemAssetsUsedItem

+ (NSSet)allowedKeys
{
  v5[0] = @"AssetIdentifier";
  v5[1] = @"ServerHash";
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)buildWithAssetIdentifier:(id)a3 withServerHash:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setAssetIdentifier:v6];

  [v7 setServerHash:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithAssetIdentifier:(id)a3 withServerHash:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setAssetIdentifier:v6];

  [v7 setServerHash:v5];
  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = +[NSMutableSet setWithArray:v7];

  v9 = +[STStatusRequest_MessagesItemStatesItemAssetsUsedItem allowedKeys];
  [v8 minusSet:v9];

  if ([v8 count])
  {
    if (!a4)
    {
      BOOL v12 = 0;
      goto LABEL_11;
    }
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"Unexpected payload keys: %@", v8];
    id v21 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a4 = +[NSError errorWithDomain:@"error" code:1 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    id v19 = 0;
    v13 = [(STStatusRequest_MessagesItemStatesItemAssetsUsedItem *)self loadStringFromDictionary:v6 withKey:@"AssetIdentifier" isRequired:1 defaultValue:0 error:&v19];
    id v10 = v19;
    assetIdentifier = self->_assetIdentifier;
    self->_assetIdentifier = v13;

    if (!v10)
    {
      id v18 = 0;
      v15 = [(STStatusRequest_MessagesItemStatesItemAssetsUsedItem *)self loadStringFromDictionary:v6 withKey:@"ServerHash" isRequired:1 defaultValue:0 error:&v18];
      id v10 = v18;
      serverHash = self->_serverHash;
      self->_serverHash = v15;
    }
    BOOL v12 = v10 == 0;
    if (a4 && v10)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

LABEL_11:
  return v12;
}

- (id)serializePayload
{
  v3 = +[NSMutableDictionary dictionary];
  [(STStatusRequest_MessagesItemStatesItemAssetsUsedItem *)self serializeStringIntoDictionary:v3 withKey:@"AssetIdentifier" withValue:self->_assetIdentifier isRequired:1 defaultValue:0];
  [(STStatusRequest_MessagesItemStatesItemAssetsUsedItem *)self serializeStringIntoDictionary:v3 withKey:@"ServerHash" withValue:self->_serverHash isRequired:1 defaultValue:0];
  id v4 = [v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STStatusRequest_MessagesItemStatesItemAssetsUsedItem;
  id v4 = [(STStatusRequest_MessagesItemStatesItemAssetsUsedItem *)&v10 copyWithZone:a3];
  id v5 = [(NSString *)self->_assetIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSString *)self->_serverHash copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)serverHash
{
  return self->_serverHash;
}

- (void)setServerHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHash, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end