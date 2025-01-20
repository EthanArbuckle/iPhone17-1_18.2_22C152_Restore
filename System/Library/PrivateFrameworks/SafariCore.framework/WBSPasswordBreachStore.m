@interface WBSPasswordBreachStore
+ (BOOL)_readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:(id)a3 expectedValue:(id)a4;
+ (id)_createPersistentIdentifierCanary;
+ (void)_createPersistentIdentifierCanary;
- (NSArray)recentlyBreachedPersistentIdentifiers;
- (NSArray)resultRecords;
- (NSDate)lastSessionCompletionDate;
- (NSDictionary)passwordEvaluationResuts;
- (NSDictionary)queuedPasswordBagManagerState;
- (WBSPasswordBreachStore)initWithBackingStoreURL:(id)a3;
- (unint64_t)rampIdentifier;
- (void)saveAndCloseStoreSynchronously;
- (void)saveStoreSynchronously;
- (void)setLastSessionCompletionDate:(id)a3;
- (void)setPasswordEvaluationResuts:(id)a3;
- (void)setQueuedPasswordBagManagerState:(id)a3;
- (void)setRampIdentifier:(unint64_t)a3;
- (void)setRecentlyBreachedPersistentIdentifiers:(id)a3;
- (void)setResultRecords:(id)a3;
@end

@implementation WBSPasswordBreachStore

- (WBSPasswordBreachStore)initWithBackingStoreURL:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSPasswordBreachStore;
  v5 = [(WBSPasswordBreachStore *)&v17 init];
  if (v5)
  {
    v6 = [WBSPersistentPropertyListStore alloc];
    uint64_t v18 = *MEMORY[0x1E4F1C630];
    v19[0] = MEMORY[0x1E4F1CC38];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v8 = [(WBSPersistentPropertyListStore *)v6 initWithBackingStoreURL:v4 fileResourceValues:v7];
    store = v5->_store;
    v5->_store = (WBSPersistentPropertyListStore *)v8;

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke;
    v15 = &unk_1E615C230;
    id v16 = v4;
    [(WBSPersistentPropertyListStore *)v5->_store setCreateEmptyStoreHandler:&v12];
    -[WBSPersistentPropertyListStore setValidateLoadedStoreHandler:](v5->_store, "setValidateLoadedStoreHandler:", &__block_literal_global_41, v12, v13, v14, v15);
    v10 = v5;
  }
  return v5;
}

id __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"Version";
  v10[0] = &unk_1F10863E0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v3 = (void *)[v2 mutableCopy];

  if (*(void *)(a1 + 32))
  {
    id v4 = +[WBSPasswordBreachStore _createPersistentIdentifierCanary];
    id v5 = v4;
    if (!v4) {
      goto LABEL_5;
    }
    v6 = [v4 first];
    [v3 setObject:v6 forKeyedSubscript:@"KeychainPersistentIdentifierCanaryPersistentIdentifier"];

    v7 = [v5 second];
    [v3 setObject:v7 forKeyedSubscript:@"KeychainPersistentIdentifierCanaryValue"];
  }
  id v5 = v3;
LABEL_5:

  return v5;
}

id __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "safari_numberForKey:", @"Version");
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (v4 == 1)
  {
    id v5 = objc_msgSend(v2, "safari_dataForKey:", @"KeychainPersistentIdentifierCanaryPersistentIdentifier");
    if (![v5 length])
    {
      v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_1();
      }
      v9 = 0;
      goto LABEL_20;
    }
    v6 = objc_msgSend(v2, "safari_stringForKey:", @"KeychainPersistentIdentifierCanaryValue");
    if ([v6 length])
    {
      if (+[WBSPasswordBreachStore _readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:v5 expectedValue:v6])
      {
        v7 = [v2 valueForKey:@"PasswordEvaluationResults"];

        if (v7)
        {
          uint64_t v8 = (void *)[v2 mutableCopy];
          [v8 removeObjectForKey:@"PasswordEvaluationResults"];

          id v2 = v8;
        }
        id v2 = v2;
        v9 = v2;
        goto LABEL_19;
      }
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_3();
      }
    }
    else
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_2();
      }
    }
    v9 = 0;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_4(v4, v10);
  }
  v9 = 0;
LABEL_21:

  return v9;
}

- (NSDictionary)queuedPasswordBagManagerState
{
  return (NSDictionary *)[(WBSPersistentPropertyListStore *)self->_store dictionaryForKey:@"QueuedPasswordBagManagerState"];
}

- (void)setQueuedPasswordBagManagerState:(id)a3
{
}

- (NSArray)resultRecords
{
  return (NSArray *)[(WBSPersistentPropertyListStore *)self->_store arrayForKey:@"CheckerResultsState"];
}

- (void)setResultRecords:(id)a3
{
}

- (NSArray)recentlyBreachedPersistentIdentifiers
{
  return (NSArray *)[(WBSPersistentPropertyListStore *)self->_store arrayForKey:@"CheckerRecentlyBreachedResultIdentifiers"];
}

- (void)setRecentlyBreachedPersistentIdentifiers:(id)a3
{
}

- (unint64_t)rampIdentifier
{
  id v2 = [(WBSPersistentPropertyListStore *)self->_store numberForKey:@"RampIdentifier"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setRampIdentifier:(unint64_t)a3
{
  store = self->_store;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WBSPersistentPropertyListStore *)store setObject:v4 forKey:@"RampIdentifier"];
}

- (NSDate)lastSessionCompletionDate
{
  return (NSDate *)[(WBSPersistentPropertyListStore *)self->_store dateForKey:@"LastSessionCompletionDate"];
}

- (void)setLastSessionCompletionDate:(id)a3
{
}

- (NSDictionary)passwordEvaluationResuts
{
  return (NSDictionary *)[(WBSPersistentPropertyListStore *)self->_store dictionaryForKey:@"PasswordEvaluationResults-redacted"];
}

- (void)setPasswordEvaluationResuts:(id)a3
{
}

- (void)saveStoreSynchronously
{
}

- (void)saveAndCloseStoreSynchronously
{
}

+ (id)_createPersistentIdentifierCanary
{
  v41[6] = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B578], 0, &error);
  if (v2)
  {
    SecAccessControlRef v3 = v2;
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];

    uint64_t v6 = *MEMORY[0x1E4F3B978];
    uint64_t v7 = *MEMORY[0x1E4F3B988];
    uint64_t v8 = *MEMORY[0x1E4F3B850];
    v40[0] = *MEMORY[0x1E4F3B978];
    v40[1] = v8;
    v41[0] = v7;
    v41[1] = @"KeychainPersistentIdentifierCanaryPersistentIdentifier";
    uint64_t v9 = *MEMORY[0x1E4F3BD38];
    v40[2] = *MEMORY[0x1E4F3BD38];
    v33 = v5;
    v10 = [(__CFError *)v5 dataUsingEncoding:4];
    uint64_t v11 = *MEMORY[0x1E4F3BC78];
    uint64_t v12 = *MEMORY[0x1E4F1CFD0];
    v41[2] = v10;
    v41[3] = v12;
    uint64_t v13 = *MEMORY[0x1E4F3B548];
    uint64_t v32 = v11;
    v40[3] = v11;
    v40[4] = v13;
    uint64_t v14 = *MEMORY[0x1E4F3B550];
    v40[5] = *MEMORY[0x1E4F3B550];
    v41[4] = v3;
    v41[5] = @"com.apple.cfnetwork";
    CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];

    CFTypeRef result = 0;
    OSStatus v16 = SecItemAdd(v15, &result);
    if (v16)
    {
      int v17 = v16;
      if (v16 != -25299)
      {
        v25 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary];
        }
        v24 = 0;
        CFErrorRef v19 = v33;
        goto LABEL_25;
      }
      CFDictionaryRef v31 = v15;
      v38[0] = v6;
      v38[1] = v8;
      v39[0] = v7;
      v39[1] = @"KeychainPersistentIdentifierCanaryPersistentIdentifier";
      v38[2] = v14;
      v39[2] = @"com.apple.cfnetwork";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
      uint64_t v36 = v9;
      CFErrorRef v19 = v33;
      v20 = [(__CFError *)v33 dataUsingEncoding:4];
      v37 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];

      if (SecItemUpdate((CFDictionaryRef)v18, (CFDictionaryRef)v21))
      {
        v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.5();
        }
LABEL_17:

        v24 = 0;
        CFDictionaryRef v15 = v31;
LABEL_25:

        goto LABEL_26;
      }
      v26 = (void *)[v18 mutableCopy];
      [v26 setObject:v12 forKeyedSubscript:v32];
      if (SecItemCopyMatching((CFDictionaryRef)v26, &result))
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.4();
        }

        goto LABEL_17;
      }

      CFDictionaryRef v15 = v31;
    }
    v28 = (void *)result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFErrorRef v19 = v33;
      v24 = [[WBSPair alloc] initWithFirst:v28 second:v33];
    }
    else
    {
      v29 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      CFErrorRef v19 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[WBSPasswordBreachStore _createPersistentIdentifierCanary]();
      }
      v24 = 0;
    }

    goto LABEL_25;
  }
  CFErrorRef v19 = error;
  v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[WBSPasswordBreachStore _createPersistentIdentifierCanary];
  }
  v24 = 0;
LABEL_26:

  return v24;
}

+ (BOOL)_readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:(id)a3 expectedValue:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F3BD40];
  v21[0] = *MEMORY[0x1E4F3B978];
  v21[1] = v7;
  v22[0] = *MEMORY[0x1E4F3B988];
  v22[1] = v5;
  v21[2] = *MEMORY[0x1E4F3BC70];
  v22[2] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v18[0] = 0;
  OSStatus v9 = SecItemCopyMatching(v8, v18);
  if (v9)
  {
    OSStatus v10 = v9;
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v20 = v10;
      _os_log_impl(&dword_1B728F000, v11, OS_LOG_TYPE_DEFAULT, "Could not find canary in keychain: %d", buf, 8u);
    }
LABEL_10:

    uint64_t v13 = 0;
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = (void *)v18[0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFDictionaryRef v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v15, OS_LOG_TYPE_DEFAULT, "Canary item in keychain had unexpected type", buf, 2u);
    }

    goto LABEL_10;
  }
  uint64_t v13 = (void *)[[NSString alloc] initWithData:v12 encoding:4];

  if (([v13 isEqualToString:v6] & 1) == 0)
  {
    int v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl(&dword_1B728F000, v17, OS_LOG_TYPE_DEFAULT, "Canary item in keychain did not match plist value.", (uint8_t *)v18, 2u);
    }
    goto LABEL_11;
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Store is missing canary identifier; resetting.", v2, v3, v4, v5, v6);
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Store is missing canary value; resetting.", v2, v3, v4, v5, v6);
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Canary is invalid; resetting store.", v2, v3, v4, v5, v6);
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_32_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Unexpected store version %{public}lu, resetting store.", (uint8_t *)&v2, 0xCu);
}

+ (void)_createPersistentIdentifierCanary
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Could not update existing canary value in keychain.", v2, v3, v4, v5, v6);
}

@end