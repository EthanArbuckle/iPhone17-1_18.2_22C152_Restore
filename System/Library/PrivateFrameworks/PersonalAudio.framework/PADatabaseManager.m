@interface PADatabaseManager
+ (id)sharedManager;
- (BOOL)saveConfiguration:(id)a3;
- (id)cloudKitContainer;
- (id)containerIdentifier;
- (id)currentConfiguration;
- (id)managedObjectModelName;
- (void)contentDidUpdate:(id)a3;
- (void)logMessage:(id)a3;
@end

@implementation PADatabaseManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedManager_Manager;
  return v2;
}

uint64_t __34__PADatabaseManager_sharedManager__block_invoke()
{
  sharedManager_Manager = objc_alloc_init(PADatabaseManager);
  return MEMORY[0x270F9A758]();
}

- (id)managedObjectModelName
{
  return @"PersonalAudioSettings";
}

- (id)cloudKitContainer
{
  return @"com.apple.personalaudio";
}

- (id)containerIdentifier
{
  return @"com.apple.accessibility.PersonalAudioTunings";
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  PAInitializeLogging();
  v4 = [NSString stringWithFormat:@"PA DB message %@", v3];

  v5 = [NSString stringWithFormat:@"%s:%d %@", "-[PADatabaseManager logMessage:]", 44, v4];
  v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)contentDidUpdate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PADatabaseManager;
  [(HCDatabaseManager *)&v8 contentDidUpdate:a3];
  v4 = +[PASettings sharedInstance];
  uint64_t v5 = [v4 personalMediaConfiguration];
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    id v7 = [(PADatabaseManager *)self currentConfiguration];

    if (!v7) {
      return;
    }
    v4 = +[PASettings sharedInstance];
    v6 = [(PADatabaseManager *)self currentConfiguration];
    [v4 setPersonalMediaConfiguration:v6];
  }
}

- (BOOL)saveConfiguration:(id)a3
{
  id v4 = a3;
  [(HCDatabaseManager *)self setupDatabase];
  uint64_t v5 = [(HCDatabaseManager *)self managedObjectContext];

  if (v5)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    id v15 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v6 encodeObject:v4 forKey:*MEMORY[0x263F081D0]];
    [v6 finishEncoding];
    id v7 = [v6 encodedData];
    if ([v7 length])
    {
      objc_super v8 = [(HCDatabaseManager *)self managedObjectContext];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __39__PADatabaseManager_saveConfiguration___block_invoke;
      v11[3] = &unk_264103860;
      v11[4] = self;
      v13 = v14;
      id v12 = v7;
      [v8 performBlockAndWait:v11];

      BOOL v9 = [(HCDatabaseManager *)self saveIfPossible];
    }
    else
    {
      BOOL v9 = 0;
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    [(PADatabaseManager *)self logMessage:@"No context"];
    BOOL v9 = 0;
  }

  return v9;
}

void __39__PADatabaseManager_saveConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PersonalAudioSettings"];
  [v2 setReturnsObjectsAsFaults:0];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  v6 = [v5 lastObject];
  if (!v6 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x263EFF240];
    objc_super v8 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v9 = [v7 insertNewObjectForEntityForName:@"PersonalAudioSettings" inManagedObjectContext:v8];

    v6 = (void *)v9;
  }
  [v6 setVersion:&unk_26C1E9F38];
  [v6 setAudioSettings:*(void *)(a1 + 40)];
  PAInitializeLogging();
  uint64_t v10 = [NSString stringWithFormat:@"Updated config. Saving"];
  uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[PADatabaseManager saveConfiguration:]_block_invoke", 97, v10];
  id v12 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    v14 = v12;
    uint64_t v15 = [v13 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = v15;
    _os_log_impl(&dword_20CD3E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (id)currentConfiguration
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  id v3 = (void *)MEMORY[0x210557A80](self, a2);
  uint64_t v4 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PersonalAudioSettings"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v5 = [(HCDatabaseManager *)self managedObjectContext];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41__PADatabaseManager_currentConfiguration__block_invoke;
  v19[3] = &unk_264103888;
  v21 = &v23;
  v19[4] = self;
  id v6 = v4;
  id v20 = v6;
  v22 = &v29;
  [v5 performBlockAndWait:v19];

  if (v30[5])
  {
    id v7 = 0;
  }
  else
  {
    objc_super v8 = [(id)v24[5] lastObject];
    uint64_t v9 = [v8 audioSettings];
    if (v9
      && ([v8 version],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToNumber:&unk_26C1E9F38],
          v10,
          v9,
          v11))
    {
      id v12 = objc_alloc(MEMORY[0x263F08928]);
      id v13 = [v8 audioSettings];
      v14 = (id *)(v30 + 5);
      id obj = (id)v30[5];
      uint64_t v15 = (void *)[v12 initForReadingFromData:v13 error:&obj];
      objc_storeStrong(v14, obj);

      if (v30[5])
      {
        id v7 = 0;
      }
      else
      {
        v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
        id v7 = [v15 decodeObjectOfClasses:v16 forKey:*MEMORY[0x263F081D0]];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v7;
}

void __41__PADatabaseManager_currentConfiguration__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end