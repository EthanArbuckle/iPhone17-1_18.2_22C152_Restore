@interface WBSFormAutoFillCorrectionsSQLiteStore
+ (id)_defaultLocalDatabaseURL;
+ (id)_defaultParsecDatabaseURL;
+ (id)standardStore;
- (BOOL)_isDatabaseOpen:(id)a3;
- (BOOL)_migrateToSchemaVersion:(int)a3 forDatabase:(id)a4;
- (BOOL)_removeAllLocalClassifications;
- (BOOL)_removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4;
- (BOOL)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4;
- (BOOL)_replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4;
- (BOOL)_setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5;
- (BOOL)_setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4;
- (BOOL)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 dateReclassified:(id)a6;
- (BOOL)_setParsecMetadataStringValue:(id)a3 forKey:(id)a4;
- (BOOL)_tryToPerformTransactionOnDatabase:(id)a3 inBlock:(id)a4;
- (WBSFormAutoFillCorrectionsSQLiteStore)init;
- (WBSFormAutoFillCorrectionsSQLiteStore)initWithLocalDatabaseURL:(id)a3 parsecDatabaseURL:(id)a4;
- (id)_classificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4;
- (id)_normalizeDomain:(id)a3;
- (id)_parsecMetadataStringValueForKey:(id)a3;
- (int)_createFreshLocalDatabaseSchema;
- (int)_createFreshParsecDatabaseSchema;
- (int)_migrateToCurrentSchemaVersionIfNeededForDatabase:(id)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (int)_schemaVersionForDatabase:(id)a3;
- (int)_setDatabaseSchemaVersion:(int)a3 forDatabase:(id)a4;
- (void)_closeDatabases;
- (void)_configureDatabase:(id)a3 currentSchemaVersion:(int)a4;
- (void)_createFreshLocalDatabaseSchema;
- (void)_migrateToSchemaVersion_2;
- (void)_migrateToSchemaVersion_3;
- (void)_openDatabasesIfNeeded;
- (void)_openLocalDatabase;
- (void)_openParsecDatabase;
- (void)_removeAllLocalClassifications;
- (void)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 date:(id)a6 completionHandler:(id)a7;
- (void)closeDatabase;
- (void)getAllowListStatusForDomain:(id)a3 completionHandler:(id)a4;
- (void)getClassificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5;
- (void)getLastAllowListRetrievalURLStringWithCompletionHandler:(id)a3;
- (void)getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:(id)a3;
- (void)removeAllLocalClassificationsWithCompletionHandler:(id)a3;
- (void)removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4 completionHandler:(id)a5;
- (void)replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5;
- (void)replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5;
- (void)setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6;
- (void)setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4 completionHandler:(id)a5;
- (void)setLastAllowListRetrievalURLString:(id)a3 completionHandler:(id)a4;
- (void)setLastCrowdsourcedCorrectionsRetrievalURLString:(id)a3 completionHandler:(id)a4;
- (void)setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSFormAutoFillCorrectionsSQLiteStore

void __54__WBSFormAutoFillCorrectionsSQLiteStore_standardStore__block_invoke()
{
  v0 = [WBSFormAutoFillCorrectionsSQLiteStore alloc];
  id v4 = +[WBSFormAutoFillCorrectionsSQLiteStore _defaultLocalDatabaseURL];
  v1 = +[WBSFormAutoFillCorrectionsSQLiteStore _defaultParsecDatabaseURL];
  uint64_t v2 = [(WBSFormAutoFillCorrectionsSQLiteStore *)v0 initWithLocalDatabaseURL:v4 parsecDatabaseURL:v1];
  v3 = (void *)+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore;
  +[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore = v2;
}

- (WBSFormAutoFillCorrectionsSQLiteStore)initWithLocalDatabaseURL:(id)a3 parsecDatabaseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSFormAutoFillCorrectionsSQLiteStore;
  v8 = [(WBSFormAutoFillCorrectionsSQLiteStore *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (NSURL *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    }
    localDatabaseURL = v8->_localDatabaseURL;
    v8->_localDatabaseURL = v9;

    if (v7)
    {
      v11 = (NSURL *)v7;
    }
    else
    {
      v11 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    }
    parsecDatabaseURL = v8->_parsecDatabaseURL;
    v8->_parsecDatabaseURL = v11;

    v13 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore", 0, v13);
    databaseQueue = v8->_databaseQueue;
    v8->_databaseQueue = (OS_dispatch_queue *)v14;

    v16 = v8;
  }

  return v8;
}

+ (id)_defaultParsecDatabaseURL
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  id v4 = [v3 URLByAppendingPathComponent:@"CloudAutoFillCorrections.db" isDirectory:0];

  return v4;
}

+ (id)_defaultLocalDatabaseURL
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  id v4 = [v3 URLByAppendingPathComponent:@"AutoFillCorrections.db" isDirectory:0];

  return v4;
}

+ (id)standardStore
{
  if (+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::onceToken != -1) {
    dispatch_once(&+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::onceToken, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore;
  return v2;
}

- (WBSFormAutoFillCorrectionsSQLiteStore)init
{
  return [(WBSFormAutoFillCorrectionsSQLiteStore *)self initWithLocalDatabaseURL:0 parsecDatabaseURL:0];
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSFormAutoFillCorrectionsSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WBSFormAutoFillCorrectionsSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabases];
}

- (void)replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 copy];
  [v8 copy];
  operator new();
}

void __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C9AEF0;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  char v4 = [v2 _tryToPerformTransactionOnDatabase:v3 inBlock:v11];
  v5 = *(id **)(a1 + 64);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 56))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_3;
    block[3] = &unk_1E5C9AF18;
    id v9 = *(id *)(a1 + 56);
    char v10 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceDomainAllowListWithDomains:*(void *)(a1 + 40) retrievalURLString:*(void *)(a1 + 48)];
}

uint64_t __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getAllowListStatusForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v6 copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9AF90;
  v11[4] = self;
  id v9 = v7;
  id v12 = v8;
  id v13 = v9;
  id v10 = v8;
  [(WBSFormAutoFillCorrectionsSQLiteStore *)self getLastAllowListRetrievalURLStringWithCompletionHandler:v11];
}

void __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(NSObject **)(v3 + 40);
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5C8D730;
    v8[4] = v3;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v4, v8);

    v5 = v9;
  }
  else
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(v3 + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C8D5F0;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v7, block);

    v5 = v12;
  }
}

uint64_t __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _normalizeDomain:*(void *)(a1 + 40)];
  v11 = v2;
  if (v2
    && ([*(id *)(a1 + 32) _openDatabasesIfNeeded],
        [*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)]))
  {
    uint64_t v3 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(*(void **)(*(void *)(a1 + 32) + 32), @"SELECT COUNT(*) AS count FROM whitelist WHERE domain = ?", &v11);
    char v4 = [v3 nextObject];
    if ([v4 int64AtIndex:0] >= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }

    uint64_t v2 = v11;
  }
  else
  {
    uint64_t v5 = 0;
  }

  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
  id v7 = dispatch_get_global_queue(qos_class, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_4;
  block[3] = &unk_1E5C9AF68;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  [v6 copy];
  operator new();
}

void __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  if ([*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)]) {
    char v2 = [*(id *)(a1 + 32) _setDomain:*(void *)(a1 + 40) isAllowListedForFeedback:*(unsigned __int8 *)(a1 + 64)];
  }
  else {
    char v2 = 0;
  }
  uint64_t v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 48))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    uint64_t v5 = dispatch_get_global_queue(qos_class, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5C9AF18;
    id v7 = *(id *)(a1 + 48);
    char v8 = v2;
    dispatch_async(v5, v6);
  }
}

uint64_t __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getLastAllowListRetrievalURLStringWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  if ([*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)])
  {
    char v2 = [*(id *)(a1 + 32) _parsecMetadataStringValueForKey:@"lastWhitelistRetrievalURL"];
  }
  else
  {
    char v2 = 0;
  }
  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
  id v4 = dispatch_get_global_queue(qos_class, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5C8C660;
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLastAllowListRetrievalURLString:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 copy];
  operator new();
}

void __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  if ([*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)]) {
    char v2 = [*(id *)(a1 + 32) _setParsecMetadataStringValue:*(void *)(a1 + 40) forKey:@"lastWhitelistRetrievalURL"];
  }
  else {
    char v2 = 0;
  }
  uint64_t v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 48))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v5 = dispatch_get_global_queue(qos_class, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5C9AF18;
    id v7 = *(id *)(a1 + 48);
    char v8 = v2;
    dispatch_async(v5, v6);
  }
}

uint64_t __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  if ([*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)])
  {
    char v2 = [*(id *)(a1 + 32) _parsecMetadataStringValueForKey:@"lastCorrectionsRetrievalURL"];
  }
  else
  {
    char v2 = 0;
  }
  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
  id v4 = dispatch_get_global_queue(qos_class, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5C8C660;
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLastCrowdsourcedCorrectionsRetrievalURLString:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 copy];
  operator new();
}

void __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  if ([*(id *)(a1 + 32) _isDatabaseOpen:*(void *)(*(void *)(a1 + 32) + 32)]) {
    char v2 = [*(id *)(a1 + 32) _setParsecMetadataStringValue:*(void *)(a1 + 40) forKey:@"lastCorrectionsRetrievalURL"];
  }
  else {
    char v2 = 0;
  }
  uint64_t v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 48))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v5 = dispatch_get_global_queue(qos_class, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5C9AF18;
    id v7 = *(id *)(a1 + 48);
    char v8 = v2;
    dispatch_async(v5, v6);
  }
}

uint64_t __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 copy];
  operator new();
}

void __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C9AEF0;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  char v4 = [v2 _tryToPerformTransactionOnDatabase:v3 inBlock:v11];
  id v5 = *(id **)(a1 + 64);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 56))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_3;
    block[3] = &unk_1E5C9AF18;
    id v9 = *(id *)(a1 + 56);
    char v10 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceCrowdsourcedCorrectionSetsWithCorrectionSets:*(void *)(a1 + 40) retrievalURLString:*(void *)(a1 + 48)];
}

uint64_t __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSFormAutoFillCorrectionsSQLiteStore *)self _setLocalClassification:v14 forFieldWithFingerprint:v10 onDomain:v11 date:v13 completionHandler:v12];
}

- (void)setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v9 copy];
  [v10 copy];
  [v11 copy];
  operator new();
}

void __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C9B008;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  char v4 = [v2 _tryToPerformTransactionOnDatabase:v3 inBlock:v11];
  id v5 = *(id **)(a1 + 72);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 64))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5C9AF18;
    id v9 = *(id *)(a1 + 64);
    char v10 = v4;
    dispatch_async(v7, v8);
  }
}

uint64_t __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCrowdsourcedClassification:*(void *)(a1 + 40) forFieldWithFingerprint:*(void *)(a1 + 48) onDomain:*(void *)(a1 + 56)];
}

uint64_t __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getClassificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[v8 copy];
  id v12 = (void *)[v9 copy];
  databaseQueue = self->_databaseQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke;
  v17[3] = &unk_1E5C9B058;
  v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(databaseQueue, v17);
}

void __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  char v2 = [*(id *)(a1 + 32) _classificationForFieldWithFingerprint:*(void *)(a1 + 40) onDomain:*(void *)(a1 + 48)];
  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
  char v4 = dispatch_get_global_queue(qos_class, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5C8C660;
  id v5 = *(id *)(a1 + 56);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 copy];
  operator new();
}

void __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C9AEF0;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  char v4 = [v2 _tryToPerformTransactionOnDatabase:v3 inBlock:v11];
  id v5 = *(id **)(a1 + 64);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 56))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_3;
    block[3] = &unk_1E5C9AF18;
    id v9 = *(id *)(a1 + 56);
    char v10 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocalClassificationsForDomain:*(void *)(a1 + 40) recordedOnOrAfter:*(void *)(a1 + 48)];
}

uint64_t __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)removeAllLocalClassificationsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  operator new();
}

void __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabasesIfNeeded];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5C9B080;
  v11[4] = v2;
  char v4 = [v2 _tryToPerformTransactionOnDatabase:v3 inBlock:v11];
  id v5 = *(id **)(a1 + 48);
  if (v5)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 40))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), 0);
    id v7 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5C9AF18;
    id v9 = *(id *)(a1 + 40);
    char v10 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllLocalClassifications];
}

uint64_t __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (int)_schemaVersionForDatabase:(id)a3
{
  id v4 = a3;
  if ([(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:v4])
  {
    id v5 = SafariShared::WBSSQLiteDatabaseFetch<>(v4, @"PRAGMA user_version");
    id v6 = [v5 nextObject];
    int v7 = [v6 intAtIndex:0];

    id v8 = [v5 statement];
    [v8 invalidate];
  }
  else
  {
    int v7 = -1;
  }

  return v7;
}

- (int)_migrateToCurrentSchemaVersionIfNeededForDatabase:(id)a3
{
  id v4 = (WBSSQLiteDatabase *)a3;
  unsigned int v5 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _schemaVersionForDatabase:v4];
  LODWORD(v6) = v5;
  localDatabase = self->_localDatabase;
  if (localDatabase == v4) {
    int v8 = 4;
  }
  else {
    int v8 = 1;
  }
  if (v5 < v8)
  {
    if (!v5)
    {
      if (localDatabase == v4
        && [(WBSFormAutoFillCorrectionsSQLiteStore *)self _createFreshLocalDatabaseSchema] != 101|| self->_parsecDatabase == v4&& [(WBSFormAutoFillCorrectionsSQLiteStore *)self _createFreshParsecDatabaseSchema] != 101)
      {
        LODWORD(v6) = 0;
        goto LABEL_20;
      }
      LODWORD(v6) = 1;
    }
    if (v8 <= (int)v6) {
      int v9 = v6;
    }
    else {
      int v9 = v8;
    }
    while (v9 != v6)
    {
      uint64_t v6 = (v6 + 1);
      if (![(WBSFormAutoFillCorrectionsSQLiteStore *)self _migrateToSchemaVersion:v6 forDatabase:v4])
      {
        int v9 = v6 - 1;
        break;
      }
    }
    if (v9 >= v8) {
      LODWORD(v6) = v8;
    }
    else {
      LODWORD(v6) = v9;
    }
  }
LABEL_20:

  return v6;
}

- (BOOL)_migrateToSchemaVersion:(int)a3 forDatabase:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"_migrateToSchemaVersion_%d", v4);
  int v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v8 = NSSelectorFromString(v7);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__WBSFormAutoFillCorrectionsSQLiteStore__migrateToSchemaVersion_forDatabase___block_invoke;
  v11[3] = &unk_1E5C9B0D0;
  v11[4] = self;
  SEL v13 = v8;
  int v14 = v4;
  id v9 = v6;
  id v12 = v9;
  LOBYTE(self) = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _tryToPerformTransactionOnDatabase:v9 inBlock:v11];

  return (char)self;
}

BOOL __77__WBSFormAutoFillCorrectionsSQLiteStore__migrateToSchemaVersion_forDatabase___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) methodSignatureForSelector:*(void *)(a1 + 48)];
  uint64_t v3 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v2];
  [v3 setSelector:*(void *)(a1 + 48)];
  [v3 invokeWithTarget:*(void *)(a1 + 32)];
  int v6 = 0;
  [v3 getReturnValue:&v6];
  BOOL v4 = v6 == 101
    && [*(id *)(a1 + 32) _setDatabaseSchemaVersion:*(unsigned int *)(a1 + 56) forDatabase:*(void *)(a1 + 40)] != 0;

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3 forDatabase:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", v4);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, v6);

  if (v7 != 101)
  {
    SEL v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v10 = [v5 lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = v4;
      __int16 v13 = 2112;
      int v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to set the AutoFill corrections database schema version to %d: %@ (%d)", buf, 0x18u);
    }
  }

  return v7;
}

- (int)_createFreshLocalDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE whitelist (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)");
  if (v3 != 101)
  {
    int v8 = v3;
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.6();
    }
    goto LABEL_25;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)");
  if (v4 != 101)
  {
    int v8 = v4;
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.5();
    }
    goto LABEL_25;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE visited_hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)");
  if (v5 != 101)
  {
    int v8 = v5;
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.4();
    }
    goto LABEL_25;
  }
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER NOT NULL REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)");
  if (v6 != 101)
  {
    int v8 = v6;
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema]();
    }
    goto LABEL_25;
  }
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE user_corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER NOT NULL REFERENCES visited_hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT,first_correction_time REAL NOT NULL)");
  if (v7 != 101)
  {
    int v8 = v7;
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema]();
    }
    goto LABEL_25;
  }
  int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)");
  if (v8 != 101)
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema]();
    }
LABEL_25:

    return v8;
  }
  [(WBSFormAutoFillCorrectionsSQLiteStore *)self _setDatabaseSchemaVersion:1 forDatabase:self->_localDatabase];
  return v8;
}

- (int)_createFreshParsecDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"CREATE TABLE whitelist (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)");
  if (v3 != 101)
  {
    int v6 = v3;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.6();
    }
    goto LABEL_17;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"CREATE TABLE hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)");
  if (v4 != 101)
  {
    int v6 = v4;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.5();
    }
    goto LABEL_17;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)");
  if (v5 != 101)
  {
    int v6 = v5;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema]();
    }
    goto LABEL_17;
  }
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)");
  if (v6 != 101)
  {
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema]();
    }
LABEL_17:

    return v6;
  }
  [(WBSFormAutoFillCorrectionsSQLiteStore *)self _setDatabaseSchemaVersion:1 forDatabase:self->_parsecDatabase];
  return v6;
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DROP TABLE corrections");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_2]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_2]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DROP TABLE corrections");
  if (v3 != 101)
  {
    int v6 = v3;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3].cold.4();
    }
    goto LABEL_13;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DROP TABLE hosts");
  if (v4 != 101)
  {
    int v6 = v4;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3]();
    }
    goto LABEL_13;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DROP TABLE whitelist");
  if (v5 != 101)
  {
    int v6 = v5;
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3]();
    }
    goto LABEL_13;
  }
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DROP TABLE metadata");
  if (v6 != 101)
  {
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3]();
    }
LABEL_13:
  }
  return v6;
}

- (int)_migrateToSchemaVersion_4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DELETE FROM user_corrections WHERE classification = ''");
  if (v3 == 101)
  {
    int v4 = [MEMORY[0x1E4F1CA48] array];
    int v5 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_localDatabase, @"SELECT DISTINCT host_id FROM user_corrections");
    while (1)
    {
      int v6 = [v5 nextObject];
      int v7 = v6;
      if (!v6) {
        break;
      }
      int v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "int64AtIndex:", 0));
      [v4 addObject:v8];
    }
    int v9 = [v5 lastResultCode];
    if (v9 != 101)
    {
      int v12 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
        id v20 = objc_msgSend(v19, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 1024;
        int v27 = v9;
        _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Failed to enumerate visited host IDs after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);
      }
      goto LABEL_18;
    }
    int v12 = [v4 componentsJoinedByString:@","];
    uint64_t v13 = [v12 length];
    localDatabase = self->_localDatabase;
    if (v13)
    {
      __int16 v15 = [NSString stringWithFormat:@"DELETE FROM visited_hosts WHERE id NOT IN (%@)", v12];
      int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(localDatabase, 0, v15);

      if (v9 != 101)
      {
        int v16 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
          id v18 = objc_msgSend(v17, "safari_privacyPreservingDescription");
          *(_DWORD *)buf = 138543618;
          v25 = v18;
          __int16 v26 = 1024;
          int v27 = v9;
          _os_log_error_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_ERROR, "Failed to clear unneeded visited hosts after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);
        }
LABEL_17:
      }
    }
    else
    {
      int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DELETE FROM visited_hosts");
      if (v9 != 101)
      {
        int v16 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v22 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
          v23 = objc_msgSend(v22, "safari_privacyPreservingDescription");
          *(_DWORD *)buf = 138543618;
          v25 = v23;
          __int16 v26 = 1024;
          int v27 = v9;
          _os_log_error_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_ERROR, "Failed to clear all visited hosts after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);
        }
        goto LABEL_17;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  int v9 = v3;
  int v4 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    char v10 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
    id v11 = objc_msgSend(v10, "safari_privacyPreservingDescription");
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    __int16 v26 = 1024;
    int v27 = v9;
    _os_log_error_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_ERROR, "Failed to drop old empty local classifications: %{public}@ (%d)", buf, 0x12u);
  }
LABEL_19:

  return v9;
}

- (id)_normalizeDomain:(id)a3
{
  id v4 = a3;
  domainNormalizer = self->_domainNormalizer;
  if (!domainNormalizer)
  {
    int v6 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
    int v7 = self->_domainNormalizer;
    self->_domainNormalizer = v6;

    domainNormalizer = self->_domainNormalizer;
  }
  int v8 = [(WBSCrowdsourcedFeedbackDomainNormalizer *)domainNormalizer transformedValue:v4];

  return v8;
}

- (void)_openDatabasesIfNeeded
{
  MEMORY[0x1AD0C4540](v3, @"com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore");
  if (![(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:self->_localDatabase]) {
    [(WBSFormAutoFillCorrectionsSQLiteStore *)self _openLocalDatabase];
  }
  if (![(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:self->_parsecDatabase]) {
    [(WBSFormAutoFillCorrectionsSQLiteStore *)self _openParsecDatabase];
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
}

- (void)_configureDatabase:(id)a3 currentSchemaVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 url];
  [v6 setBusyTimeout:1.0];
  id v17 = 0;
  char v8 = [v6 enableWAL:&v17];
  id v9 = v17;
  char v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ([v9 code] == 5)
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [v7 lastPathComponent];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _configureDatabase:currentSchemaVersion:]();
      }

      [(WBSFormAutoFillCorrectionsSQLiteStore *)self _closeDatabases];
      goto LABEL_11;
    }
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v7 lastPathComponent];
      int v14 = objc_msgSend(v10, "safari_privacyPreservingDescription");
      [(WBSFormAutoFillCorrectionsSQLiteStore *)v13 _configureDatabase:buf currentSchemaVersion:v12];
    }
  }
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"PRAGMA foreign_keys = ON");
  uint64_t v15 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _migrateToCurrentSchemaVersionIfNeededForDatabase:v6];
  if (v15 != v4)
  {
    int v16 = [v7 lastPathComponent];
    WTFLogAlways();

    [(WBSFormAutoFillCorrectionsSQLiteStore *)self _closeDatabases];
  }
LABEL_11:
}

- (void)_openParsecDatabase
{
  OUTLINED_FUNCTION_1_4();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v1, v3, "Failed to mark Parsec AutoFill corrections SQLite store as excluded from backup.  Error: %{public}@", v4);
}

- (void)_openLocalDatabase
{
  os_log_t v3 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:self->_localDatabaseURL queue:self->_databaseQueue];
  localDatabase = self->_localDatabase;
  self->_localDatabase = v3;

  int v5 = self->_localDatabase;
  id v11 = 0;
  char v6 = [(WBSSQLiteDatabase *)v5 openWithAccessType:3 error:&v11];
  id v7 = v11;
  if (v6)
  {
    [(WBSFormAutoFillCorrectionsSQLiteStore *)self _configureDatabase:self->_localDatabase currentSchemaVersion:4];
  }
  else
  {
    char v8 = [(NSURL *)self->_localDatabaseURL lastPathComponent];
    char v10 = objc_msgSend(v7, "safari_privacyPreservingDescription");
    WTFLogAlways();

    id v9 = self->_localDatabase;
    self->_localDatabase = 0;
  }
}

- (void)_closeDatabases
{
  [(WBSSQLiteDatabase *)self->_localDatabase close];
  localDatabase = self->_localDatabase;
  self->_localDatabase = 0;

  [(WBSSQLiteDatabase *)self->_parsecDatabase close];
  parsecDatabase = self->_parsecDatabase;
  self->_parsecDatabase = 0;
}

- (BOOL)_isDatabaseOpen:(id)a3
{
  return a3 != 0;
}

- (BOOL)_tryToPerformTransactionOnDatabase:(id)a3 inBlock:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned int (**)(void))a4;
  if (![(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:v6]) {
    goto LABEL_9;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"BEGIN TRANSACTION") != 101)
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v6 lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:]();
    }
    goto LABEL_8;
  }
  if (!v7[2](v7))
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"ROLLBACK TRANSACTION") == 101) {
      goto LABEL_9;
    }
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v6 lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:]();
    }
LABEL_8:

LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, @"COMMIT TRANSACTION") != 101)
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v6 lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:]();
    }
    goto LABEL_8;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"DELETE FROM whitelist") == 101)
  {
    BOOL v8 = [MEMORY[0x1E4F1CA48] array];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke;
    v20[3] = &unk_1E5C9B0F8;
    v20[4] = self;
    id v9 = v8;
    v21 = v9;
    [v6 enumerateObjectsUsingBlock:v20];
    uint64_t v10 = [v9 count];
    if (v10 == [v6 count])
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v12 = [v9 count];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2;
      v16[3] = &unk_1E5C8E4F0;
      id v13 = v11;
      id v18 = self;
      uint64_t v19 = v12;
      id v17 = v13;
      [v9 enumerateObjectsUsingBlock:v16];
      BOOL v14 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _setParsecMetadataStringValue:v7 forKey:@"lastWhitelistRetrievalURL"];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceDomainAllowListWithDomains:retrievalURLString:]();
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) _normalizeDomain:a2];
  id v7 = (id)v6;
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else {
    *a4 = 1;
  }
}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObject:a2];
  if (__ROR8__(0x1CAC083126E978D5 * (a3 - 499), 2) < 0x83126E978D4FDFuLL || *(void *)(a1 + 48) - 1 == a3)
  {
    int v5 = [MEMORY[0x1E4F28E78] string];
    [v5 appendString:@"INSERT INTO whitelist (domain) VALUES "];
    uint64_t v6 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_3;
    v17[3] = &unk_1E5C9B120;
    id v7 = v5;
    id v18 = v7;
    [v6 enumerateObjectsUsingBlock:v17];
    objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length") - 1, 1, &stru_1EFBE3CF8);
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 40) + 32) query:v7];
    id v9 = *(void **)(a1 + 32);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    BOOL v14 = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_4;
    uint64_t v15 = &unk_1E5C9B120;
    id v10 = v8;
    id v16 = v10;
    [v9 enumerateObjectsUsingBlock:&v12];
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", v12, v13, v14, v15);
    if ([v10 execute] != 101)
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(*(void *)(a1 + 40) + 32) lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2_cold_1();
      }
    }
    [v10 invalidate];
  }
}

uint64_t __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"(?%lu),", a3 + 1);
}

uint64_t __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) bindString:a2 atParameterIndex:a3 + 1];
}

- (BOOL)_setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v12 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _normalizeDomain:v6];

  if (!v12) {
    return 0;
  }
  if (v4) {
    id v7 = @"INSERT INTO whitelist (domain) VALUES (?)";
  }
  else {
    id v7 = @"DELETE FROM whitelist WHERE domain = ?";
  }
  int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_parsecDatabase, 0, v7, &v12);
  BOOL v10 = v8 == 101 || v8 == 19;

  return v10;
}

- (id)_parsecMetadataStringValueForKey:(id)a3
{
  id v8 = a3;
  BOOL v4 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, @"SELECT value FROM metadata WHERE key = ?", &v8);
  int v5 = [v4 nextObject];
  id v6 = [v5 stringAtIndex:0];

  return v6;
}

- (BOOL)_setParsecMetadataStringValue:(id)a3 forKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  parsecDatabase = self->_parsecDatabase;
  if (v17)
  {
    int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(parsecDatabase, 0, @"UPDATE metadata SET value = ? WHERE key = ?", &v17, &v16);
    if (v7 != 101)
    {
      id v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      goto LABEL_6;
    }
    if (![(WBSSQLiteDatabase *)self->_parsecDatabase changedRowCount])
    {
      int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, @"INSERT INTO metadata (key, value) VALUES (?, ?)", &v16, &v17);
      if (v7 != 101)
      {
        id v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_13:

          BOOL v12 = 0;
          goto LABEL_14;
        }
LABEL_6:
        id v9 = v16;
        BOOL v10 = [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        id v19 = v9;
        __int16 v20 = 2112;
        v21 = v10;
        __int16 v22 = 1024;
        int v23 = v7;
        _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to update metadata value %@: %@ (%d)", buf, 0x1Cu);

        goto LABEL_13;
      }
    }
  }
  else
  {
    int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(parsecDatabase, 0, @"DELETE FROM metadata WHERE key = ?", &v16);
    if (v11 != 101)
    {
      id v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v14 = v16;
        uint64_t v15 = [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 1024;
        int v23 = v11;
        _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to delete metadata value %@: %@ (%d)", buf, 0x1Cu);
      }
      goto LABEL_13;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 dateReclassified:(id)a6
{
  v27[4] = *(id *)MEMORY[0x1E4F143B8];
  v27[0] = a3;
  id v26 = a4;
  id v10 = a5;
  id v11 = a6;
  id v25 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _normalizeDomain:v10];

  if (v25)
  {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v12 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, @"SELECT id FROM visited_hosts WHERE domain = ?", &v25);
    uint64_t v13 = [v12 nextObject];
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 int64AtIndex:0];
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_localDatabase, 0, @"INSERT INTO visited_hosts (domain) VALUES (?)", &v25) != 101)
      {
        v21 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.4();
        }

        goto LABEL_26;
      }
      uint64_t v15 = [(WBSSQLiteDatabase *)self->_localDatabase lastInsertRowID];
    }
    uint64_t v24 = v15;

    localDatabase = self->_localDatabase;
    if (v27[0])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long &,NSString * {__strong}&>(localDatabase, 0, @"UPDATE user_corrections SET classification = ? WHERE host_id = ? AND fingerprint = ?", v27, &v24, &v26) == 101)
      {
        if (![(WBSSQLiteDatabase *)self->_localDatabase changedRowCount])
        {
          [v11 timeIntervalSinceReferenceDate];
          uint64_t v23 = v18;
          if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&,NSString * {__strong}&,double &>(self->_localDatabase, 0, @"INSERT INTO user_corrections (host_id, fingerprint, classification, first_correction_time) VALUES (?, ?, ?, ?)", &v24, &v26, v27, (double *)&v23) != 101|| ![(WBSSQLiteDatabase *)self->_localDatabase lastInsertRowID])
          {
            id v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
              objc_claimAutoreleasedReturnValue();
              -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
            }

            goto LABEL_26;
          }
        }
LABEL_16:
        BOOL v16 = 1;
LABEL_27:

        goto LABEL_28;
      }
      __int16 v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
      }
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&>(localDatabase, 0, @"DELETE FROM user_corrections WHERE host_id = ? AND fingerprint = ?", &v24, &v26) == 101)goto LABEL_16; {
      __int16 v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
      }
    }

LABEL_26:
    BOOL v16 = 0;
    goto LABEL_27;
  }
  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"DELETE FROM corrections") != 101)
  {
    id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:]();
    }
    goto LABEL_18;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, @"DELETE FROM hosts") != 101)
  {
    id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:]();
    }
LABEL_18:

    BOOL v13 = 0;
    goto LABEL_21;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v17;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v9, "domain", v16);
      id v11 = [v9 fingerprintsToClassifications];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore__replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString___block_invoke;
      v19[3] = &unk_1E5C9B148;
      v21 = &v27;
      v19[4] = self;
      id v12 = (id)v10;
      id v20 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:v19];

      LOBYTE(v10) = *((unsigned char *)v28 + 24) == 0;
      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (*((unsigned char *)v28 + 24)) {
    BOOL v13 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _setParsecMetadataStringValue:v16 forKey:@"lastCorrectionsRetrievalURL"];
  }
  else {
    BOOL v13 = 0;
  }
  _Block_object_dispose(&v27, 8);
LABEL_21:

  return v13;
}

void __113__WBSFormAutoFillCorrectionsSQLiteStore__replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _setCrowdsourcedClassification:v7 forFieldWithFingerprint:v8 onDomain:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)_setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5
{
  v25[4] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  v25[0] = v8;
  id v24 = a4;
  id v9 = a5;
  id v23 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _normalizeDomain:v9];

  if (v23)
  {
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, @"SELECT id FROM hosts WHERE domain = ?", &v23);
    id v11 = objc_msgSend(v10, "nextObject", 0x7FFFFFFFFFFFFFFFLL, v23, v24);
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 int64AtIndex:0];
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_parsecDatabase, 0, @"INSERT INTO hosts (domain) VALUES (?)", &v23) != 101)
      {
        id v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.4();
        }
        goto LABEL_32;
      }
      uint64_t v13 = [(WBSSQLiteDatabase *)self->_parsecDatabase lastInsertRowID];
    }
    uint64_t v22 = v13;

    parsecDatabase = self->_parsecDatabase;
    if (v25[0])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long &,NSString * {__strong}&>(parsecDatabase, 0, @"UPDATE corrections SET classification = ? WHERE host_id = ? AND fingerprint = ?", v25, &v22, &v24) == 101)
      {
        if (![(WBSSQLiteDatabase *)self->_parsecDatabase changedRowCount])
        {
          int v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, @"INSERT INTO corrections (host_id, fingerprint, classification) VALUES (?, ?, ?)", &v22, &v24, v25);

          goto LABEL_14;
        }
        goto LABEL_20;
      }
      id v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
      }
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&>(parsecDatabase, 0, @"DELETE FROM corrections WHERE host_id = ? AND fingerprint = ?", &v22, &v24) == 101)
      {
LABEL_20:
        BOOL v18 = 1;
LABEL_33:

        goto LABEL_38;
      }
      id v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
      }
    }
LABEL_32:

    BOOL v18 = 0;
    goto LABEL_33;
  }
  id v14 = self->_parsecDatabase;
  if (!v8)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v14, 0, @"DELETE FROM corrections WHERE fingerprint = ? AND host_id IS NULL", &v24) == 101)goto LABEL_24; {
    id v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
    }
LABEL_36:

LABEL_37:
    BOOL v18 = 0;
    goto LABEL_38;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v14, 0, @"UPDATE corrections SET classification = ? WHERE fingerprint = ? AND host_id IS NULL", v25, &v24) != 101)
  {
    id v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
    }
    goto LABEL_36;
  }
  if (![(WBSSQLiteDatabase *)self->_parsecDatabase changedRowCount])
  {
    int v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, @"INSERT INTO corrections (fingerprint, classification) VALUES (?, ?)", &v24, v25);
LABEL_14:
    if (v15 != 101 || ![(WBSSQLiteDatabase *)self->_parsecDatabase lastInsertRowID])
    {
      id v17 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_parsecDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:]();
      }

      goto LABEL_37;
    }
  }
LABEL_24:
  BOOL v18 = 1;
LABEL_38:

  return v18;
}

- (id)_classificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4
{
  id v6 = a3;
  id v43 = v6;
  id v42 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:]0((uint64_t)v6, v7);
  }
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = [v8 integerForKey:@"WBSDebugCrowdsourcedAutoFillCorrectionsMode"];

  switch(v9)
  {
    case 0:
      int v10 = 0;
      int v11 = 0;
      goto LABEL_15;
    case 1:
      id v12 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.7();
      }
      int v10 = 0;
      goto LABEL_14;
    case 2:
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.8();
      }
      int v11 = 0;
      int v10 = 1;
      goto LABEL_15;
    case 3:
      id v14 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.9();
      }
      goto LABEL_38;
    default:
      int v10 = 1;
LABEL_14:
      int v11 = 1;
LABEL_15:
      BOOL v15 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:self->_localDatabase];
      BOOL v16 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _isDatabaseOpen:self->_parsecDatabase];
      if (!v15 && !v16)
      {
        v35 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.6();
        }
        goto LABEL_38;
      }
      id v17 = [(WBSFormAutoFillCorrectionsSQLiteStore *)self _normalizeDomain:v42];
      id v18 = v42;
      id v42 = v17;

      uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      if (v42) {
        BOOL v19 = v15;
      }
      else {
        BOOL v19 = 0;
      }
      if (!v19) {
        goto LABEL_27;
      }
      id v20 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, @"SELECT id FROM visited_hosts WHERE domain = ?", &v42);
      v21 = [v20 nextObject];
      uint64_t v22 = v21;
      if (v21) {
        uint64_t v41 = [v21 int64AtIndex:0];
      }

      if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_27;
      }
      id v23 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.5();
      }
      id v24 = SafariShared::WBSSQLiteDatabaseFetch<long long &,NSString * {__strong}&>(self->_localDatabase, @"SELECT classification FROM user_corrections WHERE host_id = ? AND fingerprint = ?", &v41, &v43);
      long long v25 = [v24 nextObject];
      id v26 = v25;
      if (((v25 != 0) & ~v10) == 0)
      {

LABEL_27:
        if (((v11 | !v16) & 1) == 0)
        {
          if (v42)
          {
            uint64_t v27 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, @"SELECT id FROM hosts WHERE domain = ?", &v42);
            uint64_t v28 = [v27 nextObject];
            uint64_t v29 = v28;
            if (v28) {
              uint64_t v41 = [v28 int64AtIndex:0];
            }
          }
          if (v41 == 0x7FFFFFFFFFFFFFFFLL)
          {
            char v30 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, @"SELECT classification FROM corrections WHERE fingerprint = ? AND host_id IS NULL", &v43);
            uint64_t v31 = [v30 nextObject];
            v32 = v31;
            if (v31)
            {
              v33 = [v31 stringAtIndex:0];
              v34 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:]();
              }
              goto LABEL_46;
            }
          }
          else
          {
            v37 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:]();
            }
            char v30 = SafariShared::WBSSQLiteDatabaseFetch<long long &,NSString * {__strong}&>(self->_parsecDatabase, @"SELECT classification FROM corrections WHERE host_id = ? AND fingerprint = ?", &v41, &v43);
            v38 = [v30 nextObject];
            v32 = v38;
            if (v38)
            {
              v33 = [v38 stringAtIndex:0];
LABEL_46:

              goto LABEL_39;
            }
          }

          v39 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:]((uint64_t *)&v43, v39);
          }
        }
LABEL_38:
        v33 = 0;
        goto LABEL_39;
      }
      v33 = [v25 stringAtIndex:0];
      v40 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.4();
      }

LABEL_39:
      return v33;
  }
}

- (BOOL)_removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4
{
  v23[3] = *(double *)MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v8 = [v6 isEqualToDate:v7];

  if (!v8)
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    int v10 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, @"SELECT id FROM visited_hosts WHERE domain = ?", &v22);
    int v11 = [v10 nextObject];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 int64AtIndex:0];
      uint64_t v21 = v13;
    }
    else
    {
      uint64_t v13 = v21;
    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:]();
      }
    }
    else
    {
      localDatabase = self->_localDatabase;
      [v6 timeIntervalSinceReferenceDate];
      v23[0] = v16;
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,double>(localDatabase, 0, @"DELETE FROM user_corrections WHERE host_id = ? AND first_correction_time >= ?", &v21, v23) == 101)
      {
        id v17 = SafariShared::WBSSQLiteDatabaseFetch<long long &>(self->_localDatabase, @"SELECT COUNT(*) AS count FROM user_corrections WHERE host_id = ?", &v21);

        if (v17)
        {
          id v18 = [v17 nextObject];
          BOOL v19 = [v18 int64AtIndex:0] == 0;

          if (!v19
            || SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &>(self->_localDatabase, 0, @"DELETE FROM visited_hosts WHERE id = ?", &v21) == 101)
          {
            BOOL v9 = 1;
LABEL_23:

            goto LABEL_24;
          }
          id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:]();
          }
          int v10 = v17;
        }
        else
        {
          id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:]();
          }
          int v10 = 0;
        }
      }
      else
      {
        id v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:].cold.4();
        }
      }
    }

    BOOL v9 = 0;
    id v17 = v10;
    goto LABEL_23;
  }
  BOOL v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_localDatabase, 0, @"DELETE FROM visited_hosts WHERE domain = ?", &v22) == 101;
LABEL_24:

  return v9;
}

- (void)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 date:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_msgSend(v11, "copy", v11);
  [v12 copy];
  [v13 copy];
  operator new();
}

void __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_cold_1(a1, v2);
  }
  [*(id *)(a1 + 48) _openDatabasesIfNeeded];
  os_log_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = v3[3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_200;
  v12[3] = &unk_1E5C9B170;
  v12[4] = v3;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  char v5 = [v3 _tryToPerformTransactionOnDatabase:v4 inBlock:v12];
  id v6 = *(id **)(a1 + 80);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x1AD0C4750]();
  }
  if (*(void *)(a1 + 72))
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(void *)(a1 + 48) + 40), 0);
    int v8 = dispatch_get_global_queue(qos_class, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C9AF18;
    id v10 = *(id *)(a1 + 72);
    char v11 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_200(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLocalClassification:*(void *)(a1 + 40) forFieldWithFingerprint:*(void *)(a1 + 48) onDomain:*(void *)(a1 + 56) dateReclassified:*(void *)(a1 + 64)];
}

uint64_t __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_removeAllLocalClassifications
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, @"DELETE FROM visited_hosts");
  if (v3 != 101)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_localDatabase lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _removeAllLocalClassifications]();
    }
  }
  return v3 == 101;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_parsecDatabase, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_parsecDatabaseURL, 0);
  objc_storeStrong((id *)&self->_localDatabaseURL, 0);
}

- (void)_createFreshLocalDatabaseSchema
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the whitelist table: %@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to drop the v1 corrections table: %@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_3
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to drop the corrections table: %@ (%d)", v4, v5);
}

- (void)_configureDatabase:currentSchemaVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  *(_DWORD *)uint64_t v1 = 141558275;
  *(void *)(v1 + 4) = 1752392040;
  *(_WORD *)(v1 + 12) = 2117;
  *(void *)(v1 + 14) = v2;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire exclusive access to AutoFill corrections SQLite store at %{sensitive, mask.hash}@.", v4, 0x16u);
}

- (void)_configureDatabase:(uint8_t *)buf currentSchemaVersion:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 141558531;
  *(void *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on AutoFill corrections SQLite store at %{sensitive, mask.hash}@: %{public}@", buf, 0x20u);
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to commit transaction: %@ (%d)", v4, v5);
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to roll back transaction: %@ (%d)", v4, v5);
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to start a transaction: %@ (%d)", v4, v5);
}

- (void)_replaceDomainAllowListWithDomains:retrievalURLString:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to clear whitelist entries: %@ (%d)", v4, v5);
}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to insert whitelist entries: %@ (%d)", v4, v5);
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to delete fingerprint: %@ (%d)", v4, v5);
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to insert fingerprint: %@ (%d)", v4, v5);
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to update fingerprint: %@ (%d)", v4, v5);
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to insert host: %@ (%d)", v4, v5);
}

- (void)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to clear existing correction hosts: %@ (%d)", v4, v5);
}

- (void)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to clear existing corrections: %@ (%d)", v4, v5);
}

- (void)_classificationForFieldWithFingerprint:(uint64_t *)a1 onDomain:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Did not find classification correction in either local or cloud database for fingerprint '%@", (uint8_t *)&v3, 0xCu);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "Returning classification '%@' from cloud database for fingerprint '%@");
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Found host in cloud database", v2, v3, v4, v5, v6);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.4()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "Returning classification '%@' from local database for fingerprint '%@'");
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Found host in local database", v2, v3, v4, v5, v6);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Neither local nor cloud classification correction databases could be opened", v1, 2u);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Processing classification request considering only local database", v2, v3, v4, v5, v6);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Processing classification request considering only cloud database", v2, v3, v4, v5, v6);
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Processing classification request considering *no* database", v2, v3, v4, v5, v6);
}

- (void)_classificationForFieldWithFingerprint:(uint64_t)a1 onDomain:(NSObject *)a2 .cold.10(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Processing classification request on database queue for control with fingerprint '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v1, v3, "Failed to find visited host: %@", v4);
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v1, v3, "Failed to fetch remaining user corrections: %@", v4);
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to delete visited host: %@ (%d)", v4, v5);
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to delete classifications: %@ (%d)", v4, v5);
}

void __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Setting local classification '%@' on database queue for control with fingerprint '%@'", (uint8_t *)&v4, 0x16u);
}

- (void)_removeAllLocalClassifications
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to delete visited_hosts: %@ (%d)", v4, v5);
}

@end