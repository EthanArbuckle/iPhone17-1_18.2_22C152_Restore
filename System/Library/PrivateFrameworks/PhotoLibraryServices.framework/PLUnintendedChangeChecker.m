@interface PLUnintendedChangeChecker
+ (BOOL)shouldCheckForUnintendedChanges;
+ (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4;
+ (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4;
- (PLUnintendedChangeChecker)init;
- (void)_checkForUnintendedCPLChangesOnObject:(id)a3 withBlock:(id)a4;
- (void)_checkForUnintendedChangesOnObject:(id)a3 withBlock:(id)a4;
- (void)_checkForUnintendedChangesOnObject:(id)a3 withEntity:(id)a4 unexpectedKeys:(id)a5 block:(id)a6;
- (void)_checkForUnintendedMomentChangesOnObject:(id)a3 withBlock:(id)a4;
- (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4;
- (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4;
@end

@implementation PLUnintendedChangeChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unexpectedCPLAssetKeys, 0);
  objc_storeStrong((id *)&self->_unexpectedMomentAdditionalAssetAttributeKeys, 0);
  objc_storeStrong((id *)&self->_unexpectedMomentAssetKeys, 0);
}

- (void)_checkForUnintendedChangesOnObject:(id)a3 withEntity:(id)a4 unexpectedKeys:(id)a5 block:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *, void *))a6;
  v13 = [v9 entity];
  int v14 = [v13 isKindOfEntity:v10];

  if (v14)
  {
    id v28 = v10;
    v30 = v9;
    v15 = [v9 changedValues];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v29 = v15;
    v17 = [v15 allKeys];
    v18 = [v16 setWithArray:v17];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v11;
    id obj = v11;
    uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if ([v18 containsObject:v23])
          {
            v24 = [v29 objectForKeyedSubscript:v23];
            v25 = [v30 managedObjectContext];
            v26 = [v25 name];
            v12[2](v12, v23, v24, v26);
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v20);
    }

    id v9 = v30;
    id v11 = v27;
    id v10 = v28;
  }
}

- (void)_checkForUnintendedCPLChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PLManagedAsset entity];
  [(PLUnintendedChangeChecker *)self _checkForUnintendedChangesOnObject:v7 withEntity:v8 unexpectedKeys:self->_unexpectedCPLAssetKeys block:v6];
}

- (void)_checkForUnintendedMomentChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PLManagedAsset entity];
  [(PLUnintendedChangeChecker *)self _checkForUnintendedChangesOnObject:v7 withEntity:v8 unexpectedKeys:self->_unexpectedMomentAssetKeys block:v6];

  id v9 = +[PLAdditionalAssetAttributes entity];
  [(PLUnintendedChangeChecker *)self _checkForUnintendedChangesOnObject:v7 withEntity:v9 unexpectedKeys:self->_unexpectedMomentAdditionalAssetAttributeKeys block:v6];
}

- (void)_checkForUnintendedChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  id v8 = [v10 managedObjectContext];
  id v9 = [v8 name];

  if ([v9 hasPrefix:PLDatabaseContextNameMomentLibrary])
  {
    [(PLUnintendedChangeChecker *)self _checkForUnintendedMomentChangesOnObject:v10 withBlock:v6];
  }
  else if ([v9 hasPrefix:PLDatabaseContextNameCPLLibrary])
  {
    [(PLUnintendedChangeChecker *)self _checkForUnintendedCPLChangesOnObject:v10 withBlock:v6];
  }
}

- (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 sourceObject];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __80__PLUnintendedChangeChecker_checkForUnintendedChangeOnMergeConflicts_withBlock___block_invoke;
        v16[3] = &unk_1E5871BF0;
        id v14 = v7;
        v16[4] = v12;
        id v17 = v14;
        [(PLUnintendedChangeChecker *)self _checkForUnintendedChangesOnObject:v13 withBlock:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

uint64_t __80__PLUnintendedChangeChecker_checkForUnintendedChangeOnMergeConflicts_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, a4, *(void *)(a1 + 32));
}

- (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [a3 updatedObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __76__PLUnintendedChangeChecker_checkForUnintendedChangesDuringeSave_withBlock___block_invoke;
        v14[3] = &unk_1E5871BF0;
        id v13 = v6;
        v14[4] = v12;
        id v15 = v13;
        [(PLUnintendedChangeChecker *)self _checkForUnintendedChangesOnObject:v12 withBlock:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __76__PLUnintendedChangeChecker_checkForUnintendedChangesDuringeSave_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, a4, *(void *)(a1 + 32));
}

- (PLUnintendedChangeChecker)init
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PLUnintendedChangeChecker;
  v2 = [(PLUnintendedChangeChecker *)&v11 init];
  if (v2)
  {
    v14[0] = @"uuid";
    v14[1] = @"cloudAssetGUID";
    v14[2] = @"videoCpDurationValue";
    v14[3] = @"favorite";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    unexpectedMomentAssetKeys = v2->_unexpectedMomentAssetKeys;
    v2->_unexpectedMomentAssetKeys = (NSArray *)v3;

    id v13 = @"assetDescription";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    unexpectedMomentAdditionalAssetAttributeKeys = v2->_unexpectedMomentAdditionalAssetAttributeKeys;
    v2->_unexpectedMomentAdditionalAssetAttributeKeys = (NSArray *)v5;

    uint64_t v12 = @"moment";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    unexpectedCPLAssetKeys = v2->_unexpectedCPLAssetKeys;
    v2->_unexpectedCPLAssetKeys = (NSArray *)v7;

    uint64_t v9 = v2;
  }

  return v2;
}

+ (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  if ([a1 shouldCheckForUnintendedChanges])
  {
    uint64_t v8 = objc_alloc_init(PLUnintendedChangeChecker);
    [(PLUnintendedChangeChecker *)v8 checkForUnintendedChangeOnMergeConflicts:v9 withBlock:v6];
  }
}

+ (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  if ([a1 shouldCheckForUnintendedChanges])
  {
    uint64_t v8 = objc_alloc_init(PLUnintendedChangeChecker);
    [(PLUnintendedChangeChecker *)v8 checkForUnintendedChangesDuringeSave:v9 withBlock:v6];
  }
}

+ (BOOL)shouldCheckForUnintendedChanges
{
  int v2 = MEMORY[0x19F38BDA0](a1, a2);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"PLEnableUnintendedChangeChecks"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

@end