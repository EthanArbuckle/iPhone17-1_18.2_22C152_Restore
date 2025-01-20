@interface SignpostSupportSerializabledObjectCollection
+ (BOOL)_enumerateSignpostObjectsInDeserializedCollectionDictionary:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5;
+ (BOOL)_versionIsSupported:(id)a3;
+ (BOOL)enumerateSignpostSupportObjectsInSerializedCollection:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5;
+ (BOOL)timeRangeForSerializedCollection:(id)a3 continuousTimeFirstOut:(unint64_t *)a4 continuousTimeLastOut:(unint64_t *)a5 errorOut:(id *)a6;
+ (id)_deserializedDictionaryForData:(id)a3 errorOut:(id *)a4;
- (NSArray)objectArray;
- (NSNumber)formatVersion;
- (SignpostSupportSerializabledObjectCollection)initWithData:(id)a3 errorOut:(id *)a4;
- (SignpostSupportSerializabledObjectCollection)initWithSerializeableObjectArray:(id)a3;
- (id)newSerializedCollection:(BOOL)a3;
- (unint64_t)machContinuousTimeFirst;
- (unint64_t)machContinuousTimeLast;
@end

@implementation SignpostSupportSerializabledObjectCollection

- (SignpostSupportSerializabledObjectCollection)initWithSerializeableObjectArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)SignpostSupportSerializabledObjectCollection;
    v5 = [(SignpostSupportSerializabledObjectCollection *)&v14 init];
    v6 = v5;
    if (v5)
    {
      formatVersion = v5->_formatVersion;
      v5->_formatVersion = (NSNumber *)&unk_1EF81E778;

      uint64_t v8 = [v4 copy];
      objectArray = v6->_objectArray;
      v6->_objectArray = (NSArray *)v8;

      v10 = [v4 firstObject];
      v6->_machContinuousTimeFirst = [v10 startMachContinuousTime];

      v11 = [v4 lastObject];
      v6->_machContinuousTimeLast = [v11 endMachContinuousTime];
    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_versionIsSupported:(id)a3
{
  return [a3 isEqualToNumber:&unk_1EF81E778];
}

- (id)newSerializedCollection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:&unk_1EF81E778 forKeyedSubscript:@"Vers"];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportSerializabledObjectCollection machContinuousTimeFirst](self, "machContinuousTimeFirst"));
  [v5 setObject:v6 forKeyedSubscript:@"FirstTime"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportSerializabledObjectCollection machContinuousTimeLast](self, "machContinuousTimeLast"));
  [v5 setObject:v7 forKeyedSubscript:@"LastTime"];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(SignpostSupportSerializabledObjectCollection *)self objectArray];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) serializeableDictionaryWithShouldRedact:v3];
        if (!v14)
        {

          v16 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [v5 setObject:v8 forKeyedSubscript:@"Objects"];
  v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:0];
LABEL_11:

  return v16;
}

+ (id)_deserializedDictionaryForData:(id)a3 errorOut:(id *)a4
{
  id v17 = 0;
  v5 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v17];
  id v6 = v17;
  v7 = v6;
  if (!v5)
  {
    if (a4)
    {
      if (v6)
      {
        uint64_t v13 = (void *)[v6 copy];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Plist deserialization failed"];
      }
      id v12 = 0;
      *a4 = v13;
    }
    else
    {
      id v12 = 0;
    }
    goto LABEL_32;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"Vers"];
  if (v8)
  {
    if ([(id)objc_opt_class() _versionIsSupported:v8])
    {
      v9 = [v5 objectForKeyedSubscript:@"FirstTime"];
      if (v9)
      {
        uint64_t v10 = [v5 objectForKeyedSubscript:@"LastTime"];
        if (v10)
        {
          uint64_t v11 = [v5 objectForKeyedSubscript:@"Objects"];
          if (v11)
          {
            id v12 = v5;
          }
          else if (a4)
          {
            [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"No object dictionaries array"];
            id v12 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v12 = 0;
          }
        }
        else if (a4)
        {
          [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Missing last signpost time"];
          id v12 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v12 = 0;
        }
      }
      else if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Missing first signpost time"];
        id v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = 0;
      }

      goto LABEL_31;
    }
    if (a4)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = [NSString stringWithFormat:@"Unsupported version: %@", v8];
      *a4 = [v14 errorWithCode:3 description:v15];
    }
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    id v12 = 0;
    goto LABEL_31;
  }
  [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"No version in deserialized plist"];
  id v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

LABEL_32:

  return v12;
}

- (SignpostSupportSerializabledObjectCollection)initWithData:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  id v31 = 0;
  v7 = [(id)objc_opt_class() _deserializedDictionaryForData:v6 errorOut:&v31];

  id v8 = v31;
  v9 = v8;
  if (v7)
  {
    id v26 = v8;
    uint64_t v10 = [v7 objectForKeyedSubscript:@"Vers"];
    uint64_t v11 = [v7 objectForKeyedSubscript:@"FirstTime"];
    v25 = [v7 objectForKeyedSubscript:@"LastTime"];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __70__SignpostSupportSerializabledObjectCollection_initWithData_errorOut___block_invoke;
    v29[3] = &unk_1E5B403E0;
    id v13 = v12;
    id v30 = v13;
    uint64_t v14 = (void *)MEMORY[0x1A625EA50](v29);
    id v28 = 0;
    char v15 = [(id)objc_opt_class() _enumerateSignpostObjectsInDeserializedCollectionDictionary:v7 processingBlock:v14 errorOut:&v28];
    id v16 = v28;
    id v17 = v16;
    if (v15)
    {
      v27.receiver = self;
      v27.super_class = (Class)SignpostSupportSerializabledObjectCollection;
      long long v18 = [(SignpostSupportSerializabledObjectCollection *)&v27 init];
      long long v19 = v18;
      long long v20 = v25;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_objectArray, v12);
        objc_storeStrong((id *)&v19->_formatVersion, v10);
        v19->_machContinuousTimeFirst = [v11 unsignedLongLongValue];
        v19->_machContinuousTimeLast = [v25 unsignedLongLongValue];
      }
      self = v19;
      long long v21 = self;
      v9 = v26;
    }
    else
    {
      if (a4)
      {
        if (v16)
        {
          uint64_t v23 = (void *)[v16 copy];
        }
        else
        {
          uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data enumeration error"];
        }
        long long v21 = 0;
        *a4 = v23;
      }
      else
      {
        long long v21 = 0;
      }
      long long v20 = v25;
      v9 = v26;
    }
  }
  else if (a4)
  {
    if (v8)
    {
      v22 = (void *)[v8 copy];
    }
    else
    {
      v22 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown dictionary deserialization error"];
    }
    long long v21 = 0;
    *a4 = v22;
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

uint64_t __70__SignpostSupportSerializabledObjectCollection_initWithData_errorOut___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (BOOL)timeRangeForSerializedCollection:(id)a3 continuousTimeFirstOut:(unint64_t *)a4 continuousTimeLastOut:(unint64_t *)a5 errorOut:(id *)a6
{
  id v9 = a3;
  id v17 = 0;
  uint64_t v10 = [(id)objc_opt_class() _deserializedDictionaryForData:v9 errorOut:&v17];

  id v11 = v17;
  id v12 = v11;
  if (v10)
  {
    id v13 = [v10 objectForKeyedSubscript:@"FirstTime"];
    uint64_t v14 = [v10 objectForKeyedSubscript:@"LastTime"];
    *a4 = [v13 unsignedLongLongValue];
    *a5 = [v14 unsignedLongLongValue];
  }
  else if (a6)
  {
    if (v11)
    {
      char v15 = (void *)[v11 copy];
    }
    else
    {
      char v15 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data deserialization error"];
    }
    *a6 = v15;
  }

  return v10 != 0;
}

+ (BOOL)_enumerateSignpostObjectsInDeserializedCollectionDictionary:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, uint64_t, unsigned char *))a4;
  [a3 objectForKeyedSubscript:@"Objects"];
  unsigned __int8 v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        uint64_t v5 = _SignpostSerializeableObjectFromSerializedObjectDictionary(v14, &v21);
        id v15 = v21;
        id v16 = v15;
        if (!v5)
        {
          if (a5)
          {
            if (v15)
            {
              long long v19 = (void *)[v15 copy];
            }
            else
            {
              long long v19 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data deserialization error"];
            }
            *a5 = v19;
          }

          LOBYTE(v5) = 0;
          char v18 = 0;
          goto LABEL_19;
        }
        v8[2](v8, v5, &v26);
        int v17 = v26;

        if (v17)
        {
          char v18 = 0;
          LOBYTE(v5) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      char v18 = 1;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v18 = 1;
  }
LABEL_19:

  return (v5 | v18) & 1;
}

+ (BOOL)enumerateSignpostSupportObjectsInSerializedCollection:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5
{
  id v8 = a4;
  id v18 = 0;
  id v9 = [a1 _deserializedDictionaryForData:a3 errorOut:&v18];
  id v10 = v18;
  uint64_t v11 = v10;
  if (v9)
  {
    id v17 = 0;
    [a1 _enumerateSignpostObjectsInDeserializedCollectionDictionary:v9 processingBlock:v8 errorOut:&v17];
    id v12 = v17;
    id v13 = v12;
    if (a5)
    {
      if (v12)
      {
        uint64_t v14 = (void *)[v12 copy];
      }
      else
      {
        uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data enumeration error"];
      }
      *a5 = v14;
    }
  }
  else if (a5)
  {
    if (v10)
    {
      id v15 = (void *)[v10 copy];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unknown data deserialization error"];
    }
    *a5 = v15;
  }

  return v9 != 0;
}

- (NSArray)objectArray
{
  return self->_objectArray;
}

- (NSNumber)formatVersion
{
  return self->_formatVersion;
}

- (unint64_t)machContinuousTimeFirst
{
  return self->_machContinuousTimeFirst;
}

- (unint64_t)machContinuousTimeLast
{
  return self->_machContinuousTimeLast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);

  objc_storeStrong((id *)&self->_objectArray, 0);
}

@end