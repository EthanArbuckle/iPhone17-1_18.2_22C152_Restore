@interface PLGraphNodeValue
+ (id)entityName;
+ (id)fetchGraphNodeValuesWithName:(id)a3 andValues:(id)a4 forValueType:(id)a5 inContext:(id)a6 prefetchNode:(BOOL)a7;
+ (void)_debug_assertAllValuesAreOfType:(id)a3 inCollection:(id)a4;
- (BOOL)isInsertedDeletedOrChanged;
- (BOOL)valueDidChange;
@end

@implementation PLGraphNodeValue

- (BOOL)isInsertedDeletedOrChanged
{
  if (([(PLGraphNodeValue *)self isInserted] & 1) != 0
    || ([(PLGraphNodeValue *)self isDeleted] & 1) != 0)
  {
    return 1;
  }
  return [(PLGraphNodeValue *)self valueDidChange];
}

- (BOOL)valueDidChange
{
  v3 = [(PLGraphNodeValue *)self changedValues];
  v4 = [v3 objectForKeyedSubscript:@"stringValue"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(PLGraphNodeValue *)self changedValues];
    v7 = [v6 objectForKeyedSubscript:@"dateValue"];
    if (v7)
    {
      BOOL v5 = 1;
    }
    else
    {
      v8 = [(PLGraphNodeValue *)self changedValues];
      v9 = [v8 objectForKeyedSubscript:@"BOOLeanValue"];
      if (v9)
      {
        BOOL v5 = 1;
      }
      else
      {
        v10 = [(PLGraphNodeValue *)self changedValues];
        v11 = [v10 objectForKeyedSubscript:@"intValue"];
        if (v11)
        {
          BOOL v5 = 1;
        }
        else
        {
          v12 = [(PLGraphNodeValue *)self changedValues];
          v13 = [v12 objectForKeyedSubscript:@"floatValue"];
          BOOL v5 = v13 != 0;
        }
      }
    }
  }

  return v5;
}

+ (void)_debug_assertAllValuesAreOfType:(id)a3 inCollection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        if ([v5 isEqualToString:@"stringValue"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_13;
          }
          [MEMORY[0x1E4F28B00] currentHandler];
          v12 = uint64_t v14 = v11;
          [v12 handleFailureInMethod:a2, a1, @"PLGraphNodeValue.m", 84, @"%@ is not of the type %@", v14, v5 object file lineNumber description];
          goto LABEL_19;
        }
        if (([v5 isEqualToString:@"intValue"] & 1) != 0
          || ([v5 isEqualToString:@"floatValue"] & 1) != 0
          || [v5 isEqualToString:@"BOOLeanValue"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_13;
          }
          [MEMORY[0x1E4F28B00] currentHandler];
          v12 = uint64_t v16 = v11;
          [v12 handleFailureInMethod:a2, a1, @"PLGraphNodeValue.m", 86, @"%@ is not of the type %@", v16, v5 object file lineNumber description];
          goto LABEL_19;
        }
        if ([v5 isEqualToString:@"dateValue"])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            v12 = uint64_t v15 = v11;
            [v12 handleFailureInMethod:a2, a1, @"PLGraphNodeValue.m", 88, @"%@ is not of the type %@", v15, v5 object file lineNumber description];
LABEL_19:
          }
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v13 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = v13;
    }
    while (v13);
  }
}

+ (id)fetchGraphNodeValuesWithName:(id)a3 andValues:(id)a4 forValueType:(id)a5 inContext:(id)a6 prefetchNode:(BOOL)a7
{
  BOOL v7 = a7;
  v38[2] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1E4F1C0D0];
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = +[PLGraphNodeValue entityName];
  v17 = [v13 fetchRequestWithEntityName:v16];

  v18 = (void *)MEMORY[0x1E4F28BA0];
  long long v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"valueName", v15];

  v38[0] = v19;
  long long v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", v11, v14];

  v38[1] = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  long long v22 = [v18 andPredicateWithSubpredicates:v21];
  [v17 setPredicate:v22];

  v37[0] = @"valueName";
  v37[1] = v11;
  v37[2] = @"node";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  [v17 setPropertiesToFetch:v23];

  if (v7)
  {
    v36[0] = @"valueName";
    v36[1] = v11;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    [v17 setPropertiesToFetch:v24];

    v35 = @"node";
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    [v17 setRelationshipKeyPathsForPrefetching:v25];
  }
  id v30 = 0;
  v26 = [v12 executeFetchRequest:v17 error:&v30];
  id v27 = v30;
  if (!v26)
  {
    v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v27;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch graph node values for context %@ (ERROR: %@)", buf, 0x16u);
    }
  }
  return v26;
}

+ (id)entityName
{
  return @"GraphNodeValue";
}

@end