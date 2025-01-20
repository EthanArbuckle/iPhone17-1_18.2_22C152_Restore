@interface PBObjectToRepresentationCoercion
- (BOOL)canCoerceToType:(id)a3;
- (Class)theClass;
- (NSMutableDictionary)coercionBlockByType;
- (NSMutableOrderedSet)typeOrder;
- (PBObjectToRepresentationCoercion)initWithClass:(Class)a3;
- (id)availableExportTypes;
- (void)addCoercionToType:(id)a3 block:(id)a4;
- (void)createRepresentationOfType:(id)a3 fromObject:(id)a4 completionBlock:(id)a5;
- (void)setCoercionBlockByType:(id)a3;
- (void)setTheClass:(Class)a3;
- (void)setTypeOrder:(id)a3;
@end

@implementation PBObjectToRepresentationCoercion

- (PBObjectToRepresentationCoercion)initWithClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PBObjectToRepresentationCoercion;
  v4 = [(PBObjectToRepresentationCoercion *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    coercionBlockByType = v5->_coercionBlockByType;
    v5->_coercionBlockByType = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
    typeOrder = v5->_typeOrder;
    v5->_typeOrder = (NSMutableOrderedSet *)v8;
  }
  return v5;
}

- (void)addCoercionToType:(id)a3 block:(id)a4
{
  id v7 = a3;
  uint64_t v6 = (void *)MEMORY[0x192F9AA30](a4);
  [(NSMutableDictionary *)self->_coercionBlockByType setObject:v6 forKeyedSubscript:v7];

  [(NSMutableOrderedSet *)self->_typeOrder addObject:v7];
}

- (id)availableExportTypes
{
  return (id)[(NSMutableOrderedSet *)self->_typeOrder array];
}

- (BOOL)canCoerceToType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_typeOrder;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (UTTypeConformsTo(*(CFStringRef *)(*((void *)&v10 + 1) + 8 * i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)createRepresentationOfType:(id)a3 fromObject:(id)a4 completionBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v11 = self->_typeOrder;
  uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(__CFString **)(*((void *)&v35 + 1) + 8 * v15);
      if (UTTypeConformsTo(v16, v8)) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v18 = [(NSMutableDictionary *)self->_coercionBlockByType objectForKeyedSubscript:v16];
    v17 = v16;

    if (!v18) {
      goto LABEL_12;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke;
    v31[3] = &unk_1E5556900;
    v32 = v8;
    id v33 = v9;
    id v34 = v10;
    v19 = (void (*)(void *, __CFString *, id, void *))v18[2];
    id v20 = v10;
    id v21 = v9;
    v22 = v8;
    v19(v18, v17, v21, v31);
  }
  else
  {
LABEL_9:

    v17 = 0;
LABEL_12:
    v23 = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_3;
    v27[3] = &unk_1E5555F80;
    id v29 = v9;
    v30 = v10;
    v28 = v8;
    id v24 = v10;
    id v25 = v9;
    v26 = v8;
    dispatch_async(v23, v27);

    v18 = v30;
  }
}

void __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 || v8 || v9)
  {
    if (v9)
    {
      uint64_t v13 = [v9 domain];
      char v14 = [v13 isEqualToString:@"PBErrorDomain"];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = *(void **)(a1 + 32);
        v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = PBCannotCreateRepresentationError(v15, v16, v10);

        id v10 = (void *)v17;
      }
    }
  }
  else
  {
    long long v11 = *(void **)(a1 + 32);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v10 = PBCannotCreateRepresentationError(v11, v12, 0);
  }
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_2;
    v19[3] = &unk_1E55562C8;
    id v23 = v18;
    id v20 = v7;
    id v21 = v8;
    id v22 = v10;
    PBDispatchAsyncCallback(v19);
  }
}

uint64_t __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (objc_class *)objc_opt_class();
    PBCannotCreateRepresentationError(v2, v3, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v4);
  }
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
}

- (NSMutableDictionary)coercionBlockByType
{
  return self->_coercionBlockByType;
}

- (void)setCoercionBlockByType:(id)a3
{
}

- (NSMutableOrderedSet)typeOrder
{
  return self->_typeOrder;
}

- (void)setTypeOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeOrder, 0);
  objc_storeStrong((id *)&self->_coercionBlockByType, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end