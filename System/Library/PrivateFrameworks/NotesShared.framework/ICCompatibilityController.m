@interface ICCompatibilityController
+ (ICCompatibilityController)sharedController;
- (BOOL)fakesIncompatibleDevicesForDebugging;
- (ICCompatibilityController)init;
- (NSArray)fakeDevices;
- (OS_dispatch_queue)queue;
- (id)cachedDevicesDateForAccount:(id)a3;
- (id)cachedDevicesForAccount:(id)a3;
- (id)fetchDevicesForAccount:(id)a3;
- (void)cacheDevices:(id)a3 forAccount:(id)a4;
- (void)clearCachedDevicesForAccount:(id)a3;
- (void)devicesForAccount:(id)a3 completionHandler:(id)a4;
- (void)messageForAccount:(id)a3 minimumNotesVersion:(int64_t)a4 completionHandler:(id)a5;
- (void)setFakesIncompatibleDevicesForDebugging:(BOOL)a3;
@end

@implementation ICCompatibilityController

- (ICCompatibilityController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICCompatibilityController;
  v2 = [(ICCompatibilityController *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_get_global_queue(-32768, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.notes.compatibility-controller", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (ICCompatibilityController)sharedController
{
  if (sharedController_onceToken_1 != -1) {
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_57);
  }
  v2 = (void *)sharedController_sharedController_0;
  return (ICCompatibilityController *)v2;
}

void __45__ICCompatibilityController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(ICCompatibilityController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;
}

- (void)devicesForAccount:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    __int16 v24 = 2080;
    v25 = "-[ICCompatibilityController devicesForAccount:completionHandler:]";
    __int16 v26 = 1024;
    int v27 = 57;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);
  }
  v10 = [v6 objectID];
  v11 = +[ICNoteContext sharedContext];
  v12 = [v11 workerManagedObjectContext];

  v13 = [(ICCompatibilityController *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke;
  v17[3] = &unk_1E64A7FD0;
  id v18 = v12;
  v19 = self;
  id v20 = v10;
  id v21 = v7;
  id v14 = v10;
  id v15 = v7;
  id v16 = v12;
  dispatch_async(v13, v17);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2;
  v3[3] = &unk_1E64A8C70;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 performBlockAndWait:v3];
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (![*(id *)(a1 + 32) fakesIncompatibleDevicesForDebugging])
  {
    id v5 = objc_msgSend(*(id *)(a1 + 40), "ic_existingObjectWithID:", *(void *)(a1 + 48));
    id v6 = [MEMORY[0x1E4F836D8] sharedInstance];
    id v7 = [v6 accountStore];
    objc_super v8 = [v5 identifier];
    v9 = [v7 accountWithIdentifier:v8];

    if (!v9)
    {
      id v21 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_2(v21);
      }

      uint64_t v22 = *(void *)(a1 + 56);
      if (v22) {
        (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
      }
      goto LABEL_30;
    }
    v10 = [*v2 cachedDevicesDateForAccount:v5];
    v11 = [*v2 cachedDevicesForAccount:v5];
    if (v11
      && v10
      && ([v10 timeIntervalSinceNow],
          double v13 = -v12,
          +[ICCloudConfiguration sharedConfiguration],
          id v14 = objc_claimAutoreleasedReturnValue(),
          double v15 = (double)(unint64_t)[v14 unsupportedNoteDeviceCheckIntervalSeconds],
          v14,
          v13 < v15))
    {
      id v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_3(v11);
      }

      uint64_t v17 = *(void *)(a1 + 56);
      if (!v17) {
        goto LABEL_29;
      }
      id v18 = *(void (**)(void))(v17 + 16);
    }
    else
    {
      if ([MEMORY[0x1E4F837F8] isInternetReachable])
      {
        v19 = [*v2 fetchDevicesForAccount:v9];
        if (v19) {
          [*v2 cacheDevices:v19 forAccount:v5];
        }
        uint64_t v20 = *(void *)(a1 + 56);
        if (v20) {
          (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v19);
        }

        goto LABEL_29;
      }
      v23 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_4(v23);
      }

      uint64_t v24 = *(void *)(a1 + 56);
      if (!v24) {
        goto LABEL_29;
      }
      id v18 = *(void (**)(void))(v24 + 16);
    }
    v18();
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_1(v2);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    id v5 = [*v2 fakeDevices];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_31:
  }
}

- (id)fetchDevicesForAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2080;
    double v13 = "-[ICCompatibilityController fetchDevicesForAccount:]";
    __int16 v14 = 1024;
    int v15 = 110;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEFAULT, "Fetching compatibility devices for account… {account: %@}%s:%d", (uint8_t *)&v10, 0x1Cu);
  }

  id v5 = [[ICDeviceListRequest alloc] initWithAccount:v3];
  [(ICDeviceListRequest *)v5 fetchWithCompletionBlock:&__block_literal_global_12];
  [(ICDeviceListRequest *)v5 waitForFetchWithTimeout:20.0];
  id v6 = [(ICDeviceListRequest *)v5 devices];
  id v7 = objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_16);

  objc_super v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCompatibilityController fetchDevicesForAccount:](v7);
  }

  return v7;
}

void __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_cold_1();
    }
  }
}

ICCompatibilityControllerDevice *__52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ICCompatibilityControllerDevice alloc] initWithMigrationDeviceInfo:v2];

  return v3;
}

- (id)cachedDevicesDateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v5 = [v3 identifier];

  id v6 = [@"AccountDevicesCacheDate-" stringByAppendingString:v5];
  id v7 = [v4 objectForKey:v6];
  objc_super v8 = ICCheckedDynamicCast();

  return v8;
}

- (id)cachedDevicesForAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v5;
    __int16 v17 = 2080;
    id v18 = "-[ICCompatibilityController cachedDevicesForAccount:]";
    __int16 v19 = 1024;
    int v20 = 141;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving cached compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);
  }
  id v6 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v7 = [v3 identifier];
  objc_super v8 = [@"AccountDevicesCache-" stringByAppendingString:v7];
  v9 = [v6 dataForKey:v8];

  if (v9)
  {
    id v14 = 0;
    int v10 = [MEMORY[0x1E4F28DC0] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v9 error:&v14];
    id v11 = v14;
    if (v11)
    {
      __int16 v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ICCompatibilityController cachedDevicesForAccount:]();
      }
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)cacheDevices:(id)a3 forAccount:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [v5 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    int v20 = v8;
    __int16 v21 = 2080;
    uint64_t v22 = "-[ICCompatibilityController cacheDevices:forAccount:]";
    __int16 v23 = 1024;
    int v24 = 159;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Caching compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);
  }
  id v18 = 0;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];

  id v10 = v18;
  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICCompatibilityController cacheDevices:forAccount:]();
    }
  }
  else
  {
    __int16 v12 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    double v13 = [v5 identifier];
    id v14 = [@"AccountDevicesCache-" stringByAppendingString:v13];
    [v12 setObject:v9 forKey:v14];

    id v11 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    int v15 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v16 = [v5 identifier];
    __int16 v17 = [@"AccountDevicesCacheDate-" stringByAppendingString:v16];
    [v11 setObject:v15 forKey:v17];
  }
}

- (void)clearCachedDevicesForAccount:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F836E0];
  id v4 = a3;
  id v5 = [v3 sharedAppGroupDefaults];
  id v6 = [v4 identifier];
  id v7 = [@"AccountDevicesCache-" stringByAppendingString:v6];
  [v5 setObject:0 forKey:v7];

  id v10 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  objc_super v8 = [v4 identifier];

  v9 = [@"AccountDevicesCacheDate-" stringByAppendingString:v8];
  [v10 setObject:0 forKey:v9];
}

- (void)messageForAccount:(id)a3 minimumNotesVersion:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 shortLoggingDescription];
    __int16 v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
    *(_DWORD *)buf = 138413058;
    id v18 = v11;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    int v20 = v12;
    uint64_t v22 = "-[ICCompatibilityController messageForAccount:minimumNotesVersion:completionHandler:]";
    __int16 v23 = 1024;
    int v24 = 181;
    _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving incompatibility messages for account… {account: %@, minimumNotesVersion: %@}%s:%d", buf, 0x26u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke;
  v14[3] = &unk_1E64A8D00;
  id v15 = v9;
  int64_t v16 = a4;
  id v13 = v9;
  [(ICCompatibilityController *)self devicesForAccount:v8 completionHandler:v14];
}

void __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke_2;
  v15[3] = &unk_1E64A8CD8;
  uint64_t v4 = *(void *)(a1 + 40);
  v15[4] = &v20;
  v15[5] = &v24;
  v15[6] = &v16;
  v15[7] = v4;
  id v5 = objc_msgSend(v3, "ic_compactMap:", v15);
  if (v21[3])
  {
    id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"*Device can’t be upgraded." value:@"*Device can’t be upgraded." table:0 allowSiri:1];
    v34[0] = &stru_1F1F2FFF8;
    v34[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v7];

    id v5 = (void *)v8;
  }
  id v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v25[3]];
    id v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v21[3]];
    id v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v17[3]];
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    __int16 v30 = 2112;
    v31 = v13;
    __int16 v32 = 2112;
    v33 = v14;
    _os_log_debug_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEBUG, "Fetched incompatible devices for account {#devicesToUpgrade: %@, #nonUpgradableDevices %@, #upgradedDevices: %@}", buf, 0x20u);
  }
  if ([v5 count])
  {
    id v10 = [v5 componentsJoinedByString:@"\n"];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

id __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 maximumNotesVersion] >= a1[7])
  {
    if ([v3 notesVersion] >= a1[7])
    {
      id v6 = 0;
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
    else
    {
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
      id v6 = [v3 name];
    }
  }
  else
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v4 = NSString;
    id v5 = [v3 name];
    id v6 = [v4 localizedStringWithFormat:@"%@*", v5];
  }
  return v6;
}

- (BOOL)fakesIncompatibleDevicesForDebugging
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v3 = NSStringFromSelector(sel_fakesIncompatibleDevicesForDebugging);
  char v4 = [v2 BOOLForKey:v3];

  return v4;
}

- (void)setFakesIncompatibleDevicesForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  char v4 = NSStringFromSelector(sel_fakesIncompatibleDevicesForDebugging);
  [v5 setBool:v3 forKey:v4];
}

- (NSArray)fakeDevices
{
  return self->_fakeDevices;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fakeDevices, 0);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_1(id *a1)
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  id v2 = [*a1 fakeDevices];
  BOOL v3 = objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v4, v5, "Returning fake compatibility devices for debugging {#devices: %@}", v6, v7, v8, v9, v10);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Cannot retrieve compatibility devices for account because it has no Apple Account", v1, 2u);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_3(void *a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Returning compatibility cached devices {#devices: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Cannot retrieve compatibility devices for account because the device is offline", v1, 2u);
}

- (void)fetchDevicesForAccount:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Fetched compatibility devices for account {#devices: %@}", v4, v5, v6, v7, v8);
}

void __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Error fetching compatibility devices for account {error: %@}", v1, 0xCu);
}

- (void)cachedDevicesForAccount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error retrieving compatibility devices {error: %@}", v1, 0xCu);
}

- (void)cacheDevices:forAccount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error caching compatibility devices {error: %@}", v1, 0xCu);
}

@end