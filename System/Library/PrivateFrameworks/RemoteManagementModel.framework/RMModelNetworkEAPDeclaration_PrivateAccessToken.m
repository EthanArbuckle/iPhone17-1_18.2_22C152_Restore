@interface RMModelNetworkEAPDeclaration_PrivateAccessToken
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithIssuerName:(id)a3 tokenKey:(id)a4;
+ (id)buildWithType:(id)a3 issuerName:(id)a4 redemptionContext:(id)a5 tokenKey:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSData)payloadRedemptionContext;
- (NSNumber)payloadType;
- (NSString)payloadIssuerName;
- (NSString)payloadTokenKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadIssuerName:(id)a3;
- (void)setPayloadRedemptionContext:(id)a3;
- (void)setPayloadTokenKey:(id)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation RMModelNetworkEAPDeclaration_PrivateAccessToken

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"IssuerName";
  v6[2] = @"RedemptionContext";
  v6[3] = @"TokenKey";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 issuerName:(id)a4 redemptionContext:(id)a5 tokenKey:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = v13;
  if (v12) {
    v15 = v12;
  }
  else {
    v15 = &unk_2708C2280;
  }
  [v13 setPayloadType:v15];

  [v14 setPayloadIssuerName:v11];
  [v14 setPayloadRedemptionContext:v10];

  [v14 setPayloadTokenKey:v9];
  return v14;
}

+ (id)buildRequiredOnlyWithIssuerName:(id)a3 tokenKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadIssuerName:v6];

  [v7 setPayloadTokenKey:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelNetworkEAPDeclaration_PrivateAccessToken allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Type" forKeyPath:@"payloadType" isRequired:0 defaultValue:&unk_2708C2280 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"IssuerName" forKeyPath:@"payloadIssuerName" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"RedemptionContext" forKeyPath:@"payloadRedemptionContext" isRequired:0 defaultValue:0 serializationType:v6 error:a5])
      {
        BOOL v14 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"TokenKey" forKeyPath:@"payloadTokenKey" isRequired:1 defaultValue:0 error:a5];
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelNetworkEAPDeclaration_PrivateAccessToken *)self payloadType];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Type" value:v6 isRequired:0 defaultValue:&unk_2708C2280];

  v7 = [(RMModelNetworkEAPDeclaration_PrivateAccessToken *)self payloadIssuerName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"IssuerName" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelNetworkEAPDeclaration_PrivateAccessToken *)self payloadRedemptionContext];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"RedemptionContext" value:v8 isRequired:0 defaultValue:0 serializationType:v3];

  id v9 = [(RMModelNetworkEAPDeclaration_PrivateAccessToken *)self payloadTokenKey];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"TokenKey" value:v9 isRequired:1 defaultValue:0];

  id v10 = (void *)[v5 copy];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelNetworkEAPDeclaration_PrivateAccessToken;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadType copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadIssuerName copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSData *)self->_payloadRedemptionContext copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadTokenKey copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSString)payloadIssuerName
{
  return self->_payloadIssuerName;
}

- (void)setPayloadIssuerName:(id)a3
{
}

- (NSData)payloadRedemptionContext
{
  return self->_payloadRedemptionContext;
}

- (void)setPayloadRedemptionContext:(id)a3
{
}

- (NSString)payloadTokenKey
{
  return self->_payloadTokenKey;
}

- (void)setPayloadTokenKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTokenKey, 0);
  objc_storeStrong((id *)&self->_payloadRedemptionContext, 0);
  objc_storeStrong((id *)&self->_payloadIssuerName, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end