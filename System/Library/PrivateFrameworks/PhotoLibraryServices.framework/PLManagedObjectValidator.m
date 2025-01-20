@interface PLManagedObjectValidator
+ (BOOL)validateAllObjectsUsingManagedObjectContext:(id)a3 resultHandler:(id)a4;
+ (BOOL)validateAllObjectsWithEntityClass:(Class)a3 inManagedObjectContext:(id)a4 resultHandler:(id)a5;
+ (id)_entityClassesToValidate;
+ (id)validateManagedObject:(id)a3;
@end

@implementation PLManagedObjectValidator

+ (id)_entityClassesToValidate
{
  v4[45] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v4[20] = objc_opt_class();
  v4[21] = objc_opt_class();
  v4[22] = objc_opt_class();
  v4[23] = objc_opt_class();
  v4[24] = objc_opt_class();
  v4[25] = objc_opt_class();
  v4[26] = objc_opt_class();
  v4[27] = objc_opt_class();
  v4[28] = objc_opt_class();
  v4[29] = objc_opt_class();
  v4[30] = objc_opt_class();
  v4[31] = objc_opt_class();
  v4[32] = objc_opt_class();
  v4[33] = objc_opt_class();
  v4[34] = objc_opt_class();
  v4[35] = objc_opt_class();
  v4[36] = objc_opt_class();
  v4[37] = objc_opt_class();
  v4[38] = objc_opt_class();
  v4[39] = objc_opt_class();
  v4[40] = objc_opt_class();
  v4[41] = objc_opt_class();
  v4[42] = objc_opt_class();
  v4[43] = objc_opt_class();
  v4[44] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:45];
  return v2;
}

+ (BOOL)validateAllObjectsUsingManagedObjectContext:(id)a3 resultHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = objc_msgSend(a1, "_entityClassesToValidate", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    int v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v12 &= +[PLManagedObjectValidator validateAllObjectsWithEntityClass:*(void *)(*((void *)&v15 + 1) + 8 * i) inManagedObjectContext:v6 resultHandler:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

+ (BOOL)validateAllObjectsWithEntityClass:(Class)a3 inManagedObjectContext:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  if (a3 && v8 && [(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v11 = [(objc_class *)a3 entityName];
    int v12 = [v10 fetchRequestWithEntityName:v11];

    id v19 = a1;
    uint64_t v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__PLManagedObjectValidator_validateAllObjectsWithEntityClass_inManagedObjectContext_resultHandler___block_invoke;
    v16[3] = &unk_1E58746D8;
    long long v18 = &v21;
    id v17 = v9;
    id v13 = (id)[v8 enumerateObjectsFromFetchRequest:v12 count:&v20 usingDefaultBatchSizeWithBlock:v16];
  }
  char v14 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __99__PLManagedObjectValidator_validateAllObjectsWithEntityClass_inManagedObjectContext_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 48) validateManagedObject:a2];
  if (([v3 status] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)validateManagedObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(PLManagedObjectValidationResult);
  [(PLManagedObjectValidationResult *)v4 setStatus:1];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 entity];
  id v6 = [v5 attributesByName];
  id v7 = [v6 allKeys];

  id v8 = [(id)objc_opt_class() attributeValidationRules];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = [v8 objectForKeyedSubscript:v14];
        if (!v15)
        {
          long long v15 = _PLPropertyValidationRuleMake(0, v14, 0, 0, 0, 0);
        }
        id v22 = 0;
        uint64_t v16 = [v15 evaluateWithObject:v3 outMessage:&v22];
        id v17 = v22;
        [(PLManagedObjectValidationResult *)v4 setStatus:v16];
        if (v17)
        {
          if ([(PLManagedObjectValidationResult *)v4 status]) {
            long long v18 = v20;
          }
          else {
            long long v18 = v21;
          }
          [v18 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  [(PLManagedObjectValidationResult *)v4 setErrorMessages:v21];
  [(PLManagedObjectValidationResult *)v4 setInfoMessages:v20];
  [(PLManagedObjectValidationResult *)v4 setValidatedObject:v3];

  return v4;
}

@end