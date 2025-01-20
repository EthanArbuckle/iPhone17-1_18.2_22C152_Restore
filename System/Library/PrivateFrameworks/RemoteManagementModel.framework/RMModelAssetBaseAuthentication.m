@interface RMModelAssetBaseAuthentication
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithType:(id)a3;
+ (id)buildWithType:(id)a3;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation RMModelAssetBaseAuthentication

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a3;
  v9 = [v8 allKeys];
  v10 = [v7 setWithArray:v9];

  v11 = +[RMModelAssetBaseAuthentication allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  LOBYTE(a5) = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Type" forKeyPath:@"payloadType" isRequired:1 defaultValue:0 error:a5];
  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAssetBaseAuthentication *)self payloadType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Type" value:v5 isRequired:1 defaultValue:0];

  v6 = (void *)[v4 copy];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelAssetBaseAuthentication;
  v4 = [(RMModelPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end