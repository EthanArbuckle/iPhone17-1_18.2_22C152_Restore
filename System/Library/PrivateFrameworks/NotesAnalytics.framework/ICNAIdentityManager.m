@interface ICNAIdentityManager
+ (id)newSalt;
+ (id)saltedID:(id)a3 withSalt:(id)a4;
+ (id)sharedManager;
- (BOOL)identifierResetOccurred;
- (ICNAIdentityManager)init;
- (NSDate)currentDateForTesting;
- (NSDictionary)salts;
- (NSString)identityTimestampYYYYMM;
- (NSString)privateUserID;
- (NSString)userID;
- (NSUbiquitousKeyValueStore)encryptedKVStore;
- (OS_dispatch_queue)accessQueue;
- (id)saltedID:(id)a3 forClass:(Class)a4;
- (id)todayTimestampYYYYMM:(id)a3;
- (unint64_t)startMonth;
- (unint64_t)startYear;
- (void)_keyValueStoreDidChangeExternally:(id)a3;
- (void)debug_clearIdentifiers;
- (void)debug_dumpIdentifiers;
- (void)debug_forceRegenerateIdentifiers;
- (void)loadIdentifiersAndRegenerateIfNecessary;
- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(BOOL)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCurrentDateForTesting:(id)a3;
- (void)setEncryptedKVStore:(id)a3;
- (void)setIdentifierResetOccurred:(BOOL)a3;
- (void)setIdentityTimestampYYYYMM:(id)a3;
- (void)setPrivateUserID:(id)a3;
- (void)setSalts:(id)a3;
- (void)setStartMonth:(unint64_t)a3;
- (void)setStartYear:(unint64_t)a3;
- (void)setUserID:(id)a3;
@end

@implementation ICNAIdentityManager

+ (id)sharedManager
{
  if (sharedManager_s_onceToken != -1) {
    dispatch_once(&sharedManager_s_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedManager_s_instance;
  return v2;
}

uint64_t __36__ICNAIdentityManager_sharedManager__block_invoke()
{
  sharedManager_s_instance = objc_alloc_init(ICNAIdentityManager);
  return MEMORY[0x1F41817F8]();
}

- (ICNAIdentityManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICNAIdentityManager;
  v2 = [(ICNAIdentityManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.analytics.saltManager", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ICNAIdentityManager_init__block_invoke;
    block[3] = &unk_1E64B8A48;
    v9 = v2;
    dispatch_sync(v6, block);
  }
  return v2;
}

uint64_t __27__ICNAIdentityManager_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29130]) _initWithStoreIdentifier:@"com.apple.notes.analytics" usingEndToEndEncryption:1];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__keyValueStoreDidChangeExternally_ name:*MEMORY[0x1E4F28A30] object:*(void *)(*(void *)(a1 + 32) + 72)];

  v6 = *(void **)(a1 + 32);
  return [v6 loadIdentifiersFromKVSAndForceRegenerateIdentity:0];
}

- (void)loadIdentifiersAndRegenerateIfNecessary
{
  uint64_t v3 = [(ICNAIdentityManager *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICNAIdentityManager_loadIdentifiersAndRegenerateIfNecessary__block_invoke;
  block[3] = &unk_1E64B8A48;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __62__ICNAIdentityManager_loadIdentifiersAndRegenerateIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) encryptedKVStore];
  [v2 synchronize];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 loadIdentifiersFromKVSAndForceRegenerateIdentity:0];
}

- (NSString)userID
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  uint64_t v3 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_queue_t v4 = [(ICNAIdentityManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__ICNAIdentityManager_userID__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __29__ICNAIdentityManager_userID__block_invoke(uint64_t a1)
{
}

- (NSString)privateUserID
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  uint64_t v3 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_queue_t v4 = [(ICNAIdentityManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ICNAIdentityManager_privateUserID__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __36__ICNAIdentityManager_privateUserID__block_invoke(uint64_t a1)
{
}

- (id)todayTimestampYYYYMM:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
  }
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setCalendar:v4];
  [v5 setDateFormat:@"yyyyMM"];
  v6 = [v5 stringFromDate:v3];

  return v6;
}

- (NSString)identityTimestampYYYYMM
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  id v3 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_queue_t v4 = [(ICNAIdentityManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ICNAIdentityManager_identityTimestampYYYYMM__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __46__ICNAIdentityManager_identityTimestampYYYYMM__block_invoke(uint64_t a1)
{
}

- (unint64_t)startYear
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_queue_t v4 = [(ICNAIdentityManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ICNAIdentityManager_startYear__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __32__ICNAIdentityManager_startYear__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (unint64_t)startMonth
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_queue_t v4 = [(ICNAIdentityManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ICNAIdentityManager_startMonth__block_invoke;
  v7[3] = &unk_1E64B8A98;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__ICNAIdentityManager_startMonth__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (id)saltedID:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v7 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(ICNAIdentityManager *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICNAIdentityManager_saltedID_forClass___block_invoke;
  block[3] = &unk_1E64B9030;
  void block[4] = self;
  void block[5] = &v12;
  block[6] = a4;
  dispatch_sync(v8, block);

  v9 = [(id)objc_opt_class() saltedID:v6 withSalt:v13[5]];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __41__ICNAIdentityManager_saltedID_forClass___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) salts];
  uint64_t v2 = NSStringFromClass(*(Class *)(a1 + 48));
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)debug_forceRegenerateIdentifiers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Forced identifier regeneration requested", v2, v3, v4, v5, v6);
}

uint64_t __55__ICNAIdentityManager_debug_forceRegenerateIdentifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadIdentifiersFromKVSAndForceRegenerateIdentity:1];
}

- (void)debug_clearIdentifiers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Forced identifier deletion requested", v2, v3, v4, v5, v6);
}

uint64_t __45__ICNAIdentityManager_debug_clearIdentifiers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserID:0];
  [*(id *)(a1 + 32) setPrivateUserID:0];
  [*(id *)(a1 + 32) setSalts:0];
  [*(id *)(a1 + 32) setIdentityTimestampYYYYMM:0];
  [*(id *)(a1 + 32) setStartYear:0];
  [*(id *)(a1 + 32) setStartMonth:0];
  uint64_t v2 = [*(id *)(a1 + 32) encryptedKVStore];
  [v2 removeObjectForKey:@"identityManager"];

  uint64_t v3 = [*(id *)(a1 + 32) encryptedKVStore];
  [v3 synchronize];

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCurrentDateForTesting:0];
}

- (void)debug_dumpIdentifiers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(ICNAIdentityManager *)self userID];
    uint64_t v5 = (void *)v4;
    if (v4) {
      uint8_t v6 = (__CFString *)v4;
    }
    else {
      uint8_t v6 = @"nil";
    }
    v20[0] = v6;
    v19[1] = @"privateUserID";
    uint64_t v7 = [(ICNAIdentityManager *)self privateUserID];
    uint64_t v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = @"nil";
    }
    v20[1] = v9;
    v19[2] = @"salts";
    uint64_t v10 = [(ICNAIdentityManager *)self salts];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    else {
      uint64_t v12 = @"nil";
    }
    v20[2] = v12;
    v19[3] = @"identityTimestampYYYYMM";
    uint64_t v13 = [(ICNAIdentityManager *)self identityTimestampYYYYMM];
    uint64_t v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"nil";
    }
    v20[3] = v15;
    v19[4] = @"startYear";
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNAIdentityManager startYear](self, "startYear"));
    v20[4] = v16;
    v19[5] = @"startMonth";
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNAIdentityManager startMonth](self, "startMonth"));
    v20[5] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_debug_impl(&dword_1C3EAD000, v3, OS_LOG_TYPE_DEBUG, "Identifiers: %@", buf, 0xCu);
  }
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ICNAIdentityManager *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_encryptedKVStore) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((_encryptedKVStore) != nil)", "-[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:]", 1, 0, @"Expected non-nil value for '%s'", "_encryptedKVStore");
  }
  uint8_t v6 = [(ICNAIdentityManager *)self currentDateForTesting];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  v9 = v8;

  uint64_t v10 = [(NSUbiquitousKeyValueStore *)self->_encryptedKVStore dictionaryForKey:@"identityManager"];
  id v11 = (id)[v10 mutableCopy];

  BOOL v12 = v11 == 0;
  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v13 = [v11 objectForKey:@"startYear"];
  self->_startYear = [v13 unsignedIntegerValue];

  uint64_t v14 = [v11 objectForKey:@"startMonth"];
  self->_startMonth = [v14 unsignedIntegerValue];

  if (!self->_startMonth || !self->_startYear)
  {
    v15 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.6();
    }

    v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v17 = [v16 components:12 fromDate:v9];

    self->_startYear = [v17 year];
    self->_startMonth = [v17 month];
    v18 = [NSNumber numberWithUnsignedInteger:self->_startYear];
    [v11 setObject:v18 forKey:@"startYear"];

    v19 = [NSNumber numberWithUnsignedInteger:self->_startMonth];
    [v11 setObject:v19 forKey:@"startMonth"];

    BOOL v12 = 1;
  }
  v20 = [(ICNAIdentityManager *)self todayTimestampYYYYMM:v9];
  v21 = [v11 objectForKey:@"userID"];
  userID = self->_userID;
  self->_userID = v21;

  uint64_t v23 = [v11 objectForKey:@"privateUserID"];
  privateUserID = self->_privateUserID;
  self->_privateUserID = v23;

  v25 = [v11 objectForKey:@"salts"];
  p_salts = &self->_salts;
  salts = self->_salts;
  self->_salts = v25;

  v28 = [v11 objectForKey:@"identityTimestampYYYYMM"];
  identityTimestampYYYYMM = self->_identityTimestampYYYYMM;
  self->_identityTimestampYYYYMM = v28;

  if (![(NSString *)self->_identityTimestampYYYYMM isEqualToString:v20]
    || v3
    || !self->_userID
    || !self->_privateUserID
    || (v30 = (void *)*p_salts) == 0)
  {
    self->_identifierResetOccurred = 1;
    v39 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.4(v3, v39, v40, v41, v42, v43, v44, v45);
    }

    v46 = [MEMORY[0x1E4F29128] UUID];
    v47 = [v46 UUIDString];
    v48 = self->_userID;
    self->_userID = v47;

    [v11 setObject:self->_userID forKey:@"userID"];
    v49 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:](v3, v49, v50, v51, v52, v53, v54, v55);
    }

    v56 = [MEMORY[0x1E4F29128] UUID];
    v57 = [v56 UUIDString];
    v58 = self->_privateUserID;
    self->_privateUserID = v57;

    [v11 setObject:self->_privateUserID forKey:@"privateUserID"];
    v59 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:](v3, v59, v60, v61, v62, v63, v64, v65);
    }

    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v67 = (void *)[(id)objc_opt_class() newSalt];
    v68 = (objc_class *)objc_opt_class();
    v69 = NSStringFromClass(v68);
    [v66 setObject:v67 forKeyedSubscript:v69];

    v70 = (void *)[(id)objc_opt_class() newSalt];
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    [v66 setObject:v70 forKeyedSubscript:v72];

    v73 = (void *)[(id)objc_opt_class() newSalt];
    v74 = (objc_class *)objc_opt_class();
    v75 = NSStringFromClass(v74);
    [v66 setObject:v73 forKeyedSubscript:v75];

    v76 = (void *)[(id)objc_opt_class() newSalt];
    v77 = (objc_class *)objc_opt_class();
    v78 = NSStringFromClass(v77);
    [v66 setObject:v76 forKeyedSubscript:v78];

    v79 = (void *)[(id)objc_opt_class() newSalt];
    v80 = (objc_class *)objc_opt_class();
    v81 = NSStringFromClass(v80);
    [v66 setObject:v79 forKeyedSubscript:v81];

    v82 = (void *)[(id)objc_opt_class() newSalt];
    v83 = (objc_class *)objc_opt_class();
    v84 = NSStringFromClass(v83);
    [v66 setObject:v82 forKeyedSubscript:v84];

    v85 = (void *)[(id)objc_opt_class() newSalt];
    v86 = (objc_class *)objc_opt_class();
    v87 = NSStringFromClass(v86);
    [v66 setObject:v85 forKeyedSubscript:v87];

    v88 = (void *)[(id)objc_opt_class() newSalt];
    v89 = (objc_class *)objc_opt_class();
    v90 = NSStringFromClass(v89);
    [v66 setObject:v88 forKeyedSubscript:v90];

    v91 = (void *)[(id)objc_opt_class() newSalt];
    v92 = (objc_class *)objc_opt_class();
    v93 = NSStringFromClass(v92);
    [v66 setObject:v91 forKeyedSubscript:v93];

    v94 = (void *)[(id)objc_opt_class() newSalt];
    v95 = (objc_class *)objc_opt_class();
    v96 = NSStringFromClass(v95);
    [v66 setObject:v94 forKeyedSubscript:v96];

    v97 = (void *)[(id)objc_opt_class() newSalt];
    v98 = (objc_class *)objc_opt_class();
    v99 = NSStringFromClass(v98);
    [v66 setObject:v97 forKeyedSubscript:v99];

    v100 = (void *)[(id)objc_opt_class() newSalt];
    v101 = (objc_class *)objc_opt_class();
    v102 = NSStringFromClass(v101);
    [v66 setObject:v100 forKeyedSubscript:v102];

    v103 = (void *)[(id)objc_opt_class() newSalt];
    v104 = (objc_class *)objc_opt_class();
    v105 = NSStringFromClass(v104);
    [v66 setObject:v103 forKeyedSubscript:v105];

    v106 = (void *)[(id)objc_opt_class() newSalt];
    v107 = (objc_class *)objc_opt_class();
    v108 = NSStringFromClass(v107);
    [v66 setObject:v106 forKeyedSubscript:v108];

    v109 = (NSDictionary *)[v66 copy];
    v110 = self->_salts;
    self->_salts = v109;

    [v11 setObject:self->_salts forKey:@"salts"];
    v111 = v20;
    v112 = (NSDictionary *)self->_identityTimestampYYYYMM;
    self->_identityTimestampYYYYMM = v111;
    v113 = @"identityTimestampYYYYMM";
    p_salts = &self->_identityTimestampYYYYMM;
    goto LABEL_28;
  }
  v145 = v9;
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v33 = [v30 objectForKeyedSubscript:v32];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = (void *)*p_salts;
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = [v35 objectForKeyedSubscript:v37];

    if (v38) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  v117 = (void *)[(NSDictionary *)self->_salts mutableCopy];
  v118 = (void *)[(id)objc_opt_class() newSalt];
  v119 = (objc_class *)objc_opt_class();
  v120 = NSStringFromClass(v119);
  [v117 setObject:v118 forKeyedSubscript:v120];

  v121 = (void *)[(id)objc_opt_class() newSalt];
  v122 = (objc_class *)objc_opt_class();
  v123 = NSStringFromClass(v122);
  [v117 setObject:v121 forKeyedSubscript:v123];

  v124 = (NSDictionary *)[v117 copy];
  v125 = self->_salts;
  self->_salts = v124;

  [v11 setObject:self->_salts forKey:@"salts"];
  BOOL v12 = 1;
LABEL_35:
  v126 = (void *)*p_salts;
  v127 = (objc_class *)objc_opt_class();
  v128 = NSStringFromClass(v127);
  v129 = [v126 objectForKeyedSubscript:v128];

  if (!v129)
  {
    v130 = (void *)[(NSDictionary *)self->_salts mutableCopy];
    v131 = (void *)[(id)objc_opt_class() newSalt];
    v132 = (objc_class *)objc_opt_class();
    v133 = NSStringFromClass(v132);
    [v130 setObject:v131 forKeyedSubscript:v133];

    v134 = (NSDictionary *)[v130 copy];
    v135 = self->_salts;
    self->_salts = v134;

    [v11 setObject:self->_salts forKey:@"salts"];
    BOOL v12 = 1;
  }
  v136 = (void *)*p_salts;
  v137 = (objc_class *)objc_opt_class();
  v138 = NSStringFromClass(v137);
  v139 = [v136 objectForKeyedSubscript:v138];

  v9 = v145;
  if (!v139)
  {
    id v66 = (id)[(NSDictionary *)self->_salts mutableCopy];
    v141 = (void *)[(id)objc_opt_class() newSalt];
    v142 = (objc_class *)objc_opt_class();
    v143 = NSStringFromClass(v142);
    [v66 setObject:v141 forKeyedSubscript:v143];

    v144 = (NSDictionary *)[v66 copy];
    v112 = self->_salts;
    self->_salts = v144;
    v113 = @"salts";
LABEL_28:

    [v11 setObject:*p_salts forKey:v113];
    goto LABEL_29;
  }
  if (!v12)
  {
    v140 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.5(v11);
    }

    goto LABEL_32;
  }
LABEL_29:
  v114 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
    -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:](v11);
  }

  encryptedKVStore = self->_encryptedKVStore;
  v116 = (void *)[v11 copy];
  [(NSUbiquitousKeyValueStore *)encryptedKVStore setDictionary:v116 forKey:@"identityManager"];

  [(NSUbiquitousKeyValueStore *)self->_encryptedKVStore synchronize];
LABEL_32:
}

- (void)_keyValueStoreDidChangeExternally:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  encryptedKVStore = self->_encryptedKVStore;

  uint64_t v7 = os_log_create("com.apple.notes", "Analytics");
  id v8 = v7;
  if (v5 != encryptedKVStore)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ICNAIdentityManager _keyValueStoreDidChangeExternally:]();
    }
    goto LABEL_16;
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ICNAIdentityManager _keyValueStoreDidChangeExternally:](v4, v9);
  }

  uint64_t v10 = [v4 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  unint64_t v12 = [v11 integerValue];

  uint64_t v13 = [v4 userInfo];
  id v8 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];

  if (v12 < 2)
  {
    if (![v8 containsObject:@"identityManager"]) {
      goto LABEL_16;
    }
    uint64_t v14 = [(ICNAIdentityManager *)self accessQueue];
    v15 = v14;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke;
    block[3] = &unk_1E64B8A48;
    void block[4] = self;
    v16 = block;
    goto LABEL_12;
  }
  if (v12 != 2)
  {
    if (v12 != 3) {
      goto LABEL_16;
    }
    uint64_t v14 = [(ICNAIdentityManager *)self accessQueue];
    v15 = v14;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_72;
    v18[3] = &unk_1E64B8A48;
    v18[4] = self;
    v16 = v18;
LABEL_12:
    dispatch_async(v14, v16);

    goto LABEL_16;
  }
  id v17 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[ICNAIdentityManager _keyValueStoreDidChangeExternally:]();
  }

LABEL_16:
}

uint64_t __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) loadIdentifiersFromKVSAndForceRegenerateIdentity:0];
}

uint64_t __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_72(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_72_cold_1();
  }

  return [*(id *)(a1 + 32) loadIdentifiersFromKVSAndForceRegenerateIdentity:1];
}

+ (id)saltedID:(id)a3 withSalt:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4)
  {
    uint8_t v6 = [a4 dataUsingEncoding:4];
    os_log_t v7 = v6;
    id v8 = 0;
    if (v5 && v6)
    {
      memset(&v13, 0, sizeof(v13));
      os_log_t v7 = v6;
      CCHmacInit(&v13, 2u, (const void *)-[NSObject bytes](v7, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0),
        [v7 length]);
      v9 = (const char *)[v5 UTF8String];
      size_t v10 = strlen(v9);
      CCHmacUpdate(&v13, v9, v10);
      memset(macOut, 0, sizeof(macOut));
      CCHmacFinal(&v13, macOut);
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:32];
      id v8 = [v11 base64EncodedStringWithOptions:0];
    }
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ICNAIdentityManager saltedID:withSalt:](v5, v7);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)newSalt
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x200uLL, bytes)) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:512];
  id v4 = [v3 base64EncodedDataWithOptions:0];
  uint64_t v2 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return v2;
}

- (void)setUserID:(id)a3
{
}

- (void)setPrivateUserID:(id)a3
{
}

- (void)setIdentityTimestampYYYYMM:(id)a3
{
}

- (void)setStartYear:(unint64_t)a3
{
  self->_startYear = a3;
}

- (void)setStartMonth:(unint64_t)a3
{
  self->_startMonth = a3;
}

- (BOOL)identifierResetOccurred
{
  return self->_identifierResetOccurred;
}

- (void)setIdentifierResetOccurred:(BOOL)a3
{
  self->_identifierResetOccurred = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSDictionary)salts
{
  return self->_salts;
}

- (void)setSalts:(id)a3
{
}

- (NSUbiquitousKeyValueStore)encryptedKVStore
{
  return self->_encryptedKVStore;
}

- (void)setEncryptedKVStore:(id)a3
{
}

- (NSDate)currentDateForTesting
{
  return self->_currentDateForTesting;
}

- (void)setCurrentDateForTesting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateForTesting, 0);
  objc_storeStrong((id *)&self->_encryptedKVStore, 0);
  objc_storeStrong((id *)&self->_salts, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_identityTimestampYYYYMM, 0);
  objc_storeStrong((id *)&self->_privateUserID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_md5");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1C3EAD000, v2, v3, "Saving new identifiers (hash=%@, timestamp=%@)", v4, v5, v6, v7, v8);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C3EAD000, a2, a3, "Regenerating salts (forced=%@)", a5, a6, a7, a8, 2u);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C3EAD000, a2, a3, "Regenerating privateUserID (forced=%@)", a5, a6, a7, a8, 2u);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C3EAD000, a2, a3, "Regenerating userID (forced=%@)", a5, a6, a7, a8, 2u);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_md5");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1C3EAD000, v2, v3, "Loaded identifiers (hash=%@, timestamp=%@)", v4, v5, v6, v7, v8);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Generating start year and month", v2, v3, v4, v5, v6);
}

- (void)_keyValueStoreDidChangeExternally:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1C3EAD000, v0, OS_LOG_TYPE_FAULT, "Analytics KVS is reporting that it is over quota", v1, 2u);
}

- (void)_keyValueStoreDidChangeExternally:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 userInfo];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_DEBUG, "Processing KVS change notification: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_keyValueStoreDidChangeExternally:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Ignoring a change notification for a KVS that doesn't belong to us", v2, v3, v4, v5, v6);
}

void __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Reloading due to a change notification", v2, v3, v4, v5, v6);
}

void __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Reloading all identifiers due to an iCloud account change", v2, v3, v4, v5, v6);
}

+ (void)saltedID:(void *)a1 withSalt:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_error_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_ERROR, "Salt is nil when trying to salt identifier length=%lu", (uint8_t *)&v3, 0xCu);
}

@end