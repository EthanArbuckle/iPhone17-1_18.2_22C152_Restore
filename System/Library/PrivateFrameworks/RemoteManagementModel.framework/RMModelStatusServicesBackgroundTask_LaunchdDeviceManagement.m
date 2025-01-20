@interface RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5;
+ (id)buildWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)statusAssetIdentifier;
- (NSString)statusAssetServerToken;
- (NSString)statusConfigurationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusAssetIdentifier:(id)a3;
- (void)setStatusAssetServerToken:(id)a3;
- (void)setStatusConfigurationIdentifier:(id)a3;
@end

@implementation RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"configuration-identifier";
  v6[1] = @"asset-identifier";
  v6[2] = @"asset-server-token";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusConfigurationIdentifier:v9];

  [v10 setStatusAssetIdentifier:v8];
  [v10 setStatusAssetServerToken:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusConfigurationIdentifier:v9];

  [v10 setStatusAssetIdentifier:v8];
  [v10 setStatusAssetServerToken:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, @"configuration-identifier", @"statusConfigurationIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, @"asset-identifier", @"statusAssetIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
          "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
          v7,
          @"asset-server-token",
          @"statusAssetServerToken",
          1,
          0,
          a5);

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement *)self statusConfigurationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"configuration-identifier" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement *)self statusAssetIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"asset-identifier" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement *)self statusAssetServerToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"asset-server-token" value:v7 isRequired:1 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusConfigurationIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusAssetIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusAssetServerToken copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusConfigurationIdentifier
{
  return self->_statusConfigurationIdentifier;
}

- (void)setStatusConfigurationIdentifier:(id)a3
{
}

- (NSString)statusAssetIdentifier
{
  return self->_statusAssetIdentifier;
}

- (void)setStatusAssetIdentifier:(id)a3
{
}

- (NSString)statusAssetServerToken
{
  return self->_statusAssetServerToken;
}

- (void)setStatusAssetServerToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAssetServerToken, 0);
  objc_storeStrong((id *)&self->_statusAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_statusConfigurationIdentifier, 0);
}

@end