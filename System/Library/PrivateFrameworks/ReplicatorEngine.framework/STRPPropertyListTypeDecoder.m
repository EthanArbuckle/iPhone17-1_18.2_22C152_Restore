@interface STRPPropertyListTypeDecoder
+ (id)_supportedCoreTypesForEncoding;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (STRPPropertyListTypeDecoder)initWithDictionary:(id)a3;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_decodeObjectOfClasses:(id)a3 fromObject:(id)a4;
- (id)_errorWithCode:(int64_t)a3 message:(id)a4;
- (id)_failWithCode:(int64_t)a3 message:(id)a4;
- (id)_numberForKey:(id)a3;
- (id)decodeArrayOfObjectsOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeDictionaryWithKeysOfClass:(Class)a3 objectsOfClass:(Class)a4 forKey:(id)a5;
- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeRootObjectOfClass:(Class)a3 fromEncoded:(id)a4 error:(id *)a5;
- (id)decodeTopLevelObjectForKey:(id)a3 error:(id *)a4;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
@end

@implementation STRPPropertyListTypeDecoder

- (STRPPropertyListTypeDecoder)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STRPPropertyListTypeDecoder;
  v5 = [(STRPPropertyListTypeDecoder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    storage = v5->_storage;
    v5->_storage = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)_supportedCoreTypesForEncoding
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)decodeRootObjectOfClass:(Class)a3 fromEncoded:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
LABEL_19:
      v11 = v10;
      goto LABEL_20;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (Class)objc_opt_class() == a3)
  {
    v15 = (void *)MEMORY[0x263EFF910];
    [v9 doubleValue];
    objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass()) {
    || (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
LABEL_18:
    id v10 = v9;
    goto LABEL_19;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
  {
    if (!a5) {
      goto LABEL_37;
    }
    v13 = [NSString stringWithFormat:@"Top level array representations are unsupported, a boxing type must be provided."];
    id v14 = [(STRPPropertyListTypeDecoder *)self _errorWithCode:1 message:v13];
LABEL_36:
    *a5 = v14;

    goto LABEL_37;
  }
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
  {
    if (!a5) {
      goto LABEL_37;
    }
    v13 = [NSString stringWithFormat:@"Top level dictionary representations are unsupported, a boxing type must be provided."];
    id v14 = [(STRPPropertyListTypeDecoder *)self _errorWithCode:1 message:v13];
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_storage, a4);
    id v10 = (id)[[a3 alloc] initWithCoder:self];
    goto LABEL_19;
  }
  if (a5)
  {
    v13 = [NSString stringWithFormat:@"Type must be a dictionary representation of a non-primitive type."];
    id v14 = [(STRPPropertyListTypeDecoder *)self _errorWithCode:1 message:v13];
    goto LABEL_36;
  }
LABEL_37:
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)containsValueForKey:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_storage objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_decodeObjectOfClasses:(id)a3 fromObject:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2050000000;
  uint64_t v81 = 0;
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke;
  v75[3] = &unk_265492AC8;
  id v7 = v6;
  id v76 = v7;
  v77 = &v78;
  [v5 enumerateObjectsUsingBlock:v75];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 containsObject:objc_opt_class()]
    && [v5 count] == 1)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF910];
    [v7 doubleValue];
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v27 = v9;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 containsObject:objc_opt_class()]
    && [v5 count] == 1)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
    goto LABEL_22;
  }
  uint64_t v10 = v79[3];
  if (!v10)
  {
    v28 = (void *)[v5 mutableCopy];
    v29 = [(id)objc_opt_class() _supportedCoreTypesForEncoding];
    [v28 minusSet:v29];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v28 count])
    {
      v30 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v7];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v31 = v28;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v72;
LABEL_27:
        uint64_t v34 = 0;
        while (1)
        {
          if (*(void *)v72 != v33) {
            objc_enumerationMutation(v31);
          }
          v27 = (void *)[objc_alloc(*(Class *)(*((void *)&v71 + 1) + 8 * v34)) initWithCoder:v30];
          if (v27) {
            goto LABEL_35;
          }
          if (v32 == ++v34)
          {
            uint64_t v32 = [v31 countByEnumeratingWithState:&v71 objects:v82 count:16];
            if (v32) {
              goto LABEL_27;
            }
            break;
          }
        }
      }
    }
    v35 = NSString;
    v36 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v36);
    id v31 = [v35 stringWithFormat:@"No matching class found from candidates: %@, but found: %@", v5, v30];
    id v37 = [(STRPPropertyListTypeDecoder *)self _failWithCode:1 message:v31];
    v27 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (v10 == objc_opt_class()
    || (uint64_t v11 = v79[3], v11 == objc_opt_class())
    || (uint64_t v12 = v79[3], v12 == objc_opt_class())
    || (uint64_t v13 = v79[3], v13 == objc_opt_class()))
  {
    id v9 = v7;
    goto LABEL_22;
  }
  uint64_t v14 = v79[3];
  if (v14 == objc_opt_class() || (uint64_t v15 = v79[3], v15 == objc_opt_class()))
  {
    id v39 = v7;
    uint64_t v40 = [v39 count];
    v41 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v40];
    v42 = (void *)[v5 mutableCopy];
    v43 = (void *)MEMORY[0x263EFFA08];
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    [v42 minusSet:v45];

    if ([v42 count] == 1)
    {
      id v46 = (id)[v42 anyObject];
      v47 = [(id)objc_opt_class() _supportedCoreTypesForEncoding];
      char v48 = [v47 containsObject:v46];

      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      char v70 = 0;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_2;
      v61[3] = &unk_265492AF0;
      char v66 = v48 ^ 1;
      v61[4] = self;
      id v62 = v42;
      v64 = &v67;
      id v65 = v46;
      id v49 = v41;
      id v63 = v49;
      [v39 enumerateObjectsUsingBlock:v61];
      if (*((unsigned char *)v68 + 24)) {
        v27 = 0;
      }
      else {
        v27 = (void *)[v49 copy];
      }

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Ambiguous types for NSArray: %@; we only support single value types in the array, but found more than 1 type.",
      v50 = v42);
      v27 = [(STRPPropertyListTypeDecoder *)self _failWithCode:0 message:v50];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v55 = v7;
      uint64_t v16 = [v55 count];
      v54 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v16];
      v17 = (void *)[v5 mutableCopy];
      v18 = (void *)MEMORY[0x263EFFA08];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
      [v17 minusSet:v22];

      v23 = (void *)MEMORY[0x263EFFA08];
      uint64_t v24 = objc_opt_class();
      v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
      if ([v17 count] && (unint64_t)objc_msgSend(v17, "count") < 3)
      {
        if ([v17 intersectsSet:v25])
        {
          uint64_t v67 = 0;
          v68 = &v67;
          uint64_t v69 = 0x2020000000;
          char v70 = 0;
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 3221225472;
          v57[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_38;
          v57[3] = &unk_265492B18;
          v60 = &v67;
          v57[4] = self;
          id v58 = v17;
          id v51 = v54;
          id v59 = v51;
          [v55 enumerateKeysAndObjectsUsingBlock:v57];
          if (*((unsigned char *)v68 + 24)) {
            v27 = 0;
          }
          else {
            v27 = (void *)[v51 copy];
          }

          _Block_object_dispose(&v67, 8);
        }
        else
        {
          v52 = STRPLogCoding();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
            -[STRPPropertyListTypeDecoder _decodeObjectOfClasses:fromObject:]((uint64_t)v17, v52);
          }

          objc_msgSend(NSString, "stringWithFormat:", @"Ambiguous key types for NSDictionary: %@; we only support NSString and NSNumber keys.",
          v53 = v17);
          v27 = [(STRPPropertyListTypeDecoder *)self _failWithCode:0 message:v53];
        }
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Ambiguous value types for NSDictionary: %@; we only support NSString and NSNumber keys and single object or array of object value types.",
        v26 = v17);
        v27 = [(STRPPropertyListTypeDecoder *)self _failWithCode:0 message:v26];
      }
    }
    else
    {
      v27 = 0;
    }
  }
LABEL_36:

  _Block_object_dispose(&v78, 8);
  return v27;
}

uint64_t __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

void __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  if (*(unsigned char *)(a1 + 72))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = NSString;
      uint64_t v12 = NSStringFromClass(*(Class *)(a1 + 64));
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = [v11 stringWithFormat:@"Type mismatch - expected NSDictionary representation of %@, but found: %@ instead.", v12, v14];
      id v16 = (id)[v10 _failWithCode:1 message:v15];

      *a4 = 1;
      goto LABEL_8;
    }
    id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v17];
    id v7 = [*(id *)(a1 + 40) anyObject];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "alloc"), "initWithCoder:", v6);
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v6 = [(id)objc_opt_class() _supportedCoreTypesForEncoding];
    uint64_t v8 = [v9 _decodeObjectOfClasses:v6 fromObject:v17];
  }

  if (v8)
  {
    [*(id *)(a1 + 48) addObject:v8];
  }
LABEL_8:
}

void __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_38(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v34 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      v18 = *(void **)(a1 + 32);
      uint64_t v19 = NSString;
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      objc_msgSend(v19, "stringWithFormat:", @"Type mismatch - expected NSDictionary with String or Number keys; found keys with representation %@ instead.",
      v22 = v21);
      id v23 = (id)[v18 _failWithCode:1 message:v22];

      *a4 = 1;
      goto LABEL_19;
    }
  }
  uint64_t v8 = objc_opt_class();
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 2) {
    [*(id *)(a1 + 40) removeObject:v8];
  }
  if (![*(id *)(a1 + 40) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [NSString stringWithFormat:@"Type mismatch - expected NSDictionary with homogenous key types."];
    id v17 = (id)[v15 _failWithCode:1 message:v16];

    *a4 = 1;
    goto LABEL_19;
  }
  id v9 = (objc_class *)(id)[*(id *)(a1 + 40) anyObject];
  uint64_t v10 = [(id)objc_opt_class() _supportedCoreTypesForEncoding];
  char v11 = [v10 containsObject:v9];

  if ((v11 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v7];
      v25 = [*(id *)(a1 + 40) anyObject];
      v26 = objc_msgSend((id)objc_msgSend(v25, "alloc"), "initWithCoder:", v24);

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      v27 = *(void **)(a1 + 32);
      v28 = NSString;
      v29 = NSStringFromClass(v9);
      v30 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v30);
      uint64_t v32 = [v28 stringWithFormat:@"Type mismatch - expected NSDictionary representation of %@, but found: %@ instead.", v29, v31];
      id v33 = (id)[v27 _failWithCode:1 message:v32];

      *a4 = 1;
      goto LABEL_19;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    goto LABEL_15;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v13 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
LABEL_15:
    uint64_t v14 = [*(id *)(a1 + 40) setByAddingObject:objc_opt_class()];
    goto LABEL_16;
  }
  uint64_t v14 = [(id)objc_opt_class() _supportedCoreTypesForEncoding];
LABEL_16:
  uint64_t v24 = (void *)v14;
  v26 = [v13 _decodeObjectOfClasses:v14 fromObject:v7];
LABEL_17:

  if (v26)
  {
    [*(id *)(a1 + 48) setObject:v26 forKeyedSubscript:v34];
  }
LABEL_19:
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  uint64_t v8 = [v6 setWithObject:a3];
  id v9 = [(STRPPropertyListTypeDecoder *)self decodeObjectOfClasses:v8 forKey:v7];

  return v9;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_storage objectForKey:a4];
  if (v7)
  {
    uint64_t v8 = [(STRPPropertyListTypeDecoder *)self _decodeObjectOfClasses:v6 fromObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  BOOL v4 = [NSString stringWithFormat:@"Not supported. Must be secure coding compliant. key='%@'", a3];
  id v5 = [(STRPPropertyListTypeDecoder *)self _failWithCode:3 message:v4];

  return 0;
}

- (id)decodeTopLevelObjectForKey:(id)a3 error:(id *)a4
{
  id v5 = [NSString stringWithFormat:@"Not supported. key='%@'", a4, a3];
  id v6 = [(STRPPropertyListTypeDecoder *)self _failWithCode:3 message:v5];

  return 0;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (double)decodeDoubleForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_storage objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      *a4 = [v7 length];
    }
    uint64_t v8 = (const char *)[v7 bytes];
  }
  else
  {
    id v9 = STRPLogCoding();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[STRPPropertyListTypeDecoder decodeBytesForKey:returnedLength:]((uint64_t)v7, (uint64_t)v6, v9);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  uint64_t v3 = [(STRPPropertyListTypeDecoder *)self _numberForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)decodeArrayOfObjectsOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  uint64_t v8 = [v6 setWithObject:a3];
  id v9 = [(STRPPropertyListTypeDecoder *)self decodeArrayOfObjectsOfClasses:v8 forKey:v7];

  return v9;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 setByAddingObject:objc_opt_class()];

  id v9 = [(STRPPropertyListTypeDecoder *)self decodeObjectOfClasses:v8 forKey:v6];

  return v9;
}

- (id)decodeDictionaryWithKeysOfClass:(Class)a3 objectsOfClass:(Class)a4 forKey:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a5;
  uint64_t v10 = [v8 setWithObject:a3];
  char v11 = [MEMORY[0x263EFFA08] setWithObject:a4];
  uint64_t v12 = [(STRPPropertyListTypeDecoder *)self decodeDictionaryWithKeysOfClasses:v10 objectsOfClasses:v11 forKey:v9];

  return v12;
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[a4 mutableCopy];
  [v10 unionSet:v9];

  [v10 addObject:objc_opt_class()];
  char v11 = [(STRPPropertyListTypeDecoder *)self decodeObjectOfClasses:v10 forKey:v8];

  return v11;
}

- (id)_numberForKey:(id)a3
{
  storage = self->_storage;
  id v4 = a3;
  double v5 = [(NSDictionary *)storage bs_safeObjectForKey:v4 ofType:objc_opt_class()];

  return v5;
}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263EFFC70];
  v12[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v5 errorWithDomain:@"STRPCodingErrorDomain" code:a3 userInfo:v8];

  return v9;
}

- (id)_failWithCode:(int64_t)a3 message:(id)a4
{
  double v5 = [(STRPPropertyListTypeDecoder *)self _errorWithCode:a3 message:a4];
  [(STRPPropertyListTypeDecoder *)self failWithError:v5];

  return 0;
}

- (void).cxx_destruct
{
}

- (void)_decodeObjectOfClasses:(uint64_t)a1 fromObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
}

- (void)decodeBytesForKey:(NSObject *)a3 returnedLength:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_25B107000, a3, OS_LOG_TYPE_FAULT, "-decodeBytesForKey:returnedLength: called with class %@ for key '%@'.", (uint8_t *)&v7, 0x16u);
}

@end