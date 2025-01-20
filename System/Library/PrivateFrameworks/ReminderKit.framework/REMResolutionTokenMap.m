@interface REMResolutionTokenMap
+ (BOOL)supportsSecureCoding;
+ (REMResolutionTokenMap)mapWithData:(id)a3;
+ (REMResolutionTokenMap)resolutionTokenMapWithJSONData:(id)a3 keyMap:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeWithMap:(id)a3 forKey:(id)a4;
- (NSMutableDictionary)map;
- (REMResolutionTokenMap)init;
- (REMResolutionTokenMap)initWithCoder:(id)a3;
- (REMResolutionTokenMap)initWithMap:(id)a3;
- (id)archivedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)getTokenForKey:(id)a3;
- (id)getTokenKeys;
- (int64_t)compare:(id)a3 forKey:(id)a4;
- (int64_t)compareAndMergeWithMap:(id)a3 forKey:(id)a4;
- (void)archivedData;
- (void)encodeWithCoder:(id)a3;
- (void)forceMergeFromMap:(id)a3 forKey:(id)a4;
- (void)initTokenWithDefaultValueIfNecessaryForKey:(id)a3;
- (void)setMap:(id)a3;
- (void)setToken:(id)a3 forKey:(id)a4;
- (void)updateForKey:(id)a3;
@end

@implementation REMResolutionTokenMap

- (void).cxx_destruct
{
}

- (REMResolutionTokenMap)init
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(REMResolutionTokenMap *)self initWithMap:v3];

  return v4;
}

- (REMResolutionTokenMap)initWithMap:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMResolutionTokenMap;
  v5 = [(REMResolutionTokenMap *)&v8 init];
  v6 = v5;
  if (v5) {
    [(REMResolutionTokenMap *)v5 setMap:v4];
  }

  return v6;
}

- (void)setMap:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMResolutionTokenMap *)self map];
  [v4 encodeObject:v5 forKey:@"map"];
}

- (REMResolutionTokenMap)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_super v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"map"];

  v10 = [(REMResolutionTokenMap *)self initWithMap:v9];
  return v10;
}

- (void)updateForKey:(id)a3
{
  id v7 = a3;
  id v4 = [(REMResolutionTokenMap *)self map];
  id v5 = [v4 objectForKeyedSubscript:v7];

  if (!v5)
  {
    id v5 = objc_alloc_init(REMResolutionToken);
    uint64_t v6 = [(REMResolutionTokenMap *)self map];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  [(REMResolutionToken *)v5 update];
}

- (void)initTokenWithDefaultValueIfNecessaryForKey:(id)a3
{
  id v8 = a3;
  id v4 = [(REMResolutionTokenMap *)self map];
  id v5 = [v4 objectForKeyedSubscript:v8];

  if (!v5)
  {
    uint64_t v6 = [[REMResolutionToken alloc] initWithDefaultValue];
    id v7 = [(REMResolutionTokenMap *)self map];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMResolutionTokenMap alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(REMResolutionTokenMap *)self map];
  id v7 = (void *)[v5 initWithDictionary:v6 copyItems:1];
  id v8 = [(REMResolutionTokenMap *)v4 initWithMap:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMResolutionTokenMap *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(REMResolutionTokenMap *)self map];
      uint64_t v6 = [(REMResolutionTokenMap *)v4 map];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (int64_t)compare:(id)a3 forKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(REMResolutionTokenMap *)self map];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  v10 = [v6 map];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (!(v9 | v11))
  {
    v13 = +[REMLogStore utility];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v20 = [(REMResolutionTokenMap *)self map];
      v15 = [v20 allKeys];
      v16 = [v15 componentsJoinedByString:@","];
      v17 = [v6 map];
      v18 = [v17 allKeys];
      v19 = [v18 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543874;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_fault_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_FAULT, "Comparing two undefined resolution token is unexpected and should never happen {key: %{public}@, self.map.allKeys: %@, other.map.allKeys: %@}", buf, 0x20u);
    }
LABEL_8:
    int64_t v12 = -1;
    goto LABEL_9;
  }
  if (!v9 || v11)
  {
    if (v9 || !v11)
    {
      int64_t v12 = [(id)v9 compare:v11];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64_t v12 = 1;
LABEL_9:

  return v12;
}

- (int64_t)compareAndMergeWithMap:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(REMResolutionTokenMap *)self compare:v6 forKey:v7];
  if (v8 == -1)
  {
    uint64_t v9 = [v6 map];
    v10 = [v9 objectForKeyedSubscript:v7];
    uint64_t v11 = (void *)[v10 copy];
    int64_t v12 = [(REMResolutionTokenMap *)self map];
    [v12 setObject:v11 forKeyedSubscript:v7];
  }
  return v8;
}

- (BOOL)mergeWithMap:(id)a3 forKey:(id)a4
{
  return [(REMResolutionTokenMap *)self compareAndMergeWithMap:a3 forKey:a4] == -1;
}

- (void)forceMergeFromMap:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v10 = [a3 map];
  id v7 = [v10 objectForKeyedSubscript:v6];
  int64_t v8 = (void *)[v7 copy];
  uint64_t v9 = [(REMResolutionTokenMap *)self map];
  [v9 setObject:v8 forKeyedSubscript:v6];
}

- (id)getTokenForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REMResolutionTokenMap *)self map];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setToken:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMResolutionTokenMap *)self map];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (id)getTokenKeys
{
  v2 = [(REMResolutionTokenMap *)self map];
  v3 = [v2 allKeys];

  return v3;
}

- (id)archivedData
{
  id v8 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v6 = +[REMLogStore utility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMResolutionTokenMap archivedData]();
    }
  }

  return v2;
}

+ (REMResolutionTokenMap)mapWithData:(id)a3
{
  id v9 = 0;
  id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:&v9];
  id v4 = v9;
  BOOL v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    id v7 = +[REMLogStore utility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[REMResolutionTokenMap mapWithData:]();
    }
  }

  return (REMResolutionTokenMap *)v3;
}

- (id)debugDescription
{
  v2 = [(REMResolutionTokenMap *)self map];
  id v3 = [v2 debugDescription];

  return v3;
}

+ (REMResolutionTokenMap)resolutionTokenMapWithJSONData:(id)a3 keyMap:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  if (v5 && [v5 length])
  {
    id v36 = 0;
    BOOL v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v36];
    id v7 = v36;
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      id v9 = REMDynamicCast(v8, (uint64_t)v6);
      if (v9)
      {
        id v28 = v7;
        id v29 = v5;
        v30 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v27 = v9;
        id v10 = [v9 objectForKeyedSubscript:@"map"];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v11 = [v10 keyEnumerator];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v17 = [v10 objectForKey:v16];
              v18 = +[REMResolutionToken resolutionTokenWithJSONObject:v17];
              if (v18)
              {
                uint64_t v19 = [v31 objectForKey:v16];
                v20 = (void *)v19;
                if (v19) {
                  v21 = (void *)v19;
                }
                else {
                  v21 = v16;
                }
                id v22 = v21;

                [v30 setObject:v18 forKey:v22];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v13);
        }

        __int16 v23 = v30;
        v24 = [[REMResolutionTokenMap alloc] initWithMap:v30];

        id v5 = v29;
        id v9 = v27;
        id v7 = v28;
      }
      else
      {
        __int16 v23 = +[REMLogStore utility];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:]((uint64_t)v6, v23);
        }
        v24 = 0;
      }
    }
    else
    {
      id v9 = +[REMLogStore utility];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:]();
      }
      v24 = 0;
    }

    __int16 v25 = v24;
  }
  else
  {
    __int16 v25 = objc_alloc_init(REMResolutionTokenMap);
  }

  return v25;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)archivedData
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Error encoding resolution token map {error: %@}", v1, 0xCu);
}

+ (void)mapWithData:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Error decoding resolution token map {error: %@}", v1, 0xCu);
}

+ (void)resolutionTokenMapWithJSONData:keyMap:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Failed to decode data to REMResolutionTokenMap. Returning nil {error: %@}", v1, 0xCu);
}

+ (void)resolutionTokenMapWithJSONData:(uint64_t)a1 keyMap:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  id v4 = v3;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unexpected class to decode data to REMResolutionTokenMap. Returning nil {class: %@}", v5, 0xCu);
}

@end