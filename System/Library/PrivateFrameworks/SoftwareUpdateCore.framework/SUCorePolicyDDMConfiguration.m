@interface SUCorePolicyDDMConfiguration
+ (id)declarationFromAllDeclarationDicts:(id)a3;
+ (id)declarationFromAllDeclarations:(id)a3;
+ (id)getDaemonCacheDirectory;
+ (id)sharedInstance;
+ (id)statePersistencePath;
+ (void)getDaemonCacheDirectory;
- (BOOL)addDeclaration:(id)a3 returningError:(id *)a4;
- (BOOL)addDeclaration:(id)a3 withKey:(id)a4;
- (BOOL)addDeclaration:(id)a3 withKey:(id)a4 returningError:(id *)a5;
- (BOOL)addGlobalSettingsDeclaration:(id)a3 returningError:(id *)a4;
- (BOOL)allowInvalidDeclaration;
- (BOOL)hasManagedConfigurations;
- (BOOL)invalidateDeclarationForKey:(id)a3;
- (BOOL)removeDeclarationForKey:(id)a3;
- (BOOL)setActiveDeclarationKey:(id)a3;
- (OS_dispatch_queue)stateQueue;
- (SUCorePersistedState)persistedState;
- (SUCorePolicyDDMConfiguration)initWithState;
- (SUCorePolicyDDMConfiguration)initWithStatePersistencePath:(id)a3;
- (id)_dateFromString:(id)a3;
- (id)_getActiveDeclarationKey;
- (id)activeDeclarationKey;
- (id)allDeclarations;
- (id)allDeclarationsIncludingInvalid;
- (id)allKeys;
- (id)currentGlobalSettingsDeclaration;
- (id)currentlyApplicableDeclaration;
- (id)declarationForKey:(id)a3;
- (id)description;
- (id)invalidateAllInvalidDeclarationsReturningAllInvalid;
- (void)_getDeclarations:(id *)a3 invalid:(id *)a4;
- (void)_persistActiveDeclarationKey:(id)a3;
- (void)_persistInvalidDeclarations:(id)a3;
- (void)_persistState;
- (void)_persistValidDeclarations:(id)a3;
- (void)removeAllDeclarations;
- (void)removeAllInvalidDeclarations;
- (void)removeGlobalSettingsDeclaration;
- (void)setAllowInvalidDeclaration:(BOOL)a3;
- (void)setPersistedState:(id)a3;
- (void)setStateQueue:(id)a3;
@end

@implementation SUCorePolicyDDMConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __46__SUCorePolicyDDMConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_instance = [[SUCorePolicyDDMConfiguration alloc] initWithState];

  return MEMORY[0x270F9A758]();
}

- (SUCorePolicyDDMConfiguration)initWithState
{
  return [(SUCorePolicyDDMConfiguration *)self initWithStatePersistencePath:0];
}

- (SUCorePolicyDDMConfiguration)initWithStatePersistencePath:(id)a3
{
  v4 = (__CFString *)a3;
  v25.receiver = self;
  v25.super_class = (Class)SUCorePolicyDDMConfiguration;
  v5 = [(SUCorePolicyDDMConfiguration *)&v25 init];
  v6 = v5;
  if (v5)
  {
    v5->_allowInvalidDeclaration = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.su.ddm.stateQueue", v7);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v8;

    if (!v4)
    {
      v4 = [(id)objc_opt_class() statePersistencePath];
      if (!v4)
      {
        v10 = +[SUCoreDDMUtilities sharedLogger];
        v11 = [v10 oslog];

        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[SUCorePolicyDDMConfiguration initWithStatePersistencePath:](v11, v12, v13, v14, v15, v16, v17, v18);
        }

        v4 = @"/tmp/SoftwareUpdateDDMStatePersistence.plist";
      }
    }
    uint64_t v19 = [objc_alloc(MEMORY[0x263F77DF8]) initWithDispatchQueue:v6->_stateQueue withPersistencePath:v4 forPolicyVersion:@"1.0"];
    persistedState = v6->_persistedState;
    v6->_persistedState = (SUCorePersistedState *)v19;

    dispatch_assert_queue_not_V2((dispatch_queue_t)v6->_stateQueue);
    v21 = v6->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke;
    block[3] = &unk_2640DC338;
    v24 = v6;
    dispatch_sync(v21, block);
  }
  return v6;
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 16) loadPersistedState])
  {
    v1 = +[SUCoreDDMUtilities sharedLogger];
    v2 = [v1 oslog];

    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SUCorePolicyDDMConfiguration initWithStatePersistencePath:]_block_invoke";
      _os_log_impl(&dword_20C8EA000, v2, OS_LOG_TYPE_DEFAULT, "%s: Loaded persisted state", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v3 = +[SUCoreDDMUtilities sharedLogger];
    v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

+ (id)statePersistencePath
{
  v2 = [(id)objc_opt_class() getDaemonCacheDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@"com.apple.su.ddm.plist"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)getDaemonCacheDirectory
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  bzero(__s, 0x400uLL);
  if ((int)confstr(65538, __s, 0x400uLL) >= 1)
  {
    v2 = [MEMORY[0x263F08850] defaultManager];
    v3 = [v2 stringWithFileSystemRepresentation:__s length:strlen(__s)];

    v4 = [v3 stringByAppendingPathComponent:@"SUCorePolicyDDMConfiguration"];
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          id v32 = 0,
          [v7 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:&v32],
          id v8 = v32,
          v7,
          !v8))
    {
      id v11 = v4;
    }
    else
    {
      uint64_t v9 = +[SUCoreDDMUtilities sharedLogger];
      uint64_t v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory]();
      }

      id v11 = 0;
    }

    goto LABEL_20;
  }
  int v12 = +[SUCoreDDMUtilities sharedLogger];
  uint64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory];
  }

  v21 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v21 temporaryDirectory];

  v22 = [MEMORY[0x263F08850] defaultManager];
  v23 = [v3 path];
  char v24 = [v22 fileExistsAtPath:v23];

  if (v24)
  {
LABEL_19:
    id v11 = [v3 path];
    goto LABEL_20;
  }
  objc_super v25 = [MEMORY[0x263F08850] defaultManager];
  v26 = [v3 path];
  id v31 = 0;
  [v25 createDirectoryAtPath:v26 withIntermediateDirectories:0 attributes:0 error:&v31];
  id v27 = v31;

  v28 = +[SUCoreDDMUtilities sharedLogger];
  v29 = [v28 oslog];

  if (!v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[SUCorePolicyDDMConfiguration getDaemonCacheDirectory]";
      _os_log_impl(&dword_20C8EA000, v29, OS_LOG_TYPE_DEFAULT, "%s: Created tmp directory", buf, 0xCu);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    +[SUCorePolicyDDMConfiguration getDaemonCacheDirectory]();
  }

  id v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)hasManagedConfigurations
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SUCorePolicyDDMConfiguration_hasManagedConfigurations__block_invoke;
  v5[3] = &unk_2640DC310;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__SUCorePolicyDDMConfiguration_hasManagedConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v12 = 0;
  id v13 = 0;
  [v2 _getDeclarations:&v13 invalid:&v12];
  id v3 = v13;
  id v4 = v12;
  uint64_t v5 = [*(id *)(a1 + 32) persistedState];
  uint64_t v6 = [v5 dictionaryForKey:@"SUCoreDDMDeclarationGlobalSettings"];

  uint64_t v7 = +[SUCoreDDMUtilities sharedLogger];
  uint64_t v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v3 count];
    uint64_t v10 = [v4 count];
    *(_DWORD *)buf = 136315906;
    uint64_t v15 = "-[SUCorePolicyDDMConfiguration hasManagedConfigurations]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v6;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%s: valid.count = %lu, invalid.count = %lu, globalSettings = %p", buf, 0x2Au);
  }

  if ([v3 count]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = ([v4 count] | v6) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
}

- (void)_getDeclarations:(id *)a3 invalid:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
  {
    uint64_t v7 = [(SUCorePolicyDDMConfiguration *)self persistedState];
    uint64_t v8 = [v7 dictionaryForKey:@"Declarations"];

    uint64_t v9 = (void *)[v8 mutableCopy];
    if (!v9) {
      uint64_t v9 = objc_opt_new();
    }
    id v10 = v9;
    *a3 = v10;
  }
  if (a4)
  {
    BOOL v11 = [(SUCorePolicyDDMConfiguration *)self persistedState];
    id v14 = [v11 dictionaryForKey:@"invalidDeclarations"];

    id v12 = (void *)[v14 mutableCopy];
    if (!v12) {
      id v12 = objc_opt_new();
    }
    id v13 = v12;
    *a4 = v13;
  }
}

- (void)_persistValidDeclarations:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v6 = [(SUCorePolicyDDMConfiguration *)self persistedState];
  [v6 persistDictionary:v5 forKey:@"Declarations" shouldPersist:0];
}

- (void)_persistInvalidDeclarations:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v6 = [(SUCorePolicyDDMConfiguration *)self persistedState];
  [v6 persistDictionary:v5 forKey:@"invalidDeclarations" shouldPersist:0];
}

- (void)_persistActiveDeclarationKey:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v6 = [(SUCorePolicyDDMConfiguration *)self persistedState];
  [v6 persistString:v5 forKey:@"activeDeclarationKey" shouldPersist:0];
}

- (void)_persistState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v3 = [(SUCorePolicyDDMConfiguration *)self persistedState];
  [v3 persistState];
}

- (id)_getActiveDeclarationKey
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v3 = [(SUCorePolicyDDMConfiguration *)self persistedState];
  id v4 = [v3 stringForKey:@"activeDeclarationKey"];

  return v4;
}

- (id)activeDeclarationKey
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  BOOL v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SUCorePolicyDDMConfiguration_activeDeclarationKey__block_invoke;
  v6[3] = &unk_2640DC360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __52__SUCorePolicyDDMConfiguration_activeDeclarationKey__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _getActiveDeclarationKey];

  return MEMORY[0x270F9A758]();
}

- (BOOL)setActiveDeclarationKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke;
  block[3] = &unk_2640DCFF8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v13 = 0;
  [v2 _getDeclarations:&v13 invalid:0];
  id v3 = v13;
  id v4 = (uint64_t *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 40);
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  id v6 = [v3 safeObjectForKey:v5 ofClass:objc_opt_class()];

  if (v6)
  {
    uint64_t v7 = *v4;
LABEL_5:
    [*(id *)(a1 + 32) _persistActiveDeclarationKey:v7];
    [*(id *)(a1 + 32) _persistState];
    uint64_t v8 = +[SUCoreDDMUtilities sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *v4;
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[SUCorePolicyDDMConfiguration setActiveDeclarationKey:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%s: Successfully set %{public}@ as active", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_11;
  }
  uint64_t v11 = +[SUCoreDDMUtilities sharedLogger];
  id v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke_cold_1();
  }

LABEL_11:
}

- (BOOL)addDeclaration:(id)a3 withKey:(id)a4
{
  return [(SUCorePolicyDDMConfiguration *)self addDeclaration:a3 returningError:0];
}

- (BOOL)addDeclaration:(id)a3 withKey:(id)a4 returningError:(id *)a5
{
  return [(SUCorePolicyDDMConfiguration *)self addDeclaration:a3 returningError:a5];
}

- (BOOL)addDeclaration:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__6;
  uint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke;
  v12[3] = &unk_2640DD710;
  id v8 = v6;
  id v13 = v8;
  char v14 = self;
  uint64_t v15 = &v17;
  __int16 v16 = &v23;
  dispatch_sync(stateQueue, v12);
  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x263F77DA0] sharedDevice];
  if ([v3 isInternal])
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 8);

    if (v4)
    {
      uint64_t v5 = +[SUCoreDDMUtilities sharedLogger];
      id v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[SUCorePolicyDDMConfiguration addDeclaration:returningError:]_block_invoke";
        _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "%s: [INTERNAL] _allowInvalidDeclaration is set to YES!!! Allow invalid declarations", buf, 0xCu);
      }

      id v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v23 = 0;
  BOOL v8 = [(SUCoreDDMDeclaration *)v2 isValidDeclarationWithReason:&v23];
  id v7 = v23;
  if (!v8)
  {
    int v9 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v16 = [v9 buildError:9100 underlying:0 description:v7];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v17 + 40);
    *(void *)(v17 + 40) = v16;
    goto LABEL_18;
  }
LABEL_8:
  int v9 = [(SUCoreDDMDeclaration *)v2 declarationKey];
  BOOL v10 = *(void **)(a1 + 40);
  id v21 = 0;
  id v22 = 0;
  [v10 _getDeclarations:&v22 invalid:&v21];
  id v11 = v22;
  id v12 = v21;
  id v13 = [v11 objectForKey:v9];

  if (v13)
  {
    char v14 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v18 = [v12 objectForKey:v9];

    if (v18)
    {
      uint64_t v19 = +[SUCoreDDMUtilities sharedLogger];
      uint64_t v15 = [v19 oslog];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_1();
      }
    }
    else
    {
      [v11 setSafeObject:*(void *)(a1 + 32) forKey:v9];
      [*(id *)(a1 + 40) _persistValidDeclarations:v11];
      [*(id *)(a1 + 40) _persistState];
      __int16 v20 = +[SUCoreDDMUtilities sharedLogger];
      uint64_t v15 = [v20 oslog];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[SUCorePolicyDDMConfiguration addDeclaration:returningError:]_block_invoke";
        __int16 v26 = 2114;
        id v27 = v2;
        _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "%s: Adding %{public}@", buf, 0x16u);
      }
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_18:
}

- (id)declarationForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke;
  block[3] = &unk_2640DCFF8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  id v17 = 0;
  id v18 = 0;
  [v2 _getDeclarations:&v18 invalid:&v17];
  id v3 = v18;
  id v4 = v17;
  uint64_t v5 = a1 + 5;
  uint64_t v6 = [v3 safeObjectForKey:a1[5] ofClass:objc_opt_class()];
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = @"a valid";
LABEL_5:
    id v10 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v7];
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v13 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *v5;
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[SUCorePolicyDDMConfiguration declarationForKey:]_block_invoke";
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%s: Found %{public}@ declaration for %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
  uint64_t v9 = [v4 safeObjectForKey:*v5 ofClass:objc_opt_class()];
  if (v9)
  {
    id v7 = v9;
    BOOL v8 = @"an invalid";
    goto LABEL_5;
  }
  uint64_t v16 = +[SUCoreDDMUtilities sharedLogger];
  id v7 = [v16 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke_cold_1();
  }
LABEL_8:
}

- (id)allDeclarations
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke;
  v6[3] = &unk_2640DC310;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v8 = 0;
  [v2 _getDeclarations:&v8 invalid:0];
  id v3 = v8;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_2;
  v7[3] = &unk_2640DD738;
  v7[4] = *(void *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sortUsingComparator:&__block_literal_global_316];
  id v4 = +[SUCoreDDMUtilities sharedLogger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    id v10 = "-[SUCorePolicyDDMConfiguration allDeclarations]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "%s: Sorted valid enforced-su declarations: %{public}@", buf, 0x16u);
  }
}

void __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
}

uint64_t __47__SUCorePolicyDDMConfiguration_allDeclarations__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)allDeclarationsIncludingInvalid
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  id v15 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke;
  v9[3] = &unk_2640DC310;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateQueue, v9);
  id v4 = +[SUCoreDDMUtilities sharedLogger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SUCorePolicyDDMConfiguration allDeclarationsIncludingInvalid]";
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "%s: All enforced-su declarations: %{public}@", buf, 0x16u);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v7 = 0;
  id v8 = 0;
  [v2 _getDeclarations:&v8 invalid:&v7];
  id v3 = v8;
  id v4 = v7;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_2;
  v6[3] = &unk_2640DD738;
  v6[4] = *(void *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_3;
  v5[3] = &unk_2640DD738;
  v5[4] = *(void *)(a1 + 40);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
}

void __63__SUCorePolicyDDMConfiguration_allDeclarationsIncludingInvalid__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
}

- (BOOL)invalidateDeclarationForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke;
    block[3] = &unk_2640DCFF8;
    void block[4] = self;
    id v18 = v4;
    uint64_t v19 = &v20;
    dispatch_sync(stateQueue, block);
    BOOL v6 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v7 = +[SUCoreDDMUtilities sharedLogger];
    id v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    BOOL v6 = 0;
  }

  return v6;
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v20 = 0;
  id v21 = 0;
  [v2 _getDeclarations:&v21 invalid:&v20];
  id v3 = v21;
  id v4 = v20;
  uint64_t v5 = (id *)(a1 + 40);
  BOOL v6 = [v3 objectForKey:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) _getActiveDeclarationKey];
  if (!v7)
  {
    if (!v6) {
      goto LABEL_15;
    }
    int v9 = 0;
LABEL_9:
    uint64_t v12 = [v4 objectForKey:*v5];

    uint64_t v13 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v14 = [v13 oslog];

    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_2();
      }

      if (!v9) {
        goto LABEL_14;
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *v5;
        *(_DWORD *)buf = 136315394;
        char v23 = "-[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:]_block_invoke";
        __int16 v24 = 2114;
        id v25 = v19;
        _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%s: Marking the declaration invalid for %{public}@", buf, 0x16u);
      }

      [v4 setObject:v6 forKey:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _persistInvalidDeclarations:v4];
      if (!v9) {
        goto LABEL_14;
      }
    }
    [*(id *)(a1 + 32) _persistActiveDeclarationKey:0];
LABEL_14:
    [v3 removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _persistValidDeclarations:v3];
    [*(id *)(a1 + 32) _persistState];
LABEL_19:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_20;
  }
  int v8 = [*v5 isEqualToString:v7];
  int v9 = v8;
  if (v6) {
    goto LABEL_9;
  }
  if (v8)
  {
    uint64_t v10 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_3();
    }

    [*(id *)(a1 + 32) _persistActiveDeclarationKey:0];
    [*(id *)(a1 + 32) _persistState];
  }
LABEL_15:
  uint64_t v15 = [v4 objectForKey:*v5];

  uint64_t v16 = +[SUCoreDDMUtilities sharedLogger];
  id v17 = [v16 oslog];

  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = *v5;
      *(_DWORD *)buf = 136315394;
      char v23 = "-[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:]_block_invoke";
      __int16 v24 = 2114;
      id v25 = v18;
      _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "%s: The declaration is already invalid for %{public}@", buf, 0x16u);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_1();
  }

LABEL_20:
}

- (void)removeAllDeclarations
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUCorePolicyDDMConfiguration_removeAllDeclarations__block_invoke;
  block[3] = &unk_2640DC338;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUCorePolicyDDMConfiguration_removeAllDeclarations__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263EFFA78];
  [*(id *)(a1 + 32) _persistValidDeclarations:MEMORY[0x263EFFA78]];
  [*(id *)(a1 + 32) _persistInvalidDeclarations:v2];
  [*(id *)(a1 + 32) _persistActiveDeclarationKey:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 _persistState];
}

- (void)removeAllInvalidDeclarations
{
  id v2 = [(SUCorePolicyDDMConfiguration *)self removeAllInvalidDeclarationsReturningInvalid];
}

- (id)invalidateAllInvalidDeclarationsReturningAllInvalid
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke;
  v6[3] = &unk_2640DC310;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke(uint64_t a1)
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v2 = *(void **)(a1 + 32);
  id v17 = 0;
  id v18 = 0;
  [v2 _getDeclarations:&v18 invalid:&v17];
  id v3 = v18;
  id v4 = v17;
  uint64_t v5 = [*(id *)(a1 + 32) _getActiveDeclarationKey];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2;
  v10[3] = &unk_2640DD780;
  id v6 = v5;
  id v11 = v6;
  uint64_t v14 = &v19;
  id v7 = v4;
  id v12 = v7;
  uint64_t v15 = &v23;
  id v8 = v3;
  id v13 = v8;
  uint64_t v16 = &v27;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
  if (*((unsigned char *)v28 + 24)) {
    [*(id *)(a1 + 32) _persistValidDeclarations:v8];
  }
  if (*((unsigned char *)v24 + 24)) {
    [*(id *)(a1 + 32) _persistInvalidDeclarations:v7];
  }
  if (*((unsigned char *)v20 + 24)) {
    [*(id *)(a1 + 32) _persistActiveDeclarationKey:0];
  }
  if (*((unsigned char *)v28 + 24) || *((unsigned char *)v24 + 24) || *((unsigned char *)v20 + 24)) {
    [*(id *)(a1 + 32) _persistState];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_319;
  v9[3] = &unk_2640DD7A8;
  v9[4] = *(void *)(a1 + 40);
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v6];
  id v8 = v7;
  if (v7 && ![(SUCoreDDMDeclaration *)v7 isValidDeclaration])
  {
    uint64_t v9 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SUCorePolicyDDMConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid]_block_invoke_2";
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is nolonger valid; invalidating it",
        (uint8_t *)&v14,
        0x16u);
    }

    if ([v5 isEqualToString:*(void *)(a1 + 32)]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    id v11 = [*(id *)(a1 + 40) objectForKey:v5];

    if (v11)
    {
      id v12 = +[SUCoreDDMUtilities sharedLogger];
      id v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2_cold_1();
      }
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v6 forKey:v5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    [*(id *)(a1 + 48) removeObjectForKey:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_319(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a3;
  id v5 = [[SUCoreDDMDeclaration alloc] initWithDeclarationKeys:v4];

  [v3 addObject:v5];
}

- (id)allKeys
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v12 = (id)objc_opt_new();
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SUCorePolicyDDMConfiguration_allKeys__block_invoke;
  v6[3] = &unk_2640DC310;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__SUCorePolicyDDMConfiguration_allKeys__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v9 = 0;
  id v10 = 0;
  [v2 _getDeclarations:&v10 invalid:&v9];
  id v3 = v10;
  id v4 = v9;
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = [v3 allKeys];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [v4 allKeys];
  [v7 addObjectsFromArray:v8];
}

- (BOOL)removeDeclarationForKey:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke;
    block[3] = &unk_2640DCFF8;
    void block[4] = self;
    id v6 = v4;
    id v22 = v6;
    uint64_t v23 = &v24;
    dispatch_sync(stateQueue, block);
    if (*((unsigned char *)v25 + 24))
    {
      uint64_t v7 = +[SUCoreDDMUtilities sharedLogger];
      id v8 = [v7 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v29 = "-[SUCorePolicyDDMConfiguration removeDeclarationForKey:]";
        __int16 v30 = 2114;
        id v31 = v6;
        _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%s: Successfully removed %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v19 = +[SUCoreDDMUtilities sharedLogger];
      id v8 = [v19 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SUCorePolicyDDMConfiguration removeDeclarationForKey:]();
      }
    }

    BOOL v18 = *((unsigned char *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v9 = +[SUCoreDDMUtilities sharedLogger];
    id v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SUCorePolicyDDMConfiguration removeDeclarationForKey:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    BOOL v18 = 0;
  }

  return v18;
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v14 = 0;
  id v15 = 0;
  [v2 _getDeclarations:&v15 invalid:&v14];
  id v3 = v15;
  id v4 = v14;
  id v5 = [*(id *)(a1 + 32) _getActiveDeclarationKey];
  id v6 = (void *)(a1 + 40);
  int v7 = [*(id *)(a1 + 40) isEqualToString:v5];
  uint64_t v8 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (v8) {
    [v3 removeObjectForKey:*v6];
  }
  uint64_t v9 = [v4 objectForKey:*v6];

  if (v9)
  {
    [v4 removeObjectForKey:*v6];
    if (v7)
    {
      id v10 = +[SUCoreDDMUtilities sharedLogger];
      uint64_t v11 = [v10 oslog];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_2();
      }
    }
    if (v8)
    {
      uint64_t v12 = +[SUCoreDDMUtilities sharedLogger];
      uint64_t v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _persistValidDeclarations:v3];
    }
    [*(id *)(a1 + 32) _persistInvalidDeclarations:v4];
  }
  else if (v8)
  {
    [*(id *)(a1 + 32) _persistValidDeclarations:v3];
  }
  if (v7)
  {
    [*(id *)(a1 + 32) _persistActiveDeclarationKey:0];
LABEL_18:
    [*(id *)(a1 + 32) _persistState];
    goto LABEL_19;
  }
  if (v8 | v9) {
    goto LABEL_18;
  }
LABEL_19:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (v8 | v9) != 0;
}

- (id)currentlyApplicableDeclaration
{
  id v3 = objc_opt_class();
  id v4 = [(SUCorePolicyDDMConfiguration *)self allDeclarations];
  id v5 = [v3 declarationFromAllDeclarations:v4];

  return v5;
}

+ (id)declarationFromAllDeclarationDicts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [SUCoreDDMDeclaration alloc];
        uint64_t v12 = -[SUCoreDDMDeclaration initWithDeclarationKeys:](v11, "initWithDeclarationKeys:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [(id)objc_opt_class() declarationFromAllDeclarations:v4];

  return v13;
}

+ (id)declarationFromAllDeclarations:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_321];
  id v4 = +[SUCoreDDMUtilities sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "+[SUCorePolicyDDMConfiguration declarationFromAllDeclarations:]";
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "%s: Sorted DDM declarations: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [v3 firstObject];

  return v6;
}

uint64_t __63__SUCorePolicyDDMConfiguration_declarationFromAllDeclarations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)addGlobalSettingsDeclaration:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  uint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__SUCorePolicyDDMConfiguration_addGlobalSettingsDeclaration_returningError___block_invoke;
  v12[3] = &unk_2640DD710;
  id v8 = v6;
  id v13 = v8;
  id v14 = self;
  long long v15 = &v23;
  long long v16 = &v17;
  dispatch_sync(stateQueue, v12);
  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __76__SUCorePolicyDDMConfiguration_addGlobalSettingsDeclaration_returningError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [[SUCoreDDMDeclarationGlobalSettings alloc] initWithDeclarationKeys:*(void *)(a1 + 32)];
  id v12 = 0;
  BOOL v3 = [(SUCoreDDMDeclarationGlobalSettings *)v2 isValidDeclarationWithReason:&v12];
  id v4 = v12;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 40) persistedState];
    [v5 persistDictionary:*(void *)(a1 + 32) forKey:@"SUCoreDDMDeclarationGlobalSettings" shouldPersist:1];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v6 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[SUCorePolicyDDMConfiguration addGlobalSettingsDeclaration:returningError:]_block_invoke";
      __int16 v15 = 2114;
      long long v16 = v2;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalid global settings declaration: %{public}@", buf, 0x16u);
    }

    id v8 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v9 = [v8 buildError:9100 underlying:0 description:v4];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)currentGlobalSettingsDeclaration
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SUCorePolicyDDMConfiguration_currentGlobalSettingsDeclaration__block_invoke;
  v6[3] = &unk_2640DC310;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__SUCorePolicyDDMConfiguration_currentGlobalSettingsDeclaration__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) persistedState];
  BOOL v3 = [v2 dictionaryForKey:@"SUCoreDDMDeclarationGlobalSettings"];

  id v4 = [[SUCoreDDMDeclarationGlobalSettings alloc] initWithDeclarationKeys:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = +[SUCoreDDMUtilities sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v10 = 136315394;
    uint64_t v11 = "-[SUCorePolicyDDMConfiguration currentGlobalSettingsDeclaration]_block_invoke";
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%s: Current global settings declaration: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)removeGlobalSettingsDeclaration
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SUCorePolicyDDMConfiguration_removeGlobalSettingsDeclaration__block_invoke;
  block[3] = &unk_2640DC338;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __63__SUCorePolicyDDMConfiguration_removeGlobalSettingsDeclaration__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) persistedState];
  [v1 persistDictionary:0 forKey:@"SUCoreDDMDeclarationGlobalSettings" shouldPersist:1];
}

- (id)_dateFromString:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  id v6 = [v5 dateFromString:v4];

  return v6;
}

- (id)description
{
  id v2 = NSString;
  BOOL v3 = [(SUCorePolicyDDMConfiguration *)self allDeclarations];
  id v4 = [v2 stringWithFormat:@"SUCorePolicyDDMConfiguration (Declarations:%@)", v3];

  return v4;
}

- (SUCorePersistedState)persistedState
{
  return (SUCorePersistedState *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistedState:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateQueue:(id)a3
{
}

- (BOOL)allowInvalidDeclaration
{
  return self->_allowInvalidDeclaration;
}

- (void)setAllowInvalidDeclaration:(BOOL)a3
{
  self->_allowInvalidDeclaration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_persistedState, 0);
}

- (void)initWithStatePersistencePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: Unable to read corrupted software update state file.  Exception: %{public}@", v2, v3, v4, v5, 2u);
}

void __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDaemonCacheDirectory
{
}

void __56__SUCorePolicyDDMConfiguration_setActiveDeclarationKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_20C8EA000, v0, v1, "%s: %{public}@ is not in the valid declarations %{public}@", v2);
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: There is already a tracked invalid declaration for %{public}@", v2, v3, v4, v5, 2u);
}

void __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: There is already a tracked valid declaration for %{public}@", v2, v3, v4, v5, 2u);
}

void __50__SUCorePolicyDDMConfiguration_declarationForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: Unable to find any declaration for %{public}@", v2, v3, v4, v5, 2u);
}

- (void)invalidateDeclarationForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: Unable to find any declaration to invalidate for %{public}@", v2, v3, v4, v5, 2u);
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: The declaration is both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
}

void __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: The declaration with active key = %{public}@ was invalid", v2, v3, v4, v5, 2u);
}

void __83__SUCorePolicyDDMConfiguration_invalidateAllInvalidDeclarationsReturningAllInvalid__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: The declaration is both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
}

- (void)removeDeclarationForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeDeclarationForKey:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: Unable to find any declaration to remove for %{public}@", v2, v3, v4, v5, 2u);
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: The declaration was both valid and invalid for %{public}@", v2, v3, v4, v5, 2u);
}

void __56__SUCorePolicyDDMConfiguration_removeDeclarationForKey___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: The declaration with key = %{public}@ was invalid", v2, v3, v4, v5, 2u);
}

@end