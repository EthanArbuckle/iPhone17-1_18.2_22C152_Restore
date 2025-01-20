@interface RMModelACMECredentialDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8;
+ (id)buildWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(id)a10 extendedKeyUsage:(id)a11 attest:(id)a12;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadExtendedKeyUsage;
- (NSArray)payloadSubject;
- (NSNumber)payloadAttest;
- (NSNumber)payloadHardwareBound;
- (NSNumber)payloadKeySize;
- (NSNumber)payloadUsageFlags;
- (NSString)payloadClientIdentifier;
- (NSString)payloadDirectoryURL;
- (NSString)payloadKeyType;
- (RMModelACMECredentialDeclaration_SubjectAltName)payloadSubjectAltName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAttest:(id)a3;
- (void)setPayloadClientIdentifier:(id)a3;
- (void)setPayloadDirectoryURL:(id)a3;
- (void)setPayloadExtendedKeyUsage:(id)a3;
- (void)setPayloadHardwareBound:(id)a3;
- (void)setPayloadKeySize:(id)a3;
- (void)setPayloadKeyType:(id)a3;
- (void)setPayloadSubject:(id)a3;
- (void)setPayloadSubjectAltName:(id)a3;
- (void)setPayloadUsageFlags:(id)a3;
@end

@implementation RMModelACMECredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DirectoryURL";
  v6[1] = @"ClientIdentifier";
  v6[2] = @"KeySize";
  v6[3] = @"KeyType";
  v6[4] = @"HardwareBound";
  v6[5] = @"Subject";
  v6[6] = @"SubjectAltName";
  v6[7] = @"UsageFlags";
  v6[8] = @"ExtendedKeyUsage";
  v6[9] = @"Attest";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(id)a10 extendedKeyUsage:(id)a11 attest:(id)a12
{
  id v30 = a12;
  id v18 = a11;
  id v29 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  [v26 setPayloadDirectoryURL:v25];

  [v26 setPayloadClientIdentifier:v24];
  [v26 setPayloadKeySize:v23];

  [v26 setPayloadKeyType:v22];
  [v26 setPayloadHardwareBound:v21];

  [v26 setPayloadSubject:v20];
  [v26 setPayloadSubjectAltName:v19];

  [v26 setPayloadUsageFlags:v29];
  [v26 setPayloadExtendedKeyUsage:v18];

  if (v30) {
    id v27 = v30;
  }
  else {
    id v27 = (id)MEMORY[0x263EFFA80];
  }
  objc_msgSend(v26, "setPayloadAttest:", v27, v29);

  return v26;
}

+ (id)buildRequiredOnlyWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_opt_new();
  [v19 setPayloadDirectoryURL:v18];

  [v19 setPayloadClientIdentifier:v17];
  [v19 setPayloadKeySize:v16];

  [v19 setPayloadKeyType:v15];
  [v19 setPayloadHardwareBound:v14];

  [v19 setPayloadSubject:v13];
  return v19;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelACMECredentialDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"DirectoryURL", @"payloadDirectoryURL", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"ClientIdentifier", @"payloadClientIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         @"KeySize",
         @"payloadKeySize",
         1,
         0,
         a5)
    && -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"KeyType", @"payloadKeyType", 1, 0, a5)&& -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"HardwareBound", @"payloadHardwareBound", 1, 0, a5)&& -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self,
         "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:",
         v8,
         @"Subject",
         @"payloadSubject",
         &__block_literal_global_6,
         1,
         0,
         a5))
  {
    LOWORD(v16) = a4;
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SubjectAltName" forKeyPath:@"payloadSubjectAltName" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"UsageFlags" forKeyPath:@"payloadUsageFlags" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"ExtendedKeyUsage" forKeyPath:@"payloadExtendedKeyUsage" validator:&__block_literal_global_69 isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v14 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"Attest" forKeyPath:@"payloadAttest" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
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

uint64_t __79__RMModelACMECredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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

uint64_t __79__RMModelACMECredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v5 = objc_opt_new();
  v6 = [(RMModelACMECredentialDeclaration *)self payloadDirectoryURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"DirectoryURL" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelACMECredentialDeclaration *)self payloadClientIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ClientIdentifier" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelACMECredentialDeclaration *)self payloadKeySize];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"KeySize" value:v8 isRequired:1 defaultValue:0];

  uint64_t v9 = [(RMModelACMECredentialDeclaration *)self payloadKeyType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"KeyType" value:v9 isRequired:1 defaultValue:0];

  uint64_t v10 = [(RMModelACMECredentialDeclaration *)self payloadHardwareBound];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"HardwareBound" value:v10 isRequired:1 defaultValue:0];

  uint64_t v11 = [(RMModelACMECredentialDeclaration *)self payloadSubject];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Subject" value:v11 itemSerializer:&__block_literal_global_76 isRequired:1 defaultValue:0];

  v12 = [(RMModelACMECredentialDeclaration *)self payloadSubjectAltName];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_2;
  v18[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SubjectAltName" value:v12 dictSerializer:v18 isRequired:0 defaultValue:0];

  uint64_t v13 = [(RMModelACMECredentialDeclaration *)self payloadUsageFlags];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"UsageFlags" value:v13 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelACMECredentialDeclaration *)self payloadExtendedKeyUsage];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"ExtendedKeyUsage" value:v14 itemSerializer:&__block_literal_global_80 isRequired:0 defaultValue:0];

  uint64_t v15 = [(RMModelACMECredentialDeclaration *)self payloadAttest];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"Attest" value:v15 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  long long v16 = (void *)[v5 copy];
  return v16;
}

id __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];
  return v2;
}

uint64_t __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

id __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RMModelACMECredentialDeclaration;
  uint64_t v4 = [(RMModelPayloadBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDirectoryURL copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadClientIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadKeySize copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadKeyType copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadHardwareBound copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadSubject copy];
  long long v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(RMModelACMECredentialDeclaration_SubjectAltName *)self->_payloadSubjectAltName copy];
  long long v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadUsageFlags copy];
  long long v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSArray *)self->_payloadExtendedKeyUsage copy];
  long long v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadAttest copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSString)payloadDirectoryURL
{
  return self->_payloadDirectoryURL;
}

- (void)setPayloadDirectoryURL:(id)a3
{
}

- (NSString)payloadClientIdentifier
{
  return self->_payloadClientIdentifier;
}

- (void)setPayloadClientIdentifier:(id)a3
{
}

- (NSNumber)payloadKeySize
{
  return self->_payloadKeySize;
}

- (void)setPayloadKeySize:(id)a3
{
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
}

- (NSNumber)payloadHardwareBound
{
  return self->_payloadHardwareBound;
}

- (void)setPayloadHardwareBound:(id)a3
{
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
}

- (RMModelACMECredentialDeclaration_SubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
}

- (NSNumber)payloadUsageFlags
{
  return self->_payloadUsageFlags;
}

- (void)setPayloadUsageFlags:(id)a3
{
}

- (NSArray)payloadExtendedKeyUsage
{
  return self->_payloadExtendedKeyUsage;
}

- (void)setPayloadExtendedKeyUsage:(id)a3
{
}

- (NSNumber)payloadAttest
{
  return self->_payloadAttest;
}

- (void)setPayloadAttest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAttest, 0);
  objc_storeStrong((id *)&self->_payloadExtendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadUsageFlags, 0);
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadHardwareBound, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeySize, 0);
  objc_storeStrong((id *)&self->_payloadClientIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDirectoryURL, 0);
}

@end