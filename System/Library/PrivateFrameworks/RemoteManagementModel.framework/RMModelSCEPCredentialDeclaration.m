@interface RMModelSCEPCredentialDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithURL:(id)a3;
+ (id)buildWithURL:(id)a3 name:(id)a4 subject:(id)a5 challenge:(id)a6 keysize:(id)a7 keyType:(id)a8 keyUsage:(id)a9 caFingerprint:(id)a10 retries:(id)a11 retryDelay:(id)a12 subjectAltName:(id)a13;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadSubject;
- (NSData)payloadCAFingerprint;
- (NSNumber)payloadKeyUsage;
- (NSNumber)payloadKeysize;
- (NSNumber)payloadRetries;
- (NSNumber)payloadRetryDelay;
- (NSString)payloadChallenge;
- (NSString)payloadKeyType;
- (NSString)payloadName;
- (NSString)payloadURL;
- (RMModelSCEPCredentialDeclaration_SubjectAltName)payloadSubjectAltName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadCAFingerprint:(id)a3;
- (void)setPayloadChallenge:(id)a3;
- (void)setPayloadKeyType:(id)a3;
- (void)setPayloadKeyUsage:(id)a3;
- (void)setPayloadKeysize:(id)a3;
- (void)setPayloadName:(id)a3;
- (void)setPayloadRetries:(id)a3;
- (void)setPayloadRetryDelay:(id)a3;
- (void)setPayloadSubject:(id)a3;
- (void)setPayloadSubjectAltName:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation RMModelSCEPCredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"URL";
  v6[1] = @"Name";
  v6[2] = @"Subject";
  v6[3] = @"Challenge";
  v6[4] = @"Keysize";
  v6[5] = @"Key Type";
  v6[6] = @"Key Usage";
  v6[7] = @"CAFingerprint";
  v6[8] = @"Retries";
  v6[9] = @"RetryDelay";
  v6[10] = @"SubjectAltName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 name:(id)a4 subject:(id)a5 challenge:(id)a6 keysize:(id)a7 keyType:(id)a8 keyUsage:(id)a9 caFingerprint:(id)a10 retries:(id)a11 retryDelay:(id)a12 subjectAltName:(id)a13
{
  id v36 = a13;
  id v35 = a12;
  id v18 = a11;
  id v34 = a10;
  id v19 = a9;
  v20 = (__CFString *)a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  [v26 setPayloadURL:v25];

  [v26 setPayloadName:v24];
  [v26 setPayloadSubject:v23];

  [v26 setPayloadChallenge:v22];
  if (v21) {
    v27 = v21;
  }
  else {
    v27 = &unk_2708C2418;
  }
  objc_msgSend(v26, "setPayloadKeysize:", v27, a3);

  if (v20) {
    v28 = v20;
  }
  else {
    v28 = @"RSA";
  }
  [v26 setPayloadKeyType:v28];

  if (v19) {
    v29 = v19;
  }
  else {
    v29 = &unk_2708C2430;
  }
  [v26 setPayloadKeyUsage:v29];

  [v26 setPayloadCAFingerprint:v34];
  if (v18) {
    v30 = v18;
  }
  else {
    v30 = &unk_2708C2448;
  }
  [v26 setPayloadRetries:v30];

  if (v35) {
    v31 = v35;
  }
  else {
    v31 = &unk_2708C2460;
  }
  [v26 setPayloadRetryDelay:v31];

  [v26 setPayloadSubjectAltName:v36];
  return v26;
}

+ (id)buildRequiredOnlyWithURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadURL:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelSCEPCredentialDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"URL" forKeyPath:@"payloadURL" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Name" forKeyPath:@"payloadName" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Subject" forKeyPath:@"payloadSubject" validator:&__block_literal_global_15 isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Challenge" forKeyPath:@"payloadChallenge" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Keysize" forKeyPath:@"payloadKeysize" isRequired:0 defaultValue:&unk_2708C2418 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Key Type" forKeyPath:@"payloadKeyType" isRequired:0 defaultValue:@"RSA" error:a5])
            {
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Key Usage" forKeyPath:@"payloadKeyUsage" isRequired:0 defaultValue:&unk_2708C2430 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"CAFingerprint" forKeyPath:@"payloadCAFingerprint" isRequired:0 defaultValue:0 serializationType:v6 error:a5])
                {
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Retries" forKeyPath:@"payloadRetries" isRequired:0 defaultValue:&unk_2708C2448 error:a5])
                  {
                    BOOL v14 = 0;
                    if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"RetryDelay" forKeyPath:@"payloadRetryDelay" isRequired:0 defaultValue:&unk_2708C2460 error:a5])
                    {
                      LOWORD(v16) = v6;
                      BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SubjectAltName" forKeyPath:@"payloadSubjectAltName" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __79__RMModelSCEPCredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = a2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:
          uint64_t v13 = 0;
          goto LABEL_21;
        }
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v15;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      uint64_t v13 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }
LABEL_21:

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(RMModelSCEPCredentialDeclaration *)self payloadURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"URL" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelSCEPCredentialDeclaration *)self payloadName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Name" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelSCEPCredentialDeclaration *)self payloadSubject];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Subject" value:v8 itemSerializer:&__block_literal_global_83 isRequired:0 defaultValue:0];

  uint64_t v9 = [(RMModelSCEPCredentialDeclaration *)self payloadChallenge];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Challenge" value:v9 isRequired:0 defaultValue:0];

  uint64_t v10 = [(RMModelSCEPCredentialDeclaration *)self payloadKeysize];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Keysize" value:v10 isRequired:0 defaultValue:&unk_2708C2418];

  uint64_t v11 = [(RMModelSCEPCredentialDeclaration *)self payloadKeyType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Key Type" value:v11 isRequired:0 defaultValue:@"RSA"];

  v12 = [(RMModelSCEPCredentialDeclaration *)self payloadKeyUsage];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Key Usage" value:v12 isRequired:0 defaultValue:&unk_2708C2430];

  uint64_t v13 = [(RMModelSCEPCredentialDeclaration *)self payloadCAFingerprint];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"CAFingerprint" value:v13 isRequired:0 defaultValue:0 serializationType:v3];

  BOOL v14 = [(RMModelSCEPCredentialDeclaration *)self payloadRetries];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Retries" value:v14 isRequired:0 defaultValue:&unk_2708C2448];

  uint64_t v15 = [(RMModelSCEPCredentialDeclaration *)self payloadRetryDelay];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"RetryDelay" value:v15 isRequired:0 defaultValue:&unk_2708C2460];

  long long v16 = [(RMModelSCEPCredentialDeclaration *)self payloadSubjectAltName];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke_2;
  v19[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  __int16 v20 = v3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SubjectAltName" value:v16 dictSerializer:v19 isRequired:0 defaultValue:0];

  long long v17 = (void *)[v5 copy];
  return v17;
}

id __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];
  return v2;
}

uint64_t __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)RMModelSCEPCredentialDeclaration;
  uint64_t v4 = [(RMModelPayloadBase *)&v28 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadURL copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadName copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadSubject copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadChallenge copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadKeysize copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadKeyType copy];
  long long v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadKeyUsage copy];
  long long v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSData *)self->_payloadCAFingerprint copy];
  __int16 v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadRetries copy];
  long long v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadRetryDelay copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(RMModelSCEPCredentialDeclaration_SubjectAltName *)self->_payloadSubjectAltName copy];
  uint64_t v26 = (void *)v4[12];
  v4[12] = v25;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
}

- (NSString)payloadChallenge
{
  return self->_payloadChallenge;
}

- (void)setPayloadChallenge:(id)a3
{
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
}

- (NSNumber)payloadKeyUsage
{
  return self->_payloadKeyUsage;
}

- (void)setPayloadKeyUsage:(id)a3
{
}

- (NSData)payloadCAFingerprint
{
  return self->_payloadCAFingerprint;
}

- (void)setPayloadCAFingerprint:(id)a3
{
}

- (NSNumber)payloadRetries
{
  return self->_payloadRetries;
}

- (void)setPayloadRetries:(id)a3
{
}

- (NSNumber)payloadRetryDelay
{
  return self->_payloadRetryDelay;
}

- (void)setPayloadRetryDelay:(id)a3
{
}

- (RMModelSCEPCredentialDeclaration_SubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadRetryDelay, 0);
  objc_storeStrong((id *)&self->_payloadRetries, 0);
  objc_storeStrong((id *)&self->_payloadCAFingerprint, 0);
  objc_storeStrong((id *)&self->_payloadKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadChallenge, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end