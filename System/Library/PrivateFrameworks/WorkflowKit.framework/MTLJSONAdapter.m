@interface MTLJSONAdapter
+ (id)JSONArrayFromModels:(id)a3;
+ (id)JSONArrayFromModels:(id)a3 error:(id *)a4;
+ (id)JSONDictionaryFromModel:(id)a3;
+ (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4;
+ (id)NSURLJSONTransformer;
+ (id)NSUUIDJSONTransformer;
+ (id)arrayTransformerWithModelClass:(Class)a3;
+ (id)dictionaryTransformerWithModelClass:(Class)a3;
+ (id)modelOfClass:(Class)a3 fromJSONDictionary:(id)a4 error:(id *)a5;
+ (id)modelsOfClass:(Class)a3 fromJSONArray:(id)a4 error:(id *)a5;
+ (id)transformerForModelPropertiesOfClass:(Class)a3;
+ (id)transformerForModelPropertiesOfObjCType:(const char *)a3;
+ (id)valueTransformersForModelClass:(Class)a3;
- (Class)modelClass;
- (MTLJSONAdapter)init;
- (MTLJSONAdapter)initWithModelClass:(Class)a3;
- (NSDictionary)JSONKeyPathsByPropertyKey;
- (NSDictionary)valueTransformersByPropertyKey;
- (NSMapTable)JSONAdaptersByModelClass;
- (id)JSONAdapterForModelClass:(Class)a3 error:(id *)a4;
- (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4;
- (id)modelFromJSONDictionary:(id)a3 error:(id *)a4;
- (id)serializablePropertyKeys:(id)a3 forModel:(id)a4;
@end

@implementation MTLJSONAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONAdaptersByModelClass, 0);
  objc_storeStrong((id *)&self->_valueTransformersByPropertyKey, 0);
  objc_storeStrong((id *)&self->_JSONKeyPathsByPropertyKey, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
}

- (NSMapTable)JSONAdaptersByModelClass
{
  return self->_JSONAdaptersByModelClass;
}

- (NSDictionary)valueTransformersByPropertyKey
{
  return self->_valueTransformersByPropertyKey;
}

- (NSDictionary)JSONKeyPathsByPropertyKey
{
  return self->_JSONKeyPathsByPropertyKey;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (id)serializablePropertyKeys:(id)a3 forModel:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)JSONAdapterForModelClass:(Class)a3 error:(id *)a4
{
  if (!a3)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4);
    [v13 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 428, @"Invalid parameter not satisfying: %@", @"modelClass != nil" object file lineNumber description];
  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1F232D2C8, a4) & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 429, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]" object file lineNumber description];
  }
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(MTLJSONAdapter *)v7 JSONAdaptersByModelClass];
  v9 = [v8 objectForKey:a3];

  if (!v9)
  {
    v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithModelClass:a3];
    if (v9)
    {
      v10 = [(MTLJSONAdapter *)v7 JSONAdaptersByModelClass];
      [v10 setObject:v9 forKey:a3];
    }
  }
  id v11 = v9;

  objc_sync_exit(v7);
  return v11;
}

- (id)modelFromJSONDictionary:(id)a3 error:(id *)a4
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MTLJSONAdapter *)self modelClass];
  if (objc_opt_respondsToSelector())
  {
    v7 = (objc_class *)[(objc_class *)[(MTLJSONAdapter *)self modelClass] classForParsingJSONDictionary:v6];
    if (!v7)
    {
      if (a4)
      {
        v57[0] = *MEMORY[0x1E4F28568];
        v33 = [MEMORY[0x1E4F28B50] mainBundle];
        v34 = [v33 localizedStringForKey:@"Could not parse JSON" value:&stru_1F229A4D8 table:0];
        v57[1] = *MEMORY[0x1E4F28588];
        v58[0] = v34;
        v35 = [MEMORY[0x1E4F28B50] mainBundle];
        v36 = [v35 localizedStringForKey:@"No model class could be found to parse the JSON dictionary." value:&stru_1F229A4D8 table:0];
        v58[1] = v36;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLJSONAdapterErrorDomain" code:2 userInfo:v37];
      }
      id v10 = 0;
      goto LABEL_47;
    }
    v8 = v7;
    if (v7 != [(MTLJSONAdapter *)self modelClass])
    {
      if (([(objc_class *)v8 conformsToProtocol:&unk_1F232D2C8] & 1) == 0)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 276, @"Class %@ returned from +classForParsingJSONDictionary: does not conform to <MTLJSONSerializing>", v8 object file lineNumber description];
      }
      v9 = [(MTLJSONAdapter *)self JSONAdapterForModelClass:v8 error:a4];
      id v10 = [v9 modelFromJSONDictionary:v6 error:a4];

      goto LABEL_47;
    }
  }
  v44 = v6;
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v43 = self;
  id obj = [(objc_class *)[(MTLJSONAdapter *)self modelClass] propertyKeys];
  uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v52;
LABEL_9:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v52 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v51 + 1) + 8 * v11);
      v13 = [(MTLJSONAdapter *)v43 JSONKeyPathsByPropertyKey];
      v14 = [v13 objectForKeyedSubscript:v12];

      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v16 = v14;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v48;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v48 != v18) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                char v46 = 0;
                v21 = objc_msgSend(v44, "mtl_valueForJSONKeyPath:success:error:", v20, &v46, a4);
                v22 = v21;
                if (!v46)
                {

                  goto LABEL_45;
                }
                if (v21) {
                  [v15 setObject:v21 forKeyedSubscript:v20];
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          char v46 = 0;
          v15 = objc_msgSend(v44, "mtl_valueForJSONKeyPath:success:error:", v14, &v46, a4);
          if (!v46)
          {
            id v16 = v14;
            goto LABEL_45;
          }
        }
        if (v15)
        {
          v23 = [(MTLJSONAdapter *)v43 valueTransformersByPropertyKey];
          v24 = [v23 objectForKeyedSubscript:v12];

          if (v24)
          {
            v25 = [MEMORY[0x1E4F1CA98] null];
            int v26 = [v15 isEqual:v25];

            if (v26)
            {

              v15 = 0;
            }
            if (objc_opt_respondsToSelector())
            {
              id v27 = v24;
              char v46 = 1;
              uint64_t v28 = [v27 transformedValue:v15 success:&v46 error:a4];

              BOOL v29 = v46 == 0;
              if (v29)
              {

                id v16 = v14;
                v15 = (void *)v28;
LABEL_45:

                id v10 = 0;
                v30 = obj;
                goto LABEL_46;
              }
            }
            else
            {
              uint64_t v28 = [v24 transformedValue:v15];
            }
            v15 = (void *)v28;
            if (!v28)
            {
              v15 = [MEMORY[0x1E4F1CA98] null];
            }
          }
          [v39 setObject:v15 forKeyedSubscript:v12];
        }
      }
      if (++v11 == v41)
      {
        uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v41) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  v30 = [(objc_class *)[(MTLJSONAdapter *)v43 modelClass] modelWithDictionary:v39 error:a4];
  if ([v30 validate:a4]) {
    v31 = v30;
  }
  else {
    v31 = 0;
  }
  id v10 = v31;
LABEL_46:

  id v6 = v44;
LABEL_47:

  return v10;
}

- (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 178, @"Invalid parameter not satisfying: %@", @"model != nil" object file lineNumber description];
  }
  [(MTLJSONAdapter *)self modelClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 179, @"Invalid parameter not satisfying: %@", @"[model isKindOfClass:self.modelClass]" object file lineNumber description];
  }
  v8 = [(MTLJSONAdapter *)self modelClass];
  if (v8 == (objc_class *)objc_opt_class())
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = [(MTLJSONAdapter *)self JSONKeyPathsByPropertyKey];
    v13 = [v12 allKeys];
    v14 = [v11 setWithArray:v13];
    v15 = [(MTLJSONAdapter *)self serializablePropertyKeys:v14 forModel:v7];

    id v16 = [v7 dictionaryValue];
    uint64_t v17 = [v15 allObjects];
    uint64_t v18 = [v16 dictionaryWithValuesForKeys:v17];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v18, "count"));
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    uint64_t v28 = 0;
    BOOL v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__64207;
    v32 = __Block_byref_object_dispose__64208;
    id v33 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke;
    v24[3] = &unk_1E65571B0;
    v24[4] = self;
    int v26 = &v34;
    id v27 = &v28;
    id v20 = v19;
    id v25 = v20;
    [v18 enumerateKeysAndObjectsUsingBlock:v24];
    if (*((unsigned char *)v35 + 24))
    {
      id v10 = v20;
    }
    else
    {
      id v10 = 0;
      if (a4) {
        *a4 = (id) v29[5];
      }
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v9 = [(MTLJSONAdapter *)self JSONAdapterForModelClass:objc_opt_class() error:a4];
    id v10 = [v9 JSONDictionaryFromModel:v7 error:a4];
  }
  return v10;
}

void __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = [*(id *)(a1 + 32) JSONKeyPathsByPropertyKey];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) valueTransformersByPropertyKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];

    if ([(id)objc_opt_class() allowsReverseTransformation])
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      int v14 = [v8 isEqual:v13];

      if (v14)
      {

        id v8 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v16 + 40);
        uint64_t v17 = [v12 reverseTransformedValue:v8 success:v15 error:&obj];
        objc_storeStrong((id *)(v16 + 40), obj);

        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          *a4 = 1;
LABEL_24:

          id v8 = v17;
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v18 = [v12 reverseTransformedValue:v8];
        v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [MEMORY[0x1E4F1CA98] null];
        }
        uint64_t v17 = v20;
      }
    }
    else
    {
      uint64_t v17 = v8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(*(void **)(a1 + 40), v10);
      [*(id *)(a1 + 40) setValue:v17 forKeyPath:v10];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v29 = v12;
      id v30 = v7;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v10;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            int v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(*(void **)(a1 + 40), v26);
            id v27 = *(void **)(a1 + 40);
            uint64_t v28 = [v17 objectForKeyedSubscript:v26];
            [v27 setValue:v28 forKeyPath:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v23);
      }

      uint64_t v12 = v29;
      id v7 = v30;
    }
    goto LABEL_24;
  }
LABEL_25:
}

void __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 componentsSeparatedByString:@"."];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      v9 = v3;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v11 = [v9 valueForKey:v10];

        if (!v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [v9 setValue:v12 forKey:v10];
        }
        id v3 = [v9 valueForKey:v10];

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (MTLJSONAdapter)initWithModelClass:(Class)a3
{
  Class v3 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 135, @"Invalid parameter not satisfying: %@", @"modelClass != nil" object file lineNumber description];
  }
  if (([(objc_class *)v3 conformsToProtocol:&unk_1F232D2C8] & 1) == 0)
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 136, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]" object file lineNumber description];
  }
  v45.receiver = self;
  v45.super_class = (Class)MTLJSONAdapter;
  uint64_t v6 = [(MTLJSONAdapter *)&v45 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelClass, v3);
    uint64_t v8 = [(objc_class *)v3 JSONKeyPathsByPropertyKey];
    JSONKeyPathsByPropertyKey = v7->_JSONKeyPathsByPropertyKey;
    v7->_JSONKeyPathsByPropertyKey = (NSDictionary *)v8;

    uint64_t v10 = [(objc_class *)[(MTLJSONAdapter *)v7 modelClass] propertyKeys];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v11 = v7->_JSONKeyPathsByPropertyKey;
    uint64_t v36 = [(NSDictionary *)v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v36)
    {
      uint64_t v12 = *(void *)v42;
      SEL v33 = a2;
      long long v34 = v11;
      v35 = v10;
      long long v31 = v3;
      uint64_t v32 = *(void *)v42;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * v13);
        if (([v10 containsObject:v14] & 1) == 0) {
          break;
        }
        long long v15 = [(NSDictionary *)v7->_JSONKeyPathsByPropertyKey objectForKeyedSubscript:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v38;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v16);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  int v26 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v26 handleFailureInMethod:v33, v7, @"MTLJSONAdapter.m", 159, @"%@ must either map to a JSON key path or a JSON array of key paths, got: %@.", v14, v16 object file lineNumber description];

                  id v27 = v16;
                  uint64_t v11 = v34;
                  uint64_t v10 = v35;
                  goto LABEL_28;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v34;
          uint64_t v10 = v35;
          uint64_t v12 = v32;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v27 = [MEMORY[0x1E4F28B00] currentHandler];
            [v27 handleFailureInMethod:a2, v7, @"MTLJSONAdapter.m", 163, @"%@ must either map to a JSON key path or a JSON array of key paths, got: %@.", v14, v15 object file lineNumber description];
            id v16 = v15;
LABEL_28:

            goto LABEL_29;
          }
        }

        if (++v13 == v36)
        {
          Class v3 = v31;
          uint64_t v36 = [(NSDictionary *)v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v36) {
            goto LABEL_8;
          }
          goto LABEL_25;
        }
      }
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v7, @"MTLJSONAdapter.m", 149, @"%@ is not a property of %@.", v14, v31 object file lineNumber description];
LABEL_29:

      id v25 = 0;
      goto LABEL_30;
    }
LABEL_25:

    uint64_t v21 = [(id)objc_opt_class() valueTransformersForModelClass:v3];
    valueTransformersByPropertyKey = v7->_valueTransformersByPropertyKey;
    v7->_valueTransformersByPropertyKey = (NSDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    JSONAdaptersByModelClass = v7->_JSONAdaptersByModelClass;
    v7->_JSONAdaptersByModelClass = (NSMapTable *)v23;

    id v25 = v7;
LABEL_30:
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (MTLJSONAdapter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"MTLJSONAdapter.m", 130, @"%@ must be initialized with a model class", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)transformerForModelPropertiesOfObjCType:(const char *)a3
{
  if (!a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 464, @"Invalid parameter not satisfying: %@", @"objCType != NULL" object file lineNumber description];
  }
  if (!strcmp(a3, "B"))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F29248], "mtl_BOOLeanValueTransformer");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)transformerForModelPropertiesOfClass:(Class)a3
{
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 451, @"Invalid parameter not satisfying: %@", @"modelClass != nil" object file lineNumber description];
  }
  uint64_t v5 = NSStringFromClass(a3);
  SEL v6 = MTLSelectorWithKeyPattern(v5, "JSONTransformer");

  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = ((void (*)(id, SEL))[a1 methodForSelector:v6])(a1, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

+ (id)valueTransformersForModelClass:(Class)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 366, @"Invalid parameter not satisfying: %@", @"modelClass != nil" object file lineNumber description];
  }
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F232D2C8] & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 367, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]" object file lineNumber description];
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(objc_class *)a3 propertyKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        SEL v10 = MTLSelectorWithKeyPattern(v9, "JSONTransformer");
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([(objc_class *)a3 JSONTransformerForKey:v9],
                (uint64_t v11 = (void (**)(void))objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v12 = v9;
            Property = class_getProperty(a3, (const char *)[v12 UTF8String]);
            if (!Property) {
              continue;
            }
            uint64_t v14 = mtl_copyPropertyAttributes(Property);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __49__MTLJSONAdapter_valueTransformersForModelClass___block_invoke;
            aBlock[3] = &__block_descriptor_40_e5_v8__0l;
            aBlock[4] = v14;
            uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
            if (v14[48] == 64)
            {
              long long v15 = (void *)*((void *)v14 + 5);
              if (v15)
              {
                id v16 = [a1 transformerForModelPropertiesOfClass:*((void *)v14 + 5)];
                if (v16) {
                  goto LABEL_29;
                }
              }
              if ([v15 conformsToProtocol:&unk_1F232D2C8])
              {
                id v16 = [a1 dictionaryTransformerWithModelClass:v15];
                if (v16) {
                  goto LABEL_29;
                }
              }
              uint64_t v17 = (void *)MEMORY[0x1E4F29248];
              if (!v15) {
                long long v15 = objc_opt_class();
              }
              id v16 = objc_msgSend(v17, "mtl_validatingTransformerForClass:", v15);
LABEL_28:
              if (v16) {
LABEL_29:
              }
                [v5 setObject:v16 forKeyedSubscript:v12];

              v11[2](v11);
              goto LABEL_31;
            }
            uint64_t v18 = [a1 transformerForModelPropertiesOfObjCType:v14 + 48];
            uint64_t v19 = v18;
            if (v18)
            {
              id v20 = v18;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E4F29248], "mtl_validatingTransformerForClass:", objc_opt_class());
              id v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v16 = v20;

            goto LABEL_28;
          }
LABEL_12:
          [v5 setObject:v11 forKeyedSubscript:v9];
          goto LABEL_31;
        }
        ((void (*)(Class, SEL))[(objc_class *)a3 methodForSelector:v10])(a3, v10);
        uint64_t v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        if (v11) {
          goto LABEL_12;
        }
LABEL_31:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  return v5;
}

void __49__MTLJSONAdapter_valueTransformersForModelClass___block_invoke(uint64_t a1)
{
}

+ (id)JSONArrayFromModels:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 113, @"Invalid parameter not satisfying: %@", @"models != nil" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 114, @"Invalid parameter not satisfying: %@", @"[models isKindOfClass:NSArray.class]" object file lineNumber description];
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [a1 JSONDictionaryFromModel:*(void *)(*((void *)&v20 + 1) + 8 * i) error:a4];
        if (!v14)
        {

          id v16 = 0;
          goto LABEL_15;
        }
        long long v15 = (void *)v14;
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = v8;
LABEL_15:

  return v16;
}

+ (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithModelClass:objc_opt_class()];
  uint64_t v8 = [v7 JSONDictionaryFromModel:v6 error:a4];

  return v8;
}

+ (id)modelsOfClass:(Class)a3 fromJSONArray:(id)a4 error:(id *)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [a1 modelOfClass:a3 fromJSONDictionary:*(void *)(*((void *)&v26 + 1) + 8 * i) error:a5];
          if (!v15)
          {

            uint64_t v17 = 0;
            goto LABEL_16;
          }
          id v16 = (void *)v15;
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v9 = v9;
    uint64_t v17 = v9;
  }
  else
  {
    if (!a5)
    {
      uint64_t v17 = 0;
      goto LABEL_17;
    }
    v31[0] = *MEMORY[0x1E4F28568];
    uint64_t v18 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v19 = [v18 localizedStringForKey:@"Missing JSON array" value:&stru_1F229A4D8 table:0];
    v31[1] = *MEMORY[0x1E4F28588];
    v32[0] = v19;
    long long v20 = NSString;
    long long v21 = [MEMORY[0x1E4F28B50] mainBundle];
    long long v22 = [v21 localizedStringForKey:@"%@ could not be created because an invalid JSON array was provided: %@" value:&stru_1F229A4D8 table:0];
    long long v23 = NSStringFromClass(a3);
    uint64_t v24 = objc_msgSend(v20, "stringWithFormat:", v22, v23, objc_opt_class());
    v32[1] = v24;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

    [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLJSONAdapterErrorDomain" code:3 userInfo:v9];
    uint64_t v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:

LABEL_17:
  return v17;
}

+ (id)modelOfClass:(Class)a3 fromJSONDictionary:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)a1) initWithModelClass:a3];
  id v10 = [v9 modelFromJSONDictionary:v8 error:a5];

  return v10;
}

+ (id)NSUUIDJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E4F29248], "mtl_UUIDValueTransformer");
}

+ (id)NSURLJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E4F29248], "mtl_URLValueTransformer");
}

+ (id)arrayTransformerWithModelClass:(Class)a3
{
  Class v3 = [a1 dictionaryTransformerWithModelClass:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke;
  v9[3] = &unk_1E6557238;
  id v10 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke_2;
  v7[3] = &unk_1E6557238;
  id v8 = v10;
  id v4 = v10;
  uint64_t v5 = +[MTLValueTransformer transformerUsingForwardBlock:v9 reverseBlock:v7];

  return v5;
}

id __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = a4;
      id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v34 = v7;
      id obj = v7;
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
          uint64_t v15 = [MEMORY[0x1E4F1CA98] null];

          if (v14 == v15) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v7 = v34;
            if (v8)
            {
              v40[0] = *MEMORY[0x1E4F28568];
              long long v26 = [MEMORY[0x1E4F28B50] mainBundle];
              SEL v33 = [v26 localizedStringForKey:@"Could not convert JSON array to model array" value:&stru_1F229A4D8 table:0];
              v41[0] = v33;
              v40[1] = *MEMORY[0x1E4F28588];
              long long v27 = NSString;
              long long v28 = [MEMORY[0x1E4F28B50] mainBundle];
              long long v29 = [v28 localizedStringForKey:@"Expected an NSDictionary or an NSNull, got: %@.", &stru_1F229A4D8, 0 value table];
              long long v30 = objc_msgSend(v27, "stringWithFormat:", v29, v14);
              v40[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
              v41[1] = v30;
              v41[2] = v14;
              long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

              void *v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v31];
            }
            *a3 = 0;
            goto LABEL_26;
          }
          id v16 = [*(id *)(a1 + 32) transformedValue:v14 success:a3 error:v8];
          uint64_t v17 = v16;
          if (!*a3)
          {

            id v7 = v34;
LABEL_26:

            id v18 = 0;
            goto LABEL_27;
          }
          if (v16) {
            goto LABEL_14;
          }
LABEL_15:

          if (v11 == ++v13)
          {
            uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_17;
          }
        }
        uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
LABEL_14:
        [v9 addObject:v17];
        goto LABEL_15;
      }
LABEL_17:

      id v18 = v9;
      id v7 = v34;
LABEL_27:
    }
    else
    {
      if (a4)
      {
        v43[0] = *MEMORY[0x1E4F28568];
        uint64_t v19 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v20 = [v19 localizedStringForKey:@"Could not convert JSON array to model array" value:&stru_1F229A4D8 table:0];
        v44[0] = v20;
        v43[1] = *MEMORY[0x1E4F28588];
        long long v21 = NSString;
        long long v22 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v23 = [v22 localizedStringForKey:@"Expected an NSArray, got: %@.", &stru_1F229A4D8, 0 value table];
        uint64_t v24 = objc_msgSend(v21, "stringWithFormat:", v23, v7);
        v43[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v44[1] = v24;
        v44[2] = v7;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v25];
      }
      id v18 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

id __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = a4;
      id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v34 = v7;
      id obj = v7;
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
          uint64_t v15 = [MEMORY[0x1E4F1CA98] null];

          if (v14 == v15) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v8)
            {
              v40[0] = *MEMORY[0x1E4F28568];
              long long v26 = [MEMORY[0x1E4F28B50] mainBundle];
              long long v27 = [v26 localizedStringForKey:@"Could not convert JSON array to model array" value:&stru_1F229A4D8 table:0];
              v41[0] = v27;
              v40[1] = *MEMORY[0x1E4F28588];
              long long v28 = NSString;
              long long v29 = [MEMORY[0x1E4F28B50] mainBundle];
              long long v30 = [v29 localizedStringForKey:@"Expected a MTLModel or an NSNull, got: %@.", &stru_1F229A4D8, 0 value table];
              long long v31 = objc_msgSend(v28, "stringWithFormat:", v30, v14);
              v40[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
              v41[1] = v31;
              v41[2] = v14;
              uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

              void *v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v32];
            }
            *a3 = 0;
            goto LABEL_26;
          }
          id v16 = [*(id *)(a1 + 32) reverseTransformedValue:v14 success:a3 error:v8];
          uint64_t v17 = v16;
          if (!*a3)
          {

LABEL_26:
            id v18 = 0;
            goto LABEL_27;
          }
          if (v16) {
            goto LABEL_14;
          }
LABEL_15:

          if (v11 == ++v13)
          {
            uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_17;
          }
        }
        uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
LABEL_14:
        [v9 addObject:v17];
        goto LABEL_15;
      }
LABEL_17:

      id v18 = v9;
LABEL_27:
      id v7 = v34;
    }
    else
    {
      if (a4)
      {
        v43[0] = *MEMORY[0x1E4F28568];
        uint64_t v19 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v20 = [v19 localizedStringForKey:@"Could not convert model array to JSON array" value:&stru_1F229A4D8 table:0];
        v44[0] = v20;
        v43[1] = *MEMORY[0x1E4F28588];
        long long v21 = NSString;
        long long v22 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v23 = [v22 localizedStringForKey:@"Expected an NSArray, got: %@.", &stru_1F229A4D8, 0 value table];
        uint64_t v24 = objc_msgSend(v21, "stringWithFormat:", v23, v7);
        v43[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v44[1] = v24;
        v44[2] = v7;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v25];
      }
      id v18 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)dictionaryTransformerWithModelClass:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F232D168] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 478, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLModel)]" object file lineNumber description];
  }
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F232D2C8] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"MTLJSONAdapter.m", 479, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]" object file lineNumber description];
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__64207;
  v12[4] = __Block_byref_object_dispose__64208;
  id v13 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke;
  v11[3] = &unk_1E65571E8;
  v11[4] = v12;
  v11[5] = a1;
  v11[6] = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke_2;
  v10[3] = &unk_1E6557210;
  v10[4] = v12;
  v10[5] = a1;
  v10[6] = a3;
  id v6 = +[MTLValueTransformer transformerUsingForwardBlock:v11 reverseBlock:v10];
  _Block_object_dispose(v12, 8);

  return v6;
}

id __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!v7)
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v21[0] = *MEMORY[0x1E4F28568];
      id v13 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"Could not convert JSON dictionary to model object" value:&stru_1F229A4D8 table:0];
      v22[0] = v14;
      v21[1] = *MEMORY[0x1E4F28588];
      uint64_t v15 = NSString;
      id v16 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v17 = [v16 localizedStringForKey:@"Expected an NSDictionary, got: %@", &stru_1F229A4D8, 0 value table];
      id v18 = objc_msgSend(v15, "stringWithFormat:", v17, v7);
      v21[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
      v22[1] = v18;
      v22[2] = v7;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v19];
    }
    goto LABEL_10;
  }
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v8)
  {
    uint64_t v9 = [objc_alloc(*(Class *)(a1 + 40)) initWithModelClass:*(void *)(a1 + 48)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  uint64_t v12 = [v8 modelFromJSONDictionary:v7 error:a4];
  if (!v12)
  {
LABEL_10:
    uint64_t v12 = 0;
    *a3 = 0;
  }
LABEL_11:

  return v12;
}

id __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  if (v7)
  {
    if (![v7 conformsToProtocol:&unk_1F232D168]
      || ([v8 conformsToProtocol:&unk_1F232D2C8] & 1) == 0)
    {
      if (a4)
      {
        v22[0] = *MEMORY[0x1E4F28568];
        uint64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v15 = [v14 localizedStringForKey:@"Could not convert model object to JSON dictionary" value:&stru_1F229A4D8 table:0];
        v23[0] = v15;
        v22[1] = *MEMORY[0x1E4F28588];
        id v16 = NSString;
        uint64_t v17 = [MEMORY[0x1E4F28B50] mainBundle];
        id v18 = [v17 localizedStringForKey:@"Expected a MTLModel object conforming to <MTLJSONSerializing>, got: %@.", &stru_1F229A4D8, 0 value table];
        uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v8);
        v22[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v23[1] = v19;
        v23[2] = v8;
        long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v20];
      }
      goto LABEL_10;
    }
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      uint64_t v10 = [objc_alloc(*(Class *)(a1 + 40)) initWithModelClass:*(void *)(a1 + 48)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v13 = [v9 JSONDictionaryFromModel:v8 error:a4];
    if (!v13)
    {
LABEL_10:
      id v13 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)JSONDictionaryFromModel:(id)a3
{
  return (id)[a1 JSONDictionaryFromModel:a3 error:0];
}

+ (id)JSONArrayFromModels:(id)a3
{
  return (id)[a1 JSONArrayFromModels:a3 error:0];
}

@end