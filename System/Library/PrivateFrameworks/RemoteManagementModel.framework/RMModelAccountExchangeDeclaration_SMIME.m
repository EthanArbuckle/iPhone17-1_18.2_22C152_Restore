@interface RMModelAccountExchangeDeclaration_SMIME
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithSigning:(id)a3 encryption:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (RMModelAccountExchangeDeclaration_SMIMEEncryption)payloadEncryption;
- (RMModelAccountExchangeDeclaration_SMIMESigning)payloadSigning;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadEncryption:(id)a3;
- (void)setPayloadSigning:(id)a3;
@end

@implementation RMModelAccountExchangeDeclaration_SMIME

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Signing";
  v6[1] = @"Encryption";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithSigning:(id)a3 encryption:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadSigning:v6];

  [v7 setPayloadEncryption:v5];
  return v7;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAccountExchangeDeclaration_SMIME allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v16) = a4;
  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Signing" forKeyPath:@"payloadSigning" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
  {
    LOWORD(v17) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Encryption" forKeyPath:@"payloadEncryption" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5];
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelAccountExchangeDeclaration_SMIME *)self payloadSigning];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Signing" value:v6 dictSerializer:v12 isRequired:0 defaultValue:0];

  v7 = [(RMModelAccountExchangeDeclaration_SMIME *)self payloadEncryption];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke_2;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Encryption" value:v7 dictSerializer:v10 isRequired:0 defaultValue:0];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelAccountExchangeDeclaration_SMIME;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RMModelAccountExchangeDeclaration_SMIMESigning *)self->_payloadSigning copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(RMModelAccountExchangeDeclaration_SMIMEEncryption *)self->_payloadEncryption copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (RMModelAccountExchangeDeclaration_SMIMESigning)payloadSigning
{
  return self->_payloadSigning;
}

- (void)setPayloadSigning:(id)a3
{
}

- (RMModelAccountExchangeDeclaration_SMIMEEncryption)payloadEncryption
{
  return self->_payloadEncryption;
}

- (void)setPayloadEncryption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEncryption, 0);
  objc_storeStrong((id *)&self->_payloadSigning, 0);
}

@end