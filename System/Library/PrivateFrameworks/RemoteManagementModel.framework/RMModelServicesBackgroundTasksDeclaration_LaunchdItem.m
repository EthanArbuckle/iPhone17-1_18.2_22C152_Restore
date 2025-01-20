@interface RMModelServicesBackgroundTasksDeclaration_LaunchdItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithFileAssetReference:(id)a3 context:(id)a4;
+ (id)buildWithFileAssetReference:(id)a3 context:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadContext;
- (NSString)payloadFileAssetReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadContext:(id)a3;
- (void)setPayloadFileAssetReference:(id)a3;
@end

@implementation RMModelServicesBackgroundTasksDeclaration_LaunchdItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"FileAssetReference";
  v6[1] = @"Context";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithFileAssetReference:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadFileAssetReference:v6];

  [v7 setPayloadContext:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithFileAssetReference:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadFileAssetReference:v6];

  [v7 setPayloadContext:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelServicesBackgroundTasksDeclaration_LaunchdItem allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"FileAssetReference" forKeyPath:@"payloadFileAssetReference" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Context" forKeyPath:@"payloadContext" isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelServicesBackgroundTasksDeclaration_LaunchdItem *)self payloadFileAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"FileAssetReference" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelServicesBackgroundTasksDeclaration_LaunchdItem *)self payloadContext];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Context" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelServicesBackgroundTasksDeclaration_LaunchdItem;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadFileAssetReference copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadContext copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadFileAssetReference
{
  return self->_payloadFileAssetReference;
}

- (void)setPayloadFileAssetReference:(id)a3
{
}

- (NSString)payloadContext
{
  return self->_payloadContext;
}

- (void)setPayloadContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadContext, 0);
  objc_storeStrong((id *)&self->_payloadFileAssetReference, 0);
}

@end