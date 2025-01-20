@interface PDSCDCacheContainer
- (BOOL)_deleteEntry:(id)a3 context:(id)a4 withError:(id *)a5;
- (BOOL)_storeEntry:(id)a3 transitionBlock:(id)a4 context:(id)a5 withError:(id *)a6;
- (BOOL)_updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5;
- (BOOL)_updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6;
- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5;
- (BOOL)deleteEntry:(id)a3 withError:(id *)a4;
- (BOOL)hasActiveEntries;
- (BOOL)hasPendingEntries;
- (BOOL)storeEntries:(id)a3 transitionBlock:(id)a4 deleteEntries:(id)a5 withError:(id *)a6;
- (BOOL)storeEntry:(id)a3 transitionBlock:(id)a4 withError:(id *)a5;
- (BOOL)storeEntry:(id)a3 withError:(id *)a4;
- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 withError:(id *)a5;
- (NSPersistentContainer)container;
- (NSURL)containingPath;
- (PDSCDCacheContainer)initWithContainingPath:(id)a3;
- (id)_cdRegistrationsMatchingEntry:(id)a3 inContext:(id)a4;
- (id)_cdRegistrationsMatchingUser:(id)a3 withClientID:(id)a4 inContext:(id)a5;
- (id)_cdUsersMatchingUserID:(id)a3 userType:(signed __int16)a4 inContext:(id)a5;
- (id)_entriesFromRegistrations:(id)a3 inContext:(id)a4;
- (id)_loadUsersIncludingOnlyActive:(BOOL)a3;
- (id)_usersForClientID:(id)a3 activeOnly:(BOOL)a4;
- (id)allStoredValues;
- (id)dataForKey:(id)a3;
- (id)loadAllActiveUsers;
- (id)loadAllActiveUsersForClientID:(id)a3;
- (id)loadAllEntries;
- (id)loadAllEntriesForClientID:(id)a3;
- (id)loadAllEntriesUser:(id)a3;
- (id)loadAllEntriesUser:(id)a3 withClientID:(id)a4;
- (id)loadAllUsers;
- (id)loadAllUsersForClientID:(id)a3;
- (id)loadPendingEntries;
- (id)loadWithError:(id *)a3;
- (id)numberForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)_KVEntryForKey:(id)a3 withBlock:(id)a4;
- (void)_syncBlockWithContext:(id)a3;
- (void)deleteCache;
- (void)setContainer:(id)a3;
- (void)setContainingPath:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setNumber:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation PDSCDCacheContainer

- (PDSCDCacheContainer)initWithContainingPath:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PDSCDCache.m", 54, @"Invalid parameter not satisfying: %@", @"containingPath" object file lineNumber description];
  }
  v7 = [v6 absoluteString];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PDSCDCache.m", 55, @"Invalid parameter not satisfying: %@", @"containingPath.absoluteString.length > 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PDSCDCacheContainer;
  v9 = [(PDSCDCacheContainer *)&v14 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_containingPath, a3);
  }

  return v10;
}

- (id)loadWithError:(id *)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  v5 = [(PDSCDCacheContainer *)self container];
  if (!v5)
  {
    id v6 = (void *)MEMORY[0x263EFF298];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    v9 = [v6 mergedModelFromBundles:v8];

    v10 = [v9 entities];
    LOBYTE(v8) = [v10 count] == 0;

    if (v8)
    {
      v13 = [NSString stringWithFormat:@"Loaded model has no entities"];
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F5B9F8];
      uint64_t v30 = *MEMORY[0x263F07F80];
      v31 = v13;
      objc_super v14 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v18 = [v16 errorWithDomain:v17 code:-404 userInfo:v14];
      v19 = (void *)v25[5];
      v25[5] = v18;

      v5 = 0;
    }
    else
    {
      v5 = [MEMORY[0x263EFF2E8] persistentContainerWithName:@"PDSCDCache" managedObjectModel:v9];
      v11 = [(PDSCDCacheContainer *)self containingPath];
      v12 = [v5 name];
      v13 = [v11 URLByAppendingPathComponent:v12];

      objc_super v14 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v13];
      [v14 setType:*MEMORY[0x263EFF168]];
      v32 = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      [v5 setPersistentStoreDescriptions:v15];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __37__PDSCDCacheContainer_loadWithError___block_invoke;
      v23[3] = &unk_2645C8ED8;
      v23[4] = &v24;
      [v5 loadPersistentStoresWithCompletionHandler:v23];
      [(PDSCDCacheContainer *)self setContainer:v5];
    }
  }
  v20 = (void *)v25[5];
  if (v20)
  {
    v21 = 0;
    if (a3) {
      *a3 = v20;
    }
  }
  else
  {
    v21 = [[PDSCDCacheReferenceProxy alloc] initWithCacheContainer:self persistentContainer:v5];
  }

  _Block_object_dispose(&v24, 8);
  return v21;
}

void __37__PDSCDCacheContainer_loadWithError___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)loadAllEntriesUser:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__PDSCDCacheContainer_loadAllEntriesUser___block_invoke;
  v8[3] = &unk_2645C8F00;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v8];
  id v6 = (void *)[(id)v12[5] copy];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __42__PDSCDCacheContainer_loadAllEntriesUser___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v9 = [v3 _cdRegistrationsMatchingUser:v4 withClientID:0 inContext:v5];
  uint64_t v6 = [*(id *)(a1 + 32) _entriesFromRegistrations:v9 inContext:v5];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)loadAllEntriesUser:(id)a3 withClientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  objc_super v14 = __55__PDSCDCacheContainer_loadAllEntriesUser_withClientID___block_invoke;
  v15 = &unk_2645C8F28;
  id v16 = self;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  v19 = &v20;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:&v12];
  v10 = objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15, v16);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __55__PDSCDCacheContainer_loadAllEntriesUser_withClientID___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v10 = [v3 _cdRegistrationsMatchingUser:v4 withClientID:v5 inContext:v6];
  uint64_t v7 = [*(id *)(a1 + 32) _entriesFromRegistrations:v10 inContext:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)loadAllEntriesForClientID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PDSCDCacheContainer_loadAllEntriesForClientID___block_invoke;
  v8[3] = &unk_2645C8F50;
  id v5 = v4;
  id v10 = self;
  uint64_t v11 = &v12;
  id v9 = v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v8];
  id v6 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __49__PDSCDCacheContainer_loadAllEntriesForClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = +[PDSCDRegistration fetchRequest];
  id v4 = +[PDSCDRegistration registrationsForClientID:*(void *)(a1 + 32)];
  [v9 setPredicate:v4];

  id v5 = [v3 executeFetchRequest:v9 error:0];
  uint64_t v6 = [*(id *)(a1 + 40) _entriesFromRegistrations:v5 inContext:v3];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)loadAllActiveUsersForClientID:(id)a3
{
  return [(PDSCDCacheContainer *)self _usersForClientID:a3 activeOnly:1];
}

- (id)loadAllUsersForClientID:(id)a3
{
  return [(PDSCDCacheContainer *)self _usersForClientID:a3 activeOnly:0];
}

- (id)loadAllActiveUsers
{
  return [(PDSCDCacheContainer *)self _usersForClientID:0 activeOnly:1];
}

- (id)loadAllUsers
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__PDSCDCacheContainer_loadAllUsers__block_invoke;
  v4[3] = &unk_2645C8F78;
  v4[4] = &v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v4];
  v2 = (void *)[(id)v6[5] copy];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__PDSCDCacheContainer_loadAllUsers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PDSCDUser fetchRequest];
  uint64_t v5 = [v3 executeFetchRequest:v4 error:0];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v16 = [v15 user];
        if (v16)
        {
          id v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          id v18 = v16;
        }
        else
        {
          id v17 = v9;
          id v18 = v15;
        }
        [v17 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [v3 deleteObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v21);
    }

    uint64_t v24 = 0;
    [v3 save:&v24];
  }
}

- (id)loadAllEntries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__PDSCDCacheContainer_loadAllEntries__block_invoke;
  v4[3] = &unk_2645C8FA0;
  v4[4] = self;
  void v4[5] = &v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v4];
  v2 = (void *)[(id)v6[5] copy];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __37__PDSCDCacheContainer_loadAllEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PDSCDRegistration fetchRequest];
  id v8 = [v3 executeFetchRequest:v4 error:0];

  uint64_t v5 = [*(id *)(a1 + 32) _entriesFromRegistrations:v8 inContext:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)loadPendingEntries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__PDSCDCacheContainer_loadPendingEntries__block_invoke;
  v4[3] = &unk_2645C8FA0;
  v4[4] = self;
  void v4[5] = &v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v4];
  v2 = (void *)[(id)v6[5] copy];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__PDSCDCacheContainer_loadPendingEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = +[PDSCDRegistration fetchRequest];
  id v4 = +[PDSCDRegistration pendingRegistrations];
  [v9 setPredicate:v4];

  uint64_t v5 = [v3 executeFetchRequest:v9 error:0];
  uint64_t v6 = [*(id *)(a1 + 32) _entriesFromRegistrations:v5 inContext:v3];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)hasPendingEntries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__PDSCDCacheContainer_hasPendingEntries__block_invoke;
  v4[3] = &unk_2645C8F78;
  v4[4] = &v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v4];
  BOOL v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__PDSCDCacheContainer_hasPendingEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[PDSCDRegistration fetchRequest];
  id v4 = +[PDSCDRegistration pendingRegistrations];
  [v6 setPredicate:v4];

  [v6 setResultType:4];
  uint64_t v5 = [v3 countForFetchRequest:v6 error:0];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

- (BOOL)hasActiveEntries
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__PDSCDCacheContainer_hasActiveEntries__block_invoke;
  v4[3] = &unk_2645C8F78;
  v4[4] = &v5;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v4];
  BOOL v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__PDSCDCacheContainer_hasActiveEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[PDSCDRegistration fetchRequest];
  id v4 = +[PDSCDRegistration activeRegistrations];
  [v6 setPredicate:v4];

  [v6 setResultType:4];
  uint64_t v5 = [v3 countForFetchRequest:v6 error:0];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

- (BOOL)storeEntry:(id)a3 withError:(id *)a4
{
  return [(PDSCDCacheContainer *)self storeEntry:a3 transitionBlock:&__block_literal_global_3 withError:a4];
}

uint64_t __44__PDSCDCacheContainer_storeEntry_withError___block_invoke()
{
  return 0;
}

- (BOOL)storeEntry:(id)a3 transitionBlock:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__PDSCDCacheContainer_storeEntry_transitionBlock_withError___block_invoke;
  v15[3] = &unk_2645C8FE8;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v18 = &v20;
  id v19 = &v26;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v15];
  if (a5)
  {
    uint64_t v12 = (void *)v21[5];
    if (v12) {
      *a5 = v12;
    }
  }
  if (*((unsigned char *)v27 + 24)) {
    BOOL v13 = v21[5] == 0;
  }
  else {
    BOOL v13 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __60__PDSCDCacheContainer_storeEntry_transitionBlock_withError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  int v8 = [v4 _storeEntry:v5 transitionBlock:v6 context:v3 withError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    uint64_t v9 = *(void *)(a1[7] + 8);
    id v11 = *(id *)(v9 + 40);
    char v10 = [v3 save:&v11];
    objc_storeStrong((id *)(v9 + 40), v11);
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v10;
  }
}

- (BOOL)storeEntries:(id)a3 transitionBlock:(id)a4 deleteEntries:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__PDSCDCacheContainer_storeEntries_transitionBlock_deleteEntries_withError___block_invoke;
  v19[3] = &unk_2645C9010;
  id v13 = v10;
  id v20 = v13;
  uint64_t v21 = self;
  id v14 = v11;
  id v23 = v14;
  uint64_t v24 = &v26;
  id v15 = v12;
  id v22 = v15;
  id v25 = &v32;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v19];
  if (a6)
  {
    id v16 = (void *)v27[5];
    if (v16) {
      *a6 = v16;
    }
  }
  if (*((unsigned char *)v33 + 24)) {
    BOOL v17 = v27[5] == 0;
  }
  else {
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

void __76__PDSCDCacheContainer_storeEntries_transitionBlock_deleteEntries_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v32 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * v8);
      id v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      obuint64_t j = *(id *)(v12 + 40);
      int v13 = [v10 _storeEntry:v9 transitionBlock:v11 context:v3 withError:&obj];
      objc_storeStrong((id *)(v12 + 40), obj);
      if (!v13) {
        goto LABEL_18;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v14 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
LABEL_11:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v27 != v16) {
        objc_enumerationMutation(v4);
      }
      uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * v17);
      id v19 = *(void **)(a1 + 40);
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
      id v25 = *(id *)(v20 + 40);
      int v21 = [v19 _deleteEntry:v18 context:v3 withError:&v25];
      objc_storeStrong((id *)(v20 + 40), v25);
      if (!v21) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v15) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:

    [v3 rollback];
    goto LABEL_19;
  }
LABEL_17:

  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id v24 = *(id *)(v22 + 40);
  char v23 = [v3 save:&v24];
  objc_storeStrong((id *)(v22 + 40), v24);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v23;
LABEL_19:
}

- (BOOL)deleteEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__PDSCDCacheContainer_deleteEntry_withError___block_invoke;
  v11[3] = &unk_2645C9038;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  int v13 = &v15;
  uint64_t v14 = &v21;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v11];
  if (a4)
  {
    uint64_t v8 = (void *)v16[5];
    if (v8) {
      *a4 = v8;
    }
  }
  if (*((unsigned char *)v22 + 24)) {
    BOOL v9 = v16[5] == 0;
  }
  else {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__PDSCDCacheContainer_deleteEntry_withError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  int v7 = [v4 _deleteEntry:v5 context:v3 withError:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v10 = *(id *)(v8 + 40);
    char v9 = [v3 save:&v10];
    objc_storeStrong((id *)(v8 + 40), v10);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v9;
  }
}

- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__PDSCDCacheContainer_deleteEntriesForUser_withState_withError___block_invoke;
  v13[3] = &unk_2645C9060;
  v13[4] = self;
  id v9 = v8;
  unsigned __int8 v17 = a4;
  id v14 = v9;
  uint64_t v15 = &v18;
  uint64_t v16 = &v24;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v13];
  if (a5)
  {
    id v10 = (void *)v19[5];
    if (v10) {
      *a5 = v10;
    }
  }
  if (*((unsigned char *)v25 + 24)) {
    BOOL v11 = v19[5] == 0;
  }
  else {
    BOOL v11 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __64__PDSCDCacheContainer_deleteEntriesForUser_withState_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _cdRegistrationsMatchingUser:*(void *)(a1 + 40) withClientID:0 inContext:v3];
  [*(id *)(a1 + 32) _entriesFromRegistrations:v4 inContext:v3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 state] == *(unsigned __int8 *)(a1 + 64))
        {
          BOOL v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
          obuint64_t j = *(id *)(v12 + 40);
          char v13 = [v11 _deleteEntry:v10 context:v3 withError:&obj];
          objc_storeStrong((id *)(v12 + 40), obj);
          if ((v13 & 1) == 0)
          {

            [v3 rollback];
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(id *)(v14 + 40);
  char v15 = [v3 save:&v16];
  objc_storeStrong((id *)(v14 + 40), v16);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
LABEL_12:
}

- (void)deleteCache
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v2 = [(PDSCDCacheContainer *)self container];
  if (v2)
  {
    id v3 = pds_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "Deleting PDS Core data stores!", buf, 2u);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(v2, "persistentStoreDescriptions", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
          id v10 = [v2 persistentStoreCoordinator];
          BOOL v11 = [v9 URL];
          uint64_t v12 = [v9 type];
          [v10 destroyPersistentStoreAtURL:v11 withType:v12 options:0 error:0];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_storeEntry:(id)a3 transitionBlock:(id)a4 context:(id)a5 withError:(id *)a6
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v70 = self;
  id v71 = a5;
  -[PDSCDCacheContainer _cdRegistrationsMatchingEntry:inContext:](self, "_cdRegistrationsMatchingEntry:inContext:", v10);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (!v12) {
    goto LABEL_22;
  }
  uint64_t v13 = v12;
  v68 = a6;
  id v69 = v11;
  id v72 = 0;
  long long v14 = 0;
  uint64_t v15 = *(void *)v75;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v75 != v15) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v17 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      long long v18 = [v17 user];
      uint64_t v19 = [v18 user];
      long long v20 = [v10 user];
      int v21 = [v19 isEqualToUser:v20];

      if (v21)
      {
        int v22 = [v17 entryState];
        if (v22 == [v10 state])
        {
          id v23 = v17;

          long long v14 = v23;
        }
        else if (v72)
        {
          [v17 setUser:0];
          [v71 deleteObject:v17];
        }
        else
        {
          id v72 = v17;
        }
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  }
  while (v13);
  if (!v14)
  {
    long long v28 = v68;
    id v11 = v69;
    if (v72)
    {
      v36 = [v72 clientID];
      uint64_t v37 = [v10 clientID];
      int v38 = [v36 isEqualToString:v37];

      if (v38)
      {
        v39 = v72;
        if (v69
          && (*((unsigned int (**)(id, void, uint64_t))v69 + 2))(v69, [v72 entryState], objc_msgSend(v10, "state")))
        {
          objc_msgSend(v72, "setEntryState:", objc_msgSend(v10, "state"));
          BOOL v40 = 0;
          id v41 = 0;
LABEL_25:
          long long v14 = 0;
          goto LABEL_37;
        }
        v62 = NSString;
        [v72 entryState];
        v63 = PDSStringForEntryState();
        [v10 state];
        v64 = PDSStringForEntryState();
        v55 = [v62 stringWithFormat:@"Invalid transition from %@ to %@", v63, v64];

        v65 = (void *)MEMORY[0x263F087E8];
        uint64_t v66 = *MEMORY[0x263F5B9F8];
        uint64_t v80 = *MEMORY[0x263F07F80];
        v81 = v55;
        v58 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        v59 = v65;
        uint64_t v60 = v66;
        uint64_t v61 = -402;
      }
      else
      {
        v52 = NSString;
        v53 = [0 clientID];
        v54 = [v10 clientID];
        v55 = [v52 stringWithFormat:@"Existing entry has client ID \"%@\", trying to store with \"%@\"", v53, v54];

        v56 = (void *)MEMORY[0x263F087E8];
        uint64_t v57 = *MEMORY[0x263F5B9F8];
        uint64_t v78 = *MEMORY[0x263F07F80];
        v79 = v55;
        v58 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        v59 = v56;
        uint64_t v60 = v57;
        uint64_t v61 = -401;
      }
      id v41 = [v59 errorWithDomain:v60 code:v61 userInfo:v58];

      goto LABEL_33;
    }
LABEL_22:
    v42 = +[PDSCDRegistration registrationFromEntry:v10 insertIntoManagedObjectContext:v71];
    v43 = [v10 user];
    v44 = [v43 userID];
    v45 = [v10 user];
    v46 = -[PDSCDCacheContainer _cdUsersMatchingUserID:userType:inContext:](v70, "_cdUsersMatchingUserID:userType:inContext:", v44, [v45 userType], v71);

    if (!v46)
    {
      v47 = [v10 user];
      v46 = +[PDSCDUser userFromUser:v47 insertIntoManagedObjectContext:v71];
    }
    [v42 setUser:v46];

    BOOL v40 = 0;
    id v41 = 0;
    v39 = 0;
    goto LABEL_25;
  }
  uint64_t v24 = [v14 clientID];
  id v25 = [v10 clientID];
  int v26 = [v24 isEqualToString:v25];

  char v27 = NSString;
  long long v28 = v68;
  id v11 = v69;
  if (v26)
  {
    long long v29 = [NSString stringWithFormat:@"The entry already exists"];
    long long v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F5B9F8];
    uint64_t v84 = *MEMORY[0x263F07F80];
    v85 = v29;
    long long v32 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    long long v33 = v30;
    uint64_t v34 = v31;
    uint64_t v35 = -400;
  }
  else
  {
    v48 = [v14 clientID];
    v49 = [v10 clientID];
    long long v29 = [v27 stringWithFormat:@"Existing entry has client ID \"%@\", trying to store with \"%@\"", v48, v49];

    v50 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F5B9F8];
    uint64_t v82 = *MEMORY[0x263F07F80];
    v83 = v29;
    long long v32 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    long long v33 = v50;
    uint64_t v34 = v51;
    uint64_t v35 = -401;
  }
  id v41 = [v33 errorWithDomain:v34 code:v35 userInfo:v32];

  if (v72) {
    objc_msgSend(v71, "deleteObject:");
  }
  else {
    id v72 = 0;
  }
LABEL_33:
  BOOL v40 = v41 != 0;
  if (v28 && v41)
  {
    id v41 = v41;
    *long long v28 = v41;
    BOOL v40 = 1;
  }
  v39 = v72;
LABEL_37:

  return !v40;
}

- (BOOL)_deleteEntry:(id)a3 context:(id)a4 withError:(id *)a5
{
  v51[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v38 = a4;
  v39 = v8;
  id v9 = -[PDSCDCacheContainer _cdRegistrationsMatchingEntry:inContext:](self, "_cdRegistrationsMatchingEntry:inContext:", v8);
  if ([v9 count]) {
    goto LABEL_2;
  }
  long long v33 = [NSString stringWithFormat:@"Nothing to delete"];
  uint64_t v34 = (void *)MEMORY[0x263F087E8];
  uint64_t v35 = *MEMORY[0x263F5B9F8];
  uint64_t v50 = *MEMORY[0x263F07F80];
  v51[0] = v33;
  v36 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
  id v30 = [v34 errorWithDomain:v35 code:-403 userInfo:v36];

  if (!v30)
  {
LABEL_2:
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v37 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          unsigned __int8 v17 = [v16 user];
          long long v18 = [v17 user];
          uint64_t v19 = [v39 user];
          int v20 = [v18 isEqual:v19];

          if (v20)
          {
            int v21 = [v16 user];
            [v10 addObject:v21];

            [v16 setUser:0];
            [v38 deleteObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v13);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          char v27 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          long long v28 = [v27 registrations];
          uint64_t v29 = [v28 count];

          if (!v29) {
            [v38 deleteObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v24);
    }

    id v30 = 0;
    BOOL v31 = 1;
    id v9 = v37;
  }
  else if (a5)
  {
    id v30 = v30;
    BOOL v31 = 0;
    *a5 = v30;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 withError:(id *)a5
{
  return [(PDSCDCacheContainer *)self _updateEntryState:a3 forUser:a4 clientID:0 withError:a5];
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__PDSCDCacheContainer_setNumber_forKey___block_invoke;
  v8[3] = &unk_2645C9088;
  id v9 = v6;
  id v7 = v6;
  [(PDSCDCacheContainer *)self _KVEntryForKey:a4 withBlock:v8];
}

void __40__PDSCDCacheContainer_setNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setNumValue:v2];
  [v3 setStringValue:0];
  [v3 setDataValue:0];
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__PDSCDCacheContainer_numberForKey___block_invoke;
  v7[3] = &unk_2645C90B0;
  v7[4] = &v8;
  [(PDSCDCacheContainer *)self _KVEntryForKey:v4 withBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __36__PDSCDCacheContainer_numberForKey___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 numValue];
  return MEMORY[0x270F9A758]();
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__PDSCDCacheContainer_setString_forKey___block_invoke;
  v8[3] = &unk_2645C9088;
  id v9 = v6;
  id v7 = v6;
  [(PDSCDCacheContainer *)self _KVEntryForKey:a4 withBlock:v8];
}

void __40__PDSCDCacheContainer_setString_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setNumValue:0];
  [v3 setStringValue:*(void *)(a1 + 32)];
  [v3 setDataValue:0];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__PDSCDCacheContainer_stringForKey___block_invoke;
  v7[3] = &unk_2645C90B0;
  v7[4] = &v8;
  [(PDSCDCacheContainer *)self _KVEntryForKey:v4 withBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __36__PDSCDCacheContainer_stringForKey___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 stringValue];
  return MEMORY[0x270F9A758]();
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__PDSCDCacheContainer_setData_forKey___block_invoke;
  v8[3] = &unk_2645C9088;
  id v9 = v6;
  id v7 = v6;
  [(PDSCDCacheContainer *)self _KVEntryForKey:a4 withBlock:v8];
}

void __38__PDSCDCacheContainer_setData_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setNumValue:0];
  [v3 setStringValue:0];
  [v3 setDataValue:*(void *)(a1 + 32)];
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__PDSCDCacheContainer_dataForKey___block_invoke;
  v7[3] = &unk_2645C90B0;
  v7[4] = &v8;
  [(PDSCDCacheContainer *)self _KVEntryForKey:v4 withBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __34__PDSCDCacheContainer_dataForKey___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 dataValue];
  return MEMORY[0x270F9A758]();
}

- (id)allStoredValues
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = (id)0xAAAAAAAAAAAAAAAALL;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__PDSCDCacheContainer_allStoredValues__block_invoke;
  v5[3] = &unk_2645C8F78;
  v5[4] = &v6;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v5];
  id v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__PDSCDCacheContainer_allStoredValues__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PDSCDKV fetchRequest];
  id v21 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v21];
  id v16 = v21;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 key];

        if (v12)
        {
          id v13 = [v11 stringValue];
          if (v13
            || ([v11 dataValue], (id v13 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v11 numValue], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
            uint64_t v15 = [v11 key];
            [v14 setObject:v13 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
}

- (id)_entriesFromRegistrations:(id)a3 inContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v16 = [v15 entryWithUserCache:v9];
        if (v16)
        {
          long long v17 = v7;
          long long v18 = v16;
        }
        else
        {
          long long v17 = v8;
          long long v18 = v15;
        }
        [v17 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          [v6 deleteObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v21);
    }

    uint64_t v25 = 0;
    [v6 save:&v25];
  }

  return v7;
}

- (BOOL)_updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6
{
  unsigned int v8 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v8 >= 4)
  {
    long long v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PDSCDCache.m", 519, @"Invalid parameter not satisfying: %@", @"state <= PDSEntryStateHeartbeat" object file lineNumber description];
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy_;
  long long v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__PDSCDCacheContainer__updateEntryState_forUser_clientID_withError___block_invoke;
  v19[3] = &unk_2645C90D8;
  void v19[4] = self;
  id v13 = v11;
  id v20 = v13;
  id v14 = v12;
  char v24 = v8;
  id v21 = v14;
  uint64_t v22 = &v31;
  uint64_t v23 = &v25;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v19];
  if (a6)
  {
    uint64_t v15 = (void *)v26[5];
    if (v15) {
      *a6 = v15;
    }
  }
  if (*((unsigned char *)v32 + 24)) {
    BOOL v16 = v26[5] == 0;
  }
  else {
    BOOL v16 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __68__PDSCDCacheContainer__updateEntryState_forUser_clientID_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _cdRegistrationsMatchingUser:*(void *)(a1 + 40) withClientID:*(void *)(a1 + 48) inContext:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v8++) setEntryState:*(unsigned __int8 *)(a1 + 72)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  obuint64_t j = *(id *)(v9 + 40);
  char v10 = [v3 save:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

- (BOOL)_updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5
{
  unsigned int v6 = a4;
  if (a3 >= 4u)
  {
    long long v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PDSCDCache.m", 537, @"Invalid parameter not satisfying: %@", @"state <= PDSEntryStateHeartbeat" object file lineNumber description];
  }
  if (v6 >= 4)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PDSCDCache.m", 538, @"Invalid parameter not satisfying: %@", @"newState <= PDSEntryStateHeartbeat" object file lineNumber description];
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__PDSCDCacheContainer__updateAllEntriesWithState_toState_withError___block_invoke;
  v15[3] = &unk_2645C9100;
  unsigned __int8 v16 = a3;
  char v17 = v6;
  v15[4] = &v24;
  void v15[5] = &v18;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v15];
  if (a5)
  {
    char v10 = (void *)v19[5];
    if (v10) {
      *a5 = v10;
    }
  }
  if (*((unsigned char *)v25 + 24)) {
    BOOL v11 = v19[5] == 0;
  }
  else {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __68__PDSCDCacheContainer__updateAllEntriesWithState_toState_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PDSCDRegistration fetchRequest];
  uint64_t v5 = +[PDSCDRegistration registrationsWithState:*(unsigned __int8 *)(a1 + 48)];
  [v4 setPredicate:v5];

  unsigned int v6 = [v3 executeFetchRequest:v4 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v10++) setEntryState:*(unsigned __int8 *)(a1 + 49)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v11 + 40);
  char v12 = [v3 save:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
}

- (id)_cdRegistrationsMatchingUser:(id)a3 withClientID:(id)a4 inContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[PDSCDRegistration fetchRequest];
  if (v8)
  {
    uint64_t v11 = +[PDSCDRegistration registrationsForClientID:v8];
    [v10 setPredicate:v11];
  }
  long long v28 = v9;
  long long v29 = v8;
  char v12 = objc_msgSend(v9, "executeFetchRequest:error:", v10, 0, v10);
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      uint64_t v31 = v14;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
        uint64_t v18 = [v17 user];
        uint64_t v19 = [v18 userID];
        uint64_t v20 = [v7 userID];
        if ([v19 isEqualToString:v20])
        {
          id v21 = [v17 user];
          int v22 = [v21 userType];
          id v23 = v7;
          int v24 = [v7 userType];

          BOOL v25 = v22 == v24;
          uint64_t v14 = v31;
          id v7 = v23;
          if (v25) {
            [v30 addObject:v17];
          }
        }
        else
        {
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  return v30;
}

- (id)_loadUsersIncludingOnlyActive:(BOOL)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__PDSCDCacheContainer__loadUsersIncludingOnlyActive___block_invoke;
  v5[3] = &unk_2645C8F78;
  v5[4] = &v6;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v5];
  id v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__PDSCDCacheContainer__loadUsersIncludingOnlyActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PDSCDUser fetchRequest];
  uint64_t v5 = [v3 executeFetchRequest:v4 error:0];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = [v15 user];
        if (v16)
        {
          long long v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          uint64_t v18 = v16;
        }
        else
        {
          long long v17 = v9;
          uint64_t v18 = v15;
        }
        [v17 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [v3 deleteObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v21);
    }

    uint64_t v24 = 0;
    [v3 save:&v24];
  }
}

- (id)_usersForClientID:(id)a3 activeOnly:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__PDSCDCacheContainer__usersForClientID_activeOnly___block_invoke;
  v10[3] = &unk_2645C9128;
  id v7 = v6;
  BOOL v13 = a4;
  id v11 = v7;
  uint64_t v12 = &v14;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v10];
  uint64_t v8 = [(id)v15[5] allObjects];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __52__PDSCDCacheContainer__usersForClientID_activeOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PDSCDRegistration fetchRequest];
  uint64_t v5 = v4;
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 48)) {
      +[PDSCDRegistration activeRegistrationsForClientID:](PDSCDRegistration, "activeRegistrationsForClientID:");
    }
    else {
    uint64_t v6 = +[PDSCDRegistration registrationsForClientID:](PDSCDRegistration, "registrationsForClientID:");
    }
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = +[PDSCDRegistration activeRegistrations];
LABEL_8:
    id v7 = (void *)v6;
    [v5 setPredicate:v6];

    goto LABEL_9;
  }
  [v4 setPredicate:0];
LABEL_9:
  uint64_t v8 = objc_msgSend(v3, "executeFetchRequest:error:", v5, 0, v5);
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v19 = [v18 user];
        uint64_t v20 = [v19 user];

        if (v20)
        {
          uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v22 = v20;
        }
        else
        {
          uint64_t v21 = v12;
          uint64_t v22 = v18;
        }
        [v21 addObject:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v15);
  }

  if ([v12 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          [v3 deleteObject:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }

    uint64_t v29 = 0;
    [v3 save:&v29];
  }
}

- (id)_cdUsersMatchingUserID:(id)a3 userType:(signed __int16)a4 inContext:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = +[PDSCDUser fetchRequest];
  uint64_t v10 = +[PDSCDUser predicateForUserID:v8 userType:v5];

  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:0];

  id v12 = [v11 firstObject];

  return v12;
}

- (id)_cdRegistrationsMatchingEntry:(id)a3 inContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PDSCDRegistration fetchRequest];
  id v8 = +[PDSCDRegistration uniquenessPredicateForEntry:v6];

  [v7 setPredicate:v8];
  uint64_t v9 = [v5 executeFetchRequest:v7 error:0];

  return v9;
}

- (void)_KVEntryForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__PDSCDCacheContainer__KVEntryForKey_withBlock___block_invoke;
  v10[3] = &unk_2645C9150;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PDSCDCacheContainer *)self _syncBlockWithContext:v10];
}

void __48__PDSCDCacheContainer__KVEntryForKey_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = 0x26ABFD000uLL;
  id v5 = +[PDSCDKV fetchRequest];
  id v6 = +[PDSCDKV predicateForKey:*(void *)(a1 + 32)];
  [v5 setPredicate:v6];

  id v26 = 0;
  id v7 = [v3 executeFetchRequest:v5 error:&v26];
  id v8 = v26;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v10)
  {

    char v13 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  id v12 = 0;
  char v13 = 0;
  uint64_t v14 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (v12)
      {
        [v3 deleteObject:v16];
        char v13 = 1;
      }
      else
      {
        id v12 = v16;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  }
  while (v11);

  if (!v12)
  {
    unint64_t v4 = 0x26ABFD000;
LABEL_14:
    id v12 = [(id)(v4 + 2600) insertIntoManagedObjectContext:v3];
    [v12 setKey:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v13) {
    int v17 = 1;
  }
  else {
    int v17 = [v12 hasChanges];
  }
  uint64_t v18 = [v12 dataValue];
  if (v18 || ([v12 stringValue], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v20 = [v12 numValue];

    if (!v20) {
      [v3 deleteObject:v12];
    }
  }
  if (v17)
  {
    id v21 = v8;
    [v3 save:&v21];
    id v19 = v21;

    id v8 = v19;
  }
}

- (void)_syncBlockWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PDSCDCacheContainer *)self container];
  id v6 = (void *)[v5 newBackgroundContext];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__PDSCDCacheContainer__syncBlockWithContext___block_invoke;
  v9[3] = &unk_2645C9178;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

uint64_t __45__PDSCDCacheContainer__syncBlockWithContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSPersistentContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (NSPersistentContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (NSURL)containingPath
{
  return self->_containingPath;
}

- (void)setContainingPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingPath, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end