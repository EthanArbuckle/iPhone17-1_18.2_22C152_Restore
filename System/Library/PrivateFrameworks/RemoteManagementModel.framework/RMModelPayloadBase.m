@interface RMModelPayloadBase
+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4;
+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5;
+ (BOOL)supportsSecureCoding;
+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
+ (id)loadData:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
+ (id)supportedOS;
- (BOOL)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 usingKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 payloadValue:(id *)a8 error:(id *)a9;
- (BOOL)getModelObjectFromDictionary:(id)a3 usingKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 payloadValue:(id *)a9 error:(id *)a10;
- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 nested:(BOOL)a7 isRequired:(BOOL)a8 defaultValue:(id)a9 serializationType:(signed __int16)a10 error:(id *)a11;
- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 validator:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9;
- (BOOL)loadBooleanFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (BOOL)loadDataFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9;
- (BOOL)loadDateFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9;
- (BOOL)loadDictionaryFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 serializationType:(signed __int16)a9 error:(id *)a10;
- (BOOL)loadFloatFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (BOOL)loadIntegerFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (BOOL)loadObjectsFromDictionary:(id)a3 forKeyPath:(id)a4 classType:(Class)a5 serializationType:(signed __int16)a6 error:(id *)a7;
- (BOOL)loadStringFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (NSSet)unknownPayloadKeys;
- (RMModelPayloadBase)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createNestedObjectWithClass:(Class)a3 serializationType:(signed __int16)a4 parentKey:(id)a5 payload:(id)a6 error:(id *)a7;
- (id)serializeAsDataWithType:(signed __int16)a3 error:(id *)a4;
- (id)serializeWithType:(signed __int16)a3;
- (void)_serializeItemIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)mergeUnknownKeysFrom:(id)a3 parentKey:(id)a4;
- (void)serializeArrayIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8;
- (void)serializeBooleanIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeDataIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8;
- (void)serializeDateIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8;
- (void)serializeDictionaryIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8;
- (void)serializeFloatIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeIntegerIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeObjectsIntoDictionary:(id)a3 value:(id)a4 classType:(Class)a5 serializationType:(signed __int16)a6;
- (void)serializeStringIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)setUnknownPayloadKeys:(id)a3;
@end

@implementation RMModelPayloadBase

- (void)mergeUnknownKeysFrom:(id)a3 parentKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 unknownPayloadKeys];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v21 = self;
    v10 = (void *)MEMORY[0x263EFF9C0];
    v11 = [v6 unknownPayloadKeys];
    v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = [v6 unknownPayloadKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [NSString stringWithFormat:@"%@.%@", v7, *(void *)(*((void *)&v22 + 1) + 8 * v17)];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    v19 = [(RMModelPayloadBase *)v21 unknownPayloadKeys];
    v20 = [v19 setByAddingObjectsFromSet:v12];
    [(RMModelPayloadBase *)v21 setUnknownPayloadKeys:v20];
  }
}

- (id)createNestedObjectWithClass:(Class)a3 serializationType:(signed __int16)a4 parentKey:(id)a5 payload:(id)a6 error:(id *)a7
{
  uint64_t v9 = a4;
  v26[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [(objc_class *)a3 load:v13 serializationType:v9 error:a7];
    if (v14)
    {
      [(RMModelPayloadBase *)self mergeUnknownKeysFrom:v14 parentKey:v12];
      id v14 = v14;
      a7 = (id *)v14;
    }
    else
    {
      if (a7)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Wrong nested item in key: %@", v12, *MEMORY[0x263F08320]];
        long long v24 = v17;
        v18 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        v19 = (void *)[v18 mutableCopy];

        [v19 setObject:*a7 forKeyedSubscript:*MEMORY[0x263F08608]];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = (void *)[v19 copy];
        *a7 = [v20 errorWithDomain:@"error" code:1 userInfo:v21];
      }
      a7 = 0;
    }
  }
  else
  {
    if (!a7) {
      goto LABEL_10;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    id v14 = [NSString stringWithFormat:@"Invalid nested item in key: %@", v12];
    v26[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a7 = [v15 errorWithDomain:@"error" code:1 userInfo:v16];

    a7 = 0;
  }

LABEL_10:
  return a7;
}

+ (id)supportedOS
{
  return (id)MEMORY[0x263EFFA78];
}

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4
{
  id v6 = [(id)objc_opt_class() supportedOS];
  LOBYTE(a4) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 supportedOS:v6];

  return a4;
}

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5
{
  v8 = [(id)objc_opt_class() supportedOS];
  LOBYTE(a5) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 enrollmentType:a5 supportedOS:v8];

  return a5;
}

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  LODWORD(a5) = [v8 loadFromDictionary:v7 serializationType:v6 error:a5];

  if (a5) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)loadData:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v6 == 1)
  {
    uint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:a5];
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:a5];
LABEL_5:
    v10 = (void *)v9;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      a5 = [a1 load:v10 serializationType:v6 error:a5];
    }
    else if (a5)
    {
      if (!*a5)
      {
        v11 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F08320];
        v18 = @"Root item is not a dictionary object";
        id v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        *a5 = [v11 errorWithDomain:@"error" code:1 userInfo:v12];
      }
      a5 = 0;
    }
    goto LABEL_15;
  }
  if (a5)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported serialization type: %d", v6);
    v20[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];

    a5 = 0;
  }
  v10 = 0;
LABEL_15:

  return a5;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)serializeAsDataWithType:(signed __int16)a3 error:(id *)a4
{
  v4 = a4;
  v14[1] = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    id v8 = (void *)MEMORY[0x263F08900];
    uint64_t v6 = -[RMModelPayloadBase serializeWithType:](self, "serializeWithType:");
    uint64_t v7 = [v8 dataWithJSONObject:v6 options:9 error:v4];
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x263F08AC0];
    uint64_t v6 = -[RMModelPayloadBase serializeWithType:](self, "serializeWithType:");
    uint64_t v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:v4];
LABEL_5:
    v4 = (id *)v7;

    goto LABEL_8;
  }
  if (a4)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported serialization type: %d", a3, *MEMORY[0x263F08320]);
    v14[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id *v4 = [v9 errorWithDomain:@"error" code:1 userInfo:v11];

    v4 = 0;
  }
LABEL_8:
  return v4;
}

- (BOOL)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 usingKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 payloadValue:(id *)a8 error:(id *)a9
{
  BOOL v11 = a6;
  v28[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a7;
  id v15 = [a4 objectForKey:v13];
  if (!v15)
  {
    if (v11)
    {
      if (a9)
      {
        v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        uint64_t v19 = [NSString stringWithFormat:@"Missing required key: %@", v13];
        v28[0] = v19;
        v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
        *a9 = [v18 errorWithDomain:@"error" code:1 userInfo:v20];
      }
      BOOL v17 = 0;
      *a8 = 0;
      goto LABEL_11;
    }
    id v15 = v14;
    if (!v15) {
      goto LABEL_3;
    }
  }
  if (objc_opt_isKindOfClass())
  {
LABEL_3:
    id v16 = v15;
    *a8 = v16;

    BOOL v17 = 1;
    goto LABEL_11;
  }
  if (a9)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    long long v22 = [NSString stringWithFormat:@"Wrong type, key: %@", v13, *MEMORY[0x263F08320]];
    v26 = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    *a9 = [v21 errorWithDomain:@"error" code:1 userInfo:v23];
  }
  *a8 = 0;

  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)loadStringFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v23 = 0;
  BOOL v18 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v17 usingKey:v16 isRequired:v10 defaultValue:v15 payloadValue:&v23 error:a8];

  id v19 = v23;
  v20 = v19;
  if (v18 && v19 != 0) {
    [(RMModelPayloadBase *)self setValue:v19 forKey:v14];
  }

  return v18;
}

- (BOOL)loadIntegerFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v24 = 0;
  BOOL v18 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v17 usingKey:v16 isRequired:v10 defaultValue:v15 payloadValue:&v24 error:a8];

  id v19 = v24;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    long long v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "integerValue"));
    [(RMModelPayloadBase *)self setValue:v22 forKey:v14];
  }
  return v18;
}

- (BOOL)loadFloatFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v25 = 0;
  BOOL v18 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v17 usingKey:v16 isRequired:v10 defaultValue:v15 payloadValue:&v25 error:a8];

  id v19 = v25;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    long long v22 = NSNumber;
    [v19 floatValue];
    id v23 = objc_msgSend(v22, "numberWithFloat:");
    [(RMModelPayloadBase *)self setValue:v23 forKey:v14];
  }
  return v18;
}

- (BOOL)loadBooleanFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v24 = 0;
  BOOL v18 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v17 usingKey:v16 isRequired:v10 defaultValue:v15 payloadValue:&v24 error:a8];

  id v19 = v24;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    long long v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "BOOLValue"));
    [(RMModelPayloadBase *)self setValue:v22 forKey:v14];
  }
  return v18;
}

- (BOOL)loadDateFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9
{
  int v9 = a8;
  BOOL v11 = a6;
  v41[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = v15;
  v20 = v19;
  v21 = v19;
  if (v9 == 1)
  {
    long long v22 = [v19 objectForKeyedSubscript:v16];
    v21 = v20;
    if (!v22)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = objc_msgSend(MEMORY[0x263F08790], "rmmodel_sharedRFC3339DateFormatter");
      id v24 = [v23 dateFromString:v22];

      if (v24)
      {
        id v36 = v16;
        v37 = v24;
        v21 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

        goto LABEL_6;
      }
      if (a9)
      {
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = *MEMORY[0x263F08320];
        v29 = [NSString stringWithFormat:@"Cannot decode date, key: %@", v16];
        v39 = v29;
        v30 = NSDictionary;
        v31 = &v39;
        v32 = &v38;
        goto LABEL_16;
      }
    }
    else if (a9)
    {
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      v29 = [NSString stringWithFormat:@"Wrong type, key: %@", v16];
      v41[0] = v29;
      v30 = NSDictionary;
      v31 = (void **)v41;
      v32 = &v40;
LABEL_16:
      v33 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      *a9 = [v28 errorWithDomain:@"error" code:1 userInfo:v33];
    }
    LOBYTE(v25) = 0;
    v21 = v20;
    goto LABEL_18;
  }
LABEL_7:
  id v35 = 0;
  BOOL v25 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v21 usingKey:v16 isRequired:v11 defaultValue:v18 payloadValue:&v35 error:a9];
  id v26 = v35;
  long long v22 = v26;
  if (v25 && v26 != 0) {
    [(RMModelPayloadBase *)self setValue:v26 forKey:v17];
  }
LABEL_18:

  return v25;
}

- (BOOL)loadDataFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9
{
  int v9 = a8;
  BOOL v11 = a6;
  v41[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = v15;
  v20 = v19;
  v21 = v19;
  if (v9 == 1)
  {
    long long v22 = [v19 objectForKeyedSubscript:v16];
    v21 = v20;
    if (!v22)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v22 options:0];
      if (v23)
      {
        id v24 = (void *)v23;
        id v36 = v16;
        uint64_t v37 = v23;
        v21 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

        goto LABEL_6;
      }
      if (a9)
      {
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = *MEMORY[0x263F08320];
        v29 = [NSString stringWithFormat:@"Cannot decode base64, key: %@", v16];
        v39 = v29;
        v30 = NSDictionary;
        v31 = &v39;
        v32 = &v38;
        goto LABEL_16;
      }
    }
    else if (a9)
    {
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      v29 = [NSString stringWithFormat:@"Wrong type, key: %@", v16];
      v41[0] = v29;
      v30 = NSDictionary;
      v31 = (void **)v41;
      v32 = &v40;
LABEL_16:
      v33 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      *a9 = [v28 errorWithDomain:@"error" code:1 userInfo:v33];
    }
    LOBYTE(v25) = 0;
    v21 = v20;
    goto LABEL_18;
  }
LABEL_7:
  id v35 = 0;
  BOOL v25 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v21 usingKey:v16 isRequired:v11 defaultValue:v18 payloadValue:&v35 error:a9];
  id v26 = v35;
  long long v22 = v26;
  if (v25 && v26 != 0) {
    [(RMModelPayloadBase *)self setValue:v26 forKey:v17];
  }
LABEL_18:

  return v25;
}

- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 validator:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = (uint64_t (**)(id, void, id *))a6;
  id v19 = a8;
  id v46 = 0;
  BOOL v20 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v15 usingKey:v16 isRequired:v10 defaultValue:v19 payloadValue:&v46 error:a9];
  id v21 = v46;
  long long v22 = v21;
  if (v20)
  {
    id v36 = self;
    id v38 = v21;
    id v40 = v17;
    id v39 = v16;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      id v26 = 0;
      uint64_t v27 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v23);
          }
          if (v18)
          {
            uint64_t v29 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            id v41 = v26;
            char v30 = v18[2](v18, v29, &v41);
            id v31 = v41;

            if ((v30 & 1) == 0)
            {
              id v16 = v39;
              id v17 = v40;
              long long v22 = v38;
              if (a9)
              {
                if (v31)
                {
                  *a9 = v31;
                }
                else
                {
                  uint64_t v37 = (void *)MEMORY[0x263F087E8];
                  uint64_t v47 = *MEMORY[0x263F08320];
                  v33 = [NSString stringWithFormat:@"Wrong array item type, key: %@", v39];
                  v48 = v33;
                  v34 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
                  *a9 = [v37 errorWithDomain:@"error" code:1 userInfo:v34];

                  id v17 = v40;
                }
              }

              BOOL v32 = 0;
              goto LABEL_24;
            }
            id v26 = v31;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v26 = 0;
    }

    if (v23)
    {
      id v17 = v40;
      [(RMModelPayloadBase *)v36 setValue:v23 forKey:v40];
      BOOL v32 = 1;
      id v31 = v26;
      id v16 = v39;
    }
    else
    {
      BOOL v32 = 1;
      id v31 = v26;
      id v16 = v39;
      id v17 = v40;
    }
    long long v22 = v38;
LABEL_24:
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 nested:(BOOL)a7 isRequired:(BOOL)a8 defaultValue:(id)a9 serializationType:(signed __int16)a10 error:(id *)a11
{
  uint64_t v19 = a8;
  BOOL v45 = a7;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  id v55 = 0;
  id v46 = v16;
  LODWORD(v19) = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v15 usingKey:v16 isRequired:v19 defaultValue:v18 payloadValue:&v55 error:a11];
  id v20 = v55;
  id v21 = v20;
  if (v19)
  {
    long long v44 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v21;
    uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v39)
    {
      uint64_t v22 = a10;
      uint64_t v40 = *(void *)v52;
      id v37 = v17;
      id v38 = v15;
      id v35 = v21;
      id v36 = v18;
      while (2)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v52 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v51 + 1) + 8 * v23);
          uint64_t v41 = v23;
          if (v45)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a11)
              {
                v34 = (void *)MEMORY[0x263F087E8];
                uint64_t v57 = *MEMORY[0x263F08320];
                uint64_t v19 = [NSString stringWithFormat:@"Wrong array item type, key: %@", v46];
                uint64_t v58 = v19;
                id v25 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                *a11 = [v34 errorWithDomain:@"error" code:1 userInfo:v25];
LABEL_25:
              }
              LOBYTE(v19) = 0;
LABEL_27:

              goto LABEL_28;
            }
            uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v24, "count"));
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v25 = v24;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v56 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v48;
              while (2)
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v48 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = [(RMModelPayloadBase *)self createNestedObjectWithClass:a6 serializationType:v22 parentKey:v46 payload:*(void *)(*((void *)&v47 + 1) + 8 * i) error:a11];
                  if (!v30)
                  {
                    id v17 = v37;
                    id v15 = v38;
                    id v21 = v35;
                    id v18 = v36;
                    goto LABEL_25;
                  }
                  id v31 = (void *)v30;
                  [(id)v19 addObject:v30];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v56 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
            }

            BOOL v32 = (void *)[(id)v19 copy];
            [v44 addObject:v32];

            id v17 = v37;
            id v15 = v38;
            id v21 = v35;
            id v18 = v36;
          }
          else
          {
            uint64_t v19 = [(RMModelPayloadBase *)self createNestedObjectWithClass:a6 serializationType:v22 parentKey:v46 payload:v24 error:a11];
            if (!v19) {
              goto LABEL_27;
            }
            [v44 addObject:v19];
          }

          uint64_t v23 = v41 + 1;
        }
        while (v41 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    if (obj)
    {
      id obja = (id)[v44 copy];
      -[RMModelPayloadBase setValue:forKey:](self, "setValue:forKey:");
      LOBYTE(v19) = 1;
    }
    else
    {
      LOBYTE(v19) = 1;
    }
LABEL_28:
  }
  return v19;
}

- (BOOL)loadDictionaryFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 serializationType:(signed __int16)a9 error:(id *)a10
{
  BOOL v11 = a7;
  id v16 = a5;
  id v22 = 0;
  BOOL v17 = [(RMModelPayloadBase *)self getModelObjectFromDictionary:a3 usingKey:a4 classType:a6 isRequired:v11 defaultValue:a8 serializationType:a9 payloadValue:&v22 error:a10];
  id v18 = v22;
  uint64_t v19 = v18;
  if (v17 && v18 != 0) {
    [(RMModelPayloadBase *)self setValue:v18 forKey:v16];
  }

  return v17;
}

- (BOOL)loadObjectsFromDictionary:(id)a3 forKeyPath:(id)a4 classType:(Class)a5 serializationType:(signed __int16)a6 error:(id *)a7
{
  unsigned int v25 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v24 = a4;
  BOOL v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ((Class)objc_opt_class() == a5
          || (Class)objc_opt_class() == a5
          || (Class)objc_opt_class() == a5
          || (Class)objc_opt_class() == a5)
        {
          id v28 = 0;
          BOOL v20 = [(RMModelPayloadBase *)self _loadObjectOfClass:a5 fromDictionary:v12 usingKey:v17 isRequired:1 defaultValue:0 payloadValue:&v28 error:a7];
          id v19 = v28;
          if (!v20)
          {
LABEL_16:

            BOOL v22 = 0;
            id v21 = v24;
            goto LABEL_17;
          }
        }
        else
        {
          id v27 = 0;
          BOOL v18 = [(RMModelPayloadBase *)self getModelObjectFromDictionary:v12 usingKey:v17 classType:a5 isRequired:1 defaultValue:0 serializationType:v25 payloadValue:&v27 error:a7];
          id v19 = v27;
          if (!v18) {
            goto LABEL_16;
          }
        }
        [v11 setObject:v19 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v21 = v24;
  [(RMModelPayloadBase *)self setValue:v11 forKey:v24];
  BOOL v22 = 1;
LABEL_17:

  return v22;
}

- (BOOL)getModelObjectFromDictionary:(id)a3 usingKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 payloadValue:(id *)a9 error:(id *)a10
{
  uint64_t v10 = a8;
  BOOL v12 = a6;
  id v16 = a4;
  id v17 = a7;
  id v18 = a3;
  id v27 = 0;
  BOOL v19 = [(RMModelPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v18 usingKey:v16 isRequired:v12 defaultValue:v17 payloadValue:&v27 error:a10];

  id v20 = v27;
  id v21 = v20;
  if (v19)
  {
    if (v20)
    {
      BOOL v22 = [(RMModelPayloadBase *)self createNestedObjectWithClass:a5 serializationType:v10 parentKey:v16 payload:v20 error:a10];
      uint64_t v23 = v22;
      BOOL v24 = v22 != 0;
      if (v22) {
        id v25 = v22;
      }
      *a9 = v23;
    }
    else
    {
      *a9 = 0;
      BOOL v24 = !v12;
    }
  }
  else
  {
    BOOL v24 = 0;
    *a9 = 0;
  }

  return v24;
}

- (void)_serializeItemIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7
{
  BOOL v7 = !a7;
  if (!a5) {
    BOOL v7 = 0;
  }
  if (v7 || a6) {
    [a3 setObject:a5 forKeyedSubscript:a4];
  }
}

- (void)serializeStringIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v14, v13, v12, v8, [v12 isEqual:a7]);
}

- (void)serializeIntegerIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v16, v12, v15, v8, [v13 isEqual:v14]);
}

- (void)serializeFloatIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    uint64_t v15 = NSNumber;
    [v13 floatValue];
    id v16 = objc_msgSend(v15, "numberWithFloat:");
  }
  else
  {
    id v16 = 0;
  }
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v17, v12, v16, v8, [v13 isEqual:v14]);
}

- (void)serializeBooleanIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v16, v12, v15, v8, [v13 isEqual:v14]);
}

- (void)serializeDateIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8
{
  int v8 = a8;
  BOOL v10 = a6;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = v15;
  id v18 = v17;
  BOOL v19 = v17;
  if (v17)
  {
    BOOL v19 = v17;
    if (v8 == 1)
    {
      id v20 = objc_msgSend(MEMORY[0x263F08790], "rmmodel_sharedRFC3339DateFormatter");
      BOOL v19 = [v20 stringFromDate:v18];
    }
  }
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v21, v14, v19, v10, [v18 isEqual:v16]);
}

- (void)serializeDataIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8
{
  int v8 = a8;
  BOOL v10 = a6;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = v15;
  id v18 = v17;
  BOOL v19 = v17;
  if (v17)
  {
    BOOL v19 = v17;
    if (v8 == 1)
    {
      BOOL v19 = [v17 base64EncodedStringWithOptions:0];
    }
  }
  -[RMModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v20, v14, v19, v10, [v18 isEqual:v16]);
}

- (void)serializeArrayIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, void))a6;
  id v17 = a8;
  id v18 = v17;
  if (v15)
  {
    id v27 = v17;
    BOOL v28 = a7;
    id v29 = v13;
    BOOL v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = v16[2](v16, *(void *)(*((void *)&v30 + 1) + 8 * v24));
          [v19 addObject:v25];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    id v13 = v29;
    id v18 = v27;
    if (v28) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v19 = 0;
    if (a7)
    {
LABEL_13:
      uint64_t v26 = (void *)[v19 copy];
      [v13 setObject:v26 forKeyedSubscript:v14];

      goto LABEL_14;
    }
  }
  if (v19) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)serializeDictionaryIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, id))a6;
  id v16 = a8;
  if (v14)
  {
    id v17 = v15[2](v15, v14);
    if (a7) {
      goto LABEL_6;
    }
LABEL_5:
    if (!v17) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v17 = 0;
  if (!a7) {
    goto LABEL_5;
  }
LABEL_6:
  [v18 setObject:v17 forKeyedSubscript:v13];
LABEL_7:
}

- (void)serializeObjectsIntoDictionary:(id)a3 value:(id)a4 classType:(Class)a5 serializationType:(signed __int16)a6
{
  unsigned int v24 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    unint64_t v14 = 0x263F08000uLL;
    do
    {
      uint64_t v15 = 0;
      uint64_t v23 = v12;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
        if ((Class)objc_opt_class() == a5 || (Class)objc_opt_class() == a5)
        {
          uint64_t v21 = objc_msgSend(v10, "objectForKeyedSubscript:", v16, v23);
          [(RMModelPayloadBase *)self _serializeItemIntoDictionary:v9 usingKey:v16 value:v21 isRequired:1 isDefaultValue:0];
        }
        else if ((Class)objc_opt_class() == a5)
        {
          uint64_t v21 = [v10 objectForKeyedSubscript:v16];
          [(RMModelPayloadBase *)self serializeDateIntoDictionary:v9 usingKey:v16 value:v21 isRequired:1 defaultValue:0 serializationType:v24];
        }
        else
        {
          uint64_t v17 = v13;
          unint64_t v18 = v14;
          BOOL v19 = (objc_class *)objc_opt_class();
          id v20 = [v10 objectForKeyedSubscript:v16];
          uint64_t v21 = v20;
          if (v19 == a5)
          {
            [(RMModelPayloadBase *)self serializeDataIntoDictionary:v9 usingKey:v16 value:v20 isRequired:1 defaultValue:0 serializationType:v24];
          }
          else
          {
            uint64_t v22 = [v20 serializeWithType:v24];
            [v9 setObject:v22 forKeyedSubscript:v16];
          }
          unint64_t v14 = v18;
          uint64_t v13 = v17;
          uint64_t v12 = v23;
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMModelPayloadBase *)self serializeWithType:0];
  [v4 encodeObject:v5 forKey:@"payload"];
}

- (RMModelPayloadBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RMModelPayloadBase;
  id v5 = [(RMModelPayloadBase *)&v22 init];
  if (!v5) {
    goto LABEL_3;
  }
  id v20 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  unint64_t v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"payload"];
  uint64_t v21 = 0;
  LODWORD(v13) = [(RMModelPayloadBase *)v5 loadFromDictionary:v15 serializationType:0 error:&v21];

  uint64_t v16 = 0;
  if (v13) {
LABEL_3:
  }
    uint64_t v16 = v5;

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (NSSet)unknownPayloadKeys
{
  return self->_unknownPayloadKeys;
}

- (void)setUnknownPayloadKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end