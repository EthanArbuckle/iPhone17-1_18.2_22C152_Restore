@interface PHAPredicateValidator
- (BOOL)validateExpression:(id)a3 error:(id *)a4;
- (BOOL)validatePredicate:(id)a3 error:(id *)a4;
- (BOOL)validateValue:(id)a3 error:(id *)a4;
- (NSSet)allowedKeyPaths;
- (void)setAllowedKeyPaths:(id)a3;
@end

@implementation PHAPredicateValidator

- (void).cxx_destruct
{
}

- (void)setAllowedKeyPaths:(id)a3
{
}

- (NSSet)allowedKeyPaths
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          if (![(PHAPredicateValidator *)self validateValue:*(void *)(*((void *)&v24 + 1) + 8 * i) error:a4])
          {
            BOOL v11 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_16:
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 1;
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__1195;
      v18 = __Block_byref_object_dispose__1196;
      id v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__PHAPredicateValidator_validateValue_error___block_invoke;
      v13[3] = &unk_1E69176A0;
      v13[4] = self;
      v13[5] = &v20;
      v13[6] = &v14;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
      if (a4) {
        *a4 = (id) v15[5];
      }
      BOOL v11 = *((unsigned char *)v21 + 24) != 0;
      _Block_object_dispose(&v14, 8);

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v11 = 1;
      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 11);
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
    }
  }

  return v11;
}

void __45__PHAPredicateValidator_validateValue_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = (void *)a1[4];
  id v16 = 0;
  int v9 = [v8 validateValue:a2 error:&v16];
  id v10 = v16;
  if (v9)
  {
    BOOL v11 = (void *)a1[4];
    id v15 = v10;
    LOBYTE(v9) = [v11 validateValue:v7 error:&v15];
    id v12 = v15;

    id v10 = v12;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
  *a4 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24) ^ 1;
  uint64_t v13 = *(void *)(a1[6] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
}

- (BOOL)validateExpression:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 expressionType];
  if (v7 != 3)
  {
    if (v7)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v8 = [v6 constantValue];
      BOOL v9 = [(PHAPredicateValidator *)self validateValue:v8 error:a4];

      if (v9)
      {
        char v10 = 1;
        goto LABEL_12;
      }
    }
    char v10 = 0;
    goto LABEL_12;
  }
  BOOL v11 = [v6 keyPath];
  if (v11)
  {
    id v12 = [(PHAPredicateValidator *)self allowedKeyPaths];
    uint64_t v13 = [v6 keyPath];
    char v10 = [v12 containsObject:v13];
  }
  else
  {
    char v10 = 0;
  }

LABEL_12:
  return v10;
}

- (BOOL)validatePredicate:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_msgSend(v6, "subpredicates", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          if (![(PHAPredicateValidator *)self validatePredicate:*(void *)(*((void *)&v16 + 1) + 8 * i) error:a4])
          {
            BOOL v12 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v13 = [v7 leftExpression];
    if ([(PHAPredicateValidator *)self validateExpression:v13 error:a4])
    {
      uint64_t v14 = [v7 rightExpression];
      BOOL v12 = [(PHAPredicateValidator *)self validateExpression:v14 error:a4];
    }
    else
    {
      BOOL v12 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 11);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_20:

  return v12;
}

@end