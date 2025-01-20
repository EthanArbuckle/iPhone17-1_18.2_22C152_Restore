@interface SPCoreSpotlightIndexer
+ (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5 logQuery:(BOOL)a6;
+ (SPCoreSpotlightIndexer)sharedInstance;
+ (id)_filterReindexAllExtensions:(id)a3;
+ (id)_mergedTokenRewrites:(id)a3;
+ (id)allProtectionClasses;
+ (id)fileProviderProtectionClasses;
+ (unint64_t)freeIndexDiskSpace;
+ (unint64_t)storageSizeForFolder:(id)a3;
+ (unint64_t)totalIndexDiskSpace;
+ (void)cooldown;
+ (void)deactivate;
+ (void)deviceStateWillChange:(BOOL)a3;
+ (void)initialize;
+ (void)preheat;
+ (void)setIndexerDelegate:(id)a3;
+ (void)setMemoryPressureStatus:(unint64_t)a3;
+ (void)shrink:(unint64_t)a3;
+ (void)shutdown;
+ (void)sync;
- (BOOL)isForegroundFileProviderBundleID:(id)a3;
- (BOOL)updatePersonas;
- (BOOL)writeData:(id)a3 toFile:(id)a4;
- (CSFileProviderDomainMonitor)fileProviderMonitor;
- (CSIndexExtensionDelegate)extensionDelegate;
- (NSDictionary)concreteIndexers;
- (NSDictionary)fileProviderAppToExtensionBundleMap;
- (NSDictionary)fileProviderExtensionToAppBundleMap;
- (NSMutableSet)knownPersonas;
- (NSObject)dataMigrationFinishObserver;
- (NSObject)dataMigrationStartObserver;
- (NSSet)dataMigrationBundleIDs;
- (NSSet)fileProviderBundleIDs;
- (NSSet)prefsDisabledBundleIDs;
- (NSURL)personaListURL;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)indexQueue;
- (OS_dispatch_queue)personaQueue;
- (OS_dispatch_queue)reindexAllQueue;
- (OS_dispatch_source)prefsChangeSource;
- (OS_dispatch_source)reindexAllItemsSource;
- (OS_dispatch_source)reindexAllItemsWithIdentifiersSource;
- (SPCoreSpotlightIndexer)init;
- (SPCoreSpotlightIndexerDelegate)indexerDelegate;
- (SPCoreSpotlightInteractionHandler)interactionHandler;
- (SPCoreSpotlightTask)reindexAllItemsTask;
- (double)lastUpdateTime;
- (id)_startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)_taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)concreteIndexerForProtectionClass:(id)a3 andBundleID:(id)a4;
- (id)contactsIndexer;
- (id)dateRewritesFromContext:(id)a3;
- (id)defaultIndexer;
- (id)delegateServiceName;
- (id)dumpIndexAges;
- (id)dumpIndexAgesAtPath:(id)a3;
- (id)dumpIndexAnalytics;
- (id)dumpIndexAnalyticsAtPath:(id)a3;
- (id)fileProviderDomainFilterQueries;
- (id)indexServiceName;
- (id)issueHeartbeat;
- (id)priorityIndexAvailableTouchFilePath;
- (id)priorityIndexPath;
- (id)priorityIndexer;
- (id)queryForWord:(id)a3 matchingAttributes:(id)a4 prefixMatch:(BOOL)a5;
- (id)searchServiceName;
- (id)sendAnalytics:(id)a3;
- (id)spotlightCacheFilePrefix;
- (id)startQuery:(id)a3 withContext:(id)a4 eventHandler:(id)a5 handler:(id)a6;
- (id)startQuery:(id)a3 withContext:(id)a4 handler:(id)a5;
- (id)startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)systemSettingsIndexer;
- (id)taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
- (id)writeUISearchEnabled:(BOOL)a3;
- (int)_openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5;
- (int)openIndex:(BOOL)a3;
- (int)openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5;
- (int)openIndex:(BOOL)a3 readOnly:(BOOL)a4;
- (int64_t)transactionCount;
- (unint64_t)dataMigrationStage;
- (unint64_t)purgeIndexForSize:(unint64_t)a3;
- (unint64_t)purgeVectorIndex:(BOOL)a3;
- (unint64_t)purgeableIndexSize:(id)a3;
- (unint64_t)purgeableVectorIndexSize:(BOOL)a3;
- (void)_closeIndexWithIndexers:(id)a3;
- (void)_enumerateIndexersWithBlock:(id)a3;
- (void)_enumerateIndexersWithProtectionClasses:(id)a3 block:(id)a4;
- (void)_enumerateIndexersWithProtectionClasses:(id)a3 forBundleIds:(id)a4 inferPriorityIndex:(BOOL)a5 block:(id)a6;
- (void)_enumerateIndexersWithProtectionClasses:(id)a3 inferPriorityIndex:(BOOL)a4 block:(id)a5;
- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4;
- (void)_issueCacheCommand:(id)a3 xpc:(id)a4 searchContext:(id)a5 completionHandler:(id)a6;
- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6;
- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)_migrateIndexExtensionsWithEnumerator:(id)a3 forced:(BOOL)a4 migratedBundleIds:(id)a5 completionHandler:(id)a6;
- (void)_registerForPrefsChanges;
- (void)_reindexAllIdentifiersWithExtension:(id)a3 completionBlock:(id)a4;
- (void)_reindexAllItemsForBundleIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)_reindexAllItemsOnPrefsChanges;
- (void)_reindexAllItemsWithExtensionsAndCompletionBlock:(id)a3;
- (void)_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:(id)a3;
- (void)_upgradeToPriorityIndex;
- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4;
- (void)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)cancelQuery:(id)a3;
- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8;
- (void)checkIfExtensionsNeedToBeLoaded;
- (void)cleanupStringsWithProtectionClasses:(id)a3 completionHandler:(id)a4;
- (void)clientDidCheckin:(id)a3 protectionClass:(id)a4 service:(id)a5 completionHandler:(id)a6;
- (void)closeIndex;
- (void)commitUpdates;
- (void)commitUpdatesWithCompletionHandler:(id)a3;
- (void)coolDown;
- (void)dealloc;
- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4;
- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3 fromClient:(id)a4 protectionClass:(id)a5 shouldGC:(BOOL)a6 completionHandler:(id)a7;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5;
- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4;
- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 completionHandler:(id)a10;
- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completion:(id)a7;
- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(int)a8 completion:(id)a9;
- (void)fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(unsigned int)a7 qos:(unsigned int)a8 completionHandler:(id)a9;
- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)fileProviderActiveProvidersChanged:(id)a3;
- (void)fileProviderInfoSetup;
- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5;
- (void)flush;
- (void)getDBLogsWithCompletionHandler:(id)a3;
- (void)handleRankingCommand:(id)a3 completion:(id)a4;
- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 itemsHTML:(id)a9 clientState:(id)a10 expectedClientState:(id)a11 clientStateName:(id)a12 deletes:(id)a13 canCreateNewIndex:(BOOL)a14 completionHandler:(id)a15;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 completionHandler:(id)a11;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9;
- (void)init;
- (void)issueCleanup:(id)a3 flags:(int)a4;
- (void)issueConsistencyCheck:(id)a3;
- (void)issueDefrag:(id)a3 group:(id)a4;
- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4;
- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4;
- (void)issueDuplicateOidCheck:(id)a3;
- (void)issueDuplicateOidCheckWithGroup:(id)a3 protected:(BOOL)a4;
- (void)issueHeartbeat;
- (void)issueLoadTrial:(id)a3;
- (void)issueMessagesFixup:(id)a3;
- (void)issuePathFixup:(id)a3;
- (void)issueRepair:(id)a3;
- (void)issueResolveFPItem:(id)a3 completionHandler:(id)a4;
- (void)issueResolveFPItemForBundle:(id)a3 domain:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)issueResolveFPItemForURL:(id)a3 completionHandler:(id)a4;
- (void)issueSharedDocumentAttributeFixup;
- (void)issueSplit:(id)a3;
- (void)locked;
- (void)lockedCx;
- (void)locking;
- (void)lockingCx;
- (void)markIndexPurgeable:(BOOL)a3;
- (void)mergeWithProtectionClasses:(id)a3 completionHandler:(id)a4;
- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4;
- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 completionHandler:(id)a5;
- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 inferPriorityIndex:(BOOL)a5 completionHandler:(id)a6;
- (void)migrateForced:(BOOL)a3;
- (void)performIndexerTask:(id)a3 completionHandler:(id)a4;
- (void)performIndexerTask:(id)a3 withIndexExtensionsAndCompletionHandler:(id)a4;
- (void)personaListDidUpdate;
- (void)powerStateChanged;
- (void)preheat;
- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6;
- (void)processSearchString:(id)a3 intoTrimmedString:(id *)a4 andTokens:(id *)a5;
- (void)queryPreheat:(id)a3;
- (void)recordEngagementForBundleID:(id)a3 uniqueIdentifier:(id)a4 protectionClass:(id)a5 userQuery:(id)a6 date:(id)a7;
- (void)recycleAndPurgeIndex;
- (void)recycleIndex:(BOOL)a3;
- (void)registerCacheDeleteCallbackForVolumePath:(id)a3;
- (void)reindexAllItemsWithIndexers:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)restoreIndexAndClearPurgeable;
- (void)resume;
- (void)revokeExpiredItems:(id)a3 protected:(BOOL)a4;
- (void)rewriteFirstPassQueryWithQueryString:(id)a3 context:(id)a4 trimmedSearchStringTokens:(id)a5 populateDateSynonyms:(BOOL)a6;
- (void)rewriteQueryWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 rewriteHandler:(id)a6;
- (void)runMigration;
- (void)setConcreteIndexers:(id)a3;
- (void)setDataMigrationBundleIDs:(id)a3;
- (void)setDataMigrationFinishObserver:(id)a3;
- (void)setDataMigrationStage:(unint64_t)a3;
- (void)setDataMigrationStartObserver:(id)a3;
- (void)setExtensionDelegate:(id)a3;
- (void)setFileProviderMonitor:(id)a3;
- (void)setFirstUnlockQueue:(id)a3;
- (void)setIndexQueue:(id)a3;
- (void)setIndexerDelegate:(id)a3;
- (void)setInteractionHandler:(id)a3;
- (void)setKnownPersonas:(id)a3;
- (void)setPersonaQueue:(id)a3;
- (void)setPrefsChangeSource:(id)a3;
- (void)setPrefsDisabledBundleIDs:(id)a3;
- (void)setReindexAllItemsSource:(id)a3;
- (void)setReindexAllItemsTask:(id)a3;
- (void)setReindexAllItemsWithIdentifiersSource:(id)a3;
- (void)setReindexAllQueue:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setUpdatePersonas:(BOOL)a3;
- (void)shrink:(unint64_t)a3;
- (void)shutdown;
- (void)start;
- (void)startQueryTask:(id)a3;
- (void)topKTerms:(id)a3 completionHandler:(id)a4;
- (void)transferDeleteJournalsForProtectionClass:(id)a3 toDirectory:(int)a4 completionHandler:(id)a5;
- (void)unlock;
- (void)upgradeCheck;
- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5 forBundleID:(id)a6 personaID:(id)a7;
- (void)validateIndexers:(id)a3 outFileDescriptor:(int)a4;
- (void)validateVectors:(id)a3 outFileDescriptor:(int)a4;
- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)wipeCoreSpotlightIndexForTrial;
- (void)writeFileProviderBundleMap:(id)a3 fileProviderBundleIDs:(id)a4;
@end

@implementation SPCoreSpotlightIndexer

BOOL __30__SPCoreSpotlightIndexer_init__block_invoke_2(uint64_t a1, int a2)
{
  int v3 = [(id)sDelegate deviceUnlocked];
  deviceUnlocked = v3;
  if (v3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    wait_for_apfs_kb_state((const char *)sIndexMountPath, 1);
    int v3 = deviceUnlocked;
  }
  return v3 == 0;
}

- (id)_taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v67 = a5;
  id v14 = a6;
  id v66 = a7;
  v68 = v14;
  if (!v14) {
    -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }
  v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.4();
  }

  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  v16 = [v13 protectionClasses];
  uint64_t v17 = [v16 count];
  BOOL v62 = v17 == 0;
  if (v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      v59 = [v13 clientBundleID];
      v60 = [(id)objc_opt_class() allProtectionClasses];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v130 = v59;
      __int16 v131 = 2112;
      v132 = v60;
      _os_log_debug_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "PCS %@ for query %@ from client %@ (available: %@)", buf, 0x2Au);
    }
    v71 = v16;
  }
  else
  {
    v18 = [(id)objc_opt_class() allProtectionClasses];
    v71 = (void *)[v18 copy];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]((uint64_t)v71, (uint64_t)v12, v13);
    }
  }
  if ([v13 internal])
  {
    v19 = [v13 clientBundleID];
    if ([v19 isEqualToString:@"com.apple.searchutil"])
    {
      uint64_t v20 = 0;
    }
    else
    {
      v21 = [v13 clientBundleID];
      int v22 = [v21 isEqualToString:@"com.apple.search"];

      uint64_t v20 = v22 ^ 1u;
    }
  }
  else
  {
    uint64_t v20 = 1;
  }
  v23 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  v70 = [v13 bundleIDs];
  if ([v70 count])
  {
    v24 = (void *)MEMORY[0x263EFFA08];
    v25 = [v13 bundleIDs];
    v69 = [v24 setWithArray:v25];
LABEL_20:

    goto LABEL_25;
  }
  if (([v13 internal] & 1) == 0)
  {
    v26 = [v13 clientBundleID];
    BOOL v27 = v26 == 0;

    if (!v27)
    {
      v28 = (void *)MEMORY[0x263EFFA08];
      v25 = [v13 clientBundleID];
      v69 = [v28 setWithObject:v25];
      goto LABEL_20;
    }
  }
  v69 = 0;
LABEL_25:
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke;
  v126[3] = &unk_2645085C0;
  id v72 = v23;
  id v127 = v72;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v71 forBundleIds:v69 inferPriorityIndex:v20 block:v126];
  if ([v72 count])
  {
    int v29 = [v13 live];
    v30 = off_264506120;
    if (!v29) {
      v30 = off_264506128;
    }
    v31 = (void *)[objc_alloc(*v30) initWithQueryString:v12 queryContext:v13];
    v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v33 = v72;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v128 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v123;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v123 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = [*(id *)(*((void *)&v122 + 1) + 8 * i) knownClients];
          [v32 unionSet:v37];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v128 count:16];
      }
      while (v34);
    }

    [v31 setKnownBundleIds:v32];
    v38 = [v13 clientBundleID];
    v39 = self->_indexQueue;
    v63 = [v33 objectEnumerator];
    uint64_t v40 = [v33 count];
    id v61 = v12;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v130 = 0;
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x2020000000;
    v121[3] = 0;
    v120[0] = 0;
    v120[1] = v120;
    v120[2] = 0x2020000000;
    v120[3] = 0;
    v119[0] = 0;
    v119[1] = v119;
    v119[2] = 0x2020000000;
    v119[3] = 0;
    v112[0] = MEMORY[0x263EF8330];
    v112[1] = 3221225472;
    v112[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2112;
    v112[3] = &unk_2645087E0;
    v41 = v39;
    v113 = v41;
    id v42 = v31;
    id v114 = v42;
    id v43 = v38;
    id v115 = v43;
    v116 = v121;
    v117 = v120;
    v118 = v119;
    v64 = (void *)[v112 copy];
    if (s_last_memory_pressure_status != 1
      && ([v13 rankingQueries],
          v44 = objc_claimAutoreleasedReturnValue(),
          BOOL v45 = [v44 count] == 0,
          v44,
          v45))
    {
      char v47 = [v13 live];
      int v46 = 1;
    }
    else
    {
      int v46 = 0;
      char v47 = 0;
    }
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2114;
    v102[3] = &unk_264508808;
    v48 = v41;
    v103 = v48;
    id v104 = v13;
    id v49 = v68;
    id v107 = v49;
    v108 = v119;
    uint64_t v110 = v40;
    id v50 = v42;
    char v111 = v47;
    id v105 = v50;
    v109 = v121;
    id v51 = v43;
    id v106 = v51;
    v65 = (void *)[v102 copy];
    id location = 0;
    objc_initWeak(&location, v50);
    if (v46)
    {
      id v12 = v61;
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2117;
      v89[3] = &unk_264508830;
      objc_copyWeak(&v99, &location);
      v90 = v48;
      v96 = v121;
      v97 = buf;
      id v91 = v63;
      id v93 = v64;
      id v94 = v67;
      id v52 = v65;
      BOOL v100 = v62;
      id v95 = v52;
      v98 = v120;
      id v92 = v51;
      v53 = (void *)MEMORY[0x223C48320](v89);

      objc_destroyWeak(&v99);
      objc_destroyWeak(&location);
    }
    else
    {
      id v12 = v61;
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2118;
      v77[3] = &unk_264508830;
      objc_copyWeak(&v87, &location);
      v78 = v48;
      v84 = v121;
      v85 = buf;
      id v79 = v63;
      id v81 = v64;
      id v82 = v67;
      id v55 = v65;
      BOOL v88 = v62;
      id v83 = v55;
      v86 = v120;
      id v80 = v51;
      v53 = (void *)MEMORY[0x223C48320](v77);

      objc_destroyWeak(&v87);
      objc_destroyWeak(&location);
    }
    [v50 setWillAsyncStart:0];
    [v50 setScheduleBlock:v53];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2119;
    v73[3] = &unk_264508858;
    v56 = v48;
    v74 = v56;
    id v75 = v49;
    id v76 = v66;
    [v50 setCompletionBlock:v73];
    v57 = v76;
    id v54 = v50;

    _Block_object_dispose(v119, 8);
    _Block_object_dispose(v120, 8);
    _Block_object_dispose(v121, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v32 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
    }
    id v54 = 0;
  }

  return v54;
}

- (id)taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }

  v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }

  int v19 = [v13 rankingType];
  if ((_os_feature_enabled_impl() & 1) != 0 || v19 != 1)
  {
    uint64_t v20 = [(SPCoreSpotlightIndexer *)self _taskForQueryWithQueryString:v12 queryContext:v13 eventHandler:v14 resultsHandler:v15 completionHandler:v16];
  }
  else
  {
    uint64_t v20 = [(id)sDelegate taskForTopHitQueryWithQueryString:v12 queryContext:v13 eventHandler:v14 resultsHandler:v15 completionHandler:v16];
  }
  v21 = (void *)v20;

  return v21;
}

- (void)startQueryTask:(id)a3
{
  id v3 = a3;
  BOOL v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer startQueryTask:]();
  }

  if (v3)
  {
    v5 = sIndexQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke;
    v7[3] = &unk_2645063F8;
    id v8 = v3;
    v6 = _setup_block(v7, [v8 critical], 14557);
    dispatch_async(v5, v6);
  }
}

uint64_t __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke(uint64_t a1)
{
  v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) start];
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 completionHandler:(id)a11
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v32 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  int v22 = (void (**)(id, void *))a11;
  v23 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    id v34 = v21;
    __int16 v35 = 2112;
    id v36 = v19;
    __int16 v37 = 2048;
    uint64_t v38 = [v17 length];
    __int16 v39 = 2112;
    id v40 = v20;
    __int16 v41 = 2048;
    uint64_t v42 = [v16 count];
    __int16 v43 = 2048;
    uint64_t v44 = [v32 count];
    __int16 v45 = 2048;
    int64_t v46 = a10;
    _os_log_debug_impl(&dword_21F1CE000, v23, OS_LOG_TYPE_DEBUG, "indexSearchableItems, bundleID:%@, clientState:%@/%ld, protectionClass:%@, itemCount:%ld, deleteIdentifiersCount:%ld, options:0x%lx", buf, 0x48u);
  }

  _checkUnlock();
  if (v21)
  {
    if (![(id)sDelegate blocklistCheck:v21 withOptions:a10])
    {
      BOOL v27 = (void *)*MEMORY[0x263F08098];
      id v30 = v20;
      if (v20) {
        BOOL v27 = v20;
      }
      id v26 = v27;
      v28 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v26 andBundleID:v21];
      if (v28)
      {
        self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
        [v28 indexSearchableItems:v16 deleteSearchableItemsWithIdentifiers:v32 clientState:v17 expectedClientState:v18 clientStateName:v19 forBundleID:v21 options:a10 completionHandler:v22];
      }
      else if (v22)
      {
        int v29 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
        v22[2](v22, v29);
      }
      id v20 = v30;
      goto LABEL_16;
    }
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
LABEL_8:
    id v26 = (id)v24;
    v22[2](v22, (void *)v24);
LABEL_16:

    goto LABEL_17;
  }
  if (v22)
  {
    id v25 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v24 = [v25 initWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    goto LABEL_8;
  }
LABEL_17:
}

- (id)concreteIndexerForProtectionClass:(id)a3 andBundleID:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F080B0];
  if ([(__CFString *)v6 isEqualToString:*MEMORY[0x263F080B0]])
  {
    v9 = (__CFString *)(id)*MEMORY[0x263F08098];

    v6 = v9;
  }
  if (sUsePriorityIndex == 1
    && [v7 length]
    && (([(__CFString *)v6 isEqual:*MEMORY[0x263F08098]] & 1) != 0
     || [(__CFString *)v6 isEqual:v8])
    && [(id)sPriorityBundleIds containsObject:v7])
  {

    v6 = @"Priority";
  }
  v10 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  v11 = [v10 objectForKeyedSubscript:v6];

  return v11;
}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 forBundleIds:(id)a4 inferPriorityIndex:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v33 = a4;
  v11 = (void (**)(id, id))a6;
  if (!v10)
  {
    id v10 = [(id)objc_opt_class() allProtectionClasses];
  }
  if (sUsePriorityIndex == 1 && v7)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (!v14)
    {
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v15 = v14;
    id v34 = v10;
    int v16 = 0;
    char v17 = 0;
    uint64_t v18 = *(void *)v41;
    uint64_t v19 = *MEMORY[0x263F08098];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v13);
        }
        id v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isEqualToString:", v19, v33) & 1) != 0
          || ([v21 isEqualToString:@"Default"] & 1) != 0)
        {
          char v17 = 1;
        }
        else
        {
          v16 |= [v21 isEqualToString:@"Priority"];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v15);

    char v22 = v16 | ~v17;
    id v10 = v34;
    if ((v22 & 1) == 0 && (!v33 || [v33 intersectsSet:sPriorityBundleIds]))
    {
      v23 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
      id v13 = [v23 objectForKeyedSubscript:@"Priority"];

      if (v13) {
        v11[2](v11, v13);
      }
      goto LABEL_23;
    }
  }
LABEL_24:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v10;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    uint64_t v35 = *MEMORY[0x263F08098];
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        int v29 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        id v30 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
        v31 = [v30 objectForKeyedSubscript:v29];

        if (!v31)
        {
          if (![v29 isEqualToString:@"Default"]) {
            continue;
          }
          id v32 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
          v31 = [v32 objectForKeyedSubscript:v35];

          if (!v31) {
            continue;
          }
        }
        v11[2](v11, v31);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v26);
  }
}

- (NSDictionary)concreteIndexers
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 index]
    || ([MEMORY[0x263F08850] defaultManager],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [v3 _indexPath],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 fileExistsAtPath:v5 isDirectory:0],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    BOOL v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v3 _indexPath];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "*warn* Skipped nil indexer because index path %@ doesn't exist.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  _checkUnlock();
  [(SPCoreSpotlightIndexer *)self indexSearchableItems:v19 deleteSearchableItemsWithIdentifiers:v18 clientState:0 clientStateName:0 protectionClass:v17 forBundleID:v16 options:a8 completionHandler:v15];
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
}

- (BOOL)isForegroundFileProviderBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (v5 = self,
        objc_sync_enter(v5),
        [(SPCoreSpotlightIndexer *)v5 fileProviderInfoSetup],
        BOOL v6 = [(NSSet *)v5->_fileProviderBundleIDs containsObject:v4],
        objc_sync_exit(v5),
        v5,
        v6))
  {
    char v7 = [MEMORY[0x263F054D0] isProviderIDForeground:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)fileProviderInfoSetup
{
  if (!sPrivate)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke;
    block[3] = &unk_2645063F8;
    block[4] = self;
    if (fileProviderInfoSetup_onceToken != -1) {
      dispatch_once(&fileProviderInfoSetup_onceToken, block);
    }
  }
}

uint64_t __61__SPCoreSpotlightIndexer_commitUpdatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 commitUpdates:*(void *)(a1 + 32)];
}

uint64_t __85__SPCoreSpotlightIndexer_clientDidCheckin_protectionClass_service_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientDidCheckin:*(void *)(a1 + 40) service:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (unint64_t)dataMigrationStage
{
  return self->_dataMigrationStage;
}

- (id)fileProviderDomainFilterQueries
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileProviderMonitor);
  id v3 = [WeakRetained removedDomainFilterQueries];

  return v3;
}

+ (id)allProtectionClasses
{
  if (allProtectionClasses_onceToken != -1) {
    dispatch_once(&allProtectionClasses_onceToken, &__block_literal_global_1826);
  }
  v2 = (void *)allProtectionClasses_sProtectionClasses;
  return v2;
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a7;
  _checkUnlock();
  if (v18) {
    id v14 = v18;
  }
  else {
    id v14 = (id)*MEMORY[0x263F08098];
  }
  id v15 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v14 andBundleID:v11];
  id v16 = v15;
  if (v15)
  {
    [v15 fetchLastClientStateForBundleID:v11 clientStateName:v12 completionHandler:v13];
  }
  else if (v13)
  {
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v13[2](v13, 0, v17);
  }
}

- (void)clientDidCheckin:(id)a3 protectionClass:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (sShuttingDown != 1)
  {
    _checkUnlock();
    id v16 = (void *)*MEMORY[0x263F08098];
    if (v11) {
      id v16 = v11;
    }
    id v15 = v16;
    id v17 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v15 andBundleID:v10];
    if (v17)
    {
      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      id v18 = [(SPCoreSpotlightIndexer *)self extensionDelegate];

      if (v18)
      {
        id v19 = [MEMORY[0x263F02B50] sharedManager];
        [v19 loadExtensions];
      }
      id v20 = sIndexQueue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __85__SPCoreSpotlightIndexer_clientDidCheckin_protectionClass_service_completionHandler___block_invoke;
      v23[3] = &unk_2645070F0;
      id v24 = v17;
      id v25 = v10;
      id v26 = v12;
      id v27 = v13;
      id v21 = _setup_block(v23, 0, 15894);
      dispatch_async(v20, v21);
    }
    else if (v13)
    {
      char v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v22);
    }
    goto LABEL_15;
  }
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SPCoreSpotlightIndexer clientDidCheckin:protectionClass:service:completionHandler:]();
  }

  if (v13)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
LABEL_15:
  }
}

- (CSIndexExtensionDelegate)extensionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->extensionDelegate);
  return (CSIndexExtensionDelegate *)WeakRetained;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void *))a8;
  _checkUnlock();
  if (v13) {
    id v17 = v13;
  }
  else {
    id v17 = (id)*MEMORY[0x263F08098];
  }
  id v18 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v17 andBundleID:v14];
  if (v18)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    [v18 deleteSearchableItemsWithDomainIdentifiers:v20 forBundleID:v14 fromClient:v15 reason:0 completionHandler:v16];
  }
  else if (v16)
  {
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v16[2](v16, v19);
  }
}

+ (SPCoreSpotlightIndexer)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1858);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return (SPCoreSpotlightIndexer *)v2;
}

- (void)commitUpdatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SPCoreSpotlightIndexer commitUpdatesWithCompletionHandler:]();
  }
  v5 = v4;
  BOOL v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "commitUpdatesWithCompletionHandler", buf, 2u);
  }

  dispatch_group_t v7 = dispatch_group_create();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__SPCoreSpotlightIndexer_commitUpdatesWithCompletionHandler___block_invoke;
  v11[3] = &unk_2645085C0;
  dispatch_group_t v12 = v7;
  uint64_t v8 = v7;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithBlock:v11];
  int v9 = sIndexQueue;
  id v10 = _setup_block(v5, 0, 13375);
  dispatch_group_notify(v8, v9, v10);
}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 inferPriorityIndex:(BOOL)a4 block:(id)a5
{
}

- (void)_enumerateIndexersWithBlock:(id)a3
{
}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 itemsHTML:(id)a9 clientState:(id)a10 expectedClientState:(id)a11 clientStateName:(id)a12 deletes:(id)a13 canCreateNewIndex:(BOOL)a14 completionHandler:(id)a15
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v45 = a4;
  id v20 = a5;
  id v21 = a7;
  id v43 = a8;
  id v22 = a9;
  id v44 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = (void (**)(id, void *))a15;
  _checkUnlock();
  id v27 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v47 = v19;
    __int16 v48 = 2112;
    id v49 = v24;
    __int16 v50 = 2048;
    uint64_t v51 = [v44 length];
    __int16 v52 = 2112;
    id v53 = v45;
    __int16 v54 = 2048;
    int64_t v55 = a6;
    _os_log_debug_impl(&dword_21F1CE000, v27, OS_LOG_TYPE_DEBUG, "indexFromBundle, bundleID:%@, clientState:%@/%lu, protectionClass:%@, options:0x%lx", buf, 0x34u);
  }

  v28 = v21;
  if (v19)
  {
    if (![(id)sDelegate blocklistCheck:v19 withOptions:a6])
    {
      id v40 = v25;
      id v42 = v24;
      id v29 = v22;
      id v30 = v20;
      uint64_t v35 = (void *)*MEMORY[0x263F08098];
      if (v45) {
        uint64_t v35 = v45;
      }
      id v34 = v35;
      long long v36 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v34 andBundleID:v19];
      if (v36)
      {
        self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
        LOBYTE(v38) = 1;
        [v36 indexFromBundle:v19 personaID:v30 options:a6 items:v21 itemsText:v43 itemsHTML:v29 clientState:v44 expectedClientState:v23 clientStateName:v24 deletes:v40 canCreateNewIndex:v38 completionHandler:v26];
      }
      else if (v26)
      {
        long long v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
        v26[2](v26, v37);

        v28 = v21;
      }

      goto LABEL_17;
    }
    if (v26)
    {
      id v40 = v25;
      id v42 = v24;
      id v29 = v22;
      id v30 = v20;
      v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F01C68];
      uint64_t v33 = -1000;
LABEL_9:
      id v34 = [v31 errorWithDomain:v32 code:v33 userInfo:0];
      v26[2](v26, v34);
LABEL_17:

      id v20 = v30;
      id v22 = v29;
      id v24 = v42;
      id v25 = v40;
    }
  }
  else if (v26)
  {
    id v40 = v25;
    id v42 = v24;
    id v29 = v22;
    id v30 = v20;
    v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F01C68];
    uint64_t v33 = -1;
    goto LABEL_9;
  }
}

- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  v548[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v452 = a5;
  id v11 = a6;
  v451 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  dispatch_group_t v12 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:]();
  }

  if ([v10 hasPrefix:@"job:"])
  {
    id v13 = [v10 componentsSeparatedByString:@":" limit:6];
  }
  else
  {
    if ([v10 hasPrefix:@"reindexJob:"]) {
      [v10 componentsSeparatedByString:@":" limit:5];
    }
    else {
    id v13 = [v10 componentsSeparatedByString:@":"];
    }
  }
  id v14 = v13;
  id v15 = (char *)[v13 count];
  if (!v15) {
    goto LABEL_437;
  }
  id v16 = [v14 objectAtIndexedSubscript:0];
  int v17 = [v16 isEqualToString:@"reset"];

  if (v17)
  {
    if (v11) {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
    dispatch_sync((dispatch_queue_t)self->_indexQueue, &__block_literal_global_2264);
    exit(0);
  }
  id v18 = [v14 objectAtIndexedSubscript:0];
  int v19 = [v18 isEqualToString:@"provide"];

  if (v19)
  {
    if ((unint64_t)v15 >= 5)
    {
      id v20 = [v14 objectAtIndexedSubscript:1];
      if ([v20 isEqualToString:@"data1"])
      {
        int v21 = 0;
        if ((unint64_t)v15 > 5)
        {
          uint64_t v22 = 6;
          goto LABEL_35;
        }
      }
      else
      {
        if (![v20 isEqualToString:@"url1"])
        {
          if (![v20 isEqualToString:@"urls"])
          {
            if ([v20 isEqualToString:@"data"])
            {
              int v21 = 0;
              id v40 = 0;
              uint64_t v41 = 2;
              uint64_t v22 = 6;
            }
            else if ([v20 isEqualToString:@"url"])
            {
              int v21 = 0;
              id v40 = 0;
              uint64_t v41 = 2;
              uint64_t v22 = 7;
            }
            else if ([v20 isEqualToString:@"nonDownloadingData"])
            {
              int v21 = 0;
              id v40 = 0;
              uint64_t v41 = 2;
              uint64_t v22 = 14;
            }
            else if ([v20 isEqualToString:@"nonDownloadingUrl"])
            {
              int v21 = 0;
              id v40 = 0;
              uint64_t v41 = 2;
              uint64_t v22 = 15;
            }
            else
            {
              int v21 = 0;
              if (([v20 isEqualToString:@"inPlaceUrl"] & 1) == 0) {
                goto LABEL_48;
              }
              id v40 = 0;
              uint64_t v41 = 2;
              uint64_t v22 = 8;
            }
LABEL_36:
            char v42 = [v40 integerValue];
            id v43 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:v22 jobOptions:(unint64_t)(v42 & 0xF) << 11];
            id v44 = [v14 objectAtIndexedSubscript:v41];
            [v43 setProviderType:v44];

            id v45 = [v14 objectAtIndexedSubscript:v41 + 1];
            uint64_t v46 = v41 + 2;
            if (v15 == (char *)(v41 + 3))
            {
              id v47 = [v14 objectAtIndexedSubscript:v46];
            }
            else
            {
              __int16 v48 = objc_msgSend(v14, "subarrayWithRange:", v46, &v15[-v46]);
              id v47 = [v48 componentsJoinedByString:@":"];
            }
            if (v21)
            {
              id v49 = [v47 componentsSeparatedByString:@";"];
              [v43 setProviderIdentifiers:v49];
            }
            else
            {
              [v43 setProviderIdentifier:v47];
            }
            __int16 v50 = +[SpotlightDaemonServer sharedDaemonServer];
            char v51 = [v50 handleJob:v43 bundleID:v45 protectionClass:*MEMORY[0x263F08098] completionHandler:v11];

            if (v51)
            {
              __int16 v52 = v11;
            }
            else
            {
              id v53 = [(SPCoreSpotlightIndexer *)v451 extensionDelegate];
              __int16 v52 = v53;
              if (!v53)
              {
LABEL_47:

                LOBYTE(v21) = 1;
                goto LABEL_48;
              }
              [v53 indexRequestsPerformDataJob:v43 forBundle:v45 completionHandler:v11];
            }
            id v11 = 0;
            goto LABEL_47;
          }
          if ((unint64_t)v15 <= 5)
          {
            LOBYTE(v21) = 0;
            goto LABEL_48;
          }
          int v21 = 1;
          uint64_t v22 = 16;
LABEL_35:
          id v40 = [v14 objectAtIndexedSubscript:2];
          uint64_t v41 = 3;
          goto LABEL_36;
        }
        int v21 = 0;
        if ((unint64_t)v15 > 5)
        {
          uint64_t v22 = 7;
          goto LABEL_35;
        }
      }
LABEL_48:

      goto LABEL_438;
    }
    goto LABEL_437;
  }
  id v23 = [v14 objectAtIndexedSubscript:0];
  int v24 = [v23 isEqualToString:@"remote"];

  if (v24)
  {
    if ((unint64_t)v15 >= 3)
    {
      id v25 = [v14 objectAtIndexedSubscript:1];
      if (v15 == (char *)3)
      {
        id v26 = [v14 objectAtIndexedSubscript:2];
      }
      else
      {
        __int16 v54 = objc_msgSend(v14, "subarrayWithRange:", 2, v15 - 2);
        id v26 = [v54 componentsJoinedByString:@":"];
      }
      if (v452 && [v26 isEqualToString:@"start"])
      {
        int64_t v55 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:9 jobOptions:0];
        [v55 setSearchContext:v452];
        uint64_t v56 = [(SPCoreSpotlightIndexer *)v451 extensionDelegate];
        v57 = v56;
        if (v56)
        {
LABEL_61:
          [v56 indexRequestsPerformDataJob:v55 forBundle:v25 completionHandler:v11];

          id v11 = 0;
        }
      }
      else if ([v26 isEqualToString:@"cancel"])
      {
        int64_t v55 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:10 jobOptions:0];
        [v55 setSearchContext:v452];
        uint64_t v56 = [(SPCoreSpotlightIndexer *)v451 extensionDelegate];
        v57 = v56;
        if (v56) {
          goto LABEL_61;
        }
      }
      else
      {
        if (![v26 isEqualToString:@"test"])
        {
          LOBYTE(v21) = 0;
          goto LABEL_63;
        }
        int64_t v55 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:11 jobOptions:0];
        [v55 setSearchContext:v452];
        uint64_t v56 = [(SPCoreSpotlightIndexer *)v451 extensionDelegate];
        v57 = v56;
        if (v56) {
          goto LABEL_61;
        }
      }

      LOBYTE(v21) = 1;
LABEL_63:

      goto LABEL_438;
    }
LABEL_437:
    LOBYTE(v21) = 0;
LABEL_438:
    if (v11)
    {
      if (v21)
      {
        v376 = 0;
      }
      else
      {
        v376 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
      }
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v376);
    }
    goto LABEL_443;
  }
  id v27 = [v14 objectAtIndexedSubscript:0];
  int v28 = [v27 isEqualToString:@"notifyForUpdates"];

  if (v28)
  {
    if ((unint64_t)v15 >= 2)
    {
      id v29 = [v14 objectAtIndexedSubscript:1];
      id v30 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:17 jobOptions:0];
      v31 = +[SpotlightDaemonServer sharedDaemonServer];
      char v32 = [v31 handleJob:v30 bundleID:v29 protectionClass:*MEMORY[0x263F08098] completionHandler:v11];

      if ((v32 & 1) == 0)
      {
        uint64_t v33 = [(SPCoreSpotlightIndexer *)v451 extensionDelegate];
        id v34 = v33;
        if (v33) {
          [v33 indexRequestsPerformDataJob:v30 forBundle:v29 completionHandler:v11];
        }
      }
      goto LABEL_443;
    }
LABEL_88:
    LOBYTE(v21) = 1;
    goto LABEL_438;
  }
  uint64_t v35 = [v14 objectAtIndexedSubscript:0];
  int v36 = [v35 isEqualToString:@"extensions"];

  if (v36)
  {
    qos_class_t v37 = qos_class_self();
    uint64_t v38 = dispatch_get_global_queue(v37, 2uLL);
    v533[0] = MEMORY[0x263EF8330];
    v533[1] = 3221225472;
    v533[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2316;
    v533[3] = &unk_264506548;
    id v534 = v11;
    long long v39 = _setup_block(v533, 0, 16674);
    dispatch_async(v38, v39);

    goto LABEL_443;
  }
  v58 = [v14 objectAtIndexedSubscript:0];
  int v59 = [v58 isEqualToString:@"clients"];

  if (v59)
  {
    v531[0] = MEMORY[0x263EF8330];
    v531[1] = 3221225472;
    v531[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2;
    v531[3] = &unk_264507168;
    v531[4] = v451;
    id v532 = v11;
    id v60 = v11;
    id v61 = (void *)MEMORY[0x223C48320](v531);
    BOOL v62 = sIndexQueue;
    v63 = _setup_block(v61, 0, 16692);
    dispatch_async(v62, v63);

    goto LABEL_443;
  }
  v64 = [v14 objectAtIndexedSubscript:0];
  int v65 = [v64 isEqualToString:@"commit"];

  if (v65)
  {
    id v66 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_21F1CE000, v66, OS_LOG_TYPE_DEFAULT, "Commit command: %@", buf, 0xCu);
    }

    id v67 = (void *)MEMORY[0x223C48320](v11);
    v68 = sIndexQueue;
    v529[0] = MEMORY[0x263EF8330];
    v529[1] = 3221225472;
    v529[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2323;
    v529[3] = &unk_264507168;
    v529[4] = v451;
    id v530 = v67;
    id v69 = v67;
    v70 = _setup_block(v529, 0, 16702);
    dispatch_async(v68, v70);

    goto LABEL_443;
  }
  v71 = [v14 objectAtIndexedSubscript:0];
  int v72 = [v71 isEqualToString:@"flush"];

  if (v72)
  {
    [(SPCoreSpotlightIndexer *)v451 flush];
    goto LABEL_88;
  }
  v73 = [v14 objectAtIndexedSubscript:0];
  int v74 = [v73 isEqualToString:@"begin-turbo"];

  if (v74)
  {
    setTurboMode(1);
    goto LABEL_88;
  }
  id v75 = [v14 objectAtIndexedSubscript:0];
  int v76 = [v75 isEqualToString:@"end-turbo"];

  if (v76)
  {
    setTurboMode(0);
    goto LABEL_88;
  }
  v77 = [v14 objectAtIndexedSubscript:0];
  int v78 = [v77 isEqualToString:@"close"];

  if (v78)
  {
    [(SPCoreSpotlightIndexer *)v451 closeIndex];
    goto LABEL_88;
  }
  id v79 = [v14 objectAtIndexedSubscript:0];
  int v80 = [v79 isEqualToString:@"merge"];

  if (v80)
  {
    id v81 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_21F1CE000, v81, OS_LOG_TYPE_DEFAULT, "Merge command: %@", buf, 0xCu);
    }

    if ((unint64_t)v15 <= 1)
    {
      v84 = (void *)MEMORY[0x223C48320](v11);
      int v85 = 0;
      id v83 = 0;
    }
    else
    {
      id v82 = [v14 objectAtIndexedSubscript:1];
      v548[0] = v82;
      id v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v548 count:1];

      v84 = (void *)MEMORY[0x223C48320](v11);
      if (v15 != (char *)2)
      {
        id v15 = [v14 objectAtIndexedSubscript:2];
        uint64_t v89 = [v15 isEqual:@"cts"];
        int v85 = 1;
        goto LABEL_105;
      }
      int v85 = 0;
    }
    uint64_t v89 = 0;
LABEL_105:
    v527[0] = MEMORY[0x263EF8330];
    v527[1] = 3221225472;
    v527[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2343;
    v527[3] = &unk_264508BF0;
    id v528 = v84;
    id v93 = v84;
    [(SPCoreSpotlightIndexer *)v451 mergeWithProtectionClasses:v83 power:v89 inferPriorityIndex:0 completionHandler:v527];
    if (v85) {

    }
    goto LABEL_443;
  }
  v86 = [v14 objectAtIndexedSubscript:0];
  int v87 = [v86 isEqualToString:@"split"];

  if (v87)
  {
    if ((unint64_t)v15 <= 1)
    {
      [(SPCoreSpotlightIndexer *)v451 issueSplit:0];
    }
    else
    {
      BOOL v88 = [v14 objectAtIndexedSubscript:1];
      [(SPCoreSpotlightIndexer *)v451 issueSplit:v88];
    }
    goto LABEL_88;
  }
  v90 = [v14 objectAtIndexedSubscript:0];
  int v91 = [v90 isEqualToString:@"repair"];

  if (v91)
  {
    if ((unint64_t)v15 <= 1)
    {
      [(SPCoreSpotlightIndexer *)v451 issueRepair:0];
    }
    else
    {
      id v92 = [v14 objectAtIndexedSubscript:1];
      [(SPCoreSpotlightIndexer *)v451 issueRepair:v92];
    }
    goto LABEL_88;
  }
  id v94 = [v14 objectAtIndexedSubscript:0];
  int v95 = [v94 isEqualToString:@"cleanup"];

  if (v95)
  {
    if ((unint64_t)v15 < 2)
    {
      [(SPCoreSpotlightIndexer *)v451 issueCleanup:0 flags:0];
      goto LABEL_88;
    }
    v96 = [v14 objectAtIndexedSubscript:1];
    if (v15 == (char *)2)
    {
      [(SPCoreSpotlightIndexer *)v451 issueCleanup:v96 flags:0];
    }
    else
    {
      v102 = [v14 objectAtIndexedSubscript:2];
      -[SPCoreSpotlightIndexer issueCleanup:flags:](v451, "issueCleanup:flags:", v96, [v102 intValue]);
    }
LABEL_172:

    goto LABEL_88;
  }
  v97 = [v14 objectAtIndexedSubscript:0];
  int v98 = [v97 isEqualToString:@"defrag"];

  if (v98)
  {
    if ((unint64_t)v15 <= 1)
    {
      [(SPCoreSpotlightIndexer *)v451 issueDefrag:0 group:0];
    }
    else
    {
      id v99 = [v14 objectAtIndexedSubscript:1];
      [(SPCoreSpotlightIndexer *)v451 issueDefrag:v99 group:0];
    }
    goto LABEL_88;
  }
  BOOL v100 = [v14 objectAtIndexedSubscript:0];
  int v101 = [v100 isEqualToString:@"reverse"];

  if (v101)
  {
    [(SPCoreSpotlightIndexer *)v451 issueDumpReverse:0 completionHandler:v11];

    goto LABEL_443;
  }
  v103 = [v14 objectAtIndexedSubscript:0];
  int v104 = [v103 isEqualToString:@"reverseTree"];

  if (v104)
  {
    [(SPCoreSpotlightIndexer *)v451 issueDumpReverse:1 completionHandler:v11];

    goto LABEL_443;
  }
  id v105 = [v14 objectAtIndexedSubscript:0];
  int v106 = [v105 isEqualToString:@"forward"];

  if (v106)
  {
    [(SPCoreSpotlightIndexer *)v451 issueDumpForward:0 completionHandler:v11];

    goto LABEL_443;
  }
  id v107 = [v14 objectAtIndexedSubscript:0];
  int v108 = [v107 isEqualToString:@"pathfixup"];

  if (v108)
  {
    if ((unint64_t)v15 < 2)
    {
      v109 = 0;
    }
    else
    {
      v109 = [v14 objectAtIndexedSubscript:1];
    }
    if (v109) {
      id v115 = v109;
    }
    else {
      id v115 = (void *)*MEMORY[0x263F08098];
    }
    [(SPCoreSpotlightIndexer *)v451 issuePathFixup:v115];

    goto LABEL_88;
  }
  uint64_t v110 = [v14 objectAtIndexedSubscript:0];
  int v111 = [v110 isEqualToString:@"resolveFP"];

  if (v111)
  {
    if ((unint64_t)v15 >= 4)
    {
      v112 = [v14 objectAtIndexedSubscript:1];
      v113 = [v14 objectAtIndexedSubscript:2];
      id v114 = [v14 objectAtIndexedSubscript:3];
      [(SPCoreSpotlightIndexer *)v451 issueResolveFPItemForBundle:v112 domain:v113 identifier:v114 completionHandler:v11];

      goto LABEL_443;
    }
    goto LABEL_88;
  }
  v116 = [v14 objectAtIndexedSubscript:0];
  int v117 = [v116 isEqualToString:@"resolveFPURL"];

  if (v117)
  {
    if ((unint64_t)v15 < 2) {
      goto LABEL_88;
    }
    v118 = objc_msgSend(v14, "subarrayWithRange:", 1, v15 - 1);
    v96 = [v118 componentsJoinedByString:@":"];

    if (v96)
    {
      v119 = [NSURL URLWithString:v96];
      if (v119)
      {
        [(SPCoreSpotlightIndexer *)v451 issueResolveFPItemForURL:v119 completionHandler:v11];

        id v11 = 0;
      }
    }
    goto LABEL_172;
  }
  v120 = [v14 objectAtIndexedSubscript:0];
  int v121 = [v120 isEqualToString:@"testSuspendUntilUnlocked"];

  if (v121)
  {
    long long v122 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v122, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilUnlocked started", buf, 2u);
    }

    long long v123 = dispatch_get_global_queue(21, 2uLL);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2374;
    block[3] = &unk_264506548;
    id v526 = v11;
    dispatch_async(v123, block);

    goto LABEL_443;
  }
  long long v124 = [v14 objectAtIndexedSubscript:0];
  int v125 = [v124 isEqualToString:@"testSuspendUntilLocked"];

  if (v125)
  {
    v126 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v126, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilLocked started", buf, 2u);
    }

    id v127 = dispatch_get_global_queue(21, 2uLL);
    v523[0] = MEMORY[0x263EF8330];
    v523[1] = 3221225472;
    v523[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2378;
    v523[3] = &unk_264506548;
    id v524 = v11;
    dispatch_async(v127, v523);

    goto LABEL_443;
  }
  v128 = [v14 objectAtIndexedSubscript:0];
  int v129 = [v128 isEqualToString:@"messages_fixup"];

  if (v129)
  {
    v130 = (void *)MEMORY[0x223C48320](v11);

    v521[0] = MEMORY[0x263EF8330];
    v521[1] = 3221225472;
    v521[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2382;
    v521[3] = &unk_264507280;
    id v522 = v130;
    id v131 = v130;
    [(SPCoreSpotlightIndexer *)v451 issueMessagesFixup:v521];

    goto LABEL_443;
  }
  v132 = [v14 objectAtIndexedSubscript:0];
  int v133 = [v132 isEqualToString:@"check"];

  if (v133)
  {
    if ((unint64_t)v15 <= 1)
    {
      [(SPCoreSpotlightIndexer *)v451 issueConsistencyCheck:0];
    }
    else
    {
      v134 = [v14 objectAtIndexedSubscript:1];
      [(SPCoreSpotlightIndexer *)v451 issueConsistencyCheck:v134];
    }
    goto LABEL_88;
  }
  v135 = [v14 objectAtIndexedSubscript:0];
  int v136 = [v135 isEqualToString:@"duplicates"];

  if (v136)
  {
    if ((unint64_t)v15 <= 1)
    {
      [(SPCoreSpotlightIndexer *)v451 issueDuplicateOidCheck:0];
    }
    else
    {
      v137 = [v14 objectAtIndexedSubscript:1];
      [(SPCoreSpotlightIndexer *)v451 issueDuplicateOidCheck:v137];
    }
    goto LABEL_88;
  }
  v138 = [v14 objectAtIndexedSubscript:0];
  int v139 = [v138 isEqualToString:@"exception"];

  if (v139)
  {
    v140 = (void *)MEMORY[0x263EFF940];
    v96 = [v14 objectAtIndexedSubscript:0];
    if ((unint64_t)v15 <= 1)
    {
      [v140 raise:v96, @"%@", &stru_26D0BD940 format];
    }
    else
    {
      v141 = [v14 objectAtIndexedSubscript:1];
      [v140 raise:v96, @"%@", v141 format];
    }
    goto LABEL_172;
  }
  v142 = [v14 objectAtIndexedSubscript:0];
  int v143 = [v142 isEqualToString:@"trace"];

  if (v143)
  {
    if ((unint64_t)v15 >= 2
      && ([v14 objectAtIndexedSubscript:1],
          v144 = objc_claimAutoreleasedReturnValue(),
          int v145 = [v144 intValue],
          v144,
          v145))
    {
      v146 = SDTraceDescription(v145);
    }
    else
    {
      v146 = objc_opt_new();
      for (uint64_t i = 0; i != 4; ++i)
      {
        v149 = SDTraceDescription(i);
        if ([v149 length])
        {
          [v146 appendString:v149];
          [v146 appendString:@"\n"];
        }
      }
    }
    if (v11 && [v146 length])
    {
      v150 = [v146 dataUsingEncoding:4];
      (*((void (**)(id, void *, void))v11 + 2))(v11, v150, 0);

      id v11 = 0;
    }
    goto LABEL_336;
  }
  v147 = [v14 objectAtIndexedSubscript:0];
  if ([v147 isEqualToString:@"diagnose"])
  {

LABEL_184:
    v153 = [v14 objectAtIndexedSubscript:0];
    uint64_t v154 = [v153 isEqualToString:@"diagnose_logq"];

    [(id)sDelegate dumpTTRDebugFiles];
    if ((unint64_t)v15 < 2)
    {
      v430 = 0;
      v431 = 0;
    }
    else
    {
      v430 = [v14 objectAtIndexedSubscript:1];
      if (v15 == (char *)2)
      {
        v431 = 0;
      }
      else
      {
        v431 = [v14 objectAtIndexedSubscript:2];
      }
    }
    v442 = objc_opt_new();
    obuint64_t j = [MEMORY[0x263EFF910] date];
    dispatch_group_t group = (dispatch_group_t)objc_alloc_init(MEMORY[0x263F08790]);
    [group setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    v439 = [group stringFromDate:obj];
    v446 = SPLogDirectory();
    v160 = [MEMORY[0x263F08850] defaultManager];
    char v161 = [v160 fileExistsAtPath:v446];

    if ((v161 & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          v162 = objc_claimAutoreleasedReturnValue(),
          id v520 = 0,
          [v162 createDirectoryAtPath:v446 withIntermediateDirectories:1 attributes:0 error:&v520], id v433 = v520, v162, !v433))
    {
      id v433 = 0;
    }
    else
    {
      v163 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:]();
      }
    }
    v435 = [@"Spotlight_" stringByAppendingFormat:@"%@.log", v439];
    id v438 = [v446 stringByAppendingPathComponent:v435];
    v164 = (const char *)[v438 fileSystemRepresentation];
    uint64_t v165 = open(v164, 522, 384);
    __error();
    if ((int)v165 < 1)
    {
      v167 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:]();
      }

      v166 = 0;
    }
    else
    {
      v166 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v165 closeOnDealloc:1];
    }
    v168 = [NSString stringWithFormat:@"=== Spotlight Diagnostic (%d) %@\n\n", getpid(), v439];
    v169 = [v168 dataUsingEncoding:4];
    BOOL v170 = [(SPCoreSpotlightIndexer *)v451 writeData:v169 toFile:v166];

    if (v170
      && +[SPCoreSpotlightIndexer writeDiagnostic:v166 bundleID:v430 identifier:v431 logQuery:v154])
    {
      v171 = [@"=== Spotlight Diagnostic End\n" dataUsingEncoding:4];
      char v172 = [(SPCoreSpotlightIndexer *)v451 writeData:v171 toFile:v166];
    }
    else
    {
      char v172 = 0;
    }
    v173 = dispatch_group_create();
    dispatch_group_enter(v173);
    v174 = [MEMORY[0x263F78CE8] sharedProcessor];
    v175 = [NSString stringWithUTF8String:v164];
    v176 = [v175 stringByDeletingLastPathComponent];
    v518[0] = MEMORY[0x263EF8330];
    v518[1] = 3221225472;
    v518[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2402;
    v518[3] = &unk_264506B90;
    v177 = v173;
    v519 = v177;
    [v174 collectDiagnostics:v176 completion:v518];

    dispatch_time_t v178 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v177, v178);
    if (v164) {
      char v179 = v172;
    }
    else {
      char v179 = 1;
    }
    if ((v179 & 1) == 0)
    {
      v180 = [MEMORY[0x263F08850] defaultManager];
      v181 = [NSString stringWithUTF8String:v164];
      [v180 removeItemAtPath:v181 error:0];
    }
    [v166 closeFile];
    [v442 addObject:v438];
    if ([v442 count])
    {
      v182 = [MEMORY[0x263F08AC0] dataWithPropertyList:v442 format:200 options:0 error:0];
    }
    else
    {
      v182 = 0;
    }
    if (v11)
    {
      (*((void (**)(id, void *, void))v11 + 2))(v11, v182, 0);
    }
    goto LABEL_443;
  }
  v151 = [v14 objectAtIndexedSubscript:0];
  int v152 = [v151 isEqualToString:@"diagnose_logq"];

  if (v152) {
    goto LABEL_184;
  }
  v155 = [v14 objectAtIndexedSubscript:0];
  int v156 = [v155 isEqualToString:@"clientstate"];

  if (v156)
  {
    if ((unint64_t)v15 >= 3)
    {
      v157 = [v14 objectAtIndexedSubscript:1];
      v158 = [v14 objectAtIndexedSubscript:2];
      if (v15 == (char *)3)
      {
        v159 = 0;
      }
      else
      {
        v159 = [v14 objectAtIndexedSubscript:3];
      }
      v514[0] = MEMORY[0x263EF8330];
      v514[1] = 3221225472;
      v514[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2406;
      v514[3] = &unk_264508C18;
      id v515 = v157;
      id v516 = v158;
      id v517 = v11;
      id v188 = v158;
      id v189 = v157;
      [(SPCoreSpotlightIndexer *)v451 fetchLastClientStateWithProtectionClass:v159 forBundleID:v189 clientStateName:v188 options:0 completionHandler:v514];

      goto LABEL_443;
    }
    goto LABEL_88;
  }
  v183 = [v14 objectAtIndexedSubscript:0];
  int v184 = [v183 isEqualToString:@"applications"];

  if (v184)
  {
    notify_post("com.apple.searchd.applications.changed");
    goto LABEL_88;
  }
  v185 = [v14 objectAtIndexedSubscript:0];
  int v186 = [v185 isEqualToString:@"ranking"];

  if (v186)
  {
    if ((unint64_t)v15 < 2)
    {
      v187 = 0;
    }
    else
    {
      v187 = [v14 objectAtIndexedSubscript:1];
    }
    v512[0] = MEMORY[0x263EF8330];
    v512[1] = 3221225472;
    v512[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2414;
    v512[3] = &unk_264506548;
    id v513 = v11;
    [(SPCoreSpotlightIndexer *)v451 handleRankingCommand:v187 completion:v512];
    if ((unint64_t)v15 > 1) {

    }
    goto LABEL_443;
  }
  v190 = [v14 objectAtIndexedSubscript:0];
  int v191 = [v190 isEqualToString:@"query_spotlight"];

  if (v191
    || ([v14 objectAtIndexedSubscript:0],
        v192 = objc_claimAutoreleasedReturnValue(),
        int v193 = [v192 isEqualToString:@"query_pommes"],
        v192,
        v193))
  {
    _SISetQueryBehavior();
    goto LABEL_88;
  }
  v194 = [v14 objectAtIndexedSubscript:0];
  int v195 = [v194 isEqualToString:@"reindexJob"];

  if (!v195)
  {
    v200 = [v14 objectAtIndexedSubscript:0];
    int v201 = [v200 isEqualToString:@"job"];

    if (v201)
    {
      if (v15 != (char *)6) {
        goto LABEL_437;
      }
      v448 = [v14 objectAtIndexedSubscript:1];
      v202 = [v14 objectAtIndexedSubscript:2];
      v203 = [v202 componentsSeparatedByString:@","];

      v204 = [v14 objectAtIndexedSubscript:3];
      uint64_t v205 = [v204 integerValue];

      v206 = [v14 objectAtIndexedSubscript:4];
      uint64_t v207 = [v206 integerValue];

      if ([v448 length])
      {
        v546 = v448;
        v208 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v546 count:1];
      }
      else
      {
        v208 = 0;
      }
      v229 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:v205 jobOptions:v207];
      [v229 setProtectionClasses:v203];
      if (v205 == 1)
      {
        v230 = [v14 objectAtIndexedSubscript:5];
        v231 = [v230 componentsSeparatedByString:@","];
        [v229 setIdentifiersToReindex:v231];
      }
      [v229 setReason:@"client reindex request"];
      v232 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
      if (![v203 count])
      {
        uint64_t v233 = [(id)objc_opt_class() allProtectionClasses];

        v203 = (void *)v233;
      }
      v506[0] = MEMORY[0x263EF8330];
      v506[1] = 3221225472;
      v506[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3;
      v506[3] = &unk_2645085C0;
      id v507 = v232;
      id v234 = v232;
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithProtectionClasses:v203 inferPriorityIndex:0 block:v506];
      v235 = [[SPCoreSpotlightIndexerTask alloc] initWithIndexJob:v229 indexers:v234];
      [(SPCoreSpotlightIndexerTask *)v235 setBundleIDs:v208];
      [(SPCoreSpotlightIndexerTask *)v235 setDataMigrationStage:[(SPCoreSpotlightIndexer *)v451 dataMigrationStage]];
      v504[0] = MEMORY[0x263EF8330];
      v504[1] = 3221225472;
      v504[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4;
      v504[3] = &unk_264506548;
      id v505 = v11;
      [(SPCoreSpotlightIndexer *)v451 performIndexerTask:v235 completionHandler:v504];

      goto LABEL_443;
    }
    v209 = [v14 objectAtIndexedSubscript:0];
    int v210 = [v209 isEqualToString:@"log"];

    if (v210)
    {
      if (v15 != (char *)3) {
        goto LABEL_88;
      }
      v211 = [v14 objectAtIndexedSubscript:1];
      v146 = [v211 lowercaseString];

      if (([v146 isEqualToString:@"general"] & 1) != 0
        || ([v146 isEqualToString:@"query"] & 1) != 0
        || ([v146 isEqualToString:@"livequery"] & 1) != 0
        || ([v146 isEqualToString:@"scheduler"] & 1) != 0
        || ([v146 isEqualToString:@"store"] & 1) != 0
        || ([v146 isEqualToString:@"fetch"] & 1) != 0
        || ([v146 isEqualToString:@"path"] & 1) != 0
        || ([v146 isEqualToString:@"sdb"] & 1) != 0
        || ([v146 isEqualToString:@"docstore"] & 1) != 0
        || ([v146 isEqualToString:@"ci"] & 1) != 0
        || ([v146 isEqualToString:@"state"] & 1) != 0
        || ([v146 isEqualToString:@"power"] & 1) != 0
        || ([v146 isEqualToString:@"qos"] & 1) != 0
        || [v146 isEqualToString:@"completions"])
      {
        v271 = [v14 objectAtIndexedSubscript:2];
        v272 = [v271 lowercaseString];

        if (([v272 isEqualToString:@"debug"] & 1) != 0
          || ([v272 isEqualToString:@"info"] & 1) != 0
          || ([v272 isEqualToString:@"warning"] & 1) != 0
          || ([v272 isEqualToString:@"error"] & 1) != 0
          || ([v272 isEqualToString:@"fatal"] & 1) != 0
          || ([v272 isEqualToString:@"none"] & 1) != 0
          || ([v272 isEqualToString:@"ignore"] & 1) != 0
          || ([v272 isEqualToString:@"normal"] & 1) != 0
          || [v272 isEqualToString:@"temporary"])
        {
          SISetLogging();
        }
      }
LABEL_336:

      goto LABEL_88;
    }
    v212 = [v14 objectAtIndexedSubscript:0];
    int v213 = [v212 isEqualToString:@"shutdown"];

    if (v213)
    {
      if (v11)
      {
        (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
      }
      raise(15);
      goto LABEL_443;
    }
    v222 = [v14 objectAtIndexedSubscript:0];
    int v223 = [v222 isEqualToString:@"shrink"];

    if (v223)
    {
      if ((unint64_t)v15 < 2)
      {
        uint64_t v228 = 2;
      }
      else
      {
        v224 = (void *)MEMORY[0x263F087B0];
        v225 = [v14 objectAtIndexedSubscript:1];
        v226 = [v224 decimalNumberWithString:v225];
        uint64_t v227 = [v226 longValue];

        if (v227 <= 0) {
          uint64_t v228 = 2;
        }
        else {
          uint64_t v228 = v227;
        }
      }
      [(id)objc_opt_class() shrink:v228];
      goto LABEL_88;
    }
    v236 = [v14 objectAtIndexedSubscript:0];
    int v237 = [v236 isEqualToString:@"migrate"];

    if (v237)
    {
      if ((unint64_t)v15 < 2)
      {
        uint64_t v239 = 0;
      }
      else
      {
        v238 = [v14 objectAtIndexedSubscript:1];
        uint64_t v239 = [v238 isEqualToString:@"forced"];
      }
      [(SPCoreSpotlightIndexer *)v451 migrateForced:v239];
      goto LABEL_88;
    }
    v240 = [v14 objectAtIndexedSubscript:0];
    int v241 = [v240 isEqualToString:@"reindexAllItems"];

    if (v241)
    {
      v242 = [(SPCoreSpotlightIndexer *)v451 reindexAllItemsSource];
      dispatch_source_merge_data(v242, 1uLL);

      goto LABEL_88;
    }
    v243 = [v14 objectAtIndexedSubscript:0];
    int v244 = [v243 isEqualToString:@"reindexAllItemsWithIdentifiers"];

    if (v244)
    {
      v245 = [(SPCoreSpotlightIndexer *)v451 reindexAllItemsWithIdentifiersSource];
      dispatch_source_merge_data(v245, 1uLL);

      goto LABEL_88;
    }
    v246 = [v14 objectAtIndexedSubscript:0];
    int v247 = [v246 isEqualToString:@"deleteAllInteractionsWithBundleID"];

    if (v247)
    {
      if ((unint64_t)v15 >= 2)
      {
        v248 = [v14 objectAtIndexedSubscript:1];
        v502[0] = MEMORY[0x263EF8330];
        v502[1] = 3221225472;
        v502[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5;
        v502[3] = &unk_264507280;
        id v503 = v11;
        [(SPCoreSpotlightIndexer *)v451 deleteAllInteractionsWithBundleID:v248 completionHandler:v502];

        goto LABEL_443;
      }
      goto LABEL_88;
    }
    v249 = [v14 objectAtIndexedSubscript:0];
    int v250 = [v249 isEqualToString:@"deleteActions"];

    if (v250)
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v252 = v251;
      if ((unint64_t)v15 >= 2)
      {
        v253 = [v14 objectAtIndexedSubscript:1];
        [v253 doubleValue];
        double v252 = v254;
      }
      v500[0] = MEMORY[0x263EF8330];
      v500[1] = 3221225472;
      v500[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6;
      v500[3] = &unk_264507280;
      id v501 = v11;
      [(SPCoreSpotlightIndexer *)v451 deleteActionsBeforeTime:v500 completionHandler:v252];

      goto LABEL_443;
    }
    v255 = [v14 objectAtIndexedSubscript:0];
    int v256 = [v255 isEqualToString:@"deleteActionsWithIdentifiers"];

    if (v256)
    {
      if ((unint64_t)v15 >= 2)
      {
        v257 = objc_msgSend(v14, "subarrayWithRange:", 1, v15 - 1);
        v498[0] = MEMORY[0x263EF8330];
        v498[1] = 3221225472;
        v498[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_7;
        v498[3] = &unk_264507280;
        id v499 = v11;
        [(SPCoreSpotlightIndexer *)v451 deleteActionsWithIdentifiers:v257 completionHandler:v498];

        goto LABEL_443;
      }
      goto LABEL_88;
    }
    v258 = [v14 objectAtIndexedSubscript:0];
    int v259 = [v258 isEqualToString:@"enableJournal"];

    if (v259)
    {
      [MEMORY[0x263F02B30] setJournalEnabled:1];
      goto LABEL_88;
    }
    v260 = [v14 objectAtIndexedSubscript:0];
    int v261 = [v260 isEqualToString:@"disableJournal"];

    if (v261)
    {
      [MEMORY[0x263F02B30] setJournalEnabled:0];
      goto LABEL_88;
    }
    v262 = [v14 objectAtIndexedSubscript:0];
    int v263 = [v262 isEqualToString:@"topTerms"];

    if (v263)
    {
      if ((unint64_t)v15 >= 2)
      {
        v264 = [v14 objectAtIndexedSubscript:1];
        [(SPCoreSpotlightIndexer *)v451 topKTerms:v264 completionHandler:v11];

        goto LABEL_443;
      }
      goto LABEL_437;
    }
    v265 = [v14 objectAtIndexedSubscript:0];
    int v266 = [v265 isEqualToString:@"updateRankingDates"];

    if (v266)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2546];
      goto LABEL_88;
    }
    v267 = [v14 objectAtIndexedSubscript:0];
    int v268 = [v267 isEqualToString:@"updateEmailLocalParts"];

    if (v268)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2551];
      goto LABEL_88;
    }
    v269 = [v14 objectAtIndexedSubscript:0];
    int v270 = [v269 isEqualToString:@"updateEmailContentURLAttr"];

    if (v270)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2556];
      goto LABEL_88;
    }
    v273 = [v14 objectAtIndexedSubscript:0];
    int v274 = [v273 isEqualToString:@"updateContainersAndScores"];

    if (v274)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2561];
      goto LABEL_88;
    }
    v275 = [v14 objectAtIndexedSubscript:0];
    int v276 = [v275 isEqualToString:@"updateGroups"];

    if (v276)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2566];
      goto LABEL_88;
    }
    v277 = [v14 objectAtIndexedSubscript:0];
    int v278 = [v277 isEqualToString:@"updateNotes"];

    if (v278)
    {
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:&__block_literal_global_2571];
      goto LABEL_88;
    }
    v279 = [v14 objectAtIndexedSubscript:0];
    int v280 = [v279 isEqualToString:@"clearReceiverCache"];

    if (v280)
    {
      +[SpotlightSender clearCache];
      goto LABEL_88;
    }
    v281 = [v14 objectAtIndexedSubscript:0];
    int v282 = [v281 isEqualToString:@"setNumberProperty"];

    if (v282)
    {
      v283 = [v14 objectAtIndexedSubscript:1];
      v284 = [v14 objectAtIndexedSubscript:2];
      id v285 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v285 setNumberStyle:1];
      v286 = [v285 numberFromString:v284];
      v495[0] = MEMORY[0x263EF8330];
      v495[1] = 3221225472;
      v495[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_14;
      v495[3] = &unk_264508688;
      id v496 = v286;
      id v497 = v283;
      id v287 = v283;
      id v288 = v286;
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:v495];

      goto LABEL_88;
    }
    v289 = [v14 objectAtIndexedSubscript:0];
    int v290 = [v289 isEqualToString:@"setUISearchEnabled"];

    if (v290)
    {
      v291 = [v14 objectAtIndexedSubscript:1];
      id v292 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v292 setNumberStyle:1];
      v293 = [v292 numberFromString:v291];
      v493[0] = MEMORY[0x263EF8330];
      v493[1] = 3221225472;
      v493[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_15;
      v493[3] = &unk_2645085C0;
      id v494 = v293;
      id v294 = v293;
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:v493];
      v295 = -[SPCoreSpotlightIndexer writeUISearchEnabled:](v451, "writeUISearchEnabled:", [v294 BOOLValue]);
      LOBYTE(v21) = v295 == 0;

      goto LABEL_438;
    }
    v296 = [v14 objectAtIndexedSubscript:0];
    int v297 = [v296 isEqualToString:@"getProperty"];

    if (v297)
    {
      v298 = [v14 objectAtIndexedSubscript:1];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v543 = __Block_byref_object_copy_;
      v544 = __Block_byref_object_dispose_;
      v545 = &stru_26D0BD940;
      v490[0] = MEMORY[0x263EF8330];
      v490[1] = 3221225472;
      v490[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_16;
      v490[3] = &unk_264508C40;
      v492 = buf;
      id v299 = v298;
      id v491 = v299;
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:v490];
      if (v11)
      {
        v300 = [*(id *)(*(void *)&buf[8] + 40) dataUsingEncoding:4];
        (*((void (**)(id, void *, void))v11 + 2))(v11, v300, 0);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_443;
    }
    v301 = [v14 objectAtIndexedSubscript:0];
    int v302 = [v301 isEqualToString:@"priorityIndexFixupOn"];

    if (v302)
    {
      v303 = [(SPCoreSpotlightIndexer *)v451 priorityIndexer];
      [v303 issuePriorityIndexFixupOn];

      goto LABEL_88;
    }
    v304 = [v14 objectAtIndexedSubscript:0];
    int v305 = [v304 isEqualToString:@"reindexMultiple"];

    if (v305)
    {
      v306 = objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
      v488[0] = MEMORY[0x263EF8330];
      v488[1] = 3221225472;
      v488[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_17;
      v488[3] = &unk_264506548;
      id v489 = v11;
      [(SPCoreSpotlightIndexer *)v451 _reindexAllItemsForBundleIDs:v306 reason:@"issue-command" completionHandler:v488];

      goto LABEL_443;
    }
    v307 = [v14 objectAtIndexedSubscript:0];
    if ([v307 isEqualToString:@"testBundleDelete"])
    {

LABEL_360:
      v444 = [v14 objectAtIndexedSubscript:0];
      [v444 hasSuffix:@"NoClear"];
      v449 = objc_opt_new();
      v434 = objc_opt_new();
      extractBundlesAndProtectionClasses(v14, v449, v434);
      if ([v449 count])
      {
        if (![v434 count]) {
          [v434 addObject:*MEMORY[0x263F08098]];
        }
        groupa = dispatch_group_create();
        v432 = (void *)MEMORY[0x223C48320](v11);

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        LODWORD(v543) = 0;
        long long v484 = 0u;
        long long v485 = 0u;
        long long v486 = 0u;
        long long v487 = 0u;
        id obja = v434;
        uint64_t v310 = [obja countByEnumeratingWithState:&v484 objects:v541 count:16];
        if (v310)
        {
          uint64_t v311 = *(void *)v485;
          do
          {
            for (uint64_t j = 0; j != v310; ++j)
            {
              if (*(void *)v485 != v311) {
                objc_enumerationMutation(obja);
              }
              uint64_t v313 = *(void *)(*((void *)&v484 + 1) + 8 * j);
              v314 = [(SPCoreSpotlightIndexer *)v451 concreteIndexers];
              v315 = [v314 objectForKeyedSubscript:v313];

              if ([v315 index])
              {
                v316 = logForCSLogCategoryIndex();
                if (os_log_type_enabled(v316, OS_LOG_TYPE_DEFAULT))
                {
                  v317 = [v315 dataclass];
                  *(_DWORD *)v535 = 138412802;
                  v536 = v444;
                  __int16 v537 = 2112;
                  v538 = v317;
                  __int16 v539 = 2112;
                  v540 = v449;
                  _os_log_impl(&dword_21F1CE000, v316, OS_LOG_TYPE_DEFAULT, "### %@ %@ %@", v535, 0x20u);
                }
                dispatch_group_enter(groupa);
                uint64_t v477 = MEMORY[0x263EF8330];
                uint64_t v478 = 3221225472;
                v479 = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2606;
                v480 = &unk_264508C68;
                id v481 = v444;
                v483 = buf;
                v482 = groupa;
                _SIDeleteBundles();
              }
            }
            uint64_t v310 = [obja countByEnumeratingWithState:&v484 objects:v541 count:16];
          }
          while (v310);
        }

        v318 = sIndexQueue;
        v474[0] = MEMORY[0x263EF8330];
        v474[1] = 3221225472;
        v474[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2607;
        v474[3] = &unk_264508C90;
        v476 = buf;
        id v319 = v432;
        id v475 = v319;
        v320 = _setup_block(v474, 0, 17291);
        dispatch_group_notify(groupa, v318, v320);

        _Block_object_dispose(buf, 8);
        id v11 = 0;
      }

      goto LABEL_88;
    }
    v308 = [v14 objectAtIndexedSubscript:0];
    int v309 = [v308 isEqualToString:@"testBundleDeleteNoClear"];

    if (v309) {
      goto LABEL_360;
    }
    v321 = [v14 objectAtIndexedSubscript:0];
    if ([v321 isEqualToString:@"testTransfer"])
    {

LABEL_379:
      v450 = [v14 objectAtIndexedSubscript:0];
      [v450 hasSuffix:@"NoClear"];
      v324 = objc_opt_new();
      v325 = objc_opt_new();
      extractBundlesAndProtectionClasses(v14, v324, v325);
      unint64_t v326 = [v325 count];
      if (![v325 count])
      {
        [v325 addObject:*MEMORY[0x263F08098]];
        [v325 addObject:@"Priority"];
        unint64_t v326 = [v325 count];
      }
      if (v326 - 1 <= 1)
      {
        v327 = [(SPCoreSpotlightIndexer *)v451 concreteIndexers];
        v328 = [v325 firstObject];
        v329 = [v327 objectForKey:v328];
        uint64_t v445 = [v329 index];

        if (v445)
        {
          if (v326 >= 2)
          {
            v330 = [(SPCoreSpotlightIndexer *)v451 concreteIndexers];
            v331 = [v325 objectAtIndexedSubscript:1];
            v332 = [v330 objectForKey:v331];
            [v332 index];
          }
          if (![v324 count])
          {
            v341 = [(id)sPriorityBundleIds allObjects];
            [v324 addObjectsFromArray:v341];
          }
          v342 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v342, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v450;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v325;
            *(_WORD *)&buf[22] = 2112;
            v543 = (uint64_t (*)(uint64_t, uint64_t))v324;
            _os_log_impl(&dword_21F1CE000, v342, OS_LOG_TYPE_DEFAULT, "### %@ %@ %@", buf, 0x20u);
          }

          uint64_t v468 = MEMORY[0x263EF8330];
          uint64_t v469 = 3221225472;
          v470 = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2614;
          v471 = &unk_264508CB8;
          id v472 = v450;
          id v473 = v11;
          _SITransferBundles();

          id v11 = 0;
        }
      }

      goto LABEL_88;
    }
    v322 = [v14 objectAtIndexedSubscript:0];
    int v323 = [v322 isEqualToString:@"testTransferNoClear"];

    if (v323) {
      goto LABEL_379;
    }
    v333 = [v14 objectAtIndexedSubscript:0];
    int v334 = [v333 isEqualToString:@"priorityReset"];

    if (v334)
    {
      v335 = [(SPCoreSpotlightIndexer *)v451 priorityIndexer];
      v336 = [(SPCoreSpotlightIndexer *)v451 defaultIndexer];
      uint64_t v337 = [v335 index];
      uint64_t v338 = [v336 index];
      if (v337 && v338)
      {
        v339 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v339, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F1CE000, v339, OS_LOG_TYPE_DEFAULT, "### priorityReset", buf, 2u);
        }

        v340 = [(id)sPriorityBundleIds allObjects];
        v463[5] = MEMORY[0x263EF8330];
        v463[6] = 3221225472;
        v463[7] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2618;
        v463[8] = &unk_264508D08;
        id v467 = v11;
        id v464 = v336;
        v465 = v451;
        id v466 = v335;
        _SITransferBundles();

        id v11 = 0;
      }

      goto LABEL_88;
    }
    v343 = [v14 objectAtIndexedSubscript:0];
    int v344 = [v343 isEqualToString:@"suspend"];

    if (v344)
    {
      indexQueue = v451->_indexQueue;
      v463[0] = MEMORY[0x263EF8330];
      v463[1] = 3221225472;
      v463[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2623;
      v463[3] = &unk_2645063F8;
      v463[4] = v451;
      v346 = v463;
LABEL_402:
      dispatch_sync(indexQueue, v346);
      goto LABEL_88;
    }
    v347 = [v14 objectAtIndexedSubscript:0];
    int v348 = [v347 isEqualToString:@"resume"];

    if (v348)
    {
      indexQueue = v451->_indexQueue;
      v462[0] = MEMORY[0x263EF8330];
      v462[1] = 3221225472;
      v462[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2627;
      v462[3] = &unk_2645063F8;
      v462[4] = v451;
      v346 = v462;
      goto LABEL_402;
    }
    v349 = [v14 objectAtIndexedSubscript:0];
    int v350 = [v349 isEqualToString:@"setLowDisk"];

    if (v350)
    {
      LOBYTE(v21) = 1;
      if ((sVeryLowDiskSpace & 1) == 0)
      {
        sVeryLowDiskSpace = 1;
        [(SPCoreSpotlightIndexer *)v451 recycleAndPurgeIndex];
      }
      goto LABEL_438;
    }
    v351 = [v14 objectAtIndexedSubscript:0];
    int v352 = [v351 isEqualToString:@"setNormalDisk"];

    if (v352)
    {
      if (sVeryLowDiskSpace == 1)
      {
        sVeryLowDiskSpace = 0;
        [(SPCoreSpotlightIndexer *)v451 restoreIndexAndClearPurgeable];
      }
      goto LABEL_88;
    }
    v353 = [v14 objectAtIndexedSubscript:0];
    int v354 = [v353 isEqualToString:@"isLowDisk"];

    if (v354)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v543 = __Block_byref_object_copy_;
      v544 = __Block_byref_object_dispose_;
      v545 = 0;
      if (sVeryLowDiskSpace) {
        v355 = @"YES\n";
      }
      else {
        v355 = @"NO\n";
      }
      [@"sVeryLowDiskSpace = " stringByAppendingString:v355];
      v545 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v461[0] = MEMORY[0x263EF8330];
      v461[1] = 3221225472;
      v461[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2646;
      v461[3] = &unk_264508A10;
      v461[4] = buf;
      [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithBlock:v461];
      if (v11)
      {
        v356 = [*(id *)(*(void *)&buf[8] + 40) dataUsingEncoding:4];
        (*((void (**)(id, void *, void))v11 + 2))(v11, v356, 0);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_443;
    }
    v357 = [v14 objectAtIndexedSubscript:0];
    int v358 = [v357 isEqualToString:@"validateIndexers"];

    if (v358)
    {
      if ((unint64_t)v15 < 2)
      {
        v365 = 0;
LABEL_473:
        [(SPCoreSpotlightIndexer *)v451 validateIndexers:v365 outFileDescriptor:v8];
        (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);

        goto LABEL_443;
      }
      v359 = [v14 objectAtIndexedSubscript:1];
      if ([v359 isEqualToString:@"P"])
      {
        uint64_t v360 = [MEMORY[0x263EFF8C0] arrayWithObject:@"Priority"];
      }
      else if ([v359 isEqualToString:@"A"])
      {
        uint64_t v360 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08080]];
      }
      else if ([v359 isEqualToString:@"B"])
      {
        uint64_t v360 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08088]];
      }
      else if ([v359 isEqualToString:@"C"])
      {
        uint64_t v360 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08098]];
      }
      else
      {
        if (![v359 isEqualToString:@"X"])
        {
          v365 = 0;
          goto LABEL_472;
        }
        uint64_t v360 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F080A0]];
      }
      v365 = (void *)v360;
LABEL_472:

      goto LABEL_473;
    }
    v361 = [v14 objectAtIndexedSubscript:0];
    int v362 = [v361 isEqualToString:@"validateVectors"];

    if (!v362)
    {
      v366 = [v14 objectAtIndexedSubscript:0];
      int v367 = [v366 isEqualToString:@"prepareIndexingWhileLocked"];

      if (v367)
      {
        if ((unint64_t)v15 >= 4)
        {
          v368 = [v14 objectAtIndexedSubscript:1];
          v369 = [v14 objectAtIndexedSubscript:2];
          v370 = [v14 objectAtIndexedSubscript:3];
          [v370 doubleValue];
          double v372 = v371;

          v459[0] = MEMORY[0x263EF8330];
          v459[1] = 3221225472;
          v459[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2665;
          v459[3] = &unk_264507280;
          id v460 = v11;
          [(SPCoreSpotlightIndexer *)v451 prepareIndexingWhileLocked:v368 protectionClass:v369 holdAssertionFor:v459 completionHandler:v372];

          goto LABEL_443;
        }
        goto LABEL_437;
      }
      v374 = [v14 objectAtIndexedSubscript:0];
      int v375 = [v374 isEqualToString:@"finishIndexingWhileLocked"];

      if (v375)
      {
        if ((unint64_t)v15 >= 3)
        {
          v385 = [v14 objectAtIndexedSubscript:1];
          v386 = [v14 objectAtIndexedSubscript:2];
          v457[0] = MEMORY[0x263EF8330];
          v457[1] = 3221225472;
          v457[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3_2669;
          v457[3] = &unk_264507280;
          id v458 = v11;
          [(SPCoreSpotlightIndexer *)v451 finishIndexingWhileLocked:v385 protectionClass:v386 completionHandler:v457];

          goto LABEL_443;
        }
        goto LABEL_437;
      }
      v377 = [v14 objectAtIndexedSubscript:0];
      int v378 = [v377 isEqualToString:@"assets"];

      if (v378)
      {
        v379 = [MEMORY[0x263F78D00] sharedResourcesManager];
        v380 = [v379 allLoadedAssets];

        if ((unint64_t)v15 < 2)
        {
          int v383 = 0;
          int v384 = 0;
        }
        else
        {
          v381 = [v14 objectAtIndexedSubscript:1];
          unsigned int v382 = [v381 integerValue];

          int v383 = v382 & 1;
          int v384 = (v382 >> 1) & 1;
        }
        v397 = [MEMORY[0x263F089D8] stringWithFormat:@"%@\n", v380];
        if (v383)
        {
          v398 = [MEMORY[0x263F78D00] sharedResourcesManager];
          v399 = [v398 assetConfigDump];
          [v397 appendFormat:@"\n%@", v399];
        }
        if (v384)
        {
          v400 = [MEMORY[0x263F78D00] sharedResourcesManager];
          v401 = [v400 trialConfigDump];
          [v397 appendFormat:@"\n%@", v401];
        }
        v402 = [v397 dataUsingEncoding:4];
        (*((void (**)(id, void *, void))v11 + 2))(v11, v402, 0);
      }
      else
      {
        v387 = [v14 objectAtIndexedSubscript:0];
        int v388 = [v387 isEqualToString:@"factor-override"];

        if (v388)
        {
          v389 = @"override failed";
          if ((unint64_t)v15 >= 5)
          {
            v390 = [v14 objectAtIndexedSubscript:1];
            v391 = [v14 objectAtIndexedSubscript:2];
            v392 = [v14 objectAtIndexedSubscript:3];
            v393 = [v14 objectAtIndexedSubscript:4];
            v394 = [MEMORY[0x263F78D00] sharedResourcesManager];
            int v395 = [v394 overrideFactor:v390 client:v391 type:v392 value:v393];

            if (v395) {
              v389 = @"override success";
            }
          }
          v396 = [(__CFString *)v389 dataUsingEncoding:4];
          (*((void (**)(id, void *, void))v11 + 2))(v11, v396, 0);
        }
        else
        {
          v403 = [v14 objectAtIndexedSubscript:0];
          int v404 = [v403 isEqualToString:@"indexAnalyticsDump"];

          if (v404)
          {
            v405 = NSString;
            v406 = [(SPCoreSpotlightIndexer *)v451 dumpIndexAges];
            v407 = [(SPCoreSpotlightIndexer *)v451 dumpIndexAnalytics];
            v408 = [v405 stringWithFormat:@"%@\n%@", v406, v407];
            v409 = [v408 dataUsingEncoding:4];
            (*((void (**)(id, void *, void))v11 + 2))(v11, v409, 0);

            goto LABEL_443;
          }
          v410 = [v14 objectAtIndexedSubscript:0];
          int v411 = [v410 isEqualToString:@"appContainers"];

          if (!v411)
          {
            v422 = [v14 objectAtIndexedSubscript:0];
            int v21 = [v422 isEqualToString:@"diskUsage"];

            if (v21)
            {
              v423 = objc_opt_new();
              v424 = [(id)sDelegate indexDirectory];
              int v425 = [v423 collectAtPath:v424];

              if (v425)
              {
                v426 = (void *)MEMORY[0x263F08900];
                v427 = [v423 storageUsage];
                id v453 = 0;
                v428 = [v426 dataWithJSONObject:v427 options:0 error:&v453];
                id v429 = v453;
              }
              else
              {
                id v429 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
                v428 = 0;
              }
              (*((void (**)(id, void *, id))v11 + 2))(v11, v428, v429);

              goto LABEL_443;
            }
            goto LABEL_438;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v543 = __Block_byref_object_copy_;
          v544 = __Block_byref_object_dispose_;
          v545 = 0;
          if ((unint64_t)v15 >= 2)
          {
            v412 = [v14 objectAtIndexedSubscript:1];
            int v413 = [v412 isEqualToString:@"refresh"];

            if (v413)
            {
              v414 = [MEMORY[0x263F02A50] sharedInstance];
              v456[0] = MEMORY[0x263EF8330];
              v456[1] = 3221225472;
              v456[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4_2700;
              v456[3] = &unk_264508D30;
              v456[4] = buf;
              [v414 refreshCacheWithCompletionHandler:v456];
            }
          }
          if (!*(void *)(*(void *)&buf[8] + 40))
          {
            v415 = [MEMORY[0x263F02A50] sharedInstance];
            uint64_t v416 = [v415 dumpAppContainerCache];
            v417 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v416;
          }
          v418 = [MEMORY[0x263F089D8] stringWithFormat:@"{\n"];
          v419 = *(void **)(*(void *)&buf[8] + 40);
          v454[0] = MEMORY[0x263EF8330];
          v454[1] = 3221225472;
          v454[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5_2701;
          v454[3] = &unk_264508D58;
          id v420 = v418;
          id v455 = v420;
          [v419 enumerateKeysAndObjectsUsingBlock:v454];
          [v420 appendFormat:@"}\n"];
          v421 = [v420 dataUsingEncoding:4];
          (*((void (**)(id, void *, void))v11 + 2))(v11, v421, 0);

          _Block_object_dispose(buf, 8);
        }
      }
      goto LABEL_443;
    }
    if ((unint64_t)v15 < 2)
    {
      v373 = 0;
LABEL_478:
      [(SPCoreSpotlightIndexer *)v451 validateVectors:v373 outFileDescriptor:v8];
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);

      goto LABEL_443;
    }
    v363 = [v14 objectAtIndexedSubscript:1];
    if ([v363 isEqualToString:@"P"])
    {
      uint64_t v364 = [MEMORY[0x263EFF8C0] arrayWithObject:@"Priority"];
    }
    else if ([v363 isEqualToString:@"A"])
    {
      uint64_t v364 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08080]];
    }
    else if ([v363 isEqualToString:@"B"])
    {
      uint64_t v364 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08088]];
    }
    else if ([v363 isEqualToString:@"C"])
    {
      uint64_t v364 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F08098]];
    }
    else
    {
      if (![v363 isEqualToString:@"X"])
      {
        v373 = 0;
        goto LABEL_477;
      }
      uint64_t v364 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F080A0]];
    }
    v373 = (void *)v364;
LABEL_477:

    goto LABEL_478;
  }
  if (v15 != (char *)5) {
    goto LABEL_437;
  }
  v447 = [v14 objectAtIndexedSubscript:1];
  v196 = [v14 objectAtIndexedSubscript:2];
  v197 = [v196 componentsSeparatedByString:@"=;"];;

  v198 = [v14 objectAtIndexedSubscript:3];
  uint64_t v199 = [v198 integerValue];

  if ([v447 length])
  {
    v547 = v447;
    v443 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v547 count:1];
  }
  else
  {
    v443 = 0;
  }
  v214 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1 jobOptions:v199];
  [v214 setProtectionClasses:v197];
  v215 = [v14 objectAtIndexedSubscript:4];
  v216 = [v215 componentsSeparatedByString:@"=;"];;
  [v214 setIdentifiersToReindex:v216];

  v217 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v447;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v215;
    _os_log_impl(&dword_21F1CE000, v217, OS_LOG_TYPE_INFO, "reindexJob %@: %@", buf, 0x16u);
  }

  v218 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  if (![v197 count])
  {
    uint64_t v219 = [(id)objc_opt_class() allProtectionClasses];

    v197 = (void *)v219;
  }
  v510[0] = MEMORY[0x263EF8330];
  v510[1] = 3221225472;
  v510[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2427;
  v510[3] = &unk_2645085C0;
  id v511 = v218;
  id v220 = v218;
  [(SPCoreSpotlightIndexer *)v451 _enumerateIndexersWithProtectionClasses:v197 inferPriorityIndex:0 block:v510];
  v221 = [[SPCoreSpotlightIndexerTask alloc] initWithIndexJob:v214 indexers:v220];
  [(SPCoreSpotlightIndexerTask *)v221 setBundleIDs:v443];
  [(SPCoreSpotlightIndexerTask *)v221 setDataMigrationStage:[(SPCoreSpotlightIndexer *)v451 dataMigrationStage]];
  v508[0] = MEMORY[0x263EF8330];
  v508[1] = 3221225472;
  v508[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2428;
  v508[3] = &unk_264506548;
  id v509 = v11;
  [(SPCoreSpotlightIndexer *)v451 performIndexerTask:v221 completionHandler:v508];

LABEL_443:
}

- (SPCoreSpotlightInteractionHandler)interactionHandler
{
  return self->_interactionHandler;
}

- (void)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    dispatch_group_t v12 = [(SPCoreSpotlightIndexer *)self interactionHandler];
    [v12 handleInteraction:v8 bundleID:v9 protectionClass:v11];
  }
  else
  {
    dispatch_group_t v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412802;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_debug_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEBUG, "skipping interaction %@ bundle %@ pc %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

+ (void)initialize
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    memset(v11, 0, sizeof(v11));
    id v10 = uuidBytesToString;
    _dyld_images_for_addresses();
    memset(v9, 0, sizeof(v9));
    uuidBytesToString((unsigned __int8 *)v11, v9);
    v2 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "initializing %s", (uint8_t *)&buf, 0xCu);
    }

    dispatch_queue_t v3 = dispatch_queue_create("VFSEventQueue", 0);
    id v4 = (void *)gVFSEventQueue;
    gVFSEventQueue = (uint64_t)v3;

    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8408], 0, 0x304uLL, (dispatch_queue_t)gVFSEventQueue);
    objc_storeStrong((id *)&gVFSEventSource, v5);
    BOOL v6 = gVFSEventSource;
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    int v13 = __initializeDiskSpaceNotificationListener_block_invoke;
    id v14 = &unk_2645063F8;
    dispatch_source_t v15 = v5;
    dispatch_group_t v7 = v5;
    dispatch_source_set_event_handler(v6, &buf);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)handleLowDiskSpace, @"com.apple.Spotlight.lowdiskspace", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    dispatch_resume((dispatch_object_t)gVFSEventSource);

    sIsInternalInstall = os_variant_has_internal_diagnostics();
  }
}

+ (void)preheat
{
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  v2 = (void *)sIndexer;
  [v2 preheat];
}

+ (void)cooldown
{
}

+ (void)sync
{
}

+ (void)deviceStateWillChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v5 = "locked";
    if (v3) {
      dispatch_source_t v5 = "unlocked";
    }
    int v6 = 136315138;
    dispatch_group_t v7 = v5;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "### device state %s", (uint8_t *)&v6, 0xCu);
  }

  if (v3) {
    SIResumeForUnlock();
  }
}

+ (void)shrink:(unint64_t)a3
{
}

+ (void)setMemoryPressureStatus:(unint64_t)a3
{
  s_last_memory_pressure_status = a3;
  _SISetMemoryPressureStatus();
  id v4 = (void *)MEMORY[0x263F02B50];
  [v4 setMemoryPressureStatus:a3];
}

+ (void)deactivate
{
  v2 = [(id)sIndexer extensionDelegate];

  if (v2)
  {
    id v3 = [MEMORY[0x263F02B50] sharedManager];
    [v3 loadExtensions];
  }
}

+ (void)shutdown
{
  v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Shutting down", v4, 2u);
  }

  sShuttingDown = 1;
  [(id)sIndexer shutdown];
  id v3 = (void *)sIndexer;
  sIndexer = 0;
}

void __46__SPCoreSpotlightIndexer_allProtectionClasses__block_invoke()
{
  void v7[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFF980];
  uint64_t v1 = *MEMORY[0x263F080A0];
  v7[0] = *MEMORY[0x263F08098];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F08080];
  v7[2] = *MEMORY[0x263F08088];
  v7[3] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];
  id v4 = [v0 arrayWithArray:v3];

  if (!sPrivate && _os_feature_enabled_impl()) {
    [v4 addObject:@"Priority"];
  }
  uint64_t v5 = [v4 copy];
  int v6 = (void *)allProtectionClasses_sProtectionClasses;
  allProtectionClasses_sProtectionClasses = v5;
}

+ (void)setIndexerDelegate:(id)a3
{
  id v3 = a3;
  if (v3 && sIndexer) {
    +[SPCoreSpotlightIndexer setIndexerDelegate:]();
  }
  id v4 = (void *)sDelegate;
  sDelegate = (uint64_t)v3;
  id v7 = v3;

  sPrivate = [v7 privateIndex];
  uint64_t v5 = [v7 indexQueue];
  int v6 = (void *)sIndexQueue;
  sIndexQueue = v5;
}

- (unint64_t)purgeableVectorIndexSize:(BOOL)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  indexQueue = self->_indexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SPCoreSpotlightIndexer_purgeableVectorIndexSize___block_invoke;
  block[3] = &unk_264508230;
  void block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(indexQueue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __51__SPCoreSpotlightIndexer_purgeableVectorIndexSize___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__SPCoreSpotlightIndexer_purgeableVectorIndexSize___block_invoke_2;
  v3[3] = &unk_264508208;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 _enumerateIndexersWithProtectionClasses:0 block:v3];
}

uint64_t __51__SPCoreSpotlightIndexer_purgeableVectorIndexSize___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 index];
  uint64_t result = SIVectorIndexStorageSize();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)purgeVectorIndex:(BOOL)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  indexQueue = self->_indexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SPCoreSpotlightIndexer_purgeVectorIndex___block_invoke;
  block[3] = &unk_264508230;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(indexQueue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __43__SPCoreSpotlightIndexer_purgeVectorIndex___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__SPCoreSpotlightIndexer_purgeVectorIndex___block_invoke_2;
  v3[3] = &unk_264508208;
  char v4 = *(unsigned char *)(a1 + 48);
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _enumerateIndexersWithProtectionClasses:0 block:v3];
}

void __43__SPCoreSpotlightIndexer_purgeVectorIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 index];
  uint64_t v4 = SIPurgeVectorIndex();
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [v3 dataclass];
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "CacheDelete: purged %lu bytes for %@", (uint8_t *)&v8, 0x16u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v5;
  }
}

+ (unint64_t)storageSizeForFolder:(id)a3
{
  v43[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263EFF6A8];
  uint64_t v5 = *MEMORY[0x263EFF6F0];
  v43[0] = *MEMORY[0x263EFF6A8];
  v43[1] = v5;
  uint64_t v31 = v5;
  uint64_t v29 = *MEMORY[0x263EFF628];
  uint64_t v30 = *MEMORY[0x263EFF770];
  v43[2] = *MEMORY[0x263EFF628];
  v43[3] = v30;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
  BOOL v7 = [MEMORY[0x263F08850] defaultManager];
  id v27 = (void *)v6;
  int v28 = v3;
  int v8 = [v7 enumeratorAtURL:v3 includingPropertiesForKeys:v6 options:0 errorHandler:&__block_literal_global_1832];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v39;
    uint64_t v13 = v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        dispatch_source_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v37 = 0;
        int v16 = [v15 getResourceValue:&v37 forKey:v4 error:0];
        id v17 = v37;
        id v18 = v17;
        if (v16 && [v17 BOOLValue])
        {
          v11 += [a1 storageSizeForFolder:v15];
        }
        else
        {
          id v36 = 0;
          int v19 = [v15 getResourceValue:&v36 forKey:v13 error:0];
          id v20 = v36;
          int v21 = v20;
          if (v19 && [v20 BOOLValue])
          {
            id v35 = 0;
            int v22 = [v15 getResourceValue:&v35 forKey:v30 error:0];
            id v23 = v35;
            int v24 = v23;
            if (!v22 || !v23)
            {
              id v34 = 0;
              [v15 getResourceValue:&v34 forKey:v29 error:0];
              id v25 = v34;

              int v24 = v25;
            }
            v11 += [v24 unsignedLongLongValue];

            uint64_t v13 = v31;
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

uint64_t __47__SPCoreSpotlightIndexer_storageSizeForFolder___block_invoke()
{
  return 1;
}

- (unint64_t)purgeableIndexSize:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v22 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    *(void *)&long long v4 = 138412546;
    long long v19 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
        unint64_t v11 = [v10 objectForKeyedSubscript:v9];

        uint64_t v12 = NSURL;
        uint64_t v13 = [v11 _indexPath];
        id v14 = [v12 fileURLWithPath:v13];
        unint64_t v15 = +[SPCoreSpotlightIndexer storageSizeForFolder:v14];

        int v16 = [NSNumber numberWithUnsignedLong:v15];
        [v22 setValue:v16 forKey:v9];

        id v17 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v19;
          uint64_t v28 = v9;
          __int16 v29 = 2048;
          unint64_t v30 = v15;
          _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_INFO, "CacheDelete: indexer: %@ size: %zu.", buf, 0x16u);
        }

        v6 += v15;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)purgeIndexForSize:(unint64_t)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(SPCoreSpotlightIndexer *)self purgeableVectorIndexSize:1];
  id v43 = self;
  unint64_t v6 = [(SPCoreSpotlightIndexer *)self purgeableVectorIndexSize:0];
  if (v6 >= a3)
  {
    unint64_t v38 = v6;
    long long v39 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      long long v40 = "purgeable";
      if (v5 < a3) {
        long long v40 = "all";
      }
      *(_DWORD *)BOOL v62 = 136315394;
      *(void *)&v62[4] = v40;
      *(_WORD *)&v62[12] = 2048;
      *(void *)&v62[14] = v38;
      _os_log_impl(&dword_21F1CE000, v39, OS_LOG_TYPE_DEFAULT, "CacheDelete: purge %s vectors size: %zu.", v62, 0x16u);
    }

    return [(SPCoreSpotlightIndexer *)v43 purgeVectorIndex:v5 < a3];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    *(void *)BOOL v62 = 0;
    *(void *)&v62[8] = v62;
    *(void *)&v62[16] = 0x2020000000;
    uint64_t v63 = 0;
    if ([(SPCoreSpotlightIndexer *)self purgeableIndexSize:v7] > a3 && v5 != 0)
    {
      uint64_t v9 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        unint64_t v57 = v5;
        _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_DEFAULT, "CacheDelete: purge purgeable vectors size: %zu.", buf, 0xCu);
      }

      uint64_t v10 = [(SPCoreSpotlightIndexer *)v43 purgeVectorIndex:0];
      uint64_t v11 = *(void *)(*(void *)&v62[8] + 24) + v10;
      *(void *)(*(void *)&v62[8] + 24) = v11;
      a3 -= v11;
    }
    [v7 removeAllObjects];
    unint64_t v12 = [(SPCoreSpotlightIndexer *)v43 purgeableIndexSize:v7];
    unint64_t v13 = v12 - a3;
    if (v12 > a3)
    {
      id v14 = [v7 objectForKeyedSubscript:@"Priority"];
      uint64_t v15 = [v14 unsignedLongLongValue];

      if (v15 - 1 < v13)
      {
        [v7 removeObjectForKey:@"Priority"];
        v13 -= v15;
      }
      uint64_t v16 = *MEMORY[0x263F08098];
      id v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08098]];
      uint64_t v18 = [v17 unsignedLongLongValue];

      if (v18 - 1 < v13)
      {
        [v7 removeObjectForKey:v16];
        v13 -= v18;
      }
      if (v13)
      {
        [v7 keysSortedByValueUsingComparator:&__block_literal_global_1837];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v53;
LABEL_17:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v53 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * v22);
            long long v24 = [v7 objectForKeyedSubscript:v23];
            uint64_t v25 = [v24 unsignedLongLongValue];

            if (v25 - 1 < v13)
            {
              [v7 removeObjectForKey:v23];
              v13 -= v25;
              if (!v13) {
                break;
              }
            }
            if (v20 == ++v22)
            {
              uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v61 count:16];
              if (v20) {
                goto LABEL_17;
              }
              break;
            }
          }
        }
      }
    }
    long long v26 = dispatch_group_create();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v27 = v7;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v28)
    {
      uint64_t v30 = *(void *)v49;
      *(void *)&long long v29 = 136315394;
      long long v42 = v29;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v33 = objc_msgSend(v27, "objectForKeyedSubscript:", v32, v42);
          uint64_t v34 = [v33 unsignedLongLongValue];

          dispatch_group_enter(v26);
          id v35 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v36 = [v32 UTF8String];
            *(_DWORD *)long long buf = v42;
            unint64_t v57 = v36;
            __int16 v58 = 2048;
            uint64_t v59 = v34;
            _os_log_impl(&dword_21F1CE000, v35, OS_LOG_TYPE_DEFAULT, "CacheDelete: purge indexer %s size: %zu.", buf, 0x16u);
          }

          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __44__SPCoreSpotlightIndexer_purgeIndexForSize___block_invoke_1841;
          v44[3] = &unk_264508298;
          v44[4] = v32;
          uint64_t v46 = v62;
          uint64_t v47 = v34;
          id v45 = v26;
          [(SPCoreSpotlightIndexer *)v43 deleteAllSearchableItemsWithBundleID:&stru_26D0BD940 fromClient:@"com.apple.CacheDelete" protectionClass:v32 shouldGC:1 completionHandler:v44];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v28);
    }

    dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    unint64_t v37 = *(void *)(*(void *)&v62[8] + 24);

    _Block_object_dispose(v62, 8);
  }
  return v37;
}

uint64_t __44__SPCoreSpotlightIndexer_purgeIndexForSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 unsignedLongLongValue];
  unint64_t v6 = [v4 unsignedLongLongValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

void __44__SPCoreSpotlightIndexer_purgeIndexForSize___block_invoke_1841(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__SPCoreSpotlightIndexer_purgeIndexForSize___block_invoke_1841_cold_1();
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a1 + 56);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)registerCacheDeleteCallbackForVolumePath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(id)sDelegate cacheDeleteId];
    if (v5)
    {
      unint64_t v6 = (void *)v5;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __67__SPCoreSpotlightIndexer_registerCacheDeleteCallbackForVolumePath___block_invoke;
      v19[3] = &unk_2645082C0;
      id v7 = v4;
      id v20 = v7;
      uint64_t v21 = self;
      int v8 = (void *)MEMORY[0x223C48320](v19);
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __67__SPCoreSpotlightIndexer_registerCacheDeleteCallbackForVolumePath___block_invoke_1851;
      uint64_t v16 = &unk_2645082C0;
      id v9 = v7;
      id v17 = v9;
      uint64_t v18 = self;
      uint64_t v10 = (void *)MEMORY[0x223C48320](&v13);
      uint64_t v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v23 = v6;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "CacheDelete: register Callbacks for %@ on %@", buf, 0x16u);
      }

      if (objc_msgSend((id)sDelegate, "managedIndex", v13, v14, v15, v16))
      {
        if (!CacheDeleteRegisterInfoCallbacksForProcess()) {
          goto LABEL_12;
        }
      }
      else if (!CacheDeleteRegisterInfoCallbacks())
      {
LABEL_12:

        goto LABEL_13;
      }
      unint64_t v12 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer registerCacheDeleteCallbackForVolumePath:]();
      }

      goto LABEL_12;
    }
  }
LABEL_13:
}

void *__67__SPCoreSpotlightIndexer_registerCacheDeleteCallbackForVolumePath___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  unint64_t v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "CacheDelete: asked for size on %@ for urgency: %d", (uint8_t *)&v13, 0x12u);
  }

  if (![*(id *)(a1 + 32) isEqualToString:v5]) {
    goto LABEL_7;
  }
  if (a2 == 4)
  {
    uint64_t v7 = [*(id *)(a1 + 40) purgeableIndexSize:0];
    goto LABEL_9;
  }
  if (a2 != 3)
  {
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [*(id *)(a1 + 40) purgeableVectorIndexSize:1];
LABEL_9:
  uint64_t v8 = v7;
LABEL_10:
  id v9 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    int v16 = a2;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_DEFAULT, "CacheDelete: purgeable size on %@ for urgency: %d is %lu", (uint8_t *)&v13, 0x1Cu);
  }

  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  [v10 setObject:v5 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v11 = [NSNumber numberWithUnsignedLong:v8];
  [v10 setObject:v11 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  return v10;
}

void *__67__SPCoreSpotlightIndexer_registerCacheDeleteCallbackForVolumePath___block_invoke_1851(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v6 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v7 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109634;
    *(_DWORD *)int v16 = [v7 intValue];
    *(_WORD *)&v16[4] = 2112;
    *(void *)&v16[6] = v6;
    *(_WORD *)&v16[14] = 1024;
    *(_DWORD *)&v16[16] = a2;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "CacheDelete: will purge %d on %@ for urgency: %d", (uint8_t *)&v15, 0x18u);
  }

  if (![*(id *)(a1 + 32) isEqualToString:v6]) {
    goto LABEL_7;
  }
  if (a2 == 4)
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "purgeIndexForSize:", objc_msgSend(v7, "unsignedLongLongValue"));
    goto LABEL_9;
  }
  if (a2 != 3)
  {
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = [*(id *)(a1 + 40) purgeVectorIndex:0];
LABEL_9:
  uint64_t v10 = v9;
LABEL_10:
  uint64_t v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218498;
    *(void *)int v16 = v10;
    *(_WORD *)&v16[8] = 2112;
    *(void *)&v16[10] = v6;
    *(_WORD *)&v16[18] = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "CacheDelete: did purge %lu on %@ for urgency: %d", (uint8_t *)&v15, 0x1Cu);
  }

  unint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 setObject:v6 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v13 = [NSNumber numberWithUnsignedLong:v10];
  [v12 setObject:v13 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  return v12;
}

void *__67__SPCoreSpotlightIndexer_registerCacheDeleteCallbackForVolumePath___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  unint64_t v6 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = [v6 intValue];
    __int16 v11 = 2112;
    unint64_t v12 = v5;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "CacheDelete: asked to periodic clear %d on %@ for urgency: %d", (uint8_t *)v10, 0x18u);
  }

  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v5 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  [v8 setObject:&unk_26D0C8F50 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  return v8;
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke()
{
  v88[1] = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(SPCoreSpotlightIndexer);
  uint64_t v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

  objc_storeStrong((id *)&sIndexer, v0);
  id v2 = [(id)sDelegate indexDirectory];
  id v3 = (const char *)[v2 fileSystemRepresentation];

  if (v3) {
    sIndexMountPath = (uint64_t)strdup(v3);
  }
  size_t v84 = 8;
  uint64_t v85 = 0;
  if (sysctlbyname("kern.roots_installed", &v85, &v84, 0, 0))
  {
    __error();
    id v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_5();
    }
  }
  else
  {
    sRootsInstalled = v85 != 0;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v5
    || (CFDictionaryRef v6 = v5,
        CFDictionaryGetValue(v5, @"ProductBuildVersion"),
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        CFRelease(v6),
        !v7))
  {
    uint64_t v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_4();
    }

    uint64_t v7 = @"unknown";
  }
  uint64_t v9 = indexHeartbeatPath();
  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 fileExistsAtPath:v9];

  if (v11) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v9];
  }
  else {
  unint64_t v12 = newHeartbeatDict();
  }
  uint64_t v13 = [v12 objectForKeyedSubscript:@"heartbeat_age"];
  if (!v13
    || (int v14 = (void *)v13,
        [v12 objectForKeyedSubscript:@"heartbeat_age"],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 longValue],
        v15,
        v14,
        v16 < 0))
  {
    memset(&v87, 0, 144);
    if (stat((const char *)[v9 cStringUsingEncoding:4], (stat *)&v87))
    {
      int v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_3();
      }

      uint64_t v18 = NSNumber;
      uint64_t v19 = -1;
    }
    else
    {
      uint64_t v18 = NSNumber;
      uint64_t v19 = *(void *)&v87.f_fstypename[8];
    }
    id v20 = [v18 numberWithLong:v19];
    [v12 setObject:v20 forKeyedSubscript:@"heartbeat_age"];
  }
  uint64_t v21 = [v12 objectForKeyedSubscript:@"parentDirectory_age"];
  if (!v21
    || (uint64_t v22 = (void *)v21,
        [v12 objectForKeyedSubscript:@"parentDirectory_age"],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = [v23 longValue],
        v23,
        v22,
        v24 < 0))
  {
    memset(&v87, 0, 144);
    id v25 = [(id)sDelegate indexDirectory];
    int v26 = stat((const char *)[v25 cStringUsingEncoding:4], (stat *)&v87);

    if (v26)
    {
      id v27 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_2();
      }

      uint64_t v28 = [NSNumber numberWithLong:-1];
      long long v29 = @"parentDirectory_agw";
    }
    else
    {
      uint64_t v28 = [NSNumber numberWithLong:*(void *)&v87.f_fstypename[8]];
      long long v29 = @"parentDirectory_age";
    }
    [v12 setObject:v28 forKeyedSubscript:v29];
  }
  uint64_t v30 = [v12 objectForKeyedSubscript:@"pcA_wipes_aggregate"];
  if (!v30
    || (uint64_t v31 = (void *)v30,
        [v12 objectForKeyedSubscript:@"pcA_wipes_aggregate"],
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        uint64_t v33 = [v32 longValue],
        v32,
        v31,
        v33 < 0))
  {
    uint64_t v34 = [NSNumber numberWithLong:0];
    [v12 setObject:v34 forKeyedSubscript:@"pcA_wipes_aggregate"];
  }
  uint64_t v35 = [v12 objectForKeyedSubscript:@"pcB_wipes_aggregate"];
  if (!v35
    || (uint64_t v36 = (void *)v35,
        [v12 objectForKeyedSubscript:@"pcB_wipes_aggregate"],
        unint64_t v37 = objc_claimAutoreleasedReturnValue(),
        uint64_t v38 = [v37 longValue],
        v37,
        v36,
        v38 < 0))
  {
    long long v39 = [NSNumber numberWithLong:0];
    [v12 setObject:v39 forKeyedSubscript:@"pcB_wipes_aggregate"];
  }
  uint64_t v40 = [v12 objectForKeyedSubscript:@"pcC_wipes_aggregate"];
  if (!v40
    || (long long v41 = (void *)v40,
        [v12 objectForKeyedSubscript:@"pcC_wipes_aggregate"],
        long long v42 = objc_claimAutoreleasedReturnValue(),
        uint64_t v43 = [v42 longValue],
        v42,
        v41,
        v43 < 0))
  {
    id v44 = [NSNumber numberWithLong:0];
    [v12 setObject:v44 forKeyedSubscript:@"pcA_wipes_aggregate"];
  }
  uint64_t v45 = [v12 objectForKeyedSubscript:@"pcCX_wipes_aggregate"];
  if (!v45
    || (uint64_t v46 = (void *)v45,
        [v12 objectForKeyedSubscript:@"pcCX_wipes_aggregate"],
        uint64_t v47 = objc_claimAutoreleasedReturnValue(),
        uint64_t v48 = [v47 longValue],
        v47,
        v46,
        v48 < 0))
  {
    long long v49 = [NSNumber numberWithLong:0];
    [v12 setObject:v49 forKeyedSubscript:@"pcCX_wipes_aggregate"];
  }
  uint64_t v50 = [v12 objectForKeyedSubscript:@"pcPriority_wipes_aggregate"];
  if (!v50
    || (long long v51 = (void *)v50,
        [v12 objectForKeyedSubscript:@"pcPriority_wipes_aggregate"],
        long long v52 = objc_claimAutoreleasedReturnValue(),
        uint64_t v53 = [v52 longValue],
        v52,
        v51,
        v53 < 0))
  {
    long long v54 = [NSNumber numberWithLong:0];
    [v12 setObject:v54 forKeyedSubscript:@"pcPriority_wipes_aggregate"];
  }
  long long v55 = [NSNumber numberWithBool:sRootsInstalled];
  [v12 setObject:v55 forKeyedSubscript:@"rootsinstalled"];

  uint64_t v56 = [v12 objectForKeyedSubscript:@"spotlightversion"];

  if (v56)
  {
    unint64_t v57 = [v12 objectForKeyedSubscript:@"spotlightversion"];
    char v58 = [v57 isEqualToString:@"2328.7.0.3"];

    if (v58) {
      goto LABEL_52;
    }
    uint64_t v59 = [v12 objectForKeyedSubscript:@"spotlightversion"];
    [v12 setObject:v59 forKeyedSubscript:@"previousspotlightversion"];

    id v60 = @"2328.7.0.3";
    id v61 = v12;
    BOOL v62 = @"spotlightversion";
  }
  else
  {
    [v12 setObject:@"2328.7.0.3" forKeyedSubscript:@"spotlightversion"];
    id v60 = @"unknown";
    BOOL v62 = @"previousspotlightversion";
    id v61 = v12;
  }
  [v61 setObject:v60 forKeyedSubscript:v62];
LABEL_52:
  uint64_t v63 = [v12 objectForKeyedSubscript:@"previousspotlightversion"];

  if (!v63) {
    [v12 setObject:@"unknown" forKeyedSubscript:@"previousspotlightversion"];
  }
  uint64_t v64 = [v12 objectForKeyedSubscript:@"build"];
  int v65 = (void *)v64;
  id v66 = @"unknown";
  if (v64) {
    id v66 = (__CFString *)v64;
  }
  id v67 = v66;

  if (([(__CFString *)v7 isEqualToString:v67] & 1) == 0) {
    [v12 setObject:v67 forKeyedSubscript:@"previousbuild"];
  }
  v68 = [v12 objectForKeyedSubscript:@"previousbuild"];

  if (v68)
  {
    id v69 = [(__CFString *)v7 substringToIndex:3];
    v70 = [v68 substringToIndex:3];
    if (!v70 || ([v69 isEqualToString:v70] & 1) == 0) {
      [v12 setObject:v68 forKeyedSubscript:@"buildbeforeupgrade"];
    }
  }
  v71 = [v12 objectForKeyedSubscript:@"buildbeforeupgrade"];

  if (!v71) {
    [v12 setObject:@"unknown" forKeyedSubscript:@"buildbeforeupgrade"];
  }
  [v12 setObject:v7 forKeyedSubscript:@"build"];
  int v72 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v12 setObject:v72 forKeyedSubscript:@"vectorindexon"];

  v73 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v12 setObject:v73 forKeyedSubscript:@"textsemanticsearchon"];

  int v74 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v12 setObject:v74 forKeyedSubscript:@"embeddingdonationon"];

  id v75 = [NSNumber numberWithLong:MDBootTime()];
  [v12 setObject:v75 forKeyedSubscript:@"timesinceboot"];

  uint64_t v76 = [MEMORY[0x263F78D00] lastLoadedContentVersion];
  if (v76)
  {
    v77 = [NSNumber numberWithUnsignedLongLong:v76];
    [v12 setObject:v77 forKeyedSubscript:@"otaversion"];
  }
  if ((v11 & 1) == 0)
  {
    int v78 = [MEMORY[0x263F08850] defaultManager];
    v88[0] = *MEMORY[0x263F080A8];
    *(void *)&v87.f_bsize = *MEMORY[0x263F08098];
    id v79 = [NSDictionary dictionaryWithObjects:&v87 forKeys:v88 count:1];
    [v78 createFileAtPath:v9 contents:0 attributes:v79];
  }
  int v80 = [NSURL fileURLWithPath:v9];
  id v86 = 0;
  [v12 writeToURL:v80 error:&v86];
  id v81 = v86;

  if (v81)
  {
    id v82 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_1();
    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

  if (v3)
  {
    bzero(&v87, 0x878uLL);
    if (!statfs(v3, &v87))
    {
      id v83 = [NSString stringWithUTF8String:v87.f_mntonname];
      [(id)sharedInstance_sSharedInstance registerCacheDeleteCallbackForVolumePath:v83];
    }
  }
}

+ (unint64_t)totalIndexDiskSpace
{
  if (totalIndexDiskSpace_onceToken != -1) {
    dispatch_once(&totalIndexDiskSpace_onceToken, &__block_literal_global_1861);
  }
  return sTotalIndexDiskSpace;
}

int *__45__SPCoreSpotlightIndexer_totalIndexDiskSpace__block_invoke()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  bzero(&v9, 0x878uLL);
  id v0 = [(id)sDelegate indexDirectory];
  uint64_t v1 = (const char *)[v0 cStringUsingEncoding:4];

  LODWORD(v0) = statfs(v1, &v9);
  int v2 = *__error();
  if (v0)
  {
    id v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      CFDictionaryRef v6 = v1;
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "*warn* Failed to get total index disk space for %s. err=%d", (uint8_t *)&v5, 0x12u);
    }
  }
  else
  {
    sTotalIndexDiskSpace = v9.f_blocks * v9.f_bsize;
  }
  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

+ (unint64_t)freeIndexDiskSpace
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(&v12, 0x878uLL);
  id v2 = [(id)sDelegate indexDirectory];
  id v3 = (const char *)[v2 cStringUsingEncoding:4];

  LODWORD(v2) = statfs(v3, &v12);
  int v4 = *__error();
  if (v2)
  {
    int v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      statfs v9 = v3;
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "*warn* Failed to get free index disk space for %s. err=%d", (uint8_t *)&v8, 0x12u);
    }

    unint64_t v6 = -1;
  }
  else
  {
    unint64_t v6 = v12.f_bfree * v12.f_bsize;
  }
  *__error() = v4;
  return v6;
}

- (id)defaultIndexer
{
  id v2 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  id v3 = [v2 objectForKey:*MEMORY[0x263F08098]];

  return v3;
}

- (id)priorityIndexer
{
  id v2 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  id v3 = [v2 objectForKey:@"Priority"];

  return v3;
}

- (id)priorityIndexPath
{
  id v2 = [(id)sDelegate indexDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"Priority"];

  return v3;
}

- (id)priorityIndexAvailableTouchFilePath
{
  id v2 = [(id)sDelegate indexDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"priorityIndexAvailable"];

  return v3;
}

- (id)spotlightCacheFilePrefix
{
  id v2 = [(id)sDelegate indexDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"spotlightcache"];

  return v3;
}

- (id)systemSettingsIndexer
{
  if (sPrivate)
  {
    id v2 = 0;
  }
  else
  {
    int v3 = sUsePriorityIndex;
    int v4 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
    int v5 = v4;
    if (v3 == 1) {
      unint64_t v6 = @"Priority";
    }
    else {
      unint64_t v6 = (__CFString *)*MEMORY[0x263F08098];
    }
    id v2 = [v4 objectForKeyedSubscript:v6];
  }
  return v2;
}

- (id)contactsIndexer
{
  if (sPrivate)
  {
    id v2 = 0;
  }
  else
  {
    int v3 = sUsePriorityIndex;
    int v4 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
    int v5 = v4;
    if (v3 == 1) {
      unint64_t v6 = @"Priority";
    }
    else {
      unint64_t v6 = (__CFString *)*MEMORY[0x263F08098];
    }
    id v2 = [v4 objectForKeyedSubscript:v6];
  }
  return v2;
}

- (SPCoreSpotlightIndexer)init
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  v141.receiver = self;
  v141.super_class = (Class)SPCoreSpotlightIndexer;
  id v2 = [(SPCoreSpotlightIndexer *)&v141 init];
  if (v2)
  {
    if (!sDelegate) {
      -[SPCoreSpotlightIndexer init]();
    }
    id v99 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.searchd.appScoping", v99);
    int v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_1872);
    }
    uint64_t v5 = [(id)sDelegate indexQueue];
    unint64_t v6 = (void *)*((void *)v2 + 29);
    *((void *)v2 + 29) = v5;

    __int16 v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.searchd.personaobserver", v8);
    __int16 v10 = (void *)*((void *)v2 + 28);
    *((void *)v2 + 28) = v9;

    uint64_t v11 = [(id)sDelegate firstUnlockQueue];
    statfs v12 = (void *)*((void *)v2 + 30);
    *((void *)v2 + 30) = v11;

    if ([(id)sDelegate indexingEnabled])
    {
      id v13 = objc_alloc(MEMORY[0x263EFF9C0]);
      int v14 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v15 = [v2 personaListURL];
      uint64_t v16 = [v14 arrayWithContentsOfURL:v15];
      uint64_t v17 = [v13 initWithArray:v16];
      uint64_t v18 = (void *)*((void *)v2 + 26);
      *((void *)v2 + 26) = v17;

      if (!sPrivate)
      {
        uint64_t v19 = [MEMORY[0x263F841B0] sharedManager];
        v139[0] = MEMORY[0x263EF8330];
        v139[1] = 3221225472;
        v139[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_3;
        v139[3] = &unk_264506B90;
        id v140 = v2;
        [v19 registerPersonaListUpdateObserver:v140 withMachService:@"com.apple.searchd.personaobserver" completionHandler:v139];
      }
      id v20 = objc_opt_new();
      [v2 setInteractionHandler:v20];

      id v21 = +[SPQueryResultsQueue sharedInstanceDispatchQueue:*((void *)v2 + 29)];
      id v22 = +[SPQueryResultsQueue sharedInstanceMaintenanceDispatchQueue:*((void *)v2 + 29)];
      id location = 0;
      objc_initWeak(&location, v2);
      if (!sPrivate)
      {
        uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v24 = dispatch_queue_create("com.apple.spotlight.reindexAll", v23);
        id v25 = (void *)*((void *)v2 + 31);
        *((void *)v2 + 31) = v24;

        int v26 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v144 = "com.apple.spotlight.reindexAll";
          _os_log_impl(&dword_21F1CE000, v26, OS_LOG_TYPE_INFO, "Suspending \"%s\" queue", buf, 0xCu);
        }

        dispatch_suspend(*((dispatch_object_t *)v2 + 31));
        dispatch_source_t v27 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, *((dispatch_queue_t *)v2 + 31));
        uint64_t v28 = (void *)*((void *)v2 + 18);
        *((void *)v2 + 18) = v27;

        long long v29 = *((void *)v2 + 18);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1893;
        handler[3] = &unk_264506468;
        objc_copyWeak(&v137, &location);
        dispatch_source_set_event_handler(v29, handler);
        dispatch_resume(*((dispatch_object_t *)v2 + 18));
        objc_destroyWeak(&v137);
      }
      uint64_t v30 = [(id)objc_opt_class() allProtectionClasses];
      int v101 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v30, "count") + 1);
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      obuint64_t j = v30;
      uint64_t v31 = [obj countByEnumeratingWithState:&v132 objects:v142 count:16];
      if (v31)
      {
        int v32 = 0;
        uint64_t v33 = *(void *)v133;
        do
        {
          uint64_t v34 = 0;
          if (v32 <= 5) {
            int v35 = 5;
          }
          else {
            int v35 = v32;
          }
          uint64_t v36 = (v35 - v32);
          uint64_t v37 = (uint64_t)v2 + 4 * v32 + 8;
          do
          {
            if (*(void *)v133 != v33) {
              objc_enumerationMutation(obj);
            }
            if (v36 == v34) {
              __assert_rtn("-[SPCoreSpotlightIndexer init]", "SPCoreSpotlightIndexer.m", 12388, "cancelFlagOffset < MAX_INDEXERS");
            }
            uint64_t v38 = *(void *)(*((void *)&v132 + 1) + 8 * v34);
            long long v39 = [[SPConcreteCoreSpotlightIndexer alloc] initWithQueue:*((void *)v2 + 29) protectionClass:v38 cancelPtr:v37];
            [(SPConcreteCoreSpotlightIndexer *)v39 setOwner:v2];
            [(SPConcreteCoreSpotlightIndexer *)v39 setFirstUnlockQueue:*((void *)v2 + 30)];
            [v101 setObject:v39 forKey:v38];

            ++v34;
            v37 += 4;
          }
          while (v31 != v34);
          uint64_t v31 = [obj countByEnumeratingWithState:&v132 objects:v142 count:16];
          v32 += v34;
        }
        while (v31);
      }

      [v2 setConcreteIndexers:v101];
      if (!sPrivate)
      {
        id v40 = objc_alloc_init(MEMORY[0x263F08A48]);
        [v40 setMaxConcurrentOperationCount:1];
        [v40 setUnderlyingQueue:*((void *)v2 + 29)];
        long long v41 = [MEMORY[0x263F08A00] defaultCenter];
        v129[1] = (id)MEMORY[0x263EF8330];
        v129[2] = (id)3221225472;
        v129[3] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1900;
        v129[4] = &unk_264508328;
        objc_copyWeak(&v131, &location);
        v130 = @"com.apple.searchd.indexExtensionMigration.start";
        uint64_t v42 = objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:");
        uint64_t v43 = (void *)*((void *)v2 + 19);
        *((void *)v2 + 19) = v42;

        v125[0] = MEMORY[0x263EF8330];
        v125[1] = 3221225472;
        v125[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1905;
        v125[3] = &unk_264508350;
        objc_copyWeak(v129, &location);
        v126 = @"com.apple.searchd.indexExtensionMigration.finish";
        id v44 = v2;
        id v127 = v44;
        id v128 = obj;
        uint64_t v45 = [v41 addObserverForName:@"com.apple.searchd.indexExtensionMigration.finish" object:0 queue:v40 usingBlock:v125];
        uint64_t v46 = (void *)v44[20];
        v44[20] = v45;

        objc_destroyWeak(v129);
        objc_destroyWeak(&v131);
      }
      uint64_t v47 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        [(SPCoreSpotlightIndexer *)v47 init];
      }

      v123[0] = MEMORY[0x263EF8330];
      v123[1] = 3221225472;
      v123[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1914;
      v123[3] = &unk_264508378;
      objc_copyWeak(&v124, &location);
      long long v55 = (void *)*MEMORY[0x263EF8188];
      xpc_activity_register("com.apple.searchd.expirations", (xpc_object_t)*MEMORY[0x263EF8188], v123);
      v121[0] = MEMORY[0x263EF8330];
      v121[1] = 3221225472;
      v121[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1916;
      v121[3] = &unk_264508378;
      objc_copyWeak(&v122, &location);
      xpc_activity_register("com.apple.searchd.expirations.AB", v55, v121);
      uint64_t v56 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        [(SPCoreSpotlightIndexer *)v56 init];
      }

      v119[0] = MEMORY[0x263EF8330];
      v119[1] = 3221225472;
      v119[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1930;
      v119[3] = &unk_264508378;
      objc_copyWeak(&v120, &location);
      xpc_activity_register("com.apple.searchd.defrag", v55, v119);
      uint64_t v64 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        [(SPCoreSpotlightIndexer *)v64 init];
      }

      v116[0] = MEMORY[0x263EF8330];
      v116[1] = 3221225472;
      v116[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1933;
      v116[3] = &unk_264506B40;
      objc_copyWeak(&v118, &location);
      id v72 = v2;
      id v117 = v72;
      xpc_activity_register("com.apple.searchd.loadtrial", v55, v116);
      v73 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        [(SPCoreSpotlightIndexer *)v73 init];
      }

      v114[0] = MEMORY[0x263EF8330];
      v114[1] = 3221225472;
      v114[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1936;
      v114[3] = &unk_264508378;
      objc_copyWeak(&v115, &location);
      xpc_activity_register("com.apple.searchd.heartbeat", v55, v114);
      id v81 = [MEMORY[0x263F29900] sharedScheduler];
      uint64_t v82 = *((void *)v2 + 29);
      v112[0] = MEMORY[0x263EF8330];
      v112[1] = 3221225472;
      v112[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1941;
      v112[3] = &unk_2645083C8;
      id v83 = v72;
      id v113 = v83;
      [v81 registerForTaskWithIdentifier:@"com.apple.searchd.reportStorageUsage" usingQueue:v82 launchHandler:v112];

      size_t v84 = [MEMORY[0x263F29900] sharedScheduler];
      uint64_t v85 = *((void *)v2 + 29);
      v110[0] = MEMORY[0x263EF8330];
      v110[1] = 3221225472;
      v110[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1952;
      v110[3] = &unk_2645083C8;
      id v86 = (dispatch_object_t *)v83;
      int v111 = v86;
      [v84 registerForTaskWithIdentifier:@"com.apple.searchd.reportAppUsage" usingQueue:v85 launchHandler:v110];

      _SISetVectorIndexDropCallback();
      if (!sPrivate)
      {
        dispatch_source_t v87 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v86[31]);
        dispatch_object_t v88 = v86[23];
        v86[23] = v87;

        uint64_t v89 = v86[23];
        v108[0] = MEMORY[0x263EF8330];
        v108[1] = 3221225472;
        v108[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1976;
        v108[3] = &unk_264506468;
        objc_copyWeak(&v109, &location);
        dispatch_source_set_event_handler(v89, v108);
        dispatch_resume(v86[23]);
        dispatch_source_t v90 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v86[31]);
        dispatch_object_t v91 = v86[24];
        v86[24] = v90;

        id v92 = v86[24];
        v106[0] = MEMORY[0x263EF8330];
        v106[1] = 3221225472;
        v106[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_4_1978;
        v106[3] = &unk_264506468;
        objc_copyWeak(&v107, &location);
        dispatch_source_set_event_handler(v92, v106);
        dispatch_resume(v86[24]);
        v104[0] = MEMORY[0x263EF8330];
        v104[1] = 3221225472;
        v104[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_6;
        v104[3] = &unk_264508500;
        objc_copyWeak(&v105, &location);
        id v93 = (void *)MEMORY[0x223C48320](v104);
        id v94 = +[SDEventMonitor sharedInstance];
        [v94 registerHandler:v93 forEventName:@"com.apple.corespotlight.developer.ReindexAllItems"];

        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_7;
        v102[3] = &unk_264508500;
        objc_copyWeak(&v103, &location);
        int v95 = (void *)MEMORY[0x223C48320](v102);
        v96 = +[SDEventMonitor sharedInstance];
        [v96 registerHandler:v95 forEventName:@"com.apple.corespotlight.developer.ReindexAllItemsWithIdentifiers"];

        v97 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v144 = "com.apple.spotlight.reindexAll";
          _os_log_impl(&dword_21F1CE000, v97, OS_LOG_TYPE_INFO, "Resuming \"%s\" queue", buf, 0xCu);
        }

        dispatch_resume(v86[31]);
        objc_destroyWeak(&v103);

        objc_destroyWeak(&v105);
        objc_destroyWeak(&v107);
        objc_destroyWeak(&v109);
      }

      objc_destroyWeak(&v115);
      objc_destroyWeak(&v118);
      objc_destroyWeak(&v120);
      objc_destroyWeak(&v122);
      objc_destroyWeak(&v124);

      objc_destroyWeak(&location);
    }
  }
  return (SPCoreSpotlightIndexer *)v2;
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.appple.spotlight.mds-import", v0);
  id v2 = (void *)gImportQueue;
  gImportQueue = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D0C8DB8];
  int v4 = (void *)sPriorityBundleIds;
  sPriorityBundleIds = v3;

  if (!sPrivate && _os_feature_enabled_impl()) {
    sUsePriorityIndex = 1;
  }
  return MEMORY[0x270F4B318](&__block_literal_global_1885);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[28];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_4;
  v7[3] = &unk_2645065E8;
  id v8 = v3;
  dispatch_queue_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    dispatch_queue_t v1 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __30__SPCoreSpotlightIndexer_init__block_invoke_4_cold_1();
    }
  }
  else
  {
    id v2 = *(void **)(a1 + 40);
    [v2 personaListDidUpdate];
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1893(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reindexAllItemsOnPrefsChanges];
    id WeakRetained = v2;
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1900(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138413058;
      uint64_t v6 = v4;
      __int16 v7 = 2048;
      uint64_t v8 = [WeakRetained dataMigrationStage];
      __int16 v9 = 1024;
      int v10 = [(id)sDelegate deviceFirstUnlockedInMKB];
      __int16 v11 = 1024;
      int v12 = [(id)sDelegate deviceFirstUnlockedInSB];
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Received \"%@\" notification, dataMigrationStage:%lu, (%d:%d)", (uint8_t *)&v5, 0x22u);
    }

    objc_msgSend(WeakRetained, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage") + 1);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1905(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    int v5 = [v3 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"bundleIDs"];

    __int16 v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413314;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = [WeakRetained dataMigrationStage];
      __int16 v13 = 2112;
      int v14 = v6;
      __int16 v15 = 1024;
      int v16 = [(id)sDelegate deviceFirstUnlockedInMKB];
      __int16 v17 = 1024;
      int v18 = [(id)sDelegate deviceFirstUnlockedInSB];
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Received \"%@\" notification, dataMigrationStage:%lu, dataMigrationBundleIDs:%@ (%d:%d)", (uint8_t *)&v9, 0x2Cu);
    }

    objc_msgSend(WeakRetained, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage") + 1);
    [WeakRetained setDataMigrationBundleIDs:v6];
    [*(id *)(a1 + 40) mergeWithProtectionClasses:*(void *)(a1 + 48) power:1 completionHandler:&__block_literal_global_1911];
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1909()
{
  id v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "Finished post-migration merge", v1, 2u);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1914(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C480D0]();
  if (xpc_activity_get_state(v3) == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v6 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v15 = "com.apple.searchd.expirations";
        _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      if ([(id)sDelegate deviceFirstUnlockedInMKB])
      {
        __int16 v7 = dispatch_group_create();
        [WeakRetained revokeExpiredItems:v7 protected:0];
        [WeakRetained issueDuplicateOidCheckWithGroup:v7 protected:0];
        uint64_t v8 = sIndexQueue;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1915;
        v12[3] = &unk_2645063F8;
        __int16 v13 = v3;
        int v9 = _setup_block(v12, 0, 12498);
        dispatch_group_notify(v7, v8, v9);

LABEL_10:
        goto LABEL_11;
      }
      uint64_t v10 = v3;
      xpc_activity_state_t v11 = 3;
    }
    else
    {
      uint64_t v10 = v3;
      xpc_activity_state_t v11 = 5;
    }
    xpc_activity_set_state(v10, v11);
    goto LABEL_10;
  }
LABEL_11:
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1915(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  dispatch_queue_t v1 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.searchd.expirations";
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1916(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C480D0]();
  if (xpc_activity_get_state(v3) == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v6 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v17 = "com.apple.searchd.expirations.AB";
        _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      CFTypeRef cf = 0;
      v20[0] = @"MKBAssertionKey";
      v20[1] = @"MKBAssertionTimeout";
      v21[0] = @"Other";
      v21[1] = &unk_26D0C9010;
      [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      __int16 v7 = (char *)MKBDeviceLockAssertion();
      uint64_t v8 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        __int16 v17 = v7;
        __int16 v18 = 2112;
        CFTypeRef v19 = cf;
        _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Took lock assertion for expirations %@, err: %@", buf, 0x16u);
      }

      if (v7)
      {
        int v9 = dispatch_group_create();
        [WeakRetained revokeExpiredItems:v9 protected:1];
        [WeakRetained issueDuplicateOidCheckWithGroup:v9 protected:1];
        uint64_t v10 = sIndexQueue;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1928;
        v12[3] = &unk_2645065E8;
        __int16 v13 = v3;
        int v14 = v7;
        xpc_activity_state_t v11 = _setup_block(v12, 0, 12528);
        dispatch_group_notify(v9, v10, v11);
      }
      else
      {
        xpc_activity_set_state(v3, 3);
      }
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1928(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  dispatch_queue_t v1 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.searchd.expirations.AB";
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1930(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C480D0]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      BOOL v5 = xpc_activity_set_state(v3, 3);
      uint64_t v6 = logForCSLogCategoryIndex();
      id WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          __int16 v15 = "com.apple.searchd.defrag";
          __int16 v16 = 2048;
          uint64_t v17 = 2;
          _os_log_impl(&dword_21F1CE000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1930_cold_1();
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v8 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v15 = "com.apple.searchd.defrag";
        _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      int v9 = dispatch_group_create();
      [WeakRetained issueDefrag:0 group:v9];
      uint64_t v10 = sIndexQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1931;
      v12[3] = &unk_2645063F8;
      __int16 v13 = v3;
      xpc_activity_state_t v11 = _setup_block(v12, 0, 12564);
      dispatch_group_notify(v9, v10, v11);
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1931(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  dispatch_queue_t v1 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.searchd.defrag";
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1933(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C480D0]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      BOOL v5 = xpc_activity_set_state(v3, 3);
      uint64_t v6 = logForCSLogCategoryIndex();
      id WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          __int16 v16 = "com.apple.searchd.loadtrial";
          __int16 v17 = 2048;
          uint64_t v18 = 2;
          _os_log_impl(&dword_21F1CE000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1933_cold_1();
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v8 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v16 = "com.apple.searchd.loadtrial";
        _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      int v9 = dispatch_group_create();
      [WeakRetained issueLoadTrial:v9];
      uint64_t v10 = sIndexQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1934;
      v12[3] = &unk_2645065E8;
      __int16 v13 = v3;
      id v14 = *(id *)(a1 + 32);
      xpc_activity_state_t v11 = _setup_block(v12, 0, 12603);
      dispatch_group_notify(v9, v10, v11);
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke_1934(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "com.apple.searchd.loadtrial";
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v4, 0xCu);
  }

  uint64_t result = [(id)sDelegate privateIndex];
  if ((result & 1) == 0)
  {
    uint64_t result = [(id)sDelegate managedIndex];
    if ((result & 1) == 0) {
      return [*(id *)(a1 + 40) wipeCoreSpotlightIndexForTrial];
    }
  }
  return result;
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1936(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x223C480D0]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      BOOL v5 = xpc_activity_set_state(v3, 3);
      uint64_t v6 = logForCSLogCategoryIndex();
      id WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315394;
          uint64_t v12 = "com.apple.searchd.heartbeat";
          __int16 v13 = 2048;
          uint64_t v14 = 2;
          _os_log_impl(&dword_21F1CE000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", (uint8_t *)&v11, 0x16u);
        }
LABEL_16:

        goto LABEL_17;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1936_cold_1();
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v8 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        uint64_t v12 = "com.apple.searchd.heartbeat";
        _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", (uint8_t *)&v11, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      id v9 = (id)[WeakRetained issueHeartbeat];
      xpc_activity_set_state(v3, 5);
      uint64_t v10 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        uint64_t v12 = "com.apple.searchd.heartbeat";
        _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1941(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"com.apple.searchd.reportStorageUsage";
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Performing background task:%@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v5 = (void *)MEMORY[0x223C480D0]();
  uint64_t v6 = objc_opt_new();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1943;
  v23[3] = &unk_2645063F8;
  id v7 = v6;
  id v24 = v7;
  [v3 setExpirationHandler:v23];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v8 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1944;
  v15[3] = &unk_2645083A0;
  id v9 = v7;
  id v16 = v9;
  p_long long buf = &buf;
  uint64_t v18 = &v19;
  [v8 _enumerateIndexersWithBlock:v15];
  uint64_t v10 = [(id)sDelegate indexDirectory];
  LODWORD(v8) = [v9 collectAtPath:v10];

  if (v8)
  {
    [v9 sendToCoreAnalyticsWithLiveDocCount:*(void *)(*((void *)&buf + 1) + 24) deadDocCount:v20[3]];
    [v3 setTaskCompleted];
  }
  else
  {
    id v14 = 0;
    int v11 = [v3 setTaskExpiredWithRetryAfter:&v14 error:300.0];
    id v12 = v14;
    if ((v11 & 1) == 0)
    {
      __int16 v13 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1941_cold_1();
      }

      [v3 setTaskCompleted];
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke_1943(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = @"com.apple.searchd.reportStorageUsage";
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Task %@ cancelled", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) setCanceled:1];
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1944(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) canceled] & 1) == 0 && objc_msgSend(v3, "index"))
  {
    [v3 index];
    _SIGetDocumentCount();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1952(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v22 = a2;
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"com.apple.searchd.reportAppUsage";
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Performing background task:%@", (uint8_t *)&buf, 0xCu);
  }

  context = (void *)MEMORY[0x223C480D0]();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1953;
  v41[3] = &unk_264506850;
  v41[4] = &buf;
  [v22 setExpirationHandler:v41];
  [(id)objc_opt_class() allProtectionClasses];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v4)
  {
    uint64_t v24 = *MEMORY[0x263F01E20];
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v7 = objc_opt_new();
        [v7 setAttribute:1];
        uint64_t v45 = v6;
        uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        [v7 setProtectionClasses:v8];

        uint64_t v44 = v24;
        id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
        [v7 setFetchAttributes:v9];

        uint64_t v10 = objc_opt_new();
        int v11 = *(void **)(a1 + 32);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1957;
        v33[3] = &unk_264508418;
        p_long long buf = &buf;
        id v12 = v7;
        id v34 = v12;
        id v35 = v10;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_3_1959;
        v27[3] = &unk_2645084B8;
        int v32 = &buf;
        id v13 = v35;
        id v28 = v13;
        id v14 = v12;
        id v29 = v14;
        uint64_t v30 = v6;
        id v31 = *(id *)(a1 + 32);
        uint64_t v15 = [v11 startQueryWithQueryString:@"*=*" queryContext:v14 eventHandler:0 resultsHandler:v33 completionHandler:v27];
        if (!v15)
        {
          id v16 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __30__SPCoreSpotlightIndexer_init__block_invoke_1952_cold_2(v42, &v43, v16);
          }

          atomic_store(1u, (unsigned __int8 *)(*((void *)&buf + 1) + 24));
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v4);
  }

  unsigned __int8 v17 = atomic_load((unsigned __int8 *)(*((void *)&buf + 1) + 24));
  if (v17)
  {
    id v26 = 0;
    char v18 = [v22 setTaskExpiredWithRetryAfter:&v26 error:300.0];
    id v19 = v26;
    if ((v18 & 1) == 0)
    {
      id v20 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1952_cold_1();
      }

      [v22 setTaskCompleted];
    }
  }
  else
  {
    [v22 setTaskCompleted];
  }

  _Block_object_dispose(&buf, 8);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1953(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = @"com.apple.searchd.reportAppUsage";
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Task %@ cancelled", (uint8_t *)&v3, 0xCu);
  }

  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1957(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a6;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if ((v10 & 1) == 0 && (a2 == 6 || !a2))
  {
    int v11 = [*(id *)(a1 + 32) fetchAttributes];
    uint64_t v12 = [v11 count];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1958;
    v15[3] = &unk_2645083F0;
    long long v14 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v14;
    long long v16 = v14;
    [a5 enumerateQueryResults:v12 stringCache:0 usingBlock:v15];
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1958(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (v3)
  {
    *a3 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = *a2;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(a1 + 32), "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3_1959(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v17 = a2;
  if (v17)
  {
    unsigned __int8 v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __30__SPCoreSpotlightIndexer_init__block_invoke_3_1959_cold_1((uint64_t)v17, v3, v4);
    }

    atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      uint64_t v19 = *MEMORY[0x263F01E20];
LABEL_7:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
        if (v9) {
          break;
        }
        uint64_t v10 = objc_opt_new();
        [v10 setCounting:1];
        uint64_t v33 = *(void *)(a1 + 48);
        long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
        [*(id *)(a1 + 40) setProtectionClasses:v11];

        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        v24[3] = 0;
        long long v12 = [NSString stringWithFormat:@"%@=%@", v19, v8];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1960;
        void v21[3] = &unk_264508440;
        long long v13 = *(void **)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 64);
        uint64_t v23 = v24;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        void v20[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1961;
        v20[3] = &unk_264508490;
        v20[6] = v22;
        v20[7] = v24;
        uint64_t v14 = *(void *)(a1 + 48);
        v20[4] = v8;
        v20[5] = v14;
        uint64_t v15 = [v13 startQueryWithQueryString:v12 queryContext:v10 eventHandler:0 resultsHandler:v21 completionHandler:v20];
        if (!v15)
        {
          uint64_t v16 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v30 = @"com.apple.searchd.reportAppUsage";
            __int16 v31 = 2112;
            uint64_t v32 = v8;
            _os_log_error_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_ERROR, "Task %@ could not start counting query for bundle %@", buf, 0x16u);
          }
        }
        _Block_object_dispose(v24, 8);

        if (v5 == ++v7)
        {
          uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v5) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke_1960(uint64_t result, int a2, uint64_t a3)
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 32) + 8) + 24));
  if (a2 == 5 && (v3 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) += a3;
  }
  return result;
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1961(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if ((v5 & 1) == 0)
  {
    if (v3)
    {
      uint64_t v6 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_2_1961_cold_1();
      }
    }
    else
    {
      AnalyticsSendEventLazy();
    }
  }
}

id __30__SPCoreSpotlightIndexer_init__block_invoke_1965(uint64_t a1)
{
  v7[3] = *MEMORY[0x263EF8340];
  v7[0] = *(void *)(a1 + 32);
  v6[0] = @"bundleID";
  v6[1] = @"itemCount";
  int v2 = [NSNumber numberWithUnsignedLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  v7[1] = v2;
  v6[2] = @"protectionClass";
  id v3 = [NSNumber numberWithInt:protectionClassForAnalytics(*(void **)(a1 + 40))];
  v7[2] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1972(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v6 = v5;
    uint64_t v8 = @"Priority";
  }
  else
  {
    switch(a2 >> 1)
    {
      case 1u:
        unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v6 = v5;
        uint64_t v7 = (__CFString **)MEMORY[0x263F08080];
        break;
      case 2u:
        unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v6 = v5;
        uint64_t v7 = (__CFString **)MEMORY[0x263F08088];
        break;
      case 3u:
        unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v6 = v5;
        uint64_t v7 = (__CFString **)MEMORY[0x263F08098];
        break;
      case 7u:
        unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v6 = v5;
        uint64_t v7 = (__CFString **)MEMORY[0x263F080A0];
        break;
      default:
        unsigned __int8 v5 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v6 = v5;
        uint64_t v7 = (__CFString **)MEMORY[0x263F080B0];
        break;
    }
    uint64_t v8 = *v7;
  }
  unsigned __int8 v9 = [v5 concreteIndexerForProtectionClass:v8 andBundleID:0];

  memset(&v27, 0, sizeof(v27));
  id v10 = [v9 _indexPath];
  int v11 = stat((const char *)[v10 UTF8String], &v27);

  int v12 = *__error();
  if (v11)
  {
    long long v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.4();
    }

    __darwin_time_t tv_sec = 0;
    off_t st_size = 0;
  }
  else
  {
    __darwin_time_t tv_sec = v27.st_birthtimespec.tv_sec;
    off_t st_size = v27.st_size;
  }
  *__error() = v12;
  uint64_t v16 = [v9 vectorIndexDropsPath];
  id v17 = [MEMORY[0x263F08850] defaultManager];
  int v18 = [v17 fileExistsAtPath:v16];

  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    [v19 removeItemAtPath:v16 error:&v26];
    id v20 = v26;

    if (v20)
    {
      uint64_t v21 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __30__SPCoreSpotlightIndexer_init__block_invoke_1972_cold_1((uint64_t)v20, a2, v21);
      }
    }
  }
  LOBYTE(v24) = 1;
  uint64_t v22 = [v9 indexLossAnalyticsDictWithPreviousIndexCreationDate:tv_sec size:st_size openingInReadOnly:0 fullyCreated:1 markedPurgeable:0 vectorIndexDrop:a3 forAnalytics:v24];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  if ([v23 BOOLForKey:@"disable_index_drop_reporting"])
  {
    [v9 writeIndexLossEventToFile:v22 vector:1];
  }
  else
  {
    id v25 = v22;
    AnalyticsSendEventLazy();
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1976(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained reindexAllItemsSource];
    dispatch_suspend(v3);

    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_3_1977;
    v4[3] = &unk_2645063F8;
    id v5 = v2;
    [v5 _reindexAllItemsWithExtensionsAndCompletionBlock:v4];
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3_1977(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) reindexAllItemsSource];
  dispatch_resume(v1);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4_1978(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained reindexAllItemsWithIdentifiersSource];
    dispatch_suspend(v3);

    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_5;
    v4[3] = &unk_2645063F8;
    id v5 = v2;
    [v5 _reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:v4];
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_5(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) reindexAllItemsWithIdentifiersSource];
  dispatch_resume(v1);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a5 && WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v7 = [WeakRetained reindexAllItemsSource];
    dispatch_source_merge_data(v7, 1uLL);

    id WeakRetained = v8;
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a5 && WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v7 = [WeakRetained reindexAllItemsWithIdentifiersSource];
    dispatch_source_merge_data(v7, 1uLL);

    id WeakRetained = v8;
  }
}

- (void)resume
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "resume from delegate", v4, 2u);
  }

  [(SPCoreSpotlightIndexer *)self _registerForPrefsChanges];
}

- (void)unlock
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "unlock from delegate", buf, 2u);
  }

  if ([(id)sDelegate deviceFirstUnlockedInSB])
  {
    uint64_t v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "Waiting for apfs to unlock", v11, 2u);
    }

    wait_for_apfs_kb_state((const char *)sIndexMountPath, 1);
    id v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Waiting for apfs to unlock complete", v10, 2u);
    }

    uint64_t v6 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08080]];
    [v7 resumeIndex];

    id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08088]];
    [v8 resumeIndex];

    unsigned __int8 v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F080A0]];
    [v9 resumeIndex];
  }
  if (self->_updatePersonas) {
    [(SPCoreSpotlightIndexer *)self personaListDidUpdate];
  }
}

- (void)locking
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "locking from delegate enter", buf, 2u);
  }

  uint64_t v4 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  id v5 = SDTransactionCreate(&unk_26D0C8DD0);
  uint64_t v6 = dispatch_group_create();
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08080]];
  [v7 suspendIndexForDeviceLock:v6];

  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08088]];
  [v8 suspendIndexForDeviceLock:v6];

  unsigned __int8 v9 = [(SPCoreSpotlightIndexer *)self firstUnlockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SPCoreSpotlightIndexer_locking__block_invoke;
  block[3] = &unk_2645063F8;
  id v12 = v5;
  id v10 = v5;
  dispatch_group_notify(v6, v9, block);
}

void __33__SPCoreSpotlightIndexer_locking__block_invoke()
{
  id v0 = self;
  dispatch_queue_t v1 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "locking from delegate exit", v2, 2u);
  }
}

- (void)locked
{
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "locked from delegate", v3, 2u);
  }
}

- (void)lockingCx
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "locking Cx from delegate", buf, 2u);
  }

  uint64_t v4 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  id v5 = SDTransactionCreate(&unk_26D0C8DE8);
  uint64_t v6 = dispatch_group_create();
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F080A0]];
  [v7 suspendIndexForDeviceLock:v6];

  id v8 = [(SPCoreSpotlightIndexer *)self firstUnlockQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SPCoreSpotlightIndexer_lockingCx__block_invoke;
  block[3] = &unk_2645063F8;
  id v11 = v5;
  id v9 = v5;
  dispatch_group_notify(v6, v8, block);
}

id __35__SPCoreSpotlightIndexer_lockingCx__block_invoke()
{
  return self;
}

- (void)lockedCx
{
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "locked Cx from delegate", v3, 2u);
  }
}

- (OS_dispatch_queue)indexQueue
{
  return (OS_dispatch_queue *)[(id)sDelegate indexQueue];
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return (OS_dispatch_queue *)[(id)sDelegate firstUnlockQueue];
}

- (id)searchServiceName
{
  return [(NSString *)self->_serviceName stringByAppendingString:@".search"];
}

- (id)indexServiceName
{
  return [(NSString *)self->_serviceName stringByAppendingString:@".index"];
}

- (id)delegateServiceName
{
  return [(NSString *)self->_serviceName stringByAppendingString:@".delegate"];
}

- (void)setServiceName:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  serviceName = self->_serviceName;
  self->_serviceName = v4;
  MEMORY[0x270F9A758](v4, serviceName);
}

- (void)_upgradeToPriorityIndex
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "### firstUnlock == NO, can't upgrade to priority index", v2, v3, v4, v5, v6);
}

void __49__SPCoreSpotlightIndexer__upgradeToPriorityIndex__block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "### _SITransferBundles complete res: %d", (uint8_t *)v5, 8u);
  }

  if (!a2)
  {
    [*(id *)(a1 + 32) setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:0];
    [*(id *)(a1 + 40) setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:0];
    sUpgradedForPriorityIndex = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)upgradeCheck
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SPCoreSpotlightIndexer_upgradeCheck__block_invoke;
  block[3] = &unk_2645063F8;
  void block[4] = self;
  if (upgradeCheck_onceToken != -1) {
    dispatch_once(&upgradeCheck_onceToken, block);
  }
}

uint64_t __38__SPCoreSpotlightIndexer_upgradeCheck__block_invoke(uint64_t result)
{
  if (sUsePriorityIndex == 1) {
    return [*(id *)(result + 32) _upgradeToPriorityIndex];
  }
  return result;
}

- (void)start
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke;
  block[3] = &unk_2645063F8;
  void block[4] = self;
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, block);
  }
}

void __31__SPCoreSpotlightIndexer_start__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(id)sDelegate indexingEnabled])
  {
    id v2 = [(id)sDelegate indexDirectory];
    uint64_t v3 = (const char *)[v2 fileSystemRepresentation];

    if (v3)
    {
      int v4 = open(v3, 0x100000);
      if (v4 == -1)
      {
        uint64_t v7 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __31__SPCoreSpotlightIndexer_start__block_invoke_cold_2();
        }
      }
      else
      {
        int v5 = v4;
        MEMORY[0x223C47560]();
        close(v5);
      }
    }
    id v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)MDBootTime()];
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v9;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Noting bootTime:%@", (uint8_t *)&buf, 0xCu);
    }
    id v10 = [MEMORY[0x263F08850] defaultManager];
    id v11 = NSString;
    id v12 = [(id)sDelegate indexDirectory];
    long long v13 = objc_msgSend(v11, "stringWithCString:encoding:", objc_msgSend(v12, "fileSystemRepresentation"), 134217984);
    *(void *)long long v38 = 0;
    uint64_t v14 = [v10 attributesOfFileSystemForPath:v13 error:v38];
    id v15 = *(id *)v38;

    if (v15)
    {
      uint64_t v16 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        buf.st_dev = 138412290;
        *(void *)&buf.st_mode = v15;
        _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "Error retrieving fsProperties: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (!v14) {
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v16 = [v14 objectForKeyedSubscript:@"NSFileSystemFreeSize"];
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (unint64_t)[v16 unsignedLongValue] >> 22 < 0x19)
        {

          id v29 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.st_dev) = 0;
            _os_log_impl(&dword_21F1CE000, v29, OS_LOG_TYPE_DEFAULT, "Very low disk space detected; opening CoreSpotlight index as read-only",
              (uint8_t *)&buf,
              2u);
          }

          uint64_t v17 = 1;
          sVeryLowDiskSpace = 1;
          goto LABEL_18;
        }
      }
    }

LABEL_17:
    uint64_t v17 = 0;
LABEL_18:
    uint64_t v18 = v17 ^ 1;
    if (isAppleInternalInstall())
    {
      memset(&buf, 0, sizeof(buf));
      if (!stat("/private/var/mobile/spotlightForceLowDisk", &buf))
      {
        uint64_t v19 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __31__SPCoreSpotlightIndexer_start__block_invoke_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
        }

        uint64_t v18 = 0;
        uint64_t v17 = 1;
        sVeryLowDiskSpace = 1;
      }
    }
    memset(&buf, 0, sizeof(buf));
    stat v27 = (const char *)turboFilePath();
    int v28 = stat(v27, &buf);
    sTurboMode = v28 == 0;
    if (!v28)
    {
      _SISetTurboMode();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v38 = 0;
        _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Start with turbo mode on", v38, 2u);
      }
    }
    if (sPrivate)
    {
      [*(id *)(a1 + 32) openIndex:v18 forInit:1 readOnly:v17];
    }
    else
    {
      if (([(id)sDelegate managedIndex] & 1) == 0) {
        [*(id *)(a1 + 32) wipeCoreSpotlightIndexForTrial];
      }
      [*(id *)(a1 + 32) openIndex:v18 forInit:1 readOnly:v17];
      uint64_t v30 = [MEMORY[0x263F02B50] sharedManager];
      [*(id *)(a1 + 32) setExtensionDelegate:v30];

      __int16 v31 = dispatch_get_global_queue(17, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_2014;
      block[3] = &unk_2645063F8;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v31, block);

      uint64_t v32 = [MEMORY[0x263F02A58] sharedInstance];
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 216), v32);

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_3;
      v36[3] = &unk_264508550;
      v36[4] = *(void *)(a1 + 32);
      [WeakRetained setDomainCleaner:v36];

      id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_5;
      v35[3] = &unk_264508578;
      v35[4] = *(void *)(a1 + 32);
      [v34 setProviderMonitor:v35];

      startAllAgents(*(void **)(a1 + 32));
    }
    return;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  startIndexAgent(v6);
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_2014(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_2;
  block[3] = &unk_2645063F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkIfExtensionsNeedToBeLoaded];
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  int v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  int v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_4;
  v9[3] = &unk_264507190;
  id v11 = &v12;
  uint64_t v6 = v4;
  id v10 = v6;
  [v5 deleteSearchableItemsWithFileProviderDomains:v3 completionHandler:v9];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fileProviderActiveProvidersChanged:a2];
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_prefsChangeSource);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_dataMigrationFinishObserver];
  [v3 removeObserver:self->_dataMigrationStartObserver];
  [v3 removeObserver:self name:*MEMORY[0x263F02B58] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SPCoreSpotlightIndexer;
  [(SPCoreSpotlightIndexer *)&v4 dealloc];
}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 block:(id)a4
{
}

- (void)_registerForPrefsChanges
{
}

void __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void *)MEMORY[0x223C480D0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v15 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke_cold_1();
    }

    uint64_t v16 = [WeakRetained prefsChangeSource];
    dispatch_source_merge_data(v16, 1uLL);
  }
}

- (void)_reindexAllItemsOnPrefsChanges
{
  p_prefsDisabledBundleIDs = &self->_prefsDisabledBundleIDs;
  objc_super v4 = self->_prefsDisabledBundleIDs;
  int v5 = [(id)sDelegate disabledBundleSet];
  objc_storeStrong((id *)p_prefsDisabledBundleIDs, v5);
  if ([(NSSet *)v4 count])
  {
    uint64_t v6 = (void *)[(NSSet *)v4 mutableCopy];
    [v6 minusSet:v5];
    if ([v6 count])
    {
      dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
      uint64_t v7 = [v6 allObjects];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__SPCoreSpotlightIndexer__reindexAllItemsOnPrefsChanges__block_invoke;
      v8[3] = &unk_2645063F8;
      v8[4] = self;
      [(SPCoreSpotlightIndexer *)self _reindexAllItemsForBundleIDs:v7 reason:@"prefs-changes" completionHandler:v8];
    }
  }
}

void __56__SPCoreSpotlightIndexer__reindexAllItemsOnPrefsChanges__block_invoke(uint64_t a1)
{
}

- (void)_reindexAllItemsForBundleIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  if ([v8 count] && v11)
  {
    id v12 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SPCoreSpotlightIndexer _reindexAllItemsForBundleIDs:reason:completionHandler:]();
    }

    long long v13 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:2];
    [v13 setReason:v9];
    uint64_t v14 = [SPCoreSpotlightIndexerTask alloc];
    char v15 = [v11 allValues];
    uint64_t v16 = [(SPCoreSpotlightIndexerTask *)v14 initWithIndexJob:v13 indexers:v15];

    [(SPCoreSpotlightIndexerTask *)v16 setBundleIDs:v8];
    [(SPCoreSpotlightIndexer *)self performIndexerTask:v16 completionHandler:v10];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

- (void)preheat
{
  id v2 = sIndexQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SPCoreSpotlightIndexer_preheat__block_invoke;
  v4[3] = &unk_2645063F8;
  void v4[4] = self;
  id v3 = _setup_block(v4, 0, 13343);
  dispatch_async(v2, v3);
}

uint64_t __33__SPCoreSpotlightIndexer_preheat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithBlock:&__block_literal_global_2027];
}

uint64_t __33__SPCoreSpotlightIndexer_preheat__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 preheat];
}

- (void)flush
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "flush", buf, 2u);
  }

  objc_super v4 = dispatch_group_create();
  int v5 = sIndexQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SPCoreSpotlightIndexer_flush__block_invoke;
  v7[3] = &unk_2645063F8;
  void v7[4] = self;
  uint64_t v6 = _setup_block(v7, 0, 13359);
  dispatch_group_async(v4, v5, v6);

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __31__SPCoreSpotlightIndexer_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithBlock:&__block_literal_global_2029];
}

void __31__SPCoreSpotlightIndexer_flush__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 index])
  {
    [v2 index];
    SISyncIndexForLikelyShutdown();
    [v2 setDirtyTimeout:256];
  }
}

- (void)commitUpdates
{
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "commitUpdates", buf, 2u);
  }

  objc_super v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  int v5 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke;
  v8[3] = &unk_2645065E8;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = _setup_block(v8, 0, 13389);
  dispatch_async(v5, v7);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

void __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke_2;
  v2[3] = &unk_2645063F8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 commitUpdatesWithCompletionHandler:v2];
}

void __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke_2(uint64_t a1)
{
}

- (void)issueSplit:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = dispatch_group_create();
  id v8 = sIndexQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __37__SPCoreSpotlightIndexer_issueSplit___block_invoke;
  v11[3] = &unk_2645065E8;
  void v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  id v10 = _setup_block(v11, 0, 13404);
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __37__SPCoreSpotlightIndexer_issueSplit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:*(void *)(a1 + 40) inferPriorityIndex:0 block:&__block_literal_global_2031];
}

uint64_t __37__SPCoreSpotlightIndexer_issueSplit___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueSplit];
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 inferPriorityIndex:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke;
  v17[3] = &unk_264508660;
  id v18 = v10;
  uint64_t v19 = self;
  BOOL v21 = a5;
  BOOL v22 = a4;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  uint64_t v14 = (void *)MEMORY[0x223C48320](v17);
  char v15 = sIndexQueue;
  uint64_t v16 = _setup_block(v14, 0, 13451);
  dispatch_async(v15, v16);
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  dispatch_group_t v3 = dispatch_group_create();
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2;
  v15[3] = &unk_264508638;
  dispatch_group_t v16 = v3;
  char v18 = *(unsigned char *)(a1 + 57);
  id v7 = v2;
  id v17 = v7;
  id v8 = v3;
  [v4 _enumerateIndexersWithProtectionClasses:v5 inferPriorityIndex:v6 block:v15];
  id v9 = dispatch_get_global_queue(17, 2uLL);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2038;
  block[3] = &unk_264506440;
  id v10 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  dispatch_group_notify(v8, v9, block);
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = logForCSLogCategoryIndex();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_2();
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2032;
    v14[3] = &unk_264508610;
    id v7 = &v15;
    id v15 = v3;
    id v8 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v9 = &v17;
    id v17 = *(id *)(a1 + 32);
    [v3 scheduleMaintenance:v14 description:@"searchutil forced maintenance" forDarkWake:1];
  }
  else
  {
    if (v6) {
      __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_1();
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    _DWORD v10[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2037;
    v10[3] = &unk_264507A90;
    id v7 = &v11;
    id v11 = v3;
    id v8 = &v12;
    id v12 = *(id *)(a1 + 40);
    id v9 = &v13;
    id v13 = *(id *)(a1 + 32);
    [v3 mergeWithCompletionHandler:v10];
  }
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2032(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  BOOL v6 = a5;
  id v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2032_cold_1();
  }

  dispatch_group_enter(v6);
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2033;
  v10[3] = &unk_2645085E8;
  id v11 = v8;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v9 = v6;
  [v11 mergeWithCompletionHandler:v10];
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2033(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) dataclass];
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "*warn* Failed to merge the index for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  id v7 = [NSNumber numberWithBool:v3 == 0];
  id v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) dataclass];
  [v8 setObject:v7 forKeyedSubscript:v9];

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2037(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) dataclass];
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "*warn* Failed to merge the index for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  id v7 = [NSNumber numberWithBool:v3 == 0];
  id v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) dataclass];
  [v8 setObject:v7 forKeyedSubscript:v9];

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2038(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C480D0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power___block_invoke;
  v9[3] = &unk_264508578;
  int v10 = v7;
  id v8 = v7;
  [(SPCoreSpotlightIndexer *)self mergeWithProtectionClasses:v6 power:v4 completionHandler:v9];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __59__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power___block_invoke(uint64_t a1)
{
}

- (void)mergeWithProtectionClasses:(id)a3 completionHandler:(id)a4
{
}

- (void)cleanupStringsWithProtectionClasses:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke;
  v13[3] = &unk_264507140;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  int v10 = (void *)MEMORY[0x223C48320](v13);
  id v11 = sIndexQueue;
  __int16 v12 = _setup_block(v10, 0, 13487);
  dispatch_async(v11, v12);
}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  dispatch_group_t v3 = dispatch_group_create();
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2;
  v14[3] = &unk_264508688;
  dispatch_group_t v15 = v3;
  id v6 = v2;
  id v16 = v6;
  id v7 = v3;
  [v4 _enumerateIndexersWithProtectionClasses:v5 block:v14];
  id v8 = dispatch_get_global_queue(9, 2uLL);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2039;
  v11[3] = &unk_264506440;
  id v9 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_group_notify(v7, v8, v11);
}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_3;
  v5[3] = &unk_264507A90;
  id v6 = v3;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v4 = v3;
  [v4 cleanupStringsWithCompletionHandler:v5];
}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) dataclass];
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Failed to cleanup the strings for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  id v7 = [NSNumber numberWithBool:v3 == 0];
  id v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) dataclass];
  [v8 setObject:v7 forKeyedSubscript:v9];

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2039(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C480D0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)issueRepair:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = dispatch_group_create();
  id v8 = sIndexQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __38__SPCoreSpotlightIndexer_issueRepair___block_invoke;
  v11[3] = &unk_2645065E8;
  void v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  int v10 = _setup_block(v11, 0, 13500);
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __38__SPCoreSpotlightIndexer_issueRepair___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:*(void *)(a1 + 40) inferPriorityIndex:0 block:&__block_literal_global_2041];
}

uint64_t __38__SPCoreSpotlightIndexer_issueRepair___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueRepair];
}

- (void)issueCleanup:(id)a3 flags:(int)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  if (v6)
  {
    v15[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = dispatch_group_create();
  id v9 = sIndexQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke;
  v12[3] = &unk_264506728;
  void v12[4] = self;
  id v13 = v7;
  int v14 = a4;
  id v10 = v7;
  id v11 = _setup_block(v12, 0, 13515);
  dispatch_group_async(v8, v9, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke_2;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  int v5 = *(_DWORD *)(a1 + 48);
  return [v2 _enumerateIndexersWithProtectionClasses:v1 inferPriorityIndex:0 block:v4];
}

uint64_t __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cleanupStringsWithActivity:0 group:0 shouldDefer:0 flags:*(unsigned int *)(a1 + 32)];
}

- (void)issueDefrag:(id)a3 group:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v17[0] = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  }
  else
  {
    id v8 = 0;
  }
  dispatch_group_t v9 = v7;
  if (!v7) {
    dispatch_group_t v9 = dispatch_group_create();
  }
  id v10 = sIndexQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke;
  v14[3] = &unk_2645064D0;
  void v14[4] = self;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = _setup_block(v14, 0, 13533);
  dispatch_group_async(v12, v10, v13);

  if (!v7) {
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke_2;
  v3[3] = &unk_2645085C0;
  id v4 = *(id *)(a1 + 48);
  [v1 _enumerateIndexersWithProtectionClasses:v2 inferPriorityIndex:0 block:v3];
}

uint64_t __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueDefrag:*(void *)(a1 + 32)];
}

- (void)issueLoadTrial:(id)a3
{
}

- (void)issueSharedDocumentAttributeFixup
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "issueSharedDocumentAttributeFixup is not supported on iOS.", v2, v3, v4, v5, v6);
}

- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke;
  v10[3] = &unk_2645086F8;
  id v11 = v6;
  unint64_t v12 = a3;
  void v10[4] = self;
  id v8 = v6;
  dispatch_group_t v9 = _setup_block(v10, 0, 13655);
  dispatch_async(v7, v9);
}

void __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  v8[0] = *MEMORY[0x263F08098];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2;
  v5[3] = &unk_2645086D0;
  uint64_t v4 = (void *)a1[5];
  uint64_t v7 = a1[6];
  id v6 = v4;
  [v2 _enumerateIndexersWithProtectionClasses:v3 block:v5];
}

uint64_t __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueDumpReverse:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
}

- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke;
  v10[3] = &unk_2645086F8;
  id v11 = v6;
  unint64_t v12 = a3;
  void v10[4] = self;
  id v8 = v6;
  dispatch_group_t v9 = _setup_block(v10, 0, 13664);
  dispatch_async(v7, v9);
}

void __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  v8[0] = *MEMORY[0x263F08098];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2;
  v5[3] = &unk_2645086D0;
  uint64_t v4 = (void *)a1[5];
  uint64_t v7 = a1[6];
  id v6 = v4;
  [v2 _enumerateIndexersWithProtectionClasses:v3 block:v5];
}

uint64_t __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueDumpForward:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
}

- (id)issueHeartbeat
{
  uint64_t v2 = [MEMORY[0x263F78D00] lastLoadedContentVersion];
  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  uint64_t v3 = indexHeartbeatPath();
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  time_t v5 = time(0);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v3];

  id v8 = 0;
  if (v7)
  {
    dispatch_group_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v3];
    if (v2)
    {
      id v10 = [NSNumber numberWithUnsignedLongLong:v2];
      [v9 setObject:v10 forKeyedSubscript:@"otaversion"];
    }
    id v11 = [MEMORY[0x263EFF980] array];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __40__SPCoreSpotlightIndexer_issueHeartbeat__block_invoke;
    v28[3] = &unk_264508720;
    id v29 = v11;
    id v30 = v4;
    time_t v31 = v5;
    id v12 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v28];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __40__SPCoreSpotlightIndexer_issueHeartbeat__block_invoke_2;
    v26[3] = &unk_264508748;
    id v8 = v9;
    id v27 = v8;
    [v12 enumerateObjectsUsingBlock:v26];
    id v13 = [NSNumber numberWithLong:0];
    [v8 setObject:v13 forKeyedSubscript:@"pcA_wipes"];

    int v14 = [NSNumber numberWithLong:0];
    [v8 setObject:v14 forKeyedSubscript:@"pcB_wipes"];

    id v15 = [NSNumber numberWithLong:0];
    [v8 setObject:v15 forKeyedSubscript:@"pcC_wipes"];

    id v16 = [NSNumber numberWithLong:0];
    [v8 setObject:v16 forKeyedSubscript:@"pcCX_wipes"];

    id v17 = [NSNumber numberWithLong:0];
    [v8 setObject:v17 forKeyedSubscript:@"pcPriority_wipes"];

    char v18 = [NSNumber numberWithLong:v5];
    [v8 setObject:v18 forKeyedSubscript:@"lastSent"];
  }
  uint64_t v19 = [NSURL fileURLWithPath:v3];
  id v25 = 0;
  [v8 writeToURL:v19 error:&v25];
  id v20 = v25;

  if (v20)
  {
    BOOL v21 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SPCoreSpotlightIndexer issueHeartbeat]();
    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);
  id v24 = v4;
  AnalyticsSendEventLazy();
  id v22 = v24;

  return v22;
}

void __40__SPCoreSpotlightIndexer_issueHeartbeat__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    if (([&unk_26D0C8CC8 containsObject:v6] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v6];
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 isEqualToString:@"build"] & 1) == 0) {
        [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
      }
      goto LABEL_11;
    }
    id v7 = v5;
    if (([v6 hasSuffix:@"_age"] & 1) != 0
      || ([v6 isEqualToString:@"timesinceboot"] & 1) != 0
      || [v6 isEqualToString:@"timesinceupdate"])
    {
      if (([v7 longValue] & 0x8000000000000000) == 0)
      {
        id v8 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(a1 + 48) - objc_msgSend(v7, "longValue"));
        [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];
      }
      goto LABEL_9;
    }
    if (([v6 hasSuffix:@"_wipes"] & 1) != 0
      || ([v6 hasSuffix:@"_wipes_aggregate"] & 1) != 0
      || [v6 hasSuffix:@"_obj_count"])
    {
      if ([v7 longValue] < 0)
      {
LABEL_9:

LABEL_11:
        goto LABEL_12;
      }
    }
    else if ([v6 isEqualToString:@"lastSent"])
    {
      goto LABEL_9;
    }
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
    goto LABEL_9;
  }
LABEL_12:
}

uint64_t __40__SPCoreSpotlightIndexer_issueHeartbeat__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:a2];
}

id __40__SPCoreSpotlightIndexer_issueHeartbeat__block_invoke_2061(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)dumpIndexAgesAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  time_t v5 = time(0);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v3];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v3];
    id v9 = [MEMORY[0x263EFF980] array];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__SPCoreSpotlightIndexer_dumpIndexAgesAtPath___block_invoke;
    v12[3] = &unk_264508720;
    id v13 = v9;
    id v14 = v4;
    time_t v15 = v5;
    id v10 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
    [v8 removeObjectsForKeys:v10];
  }
  return v4;
}

void __46__SPCoreSpotlightIndexer_dumpIndexAgesAtPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    if ([&unk_26D0C8CC8 containsObject:v6])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v5;
        if ((([v6 hasSuffix:@"_age"] & 1) != 0
           || ([v6 isEqualToString:@"timesinceboot"] & 1) != 0
           || ([v6 isEqualToString:@"timesinceupdate"] & 1) != 0
           || [v6 isEqualToString:@"lastSent"])
          && ([v7 longValue] & 0x8000000000000000) == 0)
        {
          id v8 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(a1 + 48) - objc_msgSend(v7, "longValue"));
          [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];
        }
        else
        {
          [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

- (id)dumpIndexAges
{
  pthread_rwlock_rdlock(&sIndexHeartbeatLock);
  id v3 = indexHeartbeatPath();
  uint64_t v4 = [(SPCoreSpotlightIndexer *)self dumpIndexAgesAtPath:v3];
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

  return v4;
}

- (id)dumpIndexAnalyticsAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  time_t v5 = time(0);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v3];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v3];
    id v9 = [MEMORY[0x263EFF980] array];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__SPCoreSpotlightIndexer_dumpIndexAnalyticsAtPath___block_invoke;
    v12[3] = &unk_264508720;
    id v13 = v9;
    id v14 = v4;
    time_t v15 = v5;
    id v10 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
    [v8 removeObjectsForKeys:v10];
  }
  return v4;
}

void __51__SPCoreSpotlightIndexer_dumpIndexAnalyticsAtPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v14;
      id v7 = v5;
      if ([&unk_26D0C8CE0 containsObject:v6])
      {
        uint64_t v8 = [v7 longValue];
        id v9 = NSNumber;
        if (v8 < 0)
        {
          id v12 = NSNumber;
          uint64_t v11 = -1;
        }
        else
        {
          uint64_t v10 = *(void *)(a1 + 48);
          uint64_t v11 = v10 - [v7 longValue];
          id v12 = v9;
        }
        id v13 = [v12 numberWithLong:v11];
        [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v6];
      }
      else
      {
        [*(id *)(a1 + 32) addObject:v6];
      }
    }
  }
}

- (id)dumpIndexAnalytics
{
  pthread_rwlock_rdlock(&sIndexOpenRecordLock);
  id v3 = indexOpenRecordPath();
  uint64_t v4 = [(SPCoreSpotlightIndexer *)self dumpIndexAnalyticsAtPath:v3];
  pthread_rwlock_unlock(&sIndexOpenRecordLock);

  return v4;
}

- (id)sendAnalytics:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"heartbeat"])
  {
    id v5 = [(SPCoreSpotlightIndexer *)self issueHeartbeat];
  }
  else if ([v4 hasPrefix:@"indexloss"])
  {
    id v6 = [v4 componentsSeparatedByString:@"-"];
    id v7 = [v6 objectAtIndexedSubscript:1];
    uint64_t v8 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
    id v9 = [v8 objectForKeyedSubscript:v7];

    LOBYTE(v11) = 0;
    id v5 = [v9 indexLossAnalyticsDictWithPreviousIndexCreationDate:0 size:0 openingInReadOnly:0 fullyCreated:1 markedPurgeable:0 vectorIndexDrop:0 forAnalytics:v11];
    AnalyticsSendEventLazy();
  }
  else
  {
    id v5 = &unk_26D0C90A8;
  }

  return v5;
}

id __40__SPCoreSpotlightIndexer_sendAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)fileProviderProtectionClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F08098];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v15 = a4;
  _checkUnlock();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  void v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  id v6 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(id)objc_opt_class() fileProviderProtectionClasses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [(NSDictionary *)self->_concreteIndexers objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * v10)];
        if (v11)
        {
          dispatch_group_enter(v6);
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          void v20[2] = __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke;
          v20[3] = &unk_264507190;
          id v22 = v27;
          BOOL v21 = v6;
          [v11 deleteSearchableItemsWithFileProviderDomains:v16 completionHandler:v20];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  id v12 = sIndexQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2;
  v17[3] = &unk_264508798;
  void v17[4] = self;
  id v13 = v15;
  id v18 = v13;
  uint64_t v19 = v27;
  id v14 = _setup_block(v17, 0, 13875);
  dispatch_group_notify(v6, v12, v14);

  _Block_object_dispose(v27, 8);
}

void __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)issuePathFixup:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  id v6 = sIndexQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke;
  v9[3] = &unk_2645065E8;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  uint64_t v8 = _setup_block(v9, 0, 13886);
  dispatch_group_async(v5, v6, v8);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  [v1 _enumerateIndexersWithProtectionClasses:v2 inferPriorityIndex:0 block:&__block_literal_global_2080];
}

uint64_t __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fixupPathTimeouts];
}

- (void)issueResolveFPItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  if (!v5)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];
    id v12 = 0;
    id v10 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v7 = +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:v5 recursively:1 timeout:-1];
  uint64_t v8 = NSString;
  uint64_t v9 = [v7 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"itemID: %@ parents[%@]", v5, v9];

  uint64_t v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v12 = [v10 dataUsingEncoding:4];

  id v13 = 0;
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v12, v13);
LABEL_6:
}

- (void)issueResolveFPItemForBundle:(id)a3 domain:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 length];
  id v15 = (void *)*MEMORY[0x263F05360];
  if (v14) {
    id v15 = v11;
  }
  id v16 = v15;
  id v17 = (void *)[objc_alloc(MEMORY[0x263F054B8]) initWithProviderID:v10 domainIdentifier:v16 coreSpotlightIdentifier:v12];
  id v18 = logForCSLogCategoryIndex();
  uint64_t v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138413058;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "bundle: %@ domain: %@ identifier: %@ ->  %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_error_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_ERROR, "Failed to resolve FPItemID for bundle: %@ domain: %@ identifier: %@", (uint8_t *)&v20, 0x20u);
  }

  [(SPCoreSpotlightIndexer *)self issueResolveFPItem:v17 completionHandler:v13];
}

- (void)issueResolveFPItemForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SPConcreteCoreSpotlightIndexer fetchItemForURL:v6];
  uint64_t v9 = [v8 itemID];
  id v10 = logForCSLogCategoryIndex();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "Resolved %@ ->  %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[SPCoreSpotlightIndexer issueResolveFPItemForURL:completionHandler:]();
  }

  [(SPCoreSpotlightIndexer *)self issueResolveFPItem:v9 completionHandler:v7];
}

- (void)issueConsistencyCheck:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = dispatch_group_create();
  uint64_t v8 = sIndexQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke;
  v11[3] = &unk_2645065E8;
  void v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  id v10 = _setup_block(v11, 0, 13954);
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:*(void *)(a1 + 40) inferPriorityIndex:0 block:&__block_literal_global_2088];
}

uint64_t __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueConsistencyCheck];
}

- (void)issueDuplicateOidCheckWithGroup:(id)a3 protected:(BOOL)a4
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke;
  v8[3] = &unk_264506700;
  BOOL v9 = a4;
  v8[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C48320](v8);
  id v6 = sIndexQueue;
  id v7 = _setup_block(v5, 0, 13980);
  dispatch_group_async(v4, v6, v7);
}

void __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40))
  {
    _checkUnlock();
    uint64_t v2 = *MEMORY[0x263F08088];
    v8[0] = *MEMORY[0x263F08080];
    v8[1] = v2;
    void v8[2] = *MEMORY[0x263F080A0];
    id v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = v8;
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F08098];
    id v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = &v7;
    uint64_t v5 = 1;
  }
  id v6 = [v3 arrayWithObjects:v4 count:v5];
  [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:v6 block:&__block_literal_global_2090];
}

uint64_t __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueDuplicateOidCheck];
}

- (void)issueDuplicateOidCheck:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = sIndexQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke;
  v11[3] = &unk_2645065E8;
  void v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  id v10 = _setup_block(v11, 0, 13992);
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:*(void *)(a1 + 40) inferPriorityIndex:0 block:&__block_literal_global_2092];
}

uint64_t __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueDuplicateOidCheck];
}

- (void)issueMessagesFixup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __45__SPCoreSpotlightIndexer_issueMessagesFixup___block_invoke;
  v8[3] = &unk_264507168;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = _setup_block(v8, 0, 14006);
  dispatch_async(v5, v7);
}

void __45__SPCoreSpotlightIndexer_issueMessagesFixup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) concreteIndexerForProtectionClass:*MEMORY[0x263F08098] andBundleID:@"com.apple.MobileSMS"];
  if (v2)
  {
    id v5 = v2;
    [v2 readyIndex:0];
    [v5 issueMessagesFixup:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      goto LABEL_6;
    }
    id v5 = 0;
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  uint64_t v2 = v5;
LABEL_6:
}

- (void)coolDown
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  dispatch_group_t v3 = dispatch_group_create();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __34__SPCoreSpotlightIndexer_coolDown__block_invoke;
  v5[3] = &unk_2645085C0;
  dispatch_group_t v6 = v3;
  id v4 = v3;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:0 block:v5];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __34__SPCoreSpotlightIndexer_coolDown__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __34__SPCoreSpotlightIndexer_coolDown__block_invoke_2;
  v8[3] = &unk_2645065E8;
  id v9 = v3;
  id v5 = *(NSObject **)(a1 + 32);
  id v10 = v5;
  id v6 = v3;
  uint64_t v7 = _setup_block(v8, 0, 14018);
  dispatch_group_async(v5, v4, v7);
}

uint64_t __34__SPCoreSpotlightIndexer_coolDown__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) coolDown:*(void *)(a1 + 40)];
}

- (void)shrink:(unint64_t)a3
{
  id v3 = sIndexQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __33__SPCoreSpotlightIndexer_shrink___block_invoke;
  v5[3] = &unk_2645066B0;
  void v5[4] = self;
  v5[5] = a3;
  id v4 = _setup_block(v5, 0, 14029);
  dispatch_async(v3, v4);
}

uint64_t __33__SPCoreSpotlightIndexer_shrink___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  void v3[2] = __33__SPCoreSpotlightIndexer_shrink___block_invoke_2;
  v3[3] = &__block_descriptor_40_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 _enumerateIndexersWithProtectionClasses:0 block:v3];
}

uint64_t __33__SPCoreSpotlightIndexer_shrink___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shrink:*(void *)(a1 + 32)];
}

- (void)_closeIndexWithIndexers:(id)a3
{
  void v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  CFTypeRef cf = 0;
  v19[0] = @"MKBAssertionKey";
  v19[1] = @"MKBAssertionTimeout";
  v20[0] = @"Other";
  v20[1] = &unk_26D0C9028;
  [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v5 = (void *)MKBDeviceLockAssertion();
  id v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    CFTypeRef v18 = cf;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Took lock assertion for close %@, err: %@", buf, 0x16u);
  }

  uint64_t v7 = dispatch_group_create();
  uint64_t v8 = sIndexQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__SPCoreSpotlightIndexer__closeIndexWithIndexers___block_invoke;
  v12[3] = &unk_2645063F8;
  id v9 = v4;
  id v13 = v9;
  id v10 = _setup_block(v12, 0, 14050);
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "Releasing assertion %@", buf, 0xCu);
  }
}

void __50__SPCoreSpotlightIndexer__closeIndexWithIndexers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (!deviceUnlocked) {
          SIResumeForUnlock();
        }
        [v6 closeIndex];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)closeIndex
{
  id v4 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  uint64_t v3 = [v4 allValues];
  [(SPCoreSpotlightIndexer *)self _closeIndexWithIndexers:v3];
}

- (void)shutdown
{
  uint64_t v3 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  [(SPCoreSpotlightIndexer *)self setConcreteIndexers:0];
  suspendAllAgents();
  SIWaitForAllIndexShutdown();
  id v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "SPCoreSpotlightIndexer shutdown complete", v5, 2u);
  }
}

- (void)recycleIndex:(BOOL)a3
{
  id v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Recycling index", buf, 2u);
  }

  [(SPCoreSpotlightIndexer *)self closeIndex];
  id v6 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __39__SPCoreSpotlightIndexer_recycleIndex___block_invoke;
  v8[3] = &unk_264506700;
  void v8[4] = self;
  BOOL v9 = a3;
  long long v7 = _setup_block(v8, 0, 14076);
  dispatch_async(v6, v7);
}

uint64_t __39__SPCoreSpotlightIndexer_recycleIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openIndex:0 readOnly:*(unsigned __int8 *)(a1 + 40)];
}

- (void)markIndexPurgeable:(BOOL)a3
{
  uint64_t v3 = sIndexQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __45__SPCoreSpotlightIndexer_markIndexPurgeable___block_invoke;
  v5[3] = &unk_264506700;
  void v5[4] = self;
  BOOL v6 = a3;
  id v4 = _setup_block(v5, 0, 14093);
  dispatch_async(v3, v4);
}

void __45__SPCoreSpotlightIndexer_markIndexPurgeable___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "concreteIndexers", 0);
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 40))
        {
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _shouldPurge])
          {
            [v8 _createPurgeableTouchFile];
            BOOL v9 = [v8 _indexPath];
            [v8 markDirectoryAtomicallyPurgeable:v9 purgeableOrNot:*(unsigned __int8 *)(a1 + 40)];
          }
        }
        else if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _hasPurgeableTouchFile])
        {
          long long v10 = [v8 _indexPath];
          [v8 markDirectoryAtomicallyPurgeable:v10 purgeableOrNot:*(unsigned __int8 *)(a1 + 40)];

          [v8 _removePurgeableTouchFile];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)recycleAndPurgeIndex
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Converting CoreSpotlight index to read-only", (uint8_t *)&v11, 2u);
  }

  uint64_t v3 = +[SPCoreSpotlightIndexer sharedInstance];
  [v3 recycleIndex:1];

  unint64_t v4 = +[SPCoreSpotlightIndexer freeIndexDiskSpace];
  unint64_t v5 = +[SPCoreSpotlightIndexer totalIndexDiskSpace];
  if (100 * v4 / v5 < 6 || v4 <= 0x357900000)
  {
    unint64_t v7 = v5;
    long long v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(id)sDelegate indexDirectory];
      int v11 = 138412802;
      long long v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = v4;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Marking CoreSpotlight index files purgeable under %@. freeDiskSpace %lu, totalDiskSpace %lu", (uint8_t *)&v11, 0x20u);
    }
    long long v10 = +[SPCoreSpotlightIndexer sharedInstance];
    [v10 markIndexPurgeable:1];
  }
}

- (void)restoreIndexAndClearPurgeable
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Converting CoreSpotlight index to read-write", (uint8_t *)&v11, 2u);
  }

  uint64_t v3 = +[SPCoreSpotlightIndexer sharedInstance];
  [v3 recycleIndex:0];

  unint64_t v4 = +[SPCoreSpotlightIndexer freeIndexDiskSpace];
  unint64_t v5 = +[SPCoreSpotlightIndexer totalIndexDiskSpace];
  if (100 * v4 / v5 >= 0xB && v4 >= 0x657900001)
  {
    unint64_t v7 = v5;
    long long v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(id)sDelegate indexDirectory];
      int v11 = 138412802;
      long long v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = v4;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Clearing CoreSpotlight index files purgeable under %@. freeDiskSpace %lu, totalDiskSpace %lu", (uint8_t *)&v11, 0x20u);
    }
    long long v10 = +[SPCoreSpotlightIndexer sharedInstance];
    [v10 markIndexPurgeable:0];
  }
}

- (void)queryPreheat:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke;
  v8[3] = &unk_2645065E8;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  unint64_t v7 = _setup_block(v8, 0, 14326);
  dispatch_async(v5, v7);
}

void __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSHomeDirectory();
  uint64_t v3 = [v2 stringByAppendingString:@"/Library/Spotlight/Assets"];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v12 = 0,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v12],
        id v7 = v12,
        v6,
        !v7))
  {
    long long v8 = [MEMORY[0x263F78D00] sharedResourcesManager];
    id v9 = (void *)MEMORY[0x263EFFA08];
    long long v10 = [MEMORY[0x263EFF960] preferredLanguages];
    int v11 = [v9 setWithArray:v10];
    [v8 fetchAllParametersForLanguages:v11 resourcePath:v3];

    id v7 = 0;
  }
  else
  {
    long long v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_cold_1();
    }
  }

  [*(id *)(a1 + 32) _enumerateIndexersWithProtectionClasses:*(void *)(a1 + 40) block:&__block_literal_global_2102];
}

uint64_t __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_2100(uint64_t a1, void *a2)
{
  return [a2 preheat];
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2112(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!v7)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (!a3)
    {
LABEL_12:
      [*(id *)(a1 + 40) schedule];
      goto LABEL_13;
    }
    long long v10 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) queryID];
      int v11 = *(void **)(a1 + 48);
      int v21 = 67109634;
      *(_DWORD *)__int16 v22 = v12;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v8;
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "*warn* Index not available task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x1Cu);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![*(id *)(a1 + 40) addJob:v7])
  {
    [v7 cancel];
    long long v10 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 40) queryID];
      int v18 = v17;
      uint64_t v19 = [v7 dataclass];
      uint64_t v20 = *(void *)(a1 + 48);
      int v21 = 134218754;
      *(void *)__int16 v22 = v7;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v18;
      __int16 v23 = 2112;
      __int16 v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      _os_log_debug_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEBUG, "Canceled job:%p, task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x26u);
    }
    goto LABEL_11;
  }
  id v9 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 40) queryID];
    int v14 = v13;
    __int16 v15 = [v7 dataclass];
    uint64_t v16 = *(void *)(a1 + 48);
    int v21 = 134218754;
    *(void *)__int16 v22 = v7;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v14;
    __int16 v23 = 2112;
    __int16 v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    _os_log_debug_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_DEBUG, "Started job:%p, task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x26u);
  }
LABEL_13:
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2114(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (!v11) {
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2114_cold_1();
  }
  int v12 = v11;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      uint64_t v22 = *(void *)(a1 + 64);
      __int16 v23 = [v12 dataclass];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v22 + 16))(v22, a3, a4, a5, a6, v23);

      goto LABEL_20;
    }
    if (![*(id *)(a1 + 40) priorityIndexQuery]) {
      goto LABEL_9;
    }
    int v13 = [v12 dataclass];
    if ([v13 isEqual:@"Priority"])
    {
      char v14 = [*(id *)(a1 + 40) live];

      if (v14)
      {
LABEL_9:
        ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        [*(id *)(a1 + 48) removeJob:v12];
        uint64_t v16 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = *(void *)(a1 + 48);
          __int16 v25 = [v12 dataclass];
          uint64_t v26 = *(void *)(a1 + 56);
          int v27 = 134218754;
          uint64_t v28 = v12;
          __int16 v29 = 2048;
          uint64_t v30 = v24;
          __int16 v31 = 2112;
          uint64_t v32 = v25;
          __int16 v33 = 2112;
          uint64_t v34 = v26;
          _os_log_debug_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEBUG, "Finished job:%p, task:%p, dataclass:%@, bundleID:%@", (uint8_t *)&v27, 0x2Au);
        }
LABEL_18:
        [*(id *)(a1 + 48) schedule];
        goto LABEL_20;
      }
      uint64_t v15 = *(void *)(a1 + 64);
      int v13 = [v12 dataclass];
      (*(void (**)(uint64_t, uint64_t, void, void, void, void *))(v15 + 16))(v15, 2, 0, 0, 0, v13);
    }

    goto LABEL_9;
  }
  uint64_t v17 = *(void *)(a1 + 64);
  int v18 = [v12 dataclass];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v17 + 16))(v17, 2, a4, a5, a6, v18);

  if (++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == *(void *)(a1 + 88))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v19 = logForCSLogCategoryQuery();
    uint64_t v20 = [*(id *)(a1 + 48) queryID];
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v21 = v20;
      if (os_signpost_enabled(v19))
      {
        LOWORD(v27) = 0;
        _os_signpost_emit_with_name_impl(&dword_21F1CE000, v19, OS_SIGNPOST_INTERVAL_END, v21, "SPCoreSpotlightLatency", (const char *)&unk_21F27672A, (uint8_t *)&v27, 2u);
      }
    }
  }
  if (*(unsigned char *)(a1 + 96)) {
    goto LABEL_18;
  }
LABEL_20:
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2117(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2117_cold_1();
  }

  if (([WeakRetained canceled] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) nextObject];
    if (v4)
    {
      char v5 = v4;
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      [v4 startQueryWithQueryTask:WeakRetained startHandler:*(void *)(a1 + 56) eventHandler:*(void *)(a1 + 64) resultsHandler:*(void *)(a1 + 72)];
LABEL_18:

      goto LABEL_19;
    }
  }
  if (([WeakRetained willAsyncStart] & 1) == 0 && objc_msgSend(WeakRetained, "siQuery"))
  {
    [WeakRetained siQuery];
    SIQueryRelease();
    [WeakRetained setSiQuery:0];
  }
  if (([WeakRetained finished] & 1) == 0
    && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                + 24))
  {
    if (*(unsigned char *)(a1 + 112) || !*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      char v5 = 0;
    }
    else
    {
      char v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01CD0] code:-2001 userInfo:0];
    }
    [WeakRetained finishWithError:v5];
    id v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 134218754;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      id v15 = WeakRetained;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_debug_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEBUG, "Finished all jobs(%ld,%ld), task:%p bundleID:%@", (uint8_t *)&v10, 0x2Au);
    }

    goto LABEL_18;
  }
LABEL_19:
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2118(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2117_cold_1();
  }

  if (([WeakRetained canceled] & 1) == 0)
  {
    id v4 = 0;
    do
    {
      char v5 = [*(id *)(a1 + 40) nextObject];

      if (!v5) {
        break;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      [v5 startQueryWithQueryTask:WeakRetained startHandler:*(void *)(a1 + 56) eventHandler:*(void *)(a1 + 64) resultsHandler:*(void *)(a1 + 72)];
      id v4 = v5;
    }
    while (![WeakRetained canceled]);
  }
  if (([WeakRetained willAsyncStart] & 1) == 0 && objc_msgSend(WeakRetained, "siQuery"))
  {
    [WeakRetained siQuery];
    SIQueryRelease();
    [WeakRetained setSiQuery:0];
  }
  if (([WeakRetained finished] & 1) == 0
    && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                + 24))
  {
    if (*(unsigned char *)(a1 + 112) || !*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01CD0] code:-2001 userInfo:0];
    }
    [WeakRetained finishWithError:v6];
    uint64_t v7 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 134218754;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      id v16 = WeakRetained;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_debug_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEBUG, "Finished all jobs(%ld,%ld), task:%p bundleID:%@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2119(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)_startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer _startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }

  uint64_t v18 = [(SPCoreSpotlightIndexer *)self _taskForQueryWithQueryString:v16 queryContext:v15 eventHandler:v14 resultsHandler:v13 completionHandler:v12];

  [(SPCoreSpotlightIndexer *)self startQueryTask:v18];
  return v18;
}

- (id)startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }

  uint64_t v18 = [(SPCoreSpotlightIndexer *)self taskForQueryWithQueryString:v16 queryContext:v15 eventHandler:v14 resultsHandler:v13 completionHandler:v12];

  [(SPCoreSpotlightIndexer *)self startQueryTask:v18];
  return v18;
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]();
  }

  uint64_t v18 = [(SPCoreSpotlightIndexer *)self _taskForQueryWithQueryString:v16 queryContext:v15 eventHandler:v14 resultsHandler:v13 completionHandler:v12];

  return v18;
}

- (id)startQuery:(id)a3 withContext:(id)a4 eventHandler:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer startQuery:withContext:eventHandler:handler:]();
  }

  id v15 = [(SPCoreSpotlightIndexer *)self _startQueryWithQueryString:v13 queryContext:v12 eventHandler:v11 resultsHandler:v10 completionHandler:0];

  return v15;
}

- (id)startQuery:(id)a3 withContext:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer startQuery:withContext:eventHandler:handler:]();
  }

  id v12 = [(SPCoreSpotlightIndexer *)self _startQueryWithQueryString:v10 queryContext:v9 eventHandler:0 resultsHandler:v8 completionHandler:0];

  return v12;
}

- (void)cancelQuery:(id)a3
{
}

- (void)recordEngagementForBundleID:(id)a3 uniqueIdentifier:(id)a4 protectionClass:(id)a5 userQuery:(id)a6 date:(id)a7
{
}

+ (id)_mergedTokenRewrites:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v27 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v5;
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
        uint64_t v7 = [v6 originalToken];
        uint64_t v8 = [v27 objectForKeyedSubscript:v7];

        __int16 v29 = (void *)v8;
        if (!v8)
        {
          uint64_t v9 = [MEMORY[0x263EFF980] array];
          id v10 = [v6 originalToken];
          __int16 v29 = (void *)v9;
          [v27 setObject:v9 forKeyedSubscript:v10];
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v11 = [v6 variations];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              __int16 v17 = NSString;
              uint64_t v18 = [v6 originalToken];
              uint64_t v19 = [v16 variation];
              uint64_t v20 = [v17 stringWithFormat:@"%@/%@/%ld", v18, v19, objc_msgSend(v16, "type")];

              if (([v4 containsObject:v20] & 1) == 0)
              {
                [v4 addObject:v20];
                [v29 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v13);
        }

        uint64_t v5 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v26);
  }

  os_signpost_id_t v21 = [MEMORY[0x263EFF980] array];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke;
  v30[3] = &unk_264508880;
  id v22 = v21;
  id v31 = v22;
  [v27 enumerateKeysAndObjectsUsingBlock:v30];

  return v22;
}

void __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F55700]) initWithOriginalToken:v5 variations:v6];
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    uint64_t v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke_cold_1(v5, v8);
    }
  }
}

- (void)rewriteQueryWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 rewriteHandler:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v42 = a6;
  id v12 = a5;
  uint64_t v13 = [v11 queryID];
  int v14 = [v11 rankingType];
  id v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = CSRedactString(v10, 0);
    long long v38 = (void *)v37;
    long long v39 = @"NO";
    *(_DWORD *)stat buf = 134218498;
    uint64_t v60 = v13;
    __int16 v61 = 2112;
    if (v14 == 1) {
      long long v39 = @"YES";
    }
    uint64_t v62 = v37;
    __int16 v63 = 2112;
    uint64_t v64 = v39;
    _os_log_debug_impl(&dword_21F1CE000, v15, OS_LOG_TYPE_DEBUG, "[rewrite] qid=%ld rewriteQueryWithQueryString=%@ top_hit=%@", buf, 0x20u);
  }
  id v16 = +[SPConcreteCoreSpotlightIndexer _tokensMaxCountFromMatchInfo:v12];

  __int16 v17 = [v11 userQuery];
  uint64_t v18 = +[SPConcreteCoreSpotlightIndexer _setOfTokensToCorrect:v17 tokenMatchInfo:v16];

  uint64_t v19 = (void *)v18;
  uint64_t v41 = v13;
  uint64_t v20 = +[SPConcreteCoreSpotlightIndexer _indexIndependentTokenRewritesWithMatchInfo:v16 queryID:v13 setOfTokensToCorrect:v18];
  os_signpost_id_t v21 = [v11 protectionClasses];
  if (![v21 count])
  {
    uint64_t v22 = [(id)objc_opt_class() allProtectionClasses];

    os_signpost_id_t v21 = (void *)v22;
  }
  uint64_t v43 = [MEMORY[0x263EFF980] array];
  dispatch_group_t group = dispatch_group_create();
  __int16 v23 = [v11 bundleIDs];
  if (![v23 count])
  {

    long long v33 = group;
    goto LABEL_8;
  }
  [v11 bundleIDs];
  v24 = id v40 = v10;
  [v24 objectAtIndexedSubscript:0];
  id v25 = v11;
  uint64_t v26 = v21;
  int v27 = v16;
  uint64_t v28 = self;
  __int16 v29 = v20;
  v31 = uint64_t v30 = v19;
  char v32 = [v31 isEqualToString:@"com.apple.mobileslideshow"];

  uint64_t v19 = v30;
  uint64_t v20 = v29;
  self = v28;
  id v16 = v27;
  os_signpost_id_t v21 = v26;
  id v11 = v25;

  id v10 = v40;
  long long v33 = group;
  if ((v32 & 1) == 0)
  {
LABEL_8:
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke;
    v52[3] = &unk_2645088D0;
    uint64_t v53 = v33;
    id v54 = v10;
    id v55 = v11;
    id v56 = v16;
    id v57 = v19;
    id v58 = v43;
    [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v21 block:v52];
  }
  if (v42)
  {
    qos_class_t v34 = qos_class_self();
    long long v35 = dispatch_get_global_queue(v34, 2uLL);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_4;
    v45[3] = &unk_2645088F8;
    id v46 = v43;
    id v47 = v20;
    id v48 = v11;
    uint64_t v51 = v41;
    id v50 = v42;
    id v49 = v10;
    long long v36 = _setup_block(v45, 0, 14714);
    dispatch_group_notify(group, v35, v36);

    long long v33 = group;
  }
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = sIndexQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_2;
  v7[3] = &unk_2645088A8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = _setup_block(v7, 0, 14691);
  dispatch_async(v4, v6);
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_3;
  v7[3] = &unk_2645070C8;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  [v2 indexDependentTokenRewritesWithQueryString:v3 context:v4 matchInfo:v5 setOfTokensToCorrect:v6 tokenRewritesHandler:v7];
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v3 = +[SPCoreSpotlightIndexer _mergedTokenRewrites:v2];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * v7) variations];
        [v8 count];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v5);
  }
  if (([*(id *)(a1 + 48) privateQuery] & 1) == 0)
  {
    id v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 72);
      id v11 = +[SPConcreteCoreSpotlightIndexer _descriptionWithTokenRewrites:v3];
      *(_DWORD *)stat buf = 134218242;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "[rewrite] qid:%ld ### Final rewrites: %@", buf, 0x16u);
    }
  }
  if ([v3 count])
  {
    id v12 = (void *)[*(id *)(a1 + 48) copy];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F556F8]) initWithRewrittenTokens:v3];
    [v12 setRewriteContext:v13];

    id v14 = (void *)[objc_alloc(MEMORY[0x263F556F0]) initWithSearchQueryString:*(void *)(a1 + 56) searchQueryContext:v12 score:0.0];
    uint64_t v15 = *(void *)(a1 + 64);
    os_signpost_id_t v21 = v14;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)dateRewritesFromContext:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v3 queryUnderstandingOutput];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kQPQUOutputTokenInfo"];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v38 = v5;
    id v39 = v3;
    id v9 = 0;
    uint64_t v42 = *(void *)v55;
    id v40 = v6;
    do
    {
      uint64_t v10 = 0;
      id v11 = v9;
      uint64_t v41 = v8;
      do
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(v6);
        }
        uint64_t v44 = v10;
        id v12 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        id v9 = [v12 objectForKeyedSubscript:@"kQPQUOutputToken"];
        id v13 = [v12 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        char v53 = 0;
        uint64_t v43 = v13;
        if ([v13 containsObject:@"ARG_TIME"])
        {
          id v14 = +[SPConcreteCoreSpotlightIndexer _sharedSynonyms];
          uint64_t v15 = [v14 generateDateSynonymsFromToken:v9 previousToken:v11 isOrdinalToken:&v53];

          if (v15 && [v15 count])
          {
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v16 = v15;
            uint64_t v48 = [v16 countByEnumeratingWithState:&v49 objects:v63 count:16];
            if (v48)
            {
              uint64_t v17 = *(void *)v50;
              uint64_t v47 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v48; ++i)
                {
                  if (*(void *)v50 != v17) {
                    objc_enumerationMutation(v16);
                  }
                  long long v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                  long long v20 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    os_signpost_id_t v21 = v11;
                    id v22 = v16;
                    uint64_t v23 = v4;
                    char v24 = _os_feature_enabled_impl();
                    uint64_t v25 = (uint64_t)v9;
                    if ((v24 & 1) == 0)
                    {
                      uint64_t v25 = CSRedactString(v9, 1);
                      id v46 = (void *)v25;
                    }
                    char v26 = _os_feature_enabled_impl();
                    uint64_t v27 = v19;
                    if ((v26 & 1) == 0)
                    {
                      uint64_t v45 = CSRedactString(v19, 1);
                      uint64_t v27 = v45;
                    }
                    *(_DWORD *)stat buf = 138412546;
                    uint64_t v60 = v25;
                    __int16 v61 = 2112;
                    uint64_t v62 = v27;
                    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "[rewrite] [first pass] adding date synonym = %@ for token = %@", buf, 0x16u);
                    if ((v26 & 1) == 0) {

                    }
                    uint64_t v4 = v23;
                    if ((v24 & 1) == 0) {

                    }
                    id v16 = v22;
                    id v11 = v21;
                    uint64_t v17 = v47;
                  }

                  id v28 = objc_alloc(MEMORY[0x263F55708]);
                  LODWORD(v29) = 1050253722;
                  uint64_t v30 = (void *)[v28 initWithVariation:v19 type:4 confidence:v29];
                  if (v11 && v53)
                  {
                    id v31 = [v11 stringByAppendingString:v9];
                  }
                  else
                  {
                    id v31 = v9;
                  }
                  char v32 = v31;
                  id v33 = objc_alloc(MEMORY[0x263F55700]);
                  id v58 = v30;
                  qos_class_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
                  long long v35 = (void *)[v33 initWithOriginalToken:v32 variations:v34];

                  [v4 addObject:v35];
                }
                uint64_t v48 = [v16 countByEnumeratingWithState:&v49 objects:v63 count:16];
              }
              while (v48);
            }

            uint64_t v6 = v40;
            uint64_t v8 = v41;
            long long v36 = v16;
          }
          else
          {
            long long v36 = v11;
            id v11 = v15;
          }
        }
        uint64_t v10 = v44 + 1;
        id v11 = v9;
      }
      while (v44 + 1 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v8);

    uint64_t v5 = v38;
    id v3 = v39;
  }

  return v4;
}

- (void)processSearchString:(id)a3 intoTrimmedString:(id *)a4 andTokens:(id *)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F08708];
  id v8 = a3;
  id v9 = [v7 whitespaceCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v14 = [v10 lowercaseString];

  if (processSearchString_intoTrimmedString_andTokens__onceToken != -1) {
    dispatch_once(&processSearchString_intoTrimmedString_andTokens__onceToken, &__block_literal_global_2142);
  }
  id v11 = objc_msgSend((id)processSearchString_intoTrimmedString_andTokens__regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v14, 0, 0, objc_msgSend(v14, "length"), &stru_26D0BD940);
  id v12 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v13 = [v11 componentsSeparatedByCharactersInSet:v12];

  if (a4) {
    *a4 = v11;
  }
  if (a5) {
    *a5 = v13;
  }
}

uint64_t __74__SPCoreSpotlightIndexer_processSearchString_intoTrimmedString_andTokens___block_invoke()
{
  objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"[?!\\.,\\-\\+\\*;:\"\\]\\[]+$",
    0,
  uint64_t v0 = 0);
  uint64_t v1 = processSearchString_intoTrimmedString_andTokens__regex;
  processSearchString_intoTrimmedString_andTokens__regex = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)rewriteFirstPassQueryWithQueryString:(id)a3 context:(id)a4 trimmedSearchStringTokens:(id)a5 populateDateSynonyms:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v42 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10 && [v10 count])
  {
    BOOL v40 = v6;
    id v39 = self;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v11;
    uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v60;
      id v13 = "Spotlight";
      uint64_t v44 = v12;
      uint64_t v45 = v11;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v16 = +[SPConcreteCoreSpotlightIndexer _sharedSynonyms];
          long long v54 = v15;
          uint64_t v17 = [v16 getFirstPassSynonymsForWord:v15];

          if (v17)
          {
            uint64_t v49 = i;
            id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            uint64_t v48 = v17;
            id v53 = v17;
            uint64_t v19 = [v53 countByEnumeratingWithState:&v55 objects:v67 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v56;
              do
              {
                uint64_t v22 = 0;
                uint64_t v52 = v20;
                do
                {
                  if (*(void *)v56 != v21) {
                    objc_enumerationMutation(v53);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v55 + 1) + 8 * v22);
                  char v24 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v25 = v21;
                    id v26 = v18;
                    char v27 = _os_feature_enabled_impl();
                    uint64_t v28 = (uint64_t)v54;
                    if ((v27 & 1) == 0)
                    {
                      uint64_t v28 = CSRedactString(v54, 1);
                      long long v51 = (void *)v28;
                    }
                    double v29 = v13;
                    char v30 = _os_feature_enabled_impl();
                    id v31 = v23;
                    if ((v30 & 1) == 0)
                    {
                      long long v50 = CSRedactString(v23, 1);
                      id v31 = v50;
                    }
                    *(_DWORD *)stat buf = 138412546;
                    uint64_t v64 = v28;
                    __int16 v65 = 2112;
                    uint64_t v66 = v31;
                    _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_INFO, "[rewrite] [first pass] adding synonym = %@ for token = %@", buf, 0x16u);
                    if ((v30 & 1) == 0) {

                    }
                    id v18 = v26;
                    if ((v27 & 1) == 0) {

                    }
                    id v13 = v29;
                    uint64_t v21 = v25;
                    uint64_t v20 = v52;
                  }

                  id v32 = objc_alloc(MEMORY[0x263F55708]);
                  LODWORD(v33) = 1050253722;
                  qos_class_t v34 = (void *)[v32 initWithVariation:v23 type:4 confidence:v33];
                  [v18 addObject:v34];

                  ++v22;
                }
                while (v20 != v22);
                uint64_t v20 = [v53 countByEnumeratingWithState:&v55 objects:v67 count:16];
              }
              while (v20);
            }

            id v12 = v44;
            uint64_t i = v49;
            if ([v18 count])
            {
              long long v35 = (void *)[objc_alloc(MEMORY[0x263F55700]) initWithOriginalToken:v54 variations:v18];
              [v44 addObject:v35];
            }
            id v11 = v45;
            uint64_t v17 = v48;
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v47);
    }

    if (v40)
    {
      long long v36 = [(SPCoreSpotlightIndexer *)v39 dateRewritesFromContext:v42];
      [v12 addObjectsFromArray:v36];
    }
    uint64_t v37 = (void *)[objc_alloc(MEMORY[0x263F556F8]) initWithRewrittenTokens:v12];
    long long v38 = v42;
    [v42 setRewriteContext:v37];
  }
  else
  {
    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_INFO, "[rewrite] [first pass] skipping first pass rewrite due to invalid trimmedSearchStringTokens", buf, 2u);
    }
    long long v38 = v42;
  }
}

- (void)reindexAllItemsWithIndexers:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (sPrivate)
  {
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
  else
  {
    unint64_t v12 = [(SPCoreSpotlightIndexer *)self dataMigrationStage];
    id v13 = [(SPCoreSpotlightIndexer *)self reindexAllQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke;
    v15[3] = &unk_264508970;
    void v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    unint64_t v19 = v12;
    id v18 = v11;
    id v14 = _setup_block(v15, 0, 14869);
    dispatch_async(v13, v14);
  }
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) reindexAllQueue];
  dispatch_suspend(v2);

  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = dispatch_group_create();
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:2];
  uint64_t v4 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dataclass];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v7);
  }

  uint64_t v25 = v4;
  [v28 setProtectionClasses:v4];
  if (*(void *)(a1 + 48)) {
    id v11 = *(__CFString **)(a1 + 48);
  }
  else {
    id v11 = @"triggered by -[SPCoreSpotlightIndexer reindexAllItemsWithIndexers:...]";
  }
  [v28 setReason:v11];
  unint64_t v12 = [[SPCoreSpotlightIndexerTask alloc] initWithIndexJob:v28 indexers:*(void *)(a1 + 40)];
  [(SPCoreSpotlightIndexerTask *)v12 setDataMigrationStage:*(void *)(a1 + 64)];
  [(SPCoreSpotlightIndexerTask *)v12 setShouldResumeOnFailure:1];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        dispatch_group_enter(v3);
        id v18 = sIndexQueue;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2;
        v35[3] = &unk_264506598;
        v35[4] = v17;
        long long v36 = v12;
        id v37 = v28;
        id v38 = v27;
        id v39 = v3;
        unint64_t v19 = _setup_block(v35, 0, 14850);
        dispatch_async(v18, v19);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v14);
  }

  uint64_t v20 = sIndexQueue;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2149;
  v29[3] = &unk_264508948;
  char v30 = v12;
  id v31 = v27;
  uint64_t v21 = *(void **)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = v21;
  id v34 = *(id *)(a1 + 56);
  id v22 = v27;
  uint64_t v23 = v12;
  char v24 = _setup_block(v29, 0, 14868);
  dispatch_group_notify(v3, v20, v24);
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C480D0]();
  [*(id *)(a1 + 32) startReindexAll];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_3;
  v7[3] = &unk_264508920;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  [v3 fetchAllCompletedBundleIDsForIndexerTask:v4 completionHandler:v7];
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) jobType];
      uint64_t v6 = [*(id *)(a1 + 40) dataclass];
      int v8 = 134218498;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "Found already completed bundleIDs from a previously failed job (%ld), dataclass:%@, completedBundleIDs:%@", (uint8_t *)&v8, 0x20u);
    }
    id v7 = *(id *)(a1 + 48);
    objc_sync_enter(v7);
    [*(id *)(a1 + 48) addObjectsFromArray:v3];
    objc_sync_exit(v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2149(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) allObjects];
  [*(id *)(a1 + 32) setCompletedBundleIDs:v2];

  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [*(id *)(a1 + 32) completedBundleIDs];
    *(_DWORD *)stat buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Reindexing all items, completedBundleIDs:%@", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2150;
  v9[3] = &unk_264507140;
  uint64_t v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  id v12 = *(id *)(a1 + 64);
  [v6 performIndexerTask:v5 completionHandler:v9];
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2150(uint64_t a1)
{
  uint64_t v2 = sIndexQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2_2151;
  v7[3] = &unk_264507140;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  uint64_t v6 = _setup_block(v7, 0, 14866);
  dispatch_async(v2, v6);
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2_2151(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x223C480D0]();
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Done reindexing all items", buf, 2u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "finishReindexAll", (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [*(id *)(a1 + 40) reindexAllQueue];
  dispatch_resume(v9);

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (int)_openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v10 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  long long v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v12 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__SPCoreSpotlightIndexer__openIndex_forInit_readOnly___block_invoke;
  v16[3] = &unk_264508998;
  BOOL v20 = a3;
  BOOL v21 = a4;
  BOOL v22 = a5;
  v16[4] = self;
  id v18 = &v25;
  unint64_t v19 = v23;
  id v13 = v11;
  id v17 = v13;
  [v12 enumerateKeysAndObjectsWithOptions:1 usingBlock:v16];

  if ([v13 count]) {
    objc_storeStrong((id *)&self->_reindexIndexers, v11);
  }
  int v14 = *((_DWORD *)v26 + 6);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

void __54__SPCoreSpotlightIndexer__openIndex_forInit_readOnly___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  BOOL v10 = *(unsigned char *)(a1 + 64) != 0;
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v11 = *(unsigned char *)(a1 + 65) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    long long v12 = objc_msgSend(v8, "dataclass", v10);
    if ([v12 isEqualToString:*MEMORY[0x263F08088]])
    {
LABEL_8:

LABEL_9:
      BOOL v10 = 0;
      goto LABEL_10;
    }
    id v13 = [v9 dataclass];
    if ([v13 isEqualToString:*MEMORY[0x263F080A0]])
    {
LABEL_7:

      goto LABEL_8;
    }
    unint64_t v19 = [v9 dataclass];
    if ([v19 isEqualToString:@"Priority"])
    {
      if ([(id)sDelegate managedIndex])
      {

        goto LABEL_7;
      }
      char v24 = [(id)sDelegate privateIndex];

      if (v24) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    BOOL v10 = 1;
  }
LABEL_10:
  int v14 = [v9 openIndex:v10 shouldReindexAll:0 readOnly:*(unsigned __int8 *)(a1 + 66)];
  if (v14 < 0)
  {
    id v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(_DWORD *)(v18 + 24) > v14) {
      *(_DWORD *)(v18 + 24) = v14;
    }
    *a4 = 1;
    objc_sync_exit(v17);
  }
  else if ([(id)sDelegate setupHasComplete])
  {
    if (v14 == 1 || [v9 reindexAllStarted])
    {
      id v15 = *(id *)(a1 + 32);
      objc_sync_enter(v15);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(a1 + 40) addObject:v9];
      objc_sync_exit(v15);

      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
    BOOL v20 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v9 dataclass];
      BOOL v22 = (void *)v21;
      uint64_t v23 = @"NO";
      if (v16) {
        uint64_t v23 = @"YES";
      }
      int v25 = 138412546;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      int v28 = v23;
      _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "dataclass:%@, reindexAll:%@", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)writeFileProviderBundleMap:(id)a3 fileProviderBundleIDs:(id)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!sPrivate)
  {
    id v7 = NSHomeDirectory();
    id v8 = [v7 stringByAppendingPathComponent:@"/Library/Spotlight/ExtensionsCache"];

    id v9 = [MEMORY[0x263F08850] defaultManager];
    if (([v9 fileExistsAtPath:v8] & 1) == 0) {
      [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v21[0] = @"v_n";
    v21[1] = @"bm_d";
    uint64_t v10 = MEMORY[0x263EFFA78];
    if (v5) {
      id v11 = v5;
    }
    else {
      id v11 = (id)MEMORY[0x263EFFA78];
    }
    v22[0] = &unk_26D0C8F80;
    v22[1] = v11;
    v21[2] = @"bid_d";
    uint64_t v12 = [v6 allObjects];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v10;
    }
    v22[2] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

    int v16 = [v8 stringByAppendingPathComponent:@"fileProviderBundleMap.plist"];
    id v17 = [MEMORY[0x263EFF9E0] outputStreamToFileAtPath:v16 append:0];
    [v17 open];
    uint64_t v20 = 0;
    [MEMORY[0x263F08AC0] writePropertyList:v15 toStream:v17 format:200 options:0 error:&v20];
    uint64_t v18 = v20;
    [v17 close];
    if (v18)
    {
      unint64_t v19 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer writeFileProviderBundleMap:fileProviderBundleIDs:]();
      }
    }
  }
}

void __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"/Library/Spotlight/ExtensionsCache"];

  id v4 = [v3 stringByAppendingPathComponent:@"fileProviderBundleMap.plist"];
  id v5 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v4];
  [v5 open];
  id v33 = 0;
  id v6 = [MEMORY[0x263F08AC0] propertyListWithStream:v5 options:0 format:0 error:&v33];
  id v7 = v33;
  [v5 close];
  if (v7)
  {
    id v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke_cold_1();
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    id v8 = [v6 objectForKeyedSubscript:@"v_n"];
    if ([v8 isEqual:&unk_26D0C8F80])
    {
      id v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = [v6 objectForKeyedSubscript:@"bid_d"];
      id v11 = [v9 setWithArray:v10];

      if ([v11 count])
      {
        +[SpotlightDaemonServer sharedDaemonServer];
        v13 = uint64_t v12 = v11;
        [v13 updateFileProviderBundleIDs:v12];

        id v11 = v12;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"bm_d"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v25 = v4;
        uint64_t v26 = v3;
        uint64_t v23 = a1;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v14;
        uint64_t v28 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v28)
        {
          uint64_t v27 = *(void *)v30;
          char v24 = v11;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              id v17 = v14;
              if (*(void *)v30 != v27) {
                objc_enumerationMutation(v15);
              }
              uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v11 = v24;
                uint64_t v14 = v17;
                goto LABEL_23;
              }
              unint64_t v19 = v15;
              uint64_t v20 = [v15 objectForKeyedSubscript:v18];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                id v11 = v24;
                uint64_t v14 = v17;
                id v15 = v19;
                goto LABEL_23;
              }
              uint64_t v14 = v17;
              id v15 = v19;
            }
            id v11 = v24;
            uint64_t v28 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        objc_storeStrong((id *)(*(void *)(v23 + 32) + 96), v14);
        uint64_t v22 = *(void *)(v23 + 32);
        id v15 = *(id *)(v22 + 104);
        *(void *)(v22 + 104) = 0;
LABEL_23:

        id v4 = v25;
        id v3 = v26;
      }
    }
  }

LABEL_5:
}

- (void)checkIfExtensionsNeedToBeLoaded
{
  if (self->_reindexIndexers)
  {
    id v3 = [MEMORY[0x263F02B50] sharedManager];
    [v3 loadExtensions];

    [(SPCoreSpotlightIndexer *)self reindexAllItemsWithIndexers:self->_reindexIndexers reason:@"loading extensions" completionHandler:&__block_literal_global_2174];
    reindexIndexers = self->_reindexIndexers;
    self->_reindexIndexers = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F02AD8];
    [v5 notifyIndexDelegates];
  }
}

- (void)fileProviderActiveProvidersChanged:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v35 = v4;
  id v6 = [v4 allKeys];
  id v34 = [v5 setWithArray:v6];

  if ([v35 count])
  {
    id v7 = self;
    objc_sync_enter(v7);
    obuint64_t j = v7;
    [(SPCoreSpotlightIndexer *)v7 fileProviderInfoSetup];
    id location = (id *)&v7->_fileProviderAppToExtensionBundleMap;
    id v8 = v7->_fileProviderAppToExtensionBundleMap;
    if ([(NSDictionary *)v8 count])
    {
      id v9 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v10 = v35;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            id v15 = [(NSDictionary *)v8 objectForKeyedSubscript:v14];
            int v16 = [v10 objectForKeyedSubscript:v14];
            char v17 = [v15 isEqualToString:v16];

            if ((v17 & 1) == 0) {
              [v9 addObject:v14];
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v11);
      }

      if ([v9 count])
      {
        uint64_t v18 = (void *)[v10 mutableCopy];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v19 = v9;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * j);
              char v24 = [v10 objectForKeyedSubscript:v23];
              [v18 setObject:v24 forKeyedSubscript:v23];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v20);
        }

        id v25 = *location;
        *id location = v18;
        id v26 = v18;

        uint64_t v27 = (NSDictionary *)*location;
      }
      else
      {
        uint64_t v27 = 0;
      }
    }
    else
    {
      objc_storeStrong(location, a3);
      uint64_t v27 = (NSDictionary *)*location;
    }

    objc_sync_exit(obj);
  }
  else
  {
    uint64_t v27 = 0;
  }
  if ([v35 count] || objc_msgSend(v34, "count"))
  {
    fileProviderExtensionToAppBundleMap = self->_fileProviderExtensionToAppBundleMap;
    self->_fileProviderExtensionToAppBundleMap = 0;

    if ([v34 count])
    {
      objc_storeStrong((id *)&self->_fileProviderBundleIDs, v34);
      long long v29 = +[SpotlightDaemonServer sharedDaemonServer];
      [v29 updateFileProviderBundleIDs:v34];
    }
    fileProviderAppToExtensionBundleMap = v27;
    if (!v27) {
      fileProviderAppToExtensionBundleMap = self->_fileProviderAppToExtensionBundleMap;
    }
    [(SPCoreSpotlightIndexer *)self writeFileProviderBundleMap:fileProviderAppToExtensionBundleMap fileProviderBundleIDs:self->_fileProviderBundleIDs];
  }
}

- (NSDictionary)fileProviderAppToExtensionBundleMap
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  [(SPCoreSpotlightIndexer *)v2 fileProviderInfoSetup];
  id v3 = v2->_fileProviderAppToExtensionBundleMap;
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)fileProviderExtensionToAppBundleMap
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  [(SPCoreSpotlightIndexer *)v2 fileProviderInfoSetup];
  fileProviderExtensionToAppBundleMap = v2->_fileProviderExtensionToAppBundleMap;
  if (!fileProviderExtensionToAppBundleMap)
  {
    fileProviderAppToExtensionBundleMap = v2->_fileProviderAppToExtensionBundleMap;
    if (fileProviderAppToExtensionBundleMap)
    {
      objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](fileProviderAppToExtensionBundleMap, "count"));
      id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = v2->_fileProviderAppToExtensionBundleMap;
      uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](v2->_fileProviderAppToExtensionBundleMap, "objectForKeyedSubscript:", v10, (void)v15);
            [(NSDictionary *)v5 setObject:v10 forKeyedSubscript:v11];
          }
          uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }

      uint64_t v12 = v2->_fileProviderExtensionToAppBundleMap;
      v2->_fileProviderExtensionToAppBundleMap = v5;

      fileProviderExtensionToAppBundleMap = v2->_fileProviderExtensionToAppBundleMap;
    }
    else
    {
      fileProviderExtensionToAppBundleMap = 0;
    }
  }
  id v13 = fileProviderExtensionToAppBundleMap;
  objc_sync_exit(v2);

  return v13;
}

- (int)openIndex:(BOOL)a3 readOnly:(BOOL)a4
{
  return [(SPCoreSpotlightIndexer *)self _openIndex:a3 forInit:0 readOnly:a4];
}

- (int)openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  indexQueue = self->_indexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SPCoreSpotlightIndexer_openIndex_forInit_readOnly___block_invoke;
  block[3] = &unk_2645089C0;
  void block[4] = self;
  void block[5] = &v12;
  BOOL v9 = a3;
  BOOL v10 = a4;
  BOOL v11 = a5;
  dispatch_sync(indexQueue, block);
  int v6 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __53__SPCoreSpotlightIndexer_openIndex_forInit_readOnly___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _openIndex:*(unsigned __int8 *)(a1 + 48) forInit:*(unsigned __int8 *)(a1 + 49) readOnly:*(unsigned __int8 *)(a1 + 50)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)openIndex:(BOOL)a3
{
  return [(SPCoreSpotlightIndexer *)self openIndex:a3 readOnly:0];
}

- (BOOL)writeData:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 writeData:v5];

  return 1;
}

- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, uint64_t))a6;
  _checkUnlock();
  if (v13 && [(id)sDelegate blocklistCheck:v13 withOptions:0])
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v10 = [v11 initWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
  }
  uint64_t v12 = (void *)v10;
  v9[2](v9, v10);

LABEL_7:
}

- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  _checkUnlock();
  if (v12 && [(id)sDelegate blocklistCheck:v12 withOptions:0])
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v10 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v9 = [v10 initWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
  }
  id v11 = (void *)v9;
  v8[2](v8, v9);

LABEL_7:
}

- (void)validateIndexers:(id)a3 outFileDescriptor:(int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __61__SPCoreSpotlightIndexer_validateIndexers_outFileDescriptor___block_invoke;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  int v5 = a4;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:a3 block:v4];
}

void __61__SPCoreSpotlightIndexer_validateIndexers_outFileDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  id v4 = a2;
  [v4 validateConcreteIndexer:0 outFileDescriptor:v3];
  [v4 validateConcreteIndexer:1 outFileDescriptor:*(unsigned int *)(a1 + 32)];
}

- (void)validateVectors:(id)a3 outFileDescriptor:(int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __60__SPCoreSpotlightIndexer_validateVectors_outFileDescriptor___block_invoke;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  int v5 = a4;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:a3 block:v4];
}

uint64_t __60__SPCoreSpotlightIndexer_validateVectors_outFileDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 validateVectors:*(unsigned int *)(a1 + 32)];
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
}

- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v16 = a4;
  _checkUnlock();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  void v28[4] = __Block_byref_object_dispose_;
  id v29 = 0;
  id v6 = dispatch_group_create();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  id v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke;
        void v21[3] = &unk_264507190;
        uint64_t v23 = v28;
        uint64_t v22 = v6;
        objc_msgSend(v12, "deleteSearchableItemsWithPersonaIds:completionHandler:", v17, v21, v16);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  id v13 = sIndexQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2;
  v18[3] = &unk_264508798;
  v18[4] = self;
  id v14 = v16;
  id v19 = v14;
  uint64_t v20 = v28;
  int v15 = _setup_block(v18, 0, 15638);
  dispatch_group_notify(v6, v13, v15);

  _Block_object_dispose(v28, 8);
}

void __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 fromClient:(id)a4 protectionClass:(id)a5 shouldGC:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  _checkUnlock();
  id v16 = (void *)*MEMORY[0x263F08098];
  if (v14) {
    id v16 = v14;
  }
  id v17 = v16;
  long long v18 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v17 andBundleID:v12];
  if (v18)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    id v19 = [(SPCoreSpotlightIndexer *)self fileProviderAppToExtensionBundleMap];
    uint64_t v20 = [v19 objectForKey:v12];

    if (v20)
    {
      uint64_t v21 = dispatch_group_create();
      dispatch_group_enter(v21);
      dispatch_group_enter(v21);
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy_;
      v35[4] = __Block_byref_object_dispose_;
      id v36 = 0;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke;
      v32[3] = &unk_264507190;
      id v34 = v35;
      uint64_t v22 = v21;
      id v33 = v22;
      [v18 deleteAllSearchableItemsForBundleID:v12 fromClient:v13 shouldGC:v8 completionHandler:v32];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_2;
      v29[3] = &unk_264507190;
      uint64_t v31 = v35;
      uint64_t v23 = v22;
      long long v30 = v23;
      [v18 deleteAllSearchableItemsForBundleID:v20 fromClient:v13 shouldGC:v8 completionHandler:v29];
      long long v24 = sIndexQueue;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_3;
      v26[3] = &unk_2645089E8;
      id v27 = v15;
      uint64_t v28 = v35;
      long long v25 = _setup_block(v26, 0, 15677);
      dispatch_group_notify(v23, v24, v25);

      _Block_object_dispose(v35, 8);
    }
    else
    {
      [v18 deleteAllSearchableItemsForBundleID:v12 fromClient:v13 shouldGC:v8 completionHandler:v15];
    }
    goto LABEL_9;
  }
  if (v15)
  {
    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*((void (**)(id, void *))v15 + 2))(v15, v20);
LABEL_9:
  }
}

void __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!a2) {
    a2 = *(void **)(v4 + 40);
  }
  objc_storeStrong((id *)(v4 + 40), a2);
  id v5 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!a2) {
    a2 = *(void **)(v4 + 40);
  }
  objc_storeStrong((id *)(v4 + 40), a2);
  id v5 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a7;
  _checkUnlock();
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = (id)*MEMORY[0x263F08098];
  }
  id v15 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v14 andBundleID:v12];
  if (v15)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    [v15 deleteSearchableItemsSinceDate:v17 forBundleID:v12 completionHandler:v13];
  }
  else if (v13)
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v13[2](v13, v16);
  }
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8
{
  id v16 = a3;
  id v12 = a5;
  id v13 = a6;
  _checkUnlock();
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)*MEMORY[0x263F08098];
  }
  id v15 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v14 andBundleID:v13];
  if (v15)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    [v15 changeStateOfSearchableItemsWithUIDs:v16 toState:a4 forBundleID:v13];
  }
}

- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5 forBundleID:(id)a6 personaID:(id)a7
{
  v50[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (deviceUnlocked)
  {
    if (!v13) {
      goto LABEL_23;
    }
  }
  else
  {
    SIResumeForUnlock();
    if (!v13) {
      goto LABEL_23;
    }
  }
  if (([(id)sDelegate blocklistCheck:v15 withOptions:0] & 1) == 0)
  {
    id v17 = [v13 attributeSet];
    id v34 = [v17 relatedUniqueIdentifier];

    long long v30 = [v13 uniqueIdentifier];
    long long v18 = (void *)*MEMORY[0x263F08098];
    if (v14) {
      long long v18 = v14;
    }
    id v19 = v18;
    id v33 = v19;
    if (v34)
    {
      long long v32 = [(id)objc_opt_class() allProtectionClasses];
      uint64_t v31 = 0;
    }
    else
    {
      v50[0] = v19;
      long long v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
      uint64_t v49 = v33;
      uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    }
    int v20 = [v13 noIndex];
    uint64_t v21 = logForCSLogCategoryIndex();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v22) {
        -[SPCoreSpotlightIndexer userPerformedAction:withItem:protectionClass:forBundleID:personaID:]();
      }
    }
    else
    {
      if (v22) {
        -[SPCoreSpotlightIndexer userPerformedAction:withItem:protectionClass:forBundleID:personaID:]();
      }

      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = objc_alloc_init(MEMORY[0x263F02A30]);
      [v21 beginArray];
      uint64_t v23 = [v13 attributeSet];
      [v21 encodeObject:v23];

      [v21 endArray];
      long long v24 = [v21 data];
      long long v25 = (void *)[v24 copy];

      if (v34)
      {
        uint64_t v45 = 0;
        uint64_t v46 = &v45;
        uint64_t v47 = 0x2020000000;
        int v48 = 0;
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke;
        v44[3] = &unk_264508A10;
        v44[4] = &v45;
        [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v32 block:v44];
        long long v26 = [[SPUAProgressItem alloc] initWithBundleID:v15 uaID:v30 relatedID:v34];
        [(SPUAProgressItem *)v26 setExpectedCount:*((unsigned int *)v46 + 6)];
        [(SPUAProgressItem *)v26 add];
        _Block_object_dispose(&v45, 8);
      }
      else
      {
        long long v26 = 0;
      }
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2;
      v38[3] = &unk_264508A38;
      id v27 = v15;
      id v39 = v27;
      id v40 = v16;
      id v29 = v25;
      id v41 = v29;
      BOOL v43 = v34 != 0;
      uint64_t v28 = v26;
      long long v42 = v28;
      [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v32 block:v38];
      if ([v31 count])
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2177;
        v35[3] = &unk_264508688;
        id v36 = v30;
        id v37 = v27;
        [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v31 block:v35];
      }
    }
  }
LABEL_23:
}

uint64_t __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke(uint64_t result)
{
  return result;
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3;
  v8[3] = &unk_264506B90;
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  LOBYTE(v7) = v5;
  [a2 indexFromBundle:v3 personaID:v4 options:0 items:v6 itemsText:0 itemsHTML:0 clientState:0 expectedClientState:0 clientStateName:0 deletes:0 canCreateNewIndex:v7 completionHandler:v8];
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3_cold_1();
    }

    [*(id *)(a1 + 32) update:0xFFFFFFFFLL];
  }
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2177(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  char v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "_backgroundDeleteItems:bundleID:completionHandler:", v5, *(void *)(a1 + 40), &__block_literal_global_2180, v6, v7);
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2_2178(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Error deleting possible user activity %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a7;
  _checkUnlock();
  if ([(id)sDelegate blocklistCheck:v13 withOptions:a6])
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v14[2](v14, v15);
  }
  else
  {
    if (v12) {
      id v16 = v12;
    }
    else {
      id v16 = (id)*MEMORY[0x263F08098];
    }
    id v15 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v16 andBundleID:v13];
    if (v15)
    {
      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      [v15 willModifySearchableItemsWithIdentifiers:v18 forBundleID:v13 completionHandler:v14];
    }
    else if (v14)
    {
      id v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      v14[2](v14, v17);
    }
  }
}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _checkUnlock();
  dispatch_group_t v11 = dispatch_group_create();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  void v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke;
  void v21[3] = &unk_264508A88;
  id v12 = v11;
  BOOL v22 = v12;
  uint64_t v23 = self;
  id v13 = v8;
  id v24 = v13;
  id v14 = v9;
  id v25 = v14;
  long long v26 = v27;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:0 block:v21];
  if (v10)
  {
    qos_class_t v15 = qos_class_self();
    id v16 = dispatch_get_global_queue(v15, 2uLL);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_4;
    v18[3] = &unk_2645089E8;
    id v19 = v10;
    int v20 = v27;
    id v17 = _setup_block(v18, 0, 15922);
    dispatch_group_notify(v12, v16, v17);
  }
  _Block_object_dispose(v27, 8);
}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int v4 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2;
  v10[3] = &unk_264508A60;
  id v5 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v3;
  id v12 = v5;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v15 = v7;
  id v14 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = _setup_block(v10, 0, 15916);
  dispatch_async(v4, v9);
}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3;
  v7[3] = &unk_264507190;
  long long v6 = *(_OWORD *)(a1 + 64);
  id v5 = (id)v6;
  long long v8 = v6;
  [v2 deleteAllUserActivities:v3 fromClient:v4 completionHandler:v7];
}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    id v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  _checkUnlock();
  dispatch_group_t v7 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  void v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  id v22 = 0;
  v23[0] = *MEMORY[0x263F08098];
  long long v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke;
  v16[3] = &unk_264508AD8;
  id v9 = v7;
  id v17 = v9;
  id v18 = self;
  double v20 = a3;
  id v19 = v21;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v8 block:v16];
  if (v6)
  {
    qos_class_t v10 = qos_class_self();
    id v11 = dispatch_get_global_queue(v10, 2uLL);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_4;
    v13[3] = &unk_2645089E8;
    id v14 = v6;
    uint64_t v15 = v21;
    id v12 = _setup_block(v13, 0, 15954);
    dispatch_group_notify(v9, v11, v12);
  }
  _Block_object_dispose(v21, 8);
}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_2;
  v8[3] = &unk_264508AB0;
  id v5 = *(void **)(a1 + 32);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 48);
  id v10 = v5;
  id v6 = v3;
  dispatch_group_t v7 = _setup_block(v8, 0, 15948);
  dispatch_async(v4, v7);
}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  id v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_3;
  void v6[3] = &unk_264507190;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 deleteActionsBeforeTime:v6 completionHandler:v3];
}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    long long v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _checkUnlock();
  dispatch_group_t v8 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  void v23[2] = 0x3032000000;
  void v23[3] = __Block_byref_object_copy_;
  void v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  v25[0] = *MEMORY[0x263F08098];
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke;
  v18[3] = &unk_264508B28;
  id v10 = v8;
  id v19 = v10;
  double v20 = self;
  id v11 = v6;
  id v21 = v11;
  id v22 = v23;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v9 block:v18];
  if (v7)
  {
    qos_class_t v12 = qos_class_self();
    id v13 = dispatch_get_global_queue(v12, 2uLL);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_4;
    v15[3] = &unk_2645089E8;
    id v16 = v7;
    id v17 = v23;
    id v14 = _setup_block(v15, 0, 15984);
    dispatch_group_notify(v10, v13, v14);
  }
  _Block_object_dispose(v23, 8);
}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_2;
  v10[3] = &unk_264508B00;
  long long v5 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = v6;
  uint64_t v14 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = _setup_block(v10, 0, 15978);
  dispatch_async(v4, v9);
}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_3;
  void v6[3] = &unk_264507190;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 deleteActionsWithIdentifiers:v3 completionHandler:v6];
}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    long long v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _checkUnlock();
  dispatch_group_t v8 = dispatch_group_create();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  v24[0] = *MEMORY[0x263F08098];
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke;
  v17[3] = &unk_264508B28;
  id v10 = v8;
  id v18 = v10;
  id v19 = self;
  id v11 = v6;
  id v20 = v11;
  id v21 = v22;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v9 block:v17];
  if (v7)
  {
    qos_class_t v12 = qos_class_self();
    id v13 = dispatch_get_global_queue(v12, 2uLL);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_4;
    v14[3] = &unk_2645089E8;
    id v15 = v7;
    id v16 = v22;
    dispatch_group_notify(v10, v13, v14);
  }
  _Block_object_dispose(v22, 8);
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_2;
  v10[3] = &unk_264508B00;
  long long v5 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = v6;
  uint64_t v14 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = _setup_block(v10, 0, 16008);
  dispatch_async(v4, v9);
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_3;
  void v6[3] = &unk_264507190;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 deleteAllInteractionsWithBundleID:v3 completionHandler:v6];
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    long long v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5 logQuery:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v66 = a4;
  id v65 = a5;
  uint64_t v64 = _CFCopySystemVersionDictionary();
  id v10 = [NSString stringWithFormat:@"System Version - %@\n\n", v64];
  id v11 = (void **)&off_264506000;
  id v12 = +[SPCoreSpotlightIndexer sharedInstance];
  id v13 = [v10 dataUsingEncoding:4];
  int v14 = [v12 writeData:v13 toFile:v9];

  if (v14)
  {
    id v15 = NSString;
    id v16 = [MEMORY[0x263EFF960] preferredLanguages];
    id v17 = [v15 stringWithFormat:@"Preferred Languages - %@\n\n", v16];

    id v18 = +[SPCoreSpotlightIndexer sharedInstance];
    id v19 = [v17 dataUsingEncoding:4];
    LODWORD(v16) = [v18 writeData:v19 toFile:v9];

    if (v16)
    {
      CFStringRef v20 = (const __CFString *)*MEMORY[0x263EFFE70];
      CFStringRef v21 = (const __CFString *)*MEMORY[0x263EFFE50];
      CFArrayRef v22 = CFPreferencesCopyKeyList(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
      if ([(__CFArray *)v22 count])
      {
        CFDictionaryRef v23 = CFPreferencesCopyMultiple(v22, @"com.apple.spotlightui", v20, v21);
        if ([(__CFDictionary *)v23 count])
        {
          id v10 = [NSString stringWithFormat:@"Preferences - %@\n\n", v23];

          id v24 = +[SPCoreSpotlightIndexer sharedInstance];
          id v25 = [v10 dataUsingEncoding:4];
          int v26 = [v24 writeData:v25 toFile:v9];

          if (!v26)
          {

            BOOL v28 = 0;
LABEL_38:
            id v29 = (void *)v64;

            goto LABEL_39;
          }
          id v17 = v10;
        }
        unint64_t v27 = 0x263F08000;
      }
      else
      {
        unint64_t v27 = 0x263F08000uLL;
      }
      id v30 = +[SpotlightSender copyDiagnosticInfo];
      __int16 v63 = v30;
      if ([v30 count])
      {
        id v10 = [*(id *)(v27 + 2880) stringWithFormat:@"Spotlight Receivers - %@\n\n", v30];

        uint64_t v31 = +[SPCoreSpotlightIndexer sharedInstance];
        long long v32 = [v10 dataUsingEncoding:4];
        int v33 = [v31 writeData:v32 toFile:v9];

        if (!v33)
        {
          BOOL v28 = 0;
LABEL_37:

          goto LABEL_38;
        }
      }
      else
      {
        id v10 = v17;
      }
      CFArrayRef v62 = v22;
      for (uint64_t i = 0; i != 4; ++i)
      {
        if (i != 2 || v6)
        {
          id v35 = (void *)MEMORY[0x223C480D0]();
          id v36 = SDTraceDescription(i);
          if ([v36 length])
          {
            [v11[33] sharedInstance];
            v38 = id v37 = v11;
            id v39 = [v36 dataUsingEncoding:4];
            int v40 = [v38 writeData:v39 toFile:v9];

            if (!v40) {
              goto LABEL_31;
            }
            id v41 = [v37[33] sharedInstance];
            long long v42 = [@"\n" dataUsingEncoding:4];
            int v43 = [v41 writeData:v42 toFile:v9];

            id v11 = v37;
            if (!v43)
            {
LABEL_31:

              BOOL v28 = 0;
              CFArrayRef v22 = v62;
              goto LABEL_37;
            }
          }
        }
      }
      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x2020000000;
      char v75 = 1;
      long long v44 = [v11[33] sharedInstance];
      uint64_t v45 = [v44 concreteIndexers];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __71__SPCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier_logQuery___block_invoke;
      v67[3] = &unk_264508B50;
      uint64_t v71 = &v72;
      id v46 = v9;
      id v68 = v46;
      id v69 = v66;
      id v70 = v65;
      [v45 enumerateKeysAndObjectsUsingBlock:v67];

      uint64_t v47 = NSString;
      [v11[33] sharedInstance];
      v48 = CFArrayRef v22 = v62;
      uint64_t v49 = [v48 dumpIndexAges];
      uint64_t v50 = [v47 stringWithFormat:@"\nCoreSpotlight Indexes Age Info:\n%@\n", v49];

      long long v51 = [v11[33] sharedInstance];
      uint64_t v52 = [v50 dataUsingEncoding:4];
      LOBYTE(v49) = [v51 writeData:v52 toFile:v46];

      if (v49)
      {
        id v53 = NSString;
        long long v54 = [v11[33] sharedInstance];
        long long v55 = [v54 dumpIndexAnalytics];
        long long v56 = [v53 stringWithFormat:@"\nCoreSpotlight Indexes Analytics Info:\n%@\n", v55];

        long long v57 = [v11[33] sharedInstance];
        long long v58 = [v56 dataUsingEncoding:4];
        LOBYTE(v53) = [v57 writeData:v58 toFile:v46];

        if (v53)
        {
          if (sDelegate)
          {
            long long v59 = [(id)sDelegate extraTTRInfo];
            if (v59)
            {
              long long v60 = [v11[33] sharedInstance];
              [v60 writeData:v59 toFile:v46];
            }
          }
          BOOL v28 = *((unsigned char *)v73 + 24) != 0;
        }
        else
        {
          BOOL v28 = 0;
        }
      }
      else
      {
        BOOL v28 = 0;
      }

      _Block_object_dispose(&v72, 8);
      goto LABEL_37;
    }
    BOOL v28 = 0;
    id v10 = v17;
  }
  else
  {
    BOOL v28 = 0;
  }
  id v29 = (void *)v64;
LABEL_39:

  return v28;
}

uint64_t __71__SPCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier_logQuery___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 writeDiagnostic:a1[4] bundleID:a1[5] identifier:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)getDBLogsWithCompletionHandler:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263EFFA40];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  long long v5 = (void *)[[v3 alloc] initWithSuiteName:@"com.apple.searchd"];
  BOOL v6 = +[SPCoreSpotlightIndexer sharedInstance];
  id v7 = [v6 concreteIndexers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke;
  v9[3] = &unk_264508B78;
  id v10 = v5;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  v4[2](v4, 1);
}

void __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v5 = [*(id *)(a1 + 32) objectForKey:@"lastQueryString"];
  if (v5)
  {
    BOOL v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_2645068F0;
    id v9 = v6;
    id v7 = v6;
    [v4 dumpAllRankingDiagnosticInformationForQuery:v5 withCompletionHandler:v8];
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v33 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  id v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer _issueDiagnose:logQuery:completionHandler:]();
  }

  [(id)sDelegate dumpTTRDebugFiles];
  id v9 = objc_opt_new();
  id v10 = [MEMORY[0x263EFF910] date];
  id v11 = objc_alloc_init(MEMORY[0x263F08790]);
  [v11 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  id v34 = v11;
  uint64_t v12 = [v11 stringFromDate:v10];
  if ((v5 & 0x80000000) != 0)
  {
    id v15 = SPLogDirectory();
    id v16 = [MEMORY[0x263F08850] defaultManager];
    char v17 = [v16 fileExistsAtPath:v15];

    if ((v17 & 1) == 0)
    {
      id v18 = [MEMORY[0x263F08850] defaultManager];
      objc_msgSend(v18, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v15, 0);
    }
    id v19 = [@"Spotlight_" stringByAppendingFormat:@"%@.log", v12];
    int v14 = [v15 stringByAppendingPathComponent:v19];
    id v13 = (const char *)[(__CFString *)v14 fileSystemRepresentation];
    uint64_t v5 = open(v13, 522, 384);
  }
  else
  {
    id v13 = 0;
    int v14 = @"corespotlight.log";
  }
  id v35 = (void (**)(void, void, void))v7;
  if ((int)v5 < 1) {
    CFStringRef v20 = 0;
  }
  else {
    CFStringRef v20 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v5 closeOnDealloc:1];
  }
  CFStringRef v21 = +[SPCoreSpotlightIndexer sharedInstance];
  CFArrayRef v22 = (void *)v12;
  CFDictionaryRef v23 = [NSString stringWithFormat:@"=== Spotlight Diagnostic (%d) %@\n\n", getpid(), v12];
  id v24 = [v23 dataUsingEncoding:4];
  int v25 = [v21 writeData:v24 toFile:v20];

  if (v25
    && +[SPCoreSpotlightIndexer writeDiagnostic:v20 bundleID:0 identifier:0 logQuery:v33])
  {
    int v26 = +[SPCoreSpotlightIndexer sharedInstance];
    unint64_t v27 = [@"=== Spotlight Diagnostic End\n" dataUsingEncoding:4];
    char v28 = [v26 writeData:v27 toFile:v20];
  }
  else
  {
    char v28 = 0;
  }
  id v29 = v22;
  if (v13 && (v28 & 1) == 0)
  {
    id v30 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v31 = [NSString stringWithUTF8String:v13];
    [v30 removeItemAtPath:v31 error:0];

    id v29 = v22;
  }
  [v20 closeFile];
  [v9 addObject:v14];
  if (![v9 count])
  {
    long long v32 = 0;
    if (!v35) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  long long v32 = [MEMORY[0x263F08AC0] dataWithPropertyList:v9 format:200 options:0 error:0];
  if (v35)
  {
LABEL_20:
    ((void (**)(void, void *, void))v35)[2](v35, v32, 0);
  }
LABEL_21:
}

- (void)_issueCacheCommand:(id)a3 xpc:(id)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  uint64_t v12 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightIndexer _issueCacheCommand:xpc:searchContext:completionHandler:]();
  }

  id v13 = [v9 componentsSeparatedByString:@":"];
  uint64_t v14 = [v13 count];
  if (!v14) {
    goto LABEL_35;
  }
  unint64_t v15 = v14;
  id v16 = [v13 objectAtIndexedSubscript:0];
  int v17 = [v16 isEqualToString:@"erase"];

  if (v17)
  {
    if (v15 >= 2)
    {
      uint64_t v18 = [v13 objectAtIndexedSubscript:1];
      id v19 = (void *)v18;
      CFStringRef v20 = (void *)*MEMORY[0x263F08098];
      if (v18) {
        CFStringRef v20 = (void *)v18;
      }
      id v21 = v20;
      CFArrayRef v22 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v21 andBundleID:0];
      CFDictionaryRef v23 = v22;
      BOOL v24 = v22 != 0;
      if (!v22)
      {
LABEL_44:

        if (!v11) {
          goto LABEL_49;
        }
        goto LABEL_45;
      }
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke;
      v86[3] = &unk_264508BA0;
      CFDictionaryRef v23 = v22;
      dispatch_source_t v87 = v23;
      id v88 = v11;
      [v23 closeCache:v86];

      id v11 = 0;
      BOOL v24 = 1;
      dispatch_queue_t v25 = v87;
LABEL_43:

      goto LABEL_44;
    }
    goto LABEL_37;
  }
  int v26 = [v13 objectAtIndexedSubscript:0];
  int v27 = [v26 isEqualToString:@"lookup"];

  if (v27)
  {
    if (v15 >= 4)
    {
      uint64_t v28 = [v13 objectAtIndexedSubscript:1];
      id v29 = [v13 objectAtIndexedSubscript:2];
      CFDictionaryRef v23 = [v13 objectAtIndexedSubscript:3];
      id v30 = (void *)*MEMORY[0x263F08098];
      long long v60 = (void *)v28;
      if (v28) {
        id v30 = (void *)v28;
      }
      uint64_t v31 = v30;
      long long v32 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v31 andBundleID:v29];
      BOOL v33 = v32;
      BOOL v24 = v32 != 0;
      if (v32)
      {
        queuea = self->_indexQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2231;
        block[3] = &unk_264508948;
        id v81 = v32;
        uint64_t v82 = v23;
        id v83 = v29;
        id v34 = v31;
        size_t v84 = v31;
        id v85 = v11;
        dispatch_sync(queuea, block);

        id v11 = 0;
      }
      else
      {
        id v34 = v31;
      }
      id v21 = v29;
      id v19 = v60;

      dispatch_queue_t v25 = v34;
      goto LABEL_43;
    }
    goto LABEL_37;
  }
  id v35 = [v13 objectAtIndexedSubscript:0];
  int v36 = [v35 isEqualToString:@"insert"];

  if (v36)
  {
    if (v15 >= 5)
    {
      uint64_t v37 = [v13 objectAtIndexedSubscript:1];
      long long v38 = [v13 objectAtIndexedSubscript:2];
      CFDictionaryRef v23 = [v13 objectAtIndexedSubscript:3];
      dispatch_queue_t queue = [v13 objectAtIndexedSubscript:4];
      id v39 = (void *)*MEMORY[0x263F08098];
      long long v61 = (void *)v37;
      if (v37) {
        id v39 = (void *)v37;
      }
      id v40 = v39;
      id v41 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v40 andBundleID:v38];
      long long v42 = v41;
      BOOL v24 = v41 != 0;
      if (v41)
      {
        indexQueue = self->_indexQueue;
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2;
        v73[3] = &unk_264508BC8;
        id v74 = v41;
        char v75 = v23;
        uint64_t v76 = queue;
        int v43 = v38;
        id v77 = v38;
        id v78 = v40;
        id v79 = v11;
        dispatch_sync(indexQueue, v73);

        long long v44 = v74;
LABEL_28:

        id v11 = 0;
LABEL_42:
        id v19 = v61;

        dispatch_queue_t v25 = queue;
        id v21 = v43;
        goto LABEL_43;
      }
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  uint64_t v45 = [v13 objectAtIndexedSubscript:0];
  int v46 = [v45 isEqualToString:@"delete"];

  if (!v46)
  {
    uint64_t v50 = [v13 objectAtIndexedSubscript:0];
    int v51 = [v50 isEqualToString:@"fileDescriptor"];

    if (v51)
    {
      if (v15 >= 3)
      {
        id v19 = [v13 objectAtIndexedSubscript:1];
        id v21 = [v13 objectAtIndexedSubscript:2];
        uint64_t v52 = (void *)*MEMORY[0x263F08098];
        if (v19) {
          uint64_t v52 = v19;
        }
        CFDictionaryRef v23 = v52;
        id v53 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v23 andBundleID:v21];
        dispatch_queue_t v25 = v53;
        BOOL v24 = v53 != 0;
        if (v53)
        {
          long long v54 = self->_indexQueue;
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_4;
          v62[3] = &unk_264507140;
          dispatch_queue_t v25 = v53;
          dispatch_queue_t v63 = v25;
          id v64 = v10;
          id v65 = v11;
          dispatch_sync(v54, v62);

          id v11 = 0;
          BOOL v24 = 1;
        }
        goto LABEL_43;
      }
      goto LABEL_37;
    }
LABEL_35:
    BOOL v24 = 1;
    if (!v11) {
      goto LABEL_49;
    }
    goto LABEL_45;
  }
  if (v15 >= 5)
  {
    uint64_t v47 = [v13 objectAtIndexedSubscript:1];
    long long v38 = [v13 objectAtIndexedSubscript:2];
    CFDictionaryRef v23 = [v13 objectAtIndexedSubscript:3];
    dispatch_queue_t queue = [v13 objectAtIndexedSubscript:4];
    int v48 = (void *)*MEMORY[0x263F08098];
    long long v61 = (void *)v47;
    if (v47) {
      int v48 = (void *)v47;
    }
    id v40 = v48;
    uint64_t v49 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v40 andBundleID:v38];
    long long v42 = v49;
    BOOL v24 = v49 != 0;
    if (v49)
    {
      long long v57 = self->_indexQueue;
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_3;
      v66[3] = &unk_264508BC8;
      id v67 = v49;
      id v68 = v23;
      id v69 = queue;
      int v43 = v38;
      id v70 = v38;
      id v71 = v40;
      id v72 = v11;
      dispatch_sync(v57, v66);

      long long v44 = v67;
      goto LABEL_28;
    }
LABEL_41:
    int v43 = v38;
    goto LABEL_42;
  }
LABEL_37:
  BOOL v24 = 0;
  if (!v11) {
    goto LABEL_49;
  }
LABEL_45:
  if (v24)
  {
    long long v55 = 0;
  }
  else
  {
    long long v55 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2005 userInfo:0];
  }
  (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v55);

LABEL_49:
}

void __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _indexPath];
  uint64_t v3 = [NSURL fileURLWithPath:v2 isDirectory:1];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v24 = v1;
    dispatch_queue_t v25 = v2;
    id v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = *MEMORY[0x263EFF6A8];
    id v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF750], *MEMORY[0x263EFF6A8], *MEMORY[0x263EFF688], 0);
    CFDictionaryRef v23 = v3;
    id v10 = [v7 enumeratorAtURL:v3 includingPropertiesForKeys:v9 options:4 errorHandler:0];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v26 = 0;
          [v16 getResourceValue:&v26 forKey:v8 error:0];
          id v17 = v26;
          if (([v17 BOOLValue] & 1) == 0)
          {
            uint64_t v18 = [v16 absoluteString];
            int v19 = [v18 containsString:@"spotlightcache"];

            if (v19)
            {
              CFStringRef v20 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                id v21 = [v16 absoluteString];
                *(_DWORD *)stat buf = 138412290;
                long long v32 = v21;
                _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "Spotlight cache erase %@", buf, 0xCu);
              }
              CFArrayRef v22 = [MEMORY[0x263F08850] defaultManager];
              [v22 removeItemAtURL:v16 error:0];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v13);
    }

    uint64_t v1 = v24;
    id v2 = v25;
    uint64_t v3 = v23;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

void __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2231(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  v4[0] = a1[5];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 cacheEntryForKeys:v3 bundleID:a1[6] protectionClass:a1[7] completionHandler:a1[8]];
}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacheInsertForKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48) bundleID:*(void *)(a1 + 56) protectionClass:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacheDeleteForKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48) bundleID:*(void *)(a1 + 56) protectionClass:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) spotlightCacheFileDescriptor:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (id)writeUISearchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  void v26[4] = *MEMORY[0x263EF8340];
  id v4 = [(id)sDelegate indexDirectory];
  uint64_t v5 = NSURL;
  int v6 = NSHomeDirectory();
  v26[0] = v6;
  v26[1] = @"Library";
  v26[2] = @"Containers";
  v26[3] = @"com.apple.managedcorespotlightd";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  uint64_t v8 = [v5 fileURLWithPathComponents:v7];

  id v9 = NSURL;
  id v10 = NSHomeDirectory();
  v25[0] = v10;
  v25[1] = @"Library";
  void v25[2] = @"Containers";
  v25[3] = @"com.apple.managedcorespotlightd";
  v25[4] = @"EnabledIndexes";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:5];
  uint64_t v12 = [v9 fileURLWithPathComponents:v11];

  if (!v12)
  {
    id v16 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfURL:v12];
  if (!v13) {
    uint64_t v13 = objc_opt_new();
  }
  int v14 = [v13 containsObject:v4];
  if ((v14 & 1) == 0 && v3)
  {
    unint64_t v15 = [v13 arrayByAddingObject:v4];
    goto LABEL_11;
  }
  id v16 = 0;
  if (v14 && !v3)
  {
    uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != %@", v4];
    unint64_t v15 = [v13 filteredArrayUsingPredicate:v17];

    uint64_t v13 = (void *)v17;
LABEL_11:

    uint64_t v18 = [MEMORY[0x263F08850] defaultManager];
    id v24 = 0;
    int v19 = [v18 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v20 = v24;

    if (!v19 || v20)
    {
      id v21 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer writeUISearchEnabled:]();
      }
    }
    if ([v15 writeToURL:v12 atomically:1])
    {
      id v16 = 0;
    }
    else
    {
      CFArrayRef v22 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SPCoreSpotlightIndexer writeUISearchEnabled:]();
      }

      id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    }

    goto LABEL_23;
  }
  unint64_t v15 = v13;
LABEL_23:

LABEL_24:
  return v16;
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "#index reset", v8, 2u);
  }

  uint64_t v1 = [(id)sDelegate indexDirectory];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)&void v8[4] = v1;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Spotlight index reset %@", v8, 0xCu);
  }

  v8[0] = 0;
  BOOL v3 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", *(void *)v8);
  int v4 = [v3 fileExistsAtPath:v1 isDirectory:v8];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    [v5 removeItemAtPath:v1 error:0];
  }
  int v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = [v6 persistentDomainForName:@"com.apple.spotlightknowledge"];
  if (v7) {
    [v6 removePersistentDomainForName:@"com.apple.spotlightknowledge"];
  }
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2316(uint64_t a1)
{
  id v8 = [MEMORY[0x263EFF980] array];
  id v2 = [MEMORY[0x263F02B50] sharedManager];
  BOOL v3 = [v2 extensions];
  [v8 addObjectsFromArray:v3];

  int v4 = [MEMORY[0x263F02B48] sharedManager];
  uint64_t v5 = [v4 extensions];
  [v8 addObjectsFromArray:v5];

  int v6 = [v8 componentsJoinedByString:@"\n"];
  id v7 = [v6 dataUsingEncoding:4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v20 = a1;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 136) allValues];
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        int v4 = *(void **)(*((void *)&v29 + 1) + 8 * v3);
        [v2 appendString:@"\n"];
        uint64_t v5 = [v4 knownClients];
        int v6 = [v5 allObjects];
        uint64_t v7 = [v6 componentsJoinedByString:@", "];
        id v8 = (void *)v7;
        if (v7) {
          uint64_t v9 = (__CFString *)v7;
        }
        else {
          uint64_t v9 = &stru_26D0BD940;
        }
        [v2 appendString:v9];

        id v10 = [v4 checkedInClients];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              id v16 = [v10 objectForKey:v15];
              uint64_t v17 = [v4 dataclass];
              [v2 appendFormat:@"\n%@ (%@) - %@", v15, v17, v16];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v12);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  uint64_t v18 = *(void *)(v20 + 40);
  int v19 = [v2 dataUsingEncoding:4];
  (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2323(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2324;
  v2[3] = &unk_264506548;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 commitUpdatesWithCompletionHandler:v2];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2374(uint64_t a1)
{
  wait_for_apfs_kb_state((const char *)sIndexMountPath, 1);
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilUnlocked complete", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2378(uint64_t a1)
{
  wait_for_apfs_kb_state((const char *)sIndexMountPath, 0);
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilLocked complete", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2382(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2402(uint64_t a1)
{
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2406(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if ([v7 length])
  {
    id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  uint64_t v9 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    if (v6) {
      id v12 = v6;
    }
    else {
      id v12 = v8;
    }
    int v14 = 138412802;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "Client state %@ %@: %@", (uint8_t *)&v14, 0x20u);
  }

  uint64_t v13 = a1[6];
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v7, v6);
  }
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2414(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2427(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2428(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 updateRankingDates:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 updateEmailLocalParts:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 updateEmailContentURLAttr:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 updateContainersAndScores:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 updateGroups:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 updateNotes:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 setProperty:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40) sync:1];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 setProperty:*(void *)(a1 + 32) forKey:@"kSPUISearchEnabled" sync:1];
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  id v9 = [v4 dataclass];
  id v5 = [v4 getPropertyForKey:*(void *)(a1 + 32)];

  uint64_t v6 = [v3 stringByAppendingFormat:@"\n%@ - %@", v9, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2606(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "### %@ complete res: %d", (uint8_t *)&v6, 0x12u);
  }

  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2607(uint64_t a1)
{
  uint64_t v2 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v2 userInfo:0];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  return MEMORY[0x270F9A790]();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2614(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a2 userInfo:0];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "### %@ complete res: %d", (uint8_t *)&v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2618(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    int v14 = a2;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "### priorityReset - transferred priority items to default index res: %d", buf, 8u);
  }

  if (a2)
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setProperty:&unk_26D0C8F50 forKey:@"kSPPriorityIndexVersion" sync:0];
    uint64_t v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2619;
    v9[3] = &unk_264508CE0;
    id v12 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    [v6 commitUpdatesWithCompletionHandler:v9];

    uint64_t v5 = v12;
  }
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2619(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) closeIndex];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 40) priorityIndexPath];
  [v2 removeItemAtPath:v3 error:0];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [*(id *)(a1 + 40) priorityIndexAvailableTouchFilePath];
  [v4 removeItemAtPath:v5 error:0];

  uint64_t v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "### priorityReset complete, exiting", v7, 2u);
  }

  exit(0);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2623(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "locking", v4, 2u);
  }

  return [*(id *)(a1 + 32) locking];
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2627(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "unlocking", v4, 2u);
  }

  return [*(id *)(a1 + 32) unlock];
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2646(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v4 dataclass];
  int v6 = v4[97];

  id v7 = @"YES";
  if (!v6) {
    id v7 = @"NO";
  }
  [v3 stringWithFormat:@"%@: readOnly = %@\n", v5, v7];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v11];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_2665(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3_2669(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4_2700(uint64_t a1)
{
  id v5 = [MEMORY[0x263F02A50] sharedInstance];
  uint64_t v2 = [v5 dumpAppContainerCache];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5_2701(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"\t%@ : {\n", a2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6_2705;
  v7[3] = &unk_264508D58;
  id v8 = *(id *)(a1 + 32);
  [v6 enumerateKeysAndObjectsUsingBlock:v7];

  [*(id *)(a1 + 32) appendFormat:@"\t}\n"];
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6_2705(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 appendFormat:@"\t\t%@ : 0x%016llx\n", v5, objc_msgSend(a3, "longLongValue")];
}

- (void)topKTerms:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v21[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke;
  v12[3] = &unk_264508D80;
  id v9 = v6;
  id v13 = v9;
  int v14 = &v15;
  [(SPCoreSpotlightIndexer *)self _enumerateIndexersWithProtectionClasses:v8 inferPriorityIndex:0 block:v12];

  id v10 = (void *)v16[5];
  if (v10)
  {
    [v10 index];
    id v11 = v7;
    SIFetchTopKTerms();
  }
  _Block_object_dispose(&v15, 8);
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v4 = [v6 dataclass];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id v11 = (id)objc_opt_new();
  if (a2)
  {
    _MDPlistGetRootPlistObjectFromPlist();
    if (_MDPlistGetPlistObjectType() == 241) {
      _MDPlistDictionaryIterate();
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [(id)v7[5] dataUsingEncoding:4];
  (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);

  _Block_object_dispose(&v6, 8);
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3_cold_1();
  }
  uint64_t v3 = [NSString stringWithUTF8String:a2];
  if (_MDPlistGetPlistObjectType() == 241)
  {
    id v4 = v3;
    _MDPlistDictionaryIterate();
  }
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a3) {
    __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4_cold_1();
  }
  uint64_t v6 = (id)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u);
  *(_OWORD *)stat buf = *(_OWORD *)a4;
  *(void *)&uint8_t buf[16] = *(void *)(a4 + 16);
  id v7 = [NSNumber numberWithDouble:(double)_MDPlistNumberGetIntValue()];
  uint64_t v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)stat buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v11 = v7;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "bundleIndex: %@, key: %@, value: %@", buf, 0x20u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@"\n%@ %@ %@", v6, v7, *(void *)(a1 + 32)];
  CFRelease(v6);
}

- (void)performIndexerTask:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v6 job];
    uint64_t v10 = [v9 jobType];

    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1)
      {
LABEL_26:
        long long v27 = [(SPCoreSpotlightIndexer *)self firstUnlockQueue];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke;
        v31[3] = &unk_264507140;
        id v32 = v6;
        BOOL v33 = self;
        id v34 = v8;
        long long v28 = _setup_block(v31, 0, 17642);
        dispatch_async(v27, v28);

        goto LABEL_27;
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
      long long v39 = 0u;
      id v11 = [v6 bundleIDs];
      uint64_t v18 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        long long v29 = self;
        long long v30 = v8;
        uint64_t v20 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v11);
            }
            uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            if (isAppleInternalInstall())
            {
              uint64_t v23 = [v6 job];
              uint64_t v24 = [v23 identifiersToReindex];
              uint64_t v25 = [v24 count];
            }
            else
            {
              uint64_t v25 = 1;
            }
            long long v26 = [MEMORY[0x263F02A98] sharedInstance];
            [v26 logWithBundleID:v22 indexOperation:8 itemCount:v25 code:7];
          }
          uint64_t v19 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v19);
        self = v29;
        uint64_t v8 = v30;
      }
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = [v6 bundleIDs];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * j);
            uint64_t v17 = [MEMORY[0x263F02A98] sharedInstance];
            [v17 logWithBundleID:v16 indexOperation:9 itemCount:1 code:6];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v13);
      }
    }

    goto LABEL_26;
  }
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
LABEL_27:
}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v3 = dispatch_group_create();
  id v4 = [*(id *)(a1 + 32) completedBundleIDs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) completedBundleIDs];
    [v2 addObjectsFromArray:v6];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) indexers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        dispatch_group_enter(v3);
        uint64_t v12 = *(void *)(a1 + 32);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        void v23[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2;
        void v23[3] = &unk_2645070C8;
        id v24 = v2;
        uint64_t v25 = v3;
        [v11 performIndexerTask:v12 withIndexDelegatesAndCompletionHandler:v23];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [*(id *)(a1 + 40) firstUnlockQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3;
  v18[3] = &unk_2645070F0;
  id v19 = *(id *)(a1 + 32);
  id v20 = v2;
  uint64_t v14 = *(void **)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 40);
  id v22 = v14;
  id v15 = v2;
  uint64_t v16 = _setup_block(v18, 0, 17641);
  dispatch_group_notify(v3, v13, v16);
}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [SPCoreSpotlightIndexerTask alloc];
  id v3 = [*(id *)(a1 + 32) job];
  id v4 = [*(id *)(a1 + 32) indexers];
  uint64_t v7 = [(SPCoreSpotlightIndexerTask *)v2 initWithIndexJob:v3 indexers:v4];

  uint64_t v5 = [*(id *)(a1 + 32) bundleIDs];
  [(SPCoreSpotlightIndexerTask *)v7 setBundleIDs:v5];

  id v6 = [*(id *)(a1 + 40) allObjects];
  [(SPCoreSpotlightIndexerTask *)v7 setCompletedBundleIDs:v6];

  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v7, "setDataMigrationStage:", [*(id *)(a1 + 32) dataMigrationStage]);
  -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v7, "setShouldResumeOnFailure:", [*(id *)(a1 + 32) shouldResumeOnFailure]);
  [*(id *)(a1 + 48) performIndexerTask:v7 withIndexExtensionsAndCompletionHandler:*(void *)(a1 + 56)];
}

- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(v6, "indexers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) addCompletedBundleIDs:v5 forIndexerTask:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)performIndexerTask:(id)a3 withIndexExtensionsAndCompletionHandler:(id)a4
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [(SPCoreSpotlightIndexer *)self firstUnlockQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(SPCoreSpotlightIndexer *)self extensionDelegate];
  if (v9)
  {
    v102 = self;
    uint64_t v10 = [v6 job];
    uint64_t v11 = [v6 bundleIDs];
    long long v12 = [v6 completedBundleIDs];
    long long v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v6 dataMigrationStage];
      uint64_t v15 = [(SPCoreSpotlightIndexer *)v102 dataMigrationStage];
      uint64_t v16 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
      *(_DWORD *)stat buf = 138413314;
      id v141 = v11;
      __int16 v142 = 2112;
      int v143 = v12;
      __int16 v144 = 2048;
      uint64_t v145 = v14;
      __int16 v146 = 2048;
      uint64_t v147 = v15;
      __int16 v148 = 2112;
      v149 = v16;
      _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "bundleIDs:%@, completedBundleIDs:%@, dataMigrationStage:%ld/%ld, dataMigrationBundleIDs:%@", buf, 0x34u);
    }
    if ([v11 count] == 1)
    {
      uint64_t v17 = [v11 firstObject];
      if (![v12 containsObject:v17])
      {
        unint64_t v18 = [v6 dataMigrationStage];
        if (v18 < [(SPCoreSpotlightIndexer *)v102 dataMigrationStage])
        {
          uint64_t v19 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
          if (!v19
            || (id v20 = (void *)v19,
                [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs],
                uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                int v22 = [v21 containsObject:v17],
                v21,
                v20,
                v22))
          {
            uint64_t v23 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v101 = [v6 dataMigrationStage];
              size_t v84 = v10;
              uint64_t v85 = [(SPCoreSpotlightIndexer *)v102 dataMigrationStage];
              [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
              dispatch_source_t v87 = v86 = v17;
              *(_DWORD *)stat buf = 138413314;
              id v141 = v84;
              __int16 v142 = 2112;
              int v143 = v86;
              __int16 v144 = 2048;
              uint64_t v145 = v101;
              __int16 v146 = 2048;
              uint64_t v147 = v85;
              __int16 v148 = 2112;
              v149 = v87;
              _os_log_debug_impl(&dword_21F1CE000, v23, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);

              uint64_t v17 = v86;
              uint64_t v10 = v84;
            }

            int v139 = v17;
            id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
            [(SPCoreSpotlightIndexer *)v102 addCompletedBundleIDs:v24 forIndexerTask:v6];

            goto LABEL_60;
          }
        }
        long long v59 = +[SpotlightDaemonServer sharedDaemonServer];
        long long v60 = v17;
        uint64_t v61 = *MEMORY[0x263F08098];
        v133[0] = MEMORY[0x263EF8330];
        v133[1] = 3221225472;
        v133[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke;
        v133[3] = &unk_264508C18;
        BOOL v100 = v10;
        id v62 = v10;
        id v134 = v62;
        id v63 = v60;
        id v135 = v63;
        v97 = v7;
        id v136 = v97;
        LODWORD(v61) = [v59 handleJob:v62 bundleID:v63 protectionClass:v61 completionHandler:v133];

        id v64 = logForCSLogCategoryIndex();
        BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
        if (v61)
        {
          uint64_t v17 = v63;
          if (v65) {
            -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:]();
          }
        }
        else
        {
          uint64_t v17 = v63;
          if (v65) {
            -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:]();
          }

          v127[0] = MEMORY[0x263EF8330];
          v127[1] = 3221225472;
          v127[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2724;
          v127[3] = &unk_264508948;
          id v128 = v62;
          id v129 = v63;
          v130 = v102;
          id v131 = v6;
          long long v132 = v97;
          [v9 indexRequestsPerformJob:v128 forBundle:v129 completionHandler:v127];

          id v64 = v128;
        }
        uint64_t v10 = v100;

        id v66 = v134;
LABEL_58:

LABEL_71:
        goto LABEL_72;
      }
      goto LABEL_60;
    }
    id v94 = v12;
    if ([v11 count])
    {
      uint64_t v25 = [v6 bundleIDs];
      uint64_t v17 = (void *)[v25 mutableCopy];

      [v17 removeObjectsInArray:v12];
      if ([v17 count])
      {
        int v98 = v10;
        id v92 = v9;
        unint64_t v26 = [v6 dataMigrationStage];
        if (v26 < [(SPCoreSpotlightIndexer *)v102 dataMigrationStage])
        {
          uint64_t v27 = [v17 count];
          if (v27)
          {
            uint64_t v28 = v27;
            dispatch_source_t v90 = v11;
            uint64_t v29 = 0;
            long long v30 = 0;
            do
            {
              uint64_t v31 = v17;
              id v32 = [v17 objectAtIndexedSubscript:v29];
              uint64_t v33 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
              if (!v33
                || (id v34 = (void *)v33,
                    [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs],
                    long long v35 = objc_claimAutoreleasedReturnValue(),
                    int v36 = [v35 containsObject:v32],
                    v35,
                    v34,
                    v36))
              {
                long long v37 = logForCSLogCategoryIndex();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v95 = [v6 dataMigrationStage];
                  uint64_t v39 = [(SPCoreSpotlightIndexer *)v102 dataMigrationStage];
                  long long v40 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
                  *(_DWORD *)stat buf = 138413314;
                  id v141 = v98;
                  __int16 v142 = 2112;
                  int v143 = v32;
                  __int16 v144 = 2048;
                  uint64_t v145 = v95;
                  __int16 v146 = 2048;
                  uint64_t v147 = v39;
                  __int16 v148 = 2112;
                  v149 = v40;
                  _os_log_debug_impl(&dword_21F1CE000, v37, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);
                }
                v138 = v32;
                long long v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
                [(SPCoreSpotlightIndexer *)v102 addCompletedBundleIDs:v38 forIndexerTask:v6];

                if (!v30) {
                  long long v30 = objc_opt_new();
                }
                [v30 addIndex:v29];
              }
              uint64_t v17 = v31;

              ++v29;
            }
            while (v28 != v29);
            uint64_t v11 = v90;
            long long v12 = v94;
            if (v30)
            {
              [v17 removeObjectsAtIndexes:v30];
            }
          }
        }
        if ([v17 count])
        {
          id v67 = logForCSLogCategoryIndex();
          uint64_t v9 = v92;
          uint64_t v10 = v98;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
            -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:].cold.4();
          }

          v123[0] = MEMORY[0x263EF8330];
          v123[1] = 3221225472;
          v123[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2726;
          v123[3] = &unk_264508DF8;
          id v124 = v98;
          int v125 = v102;
          id v126 = v6;
          v120[0] = MEMORY[0x263EF8330];
          v120[1] = 3221225472;
          v120[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2728;
          v120[3] = &unk_264507168;
          id v121 = v124;
          id v122 = v7;
          [v92 indexRequestsPerformJob:v121 forBundles:v17 perExtensionCompletionHandler:v123 completionHandler:v120];

          id v66 = v124;
          goto LABEL_58;
        }
        uint64_t v9 = v92;
        uint64_t v10 = v98;
      }
LABEL_60:
      if (v7) {
        v7[2](v7);
      }
      goto LABEL_71;
    }
    id v88 = v7;
    id v41 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if ([v12 count]) {
      [v41 addObjectsFromArray:v12];
    }
    unint64_t v42 = [v6 dataMigrationStage];
    int v43 = v102;
    id v89 = v41;
    dispatch_object_t v91 = v11;
    if (v42 >= [(SPCoreSpotlightIndexer *)v102 dataMigrationStage])
    {
LABEL_66:
      id v71 = [v41 allObjects];
      [v10 setExcludedBundleIDs:v71];

      id v72 = dispatch_group_create();
      dispatch_group_enter(v72);
      dispatch_group_enter(v72);
      v73 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:]();
      }

      v112[0] = MEMORY[0x263EF8330];
      v112[1] = 3221225472;
      v112[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2729;
      v112[3] = &unk_264508DF8;
      id v113 = v10;
      id v114 = v43;
      id v74 = v6;
      id v115 = v74;
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2730;
      v109[3] = &unk_2645065E8;
      id v75 = v113;
      id v110 = v75;
      uint64_t v76 = v72;
      int v111 = v76;
      [v9 indexRequestsPerformJob:v75 perExtensionCompletionHandler:v112 completionHandler:v109];
      id v77 = logForCSLogCategoryIndex();
      uint64_t v7 = v88;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        id v78 = [v75 excludedBundleIDs];
        *(_DWORD *)stat buf = 138412546;
        id v141 = v75;
        __int16 v142 = 2112;
        int v143 = v78;
        _os_log_impl(&dword_21F1CE000, v77, OS_LOG_TYPE_DEFAULT, "Performing job:%@ with spotlight daemon clients, excludedBundleIDs:%@", buf, 0x16u);
      }
      id v79 = +[SpotlightDaemonServer sharedDaemonServer];
      uint64_t v80 = *MEMORY[0x263F08098];
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2731;
      v107[3] = &unk_264508E20;
      v107[4] = v102;
      id v108 = v74;
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2;
      v105[3] = &unk_2645063F8;
      int v106 = v76;
      id v81 = v76;
      [v79 handleJob:v75 protectionClass:v80 perClientCompletionHandler:v107 completionHandler:v105];

      qos_class_t v82 = qos_class_self();
      id v83 = dispatch_get_global_queue(v82, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_3;
      block[3] = &unk_264506548;
      int v104 = v88;
      dispatch_group_notify(v81, v83, block);

      uint64_t v17 = v89;
      uint64_t v11 = v91;
      long long v12 = v94;
      goto LABEL_71;
    }
    id v99 = v10;
    id v44 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if ([v11 count])
    {
      id v93 = v9;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v45 = v11;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v116 objects:v137 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        v96 = v6;
        uint64_t v48 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v117 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            uint64_t v51 = [(SPCoreSpotlightIndexer *)v43 dataMigrationBundleIDs];
            if (v51)
            {
              uint64_t v52 = (void *)v51;
              id v53 = [(SPCoreSpotlightIndexer *)v43 dataMigrationBundleIDs];
              int v54 = [v53 containsObject:v50];

              if (!v54) {
                continue;
              }
            }
            long long v55 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v56 = [v96 dataMigrationStage];
              uint64_t v57 = [(SPCoreSpotlightIndexer *)v43 dataMigrationStage];
              long long v58 = [(SPCoreSpotlightIndexer *)v43 dataMigrationBundleIDs];
              *(_DWORD *)stat buf = 138413314;
              id v141 = v99;
              __int16 v142 = 2112;
              int v143 = v50;
              __int16 v144 = 2048;
              uint64_t v145 = v56;
              __int16 v146 = 2048;
              uint64_t v147 = v57;
              __int16 v148 = 2112;
              v149 = v58;
              _os_log_debug_impl(&dword_21F1CE000, v55, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);

              int v43 = v102;
            }

            [v44 addObject:v50];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v116 objects:v137 count:16];
        }
        while (v47);
        id v6 = v96;
        id v41 = v89;
      }
    }
    else
    {
      id v68 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
      uint64_t v69 = [v68 count];

      if (!v69)
      {
LABEL_65:
        [v41 unionSet:v44];
        id v70 = [v44 allObjects];
        [(SPCoreSpotlightIndexer *)v43 addCompletedBundleIDs:v70 forIndexerTask:v6];

        uint64_t v10 = v99;
        goto LABEL_66;
      }
      id v93 = v9;
      id v45 = [(SPCoreSpotlightIndexer *)v102 dataMigrationBundleIDs];
      [v44 unionSet:v45];
    }

    uint64_t v9 = v93;
    goto LABEL_65;
  }
  if (v7) {
    v7[2](v7);
  }
LABEL_72:
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_cold_1();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2724(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2724_cold_1();
  }

  id v3 = (void *)a1[6];
  v6[0] = a1[5];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 addCompletedBundleIDs:v4 forIndexerTask:a1[7]];

  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2726(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)stat buf = 138412802;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEBUG, "Done performing job:%@ with extension \"%@\", error:%@", buf, 0x20u);
  }

  uint64_t v8 = (void *)a1[5];
  id v11 = v5;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v8 addCompletedBundleIDs:v9 forIndexerTask:a1[6]];
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2728(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2728_cold_1();
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2729(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)stat buf = 138412802;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEBUG, "Done performing job:%@ with extension \"%@\", error:%@", buf, 0x20u);
  }

  uint64_t v8 = (void *)a1[5];
  id v11 = v5;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v8 addCompletedBundleIDs:v9 forIndexerTask:a1[6]];
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2730(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2728_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2731(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  uint64_t v7 = a2;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "addCompletedBundleIDs:forIndexerTask:", v6, *(void *)(a1 + 40), v7, v8);
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  int v22 = (void *)*MEMORY[0x263F08098];
  if (v17) {
    int v22 = v17;
  }
  id v23 = v22;
  id v24 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v23 andBundleID:v18];
  uint64_t v25 = v24;
  if (v24)
  {
    dispatch_queue_t queue = sIndexQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__SPCoreSpotlightIndexer_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke;
    block[3] = &unk_264508E48;
    id v29 = v24;
    id v30 = v16;
    id v31 = v18;
    id v32 = v19;
    id v33 = v20;
    unsigned int v35 = a8;
    id v34 = v21;
    dispatch_block_t v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a9, 0, block);
    dispatch_async(queue, v26);
  }
  else if (v21)
  {
    (*((void (**)(id, void, void))v21 + 2))(v21, 0, 0);
  }
}

uint64_t __115__SPCoreSpotlightIndexer_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAttributes:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) identifiers:*(void *)(a1 + 56) userCtx:*(void *)(a1 + 64) flags:*(unsigned int *)(a1 + 80) completionHandler:*(void *)(a1 + 72)];
}

- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(int)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  id v21 = (void *)*MEMORY[0x263F08098];
  if (v15) {
    id v21 = v15;
  }
  id v22 = v21;
  id v23 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v22 andBundleID:v17];
  id v24 = v23;
  if (v23)
  {
    uint64_t v25 = sIndexQueue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __117__SPCoreSpotlightIndexer_fetchAttributesForProtectionClass_attributes_bundleID_identifiers_userCtx_flags_completion___block_invoke;
    v27[3] = &unk_264508E48;
    id v28 = v23;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    id v32 = v19;
    int v34 = a8;
    id v33 = v20;
    dispatch_block_t v26 = _setup_block(v27, 0, 17852);
    dispatch_async(v25, v26);
  }
  else if (v20)
  {
    (*((void (**)(id, void))v20 + 2))(v20, 0);
  }
}

uint64_t __117__SPCoreSpotlightIndexer_fetchAttributesForProtectionClass_attributes_bundleID_identifiers_userCtx_flags_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAttributes:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) identifiers:*(void *)(a1 + 56) userCtx:*(void *)(a1 + 64) flags:*(unsigned int *)(a1 + 80) completion:*(void *)(a1 + 72)];
}

- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completion:(id)a7
{
}

- (void)fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(unsigned int)a7 qos:(unsigned int)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  id v20 = (void *)*MEMORY[0x263F08098];
  if (v15) {
    id v20 = v15;
  }
  id v21 = v20;
  id v22 = [(SPCoreSpotlightIndexer *)self concreteIndexerForProtectionClass:v21 andBundleID:v16];
  id v23 = v22;
  if (v22)
  {
    id v24 = sIndexQueue;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __127__SPCoreSpotlightIndexer_fetchCacheFileDescriptorsForProtectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke;
    v26[3] = &unk_264508E70;
    id v27 = v22;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    unsigned int v32 = a7;
    id v31 = v19;
    dispatch_block_t v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a8, 0, v26);
    dispatch_async(v24, v25);
  }
  else if (v19)
  {
    (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
  }
}

uint64_t __127__SPCoreSpotlightIndexer_fetchCacheFileDescriptorsForProtectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchCacheFileDescriptorsForBundleID:*(void *)(a1 + 40) identifiers:*(void *)(a1 + 48) userCtx:*(void *)(a1 + 56) flags:*(unsigned int *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
}

- (void)revokeExpiredItems:(id)a3 protected:(BOOL)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke;
  v11[3] = &unk_264506B18;
  BOOL v13 = a4;
  void v11[4] = self;
  id v12 = v6;
  uint64_t v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x223C48320](v11);
  uint64_t v9 = sIndexQueue;
  uint64_t v10 = _setup_block(v8, 0, 17916);
  dispatch_group_async(v7, v9, v10);
}

void __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    _checkUnlock();
    uint64_t v2 = *MEMORY[0x263F08088];
    v11[0] = *MEMORY[0x263F08080];
    v11[1] = v2;
    _OWORD v11[2] = *MEMORY[0x263F080A0];
    id v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = v11;
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08098];
    id v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = &v10;
    uint64_t v5 = 1;
  }
  id v6 = [v3 arrayWithObjects:v4 count:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke_2;
  v8[3] = &unk_2645085C0;
  uint64_t v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v7 _enumerateIndexersWithProtectionClasses:v6 block:v8];
}

uint64_t __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 revokeExpiredItems:*(void *)(a1 + 32)];
}

- (void)powerStateChanged
{
  if (!deviceUnlocked) {
    SIResumeForUnlock();
  }
  id v3 = sIndexQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke;
  v5[3] = &unk_2645063F8;
  void v5[4] = self;
  id v4 = _setup_block(v5, 0, 17926);
  dispatch_async(v3, v4);
}

uint64_t __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateIndexersWithBlock:&__block_literal_global_2734];
}

uint64_t __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 powerStateChanged];
}

- (id)queryForWord:(id)a3 matchingAttributes:(id)a4 prefixMatch:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  uint64_t v10 = [v8 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    if (v5) {
      BOOL v13 = @"|| (%@=\"%@*\"cwdt)";
    }
    else {
      BOOL v13 = @"|| (%@=\"%@\"cwdt)";
    }
    if (v5) {
      __int16 v14 = @"(%@=\"%@*\"cwdt)";
    }
    else {
      __int16 v14 = @"(%@=\"%@\"cwdt)";
    }
    do
    {
      id v15 = [v8 objectAtIndex:v12];
      if (v12) {
        id v16 = v13;
      }
      else {
        id v16 = v14;
      }
      id v17 = v16;
      objc_msgSend(v9, "appendFormat:", v17, v15, v7);

      ++v12;
    }
    while (v11 != v12);
  }

  return v9;
}

- (NSURL)personaListURL
{
  if (sPrivate)
  {
    uint64_t v2 = 0;
  }
  else
  {
    id v3 = objc_alloc(NSURL);
    id v4 = NSString;
    BOOL v5 = NSHomeDirectory();
    id v6 = [v4 stringWithFormat:@"%@/%@", v5, @"Library/Spotlight/PersonaList.plist"];
    uint64_t v2 = (void *)[v3 initFileURLWithPath:v6];
  }
  return (NSURL *)v2;
}

- (void)personaListDidUpdate
{
  if (!sPrivate)
  {
    id v3 = [MEMORY[0x263F841B0] sharedManager];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    void v4[2] = __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke;
    v4[3] = &unk_264508E98;
    void v4[4] = self;
    [v3 fetchAllPersonasWithCompletionHandler:v4];
  }
}

void __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) objectForKey:@"UserPersonaUniqueString"];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  if (([*(id *)(*(void *)(a1 + 32) + 208) isEqual:v4] & 1) == 0)
  {
    uint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 32) + 208) mutableCopy];
    [v11 minusSet:v4];
    if ([v11 count])
    {
      NSLog(&cfstr_MissingPersona.isa, v11);
      [*(id *)(*(void *)(a1 + 32) + 208) unionSet:v4];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 208) allObjects];
      BOOL v13 = [*(id *)(a1 + 32) personaListURL];
      [v12 writeToURL:v13 error:0];

      __int16 v14 = dispatch_group_create();
      dispatch_group_enter(v14);
      id v15 = *(void **)(a1 + 32);
      id v16 = [v11 allObjects];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke_2;
      v22[3] = &unk_264507A90;
      void v22[4] = *(void *)(a1 + 32);
      id v23 = v4;
      id v24 = v14;
      id v17 = v14;
      [v15 deleteSearchableItemsWithPersonaIds:v16 completionHandler:v22];

      dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v18 = [v4 mutableCopy];
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(void **)(v19 + 208);
      *(void *)(v19 + 208) = v18;

      id v17 = [*(id *)(*(void *)(a1 + 32) + 208) allObjects];
      id v21 = [*(id *)(a1 + 32) personaListURL];
      [v17 writeToURL:v21 error:0];
    }
  }
}

void __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    *(unsigned char *)(v3 + 80) = 1;
  }
  else
  {
    *(unsigned char *)(v3 + 80) = 0;
    uint64_t v4 = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v4;

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 208) allObjects];
    uint64_t v8 = [*(id *)(a1 + 32) personaListURL];
    [v7 writeToURL:v8 error:0];
  }
  uint64_t v9 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v9);
}

- (void)handleRankingCommand:(id)a3 completion:(id)a4
{
  v31[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"update"])
  {
    [(id)sDelegate updateApplicationsWithCompletion:v7 clean:0];
  }
  else if ([v6 isEqualToString:@"reset"])
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [(id)objc_opt_class() allProtectionClasses];
    [v8 setProtectionClasses:v9];

    uint64_t v10 = *MEMORY[0x263F01E20];
    v31[0] = *MEMORY[0x263F02938];
    v31[1] = v10;
    v31[2] = @"_kMDItemLaunchString";
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    [v8 setFetchAttributes:v11];

    [v8 setInternal:1];
    uint64_t v12 = objc_opt_new();
    BOOL v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    __int16 v14 = [NSString stringWithFormat:@"%@=*", @"_kMDItemLaunchString"];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke;
    v28[3] = &unk_264507610;
    id v29 = v8;
    id v30 = v12;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_3;
    v24[3] = &unk_264507A90;
    id v25 = v30;
    long long v26 = self;
    id v15 = v13;
    long long v27 = v15;
    id v16 = v30;
    id v17 = v8;
    uint64_t v18 = [(SPCoreSpotlightIndexer *)self startQueryWithQueryString:v14 queryContext:v17 eventHandler:0 resultsHandler:v28 completionHandler:v24];

    if (!v18) {
      dispatch_group_leave(v15);
    }
    qos_class_t v19 = qos_class_self();
    id v20 = dispatch_get_global_queue(v19, 2uLL);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_5;
    v22[3] = &unk_264506548;
    id v23 = v7;
    id v21 = _setup_block(v22, 0, 18053);
    dispatch_group_notify(v15, v20, v21);
  }
}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    uint64_t v9 = [*(id *)(a1 + 32) fetchAttributes];
    uint64_t v10 = [v9 count];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _OWORD v11[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_2;
    v11[3] = &unk_264506C80;
    id v12 = *(id *)(a1 + 40);
    [a5 enumerateQueryResults:v10 stringCache:0 usingBlock:v11];
  }
}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_2(uint64_t a1, id *a2)
{
  void v14[4] = *MEMORY[0x263EF8340];
  id v4 = *a2;
  id v5 = a2[1];
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v6 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  id v7 = objc_alloc(MEMORY[0x263F02AE8]);
  uint64_t v8 = *MEMORY[0x263EFFD08];
  uint64_t v9 = *MEMORY[0x263F024D0];
  v13[0] = @"_kMDItemLaunchString";
  v13[1] = v9;
  v14[0] = v8;
  v14[1] = v8;
  void v13[2] = @"kMDItemLastUsedDate_Ranking";
  v13[3] = @"_kMDItemShortcutLastUsedDate";
  v14[2] = v8;
  v14[3] = v8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  uint64_t v11 = (void *)[v7 initWithAttributes:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v4 domainIdentifier:0 attributeSet:v11];
  [v12 setIsUpdate:1];
  [v6 addObject:v12];
}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  void v3[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_4;
  v3[3] = &unk_264508880;
  void v3[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) indexSearchableItems:a3 deleteSearchableItemsWithIdentifiers:0 clientState:0 expectedClientState:0 clientStateName:0 protectionClass:0 forBundleID:a2 options:0 completionHandler:0];
}

uint64_t __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[SPCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:]();
  }
  uint64_t v8 = sIndexQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke;
  v12[3] = &unk_264507140;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = _setup_block(v12, 0, 18092);
  dispatch_async(v8, v11);
}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_group_t v3 = dispatch_group_create();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2;
  v13[3] = &unk_264508EE8;
  dispatch_group_t v14 = v3;
  id v4 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v5 = v2;
  id v16 = v5;
  id v6 = v3;
  [v4 _enumerateIndexersWithBlock:v13];
  id v7 = sIndexQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2775;
  v10[3] = &unk_264507168;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = _setup_block(v10, 0, 18091);
  dispatch_group_notify(v6, v7, v9);
}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_group_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  id v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_3;
  void v6[3] = &unk_264508EC0;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  [v4 _fetchAccumulatedStorageSizeForBundleId:v7 completionHandler:v6];
}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch the storage size for bundleId:%@, error:%@", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_7;
  }
  if (v5)
  {
    id v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    [*(id *)(a1 + 40) addObject:v5];
    objc_sync_exit(v9);

LABEL_7:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2775(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedLongLongValue", (void)v11);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = [NSNumber numberWithUnsignedLongLong:v5];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

- (void)_migrateIndexExtensionsWithEnumerator:(id)a3 forced:(BOOL)a4 migratedBundleIds:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  long long v12 = (void (**)(void))a6;
  if (!v12) {
    -[SPCoreSpotlightIndexer _migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:]();
  }
  long long v13 = v12;
  long long v14 = [v10 nextObject];
  id v15 = [v14 containerID];
  uint64_t v16 = v15;
  if (v14 && v15)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke;
    v17[3] = &unk_264508F38;
    BOOL v23 = a4;
    id v18 = v15;
    qos_class_t v19 = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v13;
    [(SPCoreSpotlightIndexer *)self _fetchAccumulatedStorageSizeForBundleId:v18 completionHandler:v17];
  }
  else
  {
    v13[2](v13);
  }
}

void __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = logForCSLogCategoryDefault();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3 || v4)
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 72)) {
        uint64_t v9 = "YES";
      }
      else {
        uint64_t v9 = "NO";
      }
      *(_DWORD *)stat buf = 138412802;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v3;
      __int16 v27 = 2080;
      long long v28 = v9;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Starting migration for index extension:%@, size:%@, forced:%s", buf, 0x20u);
    }

    id v10 = [MEMORY[0x263F02B50] sharedManager];
    id v11 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:3];
    long long v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke_2776;
    v16[3] = &unk_264508F10;
    id v17 = v12;
    char v22 = *(unsigned char *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    id v18 = v13;
    uint64_t v19 = v14;
    id v20 = v15;
    id v21 = *(id *)(a1 + 64);
    [v10 indexRequestsPerformJob:v11 forBundle:v17 completionHandler:v16];
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)stat buf = 138412546;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Skipping migration for index extension:%@, size:%@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) _migrateIndexExtensionsWithEnumerator:*(void *)(a1 + 48) forced:*(unsigned __int8 *)(a1 + 72) migratedBundleIds:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
}

uint64_t __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke_2776(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = "YES";
    if (!*(unsigned char *)(a1 + 72)) {
      int v4 = "NO";
    }
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2080;
    id v10 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished migration for index extension:%@, forced:%s", (uint8_t *)&v7, 0x16u);
  }

  id v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  objc_sync_exit(v5);

  return [*(id *)(a1 + 48) _migrateIndexExtensionsWithEnumerator:*(void *)(a1 + 56) forced:*(unsigned __int8 *)(a1 + 72) migratedBundleIds:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 64)];
}

- (void)migrateForced:(BOOL)a3
{
  id v5 = SDTransactionCreate(&unk_26D0C8E18);
  reindexAllQueue = self->_reindexAllQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke;
  v9[3] = &unk_264506B18;
  BOOL v11 = a3;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  uint64_t v8 = _setup_block(v9, 0, 18172);
  dispatch_async(reindexAllQueue, v8);
}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 248));
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"com.apple.searchd.indexExtensionMigration.start" object:*(void *)(a1 + 32) userInfo:0];

  uint64_t v3 = [MEMORY[0x263F02B50] sharedManager];
  int v4 = [v3 allExtensionsWithBlock:&__block_literal_global_2786];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v6 = *(void **)(a1 + 32);
  id v7 = [v4 objectEnumerator];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2787;
  v11[3] = &unk_2645064D0;
  __int16 v9 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v6 _migrateIndexExtensionsWithEnumerator:v7 forced:v8 migratedBundleIds:v10 completionHandler:v11];
}

uint64_t __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (([v2 isInternal] & 1) != 0
    || ([v2 containerID],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 hasPrefix:@"com.apple."],
        v3,
        v4))
  {
    uint64_t v5 = [v2 dontRunDuringMigration] ^ 1;
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v2 extensionID];
    uint64_t v9 = [v2 containerID];
    id v10 = (void *)v9;
    BOOL v11 = "NO";
    __int16 v16 = 2112;
    int v14 = 138413058;
    if (v6) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    id v15 = v8;
    uint64_t v17 = v9;
    if (v5) {
      BOOL v11 = "YES";
    }
    __int16 v18 = 2080;
    uint64_t v19 = v12;
    __int16 v20 = 2080;
    id v21 = v11;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Found index extension:%@, containerId:%@, internal:%s, migrate:%s", (uint8_t *)&v14, 0x2Au);
  }
  return v5;
}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2787(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 248));
  id v2 = dispatch_get_global_queue(9, 2uLL);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2_2788;
  void v6[3] = &unk_2645064D0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 48);
  uint64_t v5 = _setup_block(v6, 0, 18170);
  dispatch_async(v2, v5);
}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2_2788(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v5 = @"bundleIDs";
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"com.apple.searchd.indexExtensionMigration.finish" object:*(void *)(a1 + 40) userInfo:v3];

  SDTransactionDone(*(void **)(a1 + 48));
}

- (void)runMigration
{
}

- (void)_reindexAllIdentifiersWithExtension:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:]();
  }
  if (!v7) {
    -[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:]();
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke;
  v13[3] = &unk_264507140;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x223C48320](v13);
  BOOL v11 = sIndexQueue;
  id v12 = _setup_block(v10, 0, 18233);
  dispatch_async(v11, v12);
}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke(id *a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_2;
  v15[3] = &unk_264507610;
  id v2 = a1[5];
  void v15[4] = a1[4];
  id v16 = v2;
  id v3 = (void *)MEMORY[0x223C48320](v15);
  uint64_t v4 = [a1[5] containerID];
  uint64_t v5 = objc_opt_new();
  [v5 setClientBundleID:v4];
  v17[0] = *MEMORY[0x263F02938];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v5 setFetchAttributes:v6];

  id v7 = [(id)objc_opt_class() allProtectionClasses];
  [v5 setProtectionClasses:v7];

  id v8 = [NSString alloc];
  id v9 = (void *)[v8 initWithFormat:@"(%@ = '%@') && (%@ != '*')", *MEMORY[0x263F01E20], v4, *MEMORY[0x263F02968]];
  id v10 = a1[4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_5;
  v13[3] = &unk_264508FA8;
  void v13[4] = v10;
  id v14 = a1[6];
  BOOL v11 = [v10 _startQueryWithQueryString:v9 queryContext:v5 eventHandler:0 resultsHandler:v3 completionHandler:v13];
  [a1[4] setReindexAllItemsTask:v11];

  id v12 = [a1[4] reindexAllItemsTask];

  if (!v12) {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v19 = v8;
    uint64_t v20 = v7;
    uint64_t v21 = v5;
    uint64_t v22 = v6;
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:_MDStoreOIDArrayGetVectorCount()];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_3;
    v17[3] = &unk_264506C80;
    id v12 = v11;
    id v18 = v12;
    [a5 enumerateQueryResults:1 stringCache:0 usingBlock:v17];
    if ([v12 count])
    {
      id v13 = [*(id *)(a1 + 32) reindexAllItemsTask];
      [v13 pauseResults];

      id v14 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
      [v14 setIdentifiersToReindex:v12];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_4;
      v16[3] = &unk_264508F80;
      id v15 = *(void **)(a1 + 40);
      void v16[4] = *(void *)(a1 + 32);
      [v15 performJob:v14 completionBlock:v16];
    }
  }
}

uint64_t __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_3(uint64_t result, void *a2)
{
  if (*a2) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) reindexAllItemsTask];
    [v4 cancel];
  }
  id v5 = [*(id *)(a1 + 32) reindexAllItemsTask];
  [v5 resumeResults];
}

uint64_t __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setReindexAllItemsTask:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

+ (id)_filterReindexAllExtensions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isInternal", (void)v14) & 1) == 0)
        {
          BOOL v11 = [v10 containerID];
          char v12 = [v11 hasPrefix:@"com.apple."];

          if ((v12 & 1) == 0) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_reindexAllItemsWithExtensionsAndCompletionBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndCompletionBlock:]();
  }
  id v5 = v4;
  uint64_t v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Reindexing all items with the index extensions", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
  uint64_t v7 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _OWORD v11[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke;
  v11[3] = &unk_264508FD0;
  void v11[4] = self;
  [v7 setFilterBlock:v11];
  [v7 setPerformBlock:&__block_literal_global_2799];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_4;
  v9[3] = &unk_264508FA8;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 setCompletionBlock:v9];
  [v7 start];
}

id __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() _filterReindexAllExtensions:v2];

  return v3;
}

void __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = (objc_class *)MEMORY[0x263F02A68];
  id v6 = a2;
  uint64_t v7 = (void *)[[v5 alloc] initWithJobType:2];
  [v7 setReason:@"re-indexing all items with the index extensions"];
  dispatch_group_enter(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_3;
  v9[3] = &unk_264508F80;
  id v10 = v4;
  id v8 = v4;
  [v6 performJob:v7 completionBlock:v9];
}

void __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_3(uint64_t a1)
{
}

uint64_t __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_4(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindexing all items with the index extensions", v4, 2u);
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 248));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:]();
  }
  id v5 = v4;
  id v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Reindexing all identifiers with the index extensions", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
  uint64_t v7 = objc_opt_new();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke;
  v16[3] = &unk_264508FD0;
  void v16[4] = self;
  [v7 setFilterBlock:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_2;
  v15[3] = &unk_264509018;
  void v15[4] = self;
  [v7 setPerformBlock:v15];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  BOOL v11 = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_4;
  char v12 = &unk_264508FA8;
  id v13 = self;
  id v14 = v5;
  id v8 = v5;
  [v7 setCompletionBlock:&v9];
  objc_msgSend(v7, "start", v9, v10, v11, v12, v13);
}

id __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() _filterReindexAllExtensions:v2];

  return v3;
}

void __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  dispatch_group_enter(v5);
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_3;
  v9[3] = &unk_2645063F8;
  uint64_t v10 = v5;
  id v8 = v5;
  [v7 _reindexAllIdentifiersWithExtension:v6 completionBlock:v9];
}

void __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_3(uint64_t a1)
{
}

uint64_t __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_4(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindexing all identifiers with the index extensions", v4, 2u);
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 248));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)transferDeleteJournalsForProtectionClass:(id)a3 toDirectory:(int)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (__CFString *)a3;
  uint64_t v10 = [(SPCoreSpotlightIndexer *)self concreteIndexers];
  BOOL v11 = v10;
  if (v9) {
    char v12 = v9;
  }
  else {
    char v12 = @"Unknown";
  }
  id v13 = [v10 objectForKey:v12];

  if (v13)
  {
    id v14 = sIndexQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __97__SPCoreSpotlightIndexer_transferDeleteJournalsForProtectionClass_toDirectory_completionHandler___block_invoke;
    v16[3] = &unk_264509040;
    id v17 = v13;
    int v19 = a4;
    id v18 = v8;
    long long v15 = _setup_block(v16, 0, 18314);
    dispatch_async(v14, v15);
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __97__SPCoreSpotlightIndexer_transferDeleteJournalsForProtectionClass_toDirectory_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transferDeleteJournalsToDirectory:*(unsigned int *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)wipeCoreSpotlightIndexForTrial
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Should not be running in this process", v2, v3, v4, v5, v6);
}

- (void)setExtensionDelegate:(id)a3
{
}

- (NSSet)fileProviderBundleIDs
{
  return self->_fileProviderBundleIDs;
}

- (SPCoreSpotlightIndexerDelegate)indexerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexerDelegate);
  return (SPCoreSpotlightIndexerDelegate *)WeakRetained;
}

- (void)setIndexerDelegate:(id)a3
{
}

- (void)setInteractionHandler:(id)a3
{
}

- (void)setConcreteIndexers:(id)a3
{
}

- (OS_dispatch_source)prefsChangeSource
{
  return self->_prefsChangeSource;
}

- (void)setPrefsChangeSource:(id)a3
{
}

- (NSObject)dataMigrationStartObserver
{
  return self->_dataMigrationStartObserver;
}

- (void)setDataMigrationStartObserver:(id)a3
{
}

- (NSObject)dataMigrationFinishObserver
{
  return self->_dataMigrationFinishObserver;
}

- (void)setDataMigrationFinishObserver:(id)a3
{
}

- (NSSet)dataMigrationBundleIDs
{
  return self->_dataMigrationBundleIDs;
}

- (void)setDataMigrationBundleIDs:(id)a3
{
}

- (NSSet)prefsDisabledBundleIDs
{
  return self->_prefsDisabledBundleIDs;
}

- (void)setPrefsDisabledBundleIDs:(id)a3
{
}

- (OS_dispatch_source)reindexAllItemsSource
{
  return self->_reindexAllItemsSource;
}

- (void)setReindexAllItemsSource:(id)a3
{
}

- (OS_dispatch_source)reindexAllItemsWithIdentifiersSource
{
  return self->_reindexAllItemsWithIdentifiersSource;
}

- (void)setReindexAllItemsWithIdentifiersSource:(id)a3
{
}

- (SPCoreSpotlightTask)reindexAllItemsTask
{
  return (SPCoreSpotlightTask *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReindexAllItemsTask:(id)a3
{
}

- (NSMutableSet)knownPersonas
{
  return self->_knownPersonas;
}

- (void)setKnownPersonas:(id)a3
{
}

- (BOOL)updatePersonas
{
  return self->_updatePersonas;
}

- (void)setUpdatePersonas:(BOOL)a3
{
  self->_updatePersonas = a3;
}

- (CSFileProviderDomainMonitor)fileProviderMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileProviderMonitor);
  return (CSFileProviderDomainMonitor *)WeakRetained;
}

- (void)setFileProviderMonitor:(id)a3
{
}

- (OS_dispatch_queue)personaQueue
{
  return self->_personaQueue;
}

- (void)setPersonaQueue:(id)a3
{
}

- (void)setIndexQueue:(id)a3
{
}

- (void)setFirstUnlockQueue:(id)a3
{
}

- (OS_dispatch_queue)reindexAllQueue
{
  return self->_reindexAllQueue;
}

- (void)setReindexAllQueue:(id)a3
{
}

- (void)setDataMigrationStage:(unint64_t)a3
{
  self->_dataMigrationStage = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexAllQueue, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_storeStrong((id *)&self->_personaQueue, 0);
  objc_destroyWeak((id *)&self->_fileProviderMonitor);
  objc_storeStrong((id *)&self->_knownPersonas, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsTask, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsWithIdentifiersSource, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsSource, 0);
  objc_storeStrong((id *)&self->_prefsDisabledBundleIDs, 0);
  objc_storeStrong((id *)&self->_dataMigrationBundleIDs, 0);
  objc_storeStrong((id *)&self->_dataMigrationFinishObserver, 0);
  objc_storeStrong((id *)&self->_dataMigrationStartObserver, 0);
  objc_storeStrong((id *)&self->_prefsChangeSource, 0);
  objc_storeStrong((id *)&self->_concreteIndexers, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_destroyWeak((id *)&self->_indexerDelegate);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderExtensionToAppBundleMap, 0);
  objc_storeStrong((id *)&self->_fileProviderAppToExtensionBundleMap, 0);
  objc_destroyWeak((id *)&self->extensionDelegate);
  objc_storeStrong((id *)&self->_reindexIndexers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_appScopingQueue, 0);
  objc_storeStrong((id *)&self->_bundlesWithRemoteSearchSupport, 0);
  objc_storeStrong((id *)&self->_bundlesWithIndexedCoreSpotlightItems, 0);
}

+ (void)setIndexerDelegate:.cold.1()
{
}

void __44__SPCoreSpotlightIndexer_purgeIndexForSize___block_invoke_1841_cold_1()
{
  OUTLINED_FUNCTION_31();
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(v1 + 32) UTF8String];
  int v4 = 136315394;
  uint64_t v5 = v2;
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v3, "CacheDelete: failed to purge indexer %s error: %@.", (uint8_t *)&v4);
}

- (void)registerCacheDeleteCallbackForVolumePath:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "CacheDelete: failed to register Callbacks", v2, v3, v4, v5, v6);
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error %@ writing index info", v2, v3, v4, v5, v6);
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Failed to get age of index directory", v2, v3, v4, v5, v6);
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Failed to get age of heartbeat file", v2, v3, v4, v5, v6);
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Failed to get build number", v2, v3, v4, v5, v6);
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "Failed to get roots installed status: %d", v2, v3, v4, v5, v6);
}

- (void)init
{
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error registering persona list update observer %@", v2, v3, v4, v5, v6);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1930_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1933_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1936_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1941_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.searchd.reportStorageUsage";
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v1, "Failed to expire task %@ with error: %@", (uint8_t *)&v2);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1952_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.searchd.reportAppUsage";
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v1, "Failed to expire task %@ with error: %@", (uint8_t *)&v2);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1952_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = @"com.apple.searchd.reportAppUsage";
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a3, (uint64_t)a3, "Task %@ could not start query to collect bundles.", a1);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3_1959_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = @"com.apple.searchd.reportAppUsage";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, a2, a3, "Task %@ got error collecting bundles: %@", (uint8_t *)&v3);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1961_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x263EF8340]);
  LODWORD(v2) = 138412802;
  *(void *)((char *)&v2 + 4) = @"com.apple.searchd.reportAppUsage";
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_44(&dword_21F1CE000, v0, v1, "Task %@ got error counting %@: %@", (void)v2, DWORD2(v2));
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1972_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_22(&dword_21F1CE000, a2, a3, "Failed to delete vectorIndexDrops.plist (%u, %@)", v3, (void)v4, WORD4(v4), *MEMORY[0x263EF8340]);
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_10();
  __error();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v0, v1, "Error %d opening %s", v2, v3, v4, v5, 2u);
}

void __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Received \"%@\" event", v2, v3, v4, v5, v6);
}

- (void)_reindexAllItemsForBundleIDs:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Scheduling reindex-all task, reason:%@, bundleIDs:%@");
}

- (void)commitUpdatesWithCompletionHandler:.cold.1()
{
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "Start merge", v2, v3, v4, v5, v6);
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "Schedule merge on power", v2, v3, v4, v5, v6);
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2032_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "Start merge on power", v2, v3, v4, v5, v6);
}

- (void)issueHeartbeat
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error %@ writing index creation date", v2, v3, v4, v5, v6);
}

- (void)issueResolveFPItemForURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Failed to resolve FPItem for : %@", v2, v3, v4, v5, v6);
}

void __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "[ResourceManager] could not create asset resources directory", v2, v3, v4, v5, v6);
}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Can't create query task because no indexers are available.", v2, v3, v4, v5, v6);
}

- (void)_taskForQueryWithQueryString:(void *)a3 queryContext:eventHandler:resultsHandler:completionHandler:.cold.3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 clientBundleID];
  int v7 = 138412802;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_39();
  __int16 v9 = v5;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "PCS %@ for query %@. Internally generated. Client %@", (uint8_t *)&v7, 0x20u);
}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.4()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS _taskForQueryWithQueryString: %d", v2, v3, v4, v5, v6);
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2114_cold_1()
{
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_2117_cold_1()
{
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_32(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_45(&dword_21F1CE000, v1, v2, "Scheduling jobs(%ld/%ld) for task:%p, canceled:%@", v3, v4, v5, v6, 2u);
}

- (void)taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "taskForQueryWithQueryString: %@", v2, v3, v4, v5, v6);
}

- (void)taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.2()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS taskForQueryWithQueryString: %d", v2, v3, v4, v5, v6);
}

- (void)startQueryTask:.cold.1()
{
  OUTLINED_FUNCTION_10();
  qos_class_self();
  [v0 critical];
  OUTLINED_FUNCTION_46(&dword_21F1CE000, v1, v2, "QOS startQueryTask 1: %d %s", v3, v4, v5, v6, 2u);
}

void __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke_cold_1()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS startQueryTask 2: %d", v2, v3, v4, v5, v6);
}

- (void)_startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS _startQueryWithQueryString: %d", v2, v3, v4, v5, v6);
}

- (void)startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS startQueryWithQueryString: %d", v2, v3, v4, v5, v6);
}

- (void)taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS taskForTopHitQueryWithQueryString: %d", v2, v3, v4, v5, v6);
}

- (void)startQuery:withContext:eventHandler:handler:.cold.1()
{
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS startQuery: %d", v2, v3, v4, v5, v6);
}

void __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = CSRedactString(a1, 0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_14(&dword_21F1CE000, a2, v4, "[rewrite] Missing variations for token %@", v5);
}

- (void)writeFileProviderBundleMap:fileProviderBundleIDs:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Error in writing file provider information", v2, v3, v4, v5, v6);
}

void __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error in reading file provider information %@", v2, v3, v4, v5, v6);
}

- (void)writeData:(NSObject *)a3 toFile:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a3, (uint64_t)a3, "Could not write to file, closing it. Error: %@", (uint8_t *)a2);
}

- (void)userPerformedAction:withItem:protectionClass:forBundleID:personaID:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "#apphistory ignore ineligible action, protectionClass:%@, action:%@");
}

- (void)userPerformedAction:withItem:protectionClass:forBundleID:personaID:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "#apphistory index action, protectionClass:%@, action:%@");
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Index user action error: %@", v2, v3, v4, v5, v6);
}

- (void)clientDidCheckin:protectionClass:service:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "shutting down, unavailable for %@", v2, v3, v4, v5, v6);
}

- (void)_issueDiagnose:logQuery:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "#issuediagnose", v2, v3, v4, v5, v6);
}

- (void)_issueCacheCommand:xpc:searchContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "#issueCacheCommand %@", v2, v3, v4, v5, v6);
}

- (void)writeUISearchEnabled:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Error writing managed index list", v2, v3, v4, v5, v6);
}

- (void)writeUISearchEnabled:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error creating directory for managed index list: %@", v2, v3, v4, v5, v6);
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_22(&dword_21F1CE000, v0, v1, "Failed to open (error: %d) diagnostic file at %s", v2, v3);
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_31();
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = [v1 UTF8String];
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v2, "Failed to create Spotlight diagnostic directory at %s with error %@", (uint8_t *)&v3);
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "#issuecommand %@", v2, v3, v4, v5, v6);
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3_cold_1()
{
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4_cold_1()
{
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Performing daemon job:%@ for bundleID:%@");
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Performing job:%@ with indexing extension for bundleID:%@");
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 excludedBundleIDs];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v3, "Performing job:%@ with the indexing extensions, excludedBundleIDs:%@", v4);
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Performing job:%@ with the indexing extensions, bundleIDs:%@");
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v1, "Done performing daemon job:%@ for bundleID:%@", v2);
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2724_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v1, "Done performing job:%@ with indexing extension for bundleID:%@", v2);
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2728_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Done performing job:%@ with the indexing extensions", v2, v3, v4, v5, v6);
}

- (void)_fetchAccumulatedStorageSizeForBundleId:completionHandler:.cold.1()
{
}

- (void)_migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:.cold.1()
{
}

- (void)_reindexAllIdentifiersWithExtension:completionBlock:.cold.1()
{
}

- (void)_reindexAllIdentifiersWithExtension:completionBlock:.cold.2()
{
}

- (void)_reindexAllItemsWithExtensionsAndCompletionBlock:.cold.1()
{
}

- (void)_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:.cold.1()
{
}

@end