@interface PGGraphSocialGroupTranslator
+ (Class)entityClass;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphSocialGroupTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  v10 = [v8 array];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __106__PGGraphSocialGroupTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
  v19 = &unk_1E68EDF10;
  v20 = @"socialGroupVerifiedType";
  id v21 = v7;
  v22 = self;
  id v11 = v10;
  id v23 = v11;
  id v12 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:&v16];

  if (objc_msgSend(v11, "count", v16, v17, v18, v19))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Update %ld social groups", buf, 0xCu);
    }
    id v14 = v11;
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __106__PGGraphSocialGroupTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v5 containsObject:*(void *)(a1 + 32)] & 1) != 0
    || [*(id *)(a1 + 40) membersOrAssetContainmentForSocialGroupChangedWithLocalIdentifier:v8])
  {
    v6 = [(id)objc_opt_class() uuidFromLocalIdentifier:v8];
    id v7 = [[PGGraphSocialGroupChange alloc] initWithSocialGroupUUID:v6 propertyNames:v5];
    [*(id *)(a1 + 56) addObject:v7];
  }
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Delete %ld social groups", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  v6 = [[PGGraphSocialGroupsDeletion alloc] initWithSocialGroupUUIDs:v5];
  id v9 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Insert %ld new social groups", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  v6 = [[PGGraphSocialGroupsInsertion alloc] initWithSocialGroupUUIDs:v5];
  id v9 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

@end