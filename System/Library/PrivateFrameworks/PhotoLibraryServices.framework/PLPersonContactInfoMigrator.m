@interface PLPersonContactInfoMigrator
+ (id)migrationQueue;
+ (void)migratePersonContactInfoInPhotoLibrary:(id)a3;
- (PLPersonContactInfoMigrator)init;
- (id)enumerateResultsWithIncrementalSaveUsingFetchRequest:(id)a3 inContext:(id)a4 withBlock:(id)a5;
- (void)migratePerson:(id)a3;
- (void)migratePersonContactInfoInContext:(id)a3;
- (void)migratePersonContactInfoInPhotoLibrary:(id)a3;
- (void)populateMatchingDictionaryOfPerson:(id)a3 withContact:(id)a4;
- (void)updateNameOfPerson:(id)a3 withContact:(id)a4;
@end

@implementation PLPersonContactInfoMigrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)populateMatchingDictionaryOfPerson:(id)a3 withContact:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v9 contactMatchingDictionary];

  if (!v7)
  {
    v8 = +[PLContactStoreUtilitiesWorkaround matchingDictionaryForContact:v6 contactStore:self->_contactStore];
    [v9 setContactMatchingDictionary:v8];
    ++self->_populateMatchingDictionaryCount;
  }
}

- (void)updateNameOfPerson:(id)a3 withContact:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v12 fullName];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [v12 displayName];

    if (!v9)
    {
      v10 = +[PLPerson fullNameFromContact:v6];
      v11 = +[PLPerson displayNameFromContact:v6];
      [v12 setFullName:v10];
      [v12 setDisplayName:v11];
      ++self->_updateNameCount;
    }
  }
}

- (void)migratePerson:(id)a3
{
  id v6 = a3;
  v4 = [v6 personUri];
  v5 = [(CNContactStore *)self->_contactStore unifiedContactWithIdentifier:v4 keysToFetch:self->_keysToFetch error:0];
  if (v5)
  {
    [(PLPersonContactInfoMigrator *)self updateNameOfPerson:v6 withContact:v5];
    [(PLPersonContactInfoMigrator *)self populateMatchingDictionaryOfPerson:v6 withContact:v5];
  }
  else
  {
    [v6 setPersonUri:0];
  }
}

- (id)enumerateResultsWithIncrementalSaveUsingFetchRequest:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v14 = 0;
  id v9 = [v7 executeFetchRequest:a3 error:&v14];
  id v10 = v14;
  if (v9)
  {
    uint64_t v11 = [v7 enumerateWithIncrementalSaveUsingObjects:v9 shouldRefreshAfterSave:1 withBlock:v8];

    id v10 = (id)v11;
  }
  id v12 = v10;

  return v12;
}

- (void)migratePersonContactInfoInContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v7 = +[PLPerson entityName];
  id v8 = [v5 fetchRequestWithEntityName:v7];

  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType == %d && personUri != nil", 1);
  [v8 setPredicate:v9];

  [v8 setFetchBatchSize:100];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PLPersonContactInfoMigrator_migratePersonContactInfoInContext___block_invoke;
  v21[3] = &unk_1E586F978;
  v21[4] = self;
  id v10 = [(PLPersonContactInfoMigrator *)self enumerateResultsWithIncrementalSaveUsingFetchRequest:v8 inContext:v6 withBlock:v21];

  uint64_t v11 = PLMigrationGetLog();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v10;
      id v14 = "%@ failed to migrate person contacts info: %@";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v15, v16, v14, buf, v17);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      int updateNameCount = self->_updateNameCount;
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      __int16 v24 = 1024;
      LODWORD(v25) = updateNameCount;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%@ update names for %d people", buf, 0x12u);
    }
    id v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      int populateMatchingDictionaryCount = self->_populateMatchingDictionaryCount;
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      __int16 v24 = 1024;
      LODWORD(v25) = populateMatchingDictionaryCount;
      id v14 = "%@ populate matching dictionary for %d people";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 18;
      goto LABEL_8;
    }
  }
}

uint64_t __65__PLPersonContactInfoMigrator_migratePersonContactInfoInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migratePerson:a2];
}

- (void)migratePersonContactInfoInPhotoLibrary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PLPersonContactInfoMigrator_migratePersonContactInfoInPhotoLibrary___block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performTransactionAndWait:v6];
}

void __70__PLPersonContactInfoMigrator_migratePersonContactInfoInPhotoLibrary___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) managedObjectContext];
  [v1 migratePersonContactInfoInContext:v2];
}

{
  int v2;
  PLPersonContactInfoMigrator *v3;
  BOOL v4;
  uint8_t v5[16];
  uint8_t buf[16];

  id v2 = sDidMigrate;
  PLMigrationGetLog();
  v3 = (PLPersonContactInfoMigrator *)objc_claimAutoreleasedReturnValue();
  id v4 = os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, &v3->super, OS_LOG_TYPE_DEFAULT, "Already migrated person contacts info", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, &v3->super, OS_LOG_TYPE_DEFAULT, "Migrating person contacts info", v5, 2u);
    }

    v3 = objc_alloc_init(PLPersonContactInfoMigrator);
    [(PLPersonContactInfoMigrator *)v3 migratePersonContactInfoInPhotoLibrary:*(void *)(a1 + 32)];
    sDidMigrate = 1;
  }
}

- (PLPersonContactInfoMigrator)init
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PLPersonContactInfoMigrator;
  id v2 = [(PLPersonContactInfoMigrator *)&v11 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    id v5 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v12[0] = v5;
    id v6 = [(CNContactStore *)v2->_contactStore descriptorForRequiredKeysForMatchingDictionary];
    v12[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    keysToFetch = v2->_keysToFetch;
    v2->_keysToFetch = (NSArray *)v7;

    id v9 = v2;
  }

  return v2;
}

+ (void)migratePersonContactInfoInPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [a1 migrationQueue];
  uint64_t v7 = v4;
  id v6 = v4;
  pl_dispatch_sync();
}

+ (id)migrationQueue
{
  pl_dispatch_once();
  id v2 = (void *)migrationQueue_pl_once_object_1;
  return v2;
}

void __45__PLPersonContactInfoMigrator_migrationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.personContactInfoMigrator", 0);
  v1 = (void *)migrationQueue_pl_once_object_1;
  migrationQueue_pl_once_object_1 = (uint64_t)v0;
}

@end