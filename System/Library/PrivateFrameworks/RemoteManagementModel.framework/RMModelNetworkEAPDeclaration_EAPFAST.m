@interface RMModelNetworkEAPDeclaration_EAPFAST
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithUsePrivateAccessToken:(id)a3 usePAC:(id)a4 provisionPAC:(id)a5 provisionPACAnonymously:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadProvisionPAC;
- (NSNumber)payloadProvisionPACAnonymously;
- (NSNumber)payloadUsePAC;
- (NSNumber)payloadUsePrivateAccessToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadProvisionPAC:(id)a3;
- (void)setPayloadProvisionPACAnonymously:(id)a3;
- (void)setPayloadUsePAC:(id)a3;
- (void)setPayloadUsePrivateAccessToken:(id)a3;
@end

@implementation RMModelNetworkEAPDeclaration_EAPFAST

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"UsePrivateAccessToken";
  v6[1] = @"UsePAC";
  v6[2] = @"ProvisionPAC";
  v6[3] = @"ProvisionPACAnonymously";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithUsePrivateAccessToken:(id)a3 usePAC:(id)a4 provisionPAC:(id)a5 provisionPACAnonymously:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = v13;
  v15 = (void *)MEMORY[0x263EFFA80];
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadUsePrivateAccessToken:v16];

  if (v11) {
    id v17 = v11;
  }
  else {
    id v17 = v15;
  }
  [v14 setPayloadUsePAC:v17];

  if (v10) {
    id v18 = v10;
  }
  else {
    id v18 = v15;
  }
  [v14 setPayloadProvisionPAC:v18];

  if (v9) {
    id v19 = v9;
  }
  else {
    id v19 = v15;
  }
  [v14 setPayloadProvisionPACAnonymously:v19];

  return v14;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelNetworkEAPDeclaration_EAPFAST allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"UsePrivateAccessToken" forKeyPath:@"payloadUsePrivateAccessToken" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"UsePAC" forKeyPath:@"payloadUsePAC" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"ProvisionPAC" forKeyPath:@"payloadProvisionPAC" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"ProvisionPACAnonymously" forKeyPath:@"payloadProvisionPACAnonymously" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkEAPDeclaration_EAPFAST *)self payloadUsePrivateAccessToken];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"UsePrivateAccessToken" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelNetworkEAPDeclaration_EAPFAST *)self payloadUsePAC];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"UsePAC" value:v7 isRequired:0 defaultValue:v6];

  v8 = [(RMModelNetworkEAPDeclaration_EAPFAST *)self payloadProvisionPAC];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"ProvisionPAC" value:v8 isRequired:0 defaultValue:v6];

  id v9 = [(RMModelNetworkEAPDeclaration_EAPFAST *)self payloadProvisionPACAnonymously];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"ProvisionPACAnonymously" value:v9 isRequired:0 defaultValue:v6];

  id v10 = (void *)[v4 copy];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelNetworkEAPDeclaration_EAPFAST;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadUsePrivateAccessToken copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadUsePAC copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadProvisionPAC copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadProvisionPACAnonymously copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadUsePrivateAccessToken
{
  return self->_payloadUsePrivateAccessToken;
}

- (void)setPayloadUsePrivateAccessToken:(id)a3
{
}

- (NSNumber)payloadUsePAC
{
  return self->_payloadUsePAC;
}

- (void)setPayloadUsePAC:(id)a3
{
}

- (NSNumber)payloadProvisionPAC
{
  return self->_payloadProvisionPAC;
}

- (void)setPayloadProvisionPAC:(id)a3
{
}

- (NSNumber)payloadProvisionPACAnonymously
{
  return self->_payloadProvisionPACAnonymously;
}

- (void)setPayloadProvisionPACAnonymously:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProvisionPACAnonymously, 0);
  objc_storeStrong((id *)&self->_payloadProvisionPAC, 0);
  objc_storeStrong((id *)&self->_payloadUsePAC, 0);
  objc_storeStrong((id *)&self->_payloadUsePrivateAccessToken, 0);
}

@end