@interface UNCBundleLibrarian
- (BOOL)_isUUIDString:(id)a3;
- (BOOL)_queue_saveDictionary:(id)a3 atPath:(id)a4;
- (UNCBundleLibrarian)initWithDirectory:(id)a3;
- (id)_queue_bundleIdentifierForUniqueIdentifier:(id)a3;
- (id)_queue_dataAtPath:(id)a3;
- (id)_queue_dictionaryAtPath:(id)a3;
- (id)_queue_uniqueIdentifierForBundleIdentifier:(id)a3;
- (id)bundleIdentifierForUniqueIdentifier:(id)a3;
- (id)uniqueIdentifierForBundleIdentifier:(id)a3;
- (void)_queue_addEntryForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (void)_queue_loadBundleLibrary;
- (void)_queue_loadBundleLibraryIfNeeded;
- (void)_queue_migrateBundleDirectoriesInDirectory:(id)a3;
- (void)_queue_removeEntryForBundleIdentifier:(id)a3;
- (void)_queue_removeUnknownDirectoriesFromLibrary;
- (void)_queue_removeUnknownDirectoriesInDirectory:(id)a3;
- (void)_removeBundleLibrary;
- (void)bootstrapLibraryForBundleIdentifiers:(id)a3;
- (void)migrateLibraryFromDirectory:(id)a3 toDirectory:(id)a4;
- (void)removeMappingForBundleIdentifier:(id)a3;
@end

@implementation UNCBundleLibrarian

- (id)uniqueIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__UNCBundleLibrarian_uniqueIdentifierForBundleIdentifier___block_invoke;
  block[3] = &unk_265567A20;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "No unique identifier for bundleID %{public}@", buf, 0xCu);
    }
    v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __58__UNCBundleLibrarian_uniqueIdentifierForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_bundleIdentifierForUniqueIdentifier:", *(void *)(a1 + 40));

  if (v2)
  {
    v3 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v4;
      _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Unique identifier provided when requesting unique identifer for bundle identifier (%{public}@)", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = [*(id *)(a1 + 40) copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_uniqueIdentifierForBundleIdentifier:", *(void *)(a1 + 40));
    MEMORY[0x270F9A758]();
  }
}

- (id)_queue_bundleIdentifierForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  [(UNCBundleLibrarian *)self _queue_loadBundleLibraryIfNeeded];
  uint64_t v5 = [(NSMutableDictionary *)self->_uuidToBundleMap objectForKey:v4];

  return v5;
}

- (id)_queue_uniqueIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(UNCBundleLibrarian *)self _queue_loadBundleLibraryIfNeeded];
  uint64_t v5 = [(NSMutableDictionary *)self->_bundleToUUIDMap objectForKey:v4];
  uint64_t v6 = (void *)v5;
  if (v4 && !v5)
  {
    v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v7 UUIDString];

    int v8 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "No unique identifier for bundleID %{public}@ found; adding a mapping to %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    [(UNCBundleLibrarian *)self _queue_addEntryForBundleIdentifier:v4 uniqueIdentifier:v6];
  }

  return v6;
}

- (void)_queue_loadBundleLibraryIfNeeded
{
  if (!self->_bundleToUUIDMap)
  {
    v3 = (void *)MEMORY[0x261221EF0]();
    [(UNCBundleLibrarian *)self _queue_loadBundleLibrary];
  }
}

- (UNCBundleLibrarian)initWithDirectory:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCBundleLibrarian;
  uint64_t v5 = [(UNCBundleLibrarian *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"Library"];
    uint64_t v7 = [v6 stringByAppendingPathExtension:@"plist"];
    bundleLibraryPath = v5->_bundleLibraryPath;
    v5->_bundleLibraryPath = (NSString *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.UserNotificationServer.librarian", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

- (void)bootstrapLibraryForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__UNCBundleLibrarian_bootstrapLibraryForBundleIdentifiers___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __59__UNCBundleLibrarian_bootstrapLibraryForBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadBundleLibraryIfNeeded");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    id v8 = (os_log_t *)MEMORY[0x263F1E030];
    *(void *)&long long v4 = 138543618;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v10, v14, (void)v15);
        if (!v11)
        {
          __int16 v12 = [MEMORY[0x263F08C38] UUID];
          id v11 = [v12 UUIDString];

          [*(id *)(*(void *)(a1 + 32) + 16) setObject:v11 forKey:v10];
          [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKey:v11];
          objc_super v13 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v10;
            __int16 v21 = 2114;
            uint64_t v22 = v11;
            _os_log_impl(&dword_2608DB000, v13, OS_LOG_TYPE_DEFAULT, "Creating library mapping from %{public}@ to %{public}@", buf, 0x16u);
          }
          char v6 = 1;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);

    if (v6) {
      objc_msgSend(*(id *)(a1 + 32), "_queue_saveDictionary:atPath:", *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 8));
    }
  }
  else
  {
  }
}

- (id)bundleIdentifierForUniqueIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__3;
  long long v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__UNCBundleLibrarian_bundleIdentifierForUniqueIdentifier___block_invoke;
  block[3] = &unk_265567700;
  objc_super v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(queue, block);
  uint64_t v7 = (void *)v15[5];
  if (!v7)
  {
    id v8 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "No bundleID for unique identifier %{public}@", buf, 0xCu);
    }
    uint64_t v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __58__UNCBundleLibrarian_bundleIdentifierForUniqueIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_bundleIdentifierForUniqueIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)removeMappingForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__UNCBundleLibrarian_removeMappingForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __55__UNCBundleLibrarian_removeMappingForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "Removing library mapping for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_removeEntryForBundleIdentifier:", *(void *)(a1 + 32));
}

- (void)migrateLibraryFromDirectory:(id)a3 toDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if ([v2 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 8)])
  {
    uint64_t v3 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v4;
      _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Library exists at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    int v5 = [*(id *)(a1 + 40) stringByAppendingPathComponent:@"Library"];
    id v6 = [v5 stringByAppendingPathExtension:@"plist"];

    id v7 = [MEMORY[0x263F08850] defaultManager];
    int v8 = [v7 fileExistsAtPath:v6];

    if (v8)
    {
      id v9 = (os_log_t *)MEMORY[0x263F1E030];
      id v10 = *MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v6;
        _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "Migrate library from %{public}@", buf, 0xCu);
      }
      id v11 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      id v22 = 0;
      char v13 = [v11 moveItemAtPath:v6 toPath:v12 error:&v22];
      id v14 = v22;

      if ((v13 & 1) == 0)
      {
        long long v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
          *(_DWORD *)buf = 138543874;
          uint64_t v24 = v6;
          __int16 v25 = 2114;
          uint64_t v26 = v20;
          __int16 v27 = 2114;
          id v28 = v14;
          _os_log_error_impl(&dword_2608DB000, v15, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ as a part of library migration error: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v17 = *(void *)(a1 + 40);
      id v21 = 0;
      char v18 = [v16 removeItemAtPath:v17 error:&v21];
      id v19 = v21;

      if ((v18 & 1) == 0 && os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
        __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 32), "_queue_removeUnknownDirectoriesFromLibrary");
      objc_msgSend(*(id *)(a1 + 32), "_queue_removeUnknownDirectoriesInDirectory:", *(void *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_queue_migrateBundleDirectoriesInDirectory:", *(void *)(a1 + 48));
    }
  }
}

- (void)_queue_removeUnknownDirectoriesFromLibrary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(UNCBundleLibrarian *)self _queue_loadBundleLibraryIfNeeded];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_bundleToUUIDMap allKeys];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    id v9 = (os_log_t *)MEMORY[0x263F1E030];
    *(void *)&long long v6 = 138543362;
    long long v13 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[UNCBundleLibrarian _isUUIDString:](self, "_isUUIDString:", v11, v13))
        {
          uint64_t v12 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v11;
            _os_log_error_impl(&dword_2608DB000, v12, OS_LOG_TYPE_ERROR, "Removing invalid library mapping for %{public}@", buf, 0xCu);
          }
          [(UNCBundleLibrarian *)self _queue_removeEntryForBundleIdentifier:v11];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_queue_removeUnknownDirectoriesInDirectory:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(UNCBundleLibrarian *)self _queue_loadBundleLibraryIfNeeded];
  v23 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v24 = v4;
  uint64_t v5 = [v23 contentsOfDirectoryAtPath:v4 error:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * v9);
        uint64_t v11 = [(NSMutableDictionary *)self->_uuidToBundleMap objectForKey:v10];
        if (v11) {
          goto LABEL_7;
        }
        if ([(UNCBundleLibrarian *)self _isUUIDString:v10])
        {
          uint64_t v11 = [v24 stringByAppendingPathComponent:v10];
          unsigned __int8 v26 = 0;
          uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
          int v13 = [v12 fileExistsAtPath:v11 isDirectory:&v26];
          int v14 = v26;

          if (v13) {
            BOOL v15 = v14 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            long long v16 = *MEMORY[0x263F1E030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v32 = v11;
              _os_log_error_impl(&dword_2608DB000, v16, OS_LOG_TYPE_ERROR, "Removing %{public}@ as it is a stale notification source", buf, 0xCu);
            }
            long long v17 = [v24 stringByAppendingPathComponent:v10];
            char v18 = [MEMORY[0x263F08850] defaultManager];
            id v25 = 0;
            char v19 = [v18 removeItemAtPath:v17 error:&v25];
            id v20 = v25;

            if ((v19 & 1) == 0)
            {
              uint64_t v21 = *MEMORY[0x263F1E030];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v32 = v11;
                __int16 v33 = 2114;
                id v34 = v20;
                _os_log_error_impl(&dword_2608DB000, v21, OS_LOG_TYPE_ERROR, "Could not remove %{public}@ in cleanup after library migration error: %{public}@", buf, 0x16u);
              }
            }
          }
LABEL_7:
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v22 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v7 = v22;
    }
    while (v22);
  }
}

- (void)_queue_migrateBundleDirectoriesInDirectory:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F1E030];
  uint64_t v6 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v4;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "Migrate library from bundle directory struction %{public}@", buf, 0xCu);
  }
  [(UNCBundleLibrarian *)self _queue_loadBundleLibraryIfNeeded];
  __int16 v33 = [MEMORY[0x263F08850] defaultManager];
  [v33 contentsOfDirectoryAtPath:v4 error:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    id v34 = v4;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_uuidToBundleMap objectForKey:v11];
        if (v12)
        {
          id v13 = (id)v12;
          int v14 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v45 = v11;
            _os_log_impl(&dword_2608DB000, v14, OS_LOG_TYPE_DEFAULT, "Do not migrate directory %{public}@", buf, 0xCu);
          }
        }
        else
        {
          unsigned __int8 v39 = 0;
          BOOL v15 = [v4 stringByAppendingPathComponent:v11];
          long long v16 = [MEMORY[0x263F08850] defaultManager];
          int v17 = [v16 fileExistsAtPath:v15 isDirectory:&v39];
          int v18 = v39;

          if (v17) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            id v20 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v45 = v11;
              _os_log_impl(&dword_2608DB000, v20, OS_LOG_TYPE_DEFAULT, "Do not migrate file %{public}@", buf, 0xCu);
            }
            id v13 = 0;
          }
          else
          {
            if ([(UNCBundleLibrarian *)self _isUUIDString:v11])
            {
              uint64_t v21 = *v5;
              if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v45 = v15;
                _os_log_error_impl(&dword_2608DB000, v21, OS_LOG_TYPE_ERROR, "Removing %{public}@ as it is a stale notification source", buf, 0xCu);
              }
              uint64_t v22 = [MEMORY[0x263F08850] defaultManager];
              id v38 = 0;
              char v23 = [v22 removeItemAtPath:v15 error:&v38];
              id v24 = v38;

              if ((v23 & 1) == 0)
              {
                id v25 = *MEMORY[0x263F1E030];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  id v45 = v15;
                  __int16 v46 = 2114;
                  id v47 = v24;
                  _os_log_error_impl(&dword_2608DB000, v25, OS_LOG_TYPE_ERROR, "Could not remove %{public}@ in cleanup after library migration error: %{public}@", buf, 0x16u);
                }
              }

              id v13 = 0;
            }
            else
            {
              id v13 = v11;
              unsigned __int8 v26 = [(UNCBundleLibrarian *)self _queue_uniqueIdentifierForBundleIdentifier:v13];
              long long v27 = *v5;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v45 = v13;
                __int16 v46 = 2114;
                id v47 = v26;
                _os_log_impl(&dword_2608DB000, v27, OS_LOG_TYPE_DEFAULT, "Migrate directory from %{public}@ to %{public}@", buf, 0x16u);
              }
              long long v28 = [v4 stringByAppendingPathComponent:v26];
              long long v29 = [MEMORY[0x263F08850] defaultManager];
              id v37 = 0;
              char v30 = [v29 moveItemAtPath:v15 toPath:v28 error:&v37];
              id v31 = v37;

              if ((v30 & 1) == 0)
              {
                v32 = *MEMORY[0x263F1E030];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v45 = v15;
                  __int16 v46 = 2114;
                  id v47 = v28;
                  __int16 v48 = 2114;
                  id v49 = v31;
                  _os_log_error_impl(&dword_2608DB000, v32, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ as a part of library migration error: %{public}@", buf, 0x20u);
                }
              }

              id v4 = v34;
            }
            uint64_t v5 = (os_log_t *)MEMORY[0x263F1E030];
          }

          uint64_t v9 = v35;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v8);
  }
}

- (void)_removeBundleLibrary
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 32;
  if ([v2 fileExistsAtPath:*(void *)(v4 + 8)])
  {
    uint64_t v5 = *(void *)(*(void *)v3 + 8);
    id v8 = 0;
    char v6 = [v2 removeItemAtPath:v5 error:&v8];
    id v7 = v8;
    if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke_cold_1();
    }
  }
}

- (void)_queue_loadBundleLibrary
{
  uint64_t v3 = [(UNCBundleLibrarian *)self _queue_dictionaryAtPath:self->_bundleLibraryPath];
  uint64_t v4 = (NSMutableDictionary *)[v3 mutableCopy];
  bundleToUUIDMap = self->_bundleToUUIDMap;
  self->_bundleToUUIDMap = v4;

  char v6 = self->_bundleToUUIDMap;
  if (v6)
  {
    id v18 = [(NSMutableDictionary *)v6 allKeys];
    id v7 = self->_bundleToUUIDMap;
    id v8 = [MEMORY[0x263EFF9D0] null];
    uint64_t v9 = [(NSMutableDictionary *)v7 objectsForKeys:v18 notFoundMarker:v8];

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithObjects:v18 forKeys:v9];
    uuidToBundleMap = self->_uuidToBundleMap;
    self->_uuidToBundleMap = v10;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    id v13 = self->_bundleToUUIDMap;
    self->_bundleToUUIDMap = v12;

    int v14 = [MEMORY[0x263EFF9A0] dictionary];
    BOOL v15 = self->_uuidToBundleMap;
    self->_uuidToBundleMap = v14;

    bundleLibraryPath = self->_bundleLibraryPath;
    long long v16 = self->_bundleToUUIDMap;
    [(UNCBundleLibrarian *)self _queue_saveDictionary:v16 atPath:bundleLibraryPath];
  }
}

- (void)_queue_addEntryForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  bundleToUUIDMap = self->_bundleToUUIDMap;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableDictionary *)bundleToUUIDMap setObject:v7 forKey:v8];
  [(NSMutableDictionary *)self->_uuidToBundleMap setObject:v8 forKey:v7];

  bundleLibraryPath = self->_bundleLibraryPath;
  uint64_t v9 = self->_bundleToUUIDMap;

  [(UNCBundleLibrarian *)self _queue_saveDictionary:v9 atPath:bundleLibraryPath];
}

- (void)_queue_removeEntryForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCBundleLibrarian *)self _queue_uniqueIdentifierForBundleIdentifier:v4];
  [(NSMutableDictionary *)self->_bundleToUUIDMap removeObjectForKey:v4];

  [(NSMutableDictionary *)self->_uuidToBundleMap removeObjectForKey:v5];
  [(UNCBundleLibrarian *)self _queue_saveDictionary:self->_bundleToUUIDMap atPath:self->_bundleLibraryPath];
}

- (id)_queue_dictionaryAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCBundleLibrarian *)self _queue_dataAtPath:v4];
  if (!v5)
  {
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  char v6 = (void *)MEMORY[0x263F08928];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:0];

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = (void *)*MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        [(UNCBundleLibrarian *)v11 _queue_dictionaryAtPath:(uint64_t)v4];
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (id)_queue_dataAtPath:(id)a3
{
  id v3 = a3;
  id v7 = 0;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:0 error:&v7];
  id v5 = v7;
  if (!v4 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
    -[UNCBundleLibrarian _queue_dataAtPath:]();
  }

  return v4;
}

- (BOOL)_queue_saveDictionary:(id)a3 atPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_t *)MEMORY[0x263F1E030];
  uint64_t v8 = (void *)*MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = [v5 count];
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = [v6 stringByDeletingLastPathComponent];
  if (([v10 fileExistsAtPath:v11] & 1) == 0)
  {
    id v23 = 0;
    char v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v13 = v23;
    if ((v12 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.4();
    }
  }
  id v22 = 0;
  int v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
  id v15 = v22;
  long long v16 = v15;
  if (v14)
  {
    id v21 = v15;
    char v17 = [v14 writeToFile:v6 options:268435457 error:&v21];
    id v18 = v21;

    if (v17)
    {
      BOOL v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        -[UNCBundleLibrarian _queue_saveDictionary:atPath:]();
      }
      BOOL v19 = 0;
    }
    long long v16 = v18;
  }
  else
  {
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:]();
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_isUUIDString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuidToBundleMap, 0);
  objc_storeStrong((id *)&self->_bundleToUUIDMap, 0);

  objc_storeStrong((id *)&self->_bundleLibraryPath, 0);
}

void __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not remove %{public}@ in cleanup after library migration error: %{public}@");
}

void __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not remove bundle library at %{public}@; error: %{public}@");
}

- (void)_queue_dictionaryAtPath:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2608DB000, v4, OS_LOG_TYPE_ERROR, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_queue_dictionaryAtPath:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    uint64_t v6 = a2;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_2608DB000, v4, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v5,
      0x16u);
  }

  objc_end_catch();
}

- (void)_queue_dataAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "No data found at %{public}@: %{public}@");
}

- (void)_queue_saveDictionary:atPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not encode object data at %{public}@: %{public}@");
}

- (void)_queue_saveDictionary:atPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not write objects to %{public}@; error: %{public}@");
}

- (void)_queue_saveDictionary:(uint64_t)a3 atPath:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = objc_begin_catch(a1);
  int v5 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = a3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl(&dword_2608DB000, v5, OS_LOG_TYPE_ERROR, "Unable to archive objects at %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

- (void)_queue_saveDictionary:atPath:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2608DB000, v0, v1, "Could not create directory at %{public}@; error: %{public}@");
}

@end