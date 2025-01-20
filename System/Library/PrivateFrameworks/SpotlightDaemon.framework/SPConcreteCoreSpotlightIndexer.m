@interface SPConcreteCoreSpotlightIndexer
+ (BOOL)_spellingCorrectionConditional:(int)a3 isSingleToken:(BOOL)a4 isPreviousTokenCorrected:(BOOL)a5 isLastToken:(BOOL)a6 tokenLength:(unint64_t)a7;
+ (BOOL)dumpCrashStates:(const char *)a3 toFile:(id)a4;
+ (id)_descriptionWithTokenRewrites:(id)a3;
+ (id)_getBundleIndexesFrom:(id)a3;
+ (id)_indexDependentTokenRewritesWithMatchInfo:(id)a3 topK:(id)a4 setOfTokensToCorrect:(id)a5 queryID:(int64_t)a6 bundleIds:(id)a7 clientBundleId:(id)a8;
+ (id)_indexIndependentTokenRewritesWithMatchInfo:(id)a3 queryID:(int64_t)a4 setOfTokensToCorrect:(id)a5;
+ (id)_lastTokenWithQueryString:(id)a3 tokenMatchInfo:(id)a4;
+ (id)_setOfTokensToCorrect:(id)a3 tokenMatchInfo:(id)a4;
+ (id)_sharedSynonyms;
+ (id)_stateInfoAttributeNameWithClientStateName:(id)a3;
+ (id)_stringWithRewriteType:(int64_t)a3;
+ (id)_tokensMaxCountFromMatchInfo:(id)a3;
+ (id)fetchItemForURL:(id)a3;
+ (id)fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 timeout:(unint64_t)a5;
+ (int64_t)checkItemOfInterest:(id)a3 mask:(int64_t)a4;
+ (void)initialize;
- (BOOL)_hasPurgeableTouchFile;
- (BOOL)_removePurgeableTouchFile;
- (BOOL)_shouldNotifyForSearchableItemUpdates:(id)a3;
- (BOOL)_shouldPurge;
- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8;
- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9;
- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9 postFilter:(id)a10;
- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 resultsHandler:(id)a7;
- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 resultsHandler:(id)a6;
- (BOOL)clientIsCheckedIn:(id)a3;
- (BOOL)creationTouchFileExists;
- (BOOL)denyOperationOnAssertedIndex:(char *)a3;
- (BOOL)finishedDrainingJournal;
- (BOOL)issuePriorityIndexFixup;
- (BOOL)reindexAllStarted;
- (BOOL)unpurgeOnceTouchFileExists;
- (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5;
- (NSMapTable)checkedInClients;
- (NSMutableArray)outstandingMaintenance;
- (NSSet)knownClients;
- (NSString)dataclass;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)indexQueue;
- (OS_dispatch_source)indexIdleTimer;
- (OS_os_transaction)dirtyTransaction;
- (SPConcreteCoreSpotlightIndexer)initWithQueue:(id)a3 protectionClass:(id)a4 cancelPtr:(int *)a5;
- (SPCoreSpotlightIndexer)owner;
- (__SI)index;
- (__SI)jwlIndex;
- (__SIResultQueue)resultQueue;
- (double)idleStartTime;
- (id)_cancelIdleTimer;
- (id)_indexMaintenanceActivityName;
- (id)_indexPath;
- (id)_startQueryWithQueryTask:(id)a3 eventHandler:(id)a4 resultsHandler:(id)a5;
- (id)getPropertyForKey:(id)a3;
- (id)indexLossAnalyticsDictWithPreviousIndexCreationDate:(int64_t)a3 size:(int64_t)a4 openingInReadOnly:(BOOL)a5 fullyCreated:(BOOL)a6 markedPurgeable:(BOOL)a7 vectorIndexDrop:(id)a8 forAnalytics:(BOOL)a9;
- (id)purgeableIndexTouchFilePath;
- (id)trialIntentionalDropUUID;
- (id)vectorIndexDropsPath;
- (int)creationTouchFileCreate;
- (int)openIndex:(BOOL)a3;
- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4;
- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4 readOnly:(BOOL)a5;
- (int)openIndexForUpgradeSynchronous:(BOOL)a3;
- (int)openJWLIndex;
- (int)shouldNotLogIndexDrop:(id)a3 ignoreParentDirectoryAge:(BOOL)a4;
- (int)unpurgeOnceTouchFileCreate;
- (int64_t)_interestedAttributesMaskForBundleID:(id)a3;
- (int64_t)getIndexDirectorySize:(id)a3;
- (int64_t)getIntegerPropertyForKey:(id)a3;
- (unint64_t)dirtyTimeout;
- (void)_addNewClientWithBundleID:(id)a3;
- (void)_appendRervseInfo:(id)a3 dictionary:(id)a4 key:(id)a5 level:(unint64_t)a6;
- (void)_backgroundDeleteItems:(id)a3 bundleID:(id)a4 completionHandler:(id)a5;
- (void)_cancelIdleTimer;
- (void)_createPurgeableTouchFile;
- (void)_deleteSearchableItemsMatchingQuery:(id)a3 forBundleIds:(id)a4 completionHandler:(id)a5;
- (void)_expireCorruptIndexFilesWithPath:(id)a3 keepLatest:(BOOL)a4;
- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4;
- (void)_performXPCActivity:(id)a3 name:(id)a4;
- (void)_removePurgeableTouchFile;
- (void)_saveCorruptIndexWithPath:(id)a3 shouldSendABC:(BOOL)a4 fullyCreated:(BOOL)a5 markedPurgeable:(BOOL)a6;
- (void)_scheduleStringsCleanupForBundleID:(id)a3;
- (void)_sendIndexDropABCEvent:(BOOL)a3 markedPurgeable:(BOOL)a4;
- (void)addClients:(id)a3;
- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4;
- (void)attributesForBundleId:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)cacheDeleteForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7;
- (void)cacheEntryForKeys:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6;
- (void)cacheInsertForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7;
- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forBundleID:(id)a5;
- (void)checkAdmission:(id)a3 background:(BOOL)a4 didBeginThrottle:(BOOL *)a5 didEndThrottle:(BOOL *)a6 live:(BOOL *)a7 slow:(BOOL *)a8 memoryPressure:(BOOL *)a9;
- (void)checkInWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)cleanupStringsWithActivity:(id)a3 group:(id)a4 shouldDefer:(BOOL *)a5 flags:(int)a6;
- (void)cleanupStringsWithCompletionHandler:(id)a3;
- (void)clientDidCheckin:(id)a3 service:(id)a4 completionHandler:(id)a5;
- (void)closeCache:(id)a3;
- (void)closeIndex;
- (void)commitUpdates:(id)a3;
- (void)completeIndexingItemFor:(id)a3 delegate:(id)a4 didBeginThrottle:(BOOL)a5 didEndThrottle:(BOOL)a6 error:(id)a7 live:(BOOL)a8 queue:(id)a9 slow:(BOOL)a10 startTime:(double)a11 completionHandler:(id)a12;
- (void)coolDown:(id)a3;
- (void)creationTouchFileUnlink;
- (void)dealloc;
- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4;
- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSearchableItemsForBundleID:(id)a3 fromClient:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteAllUserActivities:(id)a3 completionHandler:(id)a4;
- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5;
- (void)deleteHasTopHitAppShortcutsWithResultsHandler:(id)a3 completionHandler:(id)a4;
- (void)deleteItemsForEnumerator:(id)a3 traceID:(int64_t)a4 bundleID:(id)a5 fromClient:(id)a6 completionHandler:(id)a7;
- (void)deleteItemsForQuery:(id)a3 bundleID:(id)a4 fromClient:(id)a5 completionHandler:(id)a6;
- (void)deleteSearchableItemsSinceDate:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 forBundleID:(id)a4 fromClient:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4;
- (void)dirty;
- (void)dirty:(BOOL)a3;
- (void)dropBackgroundAssertions:(BOOL)a3;
- (void)dumpAllRankingDiagnosticInformationForQuery:(id)a3 withCompletionHandler:(id)a4;
- (void)ensureOpenIndexFiles:(id)a3;
- (void)fetchAllCompletedBundleIDsForIndexerTask:(id)a3 completionHandler:(id)a4;
- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completion:(id)a8;
- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completionHandler:(id)a8;
- (void)fetchCacheFileDescriptorsForBundleID:(id)a3 identifiers:(id)a4 userCtx:(id)a5 flags:(int)a6 completionHandler:(id)a7;
- (void)fetchLastClientStateForBundleID:(id)a3 clientStateName:(id)a4 completionHandler:(id)a5;
- (void)finishIndexingWhileLocked:(id)a3 completionHandler:(id)a4;
- (void)finishReindexAll;
- (void)fixupMessageAttachmentsWithCompletionHandler:(id)a3;
- (void)fixupPathTimeouts;
- (void)incrementIndexWipeCount;
- (void)indexDependentTokenRewritesWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 setOfTokensToCorrect:(id)a6 tokenRewritesHandler:(id)a7;
- (void)indexFinishedDrainingJournal;
- (void)indexFinishedDrainingJournal:(id)a3;
- (void)indexFromBundle:(id)a3 personaID:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 canCreateNewIndex:(BOOL)a13 completionHandler:(id)a14;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 forBundleID:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)issueConsistencyCheck;
- (void)issueDefrag:(id)a3;
- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4;
- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4;
- (void)issueDuplicateOidCheck;
- (void)issueMessagesFixup:(id)a3;
- (void)issuePhotosReindexIfNeeded:(BOOL)a3;
- (void)issuePriorityIndexFixup;
- (void)issuePriorityIndexFixupOff;
- (void)issuePriorityIndexFixupOn;
- (void)issueRepair;
- (void)issueSplit;
- (void)markDirectoryAtomicallyPurgeable:(id)a3 purgeableOrNot:(BOOL)a4;
- (void)mergeWithCompletionHandler:(id)a3;
- (void)mergeWithGroup:(id)a3;
- (void)notifyClientForItemUpdates:(id)a3 updatedItems:(id)a4 batchMask:(int64_t)a5;
- (void)openJWLIndex;
- (void)performIndexerTask:(id)a3 completionHandler:(id)a4;
- (void)performIndexerTask:(id)a3 withIndexDelegatesAndCompletionHandler:(id)a4;
- (void)performQueryForCountOfItemsInCategory:(id)a3 completion:(id)a4;
- (void)powerStateChanged;
- (void)preheat;
- (void)prepareIndexingWhileLocked:(id)a3 holdAssertionFor:(double)a4 completionHandler:(id)a5;
- (void)processDecryptsForBundleID:(id)a3 persona:(id)a4 infos:(id)a5 group:(id)a6;
- (void)processImportForBundleID:(id)a3 withURLs:(id)a4 contentTypes:(id)a5 sandboxExtensions:(id)a6 andIdentifiers:(id)a7 options:(int64_t)a8 inGroup:(id)a9 additionalAttributes:(id)a10 computeUpdaterAttributesAfterImport:(BOOL)a11;
- (void)readyIndex:(BOOL)a3;
- (void)reindexAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 indexAttrName:(id)a5 withVersion:(unint64_t)a6 perItemCompletionAttribute:(id)a7 force:(BOOL)a8 postFilter:(id)a9;
- (void)removeExpiredItemsForBundleId:(id)a3 group:(id)a4;
- (void)removeSandboxExtensions:(id)a3;
- (void)requestRequiresImportWithoutSandboxExtension:(id)a3 maxCount:(unint64_t)a4 depth:(int64_t)a5;
- (void)restartAttachmentImport:(id)a3 maxCount:(unint64_t)a4 depth:(int64_t)a5;
- (void)resumeIndex;
- (void)revokeExpiredItems:(id)a3;
- (void)scheduleMaintenance:(id)a3 description:(id)a4 forDarkWake:(BOOL)a5;
- (void)setDataclass:(id)a3;
- (void)setDirtyTimeout:(unint64_t)a3;
- (void)setDirtyTransaction:(id)a3;
- (void)setFinishedDrainingJournal:(BOOL)a3;
- (void)setFirstUnlockQueue:(id)a3;
- (void)setIndex:(__SI *)a3;
- (void)setIndexQueue:(id)a3;
- (void)setJwlIndex:(__SI *)a3;
- (void)setKnownClients:(id)a3;
- (void)setOutstandingMaintenance:(id)a3;
- (void)setOwner:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4 sync:(BOOL)a5;
- (void)setResultQueue:(__SIResultQueue *)a3;
- (void)shrink:(unint64_t)a3;
- (void)spotlightCacheFileDescriptor:(id)a3 completionHandler:(id)a4;
- (void)startQueryWithQueryTask:(id)a3 startHandler:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6;
- (void)startReindexAll;
- (void)suspendIndexForDeviceLock:(id)a3;
- (void)transferDeleteJournalsToDirectory:(int)a3 completionHandler:(id)a4;
- (void)trialIntentionalDropUUID;
- (void)updateContainersAndScores:(BOOL)a3;
- (void)updateEmailContentURLAttr:(BOOL)a3;
- (void)updateEmailLocalParts:(BOOL)a3;
- (void)updateNotes:(BOOL)a3;
- (void)updateRankingDates:(BOOL)a3;
- (void)validateConcreteIndexer:(BOOL)a3 outFileDescriptor:(int)a4;
- (void)validateVectors:(int)a3;
- (void)whenFinishedDraining:(id)a3;
- (void)willModifySearchableItemsWithIdentifiers:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5;
- (void)writeIndexCreationDate:(int64_t)a3;
- (void)writeIndexDropAnalyticsDate:(int64_t)a3;
- (void)writeIndexLossEventToFile:(id)a3 vector:(BOOL)a4;
- (void)writeIndexSuccessfulOpenDate:(int64_t)a3;
- (void)writeSDBObjectCount:(int64_t)a3;
- (void)zombifyAllContactItems:(id)a3;
@end

@implementation SPConcreteCoreSpotlightIndexer

- (NSSet)knownClients
{
  return (NSSet *)objc_getProperty(self, a2, 200, 1);
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_2(id *a1, uint64_t a2, int a3)
{
  if (a3)
  {
    v4 = (void (**)(id, void, id))a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    v4[2](v4, 0, v5);
  }
  else
  {
    id v6 = a1[4];
    id v8 = a1[7];
    id v7 = a1[6];
    SIFetchCSClientState();
  }
}

id __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2(void *a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"deleteCount";
  v2 = [NSNumber numberWithUnsignedInteger:a1[5]];
  v8[0] = v2;
  v7[1] = @"addCount";
  v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v7[2] = @"bundleID";
  uint64_t v4 = a1[4];
  v8[1] = v3;
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  [*(id *)(a1 + 32) readyIndex:1];
  v3 = (unsigned char *)*v2;
  if (!*(void *)(*v2 + 128) || v3[97]) {
    goto LABEL_3;
  }
  if (!v3[24])
  {
LABEL_17:
    v10 = logForCSLogCategoryIndex();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    v12 = logForCSLogCategoryIndex();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21F1CE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "IndexLatency", (const char *)&unk_21F27672A, buf, 2u);
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 128);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1177;
    v17[3] = &unk_264507728;
    id v25 = *(id *)(a1 + 88);
    long long v26 = *(_OWORD *)(a1 + 96);
    id v15 = *(id *)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 112);
    uint64_t v16 = *(void *)(a1 + 32);
    id v18 = v15;
    uint64_t v19 = v16;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    id v24 = *(id *)(a1 + 80);
    os_signpost_id_t v28 = v11;
    SIBackgroundOpBlock(v14, 0, v17);

    id v6 = v25;
    goto LABEL_7;
  }
  if (v3[72])
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *v2;
    if (Current <= *(double *)(*v2 + 80))
    {
      if (*(unsigned char *)(v8 + 24) && *(unsigned char *)(v8 + 72))
      {
        v9 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_2();
        }
      }
      goto LABEL_17;
    }
  }
LABEL_3:
  uint64_t v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 88);
  if (v5)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_7:
  }
}

- (__SI)index
{
  return self->_index;
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = (void (**)(id, void *))a10;
  BOOL readOnly = self->_readOnly;
  id v24 = logForCSLogCategoryIndex();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
  if (readOnly)
  {
    if (v25) {
      -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:]();
    }

    if (v22)
    {
      long long v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      v22[2](v22, v26);
    }
  }
  else
  {
    if (v25) {
      -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:]();
    }

    uint64_t v27 = [v16 count];
    uint64_t v28 = [v17 count];
    if (v27 | v28)
    {
      uint64_t v29 = v28;
      queue = sIndexQueue;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke;
      v32[3] = &unk_264507750;
      v32[4] = self;
      v39 = v22;
      id v33 = v21;
      uint64_t v40 = v29;
      uint64_t v41 = v27;
      int64_t v42 = a9;
      id v34 = v19;
      id v35 = v20;
      id v36 = v17;
      id v37 = v18;
      id v38 = v16;
      v30 = _setup_block(v32, 0, 8654);
      dispatch_async(queue, v30);
    }
    else if (v22)
    {
      v22[2](v22, 0);
    }
  }
}

- (BOOL)_shouldNotifyForSearchableItemUpdates:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilemail"]) {
    char v4 = _os_feature_enabled_impl();
  }
  else {
    char v4 = 0;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS"]) {
    char v5 = _os_feature_enabled_impl();
  }
  else {
    char v5 = 0;
  }
  int v6 = [v3 isEqualToString:@"com.apple.usernotificationsd"];
  if (v6) {
    LOBYTE(v6) = _os_feature_enabled_impl();
  }
  if (v4) {
    char v7 = 1;
  }
  else {
    char v7 = v5 | v6;
  }

  return v7;
}

+ (int64_t)checkItemOfInterest:(id)a3 mask:(int64_t)a4
{
  char v4 = a4;
  char v5 = [a3 attributeSet];
  int v6 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_2:
    int64_t v7 = 0;
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  os_signpost_id_t v11 = [v5 summarizationContentTopic];
  if (v11
    || ([v6 summarizationContentSynopsis], (os_signpost_id_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v6 summarizationContentTopLine], (os_signpost_id_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v6 isUrgent], (os_signpost_id_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    || [v6 urgencyStatus])
  {
  }
  else if (![v6 summarizationStatus])
  {
    goto LABEL_2;
  }
  int64_t v7 = 1;
  if ((v4 & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = [v6 attributeForKey:*MEMORY[0x263F023D8]];

  if (v8) {
    v7 |= 2uLL;
  }
LABEL_5:
  if ((v4 & 4) != 0)
  {
    v9 = [v6 mediaAnalysisComplete];

    if (v9) {
      v7 |= 4uLL;
    }
  }

  return v7;
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 32) + 176))
  {
    if (CFAbsoluteTimeGetCurrent() - *((double *)*v2 + 23) < (double)*((unint64_t *)*v2 + 26))
    {
      id v3 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_cold_1((uint64_t)v2, v3);
      }

      char v4 = *((void *)*v2 + 22);
      dispatch_time_t v5 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v4, v5, 0x12A05F200uLL, 0x12A05F200uLL);
    }
  }
  else if (*(unsigned char *)(a1 + 48) || (SIGetAccumulatedWorkTimeSinceLastSync(), v6 > 1.0))
  {
    int64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *((void *)*v2 + 21);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = qos_class_self();
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Index %@ dirty qos: %d", buf, 0x12u);
    }

    uint64_t v9 = *((void *)*v2 + 21);
    v23[0] = @"dirty";
    v23[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    os_signpost_id_t v11 = SDTransactionCreate(v10);

    v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)*v2 + 19));
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *((CFAbsoluteTime *)*v2 + 23) = Current;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    int v22 = 0;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_399;
    handler[3] = &unk_264506AF0;
    handler[4] = *v2;
    handler[5] = buf;
    *(CFAbsoluteTime *)&handler[6] = Current;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v12, v14, 0x12A05F200uLL, 0x12A05F200uLL);
    id v15 = *v2;
    objc_sync_enter(v15);
    id v16 = (void *)*((void *)*v2 + 27);
    *((void *)*v2 + 27) = v11;
    id v17 = v11;

    id v18 = (void *)*((void *)*v2 + 22);
    *((void *)*v2 + 22) = v12;
    id v19 = v12;

    dispatch_resume(v19);
    objc_sync_exit(v15);

    _Block_object_dispose(buf, 8);
  }
  SDTransactionDone(*(void **)(a1 + 40));
}

- (SPCoreSpotlightIndexer)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (SPCoreSpotlightIndexer *)WeakRetained;
}

- (id)_indexPath
{
  id v3 = [(id)sDelegate indexDirectory];
  char v4 = v3;
  dataclass = self->_dataclass;
  if (!dataclass) {
    dataclass = (NSString *)*MEMORY[0x263F08098];
  }
  double v6 = [v3 stringByAppendingFormat:@"/%@/%@", dataclass, @"index.spotlightV2"];

  return v6;
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) length])
  {
    uint64_t v5 = *(void *)(a1 + 56);
    double v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F01C68];
    uint64_t v8 = -1;
LABEL_20:
    id v20 = [v6 errorWithDomain:v7 code:v8 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v20);

    return;
  }
  v2 = (id *)(a1 + 40);
  [*(id *)(a1 + 40) readyIndex:1];
  id v3 = *(unsigned char **)(a1 + 40);
  if (*((void *)v3 + 16))
  {
    if (!v3[24] && !v3[26])
    {
      char v4 = 0;
      goto LABEL_13;
    }
  }
  else if (!*((void *)v3 + 17) && !v3[96])
  {
    goto LABEL_19;
  }
  if (!_os_feature_enabled_impl()
    || (uint64_t v9 = *MEMORY[0x263F08080], ([*((id *)*v2 + 21) isEqualToString:*MEMORY[0x263F08080]] & 1) == 0))
  {
LABEL_19:
    uint64_t v5 = *(void *)(a1 + 56);
    double v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F01C68];
    uint64_t v8 = -1000;
    goto LABEL_20;
  }
  id v3 = *v2;
  if (*((void *)*v2 + 16))
  {
LABEL_12:
    char v4 = 1;
LABEL_13:
    if (!*((void *)v3 + 17))
    {
LABEL_14:
      v10 = [v3 dataclass];
      uint64_t v11 = SDTraceAdd(3, @"FetchClientState start", -1, v10, *(void **)(a1 + 32), 0.0);
      v12 = [(id)objc_opt_class() _stateInfoAttributeNameWithClientStateName:*(void *)(a1 + 48)];
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(v13 + 128);
      if (!v14) {
        uint64_t v14 = *(void *)(v13 + 136);
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_2;
      v21[3] = &unk_264507F38;
      id v22 = *(id *)(a1 + 32);
      id v23 = v12;
      char v27 = v4;
      id v25 = *(id *)(a1 + 56);
      uint64_t v26 = v11;
      id v24 = v10;
      id v15 = v10;
      id v16 = v12;
      SIBackgroundOpBlock(v14, 9, v21);

      goto LABEL_17;
    }
    goto LABEL_39;
  }
  if (*((void *)v3 + 17))
  {
LABEL_24:
    if (*((void *)v3 + 17))
    {
      char v4 = 1;
      goto LABEL_14;
    }
LABEL_39:
    __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_cold_2();
  }
  if _os_feature_enabled_impl() && ([*((id *)*v2 + 21) isEqualToString:v9])
  {
    [*v2 openJWLIndex];
    id v3 = *v2;
    if (*((void *)*v2 + 17))
    {
      if (*((void *)v3 + 16)) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
    id v19 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    id v17 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5();
    }
  }
  uint64_t v18 = *(void *)(a1 + 56);
  if (v18)
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v16);
LABEL_17:
  }
}

- (NSString)dataclass
{
  return self->_dataclass;
}

+ (id)_stateInfoAttributeNameWithClientStateName:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithFormat:@"_kMDItemStateInfo_%@", v4];

  return v5;
}

- (void)commitUpdates:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_index && !self->_suspended)
  {
    uint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = dataclass;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Index %@ sync", buf, 0xCu);
    }

    uint64_t v7 = self->_dataclass;
    v11[0] = @"commit";
    v11[1] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    uint64_t v9 = SDTransactionCreate(v8);

    id v10 = [(SPConcreteCoreSpotlightIndexer *)self _cancelIdleTimer];
    if (SISyncIndex())
    {
      syncContextCreate(v4, v9);
      SIIndexInactive();
      SISynchedOp();
    }
  }
}

- (void)clientDidCheckin:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    checkedInClients = self->_checkedInClients;
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = dataclass;
    __int16 v18 = 2112;
    id v19 = checkedInClients;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_INFO, "clientDidCheckin, bundleID:%@, dataclass:%@, checkedInClients:%@", (uint8_t *)&v14, 0x20u);
  }

  [(NSMapTable *)self->_checkedInClients setObject:v10 forKey:v8];
  [(SPConcreteCoreSpotlightIndexer *)self checkInWithBundleID:v8 completionHandler:v9];
}

- (void)checkInWithBundleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    id v9 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      index = self->_index;
      knownClients = self->_knownClients;
      checkedInClients = self->_checkedInClients;
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v39 = 2112;
      uint64_t v40 = dataclass;
      __int16 v41 = 2048;
      int64_t v42 = index;
      __int16 v43 = 2112;
      v44 = knownClients;
      __int16 v45 = 2112;
      v46 = checkedInClients;
      _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "checkInWithBundleID, bundleID:%@, dataclass:%@, index:%p, knownClients:%@, checkedInClients:%@", buf, 0x34u);
    }

    if (self->_knownClients)
    {
      if ([v6 isEqual:@"com.apple.mobilemail"]
        && (int v14 = (NSString *)*MEMORY[0x263F08080],
            ([(NSString *)self->_dataclass isEqual:*MEMORY[0x263F08080]] & 1) == 0))
      {
        uint64_t v26 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"com.apple.mobilemail";
          __int16 v39 = 2112;
          uint64_t v40 = v14;
          _os_log_impl(&dword_21F1CE000, v26, OS_LOG_TYPE_DEFAULT, "*warn* client checkin %@ has wrong protection class for for %@", buf, 0x16u);
        }
      }
      else if ([(NSSet *)self->_knownClients containsObject:v6])
      {
        [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        id v15 = self->_index;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_926;
        v27[3] = &unk_264507078;
        objc_copyWeak(&v30, (id *)buf);
        id v28 = v6;
        uint64_t v29 = self;
        SISynchedOpWithBlockPropagatingPriority((uint64_t)v15, 2, v27);

        objc_destroyWeak(&v30);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v17 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:2];
        __int16 v18 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
        id v37 = v18;
        id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
        [v17 setProtectionClasses:v19];

        objc_msgSend(NSString, "stringWithFormat:", @"no known client with bundle ID: %@ ; knownClients=%@",
          v6,
        uint64_t v20 = self->_knownClients);
        [v17 setReason:v20];

        id v21 = [SPCoreSpotlightIndexerTask alloc];
        id v36 = self;
        id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
        id v23 = [(SPCoreSpotlightIndexerTask *)v21 initWithIndexJob:v17 indexers:v22];

        id v35 = v6;
        id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
        [(SPCoreSpotlightIndexerTask *)v23 setBundleIDs:v24];

        -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v23, "setDataMigrationStage:", [WeakRetained dataMigrationStage]);
        [(SPCoreSpotlightIndexerTask *)v23 setShouldResumeOnFailure:0];
        unint64_t createCount = self->_createCount;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke;
        v31[3] = &unk_264507050;
        id v32 = v6;
        id v33 = self;
        unint64_t v34 = createCount;
        [(SPConcreteCoreSpotlightIndexer *)self performIndexerTask:v23 withIndexDelegatesAndCompletionHandler:v31];
      }
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else if (v7)
  {
    __int16 v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke(int8x16_t *a1, void *a2)
{
  if ([a2 containsObject:a1[2].i64[0]])
  {
    id v3 = sIndexQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_2;
    void v7[3] = &unk_2645067E0;
    uint64_t v9 = a1[3].i64[0];
    int8x16_t v6 = a1[2];
    id v4 = (id)v6.i64[0];
    int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
    uint64_t v5 = _setup_block(v7, 0, 5153);
    dispatch_async(v3, v5);
  }
}

- (id)_cancelIdleTimer
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_indexIdleTimer;
  id v4 = v2->_dirtyTransaction;
  indexIdleTimer = v2->_indexIdleTimer;
  v2->_indexIdleTimer = 0;

  dirtyTransaction = v2->_dirtyTransaction;
  v2->_dirtyTransaction = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2->_idleStartTime = 0.0;
    id v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SPConcreteCoreSpotlightIndexer _cancelIdleTimer]();
    }
  }
  return v4;
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_6();
  }

  id v3 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) readyIndex:*(unsigned __int8 *)(a1 + 129)];
  id v4 = *(unsigned char **)(a1 + 32);
  if (*((void *)v4 + 16))
  {
    if (!v4[97]) {
      goto LABEL_5;
    }
LABEL_36:
    id v23 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1();
    }

    uint64_t v22 = *(void *)(a1 + 112);
    if (v22) {
      goto LABEL_56;
    }
    return;
  }
  if (*((void *)v4 + 17))
  {
    if (v4[97]) {
      goto LABEL_36;
    }
    goto LABEL_12;
  }
  if (!v4[96] || v4[97]) {
    goto LABEL_36;
  }
  if (!_os_feature_enabled_impl()
    || ([*((id *)*v3 + 21) isEqualToString:*MEMORY[0x263F08080]] & 1) == 0)
  {
    id v30 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5();
    }

    uint64_t v22 = *(void *)(a1 + 112);
    if (v22) {
      goto LABEL_56;
    }
    return;
  }
  [*v3 openJWLIndex];
  id v4 = *v3;
  if (!*((void *)*v3 + 17))
  {
    v31 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2();
    }

    uint64_t v22 = *(void *)(a1 + 112);
    if (v22) {
      goto LABEL_56;
    }
    return;
  }
  if (!*((void *)v4 + 16))
  {
LABEL_12:
    if (*((void *)v4 + 17)) {
      goto LABEL_13;
    }
LABEL_57:
    __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_3();
  }
LABEL_5:
  if (*((void *)v4 + 17)) {
    goto LABEL_57;
  }
  if (!v4[24] || v4[72] && (CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent(), v4 = *v3, v5 <= *((double *)*v3 + 10)))
  {
    char v6 = 0;
LABEL_18:
    if (v4[24] && v4[72])
    {
      id v10 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 168);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v50 = 2112;
        uint64_t v51 = v12;
        _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "Allowing indexing activity while locked for bundle: %@, dataclass:%@", buf, 0x16u);
      }

      id v4 = *v3;
    }
    uint64_t v13 = [v4 dataclass];
    int v14 = (char *)SDTraceAdd(3, v13, -1, *(void **)(a1 + 40), *(void **)(a1 + 48), 0.0);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v16 = *(id *)(*(void *)(a1 + 32) + 152);
    id v17 = logForCSLogCategoryIndex();
    __int16 v18 = v17;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_21F1CE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "IndexLatency", (const char *)&unk_21F27672A, v48, 2u);
    }

    uint64_t v19 = *((void *)*v3 + 16);
    if (!v19) {
      uint64_t v19 = *((void *)*v3 + 17);
    }
    if (*(unsigned char *)(a1 + 128)) {
      uint64_t v20 = qos_class_self();
    }
    else {
      uint64_t v20 = 0;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089;
    v32[3] = &unk_2645076B0;
    objc_copyWeak(v45, (id *)buf);
    id v24 = *(id *)(a1 + 112);
    char v46 = v6;
    uint64_t v25 = *(void *)(a1 + 32);
    id v44 = v24;
    v32[4] = v25;
    id v33 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 40);
    char v27 = *(void **)(a1 + 120);
    id v34 = v26;
    v45[1] = v27;
    id v35 = *(id *)(a1 + 48);
    id v36 = *(id *)(a1 + 64);
    char v47 = *(unsigned char *)(a1 + 128);
    id v28 = v16;
    id v37 = v28;
    id v38 = *(id *)(a1 + 72);
    id v39 = *(id *)(a1 + 80);
    id v40 = *(id *)(a1 + 88);
    id v41 = *(id *)(a1 + 96);
    id v42 = *(id *)(a1 + 104);
    id v29 = v13;
    id v43 = v29;
    v45[2] = v14;
    v45[3] = *(id *)&Current;
    SIBackgroundOpBlock(v19, v20, v32);

    objc_destroyWeak(v45);
    objc_destroyWeak((id *)buf);
    goto LABEL_42;
  }
LABEL_13:
  if (_os_feature_enabled_impl()
    && ([*((id *)*v3 + 21) isEqualToString:*MEMORY[0x263F08080]] & 1) != 0)
  {
    id v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v50 = 2112;
      uint64_t v51 = v9;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Allowing journaling only while locked for bundle: %@, dataclass:%@", buf, 0x16u);
    }

    id v4 = *v3;
    char v6 = 1;
    goto LABEL_18;
  }
  id v21 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1();
  }

  uint64_t v22 = *(void *)(a1 + 112);
  if (v22)
  {
LABEL_56:
    id v29 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v29);
LABEL_42:
  }
}

uint64_t __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteItemsForEnumerator:*(void *)(a1 + 40) traceID:*(void *)(a1 + 72) bundleID:*(void *)(a1 + 48) fromClient:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_6(uint64_t result, void *a2)
{
  if (*a2) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

- (void)startQueryWithQueryTask:(id)a3 startHandler:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6
{
  id v15 = a3;
  id v10 = (void (**)(id, void))a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    -[SPConcreteCoreSpotlightIndexer startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:]();
  }
  uint64_t v13 = v12;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_suspending)
  {
    v10[2](v10, 0);
  }
  else
  {
    int v14 = [(SPConcreteCoreSpotlightIndexer *)self _startQueryWithQueryTask:v15 eventHandler:v11 resultsHandler:v13];
    ((void (*)(void (**)(id, void), void *, __SI *, NSString *))v10[2])(v10, v14, self->_index, self->_dataclass);
  }
}

- (id)_startQueryWithQueryTask:(id)a3 eventHandler:(id)a4 resultsHandler:(id)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]();
  }
  id v11 = v10;
  id v12 = [v8 resultsQueue];
  uint64_t v13 = v12;
  if (!v12) {
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]();
  }
  if (![v12 siResultsQueue]) {
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]();
  }
  uint64_t v14 = [v8 siQuery];
  if (!v14) {
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:].cold.4();
  }
  uint64_t v15 = v14;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index
    || self->_suspended
    || self->_suspending
    || [(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"_startQueryWithQueryTask"])
  {
    id v16 = 0;
    goto LABEL_10;
  }
  id v34 = (void *)MEMORY[0x223C48320](v9);
  __int16 v18 = [v8 queryContext];
  if (([v18 internal] & 1) == 0)
  {

LABEL_17:
    uint64_t v22 = [v8 clientBundleID];

    if (v22)
    {
      id v23 = [v8 clientBundleID];
      v44[0] = v23;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
    }
    goto LABEL_19;
  }
  uint64_t v19 = [v8 queryContext];
  uint64_t v20 = [v19 bundleIDs];

  if (!v20) {
    goto LABEL_17;
  }
  id v21 = [v8 queryContext];
  [v21 bundleIDs];

LABEL_19:
  uint64_t v24 = SIExecuteQueryWithResultsCallbackForTags();
  if (v24)
  {
    uint64_t v25 = [v8 queryString];
    [v8 queryID];
    uint64_t v27 = v26;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    uint64_t v29 = v28;
    SIQueryRetain();
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    char v43 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __87__SPConcreteCoreSpotlightIndexer__startQueryWithQueryTask_eventHandler_resultsHandler___block_invoke;
    v35[3] = &unk_2645078D8;
    id v38 = v42;
    uint64_t v39 = v27;
    id v37 = v11;
    uint64_t v40 = v29;
    id v30 = v25;
    id v36 = v30;
    uint64_t v41 = v15;
    v31 = (void *)[v35 copy];
    id v16 = [[SPQueryJob alloc] initWithSIJob:v24 dataclass:self->_dataclass eventHandler:v9 resultsHandler:v31];
    id v32 = [v8 queryContext];
    int v33 = [v32 disableResultStreaming];

    if (v33) {
      [v13 setDisableResultStreaming:1];
    }
    [v13 addJob:v16];

    _Block_object_dispose(v42, 8);
  }
  else
  {
    id v16 = 0;
  }

LABEL_10:
  return v16;
}

- (void)readyIndex:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_jwlIndex)
  {
    if (([(id)sDelegate deviceUnlocked] & 1) == 0)
    {
      uint64_t v20 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        dataclass = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = dataclass;
        _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "JWL index open till unlock, dataclass:%@", buf, 0xCu);
      }

      return;
    }
    SICloseJWLIndex();
    self->_jwlIndex = 0;
  }
  if (self->_index) {
    goto LABEL_8;
  }
  CFAbsoluteTime v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = self->_dataclass;
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v6;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Opening index, dataclass:%@", buf, 0xCu);
  }

  [(SPConcreteCoreSpotlightIndexer *)self openIndex:v3];
  if (self->_index)
  {
LABEL_8:
    if (!SIValidIndex())
    {
      uint64_t v22 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v23;
        _os_log_impl(&dword_21F1CE000, v22, OS_LOG_TYPE_INFO, "Re-opening index, dataclass:%@", buf, 0xCu);
      }

      [(SPConcreteCoreSpotlightIndexer *)self closeIndex];
      __int16 v18 = self;
      uint64_t v19 = 1;
      goto LABEL_40;
    }
    if (self->_index)
    {
      SIResumeForUnlock();
      if (self->_index)
      {
        if (self->_suspended)
        {
          id v7 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            id v8 = self->_dataclass;
            id v9 = "YES";
            if (!self->_suspended) {
              id v9 = "NO";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v8;
            __int16 v27 = 2080;
            uint64_t v28 = v9;
            _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Try resume index, dataclass:%@, suspended:%s", buf, 0x16u);
          }

          if ([(id)sDelegate deviceUnlocked])
          {
            if ((uint64_t v10 = *MEMORY[0x263F08080],
                  ![(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08080]])
              && ![(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08088]]
              && ![(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F080A0]]
              || ([(SPConcreteCoreSpotlightIndexer *)self owner],
                  id v11 = objc_claimAutoreleasedReturnValue(),
                  int v12 = [(id)sDelegate deviceFirstUnlockedInSB],
                  v11,
                  v12))
            {
              uint64_t v13 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                uint64_t v14 = self->_dataclass;
                *(_DWORD *)buf = 138412290;
                uint64_t v26 = v14;
                _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "Resuming the protected index for dataclass %@ since the device was unlocked", buf, 0xCu);
              }

              if (!self->_softSuspended && !self->_hasAssertion) {
                SIResumeIndex();
              }
              index = self->_index;
              v24[0] = MEMORY[0x263EF8330];
              v24[1] = 3221225472;
              v24[2] = __45__SPConcreteCoreSpotlightIndexer_readyIndex___block_invoke;
              v24[3] = &unk_2645069B0;
              v24[4] = self;
              SIBackgroundOpBlock((uint64_t)index, 0, v24);
              if (_os_feature_enabled_impl()
                && [(NSString *)self->_dataclass isEqualToString:v10])
              {
                SISyncIndex();
              }
              [(SPConcreteCoreSpotlightIndexer *)self dropBackgroundAssertions:SIIsLockedIndexingMode()];
              *(_WORD *)&self->_suspended = 0;
              if (self->_index)
              {
                if (SIIsLockedIndexingMode())
                {
                  id v16 = logForCSLogCategoryIndex();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                  {
                    id v17 = self->_dataclass;
                    *(_DWORD *)buf = 138412290;
                    uint64_t v26 = v17;
                    _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_INFO, "reopening index as it was opened for locked indexing, dataclass:%@", buf, 0xCu);
                  }

                  [(SPConcreteCoreSpotlightIndexer *)self closeIndex];
                  __int16 v18 = self;
                  uint64_t v19 = 0;
LABEL_40:
                  [(SPConcreteCoreSpotlightIndexer *)v18 openIndex:v19];
                }
              }
            }
          }
        }
      }
    }
  }
}

- (BOOL)denyOperationOnAssertedIndex:(char *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_index && !self->_hasAssertion) {
    return 0;
  }
  CFAbsoluteTime v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    int v8 = 136315394;
    id v9 = a3;
    __int16 v10 = 2112;
    id v11 = dataclass;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Cannot %s on asserted index when device is locked. dataclass:%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

uint64_t __87__SPConcreteCoreSpotlightIndexer__startQueryWithQueryTask_eventHandler_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v11;
  if (v12)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, a3, a4, a5, a6);
    id v11 = v19;
  }
  if (a3 == 2 && a6)
  {
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = [v11 dataclass];
    SDTraceAdd(2, @"Performance", v13, v14, a6, 0.0);
  }
  else if (a3 == 1 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v15 = [v11 dataclass];
    uint64_t v16 = *(void *)(a1 + 56);
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    SDTraceAdd(2, v15, v16, *(void **)(a1 + 32), 0, v17 - *(double *)(a1 + 64));

    SIQueryRelease();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return MEMORY[0x270F9A758]();
}

void __145__SPConcreteCoreSpotlightIndexer__startInternalQueryWithIndex_query_fetchAttributes_forBundleIds_maxCount_resultsHandler_resultQueue_postFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a2;
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v11, a3, a4, a5, a6);
  }
  if (a3 == 1)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v14 = v13 - *(double *)(a1 + 56);
    uint64_t v15 = [v11 dataclass];
    SDTraceAdd(2, v15, *(int *)(a1 + 72), *(void **)(a1 + 32), 0, v14);

    uint64_t v16 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(a1 + 64);
      uint64_t v18 = [v11 siJob];
      uint64_t v19 = *(int *)(a1 + 72);
      int v20 = 134218752;
      uint64_t v21 = (uint64_t)(v14 * 1000.0);
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = v19;
      _os_log_debug_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEBUG, "Finished internal query (%lldms), siQuery:%p, siJob:%p, queryID:%ld", (uint8_t *)&v20, 0x2Au);
    }

    SIQueryRelease();
    SDTransactionDone(*(void **)(a1 + 40));
  }
}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  id v8 = a2;
  if (a3 == 1)
  {
    if ([*(id *)(a1 + 32) index] != *(void *)(a1 + 72))
    {
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && [*(id *)(a1 + 32) index] == *(void *)(a1 + 72))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    CFRetain(a5);
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = qos_class_self();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_3;
    v16[3] = &unk_264507950;
    int v20 = a5;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v17 = v11;
    uint64_t v19 = v12;
    id v18 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v9, v10, v16);
  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_433(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_433_cold_1();
    }
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_6;
    v8[3] = &unk_264506C80;
    id v9 = *(id *)(a1 + 32);
    [a5 enumerateQueryResults:1 stringCache:0 usingBlock:v8];
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_8;
  v6[3] = &unk_264507A68;
  BOOL v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateObjectsUsingBlock:v6];
  if (v4 && [v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 48) owner];
    [v5 indexSearchableItems:v4 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:*MEMORY[0x263F08098] forBundleID:@"com.apple.application" options:0 completionHandler:&__block_literal_global_1265];
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] void flag for %@", buf, 0xCu);
    }

    uint64_t v8 = *MEMORY[0x263F02398];
    uint64_t v9 = *MEMORY[0x263EFFD08];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F02AE8]) initWithAttributes:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v3 domainIdentifier:0 attributeSet:v6];
    [v7 setBundleID:@"com.apple.application"];
    [v7 setIsUpdate:1];
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke(id *a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] job];
  id v3 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v4 = [a1[4] bundleIDs];
  if (v4)
  {
    uint64_t v5 = (void *)[v3 initWithArray:v4];
  }
  else
  {
    uint64_t v6 = [*((id *)a1[5] + 4) keyEnumerator];
    id v7 = [v6 allObjects];
    uint64_t v5 = (void *)[v3 initWithArray:v7];
  }
  uint64_t v8 = [a1[4] completedBundleIDs];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263EFFA08]);
    id v11 = [a1[4] completedBundleIDs];
    uint64_t v12 = (void *)[v10 initWithArray:v11];
    [v5 minusSet:v12];
  }
  id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v13 = dispatch_group_create();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int v33 = v5;
  id obj = [v5 allObjects];
  uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    id v34 = (void *)*MEMORY[0x263F08098];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v19 = [*((id *)a1[5] + 4) objectForKey:v18];
        if (!v19)
        {
          if (![v18 isEqualToString:@"com.apple.mobileslideshow"]) {
            continue;
          }
          uint64_t v19 = [*((id *)a1[5] + 4) objectForKey:@"com.apple.assetsd"];
          if (!v19) {
            continue;
          }
        }
        if ([v2 jobType] == 2)
        {
          if ([*((id *)a1[5] + 5) containsObject:v18])
          {
            int v20 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = a1[5];
              uint64_t v22 = v21[21];
              uint64_t v23 = v21[25];
              uint64_t v24 = v21[5];
              *(_DWORD *)buf = 138413314;
              uint64_t v52 = v2;
              __int16 v53 = 2112;
              v54 = v18;
              __int16 v55 = 2112;
              uint64_t v56 = v22;
              __int16 v57 = 2112;
              uint64_t v58 = v23;
              __int16 v59 = 2112;
              uint64_t v60 = v24;
              _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "Dropping job:%@ with checked-in client for bundleID:%@, dataclass:%@, knownClients:%@, reindexAllDelegateBundleIDs:%@", buf, 0x34u);
            }
LABEL_25:

            continue;
          }
          [*((id *)a1[5] + 5) addObject:v18];
        }
        uint64_t v25 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *((void *)a1[5] + 21);
          *(_DWORD *)buf = 138412802;
          uint64_t v52 = v2;
          __int16 v53 = 2112;
          v54 = v18;
          __int16 v55 = 2112;
          uint64_t v56 = v26;
          _os_log_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_INFO, "Performing job:%@ with the checked-in client for bundleID:%@, dataclass:%@", buf, 0x20u);
        }

        dispatch_group_enter(v13);
        int v20 = *((id *)a1[5] + 21);
        if ([*((id *)a1[5] + 21) isEqual:@"Priority"])
        {
          uint64_t v27 = v34;

          int v20 = v27;
        }
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_936;
        v40[3] = &unk_264507118;
        id v28 = v2;
        id v41 = v28;
        id v42 = v18;
        id v43 = a1[5];
        id v44 = v36;
        id v45 = a1[4];
        char v46 = v13;
        [v19 performIndexJob:v28 protectionClass:v20 acknowledgementHandler:v40];

        goto LABEL_25;
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v15);
  }

  uint64_t v29 = [a1[5] firstUnlockQueue];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_937;
  v37[3] = &unk_264506440;
  id v30 = a1[6];
  id v38 = v36;
  id v39 = v30;
  id v31 = v36;
  id v32 = _setup_block(v37, 0, 5324);
  dispatch_group_notify(v13, v29, v32);
}

- (void)performIndexerTask:(id)a3 withIndexDelegatesAndCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke;
  v13[3] = &unk_264507140;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x223C48320](v13);
  id v11 = [(SPConcreteCoreSpotlightIndexer *)self firstUnlockQueue];
  uint64_t v12 = _setup_block(v10, 0, 5326);
  dispatch_async(v11, v12);
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

- (void)dirty:(BOOL)a3
{
  uint64_t v5 = SDTransactionCreate(0);
  id v6 = sIndexQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke;
  v9[3] = &unk_264506B18;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  id v8 = _setup_block(v9, 0, 1796);
  dispatch_async(v6, v8);
}

- (void)dirty
{
}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

- (void)completeIndexingItemFor:(id)a3 delegate:(id)a4 didBeginThrottle:(BOOL)a5 didEndThrottle:(BOOL)a6 error:(id)a7 live:(BOOL)a8 queue:(id)a9 slow:(BOOL)a10 startTime:(double)a11 completionHandler:(id)a12
{
  BOOL v13 = a8;
  BOOL v15 = a6;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  uint64_t v21 = a9;
  id v22 = a12;
  uint64_t v23 = v22;
  if (a10)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (v13)
    {
      int v25 = live_delay;
      double v26 = *(float *)&live_delay + *(float *)&live_delay_scaler * (Current - a11);
      if (v26 >= *(float *)&live_delay_scaled_max) {
        double v26 = *(float *)&live_delay_scaled_max;
      }
    }
    else
    {
      double v28 = *(float *)&bulk_delay;
      uint64_t v29 = [(id)buckets count];
      float v30 = (float)v29;
      double v31 = v30;
      if (!v29) {
        double v31 = 1.0;
      }
      double v32 = v28 + v31 * ((Current - a11) * *(float *)&bulk_delay_scaler);
      double v26 = *(float *)&bulk_delay_scaled_max;
      if (v32 < *(float *)&bulk_delay_scaled_max) {
        double v26 = v32;
      }
      int v25 = live_delay;
    }
    if (!v13) {
      int v25 = bulk_delay;
    }
    double v33 = *(float *)&v25;
    if (v26 >= 0.0) {
      double v33 = v26;
    }
    if (gIsSystemOnBattery) {
      double v34 = v33;
    }
    else {
      double v34 = v33 * 0.5;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v18;
      __int16 v44 = 2048;
      double v45 = v34;
      _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Throttling indexing reply for %@ by %g s", buf, 0x16u);
    }
    dispatch_time_t v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __149__SPConcreteCoreSpotlightIndexer_completeIndexingItemFor_delegate_didBeginThrottle_didEndThrottle_error_live_queue_slow_startTime_completionHandler___block_invoke;
    block[3] = &unk_264507520;
    id v40 = v23;
    id v37 = v20;
    BOOL v41 = a5;
    id v38 = v19;
    id v39 = v18;
    dispatch_after(v35, v21, block);
  }
  else
  {
    (*((void (**)(id, id))v22 + 2))(v22, v20);
    if (v19 && v15)
    {
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:5 jobOptions:0];
      [v19 indexRequestsPerformJob:v27 forBundle:v18 completionHandler:0];
    }
  }
}

- (void)fetchLastClientStateForBundleID:(id)a3 clientStateName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer fetchLastClientStateForBundleID:clientStateName:completionHandler:]();
  }

  uint64_t v12 = sIndexQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke;
  v17[3] = &unk_264507900;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  id v16 = _setup_block(v17, 0, 10448);
  dispatch_async(v12, v16);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 forBundleID:(id)a4 fromClient:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138413058;
    id v29 = v13;
    __int16 v30 = 2112;
    double v31 = dataclass;
    __int16 v32 = 2048;
    uint64_t v33 = [v12 count];
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "deleteSearchableItemsWithDomainIdentifiers, bundleID:%@, protectionClass:%@, domainIdentifiers:%lu, reason:%lu", buf, 0x2Au);
  }

  id v18 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithDomainIdentifiers:forBundleID:fromClient:reason:completionHandler:]();
  }

  if ([v13 length])
  {
    if ([v12 count])
    {
      id v19 = [MEMORY[0x263F02A98] sharedInstance];
      objc_msgSend(v19, "logWithBundleID:indexOperation:itemCount:code:", v13, 2, objc_msgSend(v12, "count"), a6);

      id v20 = sIndexQueue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke;
      void v23[3] = &unk_264507B30;
      v23[4] = self;
      id v27 = v15;
      id v24 = v13;
      id v25 = v12;
      id v26 = v14;
      id v21 = _setup_block(v23, 0, 9414);
      dispatch_async(v20, v21);
    }
    else if (v15)
    {
      (*((void (**)(id, void))v15 + 2))(v15, 0);
    }
  }
  else if (v15)
  {
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    (*((void (**)(id, void *))v15 + 2))(v15, v22);
  }
}

- (void)indexFinishedDrainingJournal:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    __int16 v50 = 2112;
    uint64_t v51 = (__CFString *)dataclass;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "indexFinishedDrainingJournal, bundleID:%@, dataclass:%@", buf, 0x16u);
  }

  id v7 = [(SPConcreteCoreSpotlightIndexer *)self owner];
  id v8 = (void *)[v7 dataMigrationStage];
  id v9 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v9
    && !self->_readOnly
    && !self->_suspended
    && !self->_suspending
    && ![(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"indexFinishedDrainingJournal"])
  {
    if (!v4 && !sPrivate)
    {
      [(SPConcreteCoreSpotlightIndexer *)self updateEmailLocalParts:0];
      [(SPConcreteCoreSpotlightIndexer *)self updateEmailContentURLAttr:0];
      [(SPConcreteCoreSpotlightIndexer *)self updateRankingDates:0];
      [(SPConcreteCoreSpotlightIndexer *)self updateContainersAndScores:0];
      [(SPConcreteCoreSpotlightIndexer *)self updateGroups:0];
      [(SPConcreteCoreSpotlightIndexer *)self updateNotes:0];
      [(SPConcreteCoreSpotlightIndexer *)self issuePhotosReindexIfNeeded:0];
    }
    if (![v4 isEqual:@"com.apple.mobilemail"]) {
      goto LABEL_20;
    }
    uint64_t v10 = *MEMORY[0x263F08080];
    char v11 = [(NSString *)self->_dataclass isEqual:*MEMORY[0x263F08080]];
    id v12 = logForCSLogCategoryIndex();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "Check whether Mail needs reindexing", buf, 2u);
      }

      id v14 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:@"com.apple.mobilemail.reindexVersion"];
      id v15 = v14;
      if (v14)
      {
        char v16 = [v14 isEqual:@"599"];
        id v17 = logForCSLogCategoryIndex();
        id v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v15;
            __int16 v50 = 2112;
            uint64_t v51 = @"599";
            _os_log_impl(&dword_21F1CE000, v18, OS_LOG_TYPE_INFO, "Reindex version matches %@==%@", buf, 0x16u);
          }

LABEL_20:
          if (v4)
          {
            if ([(SPConcreteCoreSpotlightIndexer *)self clientIsCheckedIn:v4])
            {
              id v19 = [(SPConcreteCoreSpotlightIndexer *)self owner];
              id v20 = [v19 extensionDelegate];
              char v21 = [v20 extensionExistsForBundleId:v4];

              if ((v21 & 1) == 0)
              {
                id v22 = [MEMORY[0x263F78CE8] sharedProcessor];
                v42[0] = MEMORY[0x263EF8330];
                v42[1] = 3221225472;
                v42[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_433;
                void v42[3] = &unk_264506B90;
                id v43 = v4;
                [v22 updateCheckedInClientWithBundleIdentifier:v43 completionHandler:v42];
              }
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 hasPrefix:@"com.apple."])
          {
            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_437;
            v39[3] = &unk_264506BE0;
            objc_copyWeak(v41, (id *)buf);
            v41[1] = v9;
            id v23 = v4;
            id v40 = v23;
            v41[2] = v8;
            id v24 = (void *)MEMORY[0x223C48320](v39);
            id v25 = [NSString stringWithFormat:@"(_kMDItemWillModify=1)&&(_kMDItemBundleID=\"%@\"", v23];
            double v45 = @"_kMDItemExternalID";
            id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
            id v44 = v23;
            id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
            [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v9 query:v25 fetchAttributes:v26 forBundleIds:v27 resultsHandler:v24];

            objc_destroyWeak(v41);
            objc_destroyWeak((id *)buf);
          }
          goto LABEL_38;
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        __int16 v50 = 2112;
        uint64_t v51 = @"599";
        double v28 = "Reindex version mismatch %@!=%@";
        id v29 = v18;
        uint32_t v30 = 22;
      }
      else
      {
        id v18 = logForCSLogCategoryIndex();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
LABEL_35:

          double v31 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:2];
          __int16 v32 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
          long long v48 = v32;
          uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
          [v31 setProtectionClasses:v33];

          [v31 setReason:@"re-indexing mail - finished draining journal"];
          __int16 v34 = [SPCoreSpotlightIndexerTask alloc];
          long long v47 = self;
          int64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
          uint64_t v36 = [(SPCoreSpotlightIndexerTask *)v34 initWithIndexJob:v31 indexers:v35];

          id v46 = v4;
          id v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
          [(SPCoreSpotlightIndexerTask *)v36 setBundleIDs:v37];

          [(SPCoreSpotlightIndexerTask *)v36 setDataMigrationStage:v8];
          [(SPConcreteCoreSpotlightIndexer *)self performIndexerTask:v36 completionHandler:&__block_literal_global_431];
          id v38 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = @"com.apple.mobilemail.reindexVersion";
            __int16 v50 = 2112;
            uint64_t v51 = @"599";
            _os_log_impl(&dword_21F1CE000, v38, OS_LOG_TYPE_INFO, "Reindexing and setting %@ %@", buf, 0x16u);
          }

          [(SPConcreteCoreSpotlightIndexer *)self setProperty:@"599" forKey:@"com.apple.mobilemail.reindexVersion" sync:1];
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        double v28 = "Reindex version not set";
        id v29 = v18;
        uint32_t v30 = 2;
      }
      _os_log_impl(&dword_21F1CE000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      goto LABEL_35;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v50 = 2112;
      uint64_t v51 = @"com.apple.mobilemail";
      _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "*warn* index %@ has information for %@", buf, 0x16u);
    }
  }
LABEL_38:
}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v28[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v9 = [*(id *)(a1 + 48) UTF8String];
    uint64_t v20 = [*(id *)(a1 + 56) UTF8String];
    uint64_t v21 = [*(id *)(a1 + 64) UTF8String];
    uint64_t v19 = v9;
    SILogActivity();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_2;
    void v23[3] = &unk_264507978;
    uint64_t v27 = a2;
    int8x16_t v22 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v22.i64[0];
    int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
    id v25 = *(id *)(a1 + 56);
    int8x16_t v26 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    char v11 = (void *)MEMORY[0x223C48320](v23);
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 56))
    {
      v28[0] = *(void *)(a1 + 56);
      id v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v28, 1, v19, v20, v21);
      char v15 = [v12 _startInternalQueryWithIndex:a2 query:v13 fetchAttributes:MEMORY[0x263EFFA68] forBundleIds:v14 resultsHandler:v11];

      if (v15)
      {
LABEL_8:

        return;
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", a2, *(void *)(a1 + 64), MEMORY[0x263EFFA68], 0, v11, v19, v20, v21))
    {
      goto LABEL_8;
    }
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_8;
  }
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 resultsHandler:(id)a7
{
  return [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:a3 query:a4 fetchAttributes:a5 forBundleIds:a6 maxCount:0 resultsHandler:a7];
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8
{
  return [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:a3 query:a4 fetchAttributes:a5 forBundleIds:a6 maxCount:a7 resultsHandler:a8 resultQueue:0];
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9
{
  return [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:a3 query:a4 fetchAttributes:a5 forBundleIds:a6 maxCount:a7 resultsHandler:a8 resultQueue:a9 postFilter:0];
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9 postFilter:(id)a10
{
  v65[2] = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (!v19)
  {
    id v19 = +[SPQueryResultsQueue sharedInstanceMaintenanceDispatchQueue:0];
  }
  [v19 siResultsQueue];
  if (!a3 || self->_suspended || self->_suspending)
  {
    uint64_t v21 = logForCSLogCategoryQuery();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int8x16_t v24 = "YES";
    BOOL suspending = self->_suspending;
    if (self->_suspended) {
      int8x16_t v26 = "YES";
    }
    else {
      int8x16_t v26 = "NO";
    }
    *(_DWORD *)buf = 138413058;
    if (!suspending) {
      int8x16_t v24 = "NO";
    }
    id v54 = v15;
    __int16 v55 = 2048;
    uint64_t v56 = a3;
    __int16 v57 = 2080;
    uint64_t v58 = (uint64_t)v26;
    __int16 v59 = 2080;
    uint64_t v60 = (uint64_t)v24;
    uint64_t v27 = "Failed to execute internal query:\"%@\", index:%p, _suspended:%s, _suspending:%s";
    double v28 = v21;
    uint32_t v29 = 42;
LABEL_18:
    _os_log_error_impl(&dword_21F1CE000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_7;
  }
  if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"_startInternalQueryWithIndex"])
  {
    BOOL v22 = 0;
    goto LABEL_9;
  }
  signed int add = atomic_fetch_add(gQueryID_0, 1u);
  uint64_t v30 = SIQueryCreateWithItems();
  if (!v30)
  {
    uint64_t v21 = logForCSLogCategoryQuery();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412802;
    id v54 = v15;
    __int16 v55 = 2048;
    uint64_t v56 = a3;
    __int16 v57 = 2048;
    uint64_t v58 = add;
    uint64_t v27 = "Failed to create internal query:\"%@\", index:%p, queryID:%ld";
    double v28 = v21;
    uint32_t v29 = 32;
    goto LABEL_18;
  }
  dataclass = self->_dataclass;
  v65[0] = @"query";
  v65[1] = dataclass;
  uint64_t v45 = v30;
  id v42 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v65, 2, 0, 0, 0, v20);
  uint64_t v21 = SDTransactionCreate(v42);

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v33 = v32;
  uint64_t v34 = SIExecuteQueryWithResultsCallbackForTags();
  if (v34)
  {
    uint64_t v43 = v34;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __145__SPConcreteCoreSpotlightIndexer__startInternalQueryWithIndex_query_fetchAttributes_forBundleIds_maxCount_resultsHandler_resultQueue_postFilter___block_invoke;
    v46[3] = &unk_264507FD8;
    id v49 = v18;
    uint64_t v50 = v33;
    signed int v52 = add;
    id v40 = v15;
    id v47 = v40;
    uint64_t v51 = v45;
    uint64_t v21 = v21;
    long long v48 = v21;
    BOOL v41 = (void *)[v46 copy];
    int64_t v35 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
      *(_DWORD *)buf = 138413570;
      id v54 = v40;
      __int16 v55 = 2048;
      uint64_t v56 = a3;
      __int16 v57 = 2048;
      uint64_t v58 = v45;
      __int16 v59 = 2048;
      uint64_t v60 = v43;
      __int16 v61 = 2048;
      uint64_t v62 = add;
      __int16 v63 = 2112;
      id v39 = (void *)v38;
      uint64_t v64 = v38;
      _os_log_debug_impl(&dword_21F1CE000, v35, OS_LOG_TYPE_DEBUG, "Starting internal query:\"%@\", index:%p, siQuery:%p, siJob:%p, queryID:%ld, dataclass:%@", buf, 0x3Eu);
    }
    uint64_t v36 = [[SPQueryJob alloc] initWithSIJob:v43 dataclass:self->_dataclass eventHandler:0 resultsHandler:v41];
    [v19 addJob:v36];
    BOOL v22 = v36 != 0;

    goto LABEL_8;
  }
  id v37 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    id v54 = v15;
    __int16 v55 = 2048;
    uint64_t v56 = a3;
    __int16 v57 = 2048;
    uint64_t v58 = v45;
    __int16 v59 = 2048;
    uint64_t v60 = add;
    _os_log_error_impl(&dword_21F1CE000, v37, OS_LOG_TYPE_ERROR, "Failed to execute query:\"%@\", index:%p, siQuery:%p, queryID:%ld", buf, 0x2Au);
  }

  SIQueryRelease();
  SDTransactionDone(v21);
LABEL_7:
  BOOL v22 = 0;
LABEL_8:

LABEL_9:
  return v22;
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = a2;
    uint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = [v4 length];
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "#index fetch state dataLen:%ld", (uint8_t *)&v11, 0xCu);
    }

    SDTraceAdd(3, @"ClientState complete", *(void *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 32), 0.0);
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_9:
    v6();

    return;
  }
  if (a3)
  {
    id v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "SIFetchCSClientState canceled for bundleID:%@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    id v6 = *(void (**)(void))(v9 + 16);
    goto LABEL_9;
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v10();
}

- (void)checkAdmission:(id)a3 background:(BOOL)a4 didBeginThrottle:(BOOL *)a5 didEndThrottle:(BOOL *)a6 live:(BOOL *)a7 slow:(BOOL *)a8 memoryPressure:(BOOL *)a9
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v15 = a3;
  if (v15
    && !a4
    && ([(SPConcreteCoreSpotlightIndexer *)self owner],
        id v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 isForegroundFileProviderBundleID:v15],
        v16,
        (v17 & 1) != 0))
  {
    id v18 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      id v30 = v15;
      _os_log_impl(&dword_21F1CE000, v18, OS_LOG_TYPE_INFO, "Skipping admission check for foreground file provider %@", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    int v19 = [v15 hasPrefix:@"com.apple."];
    if (a4)
    {
      BOOL v20 = 0;
    }
    else
    {
      uint64_t v21 = [(id)buckets valueForKey:v15];
      BOOL v20 = v21 < bulk_budget_threshold;
    }
    *a7 = v20;
    if (v19) {
      uint64_t v22 = v20 | 2u;
    }
    else {
      uint64_t v22 = v20;
    }
    if (CFAbsoluteTimeGetCurrent() - check_admission_time[v22] > (double)budget_check_threshold_delay
      || check_admission[v22])
    {
      id v23 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        id v30 = v15;
        _os_log_impl(&dword_21F1CE000, v23, OS_LOG_TYPE_INFO, "Running admission check for bundle id %@", (uint8_t *)&v29, 0xCu);
      }

      check_admission_time[v22] = CFAbsoluteTimeGetCurrent();
      check_admission[v22] = 0;
      if (s_last_memory_pressure_status != 1) {
        *a9 = 1;
      }
      if (sTurboMode
        || ([MEMORY[0x263F3AFE0] sharedInstance],
            int8x16_t v24 = objc_claimAutoreleasedReturnValue(),
            int v25 = [v24 allowsDiscretionaryWorkForTask:@"indexing" withPriority:*MEMORY[0x263F3B050] withParameters:0], v24, v25))
      {
        int8x16_t v26 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412546;
          id v30 = v15;
          __int16 v31 = 2048;
          uint64_t v32 = v22;
          _os_log_impl(&dword_21F1CE000, v26, OS_LOG_TYPE_INFO, "Passed admission, bundleID:%@, budgetIndex:%ld", (uint8_t *)&v29, 0x16u);
        }

        if (slow_admission[v22]) {
          *a6 = 1;
        }
        char v27 = 0;
        slow_admission[v22] = 0;
      }
      else
      {
        double v28 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412546;
          id v30 = v15;
          __int16 v31 = 2048;
          uint64_t v32 = v22;
          _os_log_impl(&dword_21F1CE000, v28, OS_LOG_TYPE_INFO, "Failed admission, bundleID:%@, budgetIndex:%ld - slowing replies", (uint8_t *)&v29, 0x16u);
        }

        if (!slow_admission[v22]) {
          *a5 = 1;
        }
        char v27 = 1;
        slow_admission[v22] = 1;
      }
    }
    else
    {
      char v27 = slow_admission[v22];
    }
    *a8 = v27;
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v11 = a2;
  uint64_t v12 = a6;
  int v13 = [v11 hasPrefix:@"com.apple."];
  if (a3)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v15 = [(id)buckets valueForKey:v11];
    BOOL v14 = v15 < bulk_budget_threshold;
  }
  BOOL v34 = v14;
  char v33 = 0;
  double Current = 0.0;
  if (a4 && !sTurboMode)
  {
    buf[0] = 0;
    __int16 v32 = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 32) checkAdmission:v11 background:a3 didBeginThrottle:(char *)&v32 + 1 didEndThrottle:&v32 live:&v34 slow:&v33 memoryPressure:buf];
  }
  duet_log_activity_start(1);
  v12[2](v12);

  duet_log_activity_stop();
  if (a4 && !sTurboMode && v33)
  {
    double v17 = fmin((CFAbsoluteTimeGetCurrent() - Current) * 5.0 + 0.00999999978, 5.0);
    if (v17 < 0.0) {
      double v17 = 0.00999999978;
    }
    if (gIsSystemOnBattery) {
      double v18 = v17;
    }
    else {
      double v18 = v17 * 0.5;
    }
    if (v18 > 0.0)
    {
      usleep((v18 * 1000000.0));
      int v19 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        BOOL v20 = "live";
        *(_DWORD *)buf = 136315650;
        if (a3) {
          BOOL v20 = "background";
        }
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        id v38 = v11;
        __int16 v39 = 2048;
        double v40 = v18;
        _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_INFO, "Slowed down %s journal playback for %@ by %f s", buf, 0x20u);
      }
    }
  }
  int v21 = v14 | 2;
  if (!v13) {
    int v21 = v14;
  }
  uint64_t v22 = sIndexQueue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_847;
  v26[3] = &unk_264506F88;
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(a1 + 40);
  uint64_t v29 = a5;
  char v31 = a3;
  v26[4] = v23;
  id v27 = v11;
  int v30 = v21;
  id v24 = v11;
  int v25 = _setup_block(v26, 0, 4539);
  dispatch_async(v22, v25);
}

- (BOOL)clientIsCheckedIn:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[NSMapTable objectForKey:](self->_checkedInClients, "objectForKey:");
  BOOL v4 = v3 != 0;

  return v4;
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_4(id *a1)
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_5;
  v13[3] = &unk_264507A40;
  id v14 = a1[4];
  id v2 = (void *)MEMORY[0x223C48320](v13);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_7;
  uint64_t v9 = &unk_264507A90;
  id v10 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v11 = v3;
  id v12 = v4;
  uint64_t v5 = (void *)MEMORY[0x223C48320](&v6);
  objc_msgSend(a1[6], "deleteHasTopHitAppShortcutsWithResultsHandler:completionHandler:", v2, v5, v6, v7, v8, v9);
}

- (void)deleteHasTopHitAppShortcutsWithResultsHandler:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)MEMORY[0x263F02AD0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setInternal:1];
  [v8 setLowPriority:0];
  v16[0] = *MEMORY[0x263F022A0];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v8 setFetchAttributes:v9];

  uint64_t v15 = *MEMORY[0x263F08098];
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  [v8 setProtectionClasses:v10];

  [v8 setBundleIDs:&unk_26D0C8D58];
  id v11 = [NSString stringWithFormat:@"%@=1", *MEMORY[0x263F02398]];
  id v12 = +[SPCoreSpotlightIndexer sharedInstance];
  int v13 = [v12 taskForQueryWithQueryString:v11 queryContext:v8 eventHandler:0 resultsHandler:v7 completionHandler:v6];

  id v14 = +[SPCoreSpotlightIndexer sharedInstance];
  [v14 startQueryTask:v13];
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke(id *a1)
{
  [a1[4] readyIndex:0];
  id v2 = a1[4];
  if (*((void *)v2 + 16) && !*((unsigned char *)v2 + 24))
  {
    id location = 0;
    objc_initWeak(&location, v2);
    id v7 = a1[4];
    id v8 = (void *)v7[16];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2;
    v11[3] = &unk_264507B08;
    v11[4] = v7;
    id v12 = a1[5];
    id v13 = a1[6];
    id v14 = a1[7];
    id v15 = a1[8];
    v16[1] = v8;
    objc_copyWeak(v16, &location);
    uint64_t v9 = (void (**)(void))MEMORY[0x223C48320](v11);
    v9[2]();

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else if (a1[8])
  {
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v4 = [a1[4] _indexPath];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

    uint64_t v6 = 0;
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    }
    id v10 = (id)v6;
    (*((void (**)(void))a1[8] + 2))();
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v20 = SDTraceAdd(3, @"DeleteDomainIdentifiers start", -1, *(void **)(*(void *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  uint64_t v21 = a1;
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  id v24 = v2;
  id v25 = v3;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [v25 count];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v22 = *MEMORY[0x263F02020];
    uint64_t v23 = v4;
    do
    {
      uint64_t v27 = v5;
      uint64_t v6 = objc_msgSend(v25, "subarrayWithRange:");
      id v28 = v24;
      id v29 = v6;
      id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
      if ([v29 count])
      {
        objc_msgSend(v7, "appendFormat:", @"%@ = %@ && FieldMatch(%@, "), CFSTR("_kMDItemBundleID"), v28, v22;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v8 = v29;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v36;
          char v11 = 1;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v36 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              if ((v11 & 1) == 0) {
                [v7 appendString:@", "];
              }
              [v7 appendFormat:@"\"%@\"", v13];
              [v7 appendFormat:@", \"%@.*\"", v13];
              char v11 = 0;
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
            char v11 = 0;
          }
          while (v9);
        }

        [v7 appendString:@""]);
      }

      [v26 addObject:v7];
      uint64_t v5 = v27 + 64;
    }
    while (v27 + 64 < v23);
  }

  id v14 = [v26 objectEnumerator];
  id v16 = *(void **)(v21 + 32);
  uint64_t v15 = *(void *)(v21 + 40);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3;
  v30[3] = &unk_264507AE0;
  uint64_t v17 = *(void *)(v21 + 56);
  id v33 = *(id *)(v21 + 64);
  id v18 = *(id *)(v21 + 40);
  int v19 = *(void **)(v21 + 80);
  id v31 = v18;
  v34[1] = v19;
  objc_copyWeak(v34, (id *)(v21 + 72));
  uint64_t v32 = *(void *)(v21 + 32);
  [v16 deleteItemsForEnumerator:v14 traceID:v20 bundleID:v15 fromClient:v17 completionHandler:v30];
  objc_destroyWeak(v34);
}

- (void)deleteItemsForEnumerator:(id)a3 traceID:(int64_t)a4 bundleID:(id)a5 fromClient:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_index)
  {
    if (!self->_readOnly)
    {
      id v16 = [v12 nextObject];
      if (v16)
      {
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        id v25 = __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke;
        id v26 = &unk_264507A18;
        id v31 = v15;
        uint64_t v27 = self;
        id v28 = v12;
        int64_t v32 = a4;
        id v17 = v13;
        id v29 = v17;
        id v18 = v14;
        id v30 = v18;
        int v19 = (void *)MEMORY[0x223C48320](&v23);
        -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:](self, "deleteItemsForQuery:bundleID:fromClient:completionHandler:", v16, v17, v18, v19, v23, v24, v25, v26, v27);
      }
      else
      {
        uint64_t v22 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
        SDTraceAdd(3, @"deleteItemsForEnumerator complete", a4, v22, v13, 0.0);

        if (v15) {
          (*((void (**)(id, void))v15 + 2))(v15, 0);
        }
      }
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  uint64_t v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForEnumerator because index is null", buf, 2u);
  }

  if (self->_readOnly)
  {
LABEL_8:
    uint64_t v21 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v21, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForEnumerator because index is read-only", buf, 2u);
    }
  }
  if (v15)
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*((void (**)(id, void *))v15 + 2))(v15, v16);
LABEL_13:
  }
}

- (void)deleteItemsForQuery:(id)a3 bundleID:(id)a4 fromClient:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  id v14 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:]();
  }

  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = __Block_byref_object_copy_;
  id v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  void v42[3] = 0;
  index = self->_index;
  if (index)
  {
    if (!self->_readOnly)
    {
      if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"deleteItemsForQuery"])
      {
        uint64_t v16 = *MEMORY[0x263F01C68];
        id v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
        if (!v13)
        {
LABEL_18:

          goto LABEL_19;
        }
        id v18 = [MEMORY[0x263F087E8] errorWithDomain:v16 code:-1000 userInfo:0];
        v13[2](v13, v18, 0);
      }
      else
      {
        id v26 = dispatch_group_create();
        dispatch_group_enter(v26);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke;
        v33[3] = &unk_2645079A0;
        __int16 v39 = &v45;
        id v17 = v26;
        BOOL v34 = v17;
        long long v35 = self;
        id v36 = v12;
        id v37 = v11;
        id v38 = v10;
        uint64_t v40 = v42;
        SIBackgroundOpBlock((uint64_t)index, 0, v33);
        uint64_t v27 = dispatch_get_global_queue(9, 2uLL);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_5;
        block[3] = &unk_2645079C8;
        id v30 = &v45;
        id v31 = v43;
        id v29 = v13;
        int64_t v32 = v42;
        dispatch_group_notify(v17, v27, block);

        id v18 = v34;
      }

      goto LABEL_18;
    }
  }
  else
  {
    int v19 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:]();
    }

    if (!self->_readOnly) {
      goto LABEL_14;
    }
  }
  uint64_t v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForQuery because the index is read-only", buf, 2u);
  }

LABEL_14:
  uint64_t v21 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v22 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  int v23 = [v21 fileExistsAtPath:v22 isDirectory:0];

  if (v23)
  {
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    id v25 = (void *)v46[5];
    v46[5] = v24;

    v13[2](v13, (void *)v46[5], 0);
  }
LABEL_19:
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
LABEL_2:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.shortcuts"])
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (!v5)
    {
      id v7 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_cold_1();
      }

      id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      goto LABEL_2;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_1256;
    v8[3] = &unk_264507AB8;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    void v8[4] = *(void *)(a1 + 40);
    SIBackgroundOpBlock(v5, 0, v8);
    objc_destroyWeak(&v9);
  }
  uint64_t v4 = 0;
LABEL_7:
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }
}

uint64_t __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_5(void *a1)
{
  if (!*(void *)(*(void *)(a1[5] + 8) + 40) && *(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v3 = *(void *)(a1[5] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t result = a1[4];
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    uint64_t v5 = sIndexQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke_2;
    v10[3] = &unk_2645079F0;
    uint64_t v6 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 72);
    id v11 = v7;
    uint64_t v15 = v8;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v9 = _setup_block(v10, 0, 9273);
    dispatch_async(v5, v9);
  }
}

- (void)indexFromBundle:(id)a3 personaID:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 canCreateNewIndex:(BOOL)a13 completionHandler:(id)a14
{
  id v48 = a3;
  id v45 = a4;
  id v47 = a6;
  id v39 = a7;
  id v38 = a8;
  id v40 = a9;
  id v18 = a11;
  id v19 = a12;
  id v20 = a14;
  if (a10)
  {
    uint64_t v21 = (void *)MEMORY[0x263EFF8F8];
    id v22 = a10;
    uint64_t v23 = [v22 bytes];
    uint64_t v24 = [v22 length];

    id v25 = [v21 dataWithBytes:v23 length:v24];
  }
  else
  {
    id v25 = 0;
  }
  id v26 = v25;
  if ((a5 & 0x20) != 0)
  {
    if (([v48 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
      || ([v48 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0)
    {
      char v27 = 1;
    }
    else
    {
      char v27 = [v48 isEqualToString:@"com.apple.usernotificationsd"];
    }
  }
  else
  {
    char v27 = 0;
  }
  queue = sIndexQueue;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke;
  v49[3] = &unk_2645076D8;
  char v61 = v27;
  BOOL v62 = a13;
  v49[4] = self;
  id v50 = v48;
  id v51 = v18;
  id v52 = v47;
  id v59 = v20;
  int64_t v60 = a5;
  id v53 = v26;
  id v54 = v40;
  id v28 = v20;
  id v55 = v45;
  id v56 = v19;
  id v57 = v39;
  id v58 = v38;
  id v44 = v38;
  id v42 = v39;
  id v29 = v19;
  id v46 = v45;
  id v30 = v40;
  id v31 = v26;
  id v32 = v47;
  id v33 = v18;
  id v34 = v48;
  id v35 = v28;
  id v36 = _setup_block(v49, v27, 8362);
  dispatch_async(queue, v36);
}

uint64_t __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6 = (a5 - 1);
  uint64_t result = SIDeleteCSItems();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
  return result;
}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 && !a3)
  {
    _MDStoreOIDArrayGetVectorCount();
    id v4 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __149__SPConcreteCoreSpotlightIndexer_completeIndexingItemFor_delegate_didBeginThrottle_didEndThrottle_error_live_queue_slow_startTime_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 40))
  {
    id v2 = (id)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:4 jobOptions:0];
    [*(id *)(a1 + 40) indexRequestsPerformJob:v2 forBundle:*(void *)(a1 + 48) completionHandler:0];
  }
}

- (int64_t)_interestedAttributesMaskForBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilemail"]
    && (_os_feature_enabled_impl() & 1) != 0
    || [v3 isEqualToString:@"com.apple.MobileSMS"]
    && (_os_feature_enabled_impl() & 1) != 0
    || [v3 isEqualToString:@"com.apple.usernotificationsd"]
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)notifyClientForItemUpdates:(id)a3 updatedItems:(id)a4 batchMask:(int64_t)a5
{
  __int16 v63 = self;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v66 = *(void *)v68;
    uint64_t v11 = *MEMORY[0x263F023D8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        id v13 = v8;
        if (*(void *)v68 != v66) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v67 + 1) + 8 * v12);
        uint64_t v15 = objc_msgSend(v14, "attributeSet", v63);
        uint64_t v16 = objc_opt_new();
        id v17 = [v14 uniqueIdentifier];
        id v18 = (void *)[v17 copyWithZone:0];
        [v16 setUniqueIdentifier:v18];

        id v19 = [v15 uniqueIdentifier];
        id v20 = (void *)[v19 copyWithZone:0];
        uint64_t v21 = [v16 attributeSet];
        [v21 setUniqueIdentifier:v20];

        id v22 = [v15 domainIdentifier];
        uint64_t v23 = (void *)[v22 copyWithZone:0];
        uint64_t v24 = [v16 attributeSet];
        [v24 setDomainIdentifier:v23];

        if (a5)
        {
          uint64_t v28 = [v15 summarizationStatus];
          id v29 = [v16 attributeSet];
          [v29 setSummarizationStatus:v28];

          uint64_t v30 = [v15 urgencyStatus];
          id v31 = [v16 attributeSet];
          [v31 setUrgencyStatus:v30];

          id v32 = [v15 isUrgent];
          id v33 = [v16 attributeSet];
          [v33 setIsUrgent:v32];

          id v34 = [v15 summarizationContentTopLine];
          id v35 = (void *)[v34 copyWithZone:0];
          id v36 = [v16 attributeSet];
          [v36 setSummarizationContentTopLine:v35];

          id v37 = [v15 summarizationContentSynopsis];
          id v38 = (void *)[v37 copyWithZone:0];
          id v39 = [v16 attributeSet];
          [v39 setSummarizationContentSynopsis:v38];

          id v40 = [v15 summarizationContentTopic];
          uint64_t v41 = (void *)[v40 copyWithZone:0];
          id v42 = [v16 attributeSet];
          [v42 setSummarizationContentTopic:v41];

          uint64_t v43 = [v15 providerDataTypeIdentifiers];
          id v44 = (void *)[v43 copyWithZone:0];
          id v45 = [v16 attributeSet];
          [v45 setProviderDataTypeIdentifiers:v44];

          id v46 = [v15 creator];
          id v47 = (void *)[v46 copyWithZone:0];
          id v48 = [v16 attributeSet];
          [v48 setCreator:v47];

          id v49 = [v15 threadIdentifier];
          id v50 = (void *)[v49 copyWithZone:0];
          id v51 = [v16 attributeSet];
          [v51 setThreadIdentifier:v50];

          if ((a5 & 2) == 0)
          {
LABEL_8:
            if ((a5 & 4) == 0) {
              goto LABEL_10;
            }
LABEL_9:
            id v25 = [v15 mediaAnalysisComplete];
            id v26 = (void *)[v25 copyWithZone:0];
            char v27 = [v16 attributeSet];
            [v27 setMediaAnalysisComplete:v26];

            goto LABEL_10;
          }
        }
        else if ((a5 & 2) == 0)
        {
          goto LABEL_8;
        }
        id v52 = [v16 attributeSet];
        id v53 = [v15 attributeForKey:v11];
        id v54 = (void *)[v53 copyWithZone:0];
        [v52 setAttribute:v54 forKey:v11];

        if ((a5 & 4) != 0) {
          goto LABEL_9;
        }
LABEL_10:
        uint64_t v8 = v13;
        [v13 addObject:v16];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v55 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      uint64_t v10 = v55;
    }
    while (v55);
  }

  if ([v8 count])
  {
    id v56 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:17];
    [v56 setUpdatedItems:v8];
    [v56 setUpdatedItemsMask:a5];
    id v57 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
      -[SPConcreteCoreSpotlightIndexer notifyClientForItemUpdates:updatedItems:batchMask:](v8, v57);
    }

    id v58 = +[SpotlightDaemonServer sharedDaemonServer];
    id v59 = [(SPConcreteCoreSpotlightIndexer *)v63 dataclass];
    char v60 = [v58 handleJob:v56 bundleID:v64 protectionClass:v59 completionHandler:&__block_literal_global_6];

    if ((v60 & 1) == 0)
    {
      char v61 = +[SPCoreSpotlightIndexer sharedInstance];
      BOOL v62 = [v61 extensionDelegate];

      if (v62) {
        [v62 indexRequestsPerformDataJob:v56 forBundle:v64 completionHandler:&__block_literal_global_182];
      }
    }
  }
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int64_t v4 = logForCSLogCategoryDefault();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1();
  }
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int64_t v4 = logForCSLogCategoryDefault();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_1();
  }
}

- (void)setProperty:(id)a3 forKey:(id)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  if (self->_index)
  {
    SISetProperty();
    if (v5)
    {
      dispatch_group_t v9 = dispatch_group_create();
      [(SPConcreteCoreSpotlightIndexer *)self commitUpdates:v9];
    }
  }
}

- (id)getPropertyForKey:(id)a3
{
  index = self->_index;
  if (index) {
    index = (void *)SICopyProperty();
  }
  return index;
}

- (int64_t)getIntegerPropertyForKey:(id)a3
{
  id v4 = a3;
  if (self->_index)
  {
    BOOL v5 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v6 = [v5 integerValue];
    }
    else {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)issuePriorityIndexFixupOn
{
  if (sUsePriorityIndex == 1)
  {
    if ([(NSString *)self->_dataclass isEqualToString:@"Priority"])
    {
      id v2 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke;
      block[3] = &unk_2645063F8;
      id v5 = v2;
      id v3 = v2;
      dispatch_async(v3, block);
    }
  }
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke(uint64_t a1)
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  id v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Requesting update of apps for priority migration", buf, 2u);
  }

  id v4 = (void *)sDelegate;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_187;
  v10[3] = &unk_2645063F8;
  id v5 = v2;
  uint64_t v11 = v5;
  [v4 updateApplicationsWithCompletion:v10 clean:1];
  int64_t v6 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_188;
  block[3] = &unk_2645068C8;
  dispatch_group_t v9 = v13;
  id v8 = v6;
  dispatch_group_notify(v5, v8, block);

  _Block_object_dispose(v13, 8);
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_187(uint64_t a1)
{
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished update of apps for priority migration", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_188(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [(id)sPriorityBundleIds allObjects];
  id v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v2;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Issuing reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  id v4 = +[SPCoreSpotlightIndexer sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_192;
  v8[3] = &unk_2645068A0;
  id v9 = v2;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v2;
  [v4 _reindexAllItemsForBundleIDs:v6 reason:@"priority-index-turned-on" completionHandler:v8];
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_192(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  dispatch_group_t v4 = dispatch_group_create();
  id v5 = +[SPCoreSpotlightIndexer sharedInstance];
  id v6 = [v5 defaultIndexer];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_193;
  v11[3] = &unk_264506878;
  id v12 = *(id *)(a1 + 32);
  dispatch_group_t v13 = v4;
  id v14 = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v10;
  long long v15 = v10;
  id v8 = v6;
  id v9 = v4;
  [v8 whenFinishedDraining:v11];
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_193(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v4;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Deleting items from default index for priority migration for bundleIDs %@", buf, 0xCu);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v10 = [NSString stringWithFormat:@"_kMDItemBundleID='%@'", v9];
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          id v16[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_201;
          v16[3] = &unk_264506828;
          uint64_t v18 = *(void *)(a1 + 64);
          void v16[4] = v9;
          uint64_t v11 = *(void **)(a1 + 48);
          id v17 = *(id *)(a1 + 40);
          [v11 deleteItemsForQuery:v10 bundleID:v9 fromClient:@"com.apple.searchd" completionHandler:v16];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    id v12 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_203;
    block[3] = &unk_264506850;
    dispatch_group_t v13 = *(NSObject **)(a1 + 56);
    void block[4] = *(void *)(a1 + 64);
    dispatch_group_notify(v12, v13, block);
  }
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_201(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = logForCSLogCategoryDefault();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_201_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 134218242;
      uint64_t v10 = a3;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Deleted %ld items from default index for priority migration for bundleID %@", (uint8_t *)&v9, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_203(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v1 = +[SPCoreSpotlightIndexer sharedInstance];
    id v2 = [v1 defaultIndexer];
    [v2 setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:1];

    uint64_t v3 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v4 = [v3 priorityIndexer];
    [v4 setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:1];

    id v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      uint64_t v6 = "Finished priority migration ON";
      uint64_t v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    id v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      uint64_t v6 = "Couldn't complete priority migration ON; will try again on next launch";
      uint64_t v7 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }
}

- (void)issuePriorityIndexFixupOff
{
  if ((sUsePriorityIndex & 1) == 0
    && [(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08098]])
  {
    uint64_t v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Beginning priority migration off default index", buf, 2u);
    }

    uint64_t v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke;
    void v7[3] = &unk_2645068F0;
    __int16 v8 = v4;
    id v5 = v4;
    [(SPConcreteCoreSpotlightIndexer *)self whenFinishedDraining:v7];
    uint64_t v6 = dispatch_get_global_queue(21, 0);
    dispatch_group_notify(v5, v6, &__block_literal_global_207);
  }
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke(uint64_t a1)
{
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_2()
{
  v0 = dispatch_group_create();
  dispatch_group_enter(v0);
  v1 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "Requesting update of apps for priority migration", buf, 2u);
  }

  id v2 = (void *)sDelegate;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_208;
  v5[3] = &unk_2645063F8;
  uint64_t v6 = v0;
  uint64_t v3 = v0;
  [v2 updateApplicationsWithCompletion:v5 clean:0];
  uint64_t v4 = dispatch_get_global_queue(21, 0);
  dispatch_group_notify(v3, v4, &__block_literal_global_211);
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_208(uint64_t a1)
{
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished update of apps for priority migration", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_209()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v0 = [(id)sPriorityBundleIds allObjects];
  v1 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v0;
    _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_DEFAULT, "Issuing reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  id v2 = +[SPCoreSpotlightIndexer sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_215;
  v4[3] = &unk_2645063F8;
  id v5 = v0;
  id v3 = v0;
  [v2 _reindexAllItemsForBundleIDs:v3 reason:@"priority-index-turned-off" completionHandler:v4];
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_215(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Finished priority migration for bundleIDs %@", buf, 0xCu);
  }

  uint64_t v4 = +[SPCoreSpotlightIndexer sharedInstance];
  id v5 = [v4 priorityIndexPath];

  uint64_t v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "Deleting old priority index for priority migration at %@", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v11 = 0;
  char v8 = [v7 removeItemAtPath:v5 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_215_cold_1();
    }
  }
}

- (BOOL)issuePriorityIndexFixup
{
  if (sPrivate || (sUpgradedForPriorityIndex & 1) != 0)
  {
LABEL_18:
    LOBYTE(v4) = 0;
    return v4;
  }
  p_dataclass = &self->_dataclass;
  if (![(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08098]])
  {
    BOOL v4 = [(NSString *)*p_dataclass isEqualToString:@"Priority"];
    if (!v4) {
      return v4;
    }
  }
  uint64_t v5 = [(SPConcreteCoreSpotlightIndexer *)self getIntegerPropertyForKey:@"kSPPriorityIndexVersion"];
  int v6 = sUsePriorityIndex;
  if (((sUsePriorityIndex ^ (v5 > 4)) & 1) == 0)
  {
    if (v5 < 5) {
      id v9 = &unk_26D0C8F50;
    }
    else {
      id v9 = &unk_26D0C8F38;
    }
    [(SPConcreteCoreSpotlightIndexer *)self setProperty:v9 forKey:@"kSPPriorityIndexVersion" sync:1];
    goto LABEL_18;
  }
  uint64_t v7 = logForCSLogCategoryDefault();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixup]();
    }

    [(SPConcreteCoreSpotlightIndexer *)self issuePriorityIndexFixupOn];
  }
  else
  {
    if (v8) {
      -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixup]();
    }

    [(SPConcreteCoreSpotlightIndexer *)self issuePriorityIndexFixupOff];
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (void)issuePhotosReindexIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (([(id)sDelegate privateIndex] & 1) == 0)
    {
      if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08098]])
      {
        uint64_t v5 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:@"PHOTOS_INDEX_VERSION_CHANGE"];
        uint64_t v6 = [v5 integerValue];

        if (v6 < 1 || v3)
        {
          uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:2 jobOptions:4];
          v21[0] = @"com.apple.mobileslideshow";
          BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
          [v7 setBundleIDs:v8];

          dataclass = self->_dataclass;
          id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&dataclass count:1];
          [v7 setProtectionClasses:v9];

          if (v3)
          {
            [v7 setReason:@"Photos re-index forced"];
          }
          else
          {
            uint64_t v10 = NSString;
            id v11 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:@"PHOTOS_INDEX_VERSION_CHANGE"];
            uint64_t v12 = [v10 stringWithFormat:@"Photos index version changed: %@ -> %lu", v11, 1];
            [v7 setReason:v12];
          }
          uint64_t v13 = [SPCoreSpotlightIndexerTask alloc];
          long long v19 = self;
          uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
          long long v15 = [(SPCoreSpotlightIndexerTask *)v13 initWithIndexJob:v7 indexers:v14];

          uint64_t v16 = [v7 bundleIDs];
          [(SPCoreSpotlightIndexerTask *)v15 setBundleIDs:v16];

          id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v15, "setDataMigrationStage:", [WeakRetained dataMigrationStage]);

          [(SPCoreSpotlightIndexerTask *)v15 setShouldResumeOnFailure:0];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __61__SPConcreteCoreSpotlightIndexer_issuePhotosReindexIfNeeded___block_invoke;
          v18[3] = &unk_2645063F8;
          v18[4] = self;
          [(SPConcreteCoreSpotlightIndexer *)self performIndexerTask:v15 completionHandler:v18];
        }
      }
    }
  }
}

uint64_t __61__SPConcreteCoreSpotlightIndexer_issuePhotosReindexIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProperty:&unk_26D0C8F68 forKey:@"PHOTOS_INDEX_VERSION_CHANGE" sync:0];
}

- (void)reindexAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 indexAttrName:(id)a5 withVersion:(unint64_t)a6 perItemCompletionAttribute:(id)a7 force:(BOOL)a8 postFilter:(id)a9
{
  id v34[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  long long v20 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v20)
  {
    if (self->_readOnly)
    {
      long long v21 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:]();
      }
      goto LABEL_9;
    }
    long long v22 = v20;
    if (![(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"reindexAttributes"]&& (a8 || [(SPConcreteCoreSpotlightIndexer *)self getIntegerPropertyForKey:v17] < a6))
    {
      v34[0] = @"_kMDItemBundleID";
      v34[1] = @"_kMDItemExternalID";
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      uint64_t v24 = [v23 arrayByAddingObjectsFromArray:v15];

      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      v33[3] = 0;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke;
      v26[3] = &unk_264506A00;
      v26[4] = self;
      id v31 = v22;
      long long v21 = v24;
      char v27 = v21;
      uint64_t v30 = v33;
      id v28 = v18;
      unint64_t v32 = a6;
      id v29 = v17;
      uint64_t v25 = (void *)MEMORY[0x223C48320](v26);
      [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v22 query:v16 fetchAttributes:v21 forBundleIds:0 maxCount:0 resultsHandler:v25 resultQueue:0 postFilter:v19];

      _Block_object_dispose(v33, 8);
LABEL_9:
    }
  }
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a2;
  if (a3 == 1)
  {
    uint64_t v21 = [*(id *)(a1 + 32) index];
    if (v21 == *(void *)(a1 + 72))
    {
      uint64_t v22 = v21;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_243;
      v27[3] = &unk_2645069D8;
      uint64_t v23 = *(void *)(a1 + 80);
      void v27[4] = *(void *)(a1 + 32);
      uint64_t v30 = v23;
      id v24 = *(id *)(a1 + 56);
      uint64_t v25 = *(void *)(a1 + 64);
      uint64_t v26 = *(void *)(a1 + 72);
      id v28 = v24;
      uint64_t v29 = v25;
      uint64_t v31 = v26;
      SIBackgroundOpBlock(v22, 0, v27);
    }
  }
  else if (!a3 && [*(id *)(a1 + 32) index] == *(void *)(a1 + 72))
  {
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x3032000000;
    id v53 = __Block_byref_object_copy_;
    id v54 = __Block_byref_object_dispose_;
    id v55 = 0;
    id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v44 = 0;
    id v45 = &v44;
    uint64_t v46 = 0x3032000000;
    id v47 = __Block_byref_object_copy_;
    id v48 = __Block_byref_object_dispose_;
    id v49 = 0;
    uint64_t v10 = [*(id *)(a1 + 40) count];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_238;
    v37[3] = &unk_264506940;
    id v40 = &v44;
    uint64_t v41 = &v50;
    long long v42 = *(_OWORD *)(a1 + 64);
    uint64_t v43 = v10;
    id v38 = *(id *)(a1 + 40);
    id v39 = *(id *)(a1 + 48);
    [a6 enumerateQueryResults:v10 stringCache:0 usingBlock:v37];
    if ([(id)v51[5] count])
    {
      id v11 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v9 resultsQueue];
        *(_DWORD *)buf = 134217984;
        id v57 = v12;
        _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_INFO, "Pause queue:%p", buf, 0xCu);
      }
      uint64_t v13 = [v9 resultsQueue];
      [v13 pauseResults];

      id v14 = (id)v51[5];
      id v15 = (id)v45[5];
      uint64_t v16 = *(void *)(a1 + 72);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_242;
      v32[3] = &unk_264506968;
      id v17 = v9;
      uint64_t v18 = *(void *)(a1 + 64);
      id v33 = v17;
      uint64_t v36 = v18;
      id v19 = v14;
      id v34 = v19;
      id v20 = v15;
      id v35 = v20;
      SIBackgroundOpBlock(v16, 0, v32);
    }
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(&v50, 8);
  }
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_238(uint64_t a1, void *a2)
{
  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqual:*a2]
    || (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0x201)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      && [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      id v4 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2;
      v26[3] = &unk_264506918;
      uint64_t v6 = *(void *)(a1 + 64);
      uint64_t v7 = *(void *)(a1 + 72);
      id v28 = v5;
      uint64_t v29 = v6;
      id v27 = v4;
      id v8 = v5;
      id v9 = v4;
      SIBackgroundOpBlock(v7, 0, v26);
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [(id)*a2 mutableCopy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v17 = *(void *)(a1 + 80);
  if (v17 >= 3)
  {
    uint64_t v18 = *MEMORY[0x263EFFD08];
    for (unint64_t i = 2; i < v17; ++i)
    {
      uint64_t v20 = a2[i];
      if (v20) {
        BOOL v21 = v20 == v18;
      }
      else {
        BOOL v21 = 1;
      }
      if (!v21)
      {
        uint64_t v22 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
        [v16 setObject:v20 forKey:v22];

        unint64_t v17 = *(void *)(a1 + 80);
      }
    }
  }
  if ([v16 count])
  {
    uint64_t v23 = (void *)a2[1];
    if (v23)
    {
      id v24 = (void *)[v23 mutableCopy];
      uint64_t v25 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
      [v16 setObject:v24 forKey:v25];

      if (*(void *)(a1 + 40)) {
        objc_msgSend(v16, "setObject:forKey:", MEMORY[0x263EFFA88]);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v16];
    }
  }
}

uint64_t __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24) += [*(id *)(result + 32) count];
    return SISetCSAttributes();
  }
  return result;
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_242(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 32) resultsQueue];
  if (a3)
  {
    uint64_t v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) resultsQueue];
      int v9 = 134217984;
      id v10 = v7;
      _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "Resume cancel queue:%p", (uint8_t *)&v9, 0xCu);
    }
    [v5 resumeResults];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [*(id *)(a1 + 40) count];
    id v8 = v5;
    if (!SISetCSAttributes()) {
      unpauseIfSystemInGoodStateCallback(v8);
    }
  }
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_243(void *a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    v9[9] = v3;
    v9[10] = v4;
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = [NSNumber numberWithUnsignedLong:a1[7]];
    [v6 setProperty:v7 forKey:a1[5] sync:1];

    if (*(void *)(*(void *)(a1[6] + 8) + 24))
    {
      uint64_t v8 = a1[8];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2_244;
      v9[3] = &unk_2645069B0;
      v9[4] = a1[4];
      SISynchedOpWithBlock(v8, 2, v9);
    }
  }
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2_244(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    v7[7] = v3;
    v7[8] = v4;
    id v5 = sIndexQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_3;
    void v7[3] = &unk_2645063F8;
    void v7[4] = *(void *)(a1 + 32);
    uint64_t v6 = _setup_block(v7, 0, 1384);
    dispatch_async(v5, v6);
  }
}

uint64_t __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) mergeWithCompletionHandler:&__block_literal_global_247];
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = logForCSLogCategoryDefault();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "Post fixup merged finished", v5, 2u);
  }
}

- (void)updateEmailLocalParts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x263F02038];
  uint64_t v6 = *MEMORY[0x263F01DE8];
  uint64_t v7 = *MEMORY[0x263F02710];
  uint64_t v8 = *MEMORY[0x263F01D20];
  uint64_t v9 = *MEMORY[0x263F023A8];
  uint64_t v11 = [NSString stringWithFormat:@"(%@ = \"*\"  && %@ != \"*\"", *MEMORY[0x263F02038], *MEMORY[0x263F02040], *MEMORY[0x263F01DE8], *MEMORY[0x263F01DF0], *MEMORY[0x263F02710], *MEMORY[0x263F02718], *MEMORY[0x263F01D20], *MEMORY[0x263F01D28], *MEMORY[0x263F023A8], *MEMORY[0x263F023B0]];
  id v10 = [NSString stringWithFormat:@"%@ = \"@\"w || %@ = \"@\"w ||%@ = \"@\"w ||%@ = \"@\"w ||%@ = \"@\"w"], v5, v6, v7, v8, v9);
  [(SPConcreteCoreSpotlightIndexer *)self reindexAttributes:&unk_26D0C8C68 ofItemsMatchingQuery:v11 indexAttrName:@"kSPEmailLocalParts" withVersion:7 perItemCompletionAttribute:0 force:v3 postFilter:v10];
}

- (void)updateEmailContentURLAttr:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"(%@ = \"*\"  && %@!=\"*\", *MEMORY[0x263F01FA8], *MEMORY[0x263F02388], *MEMORY[0x263F01E20], @"com.apple.mobilemail""];
  [(SPConcreteCoreSpotlightIndexer *)self reindexAttributes:&unk_26D0C8C80 ofItemsMatchingQuery:v5 indexAttrName:@"kSPEmailContentURLAttr" withVersion:2 perItemCompletionAttribute:0 force:v3 postFilter:0];
}

- (void)updateRankingDates:(BOOL)a3
{
  [(SPConcreteCoreSpotlightIndexer *)self reindexAttributes:&unk_26D0C8C98 ofItemsMatchingQuery:@"(kMDItemContentCreationDate==* && kMDItemContentCreationDate_Ranking!=*) || (kMDItemLastUsedDate == * && kMDItemLastUsedDate_Ranking != *)|| (kMDItemStartDate==* && kMDItemStartDate_Ranking != *) || (kMDItemCompletionDate=* && kMDItemCompletionDate_Ranking!=*) || (kMDItemDueDate=* && kMDItemDueDate_Ranking!=*) || (com_apple_mail_dateReceived==* && kMDItemMailDateReceived_Ranking!=*) || (kMDItemContentCreationDate==*  || kMDItemLastUsedDate == * || kMDItemStartDate==* || kMDItemCompletionDate=* || kMDItemDueDate=* || com_apple_mail_dateReceived==* || _kMDItemRelatedActivityLastLaunchDate=*) && _kMDItemRankingDateFixed!=1" indexAttrName:@"kSPCoalescedRanking" withVersion:10 perItemCompletionAttribute:@"_kMDItemRankingDateFixed" force:a3 postFilter:0];
}

- (void)updateContainersAndScores:(BOOL)a3
{
  BOOL v3 = a3;
  v7[5] = *MEMORY[0x263EF8340];
  v7[0] = @"_kMDItemBundleID";
  v7[1] = @"_kMDItemExternalID";
  uint64_t v5 = *MEMORY[0x263F02020];
  v7[2] = *MEMORY[0x263F01F58];
  void v7[3] = v5;
  void v7[4] = @"kMDItemEmailConversationID";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  [(SPConcreteCoreSpotlightIndexer *)self reindexAttributes:v6 ofItemsMatchingQuery:@"(kMDItemContainerIdentifier=* || kMDItemEmailConversationID=* || (_kMDItemDomainIdentifier = * && _kMDItemBundleID = \"com.apple.MobileSMS\")) && _kMDItemContainerIdFixed!=1" indexAttrName:@"kSPHashedContainers" withVersion:3 perItemCompletionAttribute:@"_kMDItemContainerIdFixed" force:v3 postFilter:0];
}

- (void)updateNotes:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F02368];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  uint64_t v6 = [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\", @"com.apple.mobilenotes""];
  [(SPConcreteCoreSpotlightIndexer *)self reindexAttributes:v5 ofItemsMatchingQuery:v6 indexAttrName:@"kSPNotes" withVersion:1 perItemCompletionAttribute:0 force:v3 postFilter:0];
}

- (void)dumpAllRankingDiagnosticInformationForQuery:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [MEMORY[0x263EFF980] array];
    [v10 addObject:@"_kMDItemSDBInfo"];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    int v26 = -1;
    uint64_t v11 = NSHomeDirectory();
    uint64_t v12 = [v11 stringByAppendingString:@"/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking/Spotlight_Ranking_Diagnostic_Dump_AllResults.log"];

    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __100__SPConcreteCoreSpotlightIndexer_dumpAllRankingDiagnosticInformationForQuery_withCompletionHandler___block_invoke;
    id v19 = &unk_264506A28;
    uint64_t v20 = self;
    uint64_t v23 = v25;
    id v24 = v9;
    id v13 = v12;
    id v21 = v13;
    id v22 = v7;
    uint64_t v14 = (void *)MEMORY[0x223C48320](&v16);
    id v15 = [NSString stringWithFormat:@"**=\"%@*\"cdwt", v6, v16, v17, v18, v19, v20];
    [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v9 query:v15 fetchAttributes:v10 resultsHandler:v14];

    _Block_object_dispose(v25, 8);
  }
}

void __100__SPConcreteCoreSpotlightIndexer_dumpAllRankingDiagnosticInformationForQuery_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __buf[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3 == 1)
  {
    int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v9 != -1)
    {
      close(v9);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -1;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (!a3 && [*(id *)(a1 + 32) index] == *(void *)(a1 + 64))
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != -1
      || (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = open((const char *)[*(id *)(a1 + 40) UTF8String], 1537, 438), *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != -1))
    {
      unsigned int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      ByteVector = (const void *)_MDPlistBytesGetByteVector();
      write(v7, ByteVector, ByteVectorCount);
      if ((ByteVectorCount & 7) != 0)
      {
        __buf[0] = 0;
        write(*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), __buf, ByteVectorCount);
      }
    }
  }
}

- (void)performQueryForCountOfItemsInCategory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  index = self->_index;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke;
  v11[3] = &unk_264506A78;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  SIBackgroundOpBlock((uint64_t)index, 9, v11);
}

void __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = a2;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke_2;
    v11[3] = &unk_264506A50;
    uint64_t v5 = *(void *)(a1 + 32);
    id v13 = v15;
    uint64_t v14 = a2;
    void v11[4] = v5;
    id v12 = *(id *)(a1 + 48);
    id v6 = (void *)MEMORY[0x223C48320](v11);
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [NSString stringWithFormat:@"#%@=%@", *MEMORY[0x263F01E20], *(void *)(a1 + 40)];
    LOBYTE(v4) = [v7 _startInternalQueryWithIndex:v4 query:v8 fetchAttributes:MEMORY[0x263EFFA68] resultsHandler:v6];

    if ((v4 & 1) == 0)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(v15, 8);
  }
}

void __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (a3 == 1)
  {
    id v10 = v7;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = v10;
  }
  else if (a3 == 5)
  {
    id v9 = v7;
    BOOL v8 = [*(id *)(a1 + 32) index] == *(void *)(a1 + 56);
    id v7 = v9;
    if (v8) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a4;
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    BOOL v3 = [v2 valueForKey:@"bulk_budget_threshold"];

    if (v3) {
      bulk_budget_threshold = [v3 intValue];
    }

    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v5 = [v4 valueForKey:@"budget_check_threshold"];

    if (v5) {
      budget_check_threshold = [v5 intValue];
    }

    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v7 = [v6 valueForKey:@"budget_check_threshold_delay"];

    if (v7) {
      budget_check_threshold_delay = [v7 intValue];
    }

    BOOL v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v9 = [v8 valueForKey:@"decay_time"];

    if (v9)
    {
      [v9 floatValue];
      *(double *)&decay_time = v10;
    }

    uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v12 = [v11 valueForKey:@"decay_denominator"];

    if (v12)
    {
      [v12 floatValue];
      *(double *)&decay_denominator = v13;
    }

    uint64_t v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v15 = [v14 valueForKey:@"live_delay_scaler"];

    if (v15)
    {
      [v15 floatValue];
      live_delay_scaler = v16;
    }

    uint64_t v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v18 = [v17 valueForKey:@"live_delay_scaled_max"];

    if (v18)
    {
      [v18 floatValue];
      live_delay_scaled_max = v19;
    }

    uint64_t v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v21 = [v20 valueForKey:@"live_delay"];

    if (v21)
    {
      [v21 floatValue];
      live_delay = v22;
    }

    uint64_t v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v24 = [v23 valueForKey:@"bulk_delay_scaler"];

    if (v24)
    {
      [v24 floatValue];
      bulk_delay_scaler = v25;
    }

    int v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v27 = [v26 valueForKey:@"bulk_delay_scaled_max"];

    if (v27)
    {
      [v27 floatValue];
      bulk_delay_scaled_max = v28;
    }

    uint64_t v29 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v30 = [v29 valueForKey:@"bulk_delay"];

    if (v30)
    {
      [v30 floatValue];
      bulk_delay = v31;
    }

    if (sIsInternalInstall) {
      SISetLogging();
    }
    CFNotificationCenterGetDistributedCenter();
    CFRunLoopSourceRef RunLoopSource = IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)queryPowerState, 0);
    if (RunLoopSource)
    {
      id v33 = RunLoopSource;
      double Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v33, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      CFRelease(v33);
    }
    queryPowerState();
    id v35 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreSpotlight"];
    uint64_t v36 = [v35 pathForResource:@"schema" ofType:@"mdplist"];
    id v37 = v36;
    if (v36)
    {
      int v38 = open((const char *)[v36 UTF8String], 0);
      if (v38 != -1)
      {
        int v39 = v38;
        memset(&v44, 0, sizeof(v44));
        if (!fstat(v38, &v44))
        {
          long long v42 = mmap(0, v44.st_size, 1, 1, v39, 0);
          if (v42 != (void *)-1)
          {
            uint64_t v43 = v42;
            gDefaultSchemaPlistBytes = _MDPlistContainerCreateWithBytes();
            if (!gDefaultSchemaPlistBytes) {
              munmap(v43, v44.st_size);
            }
          }
        }
        close(v39);
      }
    }
    if (gDefaultSchemaPlistBytes)
    {
      id v40 = v37;
    }
    else
    {
      id v40 = [v35 pathForResource:@"schema" ofType:@"plist"];

      if (v40)
      {
        uint64_t v41 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v40];
        if (v41) {
          gDefaultSchemaPlistBytes = _MDPlistContainerCreateWithObject();
        }
      }
      if (!gDefaultSchemaPlistBytes) {
        goto LABEL_40;
      }
    }
    _MDPlistContainerGetBytes();
    _MDPlistContainerGetLength();
    SISetDefaultSchemaData();
LABEL_40:
    _SISetCoreSpotlightRelatedItemCallback();
    _SISetCoreSpotlightCopyBundleRemapCallback();
    LOBYTE(v44.st_dev) = 0;
    CFPreferencesGetAppBooleanValue(@"SpotlightTraceDetailed", (CFStringRef)*MEMORY[0x263EFFE60], (Boolean *)&v44);
  }
}

- (SPConcreteCoreSpotlightIndexer)initWithQueue:(id)a3 protectionClass:(id)a4 cancelPtr:(int *)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SPConcreteCoreSpotlightIndexer;
  uint64_t v11 = [(SPConcreteCoreSpotlightIndexer *)&v26 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataclass, a4);
    objc_storeStrong((id *)&v12->_indexQueue, a3);
    v12->_cancelPtr = a5;
    uint64_t v13 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    checkedInClients = v12->_checkedInClients;
    v12->_checkedInClients = (NSMapTable *)v13;

    id v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    reindexAllDelegateBundleIDs = v12->_reindexAllDelegateBundleIDs;
    v12->_reindexAllDelegateBundleIDs = v15;

    v12->_hasAssertion = 0;
    v12->_assertionEndTime = 0.0;
    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    assertedBundleIds = v12->_assertedBundleIds;
    v12->_assertedBundleIds = v17;

    v12->_dirtyTimeout = 256;
    id v19 = [(SPConcreteCoreSpotlightIndexer *)v12 _indexMaintenanceActivityName];
    uint64_t v20 = (const char *)[v19 UTF8String];
    id v21 = (void *)*MEMORY[0x263EF8188];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __74__SPConcreteCoreSpotlightIndexer_initWithQueue_protectionClass_cancelPtr___block_invoke;
    handler[3] = &unk_264506570;
    id v25 = v19;
    id v22 = v19;
    xpc_activity_register(v20, v21, handler);
  }
  return v12;
}

void __74__SPConcreteCoreSpotlightIndexer_initWithQueue_protectionClass_cancelPtr___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  uint64_t v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    xpc_activity_state_t v9 = state;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Checking in XPC activity:%@, state:%lu", (uint8_t *)&v6, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 _indexPath];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "Should not have an index at this point: '%@'", v5);
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_399(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 168);
    qos_class_t v4 = qos_class_self();
    int v5 = s_last_memory_pressure_status;
    int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    LOWORD(v20) = 1024;
    *(_DWORD *)((char *)&v20 + 2) = v6;
    HIWORD(v20) = 2048;
    CFAbsoluteTime v21 = v7;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Index %@ qos: %d status: %d retry: %d inactive after %gs", buf, 0x28u);
  }

  if (CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(a1 + 32) + 184) >= (double)*(unint64_t *)(*(void *)(a1 + 32) + 208))
  {
    uint64_t v10 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy_;
    CFAbsoluteTime v21 = COERCE_DOUBLE(__Block_byref_object_dispose_);
    id v22 = 0;
    id v22 = [*(id *)(a1 + 32) _cancelIdleTimer];
    [*(id *)(a1 + 32) commitUpdates:v10];
    uint64_t v11 = dispatch_get_global_queue(9, 2uLL);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_408;
    block[3] = &unk_264506AA0;
    long long v13 = *(_OWORD *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v14 = buf;
    dispatch_group_notify(v10, v11, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_onceToken != -1) {
      dispatch_once(&PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_onceToken, &__block_literal_global_402);
    }
    __int16 v8 = PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_sDASQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_2;
    v16[3] = &unk_264506AF0;
    long long v17 = *(_OWORD *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 48);
    xpc_activity_state_t v9 = _setup_block(v16, 0, 1767);
    dispatch_async(v8, v9);
  }
}

uint64_t __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_400()
{
  PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_sDASQueue = (uint64_t)dispatch_queue_create("DASqueue", 0);
  return MEMORY[0x270F9A758]();
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F3AFE0] sharedInstance];
  char v3 = [v2 allowsDiscretionaryWorkForTask:@"com.apple.searchd.index.commit" withPriority:*MEMORY[0x263F3B050] withParameters:0];

  qos_class_t v4 = sIndexQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_3;
  v6[3] = &unk_264506AC8;
  char v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  int v5 = _setup_block(v6, 0, 1766);
  dispatch_async(v4, v5);
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(v2 + 216))
    {
      char v3 = dispatch_group_create();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x3032000000;
      long long v17 = __Block_byref_object_copy_;
      uint64_t v18 = __Block_byref_object_dispose_;
      id v19 = 0;
      id v19 = [*(id *)(a1 + 32) _cancelIdleTimer];
      [*(id *)(a1 + 32) commitUpdates:v3];
      qos_class_t v4 = dispatch_get_global_queue(9, 2uLL);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_4;
      v11[3] = &unk_264506AA0;
      long long v12 = *(_OWORD *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      p_long long buf = &buf;
      dispatch_group_notify(v3, v4, v11);

      _Block_object_dispose(&buf, 8);
    }
  }
  else if (*(void *)(v2 + 176) && *(void *)(v2 + 216))
  {
    int v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 168);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Index %@ delay commit", (uint8_t *)&buf, 0xCu);
    }

    long long v7 = *(NSObject **)(*(void *)(a1 + 32) + 176);
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x12A05F200uLL);
    uint64_t v9 = *(void *)(a1 + 32);
    unint64_t v10 = *(void *)(v9 + 208);
    if (v10 >= 0x21) {
      *(void *)(v9 + 208) = v10 >> 1;
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 168);
    int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    __int16 v12 = 2048;
    CFAbsoluteTime v13 = v5;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Index %@ retry: %d commit complete after %gs", (uint8_t *)&v8, 0x1Cu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_408(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 168);
    int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    __int16 v12 = 2048;
    CFAbsoluteTime v13 = v5;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Index %@ retry: %d commit complete after %gs", (uint8_t *)&v8, 0x1Cu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)_performXPCActivity:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = (_xpc_activity_s *)a3;
  id v7 = a4;
  xpc_activity_state_t state = xpc_activity_get_state(v6);
  xpc_activity_state_t v9 = state;
  if (state == 2 || state == 4)
  {
    __int16 v10 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2048;
      xpc_activity_state_t v22 = v9;
      _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%@, state:%lu", buf, 0x16u);
    }

    if (v9 == 2)
    {
      xpc_activity_set_state(v6, 4);
      [(SPConcreteCoreSpotlightIndexer *)self index];
      SIExecuteResumeActivityCallback();
LABEL_15:
      CFAbsoluteTime v13 = sIndexQueue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke;
      v15[3] = &unk_264506638;
      void v15[4] = self;
      uint64_t v16 = v6;
      id v17 = v7;
      xpc_activity_state_t v18 = v9;
      uint64_t v14 = _setup_block(v15, 0, 1861);
      dispatch_async(v13, v14);

      goto LABEL_16;
    }
    if (!xpc_activity_should_defer(v6) || !xpc_activity_set_state(v6, 3)) {
      goto LABEL_15;
    }
    int v11 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2048;
      xpc_activity_state_t v22 = v9;
      __int16 v12 = "Deferring XPC activity:%@, state:%ld";
      goto LABEL_9;
    }
  }
  else
  {
    int v11 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2048;
      xpc_activity_state_t v22 = v9;
      __int16 v12 = "Ignored XPC activity:%@, state:%lu";
LABEL_9:
      _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
    }
  }

LABEL_16:
}

void __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) outstandingMaintenance];
  uint64_t v3 = [v2 count];

  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    CFAbsoluteTime v5 = [v4 outstandingMaintenance];
    uint64_t v6 = [v5 objectAtIndex:0];

    id v7 = [*(id *)(a1 + 32) outstandingMaintenance];
    [v7 removeObjectAtIndex:0];

    buf[0] = 0;
    int v8 = dispatch_group_create();
    (*(void (**)(uint64_t, uint64_t, void, uint8_t *, NSObject *))(v6 + 16))(v6, [*(id *)(a1 + 32) index], *(void *)(a1 + 40), buf, v8);
    xpc_activity_state_t v9 = sIndexQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke_415;
    v14[3] = &unk_2645064D0;
    __int16 v10 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    id v16 = *(id *)(a1 + 48);
    int v11 = _setup_block(v14, 0, 1860);
    dispatch_group_notify(v8, v9, v11);
  }
  else
  {
    [v4 setOutstandingMaintenance:0];
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
    uint64_t v6 = logForCSLogCategoryIndex();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      _os_log_impl(&dword_21F1CE000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%@ as done, state:%ld", buf, 0x16u);
    }
  }
}

uint64_t __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke_415(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performXPCActivity:*(void *)(a1 + 40) name:*(void *)(a1 + 48)];
}

- (id)_indexMaintenanceActivityName
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"com.apple.searchd.indexmaintenance.%@", self->_dataclass];
  return v2;
}

- (void)scheduleMaintenance:(id)a3 description:(id)a4 forDarkWake:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    uint64_t v12 = @"NO";
    *(_DWORD *)long long buf = 138412802;
    if (v5) {
      uint64_t v12 = @"YES";
    }
    uint64_t v20 = dataclass;
    __int16 v21 = 2112;
    xpc_activity_state_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling maintenance for dataclass:%@, forDarkWake:%@, description:%@", buf, 0x20u);
  }

  uint64_t v13 = sIndexQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke;
  v16[3] = &unk_264506B68;
  void v16[4] = self;
  id v17 = v8;
  BOOL v18 = v5;
  id v14 = v8;
  id v15 = _setup_block(v16, 0, 1899);
  dispatch_async(v13, v15);
}

void __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) outstandingMaintenance];

  if (v2)
  {
    id v13 = [*(id *)(a1 + 32) outstandingMaintenance];
    uint64_t v3 = (void *)MEMORY[0x223C48320](*(void *)(a1 + 40));
    [v13 addObject:v3];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(a1 + 32) setOutstandingMaintenance:v4];

    BOOL v5 = [*(id *)(a1 + 32) outstandingMaintenance];
    uint64_t v6 = (void *)MEMORY[0x223C48320](*(void *)(a1 + 40));
    [v5 addObject:v6];

    id v7 = [*(id *)(a1 + 32) _indexMaintenanceActivityName];
    id v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Registering XPC activity:%@", buf, 0xCu);
    }

    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x263EF8180], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x263EF8270], *(unsigned char *)(a1 + 48));
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x263EF81A0], 0);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF8218]);
    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v10 = v7;
    int v11 = (const char *)[v10 UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke_425;
    handler[3] = &unk_264506B40;
    objc_copyWeak(&v16, (id *)buf);
    id v12 = v10;
    id v15 = v12;
    xpc_activity_register(v11, v9, handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke_425(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id v4 = (void *)MEMORY[0x223C480D0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _performXPCActivity:v3 name:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Set XPC activity:%@ DONE since indexer was released", (uint8_t *)&v9, 0xCu);
    }

    xpc_activity_set_state(v3, 5);
  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_437(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = WeakRetained;
  if (a3 == 1)
  {
    id v12 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_437_cold_1(a1, v10, v12);
    }
    goto LABEL_11;
  }
  if (!a3 && [WeakRetained index] == *(void *)(a1 + 48))
  {
    _MDStoreOIDArrayGetVectorCount();
    uint64_t v11 = objc_opt_new();
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    int v28 = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_2;
    uint64_t v29 = &unk_264506BB8;
    uint64_t v31 = a6;
    id v12 = v11;
    uint64_t v30 = v12;
    _MDStoreOIDArrayApplyBlock();
    if ([v12 count])
    {
      id v13 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v12 count];
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134218242;
        uint64_t v36 = v14;
        __int16 v37 = 2112;
        uint64_t v38 = v15;
        _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (journal)", buf, 0x16u);
      }

      id v16 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
      id v17 = [v10 dataclass];
      id v34 = v17;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      [v16 setProtectionClasses:v18];

      [v16 setIdentifiersToReindex:v12];
      __int16 v19 = [SPCoreSpotlightIndexerTask alloc];
      id v33 = v10;
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      __int16 v21 = [(SPCoreSpotlightIndexerTask *)v19 initWithIndexJob:v16 indexers:v20];

      uint64_t v32 = *(void *)(a1 + 32);
      xpc_activity_state_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      [(SPCoreSpotlightIndexerTask *)v21 setBundleIDs:v22];

      [(SPCoreSpotlightIndexerTask *)v21 setDataMigrationStage:*(void *)(a1 + 56)];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_439;
      void v23[3] = &unk_2645065E8;
      id v24 = v12;
      id v25 = *(id *)(a1 + 32);
      [v10 performIndexerTask:v21 completionHandler:v23];
    }
LABEL_11:
  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (a3 == 2781)
  {
    id v14 = (id)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a5 >= 2)
    {
      uint64_t v8 = a5;
      uint64_t v9 = *MEMORY[0x263EFFD08];
      for (uint64_t i = 1; i != v8; ++i)
      {
        uint64_t v11 = [v14 objectAtIndexedSubscript:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 objectAtIndexedSubscript:0];
          id v13 = (void *)v12;
          if (v12 != v9 && v12) {
            [*(id *)(a1 + 32) addObject:v12];
          }
        }
      }
    }
  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_439(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (journal)", (uint8_t *)&v5, 0x16u);
  }
}

- (void)whenFinishedDraining:(id)a3
{
  uint64_t v8 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&sDrainedLock);
  if (self->_finishedDrainingJournal)
  {
    os_unfair_lock_unlock(&sDrainedLock);
    v8[2](v8, 1);
  }
  else
  {
    blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    if (!blocksToRunWhenFinishedDraining)
    {
      int v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = self->_blocksToRunWhenFinishedDraining;
      self->_blocksToRunWhenFinishedDraining = v5;

      blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    }
    __int16 v7 = (void *)[v8 copy];
    [(NSMutableArray *)blocksToRunWhenFinishedDraining addObject:v7];

    os_unfair_lock_unlock(&sDrainedLock);
  }
}

- (void)fixupPathTimeouts
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14(&dword_21F1CE000, a3, (uint64_t)a3, "Starting pathFixup query pc: %@", (uint8_t *)a2);
}

void __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == 1)
    {
      __int16 v7 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_cold_1(v6, v7);
      }
    }
    else if (!a3 && [WeakRetained index] == *(void *)(a1 + 40))
    {
      _MDStoreOIDArrayGetVectorCount();
      _MDStoreOIDArrayApplyBlock();
    }
  }
}

uint64_t __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  __int16 v7 = logForCSLogCategoryIndex();
  int v8 = a5 - 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) dataclass];
    v11[0] = 67109378;
    v11[1] = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "SIFixupPaths count: %d pc: %@", (uint8_t *)v11, 0x12u);
  }
  return SIFixupPaths();
}

- (void)indexFinishedDrainingJournal
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(SPConcreteCoreSpotlightIndexer *)self indexFinishedDrainingJournal:0];
  uint64_t v3 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v3 && !self->_readOnly && !self->_suspended && !self->_suspending)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock(&sDrainedLock);
    [(SPConcreteCoreSpotlightIndexer *)self setFinishedDrainingJournal:1];
    int v5 = self->_blocksToRunWhenFinishedDraining;
    blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    self->_blocksToRunWhenFinishedDraining = 0;

    os_unfair_lock_unlock(&sDrainedLock);
    if (v5)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      __int16 v7 = v5;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v23;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v10++) + 16))();
          }
          while (v8 != v10);
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v8);
      }
    }
    [(id)sDelegate indexAvailableForProtectionClass:self->_dataclass newIndex:0];
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke;
    uint64_t v18 = &unk_264506C58;
    objc_copyWeak(v20, &location);
    v20[1] = v4;
    id v12 = v11;
    id v19 = v12;
    id v13 = (void *)MEMORY[0x223C48320](&v15);
    uint64_t v26 = @"_kMDItemExternalID";
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v26, 1, v15, v16, v17, v18);
    [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v4 query:@"_kMDItemBundleID=\"com.apple.searchd\"" fetchAttributes:v14 resultsHandler:v13];

    [(SPConcreteCoreSpotlightIndexer *)self fixupPathTimeouts];
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v7 = WeakRetained;
  if (a3 == 1)
  {
    if ([WeakRetained index] == *(void *)(a1 + 48)) {
      [v7 addClients:*(void *)(a1 + 32)];
    }
  }
  else if (!a3 && [WeakRetained index] == *(void *)(a1 + 48))
  {
    _MDStoreOIDArrayGetVectorCount();
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    id v8 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();

    _Block_object_dispose(v9, 8);
  }
}

void __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  __int16 v7 = (void *)_MDPlistBytesCopyPlistAtIndex();
  if (v7) {
    BOOL v8 = a5 >= 2;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = a5;
    uint64_t v10 = 1;
    id v13 = v7;
    do
    {
      id v11 = [v13 objectAtIndexedSubscript:v10];
      id v12 = [v11 objectAtIndexedSubscript:0];

      [*(id *)(a1 + 32) addObject:v12];
      __int16 v7 = v13;
      ++v10;
    }
    while (v9 != v10);
  }
}

- (void)removeExpiredItemsForBundleId:(id)a3 group:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke;
  v14[3] = &unk_264506638;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  CFAbsoluteTime v17 = Current;
  uint64_t v9 = v7;
  id v10 = v6;
  id v11 = (void *)MEMORY[0x223C48320](v14);
  id v12 = sIndexQueue;
  id v13 = _setup_block(v11, 0, 2336);
  dispatch_group_async(v9, v12, v13);
}

void __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) index];
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_2;
  id v13 = &unk_264506CA8;
  objc_copyWeak(v16, &location);
  v16[1] = v2;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v3 = (void *)MEMORY[0x223C48320](&v10);
  uint64_t v4 = [NSString stringWithFormat:@"(%@=\"%@\" && %@<=$time.absolute(%f))", @"_kMDItemBundleID", *(void *)(a1 + 40), *MEMORY[0x263F02290], *(void *)(a1 + 56), v10, v11, v12, v13];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  id v5 = *(void **)(a1 + 32);
  v19[0] = @"_kMDItemExternalID";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  }
  else
  {
    BOOL v8 = 0;
  }
  char v9 = [v5 _startInternalQueryWithIndex:v2 query:v4 fetchAttributes:v6 forBundleIds:v8 resultsHandler:v3];
  if (v7) {

  }
  if ((v9 & 1) == 0) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && [WeakRetained index] == *(void *)(a1 + 56))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_3;
    v12[3] = &unk_264506C80;
    id v11 = v10;
    id v13 = v11;
    [a6 enumerateQueryResults:1 stringCache:0 usingBlock:v12];
    if ([v11 count]) {
      [WeakRetained indexSearchableItems:0 deleteSearchableItemsWithIdentifiers:v11 clientState:0 expectedClientState:0 clientStateName:0 forBundleID:*(void *)(a1 + 32) options:0 completionHandler:&__block_literal_global_450];
    }
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_3(uint64_t result, void *a2)
{
  if (*a2) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

- (void)revokeExpiredItems:(id)a3
{
  v37[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SPConcreteCoreSpotlightIndexer *)self owner];
  id v6 = (void *)[v5 dataMigrationStage];
  uint64_t v7 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v7)
  {
    BOOL v8 = v7;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (Current - self->_lastTTLPass >= 21600.0)
    {
      self->_lastTTLPass = Current;
      dispatch_group_t v10 = dispatch_group_create();
      id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id location = 0;
      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke;
      v30[3] = &unk_264506D48;
      objc_copyWeak(v34, &location);
      v34[1] = v8;
      id v26 = v11;
      id v31 = v26;
      id v34[2] = v6;
      long long v25 = v10;
      uint64_t v32 = v25;
      id v12 = v4;
      id v33 = v12;
      id v13 = (void *)MEMORY[0x223C48320](v30);
      uint64_t v14 = *MEMORY[0x263F02968];
      id v15 = [NSString stringWithFormat:@"((%@<=$time.absolute(%f)) && (%@!=*)) || (%@<=$time.absolute(%f))", *MEMORY[0x263F02290], Current + 86400.0, *MEMORY[0x263F02968], *MEMORY[0x263F02290], *(void *)&Current];
      dispatch_group_enter(v12);
      v37[0] = @"_kMDItemBundleID";
      v37[1] = @"_kMDItemExternalID";
      v37[2] = v14;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
      LOBYTE(v10) = [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v8 query:v15 fetchAttributes:v16 resultsHandler:v13];

      if ((v10 & 1) == 0) {
        dispatch_group_leave(v12);
      }
      CFAbsoluteTime v17 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
      int v18 = [v17 isEqualToString:*MEMORY[0x263F08080]];

      if (v18)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_460;
        v27[3] = &unk_264506C58;
        objc_copyWeak(v29, &location);
        v29[1] = v8;
        id v19 = v12;
        uint64_t v28 = v19;
        uint64_t v20 = (void *)MEMORY[0x223C48320](v27);
        dispatch_group_enter(v19);
        __int16 v21 = [NSString stringWithFormat:@"%@=%@", *MEMORY[0x263F01E20], @"com.apple.spotlight.category"];

        uint64_t v22 = *MEMORY[0x263F02758];
        v36[0] = @"_kMDItemExternalID";
        v36[1] = v22;
        v36[2] = *MEMORY[0x263F02750];
        long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
        BOOL v24 = [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v8 query:v21 fetchAttributes:v23 forBundleIds:&unk_26D0C8CB0 resultsHandler:v20];

        if (!v24) {
          dispatch_group_leave(v19);
        }

        objc_destroyWeak(v29);
      }
      else
      {
        __int16 v21 = v15;
      }

      objc_destroyWeak(v34);
      objc_destroyWeak(&location);
    }
  }
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = WeakRetained;
  if (a3 == 1)
  {
    __int16 v21 = sIndexQueue;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_456;
    v24[3] = &unk_264506D20;
    uint64_t v22 = *(NSObject **)(a1 + 40);
    id v25 = *(id *)(a1 + 32);
    objc_copyWeak(&v27, (id *)(a1 + 56));
    id v26 = *(id *)(a1 + 48);
    long long v23 = _setup_block(v24, 0, 2434);
    dispatch_group_notify(v22, v21, v23);

    objc_destroyWeak(&v27);
  }
  else if (!a3 && [WeakRetained index] == *(void *)(a1 + 64))
  {
    uint64_t v45 = 0;
    v46[0] = &v45;
    v46[1] = 0x3032000000;
    v46[2] = __Block_byref_object_copy_;
    v46[3] = __Block_byref_object_dispose_;
    id v47 = 0;
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000;
    long long v42 = __Block_byref_object_copy_;
    uint64_t v43 = __Block_byref_object_dispose_;
    id v44 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2;
    v32[3] = &unk_264506CF8;
    id v12 = *(id *)(a1 + 32);
    uint64_t v36 = &v45;
    __int16 v37 = &v39;
    id v33 = v12;
    id v34 = v11;
    uint64_t v38 = *(void *)(a1 + 72);
    id v35 = *(id *)(a1 + 40);
    [a6 enumerateQueryResults:3 stringCache:0 usingBlock:v32];
    if ([(id)v40[5] count])
    {
      id v13 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_cold_1((uint64_t)v46, (uint64_t)v51, [(id)v40[5] count], v13);
      }

      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
      [v14 setIdentifiersToReindex:v40[5]];
      id v15 = [v11 dataclass];
      uint64_t v50 = v15;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
      [v14 setProtectionClasses:v16];

      CFAbsoluteTime v17 = [SPCoreSpotlightIndexerTask alloc];
      id v49 = v11;
      int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
      id v19 = [(SPCoreSpotlightIndexerTask *)v17 initWithIndexJob:v14 indexers:v18];

      uint64_t v48 = *(void *)(v46[0] + 40);
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      [(SPCoreSpotlightIndexerTask *)v19 setBundleIDs:v20];

      [(SPCoreSpotlightIndexerTask *)v19 setDataMigrationStage:*(void *)(a1 + 72)];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      void v28[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_455;
      v28[3] = &unk_264506CD0;
      uint64_t v30 = &v39;
      id v31 = &v45;
      id v29 = *(id *)(a1 + 40);
      [v11 performIndexerTask:v19 completionHandler:v28];
    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
  }
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = *(id *)a2;
  id v5 = *(id *)a2;
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 16);
    if (v6 == *MEMORY[0x263EFFD08] || v6 == 0)
    {
      id v8 = *(id *)(a2 + 8);
      if (v8)
      {
        id v9 = v8;
        if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isEqual:v5] & 1) == 0)
        {
          if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
          {
            dispatch_group_t v10 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_cold_1();
            }

            id v11 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
            id v12 = [*(id *)(a1 + 40) dataclass];
            v27[0] = v12;
            id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
            [v11 setProtectionClasses:v13];

            [v11 setIdentifiersToReindex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            uint64_t v14 = [SPCoreSpotlightIndexerTask alloc];
            uint64_t v26 = *(void *)(a1 + 40);
            id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
            id v16 = [(SPCoreSpotlightIndexerTask *)v14 initWithIndexJob:v11 indexers:v15];

            uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            CFAbsoluteTime v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
            [(SPCoreSpotlightIndexerTask *)v16 setBundleIDs:v17];

            [(SPCoreSpotlightIndexerTask *)v16 setDataMigrationStage:*(void *)(a1 + 72)];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v22[0] = MEMORY[0x263EF8330];
            v22[1] = 3221225472;
            v22[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_454;
            v22[3] = &unk_264506CD0;
            int8x16_t v24 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            int v18 = *(void **)(a1 + 40);
            id v23 = *(id *)(a1 + 48);
            [v18 performIndexerTask:v16 completionHandler:v22];
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
          id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
          uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
          __int16 v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          [*(id *)(a1 + 32) addObject:v5];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v9];
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_454(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_454_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_455(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_454_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_456(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(WeakRetained, "removeExpiredItemsForBundleId:group:", v7, *(void *)(a1 + 40), (void)v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_460(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v11 = WeakRetained;
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else if (!a3 && [WeakRetained index] == *(void *)(a1 + 48))
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy_;
    uint64_t v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v16 = 0;
    CFAbsoluteTime v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy_;
    uint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    id v21 = (id)objc_opt_new();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_3;
    v12[3] = &unk_264506D70;
    id v13 = @"com.apple.spotlight.category";
    uint64_t v14 = &v22;
    id v15 = &v16;
    [a6 enumerateQueryResults:3 stringCache:0 usingBlock:v12];
    if ([(id)v23[5] count] || objc_msgSend((id)v17[5], "count")) {
      [v11 indexSearchableItems:v23[5] deleteSearchableItemsWithIdentifiers:v17[5] clientState:0 expectedClientState:0 clientStateName:0 forBundleID:@"com.apple.spotlight.category" options:0 completionHandler:0];
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_3(uint64_t a1, id *a2)
{
  void v28[2] = *MEMORY[0x263EF8340];
  id v4 = *a2;
  id v5 = a2[1];
  id v6 = a2[2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v7 = [v6 count];
  if (v7 != [v5 count])
  {
LABEL_15:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v4];
    goto LABEL_16;
  }
  uint64_t v25 = a1;
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v5];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v6];
  id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  uint64_t v10 = [v6 count];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
    {
      id v13 = (void *)MEMORY[0x263EFF910];
      uint64_t v14 = [v6 objectAtIndexedSubscript:i];
      id v15 = [v13 dateWithTimeInterval:v14 sinceDate:86400.0];
      uint64_t v16 = [v9 earlierDate:v15];

      if (v16 != v9)
      {
        CFAbsoluteTime v17 = [v5 objectAtIndexedSubscript:i];
        [v8 removeObject:v17];

        uint64_t v18 = [v6 objectAtIndexedSubscript:i];
        [v26 removeObject:v18];
      }
    }
  }
  if (![v8 count])
  {

    a1 = v25;
    goto LABEL_15;
  }
  uint64_t v19 = [v8 count];
  if (v19 != [v5 count])
  {
    uint64_t v20 = objc_opt_new();
    [v20 setUniqueIdentifier:v4];
    [v20 setBundleID:*(void *)(v25 + 32)];
    id v21 = objc_alloc(MEMORY[0x263F02AE8]);
    uint64_t v22 = *MEMORY[0x263F02750];
    v27[0] = *MEMORY[0x263F02758];
    v27[1] = v22;
    v28[0] = v8;
    v28[1] = v26;
    id v23 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    uint64_t v24 = (void *)[v21 initWithAttributes:v23];
    [v20 setAttributeSet:v24];

    [*(id *)(*(void *)(*(void *)(v25 + 40) + 8) + 40) addObject:v20];
  }

LABEL_16:
}

- (void)requestRequiresImportWithoutSandboxExtension:(id)a3 maxCount:(unint64_t)a4 depth:(int64_t)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = a4;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a5;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "requestRequiresImportWithoutSandboxExtension maxCount:%lu, depth:%ld", buf, 0x16u);
  }

  id v9 = [(SPConcreteCoreSpotlightIndexer *)self owner];
  uint64_t v10 = (void *)[v9 dataMigrationStage];
  uint64_t v11 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v11)
  {
    dispatch_group_t v12 = dispatch_group_create();
    id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id location = 0;
    objc_initWeak(&location, self);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v33 = 0;
    v29[0] = 0;
    v29[1] = v29;
    id v29[2] = 0x2020000000;
    v29[3] = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke;
    v22[3] = &unk_264506DE8;
    objc_copyWeak(v28, &location);
    uint64_t v26 = buf;
    id v27 = v29;
    v28[1] = v11;
    void v28[2] = v10;
    uint64_t v14 = v12;
    id v23 = v14;
    id v15 = v13;
    id v24 = v15;
    void v28[3] = (id)a4;
    void v28[4] = (id)a5;
    uint64_t v16 = v21;
    uint64_t v25 = v16;
    CFAbsoluteTime v17 = (void *)MEMORY[0x223C48320](v22);
    uint64_t v18 = [NSString stringWithFormat:@"_kMDItemRequiresImport==1 && _kMDItemImportComplete!=* && (_kMDItemImportHasSandboxExtension==0 || _kMDItemImportHasSandboxExtension!=*) && kMDItemFileProviderID!=*"];
    dispatch_group_enter(v16);
    v31[0] = @"_kMDItemBundleID";
    v31[1] = @"_kMDItemExternalID";
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    BOOL v20 = [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:v11 query:v18 fetchAttributes:v19 forBundleIds:0 maxCount:a4 resultsHandler:v17];

    if (!v20) {
      dispatch_group_leave(v16);
    }

    objc_destroyWeak(v28);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v11 = WeakRetained;
  if (a3 != 1)
  {
    if (!a3 && [WeakRetained index] == *(void *)(a1 + 80))
    {
      *(void *)&long long v64 = 0;
      *((void *)&v64 + 1) = &v64;
      uint64_t v65 = 0x3032000000;
      uint64_t v66 = __Block_byref_object_copy_;
      long long v67 = __Block_byref_object_dispose_;
      id v68 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = &v51;
      uint64_t v53 = 0x3032000000;
      id v54 = __Block_byref_object_copy_;
      id v55 = __Block_byref_object_dispose_;
      id v56 = 0;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_2;
      void v44[3] = &unk_264506D98;
      long long v47 = *(_OWORD *)(a1 + 56);
      uint64_t v48 = &v64;
      id v49 = &v51;
      v44[4] = v11;
      uint64_t v50 = *(void *)(a1 + 88);
      id v45 = *(id *)(a1 + 32);
      id v46 = *(id *)(a1 + 40);
      [a6 enumerateQueryResults:2 stringCache:0 usingBlock:v44];
      if ([(id)v52[5] count])
      {
        dispatch_group_t v12 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [(id)v52[5] count];
          uint64_t v14 = *(void *)(*((void *)&v64 + 1) + 40);
          *(_DWORD *)long long buf = 134218242;
          uint64_t v61 = v13;
          __int16 v62 = 2112;
          uint64_t v63 = v14;
          _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (sandbox items)", buf, 0x16u);
        }

        id v15 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
        uint64_t v16 = [v11 dataclass];
        id v59 = v16;
        CFAbsoluteTime v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
        [v15 setProtectionClasses:v17];

        [v15 setIdentifiersToReindex:v52[5]];
        uint64_t v18 = [SPCoreSpotlightIndexerTask alloc];
        uint64_t v58 = v11;
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
        BOOL v20 = [(SPCoreSpotlightIndexerTask *)v18 initWithIndexJob:v15 indexers:v19];

        uint64_t v57 = *(void *)(*((void *)&v64 + 1) + 40);
        id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
        [(SPCoreSpotlightIndexerTask *)v20 setBundleIDs:v21];

        [(SPCoreSpotlightIndexerTask *)v20 setDataMigrationStage:*(void *)(a1 + 88)];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_473;
        v40[3] = &unk_264506CD0;
        long long v42 = &v51;
        uint64_t v43 = &v64;
        id v41 = *(id *)(a1 + 32);
        [v11 performIndexerTask:v20 completionHandler:v40];
      }
      _Block_object_dispose(&v51, 8);

      _Block_object_dispose(&v64, 8);
    }
    goto LABEL_19;
  }
  unint64_t v22 = *(void *)(a1 + 96);
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v22)
  {
    if (v23 < v22)
    {
LABEL_11:
      id v24 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        LODWORD(v64) = 134217984;
        *(void *)((char *)&v64 + 4) = v25;
        _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_DEFAULT, "Completed sandbox items query (%ld processed)", (uint8_t *)&v64, 0xCu);
      }

      uint64_t v26 = *(NSObject **)(a1 + 32);
      id v27 = sIndexQueue;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_475;
      v33[3] = &unk_2645068C8;
      uint64_t v35 = *(void *)(a1 + 64);
      id v34 = *(id *)(a1 + 48);
      uint64_t v28 = _setup_block(v33, 0, 2628);
      dispatch_group_notify(v26, v27, v28);

      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v23 < 256) {
      goto LABEL_11;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    || (unint64_t v29 = *(void *)(a1 + 104) + 1, v29 > 5 * (v22 >> 8)))
  {
    unint64_t v29 = 0;
    v22 *= 2;
  }
  uint64_t v30 = *(NSObject **)(a1 + 32);
  id v31 = sIndexQueue;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_474;
  void v36[3] = &unk_264506DC0;
  v36[4] = WeakRetained;
  id v37 = *(id *)(a1 + 48);
  unint64_t v38 = v22;
  unint64_t v39 = v29;
  uint64_t v32 = _setup_block(v36, 0, 2622);
  dispatch_group_notify(v30, v31, v32);

LABEL_19:
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v4 = *a2;
  id v5 = *a2;
  if (v5)
  {
    id v6 = a2[1];
    if (v6)
    {
      uint64_t v7 = v6;
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqual:v5] & 1) == 0)
      {
        if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
        {
          id v8 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
            uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            *(_DWORD *)long long buf = 134218242;
            uint64_t v32 = v9;
            __int16 v33 = 2112;
            uint64_t v34 = v10;
            _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (sandbox items)", buf, 0x16u);
          }

          uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:1];
          dispatch_group_t v12 = [*(id *)(a1 + 32) dataclass];
          uint64_t v30 = v12;
          uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
          [v11 setProtectionClasses:v13];

          [v11 setIdentifiersToReindex:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          uint64_t v14 = [SPCoreSpotlightIndexerTask alloc];
          uint64_t v29 = *(void *)(a1 + 32);
          id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
          uint64_t v16 = [(SPCoreSpotlightIndexerTask *)v14 initWithIndexJob:v11 indexers:v15];

          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          CFAbsoluteTime v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
          [(SPCoreSpotlightIndexerTask *)v16 setBundleIDs:v17];

          [(SPCoreSpotlightIndexerTask *)v16 setDataMigrationStage:*(void *)(a1 + 88)];
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          uint64_t v22 = MEMORY[0x263EF8330];
          uint64_t v23 = 3221225472;
          id v24 = __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_472;
          uint64_t v25 = &unk_264506CD0;
          int8x16_t v27 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
          uint64_t v18 = *(void **)(a1 + 32);
          id v26 = *(id *)(a1 + 40);
          [v18 performIndexerTask:v16 completionHandler:&v22];
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v4);
        id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
        id v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        [*(id *)(a1 + 48) addObject:v5];
      }
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "addObject:", v7, v22, v23, v24, v25);
    }
  }
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_472(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (sandbox items)", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_473(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (sandbox items)", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_474(uint64_t a1)
{
  [*(id *)(a1 + 32) requestRequiresImportWithoutSandboxExtension:*(void *)(a1 + 40) maxCount:*(void *)(a1 + 48) depth:*(void *)(a1 + 56)];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __94__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount_depth___block_invoke_475(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Done reimporting sandbox items (%ld processed)", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_expireCorruptIndexFilesWithPath:(id)a3 keepLatest:(BOOL)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringByDeletingLastPathComponent];
  uint64_t v6 = [v4 lastPathComponent];
  __int16 v7 = [v6 stringByAppendingString:@"-"];

  unint64_t v38 = (void *)v5;
  if (v5 && v7)
  {
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = objc_opt_new();
    uint64_t v36 = v8;
    uint64_t v10 = [v8 enumeratorAtPath:v5];
    uint64_t v11 = [v10 nextObject];
    if (v11)
    {
      dispatch_group_t v12 = (void *)v11;
      do
      {
        [v10 skipDescendants];
        if (![v12 rangeOfString:v7])
        {
          id v14 = [v12 substringFromIndex:v13];
          unint64_t v15 = strtoull((const char *)[v14 UTF8String], 0, 10);

          if (v15 + 1 >= 2)
          {
            uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v15];
            [v9 addObject:v16];
          }
        }
        uint64_t v17 = [v10 nextObject];

        dispatch_group_t v12 = (void *)v17;
      }
      while (v17);
    }
    if ([v9 count])
    {
      uint64_t v34 = v9;
      id v35 = v4;
      uint64_t v18 = [v9 sortedArrayUsingSelector:sel_compare_];
      id v19 = [v18 reverseObjectEnumerator];

      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = [v19 nextObject];
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v23 = 0;
        do
        {
          [v22 doubleValue];
          BOOL v26 = (Current - v24 <= 864000.0 || v24 >= Current) && v23 == 0;
          if (v26 && a4)
          {
            uint64_t v23 = 1;
          }
          else
          {
            int8x16_t v27 = (void *)[[NSString alloc] initWithFormat:@"%@%llu", v7, objc_msgSend(v22, "unsignedLongLongValue")];
            uint64_t v28 = [v38 stringByAppendingPathComponent:v27];
            id v39 = 0;
            char v29 = [v36 removeItemAtPath:v28 error:&v39];
            id v30 = v39;
            id v31 = logForCSLogCategoryIndex();
            uint64_t v32 = v31;
            if (v29)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                id v41 = v28;
                _os_log_impl(&dword_21F1CE000, v32, OS_LOG_TYPE_DEFAULT, "Expired corrupt index at path:%@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              id v41 = v28;
              __int16 v42 = 2112;
              id v43 = v30;
              _os_log_error_impl(&dword_21F1CE000, v32, OS_LOG_TYPE_ERROR, "Failed to remove path:%@, error:%@", buf, 0x16u);
            }
          }
          uint64_t v33 = [v19 nextObject];

          uint64_t v22 = (void *)v33;
        }
        while (v33);
      }

      uint64_t v9 = v34;
      id v4 = v35;
    }
  }
}

- (void)writeIndexSuccessfulOpenDate:(int64_t)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = indexOpenRecordPath();
  uint64_t v6 = NSString;
  __int16 v7 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v8 = [v6 stringWithFormat:@"pc%@_lastOpen", v7];

  pthread_rwlock_wrlock(&sIndexOpenRecordLock);
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v5];

  if (v10) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v5];
  }
  else {
  uint64_t v11 = newIndexOpensDict();
  }
  if ([&unk_26D0C8CE0 containsObject:v8])
  {
    dispatch_group_t v12 = [NSNumber numberWithLong:a3];
    [v11 setObject:v12 forKeyedSubscript:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v19 = *MEMORY[0x263F080A8];
      v20[0] = *MEMORY[0x263F08098];
      id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v13 createFileAtPath:v5 contents:0 attributes:v14];
    }
    unint64_t v15 = [NSURL fileURLWithPath:v5];
    id v18 = 0;
    [v11 writeToURL:v15 error:&v18];
    id v16 = v18;

    if (v16)
    {
      uint64_t v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexSuccessfulOpenDate:]();
      }
    }
  }
  pthread_rwlock_unlock(&sIndexOpenRecordLock);
}

- (void)writeIndexDropAnalyticsDate:(int64_t)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = indexOpenRecordPath();
  uint64_t v6 = NSString;
  __int16 v7 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v8 = [v6 stringWithFormat:@"pc%@_lastAnalytics", v7];

  pthread_rwlock_wrlock(&sIndexOpenRecordLock);
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v5];

  if (v10) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v5];
  }
  else {
  uint64_t v11 = newIndexOpensDict();
  }
  if ([&unk_26D0C8CE0 containsObject:v8])
  {
    dispatch_group_t v12 = [NSNumber numberWithLong:a3];
    [v11 setObject:v12 forKeyedSubscript:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v19 = *MEMORY[0x263F080A8];
      v20[0] = *MEMORY[0x263F08098];
      id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v13 createFileAtPath:v5 contents:0 attributes:v14];
    }
    unint64_t v15 = [NSURL fileURLWithPath:v5];
    id v18 = 0;
    [v11 writeToURL:v15 error:&v18];
    id v16 = v18;

    if (v16)
    {
      uint64_t v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexDropAnalyticsDate:]();
      }
    }
  }
  pthread_rwlock_unlock(&sIndexOpenRecordLock);
}

- (int)shouldNotLogIndexDrop:(id)a3 ignoreParentDirectoryAge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = indexOpenRecordPath();
  __int16 v7 = NSString;
  uint64_t v8 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v9 = [v7 stringWithFormat:@"pc%@_lastOpen", v8];

  int v10 = NSString;
  uint64_t v11 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  dispatch_group_t v12 = [v10 stringWithFormat:@"pc%@_lastAnalytics", v11];

  pthread_rwlock_rdlock(&sIndexOpenRecordLock);
  uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v10) = [v13 fileExistsAtPath:v6];

  if (v10)
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v6];
    unint64_t v15 = [v14 objectForKeyedSubscript:v9];
    uint64_t v16 = [v15 longValue];

    uint64_t v17 = [v14 objectForKeyedSubscript:v12];
    uint64_t v18 = [v17 longValue];

    pthread_rwlock_unlock(&sIndexOpenRecordLock);
    if (v16 <= v18)
    {
      int v22 = 2;
    }
    else
    {
      bzero(buffer, 0x400uLL);
      uint64_t v19 = [(id)sDelegate indexDirectory];
      int FileSystemRepresentation = CFStringGetFileSystemRepresentation(v19, buffer, 1024);

      if (FileSystemRepresentation && (memset(&v27, 0, sizeof(v27)), !stat(buffer, &v27)))
      {
        uint64_t v23 = [MEMORY[0x263EFF910] date];
        [v23 timeIntervalSince1970];
        uint64_t v21 = (uint64_t)v24 - v27.st_birthtimespec.tv_sec;
      }
      else
      {
        uint64_t v21 = -1;
      }
      if (v21 > 3600 || v4) {
        int v22 = 0;
      }
      else {
        int v22 = 3;
      }
    }
  }
  else
  {
    pthread_rwlock_unlock(&sIndexOpenRecordLock);
    int v22 = 1;
  }

  return v22;
}

- (void)writeIndexCreationDate:(int64_t)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = indexHeartbeatPath();
  uint64_t v6 = NSString;
  __int16 v7 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v8 = [v6 stringWithFormat:@"pc%@_age", v7];

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v5];

  if (v10) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v5];
  }
  else {
  uint64_t v11 = newHeartbeatDict();
  }
  uint64_t v12 = [v11 objectForKeyedSubscript:@"parentDirectory_age"];
  if (!v12
    || (uint64_t v13 = (void *)v12,
        [v11 objectForKeyedSubscript:@"parentDirectory_age"],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 longValue],
        v14,
        v13,
        v15 <= 0))
  {
    memset(&v27, 0, sizeof(v27));
    id v16 = [(id)sDelegate indexDirectory];
    int v17 = stat((const char *)[v16 UTF8String], &v27);

    int v18 = *__error();
    if (v17)
    {
      uint64_t v19 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:]();
      }
    }
    else
    {
      uint64_t v19 = [NSNumber numberWithLong:v27.st_birthtimespec.tv_sec];
      [v11 setObject:v19 forKeyedSubscript:@"parentDirectory_age"];
    }

    *__error() = v18;
  }
  if ([&unk_26D0C8CC8 containsObject:v8])
  {
    uint64_t v20 = [NSNumber numberWithLong:a3];
    [v11 setObject:v20 forKeyedSubscript:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v21 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v28 = *MEMORY[0x263F080A8];
      v29[0] = *MEMORY[0x263F08098];
      int v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      [v21 createFileAtPath:v5 contents:0 attributes:v22];
    }
    uint64_t v23 = [NSURL fileURLWithPath:v5];
    id v26 = 0;
    [v11 writeToURL:v23 error:&v26];
    id v24 = v26;

    if (v24)
    {
      uint64_t v25 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:]();
      }
    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);
}

- (void)writeSDBObjectCount:(int64_t)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = indexHeartbeatPath();
  uint64_t v6 = NSString;
  __int16 v7 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v8 = [v6 stringWithFormat:@"pc%@_obj_count", v7];

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v5];

  if (v10) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v5];
  }
  else {
  uint64_t v11 = newHeartbeatDict();
  }
  if ([&unk_26D0C8CC8 containsObject:v8])
  {
    uint64_t v12 = [NSNumber numberWithLong:a3];
    [v11 setObject:v12 forKeyedSubscript:v8];

    if ((v10 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v19 = *MEMORY[0x263F080A8];
      v20[0] = *MEMORY[0x263F08098];
      id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v13 createFileAtPath:v5 contents:0 attributes:v14];
    }
    uint64_t v15 = [NSURL fileURLWithPath:v5];
    id v18 = 0;
    [v11 writeToURL:v15 error:&v18];
    id v16 = v18;

    if (v16)
    {
      int v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeSDBObjectCount:]();
      }
    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);
}

- (void)incrementIndexWipeCount
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = indexHeartbeatPath();
  BOOL v4 = NSString;
  uint64_t v5 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v6 = [v4 stringWithFormat:@"pc%@_wipes", v5];

  __int16 v7 = NSString;
  uint64_t v8 = [&unk_26D0C9058 objectForKeyedSubscript:self->_dataclass];
  uint64_t v9 = [v7 stringWithFormat:@"pc%@_wipes_aggregate", v8];

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  int v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 fileExistsAtPath:v3];

  if (v11) {
    [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v3];
  }
  else {
  uint64_t v12 = newHeartbeatDict();
  }
  if ([&unk_26D0C8CC8 containsObject:v6]
    && [&unk_26D0C8CC8 containsObject:v9])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];
    if (v13)
    {
      id v14 = [v12 objectForKeyedSubscript:v6];
      uint64_t v15 = [v14 longValue] + 1;
    }
    else
    {
      uint64_t v15 = 1;
    }

    unint64_t v16 = 0x263F08000uLL;
    int v17 = [NSNumber numberWithLong:v15];
    [v12 setObject:v17 forKeyedSubscript:v6];

    id v18 = [v12 objectForKeyedSubscript:v9];
    if (v18)
    {
      uint64_t v19 = [v12 objectForKeyedSubscript:v9];
      uint64_t v20 = [v19 longValue] + 1;

      unint64_t v16 = 0x263F08000;
    }
    else
    {
      uint64_t v20 = 1;
    }

    uint64_t v21 = [*(id *)(v16 + 2584) numberWithLong:v20];
    [v12 setObject:v21 forKeyedSubscript:v9];

    if ((v11 & 1) == 0)
    {
      int v22 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v28 = *MEMORY[0x263F080A8];
      v29[0] = *MEMORY[0x263F08098];
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      [v22 createFileAtPath:v3 contents:0 attributes:v23];
    }
    id v24 = [NSURL fileURLWithPath:v3];
    id v27 = 0;
    [v12 writeToURL:v24 error:&v27];
    id v25 = v27;

    if (v25)
    {
      id v26 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:]();
      }
    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);
}

- (id)indexLossAnalyticsDictWithPreviousIndexCreationDate:(int64_t)a3 size:(int64_t)a4 openingInReadOnly:(BOOL)a5 fullyCreated:(BOOL)a6 markedPurgeable:(BOOL)a7 vectorIndexDrop:(id)a8 forAnalytics:(BOOL)a9
{
  BOOL v10 = a6;
  BOOL v90 = a5;
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v12 = a8;
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
  [v13 setObject:&unk_26D0C8F80 forKeyedSubscript:@"indexrebuildcount"];
  id v14 = NSNumber;
  v91 = self;
  uint64_t v15 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  unint64_t v16 = [v14 numberWithInt:protectionClassForAnalytics(v15)];
  [v13 setObject:v16 forKeyedSubscript:@"fileprotection"];

  int v17 = [NSNumber numberWithBool:sRootsInstalled];
  [v13 setObject:v17 forKeyedSubscript:@"rootsinstalled"];

  if (!v12)
  {
    id v18 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
    [v13 setObject:v18 forKeyedSubscript:@"vectorindexon"];

    uint64_t v19 = rebuildReasonString(v10, a7);
    [v13 setObject:v19 forKeyedSubscript:@"rebuildreason"];

    uint64_t v20 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:].cold.6(v13, v20);
    }
  }
  [v13 setObject:@"2328.7.0.3" forKeyedSubscript:@"spotlightversion"];
  uint64_t v21 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v13 setObject:v21 forKeyedSubscript:@"textsemanticsearchon"];

  int v22 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v13 setObject:v22 forKeyedSubscript:@"embeddingdonationon"];

  uint64_t v23 = [MEMORY[0x263EFF910] date];
  [v23 timeIntervalSince1970];
  uint64_t v25 = (uint64_t)v24;
  id v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)MDBootTime()];
  [v23 timeIntervalSinceDate:v26];
  uint64_t v28 = (uint64_t)v27;

  if (a9) {
    uint64_t v29 = v25 % 86400;
  }
  else {
    uint64_t v29 = v25;
  }
  id v30 = [NSNumber numberWithLong:v29];
  [v13 setObject:v30 forKeyedSubscript:@"droptime"];

  id v31 = [NSNumber numberWithLong:v28];
  [v13 setObject:v31 forKeyedSubscript:@"timesinceboot"];

  uint64_t v32 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v33 = [v32 processIdentifier];
  uint64_t v34 = [v32 processName];
  id v35 = [NSNumber numberWithInt:v33];
  [v13 setObject:v35 forKeyedSubscript:@"pid"];

  if (v34) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = @"unknown";
  }
  [v13 setObject:v36 forKeyedSubscript:@"processname"];
  bzero(&v102, 0x878uLL);
  id v37 = [(id)sDelegate indexDirectory];
  unint64_t v38 = (const char *)[v37 cStringUsingEncoding:4];

  LODWORD(v37) = statfs(v38, &v102);
  int v39 = *__error();
  if (v37)
  {
    id v40 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:].cold.5(v91);
    }

    [v13 setObject:0 forKeyedSubscript:@"filesystemtype"];
    [v13 setObject:0 forKeyedSubscript:@"filesystemsize"];
    [v13 setObject:0 forKeyedSubscript:@"filesystemfree"];
    [v13 setObject:0 forKeyedSubscript:@"readonlyfilesystem"];
    [v13 setObject:0 forKeyedSubscript:@"filesystemflags"];
    [v13 setObject:0 forKeyedSubscript:@"supportspsid"];
    [v13 setObject:0 forKeyedSubscript:@"externalvolume"];
    [v13 setObject:0 forKeyedSubscript:@"diskimage"];
  }
  else
  {
    int v87 = v39;
    v88 = v32;
    v89 = v23;
    id v41 = [NSString stringWithUTF8String:v102.f_fstypename];
    [v13 setObject:v41 forKeyedSubscript:@"filesystemtype"];

    uint64_t f_bsize = v102.f_bsize;
    uint64_t f_blocks = v102.f_blocks;
    uint64_t f_bfree = v102.f_bfree;
    id v45 = [NSString stringWithUTF8String:v102.f_mntonname];
    uint64_t v46 = f_blocks * f_bsize;
    long long v47 = [NSNumber numberWithUnsignedLongLong:v46];
    [v13 setObject:v47 forKeyedSubscript:@"filesystemsize"];

    uint64_t v48 = f_bfree * f_bsize;
    id v49 = [NSNumber numberWithUnsignedLongLong:f_bfree * f_bsize];
    [v13 setObject:v49 forKeyedSubscript:@"filesystemfree"];

    uint64_t v50 = [NSNumber numberWithBool:v102.f_flags & 1];
    [v13 setObject:v50 forKeyedSubscript:@"readonlyfilesystem"];

    uint64_t v51 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218754;
      uint64_t v95 = v46;
      __int16 v96 = 2048;
      uint64_t v97 = v48;
      __int16 v98 = 1024;
      uint32_t f_flags = v102.f_flags;
      __int16 v100 = 2080;
      uint64_t v101 = [v45 UTF8String];
      _os_log_impl(&dword_21F1CE000, v51, OS_LOG_TYPE_DEFAULT, "[IndexLoss] FS (%llu, %llu, 0x%x) mounted at path %s", buf, 0x26u);
    }

    v86 = v45;
    uint64_t v52 = [NSURL fileURLWithPath:v45];
    if (v52)
    {
      int v53 = _CFURLGetVolumePropertyFlags();
      id v54 = logForCSLogCategoryIndex();
      id v55 = v54;
      uint64_t v32 = v88;
      int v39 = v87;
      if (v53)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v56 = [(SPConcreteCoreSpotlightIndexer *)v91 dataclass];
          uint64_t v57 = [v56 UTF8String];
          *(_DWORD *)long long buf = 136315394;
          uint64_t v95 = v57;
          __int16 v96 = 2048;
          uint64_t v97 = 0;
          _os_log_impl(&dword_21F1CE000, v55, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Got volume property flags 0x%llx", buf, 0x16u);
        }
        uint64_t v58 = [NSNumber numberWithUnsignedLongLong:0];
        [v13 setObject:v58 forKeyedSubscript:@"filesystemflags"];

        id v59 = [NSNumber numberWithBool:0];
        [v13 setObject:v59 forKeyedSubscript:@"supportspsid"];

        char v60 = [NSNumber numberWithBool:0];
        [v13 setObject:v60 forKeyedSubscript:@"externalvolume"];

        uint64_t v61 = [NSNumber numberWithBool:0];
        [v13 setObject:v61 forKeyedSubscript:@"diskimage"];
      }
      else
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:].cold.4();
        }

        [v13 setObject:0 forKeyedSubscript:@"filesystemflags"];
        [v13 setObject:0 forKeyedSubscript:@"supportspsid"];
        [v13 setObject:0 forKeyedSubscript:@"externalvolume"];
        [v13 setObject:0 forKeyedSubscript:@"diskimage"];
      }
      uint64_t v23 = v89;
    }
    else
    {
      __int16 v62 = logForCSLogCategoryIndex();
      uint64_t v32 = v88;
      int v39 = v87;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:](v91, v62);
      }

      [v13 setObject:0 forKeyedSubscript:@"filesystemflags"];
      [v13 setObject:0 forKeyedSubscript:@"supportspsid"];
      [v13 setObject:0 forKeyedSubscript:@"externalvolume"];
      [v13 setObject:0 forKeyedSubscript:@"diskimage"];
      uint64_t v23 = v89;
    }
  }
  *__error() = v39;
  if (a3 < 0)
  {
    [v13 setObject:0 forKeyedSubscript:@"droppedindexage"];
  }
  else
  {
    uint64_t v63 = [NSNumber numberWithLong:v25 - a3];
    [v13 setObject:v63 forKeyedSubscript:@"droppedindexage"];
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    long long v64 = objc_msgSend(NSNumber, "numberWithLong:");
    [v13 setObject:v64 forKeyedSubscript:@"droppedindexsize"];

    if (v12) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  [v13 setObject:0 forKeyedSubscript:@"droppedindexsize"];
  if (!v12)
  {
LABEL_35:
    uint64_t v65 = [NSNumber numberWithBool:v90];
    [v13 setObject:v65 forKeyedSubscript:@"readonlyopen"];

    [v13 setObject:0 forKeyedSubscript:@"wherecorrupted"];
  }
LABEL_36:
  [v13 setObject:0 forKeyedSubscript:@"previousbuild"];
  [v13 setObject:0 forKeyedSubscript:@"buildbeforeupgrade"];
  uint64_t v66 = indexHeartbeatPath();
  pthread_rwlock_rdlock(&sIndexHeartbeatLock);
  long long v67 = [MEMORY[0x263F08850] defaultManager];
  int v68 = [v67 fileExistsAtPath:v66];

  if (v68)
  {
    uint64_t v69 = [NSDictionary dictionaryWithContentsOfFile:v66];
    [v69 objectForKeyedSubscript:@"previousbuild"];
    v71 = long long v70 = v23;
    [v13 setObject:v71 forKeyedSubscript:@"previousbuild"];

    uint64_t v72 = [v69 objectForKeyedSubscript:@"buildbeforeupgrade"];
    [v13 setObject:v72 forKeyedSubscript:@"buildbeforeupgrade"];

    uint64_t v23 = v70;
  }
  else
  {
    uint64_t v69 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:]();
    }
  }

  pthread_rwlock_unlock(&sIndexHeartbeatLock);
  if (v12)
  {
    v73 = [v12 objectForKeyedSubscript:@"vectorcount"];
    [v13 setObject:v73 forKeyedSubscript:@"vectorcount"];

    v74 = [v12 objectForKeyedSubscript:@"readonly"];
    [v13 setObject:v74 forKeyedSubscript:@"readonly"];

    v75 = [v12 objectForKeyedSubscript:@"prefix"];
    [v13 setObject:v75 forKeyedSubscript:@"prefix"];

    v76 = [v12 objectForKeyedSubscript:@"propertyname"];
    uint64_t v77 = [v76 integerValue];

    [(SPConcreteCoreSpotlightIndexer *)v91 index];
    uint64_t v78 = _SIGetFieldNameForId();
    id v79 = [NSString alloc];
    if (v78) {
      uint64_t v80 = objc_msgSend(v79, "initWithFormat:", @"%s", v78);
    }
    else {
      uint64_t v80 = objc_msgSend(v79, "initWithFormat:", @"%u", v77);
    }
    v81 = (void *)v80;
    [v13 setObject:v80 forKeyedSubscript:@"propertyname"];

    v82 = [v12 objectForKeyedSubscript:@"dropreason"];
    [v13 setObject:v82 forKeyedSubscript:@"dropreason"];

    v83 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:](v91, v13, v83);
    }
  }
  v84 = [NSDictionary dictionaryWithDictionary:v13];

  return v84;
}

- (void)writeIndexLossEventToFile:(id)a3 vector:(BOOL)a4
{
  BOOL v4 = a4;
  v45[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  __int16 v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"droptime"];

    if (v8)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"droptime"];
      uint64_t v10 = [v9 longValue];

      int v11 = objc_alloc_init(MEMORY[0x263F08790]);
      [v11 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
      id v12 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:(double)v10];
      __int16 v42 = [v11 stringFromDate:v12];

      uint64_t v13 = [MEMORY[0x263F08AB0] processInfo];
      id v41 = [v13 processName];

      uint64_t v14 = getpid();
      uint64_t v15 = NSString;
      unint64_t v16 = NSHomeDirectory();
      int v17 = [v15 stringWithFormat:@"%@/Library/Logs/CrashReporter/DiagnosticLogs/Search", v16];

      id v18 = [MEMORY[0x263F08850] defaultManager];
      char v19 = [v18 fileExistsAtPath:v17];

      if ((v19 & 1) == 0)
      {
        BOOL v20 = v4;
        uint64_t v21 = [MEMORY[0x263F08850] defaultManager];
        id v43 = 0;
        char v22 = [v21 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v43];
        id v23 = v43;

        if ((v22 & 1) == 0)
        {
          double v24 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:].cold.6();
          }
        }
        BOOL v4 = v20;
      }
      id v40 = v11;
      if (v4) {
        uint64_t v25 = @"vector_";
      }
      else {
        uint64_t v25 = &stru_26D0BD940;
      }
      id v26 = [NSString stringWithFormat:@"%@/spotlight_%@index_drop.%@.%d.%@.%@.txt", v17, v25, v41, v14, self->_dataclass, v42];
      double v27 = [MEMORY[0x263F08850] defaultManager];
      int v28 = [v27 fileExistsAtPath:v26];

      if (v28)
      {
        int v39 = v7;
        uint64_t v29 = 0;
        do
        {
          id v30 = v26;
          id v26 = [NSString stringWithFormat:@"%@/spotlight_%@index_drop.%@.%d.%@.%@.%03d.txt", v17, v25, v41, v14, self->_dataclass, v42, v29];

          id v31 = [MEMORY[0x263F08850] defaultManager];
          LODWORD(v30) = [v31 fileExistsAtPath:v26];

          if (!v30)
          {
            __int16 v7 = v39;
            goto LABEL_24;
          }
          uint64_t v29 = (v29 + 1);
        }
        while (v29 != 100);
        uint64_t v32 = logForCSLogCategoryIndex();
        __int16 v7 = v39;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:]();
        }

        uint64_t v33 = v40;
      }
      else
      {
LABEL_24:
        uint64_t v34 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v44 = *MEMORY[0x263F080A8];
        v45[0] = *MEMORY[0x263F08098];
        id v35 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
        [v34 createFileAtPath:v26 contents:0 attributes:v35];

        uint64_t v36 = [MEMORY[0x263F08850] defaultManager];
        LODWORD(v35) = [v36 fileExistsAtPath:v26];

        if (v35)
        {
          id v37 = [NSURL fileURLWithPath:v26];
          [v7 writeToURL:v37 error:0];

          unint64_t v38 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:].cold.4();
          }
          uint64_t v33 = v40;
        }
        else
        {
          unint64_t v38 = logForCSLogCategoryIndex();
          uint64_t v33 = v40;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:].cold.5();
          }
        }
      }
    }
    else
    {
      uint64_t v33 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:]();
      }
    }
  }
  else
  {
    uint64_t v33 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:vector:]();
    }
  }
}

- (id)vectorIndexDropsPath
{
  id v3 = [NSString alloc];
  BOOL v4 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@/vectorIndexDrops.plist", v4];

  return v5;
}

- (id)trialIntentionalDropUUID
{
  id v3 = [NSString alloc];
  BOOL v4 = [(id)sDelegate indexDirectory];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@/TrialResets", v4];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    id v21 = 0;
    uint64_t v9 = [v8 contentsOfDirectoryAtPath:v5 error:&v21];
    id v10 = v21;

    if (v10)
    {
      int v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer trialIntentionalDropUUID]();
      }
    }
    uint64_t v15 = 0;
    unint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    char v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__SPConcreteCoreSpotlightIndexer_trialIntentionalDropUUID__block_invoke;
    v14[3] = &unk_264506E10;
    v14[4] = self;
    void v14[5] = &v15;
    [v9 enumerateObjectsUsingBlock:v14];
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __58__SPConcreteCoreSpotlightIndexer_trialIntentionalDropUUID__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) dataclass];
  id v6 = (objc_class *)NSString;
  id v12 = v4;
  id v7 = [v6 alloc];
  uint64_t v8 = [(id)sDelegate indexDirectory];
  uint64_t v9 = (void *)[v7 initWithFormat:@"%@/TrialResets/%@/%@", v8, v12, v5];

  id v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (id)fetchItemForURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v4 = [MEMORY[0x263F054C0] defaultManager];
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    unsigned int add = atomic_fetch_add(&sFetchID, 1u);
    uint64_t v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v3 fileSystemRepresentation];
      *(_DWORD *)long long buf = 67109378;
      unsigned int v24 = add;
      __int16 v25 = 2080;
      uint64_t v26 = v9;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "[%d] fetching %s", buf, 0x12u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke;
    void v13[3] = &unk_264506E38;
    unsigned int v16 = add;
    uint64_t v15 = &v17;
    id v10 = v6;
    uint64_t v14 = v10;
    [v5 fetchItemForURL:v3 completionHandler:v13];
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = logForCSLogCategoryIndex();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = *(_DWORD *)(a1 + 48);
      id v10 = [v5 itemIdentifier];
      v13[0] = 67109378;
      v13[1] = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "[%d] fetched %@", (uint8_t *)v13, 0x12u);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v5;
    uint64_t v8 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 timeout:(unint64_t)a5
{
  BOOL v6 = a4;
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F054C0] defaultManager];
    if (v8)
    {
      int v9 = [v7 identifier];
      int v10 = [v9 isEqualToString:*MEMORY[0x263F053F0]];

      if (v10)
      {
        id v11 = [v7 domainIdentifier];

        if (v11)
        {
          id v12 = [v7 coreSpotlightIdentifier];
          v38[0] = v12;
          id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
        }
      }
      else
      {
        unsigned int add = atomic_fetch_add(fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding, 1u);
        if (a5 && add >= 7)
        {
          atomic_fetch_add(fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding, 0xFFFFFFFF);
          id v11 = 0;
          *__error() = 60;
        }
        else
        {
          __int16 v14 = dispatch_group_create();
          dispatch_group_enter(v14);
          unsigned int v15 = atomic_fetch_add(&sFetchID, 1u);
          uint64_t v16 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = "parent";
            *(_DWORD *)long long buf = 67109634;
            unsigned int v33 = v15;
            if (v6) {
              uint64_t v17 = "all parents";
            }
            __int16 v34 = 2080;
            id v35 = v17;
            __int16 v36 = 2112;
            id v37 = v7;
            _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_INFO, "[%d] fetching %s %@", buf, 0x1Cu);
          }

          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          void v21[2] = __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke;
          v21[3] = &unk_264506E60;
          unsigned int v25 = v15;
          id v22 = v7;
          unsigned int v24 = &v26;
          id v18 = v14;
          id v23 = v18;
          [v8 _fetchParentsForItemID:v22 recursively:v6 completionHandler:v21];
          id v19 = self;
          if (dispatch_group_wait(v18, a5)) {
            *__error() = 60;
          }
          id v11 = (id)v27[5];
        }
      }
    }
    else
    {
      id v11 = (id)v27[5];
    }
  }
  else
  {
    id v11 = 0;
  }
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  atomic_fetch_add(fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding, 0xFFFFFFFF);
  if (v6)
  {
    id v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke_cold_1();
    }
    goto LABEL_23;
  }
  uint64_t v8 = [v5 count];
  if (v8)
  {
    uint64_t v52 = 0;
    uint64_t v50 = v8;
    uint64_t v51 = v8 + 1;
    size_t v9 = 8 * (v8 + 1);
    int v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v10, v9);
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v47 = (uint64_t)&v47;
      uint64_t v48 = a1;
      id v49 = v5;
      char v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v56;
      uint64_t v17 = *MEMORY[0x263F053F0];
      int v53 = v10;
      do
      {
        uint64_t v18 = 0;
        uint64_t v54 = v15;
        id v19 = &v10[8 * v15];
        do
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v11);
          }
          id v20 = *(void **)(*((void *)&v55 + 1) + 8 * v18);
          id v21 = objc_msgSend(v20, "itemID", v47);
          uint64_t v22 = [v21 coreSpotlightIdentifier];
          id v23 = *(void **)&v19[8 * v18];
          *(void *)&v19[8 * v18] = v22;

          unsigned int v24 = [v20 itemID];
          unsigned int v25 = [v24 identifier];
          char v26 = [v25 isEqualToString:v17];

          v14 |= v26;
          ++v18;
        }
        while (v13 != v18);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v64 count:16];
        uint64_t v15 = v54 + v18;
        int v10 = v53;
      }
      while (v13);

      id v5 = v49;
      a1 = v48;
      if (v14) {
        goto LABEL_17;
      }
    }
    else
    {

      uint64_t v15 = 0;
      uint64_t v17 = *MEMORY[0x263F053F0];
    }
    uint64_t v34 = v15;
    id v35 = objc_alloc(MEMORY[0x263F054B8]);
    [*(id *)(a1 + 32) providerDomainID];
    v37 = __int16 v36 = v10;
    unint64_t v38 = (void *)[v35 initWithProviderDomainID:v37 itemIdentifier:v17];

    int v10 = v36;
    uint64_t v39 = [v38 coreSpotlightIdentifier];
    id v40 = *(void **)&v36[8 * v34];
    *(void *)&v36[8 * v34] = v39;

    uint64_t v15 = v34 + 1;
LABEL_17:
    uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:v15];
    uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
    id v43 = *(void **)(v42 + 40);
    *(void *)(v42 + 40) = v41;

    if (v51)
    {
      uint64_t v44 = 8 * v50;
      do
      {

        v44 -= 8;
      }
      while (v44 != -8);
    }
    id v6 = v52;
    goto LABEL_21;
  }
  id v27 = objc_alloc(MEMORY[0x263F054B8]);
  uint64_t v28 = [*(id *)(a1 + 32) providerDomainID];
  uint64_t v29 = (void *)[v27 initWithProviderDomainID:v28 itemIdentifier:*MEMORY[0x263F053F0]];

  id v30 = [v29 coreSpotlightIdentifier];
  uint64_t v63 = v30;
  uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v31;

LABEL_21:
  id v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v45 = *(_DWORD *)(a1 + 56);
    uint64_t v46 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) componentsJoinedByString:@" "];
    *(_DWORD *)long long buf = 67109378;
    int v60 = v45;
    __int16 v61 = 2112;
    __int16 v62 = v46;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "[%d] fetched parents %@", buf, 0x12u);
  }
LABEL_23:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_sendIndexDropABCEvent:(BOOL)a3 markedPurgeable:(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v8 = [v7 processName];
  size_t v9 = (void *)v8;
  int v10 = @"unknown";
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  id v11 = v10;

  id v15 = objc_alloc_init(MEMORY[0x263F7C080]);
  dataclass = self->_dataclass;
  uint64_t v13 = rebuildReasonString(v5, a4);
  char v14 = [v15 signatureWithDomain:@"SpotlightIndex" type:@"IndexCorruption" subType:dataclass subtypeContext:v13 detectedProcess:v11 triggerThresholdValues:0];

  [v15 snapshotWithSignature:v14 delay:0 events:0 payload:0 actions:&__block_literal_global_803 reply:10.0];
}

void __73__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent_markedPurgeable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7C160]];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent_markedPurgeable___block_invoke_cold_1(v2, v5);
    }
  }
}

- (void)_saveCorruptIndexWithPath:(id)a3 shouldSendABC:(BOOL)a4 fullyCreated:(BOOL)a5 markedPurgeable:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  [(SPConcreteCoreSpotlightIndexer *)self _expireCorruptIndexFilesWithPath:v10 keepLatest:0];
  if (v8) {
    [(SPConcreteCoreSpotlightIndexer *)self _sendIndexDropABCEvent:v7 markedPurgeable:v6];
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SpotlightIndexKeepCorruptFilesEnabled", (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    uint64_t v12 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
    int v13 = protectionClassForAnalytics(v12);

    char v14 = objc_msgSend(v10, "stringByAppendingFormat:", @"-%llu", (unint64_t)CFAbsoluteTimeGetCurrent());
    id v15 = [MEMORY[0x263F08850] defaultManager];
    [v15 removeItemAtPath:v14 error:0];

    uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    char v17 = [v16 moveItemAtPath:v10 toPath:v14 error:&v25];
    id v18 = v25;

    id v19 = logForCSLogCategoryIndex();
    id v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v28 = v14;
        _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEFAULT, "Moved corrupt index to path:%@", buf, 0xCu);
      }

      id v21 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __103__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated_markedPurgeable___block_invoke;
      block[3] = &unk_264506EA8;
      id v23 = v14;
      int v24 = v13;
      dispatch_async(v21, block);

      id v20 = v23;
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[SPConcreteCoreSpotlightIndexer _saveCorruptIndexWithPath:shouldSendABC:fullyCreated:markedPurgeable:]();
    }
  }
}

void __103__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated_markedPurgeable___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id v3 = opendir((const char *)[*(id *)(a1 + 32) UTF8String]);
  if (v3)
  {
    char v4 = v3;
    for (uint64_t i = readdir(v3); i; uint64_t i = readdir(v4))
    {
      d_name = i->d_name;
      if (strcmp(i->d_name, ".") && strcmp(d_name, ".."))
      {
        memset(&v40, 0, sizeof(v40));
        int v7 = dirfd(v4);
        if (fstatat(v7, d_name, &v40, 32) < 0)
        {
          id v15 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v29 = *(_DWORD *)(a1 + 40);
            id v30 = __error();
            uint64_t v31 = strerror(*v30);
            *(_DWORD *)long long buf = 67109634;
            int v42 = v29;
            __int16 v43 = 2080;
            uint64_t v44 = d_name;
            __int16 v45 = 2080;
            off_t v46 = (off_t)v31;
            _os_log_error_impl(&dword_21F1CE000, v15, OS_LOG_TYPE_ERROR, "(%d) Failed to obtain index file info:%s (%s)", buf, 0x1Cu);
          }
        }
        else if ((v40.st_mode & 0xF000) == 0x4000)
        {
          id v8 = *v2;
          size_t v9 = [NSString stringWithUTF8String:d_name];
          id v10 = [v8 stringByAppendingPathComponent:v9];

          id v11 = [MEMORY[0x263F08850] defaultManager];
          id v39 = 0;
          char v12 = [v11 removeItemAtPath:v10 error:&v39];
          id v13 = v39;

          if ((v12 & 1) == 0)
          {
            char v14 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              int v32 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)long long buf = 67109634;
              int v42 = v32;
              __int16 v43 = 2112;
              uint64_t v44 = v10;
              __int16 v45 = 2112;
              off_t v46 = (off_t)v13;
              _os_log_error_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_ERROR, "(%d) Failed to remove index directory:%@ (%@)", buf, 0x1Cu);
            }
          }
        }
        else
        {
          off_t st_size = v40.st_size;
          int v17 = dirfd(v4);
          int v18 = openat(v17, d_name, 0x8000);
          if (v18 < 0)
          {
            char v26 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              int v33 = *(_DWORD *)(a1 + 40);
              uint64_t v34 = __error();
              id v35 = strerror(*v34);
              *(_DWORD *)long long buf = 67109890;
              int v42 = v33;
              __int16 v43 = 2080;
              uint64_t v44 = d_name;
              __int16 v45 = 2048;
              off_t v46 = st_size;
              __int16 v47 = 2080;
              uint64_t v48 = v35;
              _os_log_error_impl(&dword_21F1CE000, v26, OS_LOG_TYPE_ERROR, "(%d) Failed to open index file:%s[%lld] (%s)", buf, 0x26u);
            }

            if (!strncmp(d_name, "130162031.fixed", 0xFuLL))
            {
              id v27 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                int v36 = *(_DWORD *)(a1 + 40);
                *(_DWORD *)long long buf = 67109120;
                int v42 = v36;
                _os_log_error_impl(&dword_21F1CE000, v27, OS_LOG_TYPE_ERROR, "(%d) Deleting 130162031.fixed", buf, 8u);
              }

              bzero(buf, 0x400uLL);
              snprintf((char *)buf, 0x400uLL, "%s/130162031.fixed", (const char *)[*v2 UTF8String]);
              unlink((const char *)buf);
            }
          }
          else
          {
            int v19 = v18;
            uint64_t v38 = 65541;
            int v20 = ffsctl(v18, 0xC0084A44uLL, &v38, 0);
            id v21 = logForCSLogCategoryIndex();
            uint64_t v22 = v21;
            if (v20)
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                int v23 = *(_DWORD *)(a1 + 40);
                int v24 = __error();
                id v25 = strerror(*v24);
                *(_DWORD *)long long buf = 67109890;
                int v42 = v23;
                __int16 v43 = 2080;
                uint64_t v44 = d_name;
                __int16 v45 = 2048;
                off_t v46 = st_size;
                __int16 v47 = 2080;
                uint64_t v48 = v25;
                _os_log_error_impl(&dword_21F1CE000, v22, OS_LOG_TYPE_ERROR, "(%d) Failed to mark index file purgable:%s[%lld] (%s)", buf, 0x26u);
              }
            }
            else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              int v28 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)long long buf = 67109634;
              int v42 = v28;
              __int16 v43 = 2080;
              uint64_t v44 = d_name;
              __int16 v45 = 2048;
              off_t v46 = st_size;
              _os_log_impl(&dword_21F1CE000, v22, OS_LOG_TYPE_DEFAULT, "(%d) Marked index file purgable:%s[%lld]", buf, 0x1Cu);
            }

            close(v19);
          }
        }
      }
    }
    closedir(v4);
  }
  else
  {
    id v37 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      __103__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated_markedPurgeable___block_invoke_cold_1();
    }
  }
}

- (BOOL)creationTouchFileExists
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"creationTouchFile"];
  char v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    return 0;
  }
  int v5 = open(v4, 0x8000);
  if (v5 < 0) {
    return 0;
  }
  close(v5);
  return 1;
}

- (int)creationTouchFileCreate
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"creationTouchFile"];
  char v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    return 0;
  }
  int v5 = open(v4, 512, 384);
  if ((v5 & 0x80000000) == 0)
  {
    close(v5);
    return 0;
  }
  return *__error();
}

- (void)creationTouchFileUnlink
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"creationTouchFile"];
  char v4 = (const char *)[v3 fileSystemRepresentation];

  if (v4)
  {
    unlink(v4);
  }
}

- (BOOL)unpurgeOnceTouchFileExists
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"unpurgeTouchFile"];
  char v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    return 0;
  }
  int v5 = open(v4, 0x8000);
  if (v5 < 0) {
    return 0;
  }
  close(v5);
  return 1;
}

- (int)unpurgeOnceTouchFileCreate
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"unpurgeTouchFile"];
  char v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    return 0;
  }
  int v5 = open(v4, 512, 384);
  if ((v5 & 0x80000000) == 0)
  {
    close(v5);
    return 0;
  }
  return *__error();
}

- (int)openIndexForUpgradeSynchronous:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_index) {
      return 0;
    }
    BOOL v5 = a3;
    BOOL v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)MDBootTime()];
    int v7 = [(SPConcreteCoreSpotlightIndexer *)self owner];
    int v42 = 0;
    id v8 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
    bzero(buffer, 0x400uLL);
    if (CFStringGetFileSystemRepresentation(v8, buffer, 1024))
    {
      int v9 = open(buffer, 0x8000);
      int v10 = v9;
      if ((v9 & 0x80000000) == 0)
      {
        close(v9);
        if ([(SPConcreteCoreSpotlightIndexer *)self creationTouchFileExists])
        {
          id v11 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndexForUpgradeSynchronous:](self, v11);
          }
          int v3 = -1;
LABEL_45:

          goto LABEL_46;
        }
LABEL_19:
        int v19 = (void *)[&__block_literal_global_822 copy];
        int v20 = (void *)[&__block_literal_global_825 copy];
        id v21 = (void *)[&__block_literal_global_827 copy];
        if (updatedFrom2024Seed_onceToken != -1) {
          dispatch_once(&updatedFrom2024Seed_onceToken, &__block_literal_global_3308);
        }
        if (updatedFrom2024Seed_updatedFromSeed)
        {
          uint64_t v44 = @"kIndexOptionResetForLargePostings";
          uint64_t v45 = *MEMORY[0x263EFFB40];
          uint64_t v22 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          if (v10 < 0) {
            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v22 = 0;
          if (v10 < 0) {
            goto LABEL_28;
          }
        }
        int v3 = SIOpenIndexAtPathWithCallbacks();
        if ((v3 & 0x80000000) == 0)
        {
          SISetFileProvidersCallbacks();
          goto LABEL_34;
        }
LABEL_28:
        if ([(SPConcreteCoreSpotlightIndexer *)self creationTouchFileCreate])
        {
          int v23 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndexForUpgradeSynchronous:]();
          }
        }
        int v3 = SIOpenIndexAtPathWithCallbacks();
        SISetFileProvidersCallbacks();
        if ((v3 & 0x80000000) == 0)
        {
          SISyncIndex();
          [(SPConcreteCoreSpotlightIndexer *)self creationTouchFileUnlink];
        }
LABEL_34:

        if ((v3 & 0x80000000) == 0)
        {
          id v11 = dispatch_group_create();
          self->_index = v42;
          SISetAccumulatedWorkBoundaryCrossCallback();
          protectionClassIntValue(self->_dataclass);
          _SISetProtectionClass();
          int v24 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            dataclass = self->_dataclass;
            unint64_t createCount = self->_createCount;
            buf.st_dev = 67109634;
            *(_DWORD *)&buf.st_mode = v3;
            LOWORD(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)dataclass;
            HIWORD(buf.st_uvoid (**v4)(id, void, id) = 2048;
            *(void *)&buf.st_gid = createCount;
            _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_INFO, "Index open, result:%d, dataclass:%@, , createCount:%lu", (uint8_t *)&buf, 0x1Cu);
          }

          if (v3 == 1)
          {
            uint64_t v34 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              buf.st_dev = 138412546;
              *(void *)&buf.st_mode = @"com.apple.mobilemail.reindexVersion";
              WORD2(buf.st_ino) = 2112;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)@"599";
              _os_log_impl(&dword_21F1CE000, v34, OS_LOG_TYPE_INFO, "Bootstrapping %@ %@", (uint8_t *)&buf, 0x16u);
            }

            [(SPConcreteCoreSpotlightIndexer *)self setProperty:@"599" forKey:@"com.apple.mobilemail.reindexVersion" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F98 forKey:@"kSPCoalescedRanking" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FB0 forKey:@"kSPEmailLocalParts" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FC8 forKey:@"kSPHashedContainers" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FB0 forKey:@"kSPGroups" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F80 forKey:@"kSPNotes" sync:0];
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F68 forKey:@"PHOTOS_INDEX_VERSION_CHANGE" sync:0];
            if (sUsePriorityIndex == 1
              && [(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08098]])
            {
              [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:0];
            }
            [(SPConcreteCoreSpotlightIndexer *)self setProperty:v6 forKey:@"DeviceBootTime" sync:0];
            int v29 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              buf.st_dev = 138412290;
              *(void *)&buf.st_mode = v6;
              _os_log_impl(&dword_21F1CE000, v29, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (initial creation)", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            if (v3 == 2) {
              [(SPConcreteCoreSpotlightIndexer *)self dirty:0];
            }
            id v27 = self->_dataclass;
            dispatch_group_enter(v11);
            *(void *)&buf.st_dev = 0;
            objc_initWeak((id *)&buf, self);
            index = self->_index;
            uint64_t v35 = MEMORY[0x263EF8330];
            uint64_t v36 = 3221225472;
            id v37 = __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_831;
            uint64_t v38 = &unk_264506F10;
            int v29 = v27;
            id v39 = v29;
            stat v40 = v11;
            objc_copyWeak(&v41, (id *)&buf);
            SISynchedOpWithBlock((uint64_t)index, 2, &v35);
            objc_destroyWeak(&v41);

            objc_destroyWeak((id *)&buf);
          }

          memset(&buf, 0, sizeof(buf));
          if (stat(buffer, &buf)) {
            __darwin_time_t tv_sec = -1;
          }
          else {
            __darwin_time_t tv_sec = buf.st_birthtimespec.tv_sec;
          }
          -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:](self, "writeIndexCreationDate:", tv_sec, v35, v36, v37, v38);
          uint64_t v31 = [MEMORY[0x263EFF910] date];
          [v31 timeIntervalSince1970];
          [(SPConcreteCoreSpotlightIndexer *)self writeIndexSuccessfulOpenDate:(uint64_t)v32];

          [(SPConcreteCoreSpotlightIndexer *)self writeSDBObjectCount:SIGetObjectCount()];
          dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_45;
        }
LABEL_46:

        return v3;
      }
      if (v5)
      {
        uint64_t v46 = *MEMORY[0x263F080A8];
        p_dataclass = (id *)&self->_dataclass;
        int v13 = [(NSString *)self->_dataclass isEqual:@"Priority"];
        char v14 = (NSString **)MEMORY[0x263F08098];
        if (!v13) {
          char v14 = &self->_dataclass;
        }
        __int16 v47 = *v14;
        id v15 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
        [v16 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v15 error:0];

        int v17 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = *p_dataclass;
          buf.st_dev = 138412290;
          *(void *)&buf.st_mode = v18;
          _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - creating", (uint8_t *)&buf, 0xCu);
        }

        if ([*p_dataclass isEqualToString:*MEMORY[0x263F08080]]) {
          _SIChangeProtectionClassForFilesInDirectory();
        }

        goto LABEL_19;
      }
    }
    int v3 = -1;
    goto LABEL_46;
  }
  return -1;
}

uint64_t __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  id v2 = +[SPConcreteCoreSpotlightIndexer fetchItemForURL:a2];
  int v3 = v2;
  if (v2)
  {
    char v4 = [v2 providerID];
    if (v4)
    {
      BOOL v5 = [v3 itemID];
      BOOL v6 = [v5 coreSpotlightIdentifier];

      if (v6)
      {
        v9[0] = v4;
        v9[1] = v6;
        uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  BOOL v5 = 0;
  if (a2 && a4)
  {
    int v9 = (void *)*MEMORY[0x263F05360];
    if (a3) {
      int v9 = a3;
    }
    int v10 = (objc_class *)MEMORY[0x263F054B8];
    id v11 = v9;
    id v12 = a2;
    int v13 = (void *)[[v10 alloc] initWithProviderID:v12 domainIdentifier:v11 coreSpotlightIdentifier:a4];

    BOOL v5 = +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:v13 recursively:0 timeout:a5];
  }
  id v14 = [v5 firstObject];

  return v14;
}

id __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  BOOL v5 = 0;
  if (a2 && a4)
  {
    int v9 = (void *)*MEMORY[0x263F05360];
    if (a3) {
      int v9 = a3;
    }
    int v10 = (objc_class *)MEMORY[0x263F054B8];
    id v11 = v9;
    id v12 = a2;
    int v13 = (void *)[[v10 alloc] initWithProviderID:v12 domainIdentifier:v11 coreSpotlightIdentifier:a4];

    BOOL v5 = +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:v13 recursively:1 timeout:a5];
  }
  id v14 = v5;

  return v14;
}

void __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_831(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "finish-draining-journal, for :%@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4 readOnly:(BOOL)a5
{
  uint64_t v219 = *MEMORY[0x263EF8340];
  self->_tryOpenJwlIndex = 0;
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_index) {
      return 0;
    }
    BOOL v7 = a5;
    BOOL v8 = a4;
    BOOL v9 = a3;
    if (a3)
    {
      int v10 = [(id)sDelegate privateIndex];
      id v11 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
      id v12 = v11;
      if (v10)
      {
        if ([v11 isEqualToString:*MEMORY[0x263F08098]])
        {
LABEL_14:

          goto LABEL_15;
        }
        id v14 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
        char v15 = [v14 isEqualToString:*MEMORY[0x263F08088]];

        if (v15) {
          goto LABEL_15;
        }
LABEL_12:
        id v12 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:]0(self, v12);
        }
        goto LABEL_14;
      }
      int v13 = [v11 isEqualToString:*MEMORY[0x263F08088]];

      if (v13) {
        goto LABEL_12;
      }
    }
LABEL_15:
    v156 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)MDBootTime()];
    v155 = [(SPConcreteCoreSpotlightIndexer *)self owner];
    if ([(id)sDelegate deviceFirstUnlockedInMKB])
    {
      p_dataclass = &self->_dataclass;
      uint64_t v17 = *MEMORY[0x263F08080];
      if (![(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08080]]
        && ![(NSString *)*p_dataclass isEqualToString:*MEMORY[0x263F08088]])
      {
        goto LABEL_22;
      }
      int v18 = [(id)sDelegate deviceFirstUnlockedInSB];
      if ([(id)sDelegate deviceUnlocked])
      {
        int v19 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = *p_dataclass;
          *(_DWORD *)stat buf = 138412802;
          v203 = v20;
          __int16 v204 = 1024;
          int v205 = 1;
          __int16 v206 = 1024;
          int v207 = v18;
          _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_INFO, "Lazy open of protected index for dataclass:%@ (%d:%d)", buf, 0x18u);
        }

LABEL_22:
        self->_tryOpenJwlIndex = 0;
        v180 = 0;
        string = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
        v153 = [(SPConcreteCoreSpotlightIndexer *)self trialIntentionalDropUUID];
        bzero(buf, 0x400uLL);
        if (!CFStringGetFileSystemRepresentation(string, (char *)buf, 1024))
        {
          int v5 = -1;
LABEL_199:
          if (self->_index) {
            _SIStartPreheatScheduler();
          }
          self->_hasAssertion = 0;
          self->_assertionEndTime = 0.0;
          self->_suspended = 0;
LABEL_202:

          goto LABEL_203;
        }
        uint64_t v218 = 0;
        long long v217 = 0u;
        long long v216 = 0u;
        long long v215 = 0u;
        long long v214 = 0u;
        long long v213 = 0u;
        long long v212 = 0u;
        long long v211 = 0u;
        memset(&v210[8], 0, 144);
        *(void *)v210 = 0x100000003;
        v152 = string;
        id v21 = (const char *)[(__CFString *)v152 UTF8String];
        if (fsctl(v21, 0xC1104A71uLL, v210, 0))
        {
          uint64_t v22 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.9();
          }
        }
        else
        {
          uint64_t v22 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v183 = 136315138;
            v184 = v21;
            _os_log_impl(&dword_21F1CE000, v22, OS_LOG_TYPE_DEFAULT, "successfully set dir stats %s", v183, 0xCu);
          }
        }

        int v33 = open((const char *)buf, 0x8000);
        unsigned int v34 = v33;
        if ((v33 & 0x80000000) == 0)
        {
          close(v33);
          BOOL log = [(SPConcreteCoreSpotlightIndexer *)self _hasPurgeableTouchFile];
          if (![(SPConcreteCoreSpotlightIndexer *)self creationTouchFileExists])
          {
            uint64_t v43 = 1;
            goto LABEL_69;
          }
          uint64_t v35 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.8(self, v35);
          }
LABEL_68:

          uint64_t v43 = v34 >> 31;
LABEL_69:
          id location = 0;
          objc_initWeak(&location, self);
          v176[0] = MEMORY[0x263EF8330];
          v176[1] = 3221225472;
          v176[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke;
          v176[3] = &unk_264506F60;
          objc_copyWeak(&v177, &location);
          v151 = (void *)[v176 copy];
          if (openIndex_shouldReindexAll_readOnly__onceToken != -1) {
            dispatch_once(&openIndex_shouldReindexAll_readOnly__onceToken, &__block_literal_global_843);
          }
          v175[0] = 0;
          v175[1] = v175;
          v175[2] = 0x2020000000;
          v175[3] = 0;
          v174[0] = MEMORY[0x263EF8330];
          v174[1] = 3221225472;
          v174[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4;
          v174[3] = &unk_264506FB0;
          v174[4] = self;
          v174[5] = v175;
          v149 = (void *)[v174 copy];
          v173[0] = MEMORY[0x263EF8330];
          v173[1] = 3221225472;
          v173[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_852;
          v173[3] = &unk_2645066D8;
          v173[4] = self;
          v148 = (void *)[v173 copy];
          v146 = (void *)[&__block_literal_global_856 copy];
          v147 = (void *)[&__block_literal_global_859 copy];
          v145 = (void *)[&__block_literal_global_862 copy];
          __int16 v47 = objc_opt_new();
          uint64_t v48 = v47;
          uint64_t v49 = (void *)MEMORY[0x263EFFB40];
          if (sPrivate) {
            [v47 setObject:*MEMORY[0x263EFFB40] forKey:@"kIndexOptionPrivate"];
          }
          if (v7) {
            [v48 setObject:*v49 forKey:@"kIndexOptionReadOnly"];
          }
          BOOL v50 = [(NSString *)*p_dataclass isEqualToString:@"Priority"];
          uint64_t v51 = [NSNumber numberWithUnsignedInt:v50 | (2 * protectionClassIntValue(*p_dataclass))];
          [v48 setObject:v51 forKeyedSubscript:@"kIndexOptionPriorityPC"];

          if (updatedFrom2024Seed_onceToken != -1) {
            dispatch_once(&updatedFrom2024Seed_onceToken, &__block_literal_global_3308);
          }
          if (updatedFrom2024Seed_updatedFromSeed) {
            [v48 setObject:*v49 forKey:@"kIndexOptionResetForLargePostings"];
          }
          if ((v34 & 0x80000000) != 0)
          {
            if (v43 & !v9)
            {
              uint64_t v52 = 0;
              int v5 = -1;
              goto LABEL_155;
            }
            if (!v153)
            {
              uint64_t v52 = 0;
LABEL_146:
              self->_BOOL readOnly = 0;
              int v5 = SIOpenIndexAtPathWithCallbacks();
              if ((v5 & 0x80000000) == 0)
              {
                SISetFileProvidersCallbacks();
                SISyncIndex();
                if (v153)
                {
                  uint64_t v97 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
                  int ResetTouchFileForUUID = createResetTouchFileForUUID(v153, v97);

                  if (ResetTouchFileForUUID)
                  {
                    v99 = logForCSLogCategoryIndex();
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    {
                      __int16 v100 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
                      *(_DWORD *)v210 = 138412546;
                      *(void *)&v210[4] = v100;
                      *(_WORD *)&v210[12] = 2112;
                      *(void *)&v210[14] = v153;
                      _os_log_impl(&dword_21F1CE000, v99, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%@) Created intentional drop touch file %@", v210, 0x16u);
                    }
                  }
                  else
                  {
                    int v101 = *__error();
                    statfs v102 = logForCSLogCategoryIndex();
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                    {
                      v130 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
                      *(_DWORD *)v210 = 138412802;
                      *(void *)&v210[4] = v130;
                      *(_WORD *)&v210[12] = 2112;
                      *(void *)&v210[14] = v153;
                      *(_WORD *)&v210[22] = 1024;
                      *(_DWORD *)&v210[24] = v101;
                      _os_log_error_impl(&dword_21F1CE000, v102, OS_LOG_TYPE_ERROR, "[IndexLoss] (%@) Failed to create index drop touch file %@ : %d", v210, 0x1Cu);
                    }
                    *__error() = v101;
                  }
                }
              }
              goto LABEL_155;
            }
            int v60 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              __int16 v61 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
              -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:](v61, (uint64_t)v153, (uint64_t)v183);
            }

            __int16 v62 = [MEMORY[0x263F02A98] sharedInstance];
            [v62 logWithBundleID:@"com.apple.CoreSpotlight" indexOperation:9 itemCount:1 code:8];
            uint64_t v52 = 0;
LABEL_145:

            goto LABEL_146;
          }
          self->_BOOL readOnly = v7;
          if (v43)
          {
            int v5 = SIOpenIndexAtPathWithCallbacks();
            if ((v5 & 0x80000000) == 0)
            {
              SISetFileProvidersCallbacks();
LABEL_99:
              uint64_t v52 = 0;
LABEL_155:

              _Block_object_dispose(v175, 8);
              objc_destroyWeak(&v177);
              objc_destroyWeak(&location);
              if ((v5 & 0x80000000) == 0)
              {
                self->_index = v180;
                _SISetAssertedJournalNum();
                SISetAccumulatedWorkBoundaryCrossCallback();
                protectionClassIntValue(self->_dataclass);
                _SISetProtectionClass();
                if (sUsePriorityIndex == 1) {
                  [(NSString *)*p_dataclass isEqualToString:@"Priority"];
                }
                _SISetPriority();
                if (!sPrivate)
                {
                  uint64_t v103 = +[SPCoreSpotlightIndexer sharedInstance];
                  v104 = [v103 contactsIndexer];
                  BOOL v105 = v104 == self;

                  if (v105) {
                    _SISetContactsIndex();
                  }
                }
                v106 = logForCSLogCategoryIndex();
                if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
                {
                  v107 = @"NO";
                  dataclass = self->_dataclass;
                  unint64_t createCount = self->_createCount;
                  if (v8) {
                    v107 = @"YES";
                  }
                  *(_DWORD *)v210 = 67109890;
                  *(_DWORD *)&v210[4] = v5;
                  *(_WORD *)&v210[8] = 2112;
                  *(void *)&v210[10] = dataclass;
                  *(_WORD *)&v210[18] = 2112;
                  *(void *)&v210[20] = v107;
                  *(_WORD *)&v210[28] = 2048;
                  *(void *)&v210[30] = createCount;
                  _os_log_impl(&dword_21F1CE000, v106, OS_LOG_TYPE_INFO, "Index open, result:%d, dataclass:%@, shouldReindexAll:%@, createCount:%lu", v210, 0x26u);
                }

                if (sIsInternalInstall && !gIsSystemOnBattery)
                {
                  v110 = dispatch_get_global_queue(5, 0);
                  block[0] = MEMORY[0x263EF8330];
                  block[1] = 3221225472;
                  block[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_889;
                  block[3] = &unk_2645065E8;
                  void block[4] = self;
                  v166 = v152;
                  dispatch_async(v110, block);
                }
                if (v5 == 1 || v7)
                {
                  if (!v7)
                  {
                    v112 = logForCSLogCategoryIndex();
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v210 = 138412546;
                      *(void *)&v210[4] = @"com.apple.mobilemail.reindexVersion";
                      *(_WORD *)&v210[12] = 2112;
                      *(void *)&v210[14] = @"599";
                      _os_log_impl(&dword_21F1CE000, v112, OS_LOG_TYPE_INFO, "Bootstrapping %@ %@", v210, 0x16u);
                    }

                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:@"599" forKey:@"com.apple.mobilemail.reindexVersion" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F98 forKey:@"kSPCoalescedRanking" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FF8 forKey:@"kSPEmailContentURLAttr" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FB0 forKey:@"kSPEmailLocalParts" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FC8 forKey:@"kSPHashedContainers" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8FB0 forKey:@"kSPGroups" sync:0];
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F80 forKey:@"kSPNotes" sync:0];
                    if (sUsePriorityIndex == 1
                      && [(NSString *)*p_dataclass isEqualToString:*MEMORY[0x263F08098]])
                    {
                      [(SPConcreteCoreSpotlightIndexer *)self setProperty:&unk_26D0C8F38 forKey:@"kSPPriorityIndexVersion" sync:0];
                    }
                    [(SPConcreteCoreSpotlightIndexer *)self setProperty:v156 forKey:@"DeviceBootTime" sync:1];
                    v113 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v210 = 138412290;
                      *(void *)&v210[4] = v156;
                      _os_log_impl(&dword_21F1CE000, v113, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (initial creation)", v210, 0xCu);
                    }

                    ++self->_createCount;
                    [(NSMutableSet *)self->_reindexAllDelegateBundleIDs removeAllObjects];
                    v114 = objc_opt_new();
                    [(SPConcreteCoreSpotlightIndexer *)self setKnownClients:v114];

                    if (v8)
                    {
                      v115 = @"bootstrapping new index";
                      if (v52) {
                        v115 = v52;
                      }
                      v116 = v115;
                      v182 = self;
                      v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v182 count:1];
                      [v155 reindexAllItemsWithIndexers:v117 reason:v116 completionHandler:&__block_literal_global_920];
                    }
                    os_unfair_lock_lock(&sDrainedLock);
                    [(SPConcreteCoreSpotlightIndexer *)self setFinishedDrainingJournal:1];
                    v118 = self->_blocksToRunWhenFinishedDraining;
                    blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
                    self->_blocksToRunWhenFinishedDraining = 0;

                    os_unfair_lock_unlock(&sDrainedLock);
                    if (v118)
                    {
                      long long v159 = 0u;
                      long long v160 = 0u;
                      long long v157 = 0u;
                      long long v158 = 0u;
                      v120 = v118;
                      uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v157 objects:v181 count:16];
                      if (v121)
                      {
                        uint64_t v122 = *(void *)v158;
                        do
                        {
                          for (uint64_t i = 0; i != v121; ++i)
                          {
                            if (*(void *)v158 != v122) {
                              objc_enumerationMutation(v120);
                            }
                            (*(void (**)(void))(*(void *)(*((void *)&v157 + 1) + 8 * i) + 16))();
                          }
                          uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v157 objects:v181 count:16];
                        }
                        while (v121);
                      }
                    }
                    [(id)sDelegate indexAvailableForProtectionClass:self->_dataclass newIndex:1];
                    [(SPConcreteCoreSpotlightIndexer *)self issuePriorityIndexFixup];
                  }
                }
                else
                {
                  if (v5 == 2) {
                    [(SPConcreteCoreSpotlightIndexer *)self dirty:0];
                  }
                  *(void *)v210 = 0;
                  objc_initWeak((id *)v210, self);
                  index = self->_index;
                  v161[0] = MEMORY[0x263EF8330];
                  v161[1] = 3221225472;
                  v161[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_890;
                  v161[3] = &unk_264507028;
                  objc_copyWeak(&v163, (id *)v210);
                  v161[4] = self;
                  id v162 = v156;
                  int v164 = v5;
                  SISynchedOpWithBlock((uint64_t)index, 2, v161);

                  objc_destroyWeak(&v163);
                  objc_destroyWeak((id *)v210);
                }
                memset(v210, 0, 144);
                if (stat((const char *)buf, (stat *)v210)) {
                  uint64_t v124 = -1;
                }
                else {
                  uint64_t v124 = *(void *)&v210[80];
                }
                [(SPConcreteCoreSpotlightIndexer *)self writeIndexCreationDate:v124];
                v125 = [MEMORY[0x263EFF910] date];
                [v125 timeIntervalSince1970];
                [(SPConcreteCoreSpotlightIndexer *)self writeIndexSuccessfulOpenDate:(uint64_t)v126];

                [(SPConcreteCoreSpotlightIndexer *)self writeSDBObjectCount:SIGetObjectCount()];
              }
              goto LABEL_199;
            }
            if (!v9) {
              goto LABEL_99;
            }
          }
          else
          {
            int v5 = -1;
          }
          int v53 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v128 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
            rebuildReasonString(v43, log);
            id v129 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v210 = 67109634;
            *(_DWORD *)&v210[4] = v5;
            *(_WORD *)&v210[8] = 2112;
            *(void *)&v210[10] = v128;
            *(_WORD *)&v210[18] = 2112;
            *(void *)&v210[20] = v129;
            _os_log_error_impl(&dword_21F1CE000, v53, OS_LOG_TYPE_ERROR, "Failed to open index (openIndex), result:%d, dataclass:%@, reason:%@", v210, 0x1Cu);
          }
          uint64_t v54 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
          unsigned int v136 = [v54 BOOLForKey:@"disable_index_drop_reporting"];
          v134 = v54;
          long long v55 = (void *)sDelegate;
          long long v56 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
          int v141 = [v55 disableABCReporting:v56];

          if (v153)
          {
            long long v57 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              long long v58 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
              -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:](v58, (uint64_t)v153, (uint64_t)v199);
            }

            int v59 = 6;
          }
          else
          {
            if (v43)
            {
              int v139 = [(SPConcreteCoreSpotlightIndexer *)self shouldNotLogIndexDrop:v152 ignoreParentDirectoryAge:v136];
              goto LABEL_103;
            }
            int v59 = 5;
          }
          int v139 = v59;
LABEL_103:
          memset(v210, 0, 144);
          uint64_t v63 = v152;
          int v64 = stat((const char *)[(__CFString *)v63 UTF8String], (stat *)v210);
          int v65 = *__error();
          if (v64)
          {
            uint64_t v66 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
              -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.4();
            }

            uint64_t v67 = 0;
            uint64_t v68 = 0;
          }
          else
          {
            uint64_t v67 = *(void *)&v210[80];
            uint64_t v68 = *(void *)&v210[96];
          }
          *__error() = v65;
          uint64_t v132 = v68;
          uint64_t v133 = v67;
          if (v153)
          {
            BOOL v69 = 1;
          }
          else
          {
            long long v70 = (const char *)SIGetRebuildReason();
            BOOL v69 = strncmp(v70, "Intentional: ", 0xDuLL) == 0;
          }
          if (sIsInternalInstall)
          {
            if (v139) {
              int v71 = 1;
            }
            else {
              int v71 = v69;
            }
            [(SPConcreteCoreSpotlightIndexer *)self _saveCorruptIndexWithPath:v63 shouldSendABC:(v71 | v141 | v136) ^ 1 fullyCreated:v43 markedPurgeable:log];
          }
          uint64_t v72 = [MEMORY[0x263F08850] defaultManager];
          [v72 removeItemAtPath:v63 error:0];

          uint64_t v197 = *MEMORY[0x263F080A8];
          int v73 = [(NSString *)*p_dataclass isEqual:@"Priority"];
          v74 = (NSString **)MEMORY[0x263F08098];
          if (!v73) {
            v74 = &self->_dataclass;
          }
          v198 = *v74;
          v142 = [NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
          v75 = [MEMORY[0x263F08850] defaultManager];
          id v172 = 0;
          int v76 = [v75 createDirectoryAtPath:v63 withIntermediateDirectories:1 attributes:v142 error:&v172];
          id v135 = v172;

          if (v76)
          {
            if (![(SPConcreteCoreSpotlightIndexer *)self creationTouchFileCreate]) {
              goto LABEL_125;
            }
            uint64_t v77 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:]();
            }
          }
          else
          {
            uint64_t v77 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:]();
            }
          }

LABEL_125:
          uint64_t v78 = [MEMORY[0x263F02A98] sharedInstance];
          id v79 = v78;
          if (v69) {
            uint64_t v80 = 8;
          }
          else {
            uint64_t v80 = 5;
          }
          [v78 logWithBundleID:@"com.apple.CoreSpotlight" indexOperation:9 itemCount:1 code:v80];

          if (v139)
          {
            v81 = logForCSLogCategoryIndex();
            if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v52 = 0;
LABEL_143:

              goto LABEL_144;
            }
            loga = v81;
            v82 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
            int v137 = protectionClassForAnalytics(v82);
            int v83 = sRootsInstalled;
            int v84 = _os_feature_enabled_impl();
            int v85 = _os_feature_enabled_impl();
            id v86 = [(id)sDelegate indexDirectory];
            uint64_t v87 = [v86 UTF8String];
            *(_DWORD *)v183 = 136316674;
            v184 = "2328.7.0.3";
            __int16 v185 = 1024;
            int v186 = v137;
            __int16 v187 = 1024;
            int v188 = v83;
            __int16 v189 = 1024;
            int v190 = v84;
            __int16 v191 = 1024;
            int v192 = v85;
            __int16 v193 = 2080;
            uint64_t v194 = v87;
            __int16 v195 = 1024;
            int v196 = v139;
            _os_log_impl(&dword_21F1CE000, loga, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Not reporting drop (%d, %d, %d, %d, %s) for reason %d", v183, 0x34u);

            uint64_t v52 = 0;
          }
          else
          {
            if (v69)
            {
              uint64_t v52 = 0;
LABEL_144:

              __int16 v62 = v134;
              goto LABEL_145;
            }
            LOBYTE(v131) = v136 ^ 1;
            loga = [(SPConcreteCoreSpotlightIndexer *)self indexLossAnalyticsDictWithPreviousIndexCreationDate:v133 size:v132 openingInReadOnly:v7 fullyCreated:v43 markedPurgeable:log vectorIndexDrop:0 forAnalytics:v131];
            if (v136)
            {
              v88 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v183 = 0;
                _os_log_impl(&dword_21F1CE000, v88, OS_LOG_TYPE_DEFAULT, "[IndexLoss] writing out to file", v183, 2u);
              }

              [(SPConcreteCoreSpotlightIndexer *)self writeIndexLossEventToFile:loga vector:0];
            }
            else
            {
              uint64_t v167 = MEMORY[0x263EF8330];
              uint64_t v168 = 3221225472;
              v169 = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_883;
              v170 = &unk_264506FD8;
              v171 = loga;
              AnalyticsSendEventLazy();
            }
            v89 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              v140 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
              int v138 = protectionClassForAnalytics(v140);
              int v90 = sRootsInstalled;
              int v91 = _os_feature_enabled_impl();
              int v92 = _os_feature_enabled_impl();
              id v93 = [(id)sDelegate indexDirectory];
              uint64_t v94 = [v93 UTF8String];
              *(_DWORD *)v183 = 136316418;
              v184 = "2328.7.0.3";
              __int16 v185 = 1024;
              int v186 = v138;
              __int16 v187 = 1024;
              int v188 = v90;
              __int16 v189 = 1024;
              int v190 = v91;
              __int16 v191 = 1024;
              int v192 = v92;
              __int16 v193 = 2080;
              uint64_t v194 = v94;
              _os_log_impl(&dword_21F1CE000, v89, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Sending analytics (%d, %d, %d, %d, %s)", v183, 0x2Eu);
            }
            [(SPConcreteCoreSpotlightIndexer *)self incrementIndexWipeCount];
            uint64_t v95 = [MEMORY[0x263EFF910] date];
            [v95 timeIntervalSince1970];
            [(SPConcreteCoreSpotlightIndexer *)self writeIndexDropAnalyticsDate:(uint64_t)v96];

            uint64_t v52 = @"index dropped";
          }
          v81 = loga;
          goto LABEL_143;
        }
        if (!v9)
        {
          uint64_t v44 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
            *(_DWORD *)v210 = 138412290;
            *(void *)&v210[4] = v45;
            _os_log_impl(&dword_21F1CE000, v44, OS_LOG_TYPE_DEFAULT, "*warn* Can't open dataclass:%@ - Cannot create", v210, 0xCu);
          }
          int v5 = -1;
          goto LABEL_202;
        }
        uint64_t v200 = *MEMORY[0x263F080A8];
        int v36 = [(NSString *)*p_dataclass isEqual:@"Priority"];
        id v37 = (NSString **)MEMORY[0x263F08098];
        if (!v36) {
          id v37 = &self->_dataclass;
        }
        v201 = *v37;
        uint64_t v35 = [NSDictionary dictionaryWithObjects:&v201 forKeys:&v200 count:1];
        uint64_t v38 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = *p_dataclass;
          *(_DWORD *)v210 = 138412290;
          *(void *)&v210[4] = v39;
          _os_log_impl(&dword_21F1CE000, v38, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - creating", v210, 0xCu);
        }

        stat v40 = [MEMORY[0x263F08850] defaultManager];
        id v179 = 0;
        int v41 = [v40 createDirectoryAtPath:v152 withIntermediateDirectories:1 attributes:v35 error:&v179];
        id v150 = v179;

        if (v41)
        {
          if (![(SPConcreteCoreSpotlightIndexer *)self creationTouchFileCreate]) {
            goto LABEL_64;
          }
          int v42 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:]();
          }
        }
        else
        {
          int v42 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:]();
          }
        }

LABEL_64:
        if ([(NSString *)*p_dataclass isEqualToString:v17])
        {
          int v46 = open((const char *)buf, 0);
          if (v46 != -1)
          {
            _SIChangeProtectionClassForFilesInDirectory();
            close(v46);
          }
        }

        BOOL log = 0;
        goto LABEL_68;
      }
      if ([(NSString *)*p_dataclass isEqualToString:v17]) {
        self->_tryOpenJwlIndex = 1;
      }
      id v25 = logForCSLogCategoryIndex();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      if (v8 || v7)
      {
        if (v26)
        {
          id v27 = *p_dataclass;
          *(_DWORD *)stat buf = 138413058;
          v203 = v27;
          __int16 v204 = 1024;
          int v205 = 0;
          __int16 v206 = 1024;
          int v207 = 1;
          __int16 v208 = 1024;
          int v209 = v18;
          _os_log_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device, unlocked:%d (%d:%d)", buf, 0x1Eu);
        }
      }
      else
      {
        if (v26)
        {
          int v28 = *p_dataclass;
          *(_DWORD *)stat buf = 138412290;
          v203 = v28;
          _os_log_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_INFO, "Trying locked index open for dataclass:%@", buf, 0xCu);
        }

        int v29 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
        id v30 = [v29 stringByAppendingString:@"/bgassertions"];

        uint64_t v31 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          double v32 = *p_dataclass;
          *(_DWORD *)stat buf = 138413058;
          v203 = v32;
          __int16 v204 = 1024;
          int v205 = 0;
          __int16 v206 = 1024;
          int v207 = 1;
          __int16 v208 = 1024;
          int v209 = v18;
          _os_log_impl(&dword_21F1CE000, v31, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device without valid assertions file path, unlocked:%d (%d:%d)", buf, 0x1Eu);
        }
      }
    }
    else
    {
      int v23 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = self->_dataclass;
        *(_DWORD *)stat buf = 138412290;
        v203 = v24;
        _os_log_impl(&dword_21F1CE000, v23, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device", buf, 0xCu);
      }
    }
    int v5 = 0;
LABEL_203:

    return v5;
  }
  return -1;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v9 = WeakRetained;
  if (WeakRetained)
  {
    int v10 = sIndexQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    _DWORD v13[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2;
    void v13[3] = &unk_264506F38;
    void v13[4] = WeakRetained;
    id v14 = v7;
    uint64_t v15 = a3;
    char v16 = a2;
    id v11 = _setup_block(v13, 0, 4446);
    dispatch_async(v10, v11);
  }
  return 0;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleMaintenance:*(void *)(a1 + 40) description:*(void *)(a1 + 48) forDarkWake:*(unsigned __int8 *)(a1 + 56)];
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_3()
{
  v0 = objc_alloc_init(_SPBucketSet);
  v1 = (void *)buckets;
  buckets = (uint64_t)v0;

  openIndex_shouldReindexAll_readOnly__lastTime = CFAbsoluteTimeGetCurrent();
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_847(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a1 + 56);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 0x2711uLL)
  {
    id v2 = dispatch_group_create();
    [*(id *)(a1 + 32) commitUpdates:v2];
    uint64_t v3 = _setup_block(&__block_literal_global_850, 0, 4517);
    dispatch_group_notify(v2, MEMORY[0x263EF83A0], v3);

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  double v4 = *(double *)&openIndex_shouldReindexAll_readOnly__lastTime;
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current > v4 + *(double *)&decay_time)
  {
    [(id)buckets decay:(uint64_t)((Current - *(double *)&openIndex_shouldReindexAll_readOnly__lastTime)* (double)bulk_budget_threshold/ (*(double *)&decay_time* *(double *)&decay_denominator))];
    openIndex_shouldReindexAll_readOnly__lastTime = *(void *)&Current;
  }
  if (*(unsigned char *)(a1 + 68)
    || !*(void *)(a1 + 40)
    || ([*(id *)(a1 + 32) owner],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isForegroundFileProviderBundleID:*(void *)(a1 + 40)],
        v8,
        (v9 & 1) == 0))
  {
    openIndex_shouldReindexAll_readOnly__totalCost[*(int *)(a1 + 64)] += *(void *)(a1 + 56);
    objc_msgSend((id)buckets, "addValue:forKey:");
    uint64_t v6 = *(int *)(a1 + 64);
    uint64_t v7 = openIndex_shouldReindexAll_readOnly__totalCost[v6];
    if (v7 - openIndex_shouldReindexAll_readOnly__lastReport[v6] > budget_check_threshold)
    {
      check_admission[v6] = 1;
      openIndex_shouldReindexAll_readOnly__lastReport[v6] = v7;
    }
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_848()
{
  v0 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "commitUpdates completed.", v1, 2u);
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_852(uint64_t result, unsigned int a2)
{
  return result;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_854(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  id v2 = +[SPConcreteCoreSpotlightIndexer fetchItemForURL:a2];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 providerID];
    if (v4)
    {
      int v5 = [v3 itemID];
      uint64_t v6 = [v5 coreSpotlightIdentifier];

      if (v6)
      {
        v9[0] = v4;
        v9[1] = v6;
        uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_3_857(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  int v5 = 0;
  if (a2 && a4)
  {
    char v9 = (void *)*MEMORY[0x263F05360];
    if (a3) {
      char v9 = a3;
    }
    int v10 = (objc_class *)MEMORY[0x263F054B8];
    id v11 = v9;
    id v12 = a2;
    int v13 = (void *)[[v10 alloc] initWithProviderID:v12 domainIdentifier:v11 coreSpotlightIdentifier:a4];

    int v5 = +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:v13 recursively:0 timeout:a5];
  }
  id v14 = [v5 firstObject];

  return v14;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4_860(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  int v5 = 0;
  if (a2 && a4)
  {
    char v9 = (void *)*MEMORY[0x263F05360];
    if (a3) {
      char v9 = a3;
    }
    int v10 = (objc_class *)MEMORY[0x263F054B8];
    id v11 = v9;
    id v12 = a2;
    int v13 = (void *)[[v10 alloc] initWithProviderID:v12 domainIdentifier:v11 coreSpotlightIdentifier:a4];

    int v5 = +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:v13 recursively:1 timeout:a5];
  }
  id v14 = v5;

  return v14;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_883(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_889(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C480D0]();
  [*(id *)(a1 + 32) _expireCorruptIndexFilesWithPath:*(void *)(a1 + 40) keepLatest:1];
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_890(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    id v12 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 168);
      id v14 = @"YES";
      if (!a3) {
        id v14 = @"NO";
      }
      *(_DWORD *)stat buf = 138412802;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = a2;
      __int16 v23 = 2112;
      int v24 = v14;
      _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEFAULT, "Dropping finish-draining-journal, dataclass:%@, index:%p, canceled:%@", buf, 0x20u);
    }
  }
  else
  {
    BOOL v8 = sIndexQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_891;
    v15[3] = &unk_264507000;
    void v15[4] = WeakRetained;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v16 = v9;
    uint64_t v17 = v10;
    int v18 = *(_DWORD *)(a1 + 56);
    id v11 = _setup_block(v15, 0, 4935);
    dispatch_async(v8, v11);
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_891(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2[16])
  {
    [v2 indexFinishedDrainingJournal];
    uint64_t v3 = (void *)SICopyProperty();
    if (!v3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (getSystemVersionString(),
          double v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = [v4 isEqualToString:v3],
          v4,
          (v5 & 1) == 0))
    {
      [*(id *)(a1 + 32) issueDuplicateOidCheck];
    }
    if (sPrivate) {
      goto LABEL_40;
    }
    uint64_t v6 = [*(id *)(a1 + 32) dataclass];
    uint64_t v7 = *MEMORY[0x263F08098];
    int v8 = [v6 isEqual:*MEMORY[0x263F08098]];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) getPropertyForKey:@"MessagesFixupVersion"];
      if (([v9 isEqual:&unk_26D0C8F80] & 1) == 0)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_895;
        v47[3] = &unk_264506B90;
        v47[4] = v10;
        [v10 issueMessagesFixup:v47];
      }
    }
    id v11 = [*(id *)(a1 + 32) getPropertyForKey:@"DeviceBootTime"];
    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 40);
      *(_DWORD *)stat buf = 138412546;
      id v49 = v13;
      __int16 v50 = 2112;
      uint64_t v51 = v11;
      _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEFAULT, "Comparing bootTime:%@ with stored bootTime:%@", buf, 0x16u);
    }

    if (v11
      && *(void *)(a1 + 40)
      && ([v11 timeIntervalSince1970],
          double v15 = v14,
          [*(id *)(a1 + 40) timeIntervalSince1970],
          v15 - v16 <= 5.0))
    {
      [*(id *)(a1 + 40) timeIntervalSince1970];
      double v41 = v40;
      [v11 timeIntervalSince1970];
      BOOL v17 = v41 - v42 <= 5.0;
    }
    else
    {
      BOOL v17 = 0;
    }
    int v18 = (id *)(a1 + 40);
    if (([v11 isEqual:*(void *)(a1 + 40)] & 1) != 0 || v17)
    {
      if (v17)
      {
        [v11 timeIntervalSince1970];
        double v29 = v28;
        [*v18 timeIntervalSince1970];
        if (v29 != v30)
        {
          uint64_t v31 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_891_cold_1();
          }
        }
      }
      double v32 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = *v18;
        *(_DWORD *)stat buf = 138412290;
        id v49 = v33;
        _os_log_impl(&dword_21F1CE000, v32, OS_LOG_TYPE_DEFAULT, "BootTimeDate %@ (matched)", buf, 0xCu);
      }

      BOOL v26 = dispatch_group_create();
      [*(id *)(a1 + 32) requestRequiresImportWithoutSandboxExtension:v26 maxCount:0 depth:0];
      unsigned int v34 = sIndexQueue;
      uint64_t v35 = _setup_block(&__block_literal_global_902, 0, 4912);
      dispatch_group_notify(v26, v34, v35);

      int v36 = dispatch_group_create();
      [*(id *)(a1 + 32) restartAttachmentImport:v36 maxCount:256 depth:0];
      id v37 = sIndexQueue;
      uint64_t v38 = _setup_block(&__block_literal_global_905, 0, 4918);
      dispatch_group_notify(v36, v37, v38);
    }
    else
    {
      int v19 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [*v18 timeIntervalSince1970];
        __int16 v21 = v20;
        [v11 timeIntervalSince1970];
        *(_DWORD *)stat buf = 134218240;
        id v49 = v21;
        __int16 v50 = 2048;
        uint64_t v51 = v22;
        _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "Mismatch! bootTime:%.0f with stored bootTime:%.0f", buf, 0x16u);
      }

      dispatch_group_t v23 = dispatch_group_create();
      [*(id *)(a1 + 32) removeSandboxExtensions:v23];
      int v24 = sIndexQueue;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_896;
      void v44[3] = &unk_2645064D0;
      uint64_t v25 = *(void **)(a1 + 40);
      v44[4] = *(void *)(a1 + 32);
      id v45 = v25;
      dispatch_group_t v46 = v23;
      BOOL v26 = v23;
      id v27 = _setup_block(v44, 0, 4902);
      dispatch_group_notify(v26, v24, v27);
    }
    if (([*(id *)(a1 + 32) issuePriorityIndexFixup] & 1) == 0
      && *(void *)(*(void *)(a1 + 32) + 128))
    {
      if (sUsePriorityIndex != 1) {
        goto LABEL_45;
      }
      if ([*(id *)(*(void *)(a1 + 48) + 168) isEqualToString:@"Priority"])
      {
LABEL_36:
        if (*(_DWORD *)(a1 + 56) == 2
          || (uint64_t v39 = [*(id *)(a1 + 32) getIntegerPropertyForKey:@"AppsFixupVersion"],
              v39 != [&unk_26D0C8FE0 integerValue]))
        {
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_911;
          void v43[3] = &unk_2645063F8;
          v43[4] = *(void *)(a1 + 32);
          [(id)sDelegate updateApplicationsWithCompletion:v43 clean:0];
        }
        goto LABEL_39;
      }
      if ((sUsePriorityIndex & 1) == 0)
      {
LABEL_45:
        if ([*(id *)(*(void *)(a1 + 48) + 168) isEqualToString:v7]) {
          goto LABEL_36;
        }
      }
    }
LABEL_39:

LABEL_40:
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_895(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setProperty:&unk_26D0C8F80 forKey:@"MessagesFixupVersion" sync:1];
  }
  return result;
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_896(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:@"DeviceBootTime" sync:1];
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (post cleanup)", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) requestRequiresImportWithoutSandboxExtension:*(void *)(a1 + 48) maxCount:0 depth:0];
  double v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "removeSandboxExtensions notify done", (uint8_t *)&v8, 2u);
  }

  char v5 = *(NSObject **)(a1 + 48);
  uint64_t v6 = sIndexQueue;
  uint64_t v7 = _setup_block(&__block_literal_global_899, 0, 4901);
  dispatch_group_notify(v5, v6, v7);
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_897()
{
  v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "requestRequiresImportWithoutSandboxExtension notify done", v1, 2u);
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_900()
{
  v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "requestRequiresImportWithoutSandboxExtension notify done", v1, 2u);
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_903()
{
  v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "restartAttachmentImport notify done", v1, 2u);
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_911(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProperty:&unk_26D0C8FE0 forKey:@"AppsFixupVersion" sync:0];
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_918()
{
  return [MEMORY[0x263F02AD8] notifyIndexDelegates];
}

- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4
{
  return [(SPConcreteCoreSpotlightIndexer *)self openIndex:a3 shouldReindexAll:a4 readOnly:0];
}

- (int)openIndex:(BOOL)a3
{
  return [(SPConcreteCoreSpotlightIndexer *)self openIndex:a3 shouldReindexAll:a3];
}

- (int)openJWLIndex
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_jwlIndex) {
      return 0;
    }
    double v4 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
    bzero(buffer, 0x400uLL);
    if (CFStringGetFileSystemRepresentation(v4, buffer, 1024))
    {
      int v5 = open(buffer, 0x8000);
      if (v5 < 0)
      {
        uint64_t v9 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          dataclass = self->_dataclass;
          *(_DWORD *)stat buf = 138412290;
          v13[0] = dataclass;
          _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - can't open to journal", buf, 0xCu);
        }

        int v2 = -1;
        goto LABEL_17;
      }
      int v6 = v5;
      protectionClassIntValue(self->_dataclass);
      int v2 = SIOpenJWLIndex();
      close(v6);
      if ((v2 & 0x80000000) == 0)
      {
        self->_jwlIndex = 0;
        uint64_t v7 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = self->_dataclass;
          *(_DWORD *)stat buf = 67109378;
          LODWORD(v13[0]) = v2;
          WORD2(v13[0]) = 2112;
          *(void *)((char *)v13 + 6) = v8;
          _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "JWL index open, result:%d, dataclass:%@", buf, 0x12u);
        }
LABEL_13:

        self->_hasAssertion = 0;
        self->_assertionEndTime = 0.0;
        self->_suspended = 1;
LABEL_17:

        return v2;
      }
    }
    else
    {
      int v2 = -1;
    }
    uint64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer openJWLIndex]();
    }
    goto LABEL_13;
  }
  return -1;
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  int v2 = *(void **)(a1 + 32);
  if (v2[16] && v2[8] == *(void *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _addNewClientWithBundleID:v3];
  }
  else
  {
    double v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) dataclass];
      uint64_t v7 = [*(id *)(a1 + 32) index];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138413314;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p, createCount:%lu/%lu", (uint8_t *)&v10, 0x34u);
    }
  }
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_926(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    int v10 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 168);
      uint64_t v13 = @"YES";
      if (!a3) {
        uint64_t v13 = @"NO";
      }
      *(_DWORD *)stat buf = 138413058;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      __int16 v22 = 2112;
      dispatch_group_t v23 = v13;
      _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Dropping check-in for known client, bundleID:%@, dataclass:%@, index:%p, canceled:%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v8 = sIndexQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_927;
    v14[3] = &unk_2645065E8;
    v14[4] = WeakRetained;
    id v15 = *(id *)(a1 + 32);
    uint64_t v9 = _setup_block(v14, 0, 5169);
    dispatch_async(v8, v9);
  }
}

uint64_t __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_927(uint64_t a1)
{
  return [*(id *)(a1 + 32) indexFinishedDrainingJournal:*(void *)(a1 + 40)];
}

- (void)addClients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sIndexQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SPConcreteCoreSpotlightIndexer_addClients___block_invoke;
  v8[3] = &unk_2645065E8;
  id v9 = v4;
  int v10 = self;
  id v6 = v4;
  uint64_t v7 = _setup_block(v8, 0, 5185);
  dispatch_async(v5, v7);
}

void __45__SPConcreteCoreSpotlightIndexer_addClients___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(v4 + 168);
    uint64_t v6 = *(void *)(v4 + 32);
    *(_DWORD *)stat buf = 138412802;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "addClients, bundleIDs:%@, dataclass:%@, checkedInClients:%@", buf, 0x20u);
  }

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  [v7 setKnownClients:v8];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 40) + 200);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(a1 + 40), "checkInWithBundleID:completionHandler:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_addNewClientWithBundleID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  uint64_t v5 = [(NSSet *)self->_knownClients setByAddingObject:v4];
  [(SPConcreteCoreSpotlightIndexer *)self setKnownClients:v5];

  id location = 0;
  objc_initWeak(&location, self);
  index = self->_index;
  if (index)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke;
    v10[3] = &unk_264507078;
    objc_copyWeak(&v12, &location);
    void v10[4] = self;
    id v11 = v4;
    SIBackgroundOpBlock((uint64_t)index, 0, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    uint64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
      BOOL readOnly = self->_readOnly;
      *(_DWORD *)stat buf = 138413058;
      id v15 = v4;
      __int16 v16 = 2112;
      long long v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = MEMORY[0x263EF8900];
      __int16 v20 = 1024;
      BOOL v21 = readOnly;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p,  readOnly:%d", buf, 0x26u);
    }
  }
  objc_destroyWeak(&location);
}

void __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (a3 || !WeakRetained || *(unsigned char *)(*(void *)(a1 + 32) + 97))
  {
    uint64_t v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [v7 dataclass];
      id v11 = (void *)v10;
      id v12 = @"YES";
      int v13 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 97);
      *(_DWORD *)stat buf = 138413314;
      if (!a3) {
        id v12 = @"NO";
      }
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      __int16 v28 = 2048;
      uint64_t v29 = a2;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      __int16 v32 = 1024;
      int v33 = v13;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p, canceled:%@, readOnly:%d", buf, 0x30u);
    }
  }
  else
  {
    if ([WeakRetained denyOperationOnAssertedIndex:"_addNewClientWithBundleID"]) {
      goto LABEL_9;
    }
    v21[0] = @"_kMDItemBundleID";
    v21[1] = @"_kMDItemExternalID";
    uint64_t v14 = *(void *)(a1 + 40);
    v22[0] = @"com.apple.searchd";
    v22[1] = v14;
    void v21[2] = @"_kMDClientCheckedIn";
    v22[2] = MEMORY[0x263EFFA88];
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    __int16 v23 = v15;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke_932;
    v17[3] = &unk_2645070A0;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = v7;
    uint64_t v20 = a2;
    __int16 v16 = (const void *)[v17 copy];
    if (!SISetCSAttributes()) {
      CFRelease(v16);
    }
  }
LABEL_9:
}

void __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke_932(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) dataclass];
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 138413058;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Recorded check-in for new client, bundleID:%@, dataclass:%@, index:%p, error:%@", (uint8_t *)&v8, 0x2Au);
  }
  [*(id *)(a1 + 40) dirty];
}

- (void)performIndexerTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SPConcreteCoreSpotlightIndexer *)self owner];
  uint64_t v9 = [(SPConcreteCoreSpotlightIndexer *)self firstUnlockQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke;
  v14[3] = &unk_2645070F0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  uint64_t v13 = _setup_block(v14, 0, 5258);
  dispatch_async(v9, v13);
}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = a1[4];
  id v5 = a1[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2;
  v16[3] = &unk_2645070C8;
  id v6 = v2;
  id v17 = v6;
  id v18 = v3;
  id v7 = v3;
  [v4 performIndexerTask:v5 withIndexDelegatesAndCompletionHandler:v16];
  int v8 = [a1[4] firstUnlockQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3;
  v11[3] = &unk_2645070F0;
  id v12 = a1[5];
  id v13 = v6;
  id v14 = a1[6];
  id v15 = a1[7];
  id v9 = v6;
  id v10 = _setup_block(v11, 0, 5257);
  dispatch_group_notify(v7, v8, v10);
}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [SPCoreSpotlightIndexerTask alloc];
  id v3 = [*(id *)(a1 + 32) job];
  id v4 = [*(id *)(a1 + 32) indexers];
  id v7 = [(SPCoreSpotlightIndexerTask *)v2 initWithIndexJob:v3 indexers:v4];

  id v5 = [*(id *)(a1 + 32) bundleIDs];
  [(SPCoreSpotlightIndexerTask *)v7 setBundleIDs:v5];

  id v6 = [*(id *)(a1 + 40) allObjects];
  [(SPCoreSpotlightIndexerTask *)v7 setCompletedBundleIDs:v6];

  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v7, "setDataMigrationStage:", [*(id *)(a1 + 32) dataMigrationStage]);
  -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v7, "setShouldResumeOnFailure:", [*(id *)(a1 + 32) shouldResumeOnFailure]);
  [*(id *)(a1 + 48) performIndexerTask:v7 withIndexExtensionsAndCompletionHandler:*(void *)(a1 + 56)];
}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_936(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 168);
    *(_DWORD *)stat buf = 138413058;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "Done performing job:%@ with the checked-in client for bundleID:%@, dataclass:%@, error:%@", buf, 0x2Au);
  }

  if (!v3)
  {
    id v8 = *(id *)(a1 + 56);
    objc_sync_enter(v8);
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v8);
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v9 addCompletedBundleIDs:v10 forIndexerTask:*(void *)(a1 + 64)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_937(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) allObjects];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)startReindexAll
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:@"SPReindexAllStarted"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
  {
    int v4 = 1;
  }
  else
  {
    [(SPConcreteCoreSpotlightIndexer *)self setProperty:MEMORY[0x263EFFA68] forKey:@"SPReindexAllCompletedBundleIDs" sync:0];
    [(SPConcreteCoreSpotlightIndexer *)self setProperty:MEMORY[0x263EFFA88] forKey:@"SPReindexAllStarted" sync:1];
    int v4 = 0;
  }
  uint64_t v5 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  SDTraceAdd(3, @"Reindexall start", 0, v5, 0, 0.0);

  uint64_t v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
    id v8 = @"NO";
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2112;
    if (v4) {
      id v8 = @"YES";
    }
    id v12 = @"SPReindexAllStarted";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@/YES", (uint8_t *)&v9, 0x20u);
  }
}

- (void)finishReindexAll
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(SPConcreteCoreSpotlightIndexer *)self setProperty:MEMORY[0x263EFFA80] forKey:@"SPReindexAllStarted" sync:0];
  [(SPConcreteCoreSpotlightIndexer *)self setProperty:MEMORY[0x263EFFA68] forKey:@"SPReindexAllCompletedBundleIDs" sync:1];
  id v3 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  SDTraceAdd(3, @"Reindexall complete", 0, v3, 0, 0.0);

  int v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    int v9 = @"SPReindexAllStarted";
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "dataclass:%@, %@:NO", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)reindexAllStarted
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self getPropertyForKey:@"SPReindexAllStarted"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)fetchAllCompletedBundleIDsForIndexerTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [v6 job];
  if ([v8 jobType] == 2 && (objc_msgSend(v6, "shouldResumeOnFailure") & 1) != 0)
  {
    int v9 = sIndexQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __93__SPConcreteCoreSpotlightIndexer_fetchAllCompletedBundleIDsForIndexerTask_completionHandler___block_invoke;
    v11[3] = &unk_264507168;
    void v11[4] = self;
    id v12 = v7;
    uint64_t v10 = _setup_block(v11, 0, 5379);
    dispatch_async(v9, v10);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __93__SPConcreteCoreSpotlightIndexer_fetchAllCompletedBundleIDsForIndexerTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) reindexAllStarted])
  {
    id v2 = [*(id *)(a1 + 32) getPropertyForKey:@"SPReindexAllCompletedBundleIDs"];
    if (v2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v3 = v2;
      }
      else {
        char v3 = 0;
      }
    }
    else
    {
      char v3 = 0;
    }
    id v4 = v3;
    uint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) dataclass];
      int v8 = 138413314;
      int v9 = v6;
      __int16 v10 = 2112;
      __int16 v11 = @"SPReindexAllStarted";
      __int16 v12 = 2112;
      __int16 v13 = @"YES";
      __int16 v14 = 2112;
      uint64_t v15 = @"SPReindexAllCompletedBundleIDs";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@, %@:%@", (uint8_t *)&v8, 0x34u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
    }
  }
}

- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 job];
  if ([v8 jobType] == 2
    && [v6 count]
    && [v7 shouldResumeOnFailure])
  {
    int v9 = sIndexQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __71__SPConcreteCoreSpotlightIndexer_addCompletedBundleIDs_forIndexerTask___block_invoke;
    v11[3] = &unk_2645065E8;
    void v11[4] = self;
    id v12 = v6;
    __int16 v10 = _setup_block(v11, 0, 5405);
    dispatch_async(v9, v10);
  }
}

void __71__SPConcreteCoreSpotlightIndexer_addCompletedBundleIDs_forIndexerTask___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) reindexAllStarted])
  {
    id v2 = [*(id *)(a1 + 32) getPropertyForKey:@"SPReindexAllCompletedBundleIDs"];
    char v3 = (void *)MEMORY[0x263EFFA68];
    if (v2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v3 = v2;
      }
    }
    id v4 = v3;
    uint64_t v5 = [v4 count];
    uint64_t v6 = [*(id *)(a1 + 40) count] + v5;
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v6];
    [v7 addObjectsFromArray:v4];

    [v7 addObjectsFromArray:*(void *)(a1 + 40)];
    int v8 = [v7 allObjects];
    int v9 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = [*(id *)(a1 + 32) dataclass];
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138413570;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = @"SPReindexAllStarted";
      __int16 v16 = 2112;
      id v17 = @"YES";
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      BOOL v21 = @"SPReindexAllCompletedBundleIDs";
      __int16 v22 = 2112;
      __int16 v23 = v8;
      _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@, bundleIDs:%@, %@:%@", (uint8_t *)&v12, 0x3Eu);
    }
    [*(id *)(a1 + 32) setProperty:v8 forKey:@"SPReindexAllCompletedBundleIDs" sync:1];
  }
}

- (void)coolDown:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_index)
  {
    id v4 = a3;
    uint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      int v7 = 138412290;
      int v8 = dataclass;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Index %@ coolDown", (uint8_t *)&v7, 0xCu);
    }

    [(SPConcreteCoreSpotlightIndexer *)self commitUpdates:v4];
  }
}

- (void)shrink:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 == 16 && self->_index && s_last_memory_pressure_status == 16)
  {
    uint64_t v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      int v7 = 138412290;
      int v8 = dataclass;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Index %@ shrink", (uint8_t *)&v7, 0xCu);
    }

    SIIndexInactive();
  }
}

- (void)issueSplit
{
  if (self->_index) {
    MEMORY[0x270F4B2C8]();
  }
}

- (void)mergeWithGroup:(id)a3
{
  if (self->_index) {
    _SIIssueFullMergeWithGroup();
  }
}

- (void)mergeWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    -[SPConcreteCoreSpotlightIndexer mergeWithCompletionHandler:]();
  }
  uint64_t v5 = (void (**)(void, void))v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (self->_index && (!self->_suspended || self->_softSuspended))
  {
    uint64_t v6 = dispatch_group_create();
    int v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)stat buf = 138412290;
      __int16 v14 = dataclass;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Performing full merge, dataclass:%@", buf, 0xCu);
    }

    _SIIssueFullMergeWithGroup();
    uint64_t v9 = dispatch_get_global_queue(9, 2uLL);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __61__SPConcreteCoreSpotlightIndexer_mergeWithCompletionHandler___block_invoke;
    v11[3] = &unk_264507168;
    void v11[4] = self;
    int v12 = v5;
    dispatch_group_notify(v6, v9, v11);
  }
  else
  {
    __int16 v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v10);
  }
}

uint64_t __61__SPConcreteCoreSpotlightIndexer_mergeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 168);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Completed full merge, dataclass:%@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cleanupStringsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SPConcreteCoreSpotlightIndexer cleanupStringsWithCompletionHandler:]();
  }
  int v5 = (void (**)(void, void))v4;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (self->_index && !self->_suspended)
  {
    uint64_t v6 = dispatch_group_create();
    [(SPConcreteCoreSpotlightIndexer *)self cleanupStringsWithActivity:0 group:v6 shouldDefer:0 flags:0];
    uint64_t v7 = dispatch_get_global_queue(9, 2uLL);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__SPConcreteCoreSpotlightIndexer_cleanupStringsWithCompletionHandler___block_invoke;
    block[3] = &unk_264506548;
    uint64_t v9 = v5;
    dispatch_group_notify(v6, v7, block);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    ((void (**)(void, NSObject *))v5)[2](v5, v6);
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_cleanupStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanupStringsWithActivity:(id)a3 group:(id)a4 shouldDefer:(BOOL *)a5 flags:(int)a6
{
  if (self->_index) {
    MEMORY[0x270F4B258]();
  }
}

- (void)issueDefrag:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_index)
  {
    dataclass = self->_dataclass;
    v8[0] = @"defrag";
    v8[1] = dataclass;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    uint64_t v7 = SDTransactionCreate(v6);

    _SIIssueDefrag();
    if (v4)
    {
      syncContextCreate(v4, v7);
      SISynchedOp();
    }
  }
}

- (void)issueRepair
{
  index = self->_index;
  if (index) {
    MEMORY[0x270F4B2C0](index, a2);
  }
}

- (void)issueConsistencyCheck
{
  index = self->_index;
  if (index) {
    MEMORY[0x270F4B260](index, a2);
  }
}

- (void)issueDuplicateOidCheck
{
  index = self->_index;
  if (index) {
    MEMORY[0x270F4B250](index, a2);
  }
}

- (void)fixupMessageAttachmentsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (self->_readOnly)
  {
    int v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SPConcreteCoreSpotlightIndexer fixupMessageAttachmentsWithCompletionHandler:]();
    }

    goto LABEL_6;
  }
  if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"fixupMessageAttachmentsWithCompletionHandler"])
  {
LABEL_6:
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    if (v4) {
      v4[2](v4, v6);
    }

    goto LABEL_9;
  }
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  int v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  id v34[2] = 0x2020000000;
  int v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  void v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments starting", buf, 2u);
  }

  int v8 = SDTransactionCreate(&unk_26D0C8CF8);
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  void v28[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke;
  void v28[3] = &unk_264507190;
  __int16 v30 = v32;
  __int16 v10 = v9;
  uint64_t v29 = v10;
  uint64_t v11 = (void *)MEMORY[0x223C48320](v28);
  index = self->_index;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2;
  void v23[3] = &unk_264507230;
  void v23[4] = self;
  __int16 v26 = v36;
  __int16 v13 = v10;
  uint64_t v24 = v13;
  uint64_t v27 = v34;
  id v14 = v11;
  id v25 = v14;
  SIBackgroundOpBlock((uint64_t)index, 0, v23);
  uint64_t v15 = sIndexQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_973;
  v18[3] = &unk_264507258;
  BOOL v21 = v32;
  __int16 v22 = v36;
  __int16 v20 = v4;
  id v16 = v8;
  id v19 = v16;
  id v17 = _setup_block(v18, 0, 5677);
  dispatch_group_notify(v13, v15, v17);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
LABEL_9:
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    int v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  v24[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 89;
  }
  else
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3;
    id v17 = &unk_264507208;
    uint64_t v23 = a2;
    uint64_t v4 = *(void *)(a1 + 56);
    int v5 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v21 = v4;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 64);
    id v19 = v6;
    uint64_t v22 = v7;
    id v20 = *(id *)(a1 + 48);
    int v8 = (void *)MEMORY[0x223C48320](&v14);
    uint64_t v9 = [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\" && _kMDItemDomainIdentifier=attachmentDomain && _kMDItemUserActivityType!=* && kMDItemRelatedUniqueIdentifier=*", @"com.apple.MobileSMS", v14, v15, v16, v17, v18];
    __int16 v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[16];
    uint64_t v12 = *MEMORY[0x263F027A0];
    v24[0] = *MEMORY[0x263F02938];
    v24[1] = v12;
    __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    LOBYTE(v10) = [v10 _startInternalQueryWithIndex:v11 query:v9 fetchAttributes:v13 forBundleIds:&unk_26D0C8D10 resultsHandler:v8];

    if (v10)
    {

      return;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 22;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a2;
  if (a3)
  {
    if (a3 == 1)
    {
      if ([*(id *)(a1 + 32) index] != *(void *)(a1 + 72))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
        if (!*(_DWORD *)(v10 + 24)) {
          *(_DWORD *)(v10 + 24) = 22;
        }
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
  else if ([*(id *)(a1 + 32) index] == *(void *)(a1 + 72))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unsigned int VectorCount = _MDStoreOIDArrayGetVectorCount();
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:VectorCount];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_4;
    v26[3] = &unk_264506C80;
    id v13 = v12;
    id v27 = v13;
    [a6 enumerateQueryResults:2 stringCache:0 usingBlock:v26];
    uint64_t v14 = [v13 count];
    uint64_t v15 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(_DWORD *)stat buf = 67109632;
      int v29 = v16;
      __int16 v30 = 1024;
      int v31 = v14;
      __int16 v32 = 1024;
      unsigned int v33 = VectorCount;
      _os_log_impl(&dword_21F1CE000, v15, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments update batch %d count %d (%d)", buf, 0x14u);
    }

    if (v14)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v17 = sIndexQueue;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_965;
      void v22[3] = &unk_2645071E0;
      uint64_t v18 = *(void *)(a1 + 72);
      void v22[4] = *(void *)(a1 + 32);
      uint64_t v25 = v18;
      long long v21 = *(_OWORD *)(a1 + 48);
      id v19 = (id)v21;
      long long v24 = v21;
      id v23 = v13;
      id v20 = _setup_block(v22, 0, 5643);
      dispatch_async(v17, v20);
    }
  }
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = a2[1];
    if (v3)
    {
      if (v2 != *MEMORY[0x263EFFD08] && v3 != *MEMORY[0x263EFFD08])
      {
        int v5 = *(void **)(a1 + 32);
        uint64_t v6 = *MEMORY[0x263F027A0];
        v8[0] = *MEMORY[0x263F02938];
        v8[1] = v6;
        v9[0] = v2;
        v9[1] = v3;
        uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
        [v5 addObject:v7];
      }
    }
  }
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_965(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) index];
  if (v2 == *(void *)(a1 + 64))
  {
    uint64_t v4 = v2;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2_966;
    void v7[3] = &unk_2645071B8;
    long long v6 = *(_OWORD *)(a1 + 48);
    id v5 = (id)v6;
    long long v9 = v6;
    id v8 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v4, 0, v7);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 22;
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2_966(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 89;
  }
  uint64_t v4 = (const void *)[*(id *)(a1 + 40) copy];
  if (!SISetCSAttributes())
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(_DWORD *)(v5 + 24)) {
      *(_DWORD *)(v5 + 24) = 22;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CFRelease(v4);
  }
}

id __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_973(void *a1)
{
  uint64_t v2 = a1 + 6;
  if (*(void *)(*(void *)(a1[6] + 8) + 40)
    || *(_DWORD *)(*(void *)(a1[7] + 8) + 24)
    && ([MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = *(void *)(*v2 + 8),
        id v8 = *(void **)(v7 + 40),
        *(void *)(v7 + 40) = v6,
        v8,
        *(void *)(*(void *)(*v2 + 8) + 40)))
  {
    uint64_t v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_973_cold_1();
    }
  }
  else
  {
    uint64_t v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments complete", v9, 2u);
    }
  }

  uint64_t v4 = a1[5];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(*(void *)(*v2 + 8) + 40));
  }
  return self;
}

- (void)issueMessagesFixup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))v4;
  if (self->_index && !self->_suspended)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __53__SPConcreteCoreSpotlightIndexer_issueMessagesFixup___block_invoke;
    void v7[3] = &unk_264507280;
    id v8 = v4;
    [(SPConcreteCoreSpotlightIndexer *)self fixupMessageAttachmentsWithCompletionHandler:v7];
  }
  else if (v4)
  {
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

uint64_t __53__SPConcreteCoreSpotlightIndexer_issueMessagesFixup___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_appendRervseInfo:(id)a3 dictionary:(id)a4 key:(id)a5 level:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 appendString:@"\n"];
  if (a6)
  {
    unint64_t v13 = a6;
    do
    {
      [v10 appendString:@"  "];
      --v13;
    }
    while (v13);
  }
  [v10 appendFormat:@"%@", v12];
  uint64_t v14 = [v11 objectForKeyedSubscript:v12];
  if (v14)
  {
    [v11 setObject:0 forKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        unint64_t v19 = a6 + 1;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            [(SPConcreteCoreSpotlightIndexer *)self _appendRervseInfo:v10 dictionary:v11 key:*(void *)(*((void *)&v21 + 1) + 8 * v20++) level:v19];
          }
          while (v17 != v20);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v17);
      }
    }
    else
    {
      [(SPConcreteCoreSpotlightIndexer *)self _appendRervseInfo:v10 dictionary:v11 key:v14 level:a6 + 1];
    }
  }
}

- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  index = self->_index;
  if (index)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke;
    void v9[3] = &unk_2645072D0;
    unint64_t v11 = a3;
    void v9[4] = self;
    id v10 = v6;
    SISynchedOpWithBlock((uint64_t)index, 4, v9);
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      long long v22 = __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2;
      long long v23 = &unk_2645072A8;
      id v6 = &v24;
      id v7 = v5;
      id v24 = v7;
      _SIReverseStoreIterate();
      if ([v7 count])
      {
        id v8 = [MEMORY[0x263F089D8] stringWithString:@"### Reverse Store"];
        bzero(v26, 0x1000uLL);
        processReverseInfo((uint64_t)v26, 0, v8, v7, &unk_26D0C8FF8);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v9 = [v7 allKeys];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              processReverseInfo((uint64_t)v26, 0, v8, v7, *(void **)(*((void *)&v16 + 1) + 8 * i));
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v25 count:16];
          }
          while (v11);
        }

        id v4 = [v8 dataUsingEncoding:4];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      [MEMORY[0x263F089D8] stringWithString:@"### Reverse Store"];
      id v6 = &v15;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = v15;
      _SIReverseStoreIterate();
      id v4 = [v7 dataUsingEncoding:4];
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v4, 0);
  }
}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:");
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [NSNumber numberWithLongLong:a2];
      uint64_t v7 = [v5 arrayByAddingObject:v6];
    }
    else
    {
      v9[0] = v5;
      id v6 = [NSNumber numberWithLongLong:a2];
      v9[1] = v6;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    }
    id v8 = (void *)v7;
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];
  }
  else
  {
    id v6 = [NSNumber numberWithLongLong:a2];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
  }
}

uint64_t __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lld %lld\n", a2, a3);
}

- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  index = self->_index;
  if (index)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke;
    void v8[3] = &unk_264507320;
    id v9 = v5;
    SISynchedOpWithBlock((uint64_t)index, 4, v8);
  }
  else if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_new();
    uint64_t v5 = _SIGetIndexCount();
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_msgSend(v4, "appendFormat:", @"### Forward Store (%d)\n", i, v11, v12, v13, v14);
        uint64_t v11 = MEMORY[0x263EF8330];
        uint64_t v12 = 3221225472;
        unint64_t v13 = __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2;
        uint64_t v14 = &unk_2645072F8;
        id v8 = v4;
        _SIDirectoryStoreIterate();
      }
      id v4 = v8;
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = [v4 dataUsingEncoding:4];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
}

uint64_t __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  v18[1] = *MEMORY[0x263EF8340];
  size_t v6 = (21 * a2 + 21);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0x1FFFFFFF0);
  bzero(v7, v6);
  *uint64_t v7 = 0;
  id v8 = v7;
  if (a2 >= 1)
  {
    if (a2 >= 512) {
      int v9 = 512;
    }
    else {
      int v9 = a2;
    }
    id v8 = v7;
    do
    {
      uint64_t v10 = *(void *)(a3 + 8 * (v9 - 1));
      *id v8 = 47;
      uint64_t v11 = -1;
      uint64_t v12 = 1;
      uint64_t v13 = v10;
      do
      {
        uint64_t v14 = v12;
        unint64_t v15 = v13 + 9;
        v13 /= 10;
        ++v11;
        ++v12;
      }
      while (v15 > 0x12);
      do
      {
        v8[v14--] = v10 % 10 + 48;
        v10 /= 10;
      }
      while (v14 > 0);
      v8 += v11 + 2;
    }
    while (v9-- > 1);
  }
  *id v8 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%s\n", v7);
}

+ (BOOL)dumpCrashStates:(const char *)a3 toFile:(id)a4
{
  id v5 = a4;
  size_t v6 = v5;
  if (!a3) {
    goto LABEL_24;
  }
  int v7 = dup([v5 fileDescriptor]);
  if (v7 < 0)
  {
LABEL_23:
    LOBYTE(a3) = 0;
    goto LABEL_24;
  }
  int v8 = v7;
  int v9 = fdopen(v7, "a");
  if (!v9)
  {
    close(v8);
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = strrchr((char *)a3, 47);
  if (!v11
    || v11 == a3
    || (*uint64_t v11 = 0, v12 = v11 + 1, v13 = strlen(a3), (v14 = (char *)malloc_type_malloc(0x400uLL, 0xBC194D6CuLL)) == 0))
  {
LABEL_22:
    fclose(v10);
    goto LABEL_23;
  }
  unint64_t v15 = v14;
  long long v16 = opendir(a3);
  if (!v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[SPConcreteCoreSpotlightIndexer dumpCrashStates:toFile:]();
    }
    free(v15);
    goto LABEL_22;
  }
  long long v17 = v16;
  long long v18 = readdir(v16);
  if (v18)
  {
    long long v19 = v18;
    size_t v20 = v13 - 1014;
    size_t v28 = v13 + 1;
    __dst = &v15[v13 + 1];
    uint64_t v26 = &v15[v13];
    uint64_t v27 = (uint64_t)&v15[v13 + 2];
    do
    {
      if (v19->d_type == 4 && v19->d_name[0] != 46 && v20 + v19->d_namlen >= 0xFFFFFFFFFFFFFC00)
      {
        size_t v21 = strlen(v12);
        if (!strncmp(v19->d_name, v12, v21))
        {
          __strcpy_chk();
          *uint64_t v26 = 47;
          strcpy(__dst, v19->d_name);
          v15[v28 + v19->d_namlen] = 47;
          strcpy((char *)(v27 + v19->d_namlen), "mds64-crash-state-v2");
          memset(&v30, 0, sizeof(v30));
          if (!stat(v15, &v30))
          {
            long long v22 = +[SPCoreSpotlightIndexer sharedInstance];
            long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"\nCrash State %s\n", v15);
            id v24 = [v23 dataUsingEncoding:4];
            [v22 writeData:v24 toFile:v6];

            _SICrashStateDump();
            fflush(v10);
          }
        }
      }
      long long v19 = readdir(v17);
    }
    while (v19);
  }
  free(v15);
  closedir(v17);
  fclose(v10);
  LOBYTE(a3) = 1;
LABEL_24:

  return (char)a3;
}

- (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5
{
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v118 = a5;
  uint64_t v139 = 0;
  v140 = &v139;
  uint64_t v141 = 0x2020000000;
  char v142 = 0;
  uint64_t v10 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v11 = NSString;
  uint64_t v12 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  size_t v13 = [v11 stringWithFormat:@"=== Index %@\n\n", v12];
  uint64_t v14 = [v13 dataUsingEncoding:4];
  char v15 = [v10 writeData:v14 toFile:v8];
  *((unsigned char *)v140 + 24) = v15;

  if (*((unsigned char *)v140 + 24))
  {
    if (![v9 length]) {
      goto LABEL_7;
    }
    if ([v118 length])
    {
      long long v16 = +[SPCoreSpotlightIndexer sharedInstance];
      [NSString stringWithFormat:@"Bundle: %@\nItem Identifier: %@\n\n", v9, v118];
    }
    else
    {
      long long v16 = +[SPCoreSpotlightIndexer sharedInstance];
      [NSString stringWithFormat:@"Bundle: %@\n\n", v9];
    long long v17 = };
    long long v18 = [v17 dataUsingEncoding:4];
    char v19 = [v16 writeData:v18 toFile:v8];
    *((unsigned char *)v140 + 24) = v19;

    if (*((unsigned char *)v140 + 24))
    {
LABEL_7:
      id v117 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
      v115 = (const char *)[v117 fileSystemRepresentation];
      size_t v116 = strlen(v115);
      if (!self->_index || !SIValidIndex()) {
        goto LABEL_47;
      }
      if (self->_suspended)
      {
        indexQueue = self->_indexQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke;
        block[3] = &unk_2645063F8;
        void block[4] = self;
        dispatch_sync(indexQueue, block);
        if (self->_suspended)
        {
          size_t v21 = +[SPCoreSpotlightIndexer sharedInstance];
          long long v22 = [@"   Index suspended\n\n" dataUsingEncoding:4];
          char v23 = [v21 writeData:v22 toFile:v8];
          *((unsigned char *)v140 + 24) = v23;

          if (!*((unsigned char *)v140 + 24)) {
            goto LABEL_73;
          }
          goto LABEL_47;
        }
      }
      v114 = (time_t *)SICopyProperties();
      if (!v114)
      {
LABEL_39:
        int v64 = (void *)SICopyCSClientStateCache();
        if (!v64) {
          goto LABEL_43;
        }
        int v65 = +[SPCoreSpotlightIndexer sharedInstance];
        uint64_t v66 = [@"ClientStateCache:\n" dataUsingEncoding:4];
        char v67 = [v65 writeData:v66 toFile:v8];
        *((unsigned char *)v140 + 24) = v67;

        if (*((unsigned char *)v140 + 24))
        {
          *(void *)v155 = 0;
          v156 = v155;
          uint64_t v157 = 0x2020000000;
          LOBYTE(v158) = 1;
          v121[0] = MEMORY[0x263EF8330];
          v121[1] = 3221225472;
          v121[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_6;
          v121[3] = &unk_2645073E8;
          id v68 = v8;
          id v122 = v68;
          v123 = v155;
          [v64 enumerateKeysAndObjectsUsingBlock:v121];
          int v69 = v156[24];
          *((unsigned char *)v140 + 24) = v69;
          if (v69)
          {
            long long v70 = +[SPCoreSpotlightIndexer sharedInstance];
            int v71 = [@"\n" dataUsingEncoding:4];
            char v72 = [v70 writeData:v71 toFile:v68];
            *((unsigned char *)v140 + 24) = v72;

            BOOL v73 = *((unsigned char *)v140 + 24) == 0;
            _Block_object_dispose(v155, 8);
            if (!v73)
            {
LABEL_43:
              v74 = (void *)_SISchedulerCopyDump();
              if (v74)
              {
                v75 = +[SPCoreSpotlightIndexer sharedInstance];
                int v76 = [v74 description];
                uint64_t v77 = [v76 dataUsingEncoding:4];
                char v78 = [v75 writeData:v77 toFile:v8];
                *((unsigned char *)v140 + 24) = v78;

                if (!*((unsigned char *)v140 + 24)) {
                  goto LABEL_65;
                }
                id v79 = +[SPCoreSpotlightIndexer sharedInstance];
                uint64_t v80 = [@"\n\n" dataUsingEncoding:4];
                char v81 = [v79 writeData:v80 toFile:v8];
                *((unsigned char *)v140 + 24) = v81;

                if (!*((unsigned char *)v140 + 24))
                {
LABEL_65:

                  goto LABEL_73;
                }
              }

LABEL_47:
              v82 = +[SPCoreSpotlightIndexer sharedInstance];
              int v83 = [v117 stringByAppendingString:@"\n"];
              int v84 = [v83 dataUsingEncoding:4];
              char v85 = [v82 writeData:v84 toFile:v8];
              *((unsigned char *)v140 + 24) = v85;

              if (*((unsigned char *)v140 + 24))
              {
                size_t v86 = v116 + 1;
                if (v116 + 1 <= 0x3FF)
                {
                  bzero(v155, 0x400uLL);
                  __strcpy_chk();
                  v155[v116] = 47;
                  v155[v86] = 0;
                  uint64_t v87 = opendir(v155);
                  if (v87)
                  {
                    while (1)
                    {
                      v88 = readdir(v87);
                      if (!v88) {
                        break;
                      }
                      int d_type = v88->d_type;
                      if (d_type != 4 && d_type != 10 && v86 + v88->d_namlen <= 0x3FE)
                      {
                        d_name = v88->d_name;
                        strcpy(&v155[v86], v88->d_name);
                        memset(&v120, 0, sizeof(v120));
                        if (!stat(v155, &v120))
                        {
                          long long v153 = 0u;
                          long long v154 = 0u;
                          *(_OWORD *)v151 = 0u;
                          long long v152 = 0u;
                          long long v149 = 0u;
                          long long v150 = 0u;
                          *(_OWORD *)v147 = 0u;
                          long long v148 = 0u;
                          long long v145 = 0u;
                          long long v146 = 0u;
                          *(_OWORD *)v143 = 0u;
                          long long v144 = 0u;
                          memset(&v119, 0, sizeof(v119));
                          localtime_r(&v120.st_birthtimespec.tv_sec, &v119);
                          strftime(v151, 0x40uLL, "%F %T", &v119);
                          localtime_r(&v120.st_ctimespec.tv_sec, &v119);
                          strftime(v147, 0x40uLL, "%F %T", &v119);
                          localtime_r(&v120.st_mtimespec.tv_sec, &v119);
                          strftime(v143, 0x40uLL, "%F %T", &v119);
                          int v92 = open(v155, 0x8000);
                          int v93 = v92;
                          if (v92 == -1)
                          {
                            uint64_t v94 = 0;
                          }
                          else
                          {
                            uint64_t v94 = fcntl(v92, 63);
                            close(v93);
                          }
                          uint64_t v95 = +[SPCoreSpotlightIndexer sharedInstance];
                          double v96 = objc_msgSend(NSString, "stringWithFormat:", @"\t%s\t%ld\t%d\t%s\t%s\t%s\n", d_name, v120.st_size, v94, v151, v147, v143);
                          uint64_t v97 = [v96 dataUsingEncoding:4];
                          char v98 = [v95 writeData:v97 toFile:v8];
                          *((unsigned char *)v140 + 24) = v98;

                          if (!*((unsigned char *)v140 + 24)) {
                            goto LABEL_73;
                          }
                        }
                      }
                    }
                    closedir(v87);
                    +[SPConcreteCoreSpotlightIndexer dumpCrashStates:v115 toFile:v8];
                  }
                }
                v99 = +[SPCoreSpotlightIndexer sharedInstance];
                __int16 v100 = [@"===\n\n" dataUsingEncoding:4];
                char v101 = [v99 writeData:v100 toFile:v8];
                *((unsigned char *)v140 + 24) = v101;

                if (*((unsigned char *)v140 + 24))
                {
                  statfs v102 = SPLogDirectory();
                  uint64_t v103 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
                  v104 = [v103 stringByAppendingString:@".log"];
                  BOOL v105 = [v102 stringByAppendingPathComponent:v104];

                  v106 = [v117 stringByAppendingPathComponent:@"activityJournal.1"];
                  v107 = [MEMORY[0x263F08850] defaultManager];
                  [v107 removeItemAtPath:v105 error:0];
                  [v107 copyItemAtPath:v106 toPath:v105 error:0];

                  BOOL v24 = 1;
LABEL_74:

                  goto LABEL_75;
                }
              }
LABEL_73:
              BOOL v24 = 0;
              goto LABEL_74;
            }
          }
          else
          {

            _Block_object_dispose(v155, 8);
          }
        }

        goto LABEL_73;
      }
      uint64_t v25 = +[SPCoreSpotlightIndexer sharedInstance];
      uint64_t v26 = [(time_t *)v114 description];
      uint64_t v27 = [v26 dataUsingEncoding:4];
      char v28 = [v25 writeData:v27 toFile:v8];
      *((unsigned char *)v140 + 24) = v28;

      if (!*((unsigned char *)v140 + 24)) {
        goto LABEL_72;
      }
      int v29 = +[SPCoreSpotlightIndexer sharedInstance];
      stat v30 = [@"\n\n" dataUsingEncoding:4];
      char v31 = [v29 writeData:v30 toFile:v8];
      *((unsigned char *)v140 + 24) = v31;

      if (!*((unsigned char *)v140 + 24))
      {
LABEL_72:

        goto LABEL_73;
      }
      if (![v9 length]) {
        goto LABEL_39;
      }
      __int16 v32 = [(time_t *)v114 objectForKeyedSubscript:@"GroupAssignments"];
      unsigned int v33 = [v32 objectForKeyedSubscript:v9];
      v111 = v32;

      if (!v33) {
        goto LABEL_36;
      }
      uint64_t v34 = [v32 objectForKeyedSubscript:@"com.apple.searchd"];

      if (!v34) {
        goto LABEL_36;
      }
      int v35 = dispatch_group_create();
      dispatch_group_enter(v35);
      *(void *)v155 = 0;
      v156 = v155;
      uint64_t v157 = 0x3032000000;
      long long v158 = __Block_byref_object_copy_;
      long long v159 = __Block_byref_object_dispose_;
      id v160 = 0;
      index = self->_index;
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_2;
      v134[3] = &unk_264507370;
      id v135 = v9;
      int v137 = v155;
      int v37 = v35;
      unsigned int v136 = v37;
      SISynchedOpWithBlock((uint64_t)index, 3, v134);
      dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      v110 = v37;
      if ([*((id *)v156 + 5) count])
      {
        uint64_t v38 = [*((id *)v156 + 5) objectForKeyedSubscript:*MEMORY[0x263F01DC8]];
        v109 = (void *)v38;
        if (!v38) {
          goto LABEL_23;
        }
        uint64_t v39 = +[SPCoreSpotlightIndexer sharedInstance];
        double v40 = [NSString stringWithFormat:@"\n   AttributeChangeDate = %@\n", v38];
        double v41 = [v40 dataUsingEncoding:4];
        char v42 = [v39 writeData:v41 toFile:v8];
        *((unsigned char *)v140 + 24) = v42;

        uint64_t v43 = (void *)v38;
        if (!*((unsigned char *)v140 + 24))
        {
LABEL_69:
        }
        else
        {
LABEL_23:
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id obj = *((id *)v156 + 5);
          uint64_t v44 = [obj countByEnumeratingWithState:&v130 objects:v161 count:16];
          if (v44)
          {
            v113 = *(time_t **)v131;
            while (2)
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(time_t **)v131 != v113) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v46 = *(void *)(*((void *)&v130 + 1) + 8 * i);
                __int16 v47 = [*((id *)v156 + 5) objectForKeyedSubscript:v46];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v48 = (void *)[[NSString alloc] initWithData:v47 encoding:4];
                  if (![v48 length])
                  {
                    uint64_t v49 = [v47 description];

                    uint64_t v48 = (void *)v49;
                  }
                  uint64_t v50 = +[SPCoreSpotlightIndexer sharedInstance];
                  uint64_t v51 = [NSString stringWithFormat:@"   %@ = %@\n", v46, v48];
                  uint64_t v52 = [v51 dataUsingEncoding:4];
                  char v53 = [(id)v50 writeData:v52 toFile:v8];
                  *((unsigned char *)v140 + 24) = v53;

                  LOBYTE(v50) = *((unsigned char *)v140 + 24) == 0;
                  if (v50)
                  {

                    uint64_t v43 = v109;
                    goto LABEL_69;
                  }
                }
              }
              uint64_t v44 = [obj countByEnumeratingWithState:&v130 objects:v161 count:16];
              if (v44) {
                continue;
              }
              break;
            }
          }

          uint64_t v54 = +[SPCoreSpotlightIndexer sharedInstance];
          long long v55 = [@"\n\n" dataUsingEncoding:4];
          char v56 = [v54 writeData:v55 toFile:v8];
          *((unsigned char *)v140 + 24) = v56;

          BOOL v57 = *((unsigned char *)v140 + 24) == 0;
          if (!v57) {
            goto LABEL_35;
          }
        }

        _Block_object_dispose(v155, 8);
LABEL_71:

        goto LABEL_72;
      }
LABEL_35:

      _Block_object_dispose(v155, 8);
LABEL_36:
      if (!v118) {
        goto LABEL_38;
      }
      long long v58 = dispatch_group_create();
      dispatch_group_enter(v58);
      v124[0] = MEMORY[0x263EF8330];
      v124[1] = 3221225472;
      v124[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_4;
      v124[3] = &unk_2645073C0;
      v124[4] = self;
      id v125 = v9;
      id v126 = v118;
      id v129 = &v139;
      id v127 = v8;
      int v59 = v58;
      v128 = v59;
      int v60 = (void *)MEMORY[0x223C48320](v124);
      __int16 v61 = sIndexQueue;
      __int16 v62 = _setup_block(v60, 0, 6003);
      dispatch_async(v61, v62);

      dispatch_group_wait(v59, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v63 = *((unsigned char *)v140 + 24) == 0;

      if (!v63)
      {
LABEL_38:

        goto LABEL_39;
      }
      goto LABEL_71;
    }
  }
  BOOL v24 = 0;
LABEL_75:
  _Block_object_dispose(&v139, 8);

  return v24;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readyIndex:0];
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v6[0] = *(void *)(a1 + 32);
    [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    long long v5 = *(_OWORD *)(a1 + 40);
    id v4 = (id)v5;
    if (SIGetCSAttributes()) {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      if ((unint64_t)[v4 count] >= 2)
      {
        long long v5 = [v4 objectAtIndexedSubscript:1];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count])
        {
          size_t v6 = [v5 objectAtIndexedSubscript:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
          }
        }
      }
    }
  }
  int v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_5;
  v5[3] = &unk_264507398;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 attributesForBundleId:v3 identifier:v4 completion:v5];
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SPCoreSpotlightIndexer sharedInstance];
  long long v5 = [NSString stringWithFormat:@"_kMDItemSDBInfo = %@\n\n", v3];

  id v6 = [v5 dataUsingEncoding:4];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 writeData:v6 toFile:a1[4]];

  id v7 = a1[5];
  dispatch_group_leave(v7);
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_6(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v10 = [NSString stringWithFormat:@"\tbundleID: %@\n", v7];
    uint64_t v11 = [v10 dataUsingEncoding:4];
    char v12 = [v9 writeData:v11 toFile:*(void *)(a1 + 32)];

    if (v12)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_7;
      v15[3] = &unk_2645073E8;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v16 = v13;
      uint64_t v17 = v14;
      [v8 enumerateKeysAndObjectsUsingBlock:v15];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        *a4 = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_7(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    if (!v8)
    {
      id v8 = [v7 description];
    }
    id v9 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v10 = [NSString stringWithFormat:@"\t\t%@: %@\n", v13, v8];
    uint64_t v11 = [v10 dataUsingEncoding:4];
    char v12 = [v9 writeData:v11 toFile:*(void *)(a1 + 32)];

    if ((v12 & 1) == 0)
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

- (void)dropBackgroundAssertions:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_hasAssertion)
  {
    BOOL v3 = a3;
    long long v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      id v7 = "YES";
      if (!self->_suspended) {
        id v7 = "NO";
      }
      *(_DWORD *)stat buf = 138412546;
      id v16 = dataclass;
      __int16 v17 = 2080;
      long long v18 = v7;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Dropping bg assertion on unlock, dataclass:%@, suspended:%s", buf, 0x16u);
    }

    self->_hasAssertion = 0;
    index = self->_index;
    if (index)
    {
      if (v3)
      {
        id v9 = dispatch_group_create();
        dispatch_group_enter(v9);
        index = self->_index;
      }
      else
      {
        id v9 = 0;
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      _DWORD v11[2] = __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke;
      v11[3] = &unk_264507438;
      BOOL v14 = v3;
      uint64_t v10 = v9;
      char v12 = v10;
      id v13 = self;
      SISynchedOpWithBlock((uint64_t)index, 3, v11);
      if (v3) {
        dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      self->_assertionEndTime = 0.0;
    }
  }
}

void __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v4 = *(NSObject **)(a1 + 32);
      dispatch_group_leave(v4);
    }
  }
  else
  {
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke_2;
    void v9[3] = &unk_264507410;
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    SIBackgroundOpBlock(a2, 0, v9);
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (*(unsigned char *)(a1 + 48)) {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v4);
  }
  else
  {
    SISetBgAssertionFlag();
    if (CFAbsoluteTimeGetCurrent() <= *(double *)(*(void *)(a1 + 40) + 80))
    {
      int v5 = SIDropAssertion();
      *(void *)(*(void *)(a1 + 40) + 80) = 0;
      id v6 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 168);
        int v8 = 138412546;
        uint64_t v9 = v7;
        __int16 v10 = 1024;
        int v11 = v5;
        _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "dataclass:%@, SIDropAssertion returned: %d", (uint8_t *)&v8, 0x12u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)closeIndex
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_index)
  {
    BOOL v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      int v5 = "YES";
      if (!self->_suspended) {
        int v5 = "NO";
      }
      int v10 = 138412546;
      int v11 = dataclass;
      __int16 v12 = 2080;
      id v13 = v5;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Closing index, dataclass:%@, suspended:%s", (uint8_t *)&v10, 0x16u);
    }

    id v6 = [(SPConcreteCoreSpotlightIndexer *)self _cancelIdleTimer];
    if (self->_suspended)
    {
      if (!self->_softSuspended && !self->_hasAssertion) {
        SIResumeIndex();
      }
      *(_WORD *)&self->_suspended = 0;
    }
    SICloseIndex();
    self->_index = 0;
    uint64_t v7 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = self->_dataclass;
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_INFO, "Closed index, dataclass:%@", (uint8_t *)&v10, 0xCu);
    }

    id v9 = self;
  }
}

- (void)resumeIndex
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    int v5 = "YES";
    if (!self->_suspended) {
      int v5 = "NO";
    }
    *(_DWORD *)stat buf = 138412546;
    uint64_t v14 = dataclass;
    __int16 v15 = 2080;
    id v16 = v5;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Resuming index, dataclass:%@, suspended:%s", buf, 0x16u);
  }

  if (self->_jwlIndex)
  {
    SICloseJWLIndex();
    self->_jwlIndex = 0;
  }
  if (self->_index && !SIValidIndex() && self->_index && !SIValidIndex())
  {
    [(SPConcreteCoreSpotlightIndexer *)self closeIndex];
    [(SPConcreteCoreSpotlightIndexer *)self openIndex:1];
    return;
  }
  if (!self->_suspended) {
    return;
  }
  if (self->_softSuspended)
  {
    index = self->_index;
  }
  else
  {
    index = self->_index;
    if (!self->_hasAssertion)
    {
      SIResumeIndex();
      goto LABEL_19;
    }
  }
  if (index)
  {
    SIBackgroundOpBlock((uint64_t)index, 9, &__block_literal_global_1061);
LABEL_19:
    uint64_t v7 = self->_index;
    if (v7)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke_2;
      v12[3] = &unk_2645069B0;
      void v12[4] = self;
      SIBackgroundOpBlock((uint64_t)v7, 0, v12);
      if (_os_feature_enabled_impl())
      {
        if ([(NSString *)self->_dataclass isEqualToString:*MEMORY[0x263F08080]]) {
          SISyncIndex();
        }
      }
    }
  }
  [(SPConcreteCoreSpotlightIndexer *)self dropBackgroundAssertions:SIIsLockedIndexingMode()];
  *(_WORD *)&self->_suspended = 0;
  if (self->_index && SIIsLockedIndexingMode())
  {
    int v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_dataclass;
      *(_DWORD *)stat buf = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "reopening index as it was opened for locked indexing, dataclass:%@", buf, 0xCu);
    }

    [(SPConcreteCoreSpotlightIndexer *)self closeIndex];
    [(SPConcreteCoreSpotlightIndexer *)self openIndex:0];
  }
  int v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = self->_dataclass;
    *(_DWORD *)stat buf = 138412290;
    uint64_t v14 = v11;
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "Resumed index, dataclass:%@", buf, 0xCu);
  }
}

void __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a2)
  {
    if (!a3) {
      MEMORY[0x270F4B268](a2);
    }
  }
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    if (_os_feature_enabled_impl()
      && [*(id *)(*(void *)(v4 + 32) + 168) isEqualToString:*MEMORY[0x263F08080]])
    {
      SIReleaseJournalAssertion();
    }
    SISetLockedJournalingState();
    return _SISetAssertedJournalNum();
  }
  return result;
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_readyIndex___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    if (_os_feature_enabled_impl()
      && [*(id *)(*(void *)(v4 + 32) + 168) isEqualToString:*MEMORY[0x263F08080]])
    {
      SIReleaseJournalAssertion();
    }
    SISetLockedJournalingState();
    return _SISetAssertedJournalNum();
  }
  return result;
}

- (void)ensureOpenIndexFiles:(id)a3
{
  if (self->_index)
  {
    id v4 = a3;
    _SIOpenIndexFilesForMerge();
    [(SPConcreteCoreSpotlightIndexer *)self commitUpdates:v4];
  }
}

- (void)suspendIndexForDeviceLock:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (SIIndexIsInPlayback())
  {
LABEL_10:
    if (!self->_suspended)
    {
      uint64_t v14 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        dataclass = self->_dataclass;
        *(_DWORD *)stat buf = 138412290;
        *(void *)uint64_t v38 = dataclass;
        _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_INFO, "Maintenance mode, dataclass:%@", buf, 0xCu);
      }

      if (self->_index)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current >= self->_assertionEndTime)
        {
          BOOL v20 = 0;
        }
        else
        {
          uint64_t v17 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v18 = (int)(self->_assertionEndTime - Current);
            uint64_t v19 = self->_dataclass;
            *(_DWORD *)stat buf = 67109378;
            *(_DWORD *)uint64_t v38 = v18;
            *(_WORD *)&v38[4] = 2112;
            *(void *)&v38[6] = v19;
            _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_INFO, "Holding assertion for: %d seconds dataclass:%@ as the device is locking", buf, 0x12u);
          }

          SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_1064);
          BOOL v20 = 1;
        }
        self->_hasAssertion = v20;
        size_t v21 = dispatch_get_global_queue(2, 2uLL);
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2;
        v35[3] = &unk_264507480;
        void v35[4] = self;
        id v36 = v4;
        dispatch_apply(2uLL, v21, v35);
      }
      *(_WORD *)&self->_BOOL suspended = 257;
    }
    goto LABEL_21;
  }
  int v5 = [(SPConcreteCoreSpotlightIndexer *)self outstandingMaintenance];
  uint64_t v6 = [v5 count];
  uint64_t v7 = (void *)MEMORY[0x263F08080];
  if (!v6 && !atomic_load(&self->_maintenanceOperations))
  {

    goto LABEL_25;
  }
  id v9 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  if (v9 == (void *)*v7)
  {
LABEL_9:

    goto LABEL_10;
  }
  int v10 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  int v11 = v10;
  if (v10 == (void *)*MEMORY[0x263F08088])
  {

    goto LABEL_9;
  }
  __int16 v12 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  id v13 = (void *)*MEMORY[0x263F080A0];

  if (v12 == v13) {
    goto LABEL_10;
  }
LABEL_25:
  if (!self->_index) {
    goto LABEL_21;
  }
  BOOL v24 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = self->_dataclass;
    uint64_t v26 = "YES";
    if (!self->_suspended) {
      uint64_t v26 = "NO";
    }
    *(_DWORD *)stat buf = 138412546;
    *(void *)uint64_t v38 = v25;
    *(_WORD *)&v38[8] = 2080;
    *(void *)&v38[10] = v26;
    _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_INFO, "Suspending index, dataclass:%@, suspended:%s", buf, 0x16u);
  }

  if (self->_suspended) {
    goto LABEL_43;
  }
  self->_BOOL suspending = 1;
  double v27 = CFAbsoluteTimeGetCurrent();
  if (v27 >= self->_assertionEndTime)
  {
    self->_hasAssertion = 0;
    if (_os_feature_enabled_impl()
      && [(NSString *)self->_dataclass isEqualToString:*v7])
    {
      SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_1071);
    }
    self->_BOOL suspended = SIFlushAndSuspendIndex() != 0;
    if (_os_feature_enabled_impl()
      && [(NSString *)self->_dataclass isEqualToString:*v7])
    {
      SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_1074);
    }
    BOOL suspended = self->_suspended;
    *(_WORD *)&self->_softSuspended = 0;
    if (!suspended) {
      goto LABEL_43;
    }
  }
  else
  {
    char v28 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v29 = (int)(self->_assertionEndTime - v27);
      stat v30 = self->_dataclass;
      *(_DWORD *)stat buf = 67109378;
      *(_DWORD *)uint64_t v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(void *)&v38[6] = v30;
      _os_log_impl(&dword_21F1CE000, v28, OS_LOG_TYPE_INFO, "Holding assertion for: %d seconds dataclass:%@ as the device is locking", buf, 0x12u);
    }

    SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_1068);
    self->_hasAssertion = 1;
    *(_WORD *)&self->_BOOL suspended = 1;
    self->_BOOL suspending = 0;
  }
  id v32 = [(SPConcreteCoreSpotlightIndexer *)self _cancelIdleTimer];
LABEL_43:
  unsigned int v33 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
  uint64_t v34 = (void *)*v7;

  if (v33 == v34) {
    _SITemporarilyChangeProtectionClass();
  }
LABEL_21:
  long long v22 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    char v23 = [(SPConcreteCoreSpotlightIndexer *)self dataclass];
    *(_DWORD *)stat buf = 138412546;
    *(void *)uint64_t v38 = 0;
    *(_WORD *)&v38[8] = 2112;
    *(void *)&v38[10] = v23;
    _os_log_impl(&dword_21F1CE000, v22, OS_LOG_TYPE_DEFAULT, "Releasing assertion %@ (%@)", buf, 0x16u);
  }
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return SISetBgAssertionFlag();
  }
  return result;
}

void __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 128);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3;
    void v7[3] = &unk_264507410;
    void v7[4] = v3;
    id v8 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v4, 9, v7);
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) dataclass];
    uint64_t v6 = (void *)*MEMORY[0x263F08080];

    if (v5 == v6)
    {
      _SITemporarilyChangeProtectionClass();
    }
  }
}

void __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    [*(id *)(a1 + 32) ensureOpenIndexFiles:*(void *)(a1 + 40)];
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_1066(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return SISetBgAssertionFlag();
  }
  return result;
}

void __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2_1069(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    MEMORY[0x270F4AFE0](a2);
  }
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3_1072(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return SISetLockedJournalingState();
  }
  return result;
}

- (void)preheat
{
  if (self->_index)
  {
    CFAbsoluteTime v3 = self->_lastPreheat + 30.0;
    if (v3 < CFAbsoluteTimeGetCurrent())
    {
      SIPreHeatIndex();
      self->_lastPreheat = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (void)processDecryptsForBundleID:(id)a3 persona:(id)a4 infos:(id)a5 group:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  id v10 = a5;
  group = a6;
  if (self->_readOnly)
  {
    int v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "processDecryptsForBundleID failed: index is readOnly", buf, 2u);
    }
  }
  else
  {
    int v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
    __int16 v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v18 = objc_msgSend(v17, "decryptInfo", v20, v21);
          [v11 addObject:v18];

          uint64_t v19 = [v17 externalID];
          [v12 addObject:v19];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Process decrypts for  %@", buf, 0xCu);
    }
    *(void *)stat buf = 0;
    objc_initWeak((id *)buf, self);
    if (group) {
      dispatch_group_enter(group);
    }
    id v23 = v12;
    objc_copyWeak(&v27, (id *)buf);
    id v24 = v20;
    id v25 = v21;
    uint64_t v26 = group;
    _MDItemDecrypt();

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
}

void __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[4];
    *(_DWORD *)stat buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = a3;
    _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Process decrypts (%@, %@)", buf, 0x16u);
  }
  id v6 = a3;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 8);
  id v8 = WeakRetained;
  uint64_t v9 = WeakRetained[16];
  if (!v9) {
    uint64_t v9 = WeakRetained[17];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke_1075;
  v11[3] = &unk_2645074A8;
  objc_copyWeak(&v17, a1 + 8);
  id v12 = a1[5];
  id v13 = a1[4];
  id v10 = v6;
  id v14 = v10;
  id v15 = a1[6];
  id v16 = a1[7];
  SIBackgroundOpBlock(v9, 9, v11);

  objc_destroyWeak(&v17);
}

void __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke_1075(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = a1;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v6 = WeakRetained;
  if (!a3)
  {
    id v30 = WeakRetained;
    id v7 = objc_alloc_init(MEMORY[0x263F02A30]);
    [v7 beginArray];
    id v8 = *(void **)(v4 + 48);
    uint64_t v29 = v4;
    id v9 = *(id *)(v4 + 40);
    id v10 = v8;
    id v33 = v7;
    id obj = v9;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v36;
      uint64_t v32 = *MEMORY[0x263EFFD08];
      uint64_t v31 = *MEMORY[0x263F028D0];
      unint64_t v15 = 0x263EFF000uLL;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          int v18 = [v10 objectAtIndexedSubscript:v13 + i];
          id v19 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            [v18 description];
            uint64_t v20 = v12;
            uint64_t v21 = v14;
            id v22 = v10;
            unint64_t v23 = v15;
            id v24 = objc_claimAutoreleasedReturnValue();
            uint64_t v25 = [v24 UTF8String];
            *(_DWORD *)stat buf = 138412546;
            uint64_t v40 = v17;
            __int16 v41 = 2080;
            uint64_t v42 = v25;
            _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_INFO, "Updated attributeSet: %@ %s\n", buf, 0x16u);

            unint64_t v15 = v23;
            id v10 = v22;
            uint64_t v14 = v21;
            uint64_t v12 = v20;
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v18) {
              [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v18];
            }
            else {
            uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
            }
            [v26 setObject:v32 forKeyedSubscript:@"_kMDItemEncryptedData"];
            [v26 setObject:v17 forKeyedSubscript:@"_kMDItemExternalID"];
            [v26 removeObjectForKey:v31];
            [v33 beginArray];
            [v33 encodeString:"__class:CSSearchableItemAttributeSet"];
            [v33 encodeInt64:8];
            [v33 encodeObject:v26];
            [v33 endArray];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        v13 += i;
      }
      while (v12);
    }

    [v33 endArray];
    id v27 = [v33 data];
    uint64_t v4 = v29;
    SISetCodedAttributes();

    id v6 = v30;
  }
  long long v28 = *(NSObject **)(v4 + 64);
  if (v28) {
    dispatch_group_leave(v28);
  }
}

- (void)processImportForBundleID:(id)a3 withURLs:(id)a4 contentTypes:(id)a5 sandboxExtensions:(id)a6 andIdentifiers:(id)a7 options:(int64_t)a8 inGroup:(id)a9 additionalAttributes:(id)a10 computeUpdaterAttributesAfterImport:(BOOL)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v65 = a6;
  id v18 = a7;
  id v19 = v18;
  id v20 = a9;
  id v64 = a10;
  if (v16 && v18)
  {
    if (self->_readOnly)
    {
      uint64_t v21 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_21F1CE000, v21, OS_LOG_TYPE_DEFAULT, "processImportForBundleID failed: index is readOnly", buf, 2u);
      }
    }
    else
    {
      uint64_t v21 = [MEMORY[0x263F02B48] sharedManager];
      [v21 loadExtensions];
      int v22 = [v18 count];
      unint64_t v23 = (int *)malloc_type_malloc(4 * v22, 0x100004052888210uLL);
      id v24 = v23;
      if (v22 >= 1)
      {
        for (uint64_t i = 0; i != v22; ++i)
          v23[i] = i;
      }
      __compar[0] = MEMORY[0x263EF8330];
      __compar[1] = 3221225472;
      __compar[2] = __187__SPConcreteCoreSpotlightIndexer_processImportForBundleID_withURLs_contentTypes_sandboxExtensions_andIdentifiers_options_inGroup_additionalAttributes_computeUpdaterAttributesAfterImport___block_invoke;
      __compar[3] = &unk_2645074F8;
      id v62 = v17;
      id v71 = v62;
      qsort_b(v24, v22, 4uLL, __compar);
      char v53 = v24;
      id v54 = v17;
      if (v22 < 1)
      {
        uint64_t v51 = 0;
        long long v28 = 0;
        uint64_t v48 = 0;
        __int16 v47 = 0;
        uint64_t v52 = 0;
      }
      else
      {
        long long v55 = v21;
        char v56 = v20;
        BOOL v57 = v15;
        char v26 = 0;
        id v27 = 0;
        long long v28 = 0;
        uint64_t v29 = 0;
        BOOL v63 = 0;
        int v69 = 0;
        uint64_t v30 = v22;
        id v61 = v16;
        long long v58 = v19;
        do
        {
          uint64_t v31 = *v24;
          id v68 = v24 + 1;
          char v67 = [v16 objectAtIndexedSubscript:v31];
          uint64_t v32 = [v62 objectAtIndexedSubscript:v31];
          uint64_t v66 = [v19 objectAtIndexedSubscript:v31];
          id v33 = [v65 objectAtIndexedSubscript:v31];
          int v34 = [v69 isEqual:v32];
          if ((v26 & 1) != 0 || !v34)
          {
            long long v38 = v28;
            if (v63)
            {
              [v29 endArray];
              uint64_t v39 = [v29 data];
              uint64_t v40 = (void *)[v39 copy];
              [v63 setImportData:v40];

              [v63 setFileAttributeSets:v28];
              processItemsForImport(self, v57, v55, v63, v27, v56, a11);
            }
            __int16 v41 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:13 jobOptions:a8];

            [v41 setFileType:v32];
            id v42 = v32;

            id v43 = objc_alloc_init(MEMORY[0x263F02A30]);
            [v43 beginArray];
            [MEMORY[0x263EFF980] array];
            long long v36 = v44 = v27;

            uint64_t v45 = [MEMORY[0x263EFF980] array];

            int v69 = v42;
            BOOL v63 = v41;
            long long v37 = v43;
            long long v35 = (void *)v45;
            id v19 = v58;
          }
          else
          {
            long long v35 = v27;
            long long v36 = v28;
            long long v37 = v29;
          }
          uint64_t v29 = v37;
          [v37 encodeNSString:v33];
          uint64_t v46 = (void *)[objc_alloc(MEMORY[0x263F02AE8]) initWithItemContentType:v32];
          [v46 setContentURL:v67];
          [v46 addAttributesFromDictionary:v64];
          long long v28 = v36;
          [v36 addObject:v46];
          id v27 = v35;
          [v35 addObject:v66];

          char v26 = 1;
          --v30;
          id v16 = v61;
          id v24 = v68;
        }
        while (v30);
        __int16 v47 = v63;
        if (v63)
        {
          uint64_t v48 = v29;
          [v29 endArray];
          uint64_t v49 = [v29 data];
          uint64_t v50 = (void *)[v49 copy];
          [v63 setImportData:v50];

          [v63 setFileAttributeSets:v28];
          id v20 = v56;
          uint64_t v21 = v55;
          uint64_t v51 = v27;
          id v15 = v57;
          processItemsForImport(self, v57, v55, v63, v51, v56, a11);
        }
        else
        {
          id v20 = v56;
          uint64_t v21 = v55;
          uint64_t v51 = v27;
          id v15 = v57;
          uint64_t v48 = v29;
        }
        uint64_t v52 = v69;
      }
      free(v53);

      id v17 = v54;
    }
  }
}

uint64_t __187__SPConcreteCoreSpotlightIndexer_processImportForBundleID_withURLs_contentTypes_sandboxExtensions_andIdentifiers_options_inGroup_additionalAttributes_computeUpdaterAttributesAfterImport___block_invoke(uint64_t a1, int *a2, int *a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*a2];
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*a3];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v269 = *MEMORY[0x263EF8340];
  if (a3) {
    goto LABEL_2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
  from = (id *)(a1 + 136);
  if ([WeakRetained index] == a2)
  {

LABEL_11:
    if (*(unsigned char *)(a1 + 168) && *(unsigned char *)(*(void *)(a1 + 32) + 72))
    {
      SISetBgAssertionFlag();
      SIDeleteBgAssertionFile();
      uint64_t v9 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v9 + 25))
      {
        SIFlushAndSuspendIndex();
        uint64_t v9 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v9 + 72) = 0;
    }
    if (*(void *)(*(void *)(a1 + 32) + 136) != a2
      && *(void *)(a1 + 40)
      && *(void *)(a1 + 48)
      && (*(unsigned char *)(a1 + 144) & 0x10) != 0
      && SIGetAccumulatedSizeForGroup() >= 134217729)
    {
      uint64_t v10 = *(void *)(a1 + 128);
      if (!v10) {
        return;
      }
      id v182 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1004 userInfo:0];
      (*(void (**)(uint64_t))(v10 + 16))(v10);
      goto LABEL_4;
    }
    v183 = (unsigned __int8 *)a1;
    uint64_t v167 = a2;
    if (*(void *)(a1 + 56))
    {
      v175 = [(id)objc_opt_class() _stateInfoAttributeNameWithClientStateName:*(void *)(a1 + 56)];
    }
    else
    {
      v175 = 0;
    }
    if (*(void *)(a1 + 64) && *(void *)(a1 + 48) && *(void *)(a1 + 56))
    {
      uint64_t v11 = (const void *)SICopyCachedCSClientState();
      uint64_t v12 = v11;
      if (!v11 || !CFEqual(v11, *(CFTypeRef *)(a1 + 64)))
      {
        char v142 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
          __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_3();
        }

        uint64_t v143 = *(void *)(a1 + 128);
        if (v143)
        {
          long long v144 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1006 userInfo:0];
          (*(void (**)(uint64_t, void *))(v143 + 16))(v143, v144);
        }
        if (v12) {
          CFRelease(v12);
        }
        goto LABEL_257;
      }
      CFRelease(v12);
    }
    __int16 v253 = 0;
    char v252 = 0;
    v250[0] = 0;
    v250[1] = v250;
    v250[2] = 0x2020000000;
    v251[0] = 0;
    v248[0] = 0;
    v248[1] = v248;
    v248[2] = 0x2020000000;
    v249[0] = 0;
    if ((*(unsigned char *)(a1 + 144) & 0x20) != 0)
    {
      uint64_t v13 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)stat buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "Skipped admission check on critical index job for %@", buf, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) checkAdmission:*(void *)(a1 + 48) background:0 didBeginThrottle:v251 didEndThrottle:v249 live:&v253 slow:(char *)&v253 + 1 memoryPressure:&v252];
    }
    id v15 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_2([*(id *)(a1 + 40) length], a1, v268, v15);
    }

    id v176 = *(id *)(a1 + 40);
    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    uint64_t v16 = _MDPlistContainerCreateWithBytes();
    if (v16)
    {
      long long v246 = 0uLL;
      uint64_t v247 = 0;
      _MDPlistGetRootPlistObjectFromPlist();
      memset(buf, 0, sizeof(buf));
      if (_MDPlistGetPlistObjectType() == 240)
      {
        *(_OWORD *)stat buf = v246;
        *(void *)&uint8_t buf[16] = v247;
        unsigned int Count = _MDPlistArrayGetCount();
      }
      else
      {
        unsigned int Count = 0;
      }
      CFTypeRef cf = (CFTypeRef)v16;
      uint64_t v242 = 0;
      v243 = &v242;
      uint64_t v244 = 0x2020000000;
      char v245 = 0;
      *(void *)stat buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v266 = __Block_byref_object_copy_;
      *(void *)&long long v267 = __Block_byref_object_dispose_;
      *((void *)&v267 + 1) = 0;
      if (Count)
      {
        unsigned int v181 = Count;
        int v18 = 0;
        v166 = 0;
        v169 = 0;
        id v177 = 0;
        uint64_t v162 = *MEMORY[0x263F02020];
        uint64_t v161 = *MEMORY[0x263F01DD0];
        uint64_t v159 = *MEMORY[0x263F02768];
        uint64_t v160 = *MEMORY[0x263F025F8];
        uint64_t v158 = *MEMORY[0x263F02780];
        uint64_t v154 = *MEMORY[0x263F02938];
        uint64_t v155 = *MEMORY[0x263F02010];
        uint64_t v153 = *MEMORY[0x263F01C68];
        BOOL v19 = 1;
        while (1)
        {
          long long v240 = 0uLL;
          uint64_t v241 = 0;
          long long v238 = v246;
          uint64_t v239 = v247;
          _MDPlistArrayGetPlistObjectAtIndex();
          long long v238 = v240;
          uint64_t v239 = v241;
          if (_MDPlistGetPlistObjectType() != 240
            || (long long v238 = v240, v239 = v241, _MDPlistArrayGetCount() < 3))
          {
            uint64_t v21 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v238 = v240;
              uint64_t v239 = v241;
              int PlistObjectType = _MDPlistGetPlistObjectType();
              long long v238 = v240;
              uint64_t v239 = v241;
              int v23 = _MDPlistArrayGetCount();
              LODWORD(v263) = 67109376;
              DWORD1(v263) = PlistObjectType;
              WORD4(v263) = 1024;
              *(_DWORD *)((char *)&v263 + 10) = v23;
              _os_log_impl(&dword_21F1CE000, v21, OS_LOG_TYPE_DEFAULT, "Unexpected PlistBytes %d %d", (uint8_t *)&v263, 0xEu);
            }

            goto LABEL_54;
          }
          long long v238 = 0uLL;
          uint64_t v239 = 0;
          long long v263 = v240;
          uint64_t v264 = v241;
          _MDPlistArrayGetPlistObjectAtIndex();
          long long v263 = v238;
          uint64_t v264 = v239;
          if (_MDPlistGetPlistObjectType() == 241) {
            break;
          }
LABEL_54:
          BOOL v19 = ++v18 < v181;
          if (v181 == v18) {
            goto LABEL_188;
          }
        }
        long long v263 = 0uLL;
        uint64_t v264 = 0;
        long long v236 = v238;
        uint64_t v237 = v239;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          long long v236 = v263;
          uint64_t v237 = v264;
          uint64_t IntValue = _MDPlistNumberGetIntValue();
        }
        else
        {
          uint64_t IntValue = 0;
        }
        long long v236 = 0uLL;
        uint64_t v237 = 0;
        long long v234 = v238;
        uint64_t v235 = v239;
        if (_MDPlistDictionaryGetPlistObjectForKey()
          && (long long v234 = v236,
              uint64_t v235 = v237,
              int v24 = _MDPlistGetPlistObjectType(),
              uint64_t v25 = &_os_log_internal,
              v24 == 246))
        {
          id v26 = &_os_log_internal;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v234) = 0;
            _os_log_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_DEFAULT, "Found _kMDItemEncryptedData", (uint8_t *)&v234, 2u);
          }

          BOOL v27 = IntValue == 0;
          int v28 = 1;
        }
        else
        {
          if (!IntValue) {
            goto LABEL_83;
          }
          BOOL v27 = 0;
          int v28 = 0;
        }
        long long v234 = 0uLL;
        uint64_t v235 = 0;
        *(_OWORD *)v262 = v238;
        *(void *)&v262[16] = v239;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          *(_OWORD *)v262 = v234;
          *(void *)&v262[16] = v235;
          if (_MDPlistGetPlistObjectType() == 244
            || (*(_OWORD *)v262 = v234, *(void *)&v262[16] = v235, _MDPlistGetPlistObjectType() == 245))
          {
            *(_OWORD *)v262 = v234;
            *(void *)&v262[16] = v235;
            uint64_t v29 = _MDPlistContainerCopyObject();
            uint64_t v30 = (void *)v29;
            if (v29) {
              int v31 = v28;
            }
            else {
              int v31 = 0;
            }
            uint64_t v32 = (void *)v29;
            if (v31 == 1)
            {
              id v33 = &_os_log_internal;
              id v34 = &_os_log_internal;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v262 = 138412290;
                *(void *)&v262[4] = v30;
                _os_log_impl(&dword_21F1CE000, v33, OS_LOG_TYPE_DEFAULT, "Matched _kMDItemEncryptedData with id %@", v262, 0xCu);
              }

              long long v35 = [CSDecryptInfo alloc];
              *(_OWORD *)v262 = v236;
              *(void *)&v262[16] = v237;
              long long v36 = [(CSDecryptInfo *)v35 initWithPlistObject:v262 externalID:v32];
              if (v36)
              {
                long long v37 = v169;
                if (!v169) {
                  long long v37 = objc_opt_new();
                }
                v169 = v37;
                [v37 addObject:v36];
              }

              uint64_t v30 = v32;
            }
            if (v27)
            {
              v171 = 0;
              id v172 = 0;
              v170 = 0;
            }
            else
            {
              memset(v262, 0, 24);
              long long v232 = 0uLL;
              uint64_t v233 = 0;
              long long v230 = 0uLL;
              uint64_t v231 = 0;
              long long v260 = v238;
              uint64_t v261 = v239;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && (long long v260 = *(_OWORD *)v262,
                    uint64_t v261 = *(void *)&v262[16],
                    _MDPlistGetPlistObjectType() == 247))
              {
                long long v260 = *(_OWORD *)v262;
                uint64_t v261 = *(void *)&v262[16];
                id v172 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                id v172 = 0;
              }
              long long v260 = v238;
              uint64_t v261 = v239;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && ((long long v260 = v232, v261 = v233, _MDPlistGetPlistObjectType() == 244)
                 || (long long v260 = v232, v261 = v233, _MDPlistGetPlistObjectType() == 245)))
              {
                long long v260 = v232;
                uint64_t v261 = v233;
                v171 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                v171 = 0;
              }
              long long v260 = v238;
              uint64_t v261 = v239;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && ((long long v260 = v230, v261 = v231, _MDPlistGetPlistObjectType() == 244)
                 || (long long v260 = v230, v261 = v231, _MDPlistGetPlistObjectType() == 245)))
              {
                long long v260 = v230;
                uint64_t v261 = v231;
                v170 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                v170 = 0;
              }
              if (!v177)
              {
                id v177 = [MEMORY[0x263EFF9A0] dictionary];
              }
              uint64_t v39 = [NSString stringWithFormat:@"%@:%@", v30, *((void *)v183 + 6)];
              if (v172 && v171 && v170 && v30)
              {
                uint64_t v40 = objc_alloc_init(CSImportInfo);
                [(CSImportInfo *)v40 setContentURL:v172];
                [(CSImportInfo *)v40 setContentType:v171];
                [(CSImportInfo *)v40 setSandboxExtension:v170];
                [(CSImportInfo *)v40 setExternalID:v30];
                [v177 setObject:v40 forKey:v39];
              }
              else
              {
                __int16 v41 = [MEMORY[0x263EFF9D0] null];
                [v177 setObject:v41 forKey:v39];

                id v42 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v260) = 138412290;
                  *(void *)((char *)&v260 + 4) = v172;
                  _os_log_error_impl(&dword_21F1CE000, v42, OS_LOG_TYPE_ERROR, "RequiresImport missing: URL:%@", (uint8_t *)&v260, 0xCu);
                }

                id v43 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v260) = 138412290;
                  *(void *)((char *)&v260 + 4) = v171;
                  _os_log_error_impl(&dword_21F1CE000, v43, OS_LOG_TYPE_ERROR, "RequiresImport missing: ContentType:%@", (uint8_t *)&v260, 0xCu);
                }

                logForCSLogCategoryDefault();
                uint64_t v40 = (CSImportInfo *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v40->super, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v260) = 138412290;
                  *(void *)((char *)&v260 + 4) = v170;
                  _os_log_error_impl(&dword_21F1CE000, &v40->super, OS_LOG_TYPE_ERROR, "RequiresImport missing: SBX:%@", (uint8_t *)&v260, 0xCu);
                }
              }

              uint64_t v30 = v32;
            }
LABEL_112:
            long long v234 = 0uLL;
            uint64_t v235 = 0;
            *(_OWORD *)v262 = v238;
            *(void *)&v262[16] = v239;
            if (_MDPlistDictionaryGetPlistObjectForKey()
              || (*(_OWORD *)v262 = v238,
                  *(void *)&v262[16] = v239,
                  _MDPlistDictionaryGetPlistObjectForKey()))
            {
              *(_OWORD *)v262 = v234;
              *(void *)&v262[16] = v235;
              v178 = (void *)_MDPlistContainerCopyObject();
            }
            else
            {
              v178 = 0;
            }
            if ([*((id *)v183 + 6) isEqualToString:@"com.apple.MobileSMS"])
            {
              if (v178)
              {
                memset(v262, 0, 24);
                long long v232 = 0uLL;
                uint64_t v233 = 0;
                long long v230 = 0uLL;
                uint64_t v231 = 0;
                long long v260 = 0uLL;
                uint64_t v261 = 0;
                long long v228 = 0uLL;
                uint64_t v229 = 0;
                long long v226 = 0uLL;
                uint64_t v227 = 0;
                long long v224 = 0uLL;
                uint64_t v225 = 0;
                uint64_t v44 = objc_opt_new();
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey()
                  && (long long v222 = *(_OWORD *)v262,
                      uint64_t v223 = *(void *)&v262[16],
                      (v173 = (void *)_MDPlistContainerCopyObject()) != 0))
                {
                  [v44 setObject:v173 forKey:v162];
                }
                else
                {
                  v173 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  long long v222 = v232;
                  uint64_t v223 = v233;
                  uint64_t v55 = _MDPlistContainerCopyObject();
                  if (v55) {
                    [v44 setObject:v55 forKey:v161];
                  }
                }
                else
                {
                  uint64_t v55 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey()
                  && (v222 = v230, v223 = v231, (int v164 = (void *)_MDPlistContainerCopyObject()) != 0))
                {
                  [v44 setObject:v164 forKey:v160];
                }
                else
                {
                  int v164 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  long long v222 = v260;
                  uint64_t v223 = v261;
                  char v56 = (void *)_MDPlistContainerCopyObject();
                  if (v56) {
                    [v44 setObject:v56 forKey:v159];
                  }
                }
                else
                {
                  char v56 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  long long v222 = v228;
                  uint64_t v223 = v229;
                  BOOL v57 = (void *)_MDPlistContainerCopyObject();
                  if (v57) {
                    [v44 setObject:v57 forKey:v158];
                  }
                }
                else
                {
                  BOOL v57 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  long long v222 = v226;
                  uint64_t v223 = v227;
                  long long v58 = (void *)_MDPlistContainerCopyObject();
                  if (v58) {
                    [v44 setObject:v58 forKey:@"kMDItemCollaborationSourceChat"];
                  }
                }
                else
                {
                  long long v58 = 0;
                }
                long long v222 = v238;
                uint64_t v223 = v239;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  long long v222 = v224;
                  uint64_t v223 = v225;
                  int v59 = (void *)_MDPlistContainerCopyObject();

                  if (v59) {
                    [v44 setObject:v59 forKey:@"kMDItemCollaborationSourceMessage"];
                  }
                }
                else
                {
                  int v59 = v30;
                }
                uint64_t v157 = (void *)v55;
                if (kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueueOnce != -1) {
                  dispatch_once(&kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueueOnce, &__block_literal_global_1118);
                }
                int v60 = kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue;
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2;
                block[3] = &unk_264506598;
                id v217 = v178;
                id v61 = v44;
                id v218 = v61;
                id v62 = v59;
                id v219 = v62;
                id v63 = v173;
                uint64_t v64 = *((void *)v183 + 4);
                id v220 = v63;
                uint64_t v221 = v64;
                dispatch_async(v60, block);

                uint64_t v30 = v62;
              }
            }
            else if (v178)
            {
              if (([*((id *)v183 + 6) isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0|| (objc_msgSend(*((id *)v183 + 6), "isEqualToString:", @"com.apple.CloudDocs.iCloudDriveFileProvider") & 1) != 0|| objc_msgSend(*((id *)v183 + 6), "isEqualToString:", @"com.apple.CloudDocs.iCloudDriveFileProviderManaged"))
              {
                id v163 = [NSString stringWithFormat:@"(_kMDItemBundleID = '%@') && (FPCollaborationIdentifier == '%@' || _kMDItemCollaborationIdentifier == '%@')", @"com.apple.MobileSMS", v178, v178];
                id v45 = objc_alloc_init(MEMORY[0x263F02AD0]);
                v257[0] = v162;
                v257[1] = v161;
                v257[2] = v160;
                v257[3] = v159;
                v257[4] = v158;
                v257[5] = v155;
                v257[6] = v154;
                uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v257 count:7];
                [v45 setFetchAttributes:v46];
                v174 = v30;
                __int16 v47 = [v45 fetchAttributes];
                uint64_t v48 = [v47 count];

                v209[0] = MEMORY[0x263EF8330];
                v209[1] = 3221225472;
                v209[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1140;
                v209[3] = &unk_2645075C0;
                uint64_t v213 = v48;
                long long v211 = &v242;
                id v156 = v46;
                id v210 = v156;
                long long v212 = buf;
                CFTypeRef v214 = cf;
                int v215 = v18;
                uint64_t v49 = (void *)MEMORY[0x223C48320](v209);
                dispatch_group_t v50 = dispatch_group_create();
                uint64_t v51 = +[SPCoreSpotlightIndexer sharedInstance];
                v207[0] = MEMORY[0x263EF8330];
                v207[1] = 3221225472;
                v207[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4_1142;
                v207[3] = &unk_264506B90;
                uint64_t v52 = v50;
                __int16 v208 = v52;
                char v53 = [v51 taskForQueryWithQueryString:v163 queryContext:v45 eventHandler:0 resultsHandler:v49 completionHandler:v207];

                if (v53)
                {
                  [v53 setCritical:v183[169]];
                  dispatch_group_enter(v52);
                  id v54 = +[SPCoreSpotlightIndexer sharedInstance];
                  [v54 startQueryTask:v53];

                  dispatch_group_wait(v52, 0xFFFFFFFFFFFFFFFFLL);
                }
                else
                {
                  uint64_t v65 = *((void *)v183 + 16);
                  if (v65)
                  {
                    uint64_t v66 = [MEMORY[0x263F087E8] errorWithDomain:v153 code:-1000 userInfo:0];
                    (*(void (**)(uint64_t, void *))(v65 + 16))(v65, v66);
                  }
                  CFRelease(cf);
                }

                if (!v53)
                {
                  char v72 = 0;
                  goto LABEL_185;
                }
                uint64_t v30 = v174;
              }
              else
              {
                BOOL v73 = [MEMORY[0x263EFF9D0] null];
                char v74 = [v178 isEqual:v73];

                if ((v74 & 1) == 0)
                {
                  v75 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v79 = *((void *)v183 + 6);
                    *(_DWORD *)v262 = 138412546;
                    *(void *)&v262[4] = v178;
                    *(_WORD *)&v262[12] = 2112;
                    *(void *)&v262[14] = v79;
                    _os_log_error_impl(&dword_21F1CE000, v75, OS_LOG_TYPE_ERROR, "Got collaboration identifier for item that isn't Messages or FileProvider: %@ bundleID:%@", v262, 0x16u);
                  }
                }
              }
            }
            v174 = v30;
            if ([*((id *)v183 + 6) isEqualToString:@"com.apple.shortcuts"])
            {
              *(_OWORD *)v262 = v240;
              *(void *)&v262[16] = v241;
              if (_MDPlistArrayGetCount() >= 4)
              {
                memset(v262, 0, 24);
                long long v232 = v240;
                uint64_t v233 = v241;
                _MDPlistArrayGetPlistObjectAtIndex();
                long long v232 = *(_OWORD *)v262;
                uint64_t v233 = *(void *)&v262[16];
                if (_MDPlistGetPlistObjectType() == 241)
                {
                  long long v232 = 0uLL;
                  uint64_t v233 = 0;
                  long long v230 = *(_OWORD *)v262;
                  uint64_t v231 = *(void *)&v262[16];
                  if (_MDPlistDictionaryGetPlistObjectForKey())
                  {
                    long long v230 = v232;
                    uint64_t v231 = v233;
                    if (_MDPlistGetPlistObjectType() == 240)
                    {
                      long long v230 = v232;
                      uint64_t v231 = v233;
                      if (_MDPlistArrayGetCount())
                      {
                        long long v230 = 0uLL;
                        uint64_t v231 = 0;
                        long long v260 = v232;
                        uint64_t v261 = v233;
                        _MDPlistArrayGetPlistObjectAtIndex();
                        long long v260 = v230;
                        uint64_t v261 = v231;
                        char v67 = (void *)_MDPlistContainerCopyObject();
                        id v68 = v67;
                        if (v67)
                        {
                          char v69 = [v67 BOOLValue];

                          if (v69)
                          {
                            long long v230 = 0uLL;
                            uint64_t v231 = 0;
                            long long v260 = v238;
                            uint64_t v261 = v239;
                            if (_MDPlistDictionaryGetPlistObjectForKey())
                            {
                              long long v260 = v230;
                              uint64_t v261 = v231;
                              long long v70 = (void *)_MDPlistContainerCopyObject();
                              if (v70)
                              {
                                id v71 = v166;
                                if (!v166)
                                {
                                  id v71 = [MEMORY[0x263EFF9C0] set];
                                }
                                v166 = v71;
                                [v71 addObject:v70];
                              }
                            }
                            else
                            {
                              long long v70 = 0;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            memset(v262, 0, 24);
            long long v232 = v238;
            uint64_t v233 = v239;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              long long v232 = *(_OWORD *)v262;
              uint64_t v233 = *(void *)&v262[16];
              int v76 = (void *)_MDPlistContainerCopyObject();
              long long v232 = 0uLL;
              uint64_t v233 = 0;
              long long v230 = v238;
              uint64_t v231 = v239;
              if (_MDPlistDictionaryGetPlistObjectForKey())
              {
                long long v230 = v232;
                uint64_t v231 = v233;
                uint64_t v77 = (void *)_MDPlistContainerCopyObject();
                char v78 = [MEMORY[0x263F02A50] sharedInstance];
                [v78 addAppContainerOID:v77 forBundle:*((void *)v183 + 6) fpBundle:v76];
              }
            }
            char v72 = 1;
LABEL_185:

            if ((v72 & 1) == 0) {
              goto LABEL_199;
            }
            goto LABEL_54;
          }
        }
        long long v38 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_1(v258, &v259, v38);
        }

LABEL_83:
        v171 = 0;
        id v172 = 0;
        v170 = 0;
        uint64_t v30 = 0;
        goto LABEL_112;
      }
      id v177 = 0;
      v169 = 0;
      v166 = 0;
LABEL_188:
      int v80 = [*((id *)v183 + 6) isEqualToString:@"com.apple.shortcuts"];
      char v81 = cf;
      if (v166) {
        int v82 = v80;
      }
      else {
        int v82 = 0;
      }
      if (v82 == 1 && [v166 count])
      {
        id v83 = objc_alloc_init(MEMORY[0x263F02AD0]);
        [v83 setInternal:1];
        [v83 setLowPriority:0];
        uint64_t v84 = *MEMORY[0x263F02398];
        v256[0] = *MEMORY[0x263F022A0];
        v256[1] = v84;
        char v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v256 count:2];
        [v83 setFetchAttributes:v85];

        uint64_t v255 = *MEMORY[0x263F08098];
        size_t v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v255 count:1];
        [v83 setProtectionClasses:v86];

        [v83 setBundleIDs:&unk_26D0C8D40];
        uint64_t v87 = [MEMORY[0x263EFF9C0] set];
        v204[0] = MEMORY[0x263EF8330];
        v204[1] = 3221225472;
        v204[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1160;
        v204[3] = &unk_264507610;
        id v205 = v166;
        id v88 = v87;
        id v206 = v88;
        v89 = (void *)MEMORY[0x223C48320](v204);
        int v90 = +[SPCoreSpotlightIndexer sharedInstance];
        v202[0] = MEMORY[0x263EF8330];
        v202[1] = 3221225472;
        v202[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1165;
        v202[3] = &unk_264507638;
        v202[4] = *((void *)v183 + 4);
        id v91 = v88;
        id v203 = v91;
        int v92 = [v90 taskForQueryWithQueryString:@"(true)" queryContext:v83 eventHandler:0 resultsHandler:v89 completionHandler:v202];

        int v93 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v240) = 0;
          _os_log_impl(&dword_21F1CE000, v93, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] indexFromBundle start", (uint8_t *)&v240, 2u);
        }

        uint64_t v94 = +[SPCoreSpotlightIndexer sharedInstance];
        [v94 startQueryTask:v92];

        char v81 = cf;
      }
      if (*((unsigned char *)v243 + 24))
      {
        uint64_t v95 = (const void *)_MDPlistContainerCreateWithObject();
        uint64_t Bytes = _MDPlistContainerGetBytes();
        uint64_t v97 = [MEMORY[0x263EFF8F8] dataWithBytes:Bytes length:_MDPlistContainerGetLength()];

        CFRelease(v95);
        id v176 = (id)v97;
        char v81 = cf;
      }
      CFRelease(v81);
      BOOL v19 = 0;
LABEL_199:

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v242, 8);
      if (v19) {
        goto LABEL_256;
      }
    }
    else
    {
      id v177 = 0;
      v169 = 0;
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v190[0] = MEMORY[0x263EF8330];
    v190[1] = 3221225472;
    v190[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1169;
    v190[3] = &unk_264507660;
    objc_copyWeak(v198, from);
    id v177 = v177;
    id v191 = v177;
    unsigned __int8 v199 = v183[168];
    id v99 = *((id *)v183 + 6);
    __int16 v100 = (void *)*((void *)v183 + 18);
    id v192 = v99;
    v198[1] = v100;
    id v101 = *((id *)v183 + 16);
    uint64_t v193 = *((void *)v183 + 4);
    id v195 = v101;
    int v196 = v250;
    uint64_t v197 = v248;
    char v200 = v253;
    id v194 = *((id *)v183 + 9);
    char v201 = HIBYTE(v253);
    v198[2] = *(id *)&Current;
    id v102 = (id)[v190 copy];

    uint64_t v103 = v183;
    if (*((void *)v183 + 5))
    {
      if (v183[145])
      {
        uint64_t v104 = [*((id *)v183 + 4) _interestedAttributesMaskForBundleID:*((void *)v183 + 6)];
        if (v104)
        {
          uint64_t v105 = [objc_alloc(MEMORY[0x263F02A48]) initWithData:v176];
          long long v188 = 0u;
          long long v189 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          id v106 = (id)[objc_alloc(MEMORY[0x263F02AF0]) initWithItems:v105 itemsContent:0];
          uint64_t v107 = [v106 countByEnumeratingWithState:&v186 objects:v254 count:16];
          id v179 = (void *)v105;
          id v180 = v102;
          v108 = 0;
          uint64_t v109 = 0;
          if (v107)
          {
            uint64_t v110 = *(void *)v187;
            do
            {
              for (uint64_t i = 0; i != v107; ++i)
              {
                if (*(void *)v187 != v110) {
                  objc_enumerationMutation(v106);
                }
                v112 = *(void **)(*((void *)&v186 + 1) + 8 * i);
                uint64_t v113 = [(id)objc_opt_class() checkItemOfInterest:v112 mask:v104];
                int v114 = [v112 isUpdate];
                if (v113) {
                  int v115 = v114;
                }
                else {
                  int v115 = 0;
                }
                if (v115 == 1)
                {
                  if (!v108) {
                    v108 = objc_opt_new();
                  }
                  [v108 addObject:v112];
                  v109 |= v113;
                }
              }
              uint64_t v107 = [v106 countByEnumeratingWithState:&v186 objects:v254 count:16];
            }
            while (v107);
          }

          id v102 = v180;
          [*((id *)v183 + 4) notifyClientForItemUpdates:*((void *)v183 + 6) updatedItems:v108 batchMask:v109];

          uint64_t v103 = v183;
        }
      }
    }
    size_t v116 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
    {
      id v146 = v102;
      uint64_t v148 = *((void *)v103 + 6);
      uint64_t v147 = *((void *)v103 + 7);
      uint64_t v149 = [*((id *)v103 + 10) length];
      *(_DWORD *)stat buf = 138412802;
      *(void *)&uint8_t buf[4] = v148;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v147;
      *(_WORD *)&buf[22] = 2048;
      v266 = (uint64_t (*)(uint64_t, uint64_t))v149;
      _os_log_debug_impl(&dword_21F1CE000, v116, OS_LOG_TYPE_DEBUG, "SISetCodedAttributes, bundleID:%@, state:\"%@\"(%ld bytes)", buf, 0x20u);
      id v102 = v146;
    }

    id v117 = v102;
    if (v177) {
      BOOL v118 = 0;
    }
    else {
      BOOL v118 = v252 == 0;
    }
    if (v118) {
      int v119 = 0;
    }
    else {
      int v119 = 4;
    }
    stat v120 = v183;
    unsigned int v121 = v119 & 0xFFFFFFFE | (*((_DWORD *)v183 + 36) >> 8) & 1 | (*((_DWORD *)v183 + 36) >> 14) & 2;
    if (v183[169]) {
      int v122 = v121;
    }
    else {
      int v122 = v121 | 8;
    }
    int locked = SIGetLockedJournalingState();
    int v124 = locked;
    if (v183[168] && !locked) {
      SISetLockedJournalingState();
    }
    id v152 = v117;
    LODWORD(v151) = v122;
    long long v150 = v175;
    id v125 = v169;
    int v126 = SISetCodedAttributes();
    if (v183[168]
      && *(void *)(*((void *)v183 + 4) + 136) != v167
      && (int)SIGetLockedJournalingState() >> 1 != v124 >> 1)
    {
      v184[0] = MEMORY[0x263EF8330];
      v184[1] = 3221225472;
      v184[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1172;
      v184[3] = &unk_264507688;
      objc_copyWeak(&v185, from);
      id v127 = v184;
      v128 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
      id v129 = objc_msgSend(v127, "copy", v175, v151, blockRoutine, v152);

      id v130 = v129;
      void *v128 = v167;
      v128[1] = v130;
      _SIScheduleOperationPostIndexUpdate();

      objc_destroyWeak(&v185);
      stat v120 = v183;
      id v125 = v169;
    }
    if (objc_msgSend(v125, "count", v150)) {
      [*((id *)v120 + 4) processDecryptsForBundleID:*((void *)v120 + 6) persona:*((void *)v120 + 11) infos:v125 group:0];
    }
    if (!v126)
    {
      long long v131 = (void *)*((void *)v120 + 15);
      uint64_t v132 = *((void *)v120 + 19);
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      SDTraceAdd(3, v131, v132, *((void **)v120 + 6), *((void **)v120 + 7), v133 - *((double *)v120 + 20));
      uint64_t v134 = *((void *)v120 + 16);
      if (v134)
      {
        id v135 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
        (*(void (**)(uint64_t, void *))(v134 + 16))(v134, v135);

        stat v120 = v183;
      }
    }
    unsigned int v136 = logForCSLogCategoryIndex();
    int v137 = v136;
    os_signpost_id_t v138 = *((void *)v120 + 19);
    if (v138 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v136))
    {
      uint64_t v139 = [*((id *)v120 + 6) UTF8String];
      v140 = (void *)*((void *)v183 + 5);
      if (v140) {
        uint64_t v141 = [v140 length];
      }
      else {
        uint64_t v141 = 0;
      }
      long long v145 = (void *)*((void *)v183 + 12);
      if (v145) {
        long long v145 = (void *)[v145 length];
      }
      *(_DWORD *)stat buf = 136446979;
      *(void *)&uint8_t buf[4] = v139;
      *(_WORD *)&unsigned char buf[12] = 2081;
      *(void *)&buf[14] = "indexFromBundle";
      *(_WORD *)&buf[22] = 2050;
      v266 = (uint64_t (*)(uint64_t, uint64_t))v141;
      LOWORD(v267) = 2050;
      *(void *)((char *)&v267 + 2) = v145;
      _os_signpost_emit_with_name_impl(&dword_21F1CE000, v137, OS_SIGNPOST_INTERVAL_END, v138, "IndexLatency", "BundleID=%{public, signpost.telemetry:string1}s Method=%{private, signpost.telemetry:string2}s AddLength=%{public, signpost.telemetry:number1}lu DeleteLength=%{public, signpost.telemetry:number2}lu  enableTelemetry=YES ", buf, 0x2Au);
    }

    objc_destroyWeak(v198);
LABEL_256:

    _Block_object_dispose(v248, 8);
    _Block_object_dispose(v250, 8);
LABEL_257:

    return;
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 136));
  uint64_t v8 = [v7 jwlIndex];

  if (v8 == a2) {
    goto LABEL_11;
  }
LABEL_2:
  uint64_t v4 = *(void *)(a1 + 128);
  if (!v4) {
    return;
  }
  id v182 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
  (*(void (**)(uint64_t))(v4 + 16))(v4);
LABEL_4:
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1116()
{
  CFAbsoluteTime v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.corespotlight.collaborationquery", v0);
  uint64_t v2 = (void *)kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue;
  kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue = (uint64_t)v1;
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"(_kMDItemBundleID='com.apple.CloudDocs.MobileDocumentsFileProvider' || _kMDItemBundleID='com.apple.CloudDocs.iCloudDriveFileProvider' ||  _kMDItemBundleID='com.apple.CloudDocs.iCloudDriveFileProviderManaged') && (FPCollaborationIdentifier='%@' || _kMDItemCollaborationIdentifier='%@') && kMDItemCollaborationSourceChat!=* && kMDItemCollaborationSourceMessage!=*", *(void *)(a1 + 32), *(void *)(a1 + 32)];
  id v3 = objc_alloc_init(MEMORY[0x263F02AD0]);
  v19[0] = *MEMORY[0x263F02730];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [v3 setFetchAttributes:v4];
  uint64_t v5 = [v4 count];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3;
  v12[3] = &unk_264507570;
  uint64_t v18 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v15 = v6;
  uint64_t v16 = v7;
  id v17 = *(id *)(a1 + 32);
  uint64_t v8 = (void *)MEMORY[0x223C48320](v12);
  uint64_t v9 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v10 = [v9 taskForQueryWithQueryString:v2 queryContext:v3 eventHandler:0 resultsHandler:v8 completionHandler:&__block_literal_global_1130];

  uint64_t v11 = +[SPCoreSpotlightIndexer sharedInstance];
  [v11 startQueryTask:v10];
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v19 = v5;
    uint64_t v20 = v6;
    uint64_t v9 = *(void *)(a1 + 72);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4;
    void v13[3] = &unk_264507548;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void **)(a1 + 64);
    id v16 = v10;
    uint64_t v17 = v11;
    id v18 = v12;
    [a5 enumerateQueryResults:v9 stringCache:0 usingBlock:v13];
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4(uint64_t a1, id *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x223C480D0]();
  uint64_t v5 = (objc_class *)MEMORY[0x263F02AE8];
  id v6 = *a2;
  uint64_t v7 = (void *)[[v5 alloc] initWithAttributes:*(void *)(a1 + 32)];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:*(void *)(a1 + 40) domainIdentifier:*(void *)(a1 + 48) attributeSet:v7];
  [v8 setIsUpdate:1];
  uint64_t v9 = [*(id *)(a1 + 56) owner];
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5;
  v11[3] = &unk_264506B90;
  id v12 = *(id *)(a1 + 64);
  [v9 indexSearchableItems:v10 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v6 forBundleID:@"com.apple.CloudDocs.MobileDocumentsFileProvider" options:0 completionHandler:v11];
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5_cold_1();
    }
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1140(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v18 = v5;
    uint64_t v19 = v6;
    uint64_t v9 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3_1141;
    void v13[3] = &unk_264507598;
    long long v12 = *(_OWORD *)(a1 + 32);
    id v10 = (id)v12;
    long long v14 = v12;
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = v11;
    int v17 = *(_DWORD *)(a1 + 72);
    [a5 enumerateQueryResults:v9 stringCache:0 usingBlock:v13];
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3_1141(uint64_t a1, uint64_t a2)
{
  context = (void *)MEMORY[0x223C480D0]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v4 = objc_opt_new();
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263F02010];
    uint64_t v7 = *MEMORY[0x263F02938];
    do
    {
      id v8 = *(id *)(a2 + 8 * v5);
      uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
      id v10 = v9;
      if (v8)
      {
        if ([(__CFString *)v9 isEqualToString:v6])
        {
          uint64_t v11 = v4;
          id v12 = v8;
          id v13 = @"kMDItemCollaborationSourceChat";
        }
        else if ([(__CFString *)v10 isEqualToString:v7])
        {
          uint64_t v11 = v4;
          id v12 = v8;
          id v13 = @"kMDItemCollaborationSourceMessage";
        }
        else
        {
          uint64_t v11 = v4;
          id v12 = v8;
          id v13 = v10;
        }
        [v11 setObject:v12 forKey:v13];
      }

      ++v5;
    }
    while (v5 < [*(id *)(a1 + 32) count]);
  }
  long long v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v14)
  {
    uint64_t v15 = (void *)_MDPlistContainerCopyRootObject();
    uint64_t v16 = [v15 mutableCopy];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    long long v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  uint64_t v19 = [v14 objectAtIndex:*(unsigned int *)(a1 + 64)];
  uint64_t v20 = (void *)[v19 mutableCopy];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v20 atIndexedSubscript:*(unsigned int *)(a1 + 64)];
  uint64_t v21 = [v20 objectAtIndex:2];
  int v22 = (void *)[v21 mutableCopy];
  [v20 setObject:v22 atIndexedSubscript:2];
  [v22 addEntriesFromDictionary:v4];
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4_1142(uint64_t a1)
{
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1160(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v12 = v5;
    uint64_t v13 = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1161;
    void v9[3] = &unk_2645075E8;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [a5 enumerateQueryResults:2 stringCache:0 usingBlock:v9];
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1161(uint64_t a1, id *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = *a2;
  id v5 = a2[1];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 BOOLValue];
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    int v7 = 0;
    if (!v4) {
      goto LABEL_9;
    }
  }
  if ((([*(id *)(a1 + 32) containsObject:v4] ^ 1 | v7) & 1) == 0)
  {
    id v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] set flag for %@", buf, 0xCu);
    }

    uint64_t v12 = @":EA:_kMDItemHasTopHitAppShortcuts";
    uint64_t v13 = *MEMORY[0x263EFFB40];
    uint64_t v9 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F02AE8]) initWithAttributes:v9];
    id v11 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v4 domainIdentifier:0 attributeSet:v10];
    [v11 setBundleID:@"com.apple.application"];
    [v11 setIsUpdate:1];
    [*(id *)(a1 + 40) addObject:v11];
  }
LABEL_9:
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1165(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) owner];
  id v2 = [*(id *)(a1 + 40) allObjects];
  [v3 indexSearchableItems:v2 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:*MEMORY[0x263F08098] forBundleID:@"com.apple.application" options:0 completionHandler:&__block_literal_global_1168];
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1166(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = logForCSLogCategoryDefault();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1166_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] indexFromBundle complete", v5, 2u);
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1169(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v5 = WeakRetained;
  if (!v3) {
    [WeakRetained dirty:0];
  }
  if (*(void *)(a1 + 32) && !*(unsigned char *)(a1 + 112))
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    int v7 = [MEMORY[0x263EFF980] array];
    id v8 = [MEMORY[0x263EFF980] array];
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    id v10 = (void *)_SIFilterValidatedCSImports();
    if ([v10 count])
    {
      uint64_t v26 = a1;
      BOOL v27 = v5;
      id v28 = v3;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v25 = v10;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * i)];
            uint64_t v17 = [v16 contentURL];
            [v6 addObject:v17];

            uint64_t v18 = [v16 contentType];
            [v7 addObject:v18];

            uint64_t v19 = [v16 sandboxExtension];
            [v8 addObject:v19];

            uint64_t v20 = [v16 externalID];
            [v9 addObject:v20];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v13);
      }

      a1 = v26;
      id v5 = v27;
      LOBYTE(v24) = 1;
      [v27 processImportForBundleID:*(void *)(v26 + 40) withURLs:v6 contentTypes:v7 sandboxExtensions:v8 andIdentifiers:v9 options:*(void *)(v26 + 96) inGroup:0 additionalAttributes:MEMORY[0x263EFFA78] computeUpdaterAttributesAfterImport:v24];
      id v3 = v28;
      id v10 = v25;
    }
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v21 = [*(id *)(a1 + 48) owner];
    int v22 = [v21 extensionDelegate];

    LOBYTE(v23) = *(unsigned char *)(a1 + 114);
    [*(id *)(a1 + 48) completeIndexingItemFor:*(void *)(a1 + 40) delegate:v22 didBeginThrottle:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) didEndThrottle:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) error:v3 live:*(unsigned __int8 *)(a1 + 113) queue:*(double *)(a1 + 104) slow:*(void *)(a1 + 56) startTime:v23 completionHandler:*(void *)(a1 + 64)];
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1172(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    group = dispatch_group_create();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained restartAttachmentImport:group maxCount:256 depth:0];

    uint64_t v6 = sIndexQueue;
    int v7 = _setup_block(&__block_literal_global_1175, 0, 8330);
    dispatch_group_notify(group, v6, v7);
  }
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1173()
{
  v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "restartAttachmentImport journalingOnly notify done", v1, 2u);
  }
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 forBundleID:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1177(void *a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1;
  uint64_t v138 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v120[5] = MEMORY[0x263EF8330];
    v120[6] = 3221225472;
    v120[7] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2;
    v120[8] = &unk_264507700;
    id v5 = a1 + 12;
    long long v122 = *((_OWORD *)a1 + 6);
    id v102 = a1 + 4;
    id v121 = (id)a1[4];
    AnalyticsSendEventLazy();
    if (v3[13] && *v102 && (v3[14] & 0x10) != 0 && SIGetAccumulatedSizeForGroup() >= 134217729)
    {
      uint64_t v86 = v3[11];
      if (!v86) {
        goto LABEL_138;
      }
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1004 userInfo:0];
      (*(void (**)(uint64_t, id))(v86 + 16))(v86, v8);
    }
    else
    {
      if (*v5)
      {
        uint64_t v6 = *(void *)(v3[5] + 168);
        v129[0] = @"delete";
        v129[1] = v6;
        int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:2];
        SDTransactionCreate(v7);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = 0;
      }
      if (v3[13])
      {
        uint64_t v9 = *(void *)(v3[5] + 168);
        v128[0] = @"add";
        v128[1] = v9;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
        SDTransactionCreate(v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }
      if (v3[6])
      {
        uint64_t v12 = (const void *)SICopyCachedCSClientState();
        if (!v12)
        {
          uint64_t v62 = v3[11];
          id v63 = (void *)MEMORY[0x263F087E8];
          uint64_t v64 = *MEMORY[0x263F01C68];
          uint64_t v65 = -1006;
LABEL_110:
          uint64_t v66 = [v63 errorWithDomain:v64 code:v65 userInfo:0];
          (*(void (**)(uint64_t, void *))(v62 + 16))(v62, v66);

          goto LABEL_136;
        }
        uint64_t v13 = v12;
        if (!CFEqual(v12, (CFTypeRef)v3[6]))
        {
          uint64_t v67 = v3[11];
          id v68 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1006 userInfo:0];
          (*(void (**)(uint64_t, void *))(v67 + 16))(v67, v68);

          CFRelease(v13);
          goto LABEL_136;
        }
        CFRelease(v13);
      }
      if (!*v5)
      {
LABEL_25:
        if (!v3[13]) {
          goto LABEL_132;
        }
        __int16 v100 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)v3[10], "count"));
        int v92 = objc_opt_new();
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id obj = (id)v3[10];
        uint64_t v103 = [obj countByEnumeratingWithState:&v116 objects:v127 count:16];
        if (!v103)
        {
          unsigned int v61 = 0;
          goto LABEL_115;
        }
        id v89 = v11;
        id v90 = v8;
        LOBYTE(v16) = 0;
        uint64_t v99 = *(void *)v117;
        uint64_t v107 = (void *)*MEMORY[0x263EFFD08];
        uint64_t v109 = (void *)*MEMORY[0x263F028D0];
        uint64_t v17 = (void *)*MEMORY[0x263F02378];
        uint64_t v18 = (void *)*MEMORY[0x263F02380];
        uint64_t v110 = (void *)*MEMORY[0x263F01FA8];
        uint64_t v95 = *MEMORY[0x263F01F98];
        uint64_t v91 = *MEMORY[0x263F01A20];
        int v93 = v3;
        uint64_t v19 = v100;
        while (1)
        {
          for (uint64_t i = 0; i != v103; ++i)
          {
            if (*(void *)v117 != v99) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            context = (void *)MEMORY[0x223C480D0]();
            if ([v21 isUpdate]
              && [(id)objc_opt_class() checkItemOfInterest:v21 mask:0])
            {
              [v92 addObject:v21];
            }
            if ((v16 & 1) != objc_msgSend(v21, "isUpdate", v89, v90) && objc_msgSend(v19, "count"))
            {
              v115[0] = MEMORY[0x263EF8330];
              v115[1] = 3221225472;
              v115[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2_1197;
              v115[3] = &unk_264506B90;
              v115[4] = v3[5];
              id v22 = (id)[v115 copy];

              if (!SISetCSAttributes()) {
                CFRelease(v22);
              }
              id v23 = objc_alloc_init(MEMORY[0x263EFF980]);

              uint64_t v19 = v23;
            }
            int v16 = [v21 isUpdate];
            uint64_t v24 = (void *)*v102;
            id v25 = v21;
            id v26 = v24;
            BOOL v27 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)stat buf = 138412290;
              uint64_t v131 = (uint64_t)v25;
              _os_log_debug_impl(&dword_21F1CE000, v27, OS_LOG_TYPE_DEBUG, "creating dictionary for %@", buf, 0xCu);
            }

            id v106 = v25;
            id v28 = [v25 uniqueIdentifier];

            uint64_t v105 = v26;
            if (!v26 || !v28)
            {
              long long v35 = logForCSLogCategoryIndex();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                int v60 = [v25 uniqueIdentifier];
                *(_DWORD *)stat buf = 138412546;
                uint64_t v131 = (uint64_t)v105;
                __int16 v132 = 2112;
                double v133 = v60;
                _os_log_debug_impl(&dword_21F1CE000, v35, OS_LOG_TYPE_DEBUG, "Failure for %@ / %@", buf, 0x16u);
              }
              long long v36 = 0;
              goto LABEL_96;
            }
            long long v29 = [v25 attributeSet];
            long long v30 = [MEMORY[0x263EFF9A0] dictionary];
            [v30 setObject:v26 forKey:@"_kMDItemBundleID"];
            long long v31 = [v106 uniqueIdentifier];
            [v30 setObject:v31 forKey:@"_kMDItemExternalID"];

            long long v32 = [v106 uniqueIdentifier];
            uint64_t v108 = [v32 length];

            [v30 setObject:v107 forKey:@"_kMDItemWillModify"];
            uint64_t v33 = [v29 textContent];
            id v101 = v19;
            int v98 = v16;
            uint64_t v97 = i;
            v111 = v30;
            uint64_t v113 = v29;
            if (v33)
            {
              double v96 = (void *)v33;
              uint64_t v34 = v109;
              [v30 setObject:v33 forKey:v109];
            }
            else
            {
              long long v37 = [v29 HTMLContentData];
              long long v38 = v37;
              if (v37
                && ([v37 length],
                    _MDPlainTextFromHTMLData(),
                    (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                double v96 = (void *)v39;
                [v30 setObject:v39 forKey:v109];
              }
              else
              {
                double v96 = 0;
              }

              uint64_t v34 = v109;
            }
            uint64_t v40 = [v29 attributeDictionary];
            char v41 = 0;
            do
            {
              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              id v42 = v40;
              uint64_t v43 = [v42 countByEnumeratingWithState:&v123 objects:buf count:16];
              if (!v43) {
                goto LABEL_86;
              }
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v124;
              do
              {
                for (uint64_t j = 0; j != v44; ++j)
                {
                  if (*(void *)v124 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  __int16 v47 = *(void **)(*((void *)&v123 + 1) + 8 * j);
                  if (v41)
                  {
                    id v48 = [v47 keyName];
                  }
                  else
                  {
                    id v48 = v47;
                  }
                  uint64_t v49 = v48;
                  if (([v17 isEqualToString:v48] & 1) == 0
                    && ([v18 isEqualToString:v49] & 1) == 0
                    && ([v49 hasSuffix:@"Dictionary"] & 1) == 0
                    && ([v49 hasSuffix:@"ContactProperties"] & 1) == 0
                    && ([v49 hasSuffix:@"Persons"] & 1) == 0)
                  {
                    if ([v34 isEqualToString:v49])
                    {
                      dispatch_group_t v50 = [v113 textContent];
                      [v111 setObject:v50 forKeyedSubscript:v34];
                    }
                    else
                    {
                      int v51 = [v110 isEqualToString:v49];
                      dispatch_group_t v50 = [v113 attributeForKey:v49];
                      if (v51)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v52 = [v50 absoluteString];
                          [v111 setObject:v52 forKeyedSubscript:v110];
                        }
                        else
                        {
                          [v111 setObject:v50 forKeyedSubscript:v110];
                        }
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v53 = [v50 localizedStrings];

                          dispatch_group_t v50 = (void *)v53;
                        }
                        uint64_t v34 = v109;
                        if (v50)
                        {
                          [v111 setObject:v50 forKey:v49];
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v108 += [v50 length];
                          }
                          goto LABEL_83;
                        }
                        id v54 = [v42 objectForKeyedSubscript:v49];

                        if (v54 == v107) {
                          objc_msgSend(v111, "setObject:forKey:");
                        }
                        dispatch_group_t v50 = 0;
                      }
                      uint64_t v34 = v109;
                    }
LABEL_83:
                  }
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v123 objects:buf count:16];
              }
              while (v44);
LABEL_86:

              if (v41) {
                goto LABEL_89;
              }
              uint64_t v40 = [v113 customAttributeDictionary];

              char v41 = 1;
            }
            while (v40);
            id v42 = 0;
LABEL_89:
            uint64_t v3 = v93;
            uint64_t v55 = [v111 objectForKeyedSubscript:v95];
            uint64_t v19 = v101;
            int v16 = v98;
            uint64_t i = v97;
            if (v55)
            {
            }
            else if ([v105 isEqualToString:@"com.apple.mobilemail"])
            {
              [v111 setObject:v91 forKeyedSubscript:v95];
            }
            if (([v106 isUpdate] & 1) == 0)
            {
              char v56 = [NSNumber numberWithUnsignedInteger:v108];
              [v111 setObject:v56 forKey:@"_kMDItemStorageSize"];
            }
            long long v36 = (const char *)v111;
            long long v35 = v113;
LABEL_96:

            BOOL v57 = logForCSLogCategoryIndex();
            BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
            if (v36)
            {
              if (v58)
              {
                *(_DWORD *)stat buf = 138412546;
                uint64_t v131 = (uint64_t)v106;
                __int16 v132 = 2112;
                double v133 = v36;
                _os_log_debug_impl(&dword_21F1CE000, v57, OS_LOG_TYPE_DEBUG, "Got metadata for %@: %@", buf, 0x16u);
              }

              int v59 = (char *)v36;
              [v19 addObject:v36];
            }
            else
            {
              if (v58)
              {
                *(_DWORD *)stat buf = 138412290;
                uint64_t v131 = (uint64_t)v106;
                _os_log_debug_impl(&dword_21F1CE000, v57, OS_LOG_TYPE_DEBUG, "No dictionary for %@; skipping",
                  buf,
                  0xCu);
              }

              int v59 = 0;
            }
          }
          uint64_t v103 = [obj countByEnumeratingWithState:&v116 objects:v127 count:16];
          if (!v103)
          {
            __int16 v100 = v19;
            if (v16) {
              unsigned int v61 = 0x20000;
            }
            else {
              unsigned int v61 = 0;
            }
            id v11 = v89;
            id v8 = v90;
LABEL_115:

            if ([(id)v3[5] _shouldNotifyForSearchableItemUpdates:v3[4]]
              && [v92 count])
            {
              char v69 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:17];
              [v69 setUpdatedItems:v92];
              long long v70 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
                -[SPConcreteCoreSpotlightIndexer notifyClientForItemUpdates:updatedItems:batchMask:](v92, v70);
              }

              id v71 = +[SpotlightDaemonServer sharedDaemonServer];
              uint64_t v72 = v3[4];
              BOOL v73 = [(id)v3[5] dataclass];
              LOBYTE(v72) = [v71 handleJob:v69 bundleID:v72 protectionClass:v73 completionHandler:&__block_literal_global_1200];

              if ((v72 & 1) == 0)
              {
                char v74 = +[SPCoreSpotlightIndexer sharedInstance];
                v75 = [v74 extensionDelegate];

                if (v75) {
                  [v75 indexRequestsPerformDataJob:v69 forBundle:*v102 completionHandler:&__block_literal_global_1203];
                }
              }
            }
            int v76 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v87 = v3[4];
              id v88 = (const char *)v3[13];
              *(_DWORD *)stat buf = 138412802;
              uint64_t v131 = v87;
              __int16 v132 = 2048;
              double v133 = v88;
              __int16 v134 = 2048;
              uint64_t v135 = v61;
              _os_log_debug_impl(&dword_21F1CE000, v76, OS_LOG_TYPE_DEBUG, "SISetCSAttributes, bundleID:%@, adds:%ld, flags:0x%08lx", buf, 0x20u);
            }

            v114[0] = MEMORY[0x263EF8330];
            v114[1] = 3221225472;
            v114[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1204;
            v114[3] = &unk_264506B90;
            v114[4] = v3[5];
            id v77 = (id)[v114 copy];

            if (SISetCSAttributes())
            {
              setClientStateForIndexing((void *)v3[5], (void *)v3[4], (void *)v3[9], (void *)v3[7], (void *)v3[11], v11);
            }
            else
            {
              uint64_t v78 = v3[11];
              if (v78)
              {
                uint64_t v79 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
                (*(void (**)(uint64_t, void *))(v78 + 16))(v78, v79);
              }
              CFRelease(v77);
            }

LABEL_132:
            int v80 = logForCSLogCategoryIndex();
            char v81 = v80;
            os_signpost_id_t v82 = v3[15];
            if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
            {
              uint64_t v83 = [ (id) v3[4] UTF8String];
              uint64_t v85 = v3[12];
              uint64_t v84 = v3[13];
              *(_DWORD *)stat buf = 136446979;
              uint64_t v131 = v83;
              __int16 v132 = 2081;
              double v133 = "indexSearchableItems";
              __int16 v134 = 2050;
              uint64_t v135 = v84;
              __int16 v136 = 2050;
              uint64_t v137 = v85;
              _os_signpost_emit_with_name_impl(&dword_21F1CE000, v81, OS_SIGNPOST_INTERVAL_END, v82, "IndexLatency", "BundleID=%{public, signpost.telemetry:string1}s Method=%{private, signpost.telemetry:string2}s AddCount=%{public, signpost.telemetry:number1}lu DeleteCount=%{public, signpost.telemetry:number2}lu  enableTelemetry=YES ", buf, 0x2Au);
            }

            goto LABEL_136;
          }
        }
      }
      uint64_t v14 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1177_cold_2();
      }

      uint64_t v15 = v3[5];
      if (v3[13])
      {
        SIDeleteCSAttributes();
        goto LABEL_25;
      }
      v120[0] = MEMORY[0x263EF8330];
      v120[1] = 3221225472;
      v120[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1196;
      v120[3] = &unk_264506B90;
      v120[4] = v15;
      [v120 copy];
      if (SIDeleteCSAttributes())
      {
        setClientStateForIndexing((void *)v3[5], (void *)v3[4], (void *)v3[9], (void *)v3[7], (void *)v3[11], v8);
        goto LABEL_136;
      }
      uint64_t v62 = v3[11];
      if (v62)
      {
        id v63 = (void *)MEMORY[0x263F087E8];
        uint64_t v64 = *MEMORY[0x263F01C68];
        uint64_t v65 = -1;
        goto LABEL_110;
      }
LABEL_136:
    }
LABEL_138:

    return;
  }
  uint64_t v4 = a1[11];
  if (v4)
  {
    id v112 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1196(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty:0];
}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2_1197(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty:0];
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1198(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1();
  }
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1201(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_1();
  }
}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1204(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty];
}

- (void)validateConcreteIndexer:(BOOL)a3 outFileDescriptor:(int)a4
{
  if ((a4 & 0x80000000) == 0)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 1;
    v31[0] = 0;
    v31[1] = v31;
    void v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy_;
    void v31[4] = __Block_byref_object_dispose_;
    id v32 = 0;
    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v29[0] = 0;
    v29[1] = v29;
    void v29[2] = 0x3032000000;
    void v29[3] = __Block_byref_object_copy_;
    void v29[4] = __Block_byref_object_dispose_;
    id v30 = 0;
    id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    dispatch_group_t v7 = dispatch_group_create();
    id v8 = sIndexQueue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke;
    void v22[3] = &unk_264507810;
    void v22[4] = self;
    int v27 = a4;
    uint64_t v9 = v7;
    BOOL v28 = a3;
    id v23 = v9;
    uint64_t v24 = v31;
    id v25 = v29;
    id v26 = v33;
    id v10 = _setup_block(v22, 0, 8794);
    dispatch_group_async(v9, v8, v10);

    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v12 = sIndexQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1217;
    v15[3] = &unk_264507838;
    int v20 = a4;
    BOOL v21 = a3;
    void v15[4] = self;
    uint64_t v17 = v33;
    uint64_t v18 = v31;
    uint64_t v19 = v29;
    uint64_t v13 = v11;
    int v16 = v13;
    uint64_t v14 = _setup_block(v15, 0, 8825);
    dispatch_group_notify(v9, v12, v14);

    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(const void **)(v2 + 128);
  if (!v3 || *(unsigned char *)(v2 + 24) || *(unsigned char *)(v2 + 26))
  {
    int v4 = *(_DWORD *)(a1 + 72);
    if (v4 < 0)
    {
      id v5 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(v6 + 128);
        int v8 = *(unsigned __int8 *)(v6 + 24);
        int v9 = *(unsigned __int8 *)(v6 + 26);
        LODWORD(v6) = *(unsigned __int8 *)(v6 + 97);
        *(_DWORD *)stat buf = 134218752;
        uint64_t v21 = v7;
        __int16 v22 = 1024;
        int v23 = v8;
        __int16 v24 = 1024;
        int v25 = v9;
        __int16 v26 = 1024;
        int v27 = v6;
        _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d", buf, 0x1Eu);
      }
    }
    else
    {
      dprintf(v4, "Validate concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d\n", v3, *(unsigned __int8 *)(v2 + 24), *(unsigned __int8 *)(v2 + 26), *(unsigned __int8 *)(v2 + 97));
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1207;
    void v13[3] = &unk_2645077E8;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    char v19 = *(unsigned char *)(a1 + 76);
    int v18 = *(_DWORD *)(a1 + 72);
    long long v16 = *(_OWORD *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 64);
    SIBackgroundOpBlock(v10, 0, v13);
  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1207(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    int v4 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v4);
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    _SIValidateActivityJournal();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_2(uint64_t a1, const __CFString *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  Copy = (__CFString *)CFStringCreateCopy(0, a2);
  if (([(__CFString *)Copy isEqualToString:@"com.apple.searchd"] & 1) == 0)
  {
    int v8 = malloc_type_calloc(1uLL, (a4 >> 3) + 1, 0xBBDFDEFDuLL);
    int v9 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
    uint64_t v10 = v9;
    if (a4)
    {
      unint64_t v11 = a4;
      uint64_t v12 = v9;
      do
      {
        uint64_t v13 = *a3++;
        *v12++ = v13;
        --v11;
      }
      while (v11);
    }
    int v14 = *(_DWORD *)(a1 + 72);
    if (v14 < 0)
    {
      long long v16 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(a1 + 76)) {
          uint64_t v17 = "Deletes";
        }
        else {
          uint64_t v17 = "Items";
        }
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 168);
        *(_DWORD *)stat buf = 136315906;
        uint64_t v39 = v17;
        __int16 v40 = 2112;
        uint64_t v41 = v18;
        __int16 v42 = 2080;
        uint64_t v43 = [(__CFString *)Copy UTF8String];
        __int16 v44 = 1024;
        int v45 = a4;
        _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validate %s %@ %s BatchCount:%d\n", buf, 0x26u);
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 76)) {
        uint64_t v15 = "Deletes";
      }
      else {
        uint64_t v15 = "Items";
      }
      dprintf(v14, "### Validate %s %s %s BatchCount:%d\n", v15, (const char *)[*(id *)(*(void *)(a1 + 32) + 168) UTF8String], (const char *)-[__CFString UTF8String](Copy, "UTF8String"), a4);
    }
    char v19 = NSNumber;
    int v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:Copy];
    uint64_t v21 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + a4);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v21 forKeyedSubscript:Copy];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    void v28[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1211;
    void v28[3] = &unk_264507798;
    id v32 = v10;
    unint64_t v33 = a4;
    char v34 = v8;
    char v36 = *(unsigned char *)(a1 + 76);
    int v35 = *(_DWORD *)(a1 + 72);
    __int16 v22 = Copy;
    long long v29 = v22;
    long long v31 = *(_OWORD *)(a1 + 56);
    id v30 = *(id *)(a1 + 40);
    int v23 = (void *)MEMORY[0x223C48320](v28);
    __int16 v24 = *(void **)(a1 + 32);
    uint64_t v25 = v24[16];
    __int16 v26 = [NSString stringWithFormat:@"%@=%@", *MEMORY[0x263F01E20], v22];
    uint64_t v37 = *MEMORY[0x263F02438];
    int v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    LOBYTE(v24) = [v24 _startInternalQueryWithIndex:v25 query:v26 fetchAttributes:v27 resultsHandler:v23];

    if ((v24 & 1) == 0)
    {
      free(v8);
      free(v10);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1211(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3 == 1)
  {
    unint64_t v6 = *(void *)(a1 + 72);
    if (*(unsigned char *)(a1 + 92))
    {
      if (v6)
      {
        for (unint64_t i = 0; i < v6; ++i)
        {
          if ((*(unsigned __int8 *)(*(void *)(a1 + 80) + (i >> 3)) >> (i & 7)))
          {
            int v8 = *(_DWORD *)(a1 + 88);
            if (v8 < 0)
            {
              uint64_t v10 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8 * i);
                uint64_t v15 = [*(id *)(a1 + 32) UTF8String];
                *(_DWORD *)stat buf = 134218498;
                uint64_t v26 = v14;
                __int16 v27 = 2048;
                uint64_t v28 = v14;
                __int16 v29 = 2080;
                uint64_t v30 = v15;
                _os_log_error_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_ERROR, "Validate concrete indexer: ### Error - Missed delete oid: 0x%llx (%lld) for bundle %s\n", buf, 0x20u);
              }
            }
            else
            {
              uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8 * i);
              dprintf(v8, "### Error - Missed delete oid: 0x%llx (%lld) for bundle %s\n", v9, v9, (const char *)[*(id *)(a1 + 32) UTF8String]);
            }
            unint64_t v11 = NSNumber;
            uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
            uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:*(void *)(a1 + 32)];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            unint64_t v6 = *(void *)(a1 + 72);
          }
        }
      }
    }
    else if (v6)
    {
      for (unint64_t j = 0; j < v6; ++j)
      {
        if (((*(unsigned __int8 *)(*(void *)(a1 + 80) + (j >> 3)) >> (j & 7)) & 1) == 0)
        {
          int v17 = *(_DWORD *)(a1 + 88);
          if (v17 < 0)
          {
            char v19 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8 * j);
              uint64_t v24 = [*(id *)(a1 + 32) UTF8String];
              *(_DWORD *)stat buf = 134218498;
              uint64_t v26 = v23;
              __int16 v27 = 2048;
              uint64_t v28 = v23;
              __int16 v29 = 2080;
              uint64_t v30 = v24;
              _os_log_error_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_ERROR, "Validate concrete indexer: ### Error - Missing oid: 0x%llx (%lld) for bundle %s\n", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8 * j);
            dprintf(v17, "### Error - Missing oid: 0x%llx (%lld) for bundle %s\n", v18, v18, (const char *)[*(id *)(a1 + 32) UTF8String]);
          }
          int v20 = NSNumber;
          uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
          __int16 v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "intValue") + 1);
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v22 forKeyedSubscript:*(void *)(a1 + 32)];

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          unint64_t v6 = *(void *)(a1 + 72);
        }
      }
    }
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 64));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    _MDStoreOIDArrayGetVectorCount();
    _MDStoreOIDArrayApplyBlock();
  }
}

void *__76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_2_1212(void *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    for (uint64_t i = 1; i != a5; ++i)
    {
      unint64_t v6 = result[5];
      if ((v6 & 0x8000000000000000) == 0)
      {
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)(a4 + 8 * i);
        while (1)
        {
          unint64_t v9 = v7 + (uint64_t)(v6 - v7) / 2;
          uint64_t v10 = *(void *)(result[4] + 8 * v9);
          if (v10 == v8) {
            break;
          }
          if (v10 <= v8)
          {
            uint64_t v7 = v9 + 1;
            unint64_t v9 = v6;
          }
          else if (v9 == v6)
          {
            goto LABEL_14;
          }
          unint64_t v6 = v9;
          if (v7 > (uint64_t)v9) {
            goto LABEL_14;
          }
        }
        if ((v9 & 0x8000000000000000) == 0) {
          *(unsigned char *)(result[6] + (v9 >> 3)) |= 1 << (v9 & 7);
        }
      }
LABEL_14:
      ;
    }
  }
  return result;
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1217(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 72);
  if (v2 < 0)
  {
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v7 = logForCSLogCategoryDefault();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 168);
        if (*(unsigned char *)(a1 + 76)) {
          uint64_t v10 = "Deletes";
        }
        else {
          uint64_t v10 = "Items";
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          unint64_t v11 = "Success";
        }
        else {
          unint64_t v11 = "Failed";
        }
        *(_DWORD *)stat buf = 138412802;
        *(void *)__int16 v44 = v9;
        *(_WORD *)&v44[8] = 2080;
        *(void *)&v44[10] = v10;
        *(_WORD *)&v44[18] = 2080;
        *(void *)&v44[20] = v11;
        _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "### Validation Complete for PC %@ validating %s: Result - %s\n", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1217_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[*(id *)(*(void *)(a1 + 32) + 168) UTF8String];
    int v4 = "Deletes";
    if (!*(unsigned char *)(a1 + 76)) {
      int v4 = "Items";
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v5 = "Success";
    }
    else {
      id v5 = "Failed";
    }
    dprintf(v2, "PC %s validating %s: Result - %s\n", v3, v4, v5);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v38 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v16 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v15];
        int v17 = [v16 intValue];

        int v18 = *(_DWORD *)(a1 + 72);
        if (v17 < 1)
        {
          if (v18 < 0)
          {
            char v19 = logForCSLogCategoryDefault();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_45;
            }
            uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v15];
            int v32 = [v26 intValue];
            unint64_t v33 = "Deletes";
            if (!*(unsigned char *)(a1 + 76)) {
              unint64_t v33 = "Items";
            }
            uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 168);
            *(_DWORD *)stat buf = 67109890;
            *(_DWORD *)__int16 v44 = v32;
            *(_WORD *)&v44[4] = 2080;
            *(void *)&v44[6] = v33;
            *(_WORD *)&v44[14] = 2112;
            *(void *)&v44[16] = v34;
            *(_WORD *)&v44[24] = 2112;
            *(void *)&v44[26] = v15;
            _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validation Complete %d %s %@ bundle: %@\n", buf, 0x26u);
            goto LABEL_44;
          }
          char v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v15];
          int v24 = [v19 intValue];
          if (*(unsigned char *)(a1 + 76)) {
            uint64_t v25 = "Deletes";
          }
          else {
            uint64_t v25 = "Items";
          }
          dprintf(v18, "### Validation Complete %d %s %s bundle: %s\n", v24, v25, (const char *)[*(id *)(*(void *)(a1 + 32) + 168) UTF8String], (const char *)objc_msgSend(v15, "UTF8String"));
        }
        else
        {
          if (v18 < 0)
          {
            char v19 = logForCSLogCategoryDefault();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_45;
            }
            uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v15];
            int v27 = [v26 intValue];
            uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v15];
            int v29 = [v28 intValue];
            uint64_t v30 = "Deletes";
            if (!*(unsigned char *)(a1 + 76)) {
              uint64_t v30 = "Items";
            }
            uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 168);
            *(_DWORD *)stat buf = 67110146;
            *(_DWORD *)__int16 v44 = v27;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v29;
            *(_WORD *)&v44[10] = 2080;
            *(void *)&v44[12] = v30;
            *(_WORD *)&v44[20] = 2112;
            *(void *)&v44[22] = v31;
            *(_WORD *)&v44[30] = 2112;
            *(void *)&v44[32] = v15;
            _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validation Error %d of %d %s %@ bundle: %@\n", buf, 0x2Cu);

LABEL_44:
            goto LABEL_45;
          }
          char v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v15];
          int v37 = [v19 intValue];
          int v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v15];
          uint64_t v21 = v13;
          int v22 = [v20 intValue];
          if (*(unsigned char *)(a1 + 76)) {
            uint64_t v23 = "Deletes";
          }
          else {
            uint64_t v23 = "Items";
          }
          int v35 = v22;
          uint64_t v13 = v21;
          dprintf(v18, "### Validation Error %d of %d %s %s bundle: %s\n", v37, v35, v23, (const char *)[*(id *)(*(void *)(a1 + 32) + 168) UTF8String], (const char *)objc_msgSend(v15, "UTF8String"));
        }
LABEL_45:
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v13);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)validateVectors:(int)a3
{
  if ((a3 & 0x80000000) == 0)
  {
    dispatch_group_t v5 = dispatch_group_create();
    int v6 = sIndexQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke;
    v15[3] = &unk_264506728;
    int v17 = a3;
    void v15[4] = self;
    dispatch_group_t v16 = v5;
    uint64_t v7 = v5;
    uint64_t v8 = _setup_block(v15, 0, 8864);
    dispatch_group_async(v7, v6, v8);

    uint64_t v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    uint64_t v10 = sIndexQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_2;
    void v13[3] = &unk_2645063F8;
    uint64_t v14 = v9;
    unint64_t v11 = v9;
    uint64_t v12 = _setup_block(v13, 0, 8871);
    dispatch_group_notify(v7, v10, v12);

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(const void **)(v2 + 128);
  if (!v3 || *(unsigned char *)(v2 + 24) || *(unsigned char *)(v2 + 26))
  {
    int v4 = *(_DWORD *)(a1 + 48);
    if (v4 < 0)
    {
      dispatch_group_t v5 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(v6 + 128);
        int v8 = *(unsigned __int8 *)(v6 + 24);
        int v9 = *(unsigned __int8 *)(v6 + 26);
        LODWORD(v6) = *(unsigned __int8 *)(v6 + 97);
        *(_DWORD *)stat buf = 134218752;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = v8;
        __int16 v19 = 1024;
        int v20 = v9;
        __int16 v21 = 1024;
        int v22 = v6;
        _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Validate vectors for concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d", buf, 0x1Eu);
      }
    }
    else
    {
      dprintf(v4, "Validate vectors for concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d\n", v3, *(unsigned __int8 *)(v2 + 24), *(unsigned __int8 *)(v2 + 26), *(unsigned __int8 *)(v2 + 97));
    }
  }
  else
  {
    int v10 = *(_DWORD *)(a1 + 48);
    if ((v10 & 0x80000000) == 0) {
      dprintf(v10, "Validate vectors for concrete indexer pc: %s\n", (const char *)[*(id *)(v2 + 168) UTF8String]);
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 128);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_1225;
    v12[3] = &unk_264507860;
    id v13 = *(id *)(a1 + 40);
    int v14 = *(_DWORD *)(a1 + 48);
    SIBackgroundOpBlock(v11, 0, v12);
  }
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_1225(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    _SIValidateVectors();
  }
  int v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_2(uint64_t a1)
{
}

- (void)prepareIndexingWhileLocked:(id)a3 holdAssertionFor:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = sIndexQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__SPConcreteCoreSpotlightIndexer_prepareIndexingWhileLocked_holdAssertionFor_completionHandler___block_invoke;
  v14[3] = &unk_264507888;
  id v15 = v8;
  id v16 = v9;
  double v17 = a4;
  v14[4] = self;
  id v11 = v8;
  id v12 = v9;
  id v13 = _setup_block(v14, 0, 8919);
  dispatch_async(v10, v13);
}

void __96__SPConcreteCoreSpotlightIndexer_prepareIndexingWhileLocked_holdAssertionFor_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 128);
    int v5 = *(unsigned __int8 *)(v3 + 24);
    int v6 = *(unsigned __int8 *)(v3 + 26);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 97);
    int v9 = 134218752;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "prepareIndexingWhileLocked failed: index:%p suspended:%d suspending:%d readOnly:%d", (uint8_t *)&v9, 0x1Eu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)finishIndexingWhileLocked:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sIndexQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__SPConcreteCoreSpotlightIndexer_finishIndexingWhileLocked_completionHandler___block_invoke;
  v12[3] = &unk_2645078B0;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v9 = v6;
  id v10 = v7;
  __int16 v11 = _setup_block(v12, 0, 8968);
  dispatch_async(v8, v11);
}

void __78__SPConcreteCoreSpotlightIndexer_finishIndexingWhileLocked_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 128);
    int v5 = *(unsigned __int8 *)(v3 + 24);
    int v6 = *(unsigned __int8 *)(v3 + 26);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 97);
    int v9 = 134218752;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "finishIndexingWhileLocked failed: index:%p suspended:%d suspending:%d readOnly:%d", (uint8_t *)&v9, 0x1Eu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    __int16 v11 = sIndexQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke;
    void v13[3] = &unk_264507900;
    void v13[4] = self;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    int v12 = _setup_block(v13, 0, 9110);
    dispatch_async(v11, v12);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 4;
  [a1[4] readyIndex:1];
  uint64_t v3 = *v2;
  if (!*((void *)*v2 + 16) || v3[24] || v3[97])
  {
    uint64_t v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1();
    }

    int v5 = (void (**)(id, void *))a1[7];
    if (v5)
    {
      int v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      v5[2](v5, v6);
    }
  }
  else if ([v3 denyOperationOnAssertedIndex:"willModifySearchableItemsWithIdentifier"])
  {
    uint64_t v7 = *MEMORY[0x263F01C68];
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    id v9 = (void (**)(id, void *))a1[7];
    if (v9)
    {
      id v12 = v8;
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:-1000 userInfo:0];
      v9[2](v9, v10);

      id v8 = v12;
    }
  }
  else
  {
    uint64_t v11 = *((void *)a1[4] + 16);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_1237;
    void v13[3] = &unk_264506A78;
    id v16 = a1[7];
    id v14 = a1[5];
    id v15 = a1[6];
    SIBackgroundOpBlock(v11, 0, v13);
  }
}

void __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_1237(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
  }
  else
  {
    int v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    __int16 v19 = (id *)a1;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      uint64_t v10 = *MEMORY[0x263F02938];
      uint64_t v11 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v26[0] = @"_kMDItemWillModify";
          v26[1] = v10;
          v27[0] = v11;
          v27[1] = v13;
          id v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v8);
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_2;
    v20[3] = &unk_264507280;
    id v21 = v19[6];
    id v15 = (const void *)[v20 copy];
    if (!SISetCSAttributes())
    {
      id v16 = (void (**)(id, void *))v19[6];
      if (v16)
      {
        uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
        v16[2](v16, v17);
      }
      CFRelease(v15);
    }
  }
}

uint64_t __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_backgroundDeleteItems:(id)a3 bundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer _backgroundDeleteItems:bundleID:completionHandler:]();
  }

  if (self->_index && !self->_readOnly)
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"_backgroundDeleteItems"])
    {
      uint64_t v13 = *MEMORY[0x263F01C68];
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      if (v10)
      {
        id v14 = [MEMORY[0x263F087E8] errorWithDomain:v13 code:-1000 userInfo:0];
        v10[2](v10, v14);
      }
    }
    else
    {
      index = self->_index;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      id v16[2] = __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke;
      v16[3] = &unk_264506A78;
      __int16 v19 = v10;
      id v17 = v9;
      id v18 = v8;
      SIBackgroundOpBlock((uint64_t)index, 0, v16);

      id v12 = v19;
    }
    goto LABEL_7;
  }
  if (v10)
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v10[2](v10, v12);
LABEL_7:
  }
}

void __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke_2;
    v10[3] = &unk_264507280;
    id v11 = *(id *)(a1 + 48);
    id v5 = (id)[v10 copy];
    int v6 = SIDeleteCSAttributes();

    if (!v6)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
      }
    }
  }
}

uint64_t __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_1256(uint64_t a1, uint64_t a2, int a3)
{
  v29[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = [WeakRetained index];

    if (v6 == a2)
    {
      uint64_t v7 = [MEMORY[0x263EFF9C0] set];
      id v8 = [MEMORY[0x263EFF9C0] set];
      id v9 = objc_alloc_init(MEMORY[0x263F02AD0]);
      [v9 setInternal:1];
      [v9 setLowPriority:0];
      v29[0] = *MEMORY[0x263F02790];
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
      [v9 setFetchAttributes:v10];

      uint64_t v28 = *MEMORY[0x263F08098];
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
      [v9 setProtectionClasses:v11];

      [v9 setBundleIDs:&unk_26D0C8D70];
      id v12 = [NSString stringWithFormat:@"%@=1", *MEMORY[0x263F02800]];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      void v26[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2_1260;
      v26[3] = &unk_264507A40;
      id v13 = v8;
      id v27 = v13;
      id v14 = (void *)MEMORY[0x223C48320](v26);
      id v15 = +[SPCoreSpotlightIndexer sharedInstance];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_4;
      void v22[3] = &unk_264507A90;
      id v23 = v7;
      id v24 = v13;
      uint64_t v25 = *(void *)(a1 + 32);
      id v16 = v13;
      id v17 = v7;
      id v18 = [v15 taskForQueryWithQueryString:v12 queryContext:v9 eventHandler:0 resultsHandler:v14 completionHandler:v22];

      __int16 v19 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteSearchableItems start", buf, 2u);
      }

      int v20 = +[SPCoreSpotlightIndexer sharedInstance];
      [v20 startQueryTask:v18];
    }
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2_1260(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_1261;
    void v8[3] = &unk_264506C80;
    id v9 = *(id *)(a1 + 32);
    [a5 enumerateQueryResults:1 stringCache:0 usingBlock:v8];
  }
}

uint64_t __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_1261(uint64_t result, void *a2)
{
  if (*a2) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_1263(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = logForCSLogCategoryDefault();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_1263_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteSearchableItems complete", v5, 2u);
  }
}

- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithPersonaIds:completionHandler:]();
  }

  id v9 = sIndexQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke;
  void v13[3] = &unk_2645078B0;
  id v14 = v6;
  id v15 = v7;
  void v13[4] = self;
  id v10 = v6;
  id v11 = v7;
  id v12 = _setup_block(v13, 0, 9492);
  dispatch_async(v9, v12);
}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke(id *a1)
{
  [a1[4] readyIndex:0];
  id v2 = a1[4];
  if (v2[16] && !*((unsigned char *)v2 + 24))
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2;
    v15[3] = &unk_264507140;
    void v15[4] = v2;
    id v16 = a1[5];
    id v17 = a1[6];
    id v7 = (void *)MEMORY[0x223C48320](v15);
    uint64_t v8 = *((void *)a1[4] + 16);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_3;
    v12[3] = &unk_264507B80;
    id v9 = a1[6];
    void v12[4] = a1[4];
    id v13 = v9;
    id v14 = v7;
    id v10 = v7;
    SISynchedOpWithBlock(v8, 2, v12);
  }
  else if (a1[6])
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v4 = [a1[4] _indexPath];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

    uint64_t v6 = 0;
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    }
    id v11 = (id)v6;
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v16 = SDTraceAdd(3, @"DeletePersonas start", -1, *(void **)(*(void *)(a1 + 32) + 168), 0, 0.0);
  uint64_t v17 = a1;
  id v19 = *(id *)(a1 + 40);
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v2 = [v19 count];
  if (v2 >= 1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v18 = v2;
    do
    {
      if (v3 - v4 >= 64) {
        uint64_t v5 = 64;
      }
      else {
        uint64_t v5 = v3 - v4;
      }
      objc_msgSend(v19, "subarrayWithRange:", v4, v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
      if ([v6 count])
      {
        uint64_t v22 = v4;
        objc_msgSend(v7, "appendFormat:", @"FieldMatch(_kMDItemPersonaID, ");
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v21 = v6;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          char v12 = 1;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
              if ((v12 & 1) == 0) {
                [v7 appendString:@", "];
              }
              [v7 appendFormat:@"\"%@\"", v14];
              [v7 appendFormat:@", \"%@.*\"", v14];
              char v12 = 0;
              ++v13;
            }
            while (v10 != v13);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
            char v12 = 0;
          }
          while (v10);
        }

        [v7 appendString:@""]);
        uint64_t v3 = v18;
        id v6 = v21;
        uint64_t v4 = v22;
      }

      [v20 addObject:v7];
      v4 += 64;
    }
    while (v4 < v3);
  }

  id v15 = [v20 objectEnumerator];
  [*(id *)(v17 + 32) deleteItemsForEnumerator:v15 traceID:v16 bundleID:0 fromClient:0 completionHandler:*(void *)(v17 + 48)];
}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = sIndexQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_4;
  void v7[3] = &unk_264507B58;
  char v10 = a3;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v6 = _setup_block(v7, 0, 9490);
  dispatch_async(v4, v6);
}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)
    || ([*(id *)(a1 + 32) readyIndex:0], uint64_t v3 = *(void *)(a1 + 32), !*(void *)(v3 + 128))
    || *(unsigned char *)(v3 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithFileProviderDomains:completionHandler:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke;
  v14[3] = &unk_2645078B0;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = (void *)MEMORY[0x223C48320](v14);
  char v12 = sIndexQueue;
  uint64_t v13 = _setup_block(v11, 0, 9596);
  dispatch_async(v12, v13);
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) readyIndex:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 128) || *(unsigned char *)(v2 + 24) || *(unsigned char *)(v2 + 97))
  {
    uint64_t v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 128);
      int v6 = *(unsigned __int8 *)(v4 + 24);
      LODWORD(v4) = *(unsigned __int8 *)(v4 + 97);
      *(_DWORD *)stat buf = 134218496;
      uint64_t v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      __int16 v27 = 1024;
      int v28 = v4;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "deleteSearchableItemsWithFileProviderDomains failed: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    if (*(void *)(a1 + 48))
    {
      id v7 = [MEMORY[0x263F08850] defaultManager];
      id v8 = [*(id *)(a1 + 32) _indexPath];
      int v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

      id v10 = 0;
      if (v9)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else if ([(id)v2 denyOperationOnAssertedIndex:"deleteSearchableItemsWithFileProviderDomains"])
  {
    uint64_t v11 = *MEMORY[0x263F01C68];
    char v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      id v19 = v12;
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:v11 code:-1000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

      char v12 = v19;
    }
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 128);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_1270;
    v20[3] = &unk_264506A78;
    id v16 = *(id *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(a1 + 40);
    id v22 = v16;
    void v20[4] = v17;
    id v21 = v18;
    SISynchedOpWithBlock(v15, 2, v20);
  }
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_1270(uint64_t a1, uint64_t a2, char a3)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2;
  v10[3] = &unk_264507BD0;
  char v13 = a3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v12 = v4;
  void v10[4] = v5;
  id v11 = v6;
  id v7 = (void *)MEMORY[0x223C48320](v10);
  id v8 = sIndexQueue;
  int v9 = _setup_block(v7, 0, 9593);
  dispatch_async(v8, v9);
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56)
    || ([*(id *)(a1 + 32) readyIndex:0], uint64_t v3 = *(void *)(a1 + 32), !*(void *)(v3 + 128))
    || *(unsigned char *)(v3 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      id v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }
  }
  else
  {
    uint64_t v20 = SDTraceAdd(3, @"DeleteFileProviderDomains start", -1, *(void **)(v3 + 168), 0, 0.0);
    id v24 = (id)objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v21 = a1;
    id obj = *(id *)(a1 + 40);
    uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v30;
      uint64_t v7 = *MEMORY[0x263F01E20];
      uint64_t v8 = *MEMORY[0x263F02340];
      uint64_t v9 = *MEMORY[0x263F02020];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v12 = [v11 objectAtIndexedSubscript:0];
          char v13 = [v11 objectAtIndexedSubscript:1];
          uint64_t v14 = [v11 objectAtIndexedSubscript:2];
          uint64_t v15 = [NSString stringWithFormat:@"((%@==\"%@\"", v7, v12, v8, v13, v9, v14];
          [v24 addObject:v15];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v5);
    }

    id v16 = [v24 objectEnumerator];
    uint64_t v17 = *(void **)(v21 + 32);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3;
    void v25[3] = &unk_264507BA8;
    id v28 = *(id *)(v21 + 48);
    id v18 = *(id *)(v21 + 40);
    uint64_t v19 = *(void *)(v21 + 32);
    id v26 = v18;
    uint64_t v27 = v19;
    [v17 deleteItemsForEnumerator:v16 traceID:v20 bundleID:0 fromClient:@"com.apple.searchd" completionHandler:v25];
  }
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    __int16 v25 = 0;
    long long v29 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v28 = *(void *)v34;
      uint64_t v27 = *MEMORY[0x263EFFD08];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v25);
          id v10 = [v8 objectAtIndexedSubscript:1];
          id v11 = [v8 objectAtIndexedSubscript:2];
          id v12 = [@"com.apple.FileProvider" stringByAppendingPathComponent:v10];
          char v13 = [v12 stringByAppendingPathComponent:v11];

          uint64_t v14 = [(id)objc_opt_class() _stateInfoAttributeNameWithClientStateName:v13];
          id v15 = objc_alloc(MEMORY[0x263F02AE8]);
          int v37 = v14;
          uint64_t v38 = v27;
          id v16 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          uint64_t v17 = (void *)[v15 initWithAttributes:v16];

          id v18 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v9 domainIdentifier:0 attributeSet:v17];
          [v18 setIsUpdate:1];
          [v29 addObject:v18];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v6);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 128);
    if (v19)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_1280;
      v30[3] = &unk_264506A78;
      id v20 = *(id *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 40);
      id v32 = v20;
      void v30[4] = v21;
      id v31 = v29;
      SIBackgroundOpBlock(v19, 0, v30);

      id v22 = v32;
    }
    else
    {
      id v23 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3_cold_1();
      }

      uint64_t v24 = *(void *)(a1 + 48);
      if (!v24) {
        goto LABEL_18;
      }
      id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v22);
    }

LABEL_18:
    id v3 = v25;
    goto LABEL_19;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
LABEL_19:
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_1280(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2_1281;
    void v7[3] = &unk_264507280;
    id v8 = *(id *)(a1 + 48);
    [v4 indexSearchableItems:v5 deleteSearchableItemsWithIdentifiers:0 clientState:0 forBundleID:@"com.apple.searchd" options:0 completionHandler:v7];
  }
}

uint64_t __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2_1281(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SPConcreteCoreSpotlightIndexer deleteAllUserActivities:fromClient:completionHandler:]();
  }

  if ([v8 length])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke;
    v16[3] = &unk_264507900;
    void v16[4] = self;
    id v19 = v10;
    id v17 = v9;
    id v18 = v8;
    id v12 = (void *)MEMORY[0x223C48320](v16);
    char v13 = sIndexQueue;
    uint64_t v14 = _setup_block(v12, 0, 9638);
    dispatch_async(v13, v14);
  }
  else if (v10)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke(id *a1)
{
  [a1[4] readyIndex:0];
  uint64_t v2 = a1[4];
  if (v2[16] && !*((unsigned char *)v2 + 24))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2;
    void v9[3] = &unk_2645070F0;
    void v9[4] = v2;
    id v10 = a1[5];
    id v11 = a1[6];
    id v12 = a1[7];
    uint64_t v7 = (void (**)(void))MEMORY[0x223C48320](v9);
    v7[2]();
  }
  else if (a1[7])
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v4 = [a1[4] _indexPath];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

    uint64_t v6 = 0;
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    }
    id v8 = (id)v6;
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 168) UTF8String];
  uint64_t v3 = [*(id *)(a1 + 40) UTF8String];
  uint64_t v10 = [*(id *)(a1 + 48) UTF8String];
  uint64_t v9 = v2;
  SILogActivity();
  uint64_t v4 = SDTraceAdd(3, @"deleteAllUserActivities start", -1, *(void **)(*(void *)(a1 + 32) + 168), *(void **)(a1 + 48), 0.0);
  int v5 = @"_kMDItemUserActivityType=\"*\" && _kMDItemUserActivityEligibleForPublicIndexing=\"*\"";
  if (objc_msgSend(*(id *)(a1 + 48), "length", v9, v3, v10))
  {
    [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\" && (%@)", *(void *)(a1 + 48), @"_kMDItemUserActivityType=\"*\" && _kMDItemUserActivityEligibleForPublicIndexing=\"*\""];
    int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3;
  v11[3] = &unk_264507BF8;
  uint64_t v14 = v4;
  void v11[4] = v8;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  [v8 deleteItemsForQuery:v5 bundleID:v12 fromClient:v7 completionHandler:v11];
}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  SDTraceAdd(3, @"deleteAllUserActivities complete", *(void *)(a1 + 56), *(void **)(*(void *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)deleteAllUserActivities:(id)a3 completionHandler:(id)a4
{
}

- (void)_scheduleStringsCleanupForBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)stat buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = dataclass;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling strings cleanup for bundleID:%@, dataclass:%@", buf, 0x16u);
  }

  uint64_t v7 = sIndexQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke;
  void v9[3] = &unk_2645063F8;
  void v9[4] = self;
  id v8 = _setup_block(v9, 0, 9672);
  dispatch_async(v7, v8);
}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 27))
  {
    *(unsigned char *)(v1 + 27) = 1;
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    id v4 = dispatch_get_global_queue(9, 2uLL);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_2;
    block[3] = &unk_2645063F8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v3, v4, block);
  }
}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_2(uint64_t a1)
{
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  int v5 = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_3;
  uint64_t v6 = &unk_264507C20;
  objc_copyWeak(&v7, &location);
  uint64_t v2 = (void *)[&v3 copy];
  objc_msgSend(*(id *)(a1 + 32), "scheduleMaintenance:description:forDarkWake:", v2, @"com.apple.searchd.strings.cleanup", 1, v3, v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v12 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[27] = 0;
    if ([WeakRetained index] == a2)
    {
      id v13 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v12 dataclass];
        int v15 = 138412290;
        id v16 = v14;
        _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "Running strings cleanup for dataclass:%@", (uint8_t *)&v15, 0xCu);
      }
      [v12 cleanupStringsWithActivity:v9 group:v10 shouldDefer:a4 flags:0];
    }
  }
}

- (void)zombifyAllContactItems:(id)a3
{
  uint64_t v4 = a3;
  dispatch_group_enter(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke;
  void v9[3] = &unk_2645065E8;
  void v9[4] = self;
  id v10 = v4;
  int v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x223C48320](v9);
  id v7 = sIndexQueue;
  id v8 = _setup_block(v6, 0, 9722);
  dispatch_async(v7, v8);
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_2;
  id v11 = &unk_264507C48;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v2;
  uint64_t v3 = (void *)MEMORY[0x223C48320](&v8);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[16];
  uint64_t v6 = [NSString stringWithFormat:@"%@=%@", *MEMORY[0x263F01E20], @"com.apple.MobileAddressBook", v8, v9, v10, v11, v12];
  v14[0] = *MEMORY[0x263F02938];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  LOBYTE(v4) = [v4 _startInternalQueryWithIndex:v5 query:v6 fetchAttributes:v7 forBundleIds:&unk_26D0C8D88 resultsHandler:v3];

  if ((v4 & 1) == 0) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:_MDStoreOIDArrayGetVectorCount()];
    id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:43200.0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_3;
    v19[3] = &unk_2645075E8;
    id v12 = v11;
    id v20 = v12;
    id v13 = v10;
    id v21 = v13;
    [a6 enumerateQueryResults:1 stringCache:0 usingBlock:v19];
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 128) && *(void *)(v14 + 152))
    {
      int v15 = sIndexQueue;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_4;
      v17[3] = &unk_2645065E8;
      void v17[4] = v14;
      id v18 = v13;
      id v16 = _setup_block(v17, 0, 9706);
      dispatch_async(v15, v16);
    }
  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_3(uint64_t a1, void *a2)
{
  if (*a2)
  {
    id v5 = (id)objc_opt_new();
    [v5 setObject:*a2 forKey:*MEMORY[0x263F02938]];
    [v5 setObject:*(void *)(a1 + 32) forKey:*MEMORY[0x263F02290]];
    uint64_t v4 = [NSNumber numberWithBool:1];
    [v5 setObject:v4 forKey:*MEMORY[0x263F024B0]];

    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 128);
  if (v1)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_5;
    v2[3] = &unk_2645069B0;
    id v3 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v1, 0, v2);
  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "clearOutContactItems canceled", v4, 2u);
    }
  }
  else
  {
    SISetCSAttributes();
  }
}

- (void)restartAttachmentImport:(id)a3 maxCount:(unint64_t)a4 depth:(int64_t)a5
{
  void v43[5] = *MEMORY[0x263EF8340];
  uint64_t v8 = a3;
  id v9 = [(SPConcreteCoreSpotlightIndexer *)self index];
  if (v9 && !self->_readOnly && !self->_suspended)
  {
    id v10 = v9;
    id v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer restartAttachmentImport:maxCount:depth:]();
    }

    id v12 = [MEMORY[0x263F3AFE0] sharedInstance];
    char v13 = [v12 allowsDiscretionaryWorkForTask:@"indexing" withPriority:*MEMORY[0x263F3B050] withParameters:0];

    if (v13)
    {
      uint64_t v14 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer restartAttachmentImport:maxCount:depth:]();
      }

      dispatch_group_t v15 = dispatch_group_create();
      id location = 0;
      objc_initWeak(&location, self);
      from[0] = 0;
      from[1] = from;
      from[2] = (id)0x2020000000;
      from[3] = 0;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v37[3] = 0;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      void v31[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1305;
      v31[3] = &unk_264507D38;
      objc_copyWeak(v36, &location);
      v36[1] = v10;
      long long v34 = from;
      long long v35 = v37;
      void v31[4] = self;
      id v16 = v8;
      id v32 = v16;
      uint64_t v17 = v15;
      long long v33 = v17;
      v36[2] = (id)a4;
      void v36[3] = (id)a5;
      id v18 = (void *)MEMORY[0x223C48320](v31);
      id v19 = [NSString stringWithFormat:@"_kMDItemRequiresImport==1 && _kMDItemImportHasSandboxExtension==1"];
      dispatch_group_enter(v16);
      index = self->_index;
      uint64_t v21 = *MEMORY[0x263F02938];
      v43[0] = @"_kMDItemBundleID";
      v43[1] = v21;
      uint64_t v22 = *MEMORY[0x263F01F98];
      v43[2] = *MEMORY[0x263F01FA8];
      void v43[3] = v22;
      v43[4] = *MEMORY[0x263F023F8];
      id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
      BOOL v24 = [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:index query:v19 fetchAttributes:v23 forBundleIds:0 maxCount:a4 resultsHandler:v18];

      if (!v24)
      {
        __int16 v25 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          __int16 v30 = 0;
          _os_log_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_INFO, "restartAttachmentImport done (never started)", (uint8_t *)&v30, 2u);
        }

        dispatch_group_leave(v16);
      }

      objc_destroyWeak(v36);
      _Block_object_dispose(v37, 8);
      _Block_object_dispose(from, 8);
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v26 = gIsSystemOnBattery == 0;
      from[0] = 0;
      objc_initWeak(from, self);
      dispatch_group_enter(v8);
      if (v26) {
        int64_t v27 = 0x6FC23B000;
      }
      else {
        int64_t v27 = 0x45D9648000;
      }
      dispatch_time_t v28 = dispatch_time(0, v27);
      indexQueue = self->_indexQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke;
      block[3] = &unk_264507C70;
      objc_copyWeak(v42, from);
      long long v41 = v8;
      v42[1] = (id)a4;
      v42[2] = (id)a5;
      dispatch_after(v28, indexQueue, block);

      objc_destroyWeak(v42);
      objc_destroyWeak(from);
    }
  }
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained restartAttachmentImport:*(void *)(a1 + 32) maxCount:*(void *)(a1 + 48) depth:*(void *)(a1 + 56)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1305(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = WeakRetained;
  if (a3 == 1)
  {
    int64_t v27 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)stat buf = 134217984;
      uint64_t v66 = v28;
      _os_log_impl(&dword_21F1CE000, v27, OS_LOG_TYPE_INFO, "==== Completed restartAttachmentImport query finished) %ld", buf, 0xCu);
    }

    unint64_t v29 = *(void *)(a1 + 88);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= v29)
    {
      uint64_t v36 = *(void *)(a1 + 64);
      if (!*(void *)(*(void *)(v36 + 8) + 24) || (unint64_t v37 = *(void *)(a1 + 96) + 1, v37 > 5 * (v29 >> 8)))
      {
        unint64_t v37 = 0;
        v29 *= 2;
      }
      uint64_t v38 = sIndexQueue;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1321;
      void v44[3] = &unk_264507D10;
      uint64_t v46 = v36;
      v44[4] = v11;
      long long v39 = *(NSObject **)(a1 + 48);
      id v45 = *(id *)(a1 + 40);
      unint64_t v47 = v29;
      unint64_t v48 = v37;
      uint64_t v40 = _setup_block(v44, 0, 9875);
      dispatch_group_notify(v39, v38, v40);

      long long v35 = v45;
    }
    else
    {
      __int16 v30 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)stat buf = 134217984;
        uint64_t v66 = v31;
        _os_log_impl(&dword_21F1CE000, v30, OS_LOG_TYPE_INFO, "==== Completed restartAttachmentImport query (%ld processed)", buf, 0xCu);
      }

      id v32 = sIndexQueue;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1322;
      id v41[3] = &unk_2645068C8;
      uint64_t v43 = *(void *)(a1 + 64);
      long long v33 = *(NSObject **)(a1 + 48);
      id v42 = *(id *)(a1 + 40);
      long long v34 = _setup_block(v41, 0, 9881);
      dispatch_group_notify(v33, v32, v34);

      long long v35 = v42;
    }
  }
  else if (!a3 && [WeakRetained index] == *(void *)(a1 + 80))
  {
    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 134217984;
      uint64_t v66 = a4;
      _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_INFO, "==== restartAttachmentImport query results %ld", buf, 0xCu);
    }

    uint64_t VectorCount = _MDStoreOIDArrayGetVectorCount();
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1306;
    v57[3] = &unk_264507C98;
    uint64_t v62 = *(void *)(a1 + 56);
    id v18 = v14;
    id v58 = v18;
    id v19 = v15;
    id v59 = v19;
    id v20 = v16;
    id v60 = v20;
    id v21 = v17;
    uint64_t v22 = *(void *)(a1 + 64);
    id v61 = v21;
    uint64_t v63 = v22;
    uint64_t v64 = VectorCount;
    [a6 enumerateQueryResults:5 stringCache:0 usingBlock:v57];
    uint64_t v23 = *(void *)(a1 + 32);
    if (*(void *)(v23 + 128) && *(void *)(v23 + 152))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      BOOL v24 = sIndexQueue;
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1307;
      v49[3] = &unk_264507CE8;
      __int16 v25 = *(void **)(a1 + 40);
      v49[4] = *(void *)(a1 + 32);
      id v50 = v25;
      id v51 = v18;
      id v52 = v19;
      id v53 = v20;
      id v54 = v21;
      uint64_t v55 = v11;
      id v56 = *(id *)(a1 + 48);
      BOOL v26 = _setup_block(v49, 0, 9860);
      dispatch_async(v24, v26);
    }
  }
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1306(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (*(void *)a2 && *(void *)(a2 + 8) && *(void *)(a2 + 16) && *(void *)(a2 + 24) && *(void *)(a2 + 32))
  {
    uint64_t v4 = *(id *)a2;
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    uint64_t v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 80)];
      uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 80)];

      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 80)];
      uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 80)];

      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v4];
      [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v4];
      [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v4];
      uint64_t v6 = (void *)v9;
      id v7 = (void *)v10;
      uint64_t v8 = (void *)v11;
    }
    [v5 addObject:*(void *)(a2 + 8)];
    id v12 = *(id *)(a2 + 16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [NSURL URLWithString:v12];

      id v12 = (id)v13;
    }
    [v6 addObject:v12];
    [v7 addObject:*(void *)(a2 + 24)];
    [v8 addObject:*(void *)(a2 + 32)];
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a2 + 8);
      uint64_t v16 = *(void *)(a2 + 24);
      uint64_t v17 = *(void *)(a2 + 32);
      int v18 = 138413058;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_debug_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_DEBUG, "~~ restartAttachmentImport id:%@ url:%@ uti:%@ se:%@", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    uint64_t v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1306_cold_1();
    }
  }
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1307(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_2;
    void v7[3] = &unk_264507CC0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    id v3 = *(id *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 80);
    id v5 = *(void **)(a1 + 88);
    id v12 = v3;
    uint64_t v13 = v4;
    id v14 = v5;
    SIBackgroundOpBlock(v2, 0, v7);
  }
  else
  {
    uint64_t v6 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v6);
  }
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "==== restartAttachmentImport canceled", buf, 2u);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      id obj = v4;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
          id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
          id v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
          uint64_t v13 = [*(id *)(a1 + 64) objectForKeyedSubscript:v9];
          id v14 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 138412290;
            __int16 v22 = v10;
            _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_INFO, "==== restartAttachmentImport import! items %@", buf, 0xCu);
          }

          LOBYTE(v15) = 0;
          [*(id *)(a1 + 72) processImportForBundleID:v9 withURLs:v11 contentTypes:v12 sandboxExtensions:v13 andIdentifiers:v10 options:0x8000 inGroup:*(void *)(a1 + 80) additionalAttributes:&unk_26D0C9080 computeUpdaterAttributesAfterImport:v15];
        }
        uint64_t v4 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1321(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "==== restartAttachmentImport (recursive!) %ld", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) restartAttachmentImport:*(void *)(a1 + 40) maxCount:*(void *)(a1 + 56) depth:*(void *)(a1 + 64)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1322(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "==== Done restarting importers (%ld processed)", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)removeSandboxExtensions:(id)a3
{
  void v21[2] = *MEMORY[0x263EF8340];
  int v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  uint64_t v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "==== removeSandboxExtensions enter", buf, 2u);
  }

  dispatch_group_enter(v4);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke;
  long long v17 = &unk_264507C48;
  long long v18 = self;
  uint64_t v6 = v4;
  long long v19 = v6;
  uint64_t v7 = (void *)MEMORY[0x223C48320](&v14);
  index = self->_index;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"_kMDItemRequiresImport==1 && _kMDItemImportHasSandboxExtension==1", v14, v15, v16, v17, v18);
  uint64_t v10 = *MEMORY[0x263F02938];
  v21[0] = @"_kMDItemBundleID";
  v21[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  BOOL v12 = [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:index query:v9 fetchAttributes:v11 resultsHandler:v7];

  if (!v12)
  {
    uint64_t v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "removeSandboxExtensions done", buf, 2u);
    }

    dispatch_group_leave(v6);
  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  if (a3 == 1)
  {
    long long v17 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_INFO, "removeSandboxExtensions done", v18, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    uint64_t VectorCount = _MDStoreOIDArrayGetVectorCount();
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_2;
    void v22[3] = &unk_264507D60;
    id v12 = v11;
    id v23 = v12;
    uint64_t v24 = VectorCount;
    [a6 enumerateQueryResults:2 stringCache:0 usingBlock:v22];
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 128) && *(void *)(v13 + 152))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      uint64_t v14 = sIndexQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      void v19[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_3;
      v19[3] = &unk_2645064D0;
      uint64_t v15 = *(void **)(a1 + 40);
      void v19[4] = *(void *)(a1 + 32);
      id v20 = v15;
      id v21 = v12;
      uint64_t v16 = _setup_block(v19, 0, 9956);
      dispatch_async(v14, v16);
    }
  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  if (*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v6 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(a1 + 40)];
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
    }
    int v4 = objc_opt_new();
    [v4 setObject:a2[1] forKey:*MEMORY[0x263F02938]];
    uint64_t v5 = *MEMORY[0x263EFFD08];
    [v4 setObject:*MEMORY[0x263EFFD08] forKey:*MEMORY[0x263F023F8]];
    [v4 setObject:v5 forKey:*MEMORY[0x263F023F0]];
    [v6 addObject:v4];
  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 128);
  if (v1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_4;
    v3[3] = &unk_264507410;
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    SIBackgroundOpBlock(v1, 0, v3);
  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "removeSandboxExtensions canceled", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v16;
      *(void *)&long long v7 = 138412546;
      long long v14 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11, v14, (void)v15);
          uint64_t v13 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = v14;
            uint64_t v20 = v11;
            __int16 v21 = 2112;
            __int16 v22 = v12;
            _os_log_debug_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEBUG, "removeSandboxExtensions %@ %@", buf, 0x16u);
          }

          SISetCSAttributes();
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 fromClient:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  uint64_t v13 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    long long v15 = "NO";
    *(_DWORD *)stat buf = 138412802;
    if (v7) {
      long long v15 = "YES";
    }
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = dataclass;
    *(_WORD *)&buf[22] = 2080;
    uint64_t v62 = (uint64_t (*)(uint64_t, uint64_t))v15;
    _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItemsForBundleID, bundleID:%@, protectionClass:%@, shouldGC:%s", buf, 0x20u);
  }

  if (self->_readOnly)
  {
    long long v16 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = self->_dataclass;
      *(_DWORD *)stat buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "Cannot delete items because the index is read-only. dataclass:%@", buf, 0xCu);
    }

    long long v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v12[2](v12, v18);
  }
  else if (self->_hasAssertion)
  {
    long long v19 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = self->_dataclass;
      *(_DWORD *)stat buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_INFO, "Cannot deleteAllSearchableItemsForBundleID on asserted index when device is locked. dataclass:%@", buf, 0xCu);
    }

    __int16 v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    if (v12) {
      v12[2](v12, v21);
    }
  }
  else
  {
    char v22 = [v10 isEqualToString:@"com.apple.spotlight.contacts"];
    uint64_t v36 = SDTraceAdd(3, @"DeleteAll start", -1, self->_dataclass, v10, 0.0);
    *(void *)stat buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v62 = __Block_byref_object_copy_;
    uint64_t v63 = __Block_byref_object_dispose_;
    id v64 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    char v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    char v58 = 0;
    dispatch_group_t v23 = dispatch_group_create();
    char v24 = v7 & ~v22;
    char v35 = v24;
    if ([v10 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      [(SPConcreteCoreSpotlightIndexer *)self zombifyAllContactItems:v23];
    }
    else
    {
      uint64_t v25 = sIndexQueue;
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke;
      v50[3] = &unk_264507E20;
      id v51 = v10;
      id v52 = self;
      uint64_t v55 = buf;
      uint64_t v26 = v23;
      id v53 = v26;
      id v54 = v11;
      char v56 = v24;
      int64_t v27 = _setup_block(v50, 0, 10119);
      dispatch_group_async(v26, v25, v27);
    }
    uint64_t v28 = dispatch_group_create();
    dispatch_group_enter(v28);
    unint64_t v29 = sIndexQueue;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1343;
    void v44[3] = &unk_264507E48;
    unint64_t v48 = buf;
    uint64_t v49 = v59;
    id v30 = v10;
    id v45 = v30;
    uint64_t v31 = v28;
    uint64_t v46 = v31;
    unint64_t v47 = self;
    id v32 = _setup_block(v44, 0, 10159);
    dispatch_group_notify(v23, v29, v32);

    long long v33 = sIndexQueue;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1345;
    v37[3] = &unk_264507E98;
    uint64_t v42 = v36;
    void v37[4] = self;
    id v38 = v30;
    uint64_t v40 = buf;
    long long v39 = v12;
    long long v41 = v57;
    char v43 = v35;
    long long v34 = _setup_block(v37, 0, 10218);
    dispatch_group_notify(v31, v33, v34);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) length])
  {
    uint64_t v2 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 168);
      *(_DWORD *)stat buf = 138412290;
      id v52 = v3;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "#index wipe, dataclass:%@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) closeIndex];
    id v4 = [*(id *)(a1 + 40) _indexPath];
    char v50 = 0;
    id v5 = [MEMORY[0x263F08850] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v50];

    if (v6)
    {
      BOOL v7 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        id v52 = v4;
        _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Removing index at %@", buf, 0xCu);
      }

      uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v9 + 40);
      char v10 = [v8 removeItemAtPath:v4 error:&obj];
      objc_storeStrong((id *)(v9 + 40), obj);

      if ((v10 & 1) == 0)
      {
        id v11 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_cold_2();
        }

        id v12 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        id v48 = *(id *)(v13 + 40);
        char v14 = [v12 removeItemAtPath:v4 error:&v48];
        objc_storeStrong((id *)(v13 + 40), v48);

        if ((v14 & 1) == 0)
        {
          long long v15 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_cold_1();
          }

          long long v16 = [MEMORY[0x263F08850] defaultManager];
          char v35 = v4;
          long long v17 = [v16 contentsOfDirectoryAtPath:v4 error:0];

          long long v47 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v44 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v45 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                char v24 = logForCSLogCategoryIndex();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v25 = *(void **)(*(void *)(a1 + 40) + 168);
                  *(_DWORD *)stat buf = 138412546;
                  id v52 = v25;
                  __int16 v53 = 2112;
                  uint64_t v54 = v23;
                  _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_DEFAULT, "(%@) Failed to remove %@", buf, 0x16u);
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v55 count:16];
            }
            while (v20);
          }

          id v4 = v35;
        }
      }
      goto LABEL_29;
    }
  }
  [*(id *)(a1 + 40) readyIndex:0];
  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = *(void *)(v26 + 128);
  if (!v27)
  {
    id v30 = [(id)v26 _indexPath];
    buf[0] = 0;
    uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
    char v32 = [v31 fileExistsAtPath:v30 isDirectory:buf];

    if ((v32 & 1) == 0) {
      return;
    }
    goto LABEL_28;
  }
  if (*(unsigned char *)(v26 + 24))
  {
LABEL_28:
    uint64_t v33 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8);
    id v4 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;
    goto LABEL_29;
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1332;
  void v36[3] = &unk_264507DF8;
  uint64_t v41 = *(void *)(a1 + 64);
  id v28 = *(id *)(a1 + 48);
  uint64_t v29 = *(void *)(a1 + 40);
  id v37 = v28;
  uint64_t v38 = v29;
  id v39 = *(id *)(a1 + 56);
  char v43 = *(unsigned char *)(a1 + 72);
  id v40 = *(id *)(a1 + 32);
  uint64_t v42 = v27;
  SISynchedOpWithBlock(v27, 3, v36);

  id v4 = v37;
LABEL_29:
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1332(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    char v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v7 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v7);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2;
    v14[3] = &unk_264507DF8;
    uint64_t v19 = *(void *)(a1 + 64);
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v11;
    char v21 = *(unsigned char *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 72);
    id v18 = v12;
    uint64_t v20 = v13;
    SIBackgroundOpBlock(a2, 0, v14);
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v0;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    uint64_t v5 = *(void *)(*(void *)(v2 + 64) + 8);
    char v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v7 = *(NSObject **)(v2 + 32);
    dispatch_group_leave(v7);
  }
  else
  {
    uint64_t v8 = v1;
    uint64_t v9 = [*(id *)(*(void *)(v0 + 40) + 168) UTF8String];
    uint64_t v10 = [*(id *)(v2 + 48) UTF8String];
    uint64_t v28 = *(unsigned __int8 *)(v2 + 80);
    uint64_t v29 = [*(id *)(v2 + 56) UTF8String];
    SILogActivity();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    void v31[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3;
    v31[3] = &unk_264507DB0;
    uint64_t v35 = *(void *)(v2 + 72);
    int8x16_t v30 = *(int8x16_t *)(v2 + 32);
    id v11 = (id)v30.i64[0];
    int8x16_t v32 = vextq_s8(v30, v30, 8uLL);
    id v12 = *(id *)(v2 + 56);
    uint64_t v13 = *(void *)(v2 + 64);
    id v33 = v12;
    uint64_t v34 = v13;
    char v14 = (void *)MEMORY[0x223C48320](v31);
    id v15 = *(void **)(v2 + 56);
    if (v15
      && ((objc_msgSend(v15, "isEqualToString:", @"com.apple.mobilemail", v9, v10, v28, v29) & 1) != 0
       || [*(id *)(v2 + 56) isEqualToString:@"com.apple.mail"]))
    {
      uint64_t v16 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "Attempting text store deletion by predicate", buf, 2u);
      }

      bzero(buf, 0x1000uLL);
      if (objc_msgSend(*(id *)(v2 + 56), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 0, 0, 4, 0, 0, objc_msgSend(*(id *)(v2 + 56), "length"), 0))
      {
        int v17 = si_text_store_delete_by_predicate();
        if (v17)
        {
          int v18 = v17;
          uint64_t v19 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = strerror(-v18);
            *(_DWORD *)id v37 = 136315138;
            uint64_t v38 = v20;
            _os_log_impl(&dword_21F1CE000, v19, OS_LOG_TYPE_DEFAULT, "*warn* si_text_store_delete_by_predicate: %s", v37, 0xCu);
          }
        }
      }
    }
    char v21 = [NSString stringWithFormat:@"_kMDItemBundleID = \"%@\"", *(void *)(v2 + 56)];
    char v22 = *(void **)(v2 + 40);
    uint64_t v36 = *(void *)(v2 + 56);
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    char v24 = [v22 _startInternalQueryWithIndex:v8 query:v21 fetchAttributes:0 forBundleIds:v23 resultsHandler:v14];

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      uint64_t v26 = *(void *)(*(void *)(v2 + 64) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      dispatch_group_leave(*(dispatch_group_t *)(v2 + 32));
    }
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  id v8 = a2;
  if (a3 == 1)
  {
    if ([*(id *)(a1 + 32) index] != *(void *)(a1 + 64))
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && [*(id *)(a1 + 32) index] == *(void *)(a1 + 64))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    CFRetain(a5);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = qos_class_self();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_4;
    v14[3] = &unk_264507D88;
    int v17 = a5;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v9, v10, v14);
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 && !a3)
  {
    _MDStoreOIDArrayGetVectorCount();
    id v4 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_5()
{
  return SIDeleteCSItems();
}

BOOL __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1337(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 32) == HIDWORD(a2);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1343(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ([MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8),
        uint64_t v5 = *(void **)(v4 + 40),
        *(void *)(v4 + 40) = v3,
        v5,
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    || ![*(id *)(a1 + 32) length])
  {
    uint64_t v2 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v2);
  }
  else
  {
    [*(id *)(a1 + 48) readyIndex:0];
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(void *)(v6 + 128))
    {
      if (!*(unsigned char *)(v6 + 24))
      {
        SIDeleteCSClientStateCache();
        BOOL v7 = *(void **)(a1 + 48);
        v20[0] = *(void *)(a1 + 32);
        id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        id v16[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1344;
        v16[3] = &unk_264507190;
        uint64_t v18 = *(void *)(a1 + 56);
        id v17 = *(id *)(a1 + 40);
        uint64_t v9 = (void *)[v16 copy];
        [v7 _backgroundDeleteItems:v8 bundleID:@"com.apple.searchd" completionHandler:v9];

        return;
      }
      goto LABEL_13;
    }
    uint64_t v10 = [*(id *)(a1 + 48) _indexPath];
    char v19 = 0;
    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 fileExistsAtPath:v10 isDirectory:&v19];

    if (v12)
    {

LABEL_13:
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      return;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1344(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1345(uint64_t a1)
{
  SDTraceAdd(3, @"DeleteAll complete", *(void *)(a1 + 72), *(void **)(*(void *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 128);
  if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.shortcuts"])
  {
    if (v2)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1349;
      void v8[3] = &unk_264507E70;
      void v8[4] = *(void *)(a1 + 32);
      void v8[5] = v2;
      SIBackgroundOpBlock(v2, 0, v8);
    }
    else
    {
      uint64_t v3 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1345_cold_1();
      }

      uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 80)) {
      return [*(id *)(a1 + 32) _scheduleStringsCleanupForBundleID:*(void *)(a1 + 40)];
    }
  }
  return result;
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1349(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    uint64_t v21 = v6;
    uint64_t v22 = v5;
    uint64_t v23 = v3;
    uint64_t v24 = v4;
    if (*(void *)(a1 + 40) == a2)
    {
      id v8 = [MEMORY[0x263EFF980] array];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      void v19[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1350;
      v19[3] = &unk_264507A40;
      id v9 = v8;
      id v20 = v9;
      uint64_t v10 = (void *)MEMORY[0x223C48320](v19);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      id v16[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1352;
      v16[3] = &unk_264507638;
      uint64_t v11 = *(void *)(a1 + 32);
      id v17 = v9;
      uint64_t v18 = v11;
      id v12 = v9;
      uint64_t v13 = (void *)MEMORY[0x223C48320](v16);
      uint64_t v14 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] deleteAllSearchableItems start", v15, 2u);
      }

      [*(id *)(a1 + 32) deleteHasTopHitAppShortcutsWithResultsHandler:v10 completionHandler:v13];
    }
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1350(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1351;
    void v8[3] = &unk_264506C80;
    id v9 = *(id *)(a1 + 32);
    [a5 enumerateQueryResults:1 stringCache:0 usingBlock:v8];
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1351(uint64_t a1, id *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *a2;
  if (v3)
  {
    uint64_t v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] void flag for %@", buf, 0xCu);
    }

    uint64_t v8 = *MEMORY[0x263F02398];
    uint64_t v9 = *MEMORY[0x263EFFD08];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F02AE8]) initWithAttributes:v5];
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F02AE0]) initWithUniqueIdentifier:v3 domainIdentifier:0 attributeSet:v6];
    [v7 setBundleID:@"com.apple.application"];
    [v7 setIsUpdate:1];
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_1352(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3 && [v3 count])
  {
    uint64_t v4 = [*(id *)(a1 + 40) owner];
    [v4 indexSearchableItems:*(void *)(a1 + 32) deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:*MEMORY[0x263F08098] forBundleID:@"com.apple.application" options:0 completionHandler:&__block_literal_global_1355];
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1353(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = logForCSLogCategoryDefault();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1353_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteAllSearchableItems complete", v5, 2u);
  }
}

- (void)_deleteSearchableItemsMatchingQuery:(id)a3 forBundleIds:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sIndexQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke;
  v16[3] = &unk_264507900;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = _setup_block(v16, 0, 10285);
  dispatch_async(v11, v15);
}

void __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [a1[4] readyIndex:0];
  id v2 = a1[4];
  if (!*((void *)v2 + 16) || *((unsigned char *)v2 + 24) || *((unsigned char *)v2 + 97))
  {
    id v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      uint64_t v5 = v4[16];
      int v6 = *((unsigned __int8 *)v4 + 24);
      LODWORD(v4) = *((unsigned __int8 *)v4 + 97);
      *(_DWORD *)stat buf = 134218496;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v24 = 1024;
      int v25 = v6;
      __int16 v26 = 1024;
      int v27 = (int)v4;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "Cannot delete attributes in _deleteSearchableItmesMatchingQuery: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    if (a1[7])
    {
      BOOL v7 = [MEMORY[0x263F08850] defaultManager];
      id v8 = [a1[4] _indexPath];
      int v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

      if (v9)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      }
      else
      {
        id v10 = 0;
      }
      (*((void (**)(void))a1[7] + 2))();
    }
  }
  else if ([v2 denyOperationOnAssertedIndex:"_deleteSearchableItemsMatchingQuery"])
  {
    uint64_t v11 = *MEMORY[0x263F01C68];
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    id v12 = (void (**)(id, void *))a1[7];
    if (v12)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:v11 code:-1000 userInfo:0];
      v12[2](v12, v13);
    }
  }
  else
  {
    id v14 = (void *)SDTraceAdd(3, @"DeleteMatchingQuey start", -1, a1[5], 0, 0.0);
    *(void *)stat buf = 0;
    objc_initWeak((id *)buf, a1[4]);
    uint64_t v15 = *((void *)a1[4] + 16);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_1360;
    v18[3] = &unk_264507EE8;
    id v21 = a1[7];
    objc_copyWeak(v22, (id *)buf);
    id v16 = a1[4];
    v22[1] = v14;
    void v18[4] = v16;
    id v19 = a1[5];
    id v20 = a1[6];
    SIBackgroundOpBlock(v15, 0, v18);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

void __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_1360(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v12);
    }
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_2;
    void v13[3] = &unk_264507EC0;
    objc_copyWeak(v15, (id *)(a1 + 64));
    v15[1] = a2;
    id v6 = *(id *)(a1 + 56);
    BOOL v7 = *(void **)(a1 + 72);
    id v14 = v6;
    v15[2] = v7;
    id v8 = (void *)MEMORY[0x223C48320](v13);
    uint64_t v11 = [*(id *)(a1 + 40) UTF8String];
    SILogActivity();
    if ((objc_msgSend(*(id *)(a1 + 32), "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", a2, *(void *)(a1 + 40), 0, *(void *)(a1 + 48), v8, v11) & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      }
    }

    objc_destroyWeak(v15);
  }
}

uint64_t __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (uint64_t (**)(void, void))objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a3 == 1)
  {
    uint64_t v15 = WeakRetained;
    id WeakRetained = (uint64_t (**)(void, void))[WeakRetained index];
    if (WeakRetained == *(uint64_t (***)(void, void))(a1 + 48))
    {
      SDTraceAdd(3, @"DeleteMatchingQuey complete", *(void *)(a1 + 56), 0, 0, 0.0);
      id WeakRetained = *(uint64_t (***)(void, void))(a1 + 32);
      id v6 = v15;
      if (!WeakRetained) {
        goto LABEL_14;
      }
      id WeakRetained = (uint64_t (**)(void, void))WeakRetained[2](WeakRetained, 0);
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v6 = v15;
      if (!v12) {
        goto LABEL_14;
      }
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
    goto LABEL_13;
  }
  if (!a3)
  {
    uint64_t v15 = WeakRetained;
    id WeakRetained = (uint64_t (**)(void, void))[WeakRetained index];
    id v6 = v15;
    if (WeakRetained == *(uint64_t (***)(void, void))(a1 + 48))
    {
      id WeakRetained = (uint64_t (**)(void, void))_MDStoreOIDArrayGetVectorCount();
      id v6 = v15;
      if (WeakRetained >= 2)
      {
        uint64_t v7 = WeakRetained;
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = (uint64_t *)(_MDStoreOIDArrayGetVector() + 8);
        uint64_t v10 = v7 - 1;
        do
        {
          uint64_t v11 = *v9++;
          MEMORY[0x223C47200](v8, v11);
          --v10;
        }
        while (v10);
        id WeakRetained = (uint64_t (**)(void, void))[v15 dirty];
LABEL_13:
        id v6 = v15;
      }
    }
  }
LABEL_14:
  return MEMORY[0x270F9A758](WeakRetained, v6);
}

- (void)deleteSearchableItemsSinceDate:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  [a3 timeIntervalSinceReferenceDate];
  uint64_t v12 = [v8 stringWithFormat:@"_kMDItemBundleID = \"%@\" && kMDItemCreationDate>=$time.absolute(%f)", v10, v11];
  v14[0] = v10;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  [(SPConcreteCoreSpotlightIndexer *)self _deleteSearchableItemsMatchingQuery:v12 forBundleIds:v13 completionHandler:v9];
}

- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", @"_kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\" && kMDItemContentCreationDate<$time.absolute(%f)", *(void *)&a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SPConcreteCoreSpotlightIndexer *)self _deleteSearchableItemsMatchingQuery:v8 forBundleIds:0 completionHandler:v7];
}

- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 count])
  {
    id v8 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"_kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\" && FieldMatch(kMDItemIdentifier");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 appendFormat:@", \"%@\"", *(void *)(*((void *)&v15 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    [v8 appendString:@""]);
    [(SPConcreteCoreSpotlightIndexer *)self _deleteSearchableItemsMatchingQuery:v8 forBundleIds:0 completionHandler:v7];
  }
  else if (v7)
  {
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v7[2](v7, v14);
  }
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 length])
  {
    id v8 = [NSString stringWithFormat:@"_kMDItemBundleID = \"%@\" && _kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\"", v6];
    v11[0] = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [(SPConcreteCoreSpotlightIndexer *)self _deleteSearchableItemsMatchingQuery:v8 forBundleIds:v9 completionHandler:v7];
  }
  else if (v7)
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v7[2](v7, v10);
  }
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forBundleID:(id)a5
{
  if (a4 == 2) {
    -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", 0, a3, 0, 0, 0, a5, 0, 0, v5, v6);
  }
}

- (void)fetchCacheFileDescriptorsForBundleID:(id)a3 identifiers:(id)a4 userCtx:(id)a5 flags:(int)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v14) {
      goto LABEL_5;
    }
  }
  else
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"fetchCacheFileDescriptors"])
    {
      uint64_t v16 = *MEMORY[0x263F01C68];
      long long v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      if (v14)
      {
        long long v17 = [MEMORY[0x263F087E8] errorWithDomain:v16 code:-1000 userInfo:0];
        v14[2](v14, 0, v17);
      }
      goto LABEL_6;
    }
    long long v18 = (void *)MEMORY[0x223C480D0]();
    if (self->_index && [v11 length])
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      void v20[2] = __115__SPConcreteCoreSpotlightIndexer_fetchCacheFileDescriptorsForBundleID_identifiers_userCtx_flags_completionHandler___block_invoke;
      v20[3] = &unk_264507F60;
      id v14 = v14;
      id v21 = v14;
      id v19 = (void *)MEMORY[0x223C48320](v20);
      if (!SIGetCacheFileDescriptors())
      {

        id v14 = 0;
      }
    }
    if (v14)
    {
LABEL_5:
      long long v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      v14[2](v14, 0, v15);
LABEL_6:
    }
  }
}

uint64_t __115__SPConcreteCoreSpotlightIndexer_fetchCacheFileDescriptorsForBundleID_identifiers_userCtx_flags_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v17 = (void (**)(id, void, void *))a8;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v17) {
      goto LABEL_5;
    }
  }
  else
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"fetchAttributes"])
    {
      uint64_t v19 = *MEMORY[0x263F01C68];
      long long v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      if (v17)
      {
        uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:v19 code:-1000 userInfo:0];
        v17[2](v17, 0, v20);
      }
      goto LABEL_6;
    }
    id v21 = (void *)MEMORY[0x223C480D0]();
    if (self->_index && [v14 length])
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __103__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completionHandler___block_invoke;
      void v23[3] = &unk_264507F88;
      long long v17 = v17;
      id v24 = v17;
      uint64_t v22 = (void *)MEMORY[0x223C48320](v23);
      if (!SIGetCSAttributes())
      {

        long long v17 = 0;
      }
    }
    if (v17)
    {
LABEL_5:
      long long v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
      v17[2](v17, 0, v18);
LABEL_6:
    }
  }
}

uint64_t __103__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __96__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completion___block_invoke;
  v20[3] = &unk_264507FB0;
  id v21 = v15;
  id v22 = v14;
  id v23 = v16;
  id v17 = v16;
  id v18 = v14;
  id v19 = v15;
  [(SPConcreteCoreSpotlightIndexer *)self fetchAttributes:v18 bundleID:a4 identifiers:v19 userCtx:a6 flags:v9 completionHandler:v20];
}

void __96__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v12 = 0;
  if (a2 && !a3)
  {
    uint64_t v4 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    id v12 = 0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      if ([v4 count] - 1 == v5)
      {
        id v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v5];
        uint64_t v6 = [*(id *)(a1 + 40) count];
        if (v5)
        {
          uint64_t v7 = v6;
          uint64_t v8 = 0;
          do
          {
            uint64_t v9 = v8 + 1;
            uint64_t v10 = [v4 objectAtIndexedSubscript:v8 + 1];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v7 == [v10 count])
            {
              id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
              [v12 setObject:v10 forKeyedSubscript:v11];
            }
            uint64_t v8 = v9;
          }
          while (v5 != v9);
        }
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)attributesForBundleId:(id)a3 identifier:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "Fetching all the attributes for identifier:%@, bundleID:%@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    id v12 = v8;
    [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    id v11 = (void (**)(id, void))v9;
    if (SIGetCSAttributes()) {
      v11[2](v11, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __78__SPConcreteCoreSpotlightIndexer_attributesForBundleId_identifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2 || (uint64_t v3 = _MDPlistBytesCopyPlistAtIndex()) == 0)
  {
    id v7 = 0;
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  id v7 = (id)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v7 count] < 2) {
    goto LABEL_10;
  }
  uint64_t v4 = [v7 objectAtIndex:1];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 count])
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = [v4 objectAtIndexedSubscript:0];
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

        goto LABEL_12;
      }
    }
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_12:
}

- (void)powerStateChanged
{
  if (!gIsSystemOnBattery)
  {
    group = dispatch_group_create();
    [(SPConcreteCoreSpotlightIndexer *)self revokeExpiredItems:group];
    uint64_t v3 = sIndexQueue;
    uint64_t v4 = _setup_block(&__block_literal_global_1404, 0, 10597);
    dispatch_group_notify(group, v3, v4);
  }
}

void __51__SPConcreteCoreSpotlightIndexer_powerStateChanged__block_invoke()
{
  uint64_t v0 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_INFO, "Revoke completed.", v1, 2u);
  }
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 resultsHandler:(id)a6
{
  return [(SPConcreteCoreSpotlightIndexer *)self _startInternalQueryWithIndex:a3 query:a4 fetchAttributes:a5 forBundleIds:0 maxCount:0 resultsHandler:a6];
}

- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[SPConcreteCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:]();
  }
  id v8 = (void (**)(void, void, void))v7;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  index = self->_index;
  if (index && !self->_suspended)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __92__SPConcreteCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke;
    v11[3] = &unk_264508000;
    void v11[4] = self;
    id v13 = v8;
    id v12 = v6;
    SIBackgroundOpBlock((uint64_t)index, 0, v11);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

void __92__SPConcreteCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3 && [*(id *)(a1 + 32) index] == a2)
  {
    if (SIGetAccumulatedStorageSizeForBundleId())
    {
      uint64_t v4 = [NSNumber numberWithUnsignedLongLong:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)_setOfTokensToCorrect:(id)a3 tokenMatchInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[SPConcreteCoreSpotlightIndexer _lastTokenWithQueryString:a3 tokenMatchInfo:v5];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = v7;
  if (v6)
  {
    id v19 = v7;
    uint64_t v22 = [v5 count];
    id v9 = [v5 allKeys];
    uint64_t v10 = (void *)[v9 mutableCopy];

    [v10 removeObject:v6];
    [v10 addObject:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(obj);
          }
          __int16 v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v5 objectForKeyedSubscript:v15];
          if (+[SPConcreteCoreSpotlightIndexer _spellingCorrectionConditional:isSingleToken:isPreviousTokenCorrected:isLastToken:tokenLength:](SPConcreteCoreSpotlightIndexer, "_spellingCorrectionConditional:isSingleToken:isPreviousTokenCorrected:isLastToken:tokenLength:", [v16 intValue], v22 == 1, v13 & 1, objc_msgSend(v15, "isEqualToString:", v6), objc_msgSend(v15, "length")))
          {
            [v19 addObject:v15];
            char v13 = 1;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v8 = v19;
    id v17 = (id)[v19 copy];
  }
  else
  {
    id v17 = v7;
  }

  return v17;
}

+ (id)_tokensMaxCountFromMatchInfo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v3 count])
  {
    id v33 = 0;
    uint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\"(\\S+)\"cdw" options:1 error:&v33];
    id v24 = v33;
    id v25 = v3;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    long long v26 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v4, "firstMatchInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
        uint64_t v11 = v10;
        if (v10)
        {
          uint64_t v12 = [v10 rangeAtIndex:1];
          id v14 = objc_msgSend(v9, "substringWithRange:", v12, v13);
          if ([v14 length])
          {
            if (objc_msgSend(v14, "characterAtIndex:", objc_msgSend(v14, "length") - 1) != 42) {
              goto LABEL_12;
            }
            if ([v14 length] != 1)
            {
              uint64_t v15 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 1);

              id v14 = (void *)v15;
LABEL_12:
              id v16 = NSNumber;
              id v17 = [v27 objectForKeyedSubscript:v14];
              unsigned int v18 = [v17 intValue];

              id v19 = [obj objectForKeyedSubscript:v9];
              unsigned int v20 = [v19 intValue];

              if ((int)v18 <= (int)v20) {
                uint64_t v21 = v20;
              }
              else {
                uint64_t v21 = v18;
              }
              uint64_t v22 = [v16 numberWithInt:v21];
              [v27 setObject:v22 forKeyedSubscript:v14];

              uint64_t v4 = v26;
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v6)
      {
LABEL_19:

        id v3 = v25;
        break;
      }
    }
  }

  return v27;
}

+ (id)_sharedSynonyms
{
  if (_sharedSynonyms_onceToken != -1) {
    dispatch_once(&_sharedSynonyms_onceToken, &__block_literal_global_1415);
  }
  id v2 = (void *)_sharedSynonyms_synonyms;
  return v2;
}

uint64_t __49__SPConcreteCoreSpotlightIndexer__sharedSynonyms__block_invoke()
{
  uint64_t v0 = objc_alloc_init(SDPommesSynonyms);
  uint64_t v1 = _sharedSynonyms_synonyms;
  _sharedSynonyms_synonyms = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_stringWithRewriteType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"None";
  }
  else {
    return off_264509128[a3 - 1];
  }
}

+ (id)_descriptionWithTokenRewrites:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{\n"];
  uint64_t v6 = CSRedactString(v5, 0);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        id v9 = [v8 originalToken];
        uint64_t v10 = CSRedactString(v9, 0);
        [v6 appendFormat:@"  %@ -->\n", v10];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v11 = [v8 variations];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              id v17 = [v16 variation];
              unsigned int v18 = CSRedactString(v17, 0);
              id v19 = objc_msgSend(a1, "_stringWithRewriteType:", objc_msgSend(v16, "type"));
              unsigned int v20 = CSRedactString(v19, 0);
              [v6 appendFormat:@"    %@ (%@)\n", v18, v20];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  [v6 appendString:@"}"];
  return v6;
}

+ (BOOL)_spellingCorrectionConditional:(int)a3 isSingleToken:(BOOL)a4 isPreviousTokenCorrected:(BOOL)a5 isLastToken:(BOOL)a6 tokenLength:(unint64_t)a7
{
  BOOL v7 = a3 < 3 && a6;
  BOOL v8 = v7 & ~(a4 || a5);
  if (a7 <= 3) {
    BOOL v8 = 0;
  }
  return !a3 || v8;
}

+ (id)_lastTokenWithQueryString:(id)a3 tokenMatchInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] && objc_msgSend(v5, "length"))
  {
    uint64_t v7 = [v5 length];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v6;
    id obj = [v6 allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v23;
      uint64_t v12 = -1;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        uint64_t v15 = [v5 lowercaseString];
        uint64_t v16 = objc_msgSend(v15, "rangeOfString:options:range:", v14, 4, 0, v7);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v16 > v12)
          {
            id v17 = v14;

            uint64_t v10 = v17;
            uint64_t v12 = v16;
          }
          unint64_t v18 = [v14 length] + v16;
          if (v18 >= [v5 length]) {
            break;
          }
        }
        if (v9 == ++v13)
        {
          uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
    }

    id v6 = v20;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_indexIndependentTokenRewritesWithMatchInfo:(id)a3 queryID:(int64_t)a4 setOfTokensToCorrect:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __107__SPConcreteCoreSpotlightIndexer__indexIndependentTokenRewritesWithMatchInfo_queryID_setOfTokensToCorrect___block_invoke;
  v10[3] = &unk_264508028;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  return v8;
}

void __107__SPConcreteCoreSpotlightIndexer__indexIndependentTokenRewritesWithMatchInfo_queryID_setOfTokensToCorrect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = SDPommesStemWord(v3);
  if ((unint64_t)[v5 length] >= 3)
  {
    id v6 = objc_alloc(MEMORY[0x263F55708]);
    id v7 = [NSString stringWithFormat:@"%@*", v5];
    LODWORD(v8) = 1060320051;
    uint64_t v9 = (void *)[v6 initWithVariation:v7 type:3 confidence:v8];

    [v4 addObject:v9];
  }
  uint64_t v10 = +[SPConcreteCoreSpotlightIndexer _sharedSynonyms];
  id v11 = [v10 getSecondPassSynonymsForWord:v3];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
        id v18 = objc_alloc(MEMORY[0x263F55708]);
        LODWORD(v19) = 1050253722;
        id v20 = (void *)[v18 initWithVariation:v17 type:4 confidence:v19];
        [v4 addObject:v20];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if ([v4 count])
  {
    uint64_t v21 = *(void **)(a1 + 32);
    long long v22 = (void *)[objc_alloc(MEMORY[0x263F55700]) initWithOriginalToken:v3 variations:v4];
    [v21 addObject:v22];
  }
}

+ (id)_getBundleIndexesFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = (const char *)[*(id *)(*((void *)&v32 + 1) + 8 * i) cStringUsingEncoding:4];
        int v11 = strlen(v10);
        int v12 = v11 + 1;
        if (v11 >= -1) {
          int v13 = v11 + 1;
        }
        else {
          int v13 = v11 + 4;
        }
        uint64_t v14 = &v10[v13 & 0xFFFFFFFC];
        if ((v11 + 4) >= 7)
        {
          uint64_t v18 = -(v13 >> 2);
          int v19 = -1789642873;
          int v20 = 718793509;
          int v17 = -1759636613;
          do
          {
            int v19 = 5 * v19 + 2071795100;
            int v20 = 5 * v20 + 1808688022;
            HIDWORD(v21) = v19 * *(_DWORD *)&v14[4 * v18];
            LODWORD(v21) = HIDWORD(v21);
            int v22 = (v21 >> 21) * v20;
            HIDWORD(v21) = v17;
            LODWORD(v21) = v17;
            int v17 = v22 ^ (5 * (v21 >> 19) + 1390208809);
          }
          while (!__CFADD__(v18++, 1));
          int v16 = 5 * v19 + 2071795100;
          int v15 = 5 * v20 + 1808688022;
        }
        else
        {
          int v15 = 1107688271;
          int v16 = 1713515327;
          int v17 = -1759636613;
        }
        int v24 = 0;
        int v25 = v12 & 3;
        if (v25 != 1)
        {
          if (v25 != 2)
          {
            if (v25 != 3) {
              goto LABEL_21;
            }
            int v24 = *((unsigned __int8 *)v14 + 2) << 16;
          }
          v24 |= *((unsigned __int8 *)v14 + 1) << 8;
        }
        HIDWORD(v26) = (v24 ^ *(unsigned __int8 *)v14) * v16;
        LODWORD(v26) = HIDWORD(v26);
        int v27 = (v26 >> 21) * v15;
        HIDWORD(v26) = v17;
        LODWORD(v26) = v17;
        int v17 = v27 ^ (5 * (v26 >> 19) + 1390208809);
LABEL_21:
        unsigned int v28 = -1028477387 * ((-2048144789 * (v17 ^ v12)) ^ ((-2048144789 * (v17 ^ v12)) >> 13));
        CFStringRef v29 = CFStringCreateWithFormat(v8, 0, @"%d", v28 & 0x7FFFFFFF ^ HIWORD(v28));
        [v4 addObject:v29];
        CFRelease(v29);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)_indexDependentTokenRewritesWithMatchInfo:(id)a3 topK:(id)a4 setOfTokensToCorrect:(id)a5 queryID:(int64_t)a6 bundleIds:(id)a7 clientBundleId:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  id v16 = a3;
  int v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[SPConcreteCoreSpotlightIndexer _indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:]();
  }

  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  void v27[2] = __135__SPConcreteCoreSpotlightIndexer__indexDependentTokenRewritesWithMatchInfo_topK_setOfTokensToCorrect_queryID_bundleIds_clientBundleId___block_invoke;
  v27[3] = &unk_264508050;
  id v28 = v13;
  id v29 = v14;
  id v30 = v12;
  id v31 = v15;
  id v19 = v18;
  id v32 = v19;
  id v20 = v15;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  [v16 enumerateKeysAndObjectsUsingBlock:v27];

  int v24 = v32;
  id v25 = v19;

  return v25;
}

void __135__SPConcreteCoreSpotlightIndexer__indexDependentTokenRewritesWithMatchInfo_topK_setOfTokensToCorrect_queryID_bundleIds_clientBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v5 = +[SPConcreteCoreSpotlightIndexer _getBundleIndexesFrom:](SPConcreteCoreSpotlightIndexer, "_getBundleIndexesFrom:");
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 48) allKeys];
      uint64_t v7 = v6;
      if (v6 && [v6 count]) {
        uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v7];
      }
      else {
        uint64_t v5 = 0;
      }
    }
    CFAllocatorRef v8 = *(void **)(a1 + 56);
    if (v8 && ![v8 isEqualToString:@"com.apple.spotlight"]) {
      id v28 = 0;
    }
    else {
      id v28 = &unk_26D0C8F98;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v5;
    uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v29)
    {
      uint64_t v27 = *(void *)v35;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = a1;
          int v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * v9)];
          id v12 = v3;
          id v13 = [v3 lowercaseString];
          id v14 = SDPommesCorrectionsWithTopKAndToken(v11, v13, v28);

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v31;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * v19);
                id v21 = objc_alloc(MEMORY[0x263F55708]);
                LODWORD(v22) = 1057132380;
                id v23 = (void *)[v21 initWithVariation:v20 type:2 confidence:v22];
                [v4 addObject:v23];

                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v17);
          }

          ++v9;
          id v3 = v12;
          a1 = v10;
        }
        while (v9 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v29);
    }
  }
  if ([v4 count])
  {
    int v24 = *(void **)(a1 + 64);
    id v25 = (void *)[objc_alloc(MEMORY[0x263F55700]) initWithOriginalToken:v3 variations:v4];
    [v24 addObject:v25];
  }
}

- (void)indexDependentTokenRewritesWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 setOfTokensToCorrect:(id)a6 tokenRewritesHandler:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 queryID];
  uint64_t v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    dataclass = self->_dataclass;
    int v24 = CSRedactString(v12, 0);
    *(_DWORD *)stat buf = 138412802;
    uint64_t v29 = dataclass;
    __int16 v30 = 2048;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    long long v33 = v24;
    _os_log_debug_impl(&dword_21F1CE000, v18, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld rewriteQueryWithQueryString=%@", buf, 0x20u);
  }
  [(SPConcreteCoreSpotlightIndexer *)self index];
  id v25 = v13;
  unint64_t v26 = v15;
  uint64_t v27 = v14;
  id v19 = v16;
  id v20 = v14;
  id v21 = v15;
  id v22 = v13;
  SIFetchTopKTerms();
}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  __int16 v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  id v31 = (id)objc_opt_new();
  if (a2)
  {
    memset(buf, 0, sizeof(buf));
    _MDPlistGetRootPlistObjectFromPlist();
    if (_MDPlistGetPlistObjectType() == 241)
    {
      id v4 = [*(id *)(a1 + 32) bundleIDs];
      uint64_t v5 = +[SPConcreteCoreSpotlightIndexer _getBundleIndexesFrom:v4];

      id v24 = v5;
      id v25 = *(id *)(a1 + 40);
      _MDPlistDictionaryIterate();
    }
  }
  uint64_t v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 168);
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v19 = [(id)v27[5] count];
    uint64_t v20 = v33[3];
    *(_DWORD *)stat buf = 138413058;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v37 = v19;
    __int16 v38 = 2048;
    uint64_t v39 = v20;
    _os_log_debug_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld number of topK terms that are inflated in memory from plist: bundleCount=%lu, termCount=%lu", buf, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = v27[5];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 32) queryID];
  int v11 = [*(id *)(a1 + 32) bundleIDs];
  id v12 = [*(id *)(a1 + 32) clientBundleID];
  id v13 = +[SPConcreteCoreSpotlightIndexer _indexDependentTokenRewritesWithMatchInfo:v7 topK:v8 setOfTokensToCorrect:v9 queryID:v10 bundleIds:v11 clientBundleId:v12];

  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 168);
    uint64_t v22 = *(void *)(a1 + 72);
    uint64_t v23 = [v13 count];
    *(_DWORD *)stat buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v37 = v23;
    _os_log_debug_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld indexDependentTokenRewritesWithQueryString found %lu rewrites", buf, 0x20u);
  }

  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v13, v15, v16);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v6 = [NSString stringWithUTF8String:a2];
  if (![*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    long long v10 = *a4;
    uint64_t v11 = *((void *)a4 + 2);
    if (_MDPlistGetPlistObjectType() == 241)
    {
      *(void *)&long long v10 = 0;
      *((void *)&v10 + 1) = &v10;
      uint64_t v11 = 0x3032000000;
      id v12 = __Block_byref_object_copy_;
      id v13 = __Block_byref_object_dispose_;
      id v14 = 0;
      id v14 = (id)objc_opt_new();
      id v9 = *(id *)(a1 + 40);
      long long v7 = *a4;
      uint64_t v8 = *((void *)a4 + 2);
      _MDPlistDictionaryIterate();
      if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 40), "count", v7, v8))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:*(void *)(*((void *)&v10 + 1) + 40) forKeyedSubscript:v6];
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [*(id *)(*((void *)&v10 + 1) + 40) count];
      }

      _Block_object_dispose(&v10, 8);
    }
  }
}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 && verifyCandidateLength(a3))
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    long long v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_4;
    v11[3] = &unk_264508078;
    void v11[4] = &v12;
    void v11[5] = a2;
    [v7 enumerateObjectsUsingBlock:v11];
    if (*((unsigned char *)v13 + 24))
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", _MDPlistNumberGetIntValue(), *a4, a4[1], a4[2]);
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      long long v10 = [NSString stringWithUTF8String:a2];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
    _Block_object_dispose(&v12, 8);
  }
}

BOOL __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL result = isCandidate(*(char **)(a1 + 40), a2);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)transferDeleteJournalsToDirectory:(int)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_readOnly)
  {
    long long v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      index = self->_index;
      BOOL suspended = self->_suspended;
      BOOL readOnly = self->_readOnly;
      *(_DWORD *)stat buf = 134218496;
      uint64_t v19 = index;
      __int16 v20 = 1024;
      BOOL v21 = suspended;
      __int16 v22 = 1024;
      BOOL v23 = readOnly;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "transferDeleteJournalsToDirectory failed: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v6[2](v6, v11);
  }
  else
  {
    if (![(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"transferDeleteJournalsToDirectory"])
    {
      uint64_t v14 = self->_index;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke;
      id v15[3] = &unk_264508140;
      uint64_t v16 = v6;
      int v17 = a3;
      SIBackgroundOpBlock((uint64_t)v14, 0, v15);

      goto LABEL_8;
    }
    uint64_t v12 = *MEMORY[0x263F01C68];
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    if (v6)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:v12 code:-1000 userInfo:0];
      v6[2](v6, v13);
    }
  }

LABEL_8:
}

void __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    SITransferDeletionJournals();
  }
}

void __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (id)purgeableIndexTouchFilePath
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  id v3 = [v2 stringByAppendingPathComponent:@"purgeableIndexMarker"];

  return v3;
}

- (void)_createPurgeableTouchFile
{
  OUTLINED_FUNCTION_10();
  __error();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v0, v1, "Failed to create touch file %@. errno=%d", v2, v3, v4, v5, v6);
}

- (BOOL)_removePurgeableTouchFile
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self purgeableIndexTouchFilePath];
  int v3 = open((const char *)[v2 fileSystemRepresentation], 0, 438);
  int v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    uint64_t v5 = (const std::__fs::filesystem::path *)[v2 fileSystemRepresentation];
    if (remove(v5, v6))
    {
      long long v7 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer _removePurgeableTouchFile]();
      }
    }
  }

  return v4 >= 0;
}

- (BOOL)_hasPurgeableTouchFile
{
  id v2 = [(SPConcreteCoreSpotlightIndexer *)self purgeableIndexTouchFilePath];
  int v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  return v4;
}

- (int64_t)getIndexDirectorySize:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = opendir((const char *)[v4 UTF8String]);
  uint8_t v6 = logForCSLogCategoryIndex();
  long long v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:]();
    }

    uint64_t v8 = readdir(v5);
    for (i = 0; v8; uint64_t v8 = readdir(v5))
    {
      d_name = v8->d_name;
      if (strcmp(v8->d_name, ".") && strcmp(d_name, ".."))
      {
        memset(&v19, 0, sizeof(v19));
        int v11 = dirfd(v5);
        if (fstatat(v11, d_name, &v19, 32) < 0)
        {
          char v15 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = __error();
            int v17 = strerror(*v16);
            *(_DWORD *)stat buf = 136315394;
            BOOL v21 = d_name;
            __int16 v22 = 2080;
            BOOL v23 = v17;
            _os_log_error_impl(&dword_21F1CE000, v15, OS_LOG_TYPE_ERROR, "Failed to obtain index file info:%s (%s)", buf, 0x16u);
          }
        }
        else
        {
          if ((v19.st_mode & 0xF000) == 0x4000)
          {
            uint64_t v12 = [NSString stringWithUTF8String:d_name];
            id v13 = [v4 stringByAppendingPathComponent:v12];

            off_t st_size = [(SPConcreteCoreSpotlightIndexer *)self getIndexDirectorySize:v13];
          }
          else
          {
            off_t st_size = v19.st_size;
          }
          i += st_size;
        }
      }
    }
    closedir(v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:]();
    }

    int64_t i = 0;
  }

  return i;
}

- (BOOL)_shouldPurge
{
  int v3 = [(SPConcreteCoreSpotlightIndexer *)self _indexPath];
  int64_t v4 = [(SPConcreteCoreSpotlightIndexer *)self getIndexDirectorySize:v3];

  return v4 > 3221225471;
}

- (void)markDirectoryAtomicallyPurgeable:(id)a3 purgeableOrNot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint8_t v6 = opendir((const char *)[v5 UTF8String]);
  if (v6)
  {
    long long v7 = v6;
    int v8 = dirfd(v6);
    int v9 = v8;
    uint64_t v10 = 98309;
    if (!v4) {
      uint64_t v10 = 0;
    }
    uint64_t v21 = v10;
    int v11 = ffsctl(v8, 0xC0084A44uLL, &v21, 0);
    uint64_t v12 = logForCSLogCategoryIndex();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (v4) {
          uint64_t v14 = "mark";
        }
        else {
          uint64_t v14 = "clear";
        }
        int v15 = *__error();
        int buf = 136315906;
        *(void *)buf_4 = v14;
        *(_WORD *)&buf_4[8] = 2112;
        *(void *)&buf_4[10] = v5;
        *(_WORD *)&buf_4[18] = 1024;
        *(_DWORD *)&buf_4[20] = v9;
        *(_WORD *)&buf_4[24] = 1024;
        *(_DWORD *)&buf_4[26] = v15;
        _os_log_error_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_ERROR, "Failed to %s index directory %@ atomically purgable. fd:%d errno:%d", (uint8_t *)&buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = "Cleared";
      int buf = 136315650;
      if (v4) {
        int v17 = "Marked";
      }
      *(void *)buf_4 = v17;
      *(_WORD *)&buf_4[8] = 2112;
      *(void *)&buf_4[10] = v5;
      *(_WORD *)&buf_4[18] = 2048;
      *(void *)&buf_4[20] = v21;
      _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "%s index directory %@ atomically purgable. flags=0x%llx", (uint8_t *)&buf, 0x20u);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_DWORD *)buf_4 = 0;
    memset(&buf_4[12], 0, 32);
    int buf = 3;
    *(void *)&buf_4[4] = 1;
    int v18 = ffsctl(v9, 0xC1104A71uLL, &buf, 0);
    stat v19 = logForCSLogCategoryIndex();
    __int16 v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SPConcreteCoreSpotlightIndexer markDirectoryAtomicallyPurgeable:purgeableOrNot:]((uint64_t)v5, v9, v20);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v22 = 67111426;
      int v23 = buf;
      __int16 v24 = 2048;
      uint64_t v25 = *(void *)&buf_4[4];
      __int16 v26 = 2048;
      uint64_t v27 = *(void *)&buf_4[28];
      __int16 v28 = 2048;
      uint64_t v29 = v44;
      __int16 v30 = 2048;
      uint64_t v31 = *((void *)&v44 + 1);
      __int16 v32 = 2048;
      uint64_t v33 = v45;
      __int16 v34 = 2048;
      uint64_t v35 = *((void *)&v45 + 1);
      __int16 v36 = 2048;
      uint64_t v37 = v46;
      __int16 v38 = 1024;
      int v39 = BYTE8(v46);
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_debug_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEBUG, "Getting dir stats version:%d flags:0x%llx dir_stats_id:%llu gen_count:%llu descendants:%llu physical_size:%llu clone_size:%llu purgeable_size:%llu purgeable_urgency:%d.%@", v22, 0x5Eu);
    }

    closedir(v7);
  }
  else
  {
    uint64_t v16 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:]();
    }
  }
}

- (void)closeCache:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"closeCache"])
    {
      if (v4)
      {
        id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2006 userInfo:0];
        v4[2](v4, 0, v5);
      }
    }
    else
    {
      index = self->_index;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      void v7[2] = __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke;
      void v7[3] = &unk_264508168;
      void v7[4] = self;
      int v8 = v4;
      SISynchedOpWithBlock((uint64_t)index, 2, v7);
    }
  }
}

void __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2007 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke_2;
    void v9[3] = &unk_264506B90;
    void v9[4] = *(void *)(a1 + 32);
    id v5 = (const void *)[v9 copy];
    if (!SICloseCache())
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        long long v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2008 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
      }
      CFRelease(v5);
    }
  }
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty:0];
}

- (void)cacheEntryForKeys:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"cacheEntryForKeys"])
    {
      if (!v13) {
        goto LABEL_7;
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F01C68];
      uint64_t v16 = -2006;
      goto LABEL_6;
    }
    int v18 = (void *)MEMORY[0x223C480D0]();
    if (self->_index && [v11 length])
    {
      stat v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      __int16 v24 = __95__SPConcreteCoreSpotlightIndexer_cacheEntryForKeys_bundleID_protectionClass_completionHandler___block_invoke;
      uint64_t v25 = &unk_264508190;
      id v13 = v13;
      id v27 = v13;
      __int16 v20 = v19;
      __int16 v26 = v20;
      uint64_t v21 = (void *)MEMORY[0x223C48320](&v22);
      if (!SIGetCacheEntry())
      {

        id v13 = 0;
      }
      dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (v13)
    {
LABEL_5:
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F01C68];
      uint64_t v16 = -2008;
LABEL_6:
      int v17 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, 0, v22, v23, v24, v25);
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v17);
    }
  }
LABEL_7:
}

void __95__SPConcreteCoreSpotlightIndexer_cacheEntryForKeys_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = (id)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
    {
      if (v4)
      {
        int v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:0];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  int v3 = 0;
  id v4 = 0;
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)cacheInsertForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void, void *))a7;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"cacheInsertForKey"])
    {
      if (v14)
      {
        uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2006 userInfo:0];
        v14[2](v14, 0, v15);
      }
    }
    else
    {
      index = self->_index;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke;
      v17[3] = &unk_2645081B8;
      uint64_t v22 = v14;
      id v18 = v13;
      id v19 = v12;
      id v20 = v11;
      uint64_t v21 = self;
      SISynchedOpWithBlock((uint64_t)index, 2, v17);
    }
  }
}

void __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke(void *a1, uint64_t a2, int a3)
{
  v15[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = a1[8];
    if (v4)
    {
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2007 userInfo:0];
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    id v5 = &stru_26D0BD940;
    uint64_t v6 = a1[5];
    if (a1[4]) {
      id v5 = (__CFString *)a1[4];
    }
    v14[0] = @"_kMDItemBundleID";
    v14[1] = v6;
    uint64_t v7 = a1[6];
    v15[0] = v5;
    v15[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2;
    void v13[3] = &unk_264506B90;
    void v13[4] = a1[7];
    int v9 = (const void *)[v13 copy];
    if (!SISetCacheEntry())
    {
      uint64_t v10 = a1[8];
      if (v10)
      {
        id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2008 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
      }
      CFRelease(v9);
    }
  }
}

uint64_t __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty:0];
}

- (void)cacheDeleteForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void, void *))a7;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"cacheDeleteForKey"])
    {
      if (v14)
      {
        uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2006 userInfo:0];
        v14[2](v14, 0, v15);
      }
    }
    else
    {
      index = self->_index;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke;
      v17[3] = &unk_2645081B8;
      uint64_t v22 = v14;
      id v18 = v13;
      id v19 = v12;
      id v20 = v11;
      uint64_t v21 = self;
      SISynchedOpWithBlock((uint64_t)index, 2, v17);
    }
  }
}

void __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke(void *a1, uint64_t a2, int a3)
{
  v15[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = a1[8];
    if (v4)
    {
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2007 userInfo:0];
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    id v5 = &stru_26D0BD940;
    uint64_t v6 = a1[5];
    if (a1[4]) {
      id v5 = (__CFString *)a1[4];
    }
    v14[0] = @"_kMDItemBundleID";
    v14[1] = v6;
    uint64_t v7 = a1[6];
    v15[0] = v5;
    v15[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2;
    void v13[3] = &unk_264506B90;
    void v13[4] = a1[7];
    int v9 = (const void *)[v13 copy];
    if (!SIDeleteCacheEntry())
    {
      uint64_t v10 = a1[8];
      if (v10)
      {
        id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-2008 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
      }
      CFRelease(v9);
    }
  }
}

uint64_t __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dirty:0];
}

- (void)spotlightCacheFileDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SPConcreteCoreSpotlightIndexer *)self readyIndex:0];
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    if ([(SPConcreteCoreSpotlightIndexer *)self denyOperationOnAssertedIndex:"spotlightCacheFileDescriptor"])
    {
      if (!v7) {
        goto LABEL_7;
      }
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F01C68];
      uint64_t v10 = -2006;
      goto LABEL_6;
    }
    id v12 = (void *)MEMORY[0x223C480D0]();
    if (self->_index)
    {
      id v13 = xpc_dictionary_get_remote_connection(v6);
      xpc_object_t v14 = xpc_null_create();
      uint64_t v15 = dispatch_group_create();
      dispatch_group_enter(v15);
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke;
      uint64_t v23 = &unk_2645081E0;
      id v24 = v6;
      id v16 = v14;
      id v25 = v16;
      id v17 = v13;
      id v26 = v17;
      id v18 = v15;
      id v27 = v18;
      id v19 = (void *)MEMORY[0x223C48320](&v20);
      if (!SIGetCacheFd())
      {

        id v7 = 0;
      }
      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (v7)
    {
LABEL_5:
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F01C68];
      uint64_t v10 = -2008;
LABEL_6:
      id v11 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, 0, v20, v21, v22, v23);
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
LABEL_7:
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke(uint64_t a1, int fd, int a3, int a4)
{
  if ((fd & 0x80000000) == 0)
  {
    xpc_object_t v8 = xpc_fd_create(fd);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v8)
    {
      xpc_dictionary_set_value(v9, "cache-node-fd", v8);
    }
    else
    {
      xpc_dictionary_set_value(v9, "cache-node-fd", *(xpc_object_t *)(a1 + 40));
      uint64_t v10 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_3();
      }
    }
    close(fd);
  }
  if ((a3 & 0x80000000) == 0)
  {
    xpc_object_t v11 = xpc_fd_create(a3);
    id v12 = *(void **)(a1 + 32);
    if (v11)
    {
      xpc_dictionary_set_value(v12, "cache-container-fd", v11);
    }
    else
    {
      xpc_dictionary_set_value(v12, "cache-container-fd", *(xpc_object_t *)(a1 + 40));
      id v13 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_2();
      }
    }
    close(a3);
  }
  if ((a4 & 0x80000000) == 0)
  {
    xpc_object_t v14 = xpc_fd_create(a4);
    uint64_t v15 = *(void **)(a1 + 32);
    if (v14)
    {
      xpc_dictionary_set_value(v15, "cache-payload-fd", v14);
    }
    else
    {
      xpc_dictionary_set_value(v15, "cache-payload-fd", *(xpc_object_t *)(a1 + 40));
      id v16 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_1();
      }
    }
    close(a4);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)setOwner:(id)a3
{
}

- (void)setIndex:(__SI *)a3
{
  self->_index = a3;
}

- (__SI)jwlIndex
{
  return self->_jwlIndex;
}

- (void)setJwlIndex:(__SI *)a3
{
  self->_jwlIndex = a3;
}

- (__SIResultQueue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(__SIResultQueue *)a3
{
  self->_resultQueue = a3;
}

- (void)setIndexQueue:(id)a3
{
}

- (void)setFirstUnlockQueue:(id)a3
{
}

- (void)setDataclass:(id)a3
{
}

- (OS_dispatch_source)indexIdleTimer
{
  return self->_indexIdleTimer;
}

- (double)idleStartTime
{
  return self->_idleStartTime;
}

- (NSMutableArray)outstandingMaintenance
{
  return self->_outstandingMaintenance;
}

- (void)setOutstandingMaintenance:(id)a3
{
}

- (void)setKnownClients:(id)a3
{
}

- (NSMapTable)checkedInClients
{
  return self->_checkedInClients;
}

- (unint64_t)dirtyTimeout
{
  return self->_dirtyTimeout;
}

- (void)setDirtyTimeout:(unint64_t)a3
{
  self->_dirtyTimeout = a3;
}

- (OS_os_transaction)dirtyTransaction
{
  return self->_dirtyTransaction;
}

- (void)setDirtyTransaction:(id)a3
{
}

- (BOOL)finishedDrainingJournal
{
  return self->_finishedDrainingJournal;
}

- (void)setFinishedDrainingJournal:(BOOL)a3
{
  self->_finishedDrainingJournal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyTransaction, 0);
  objc_storeStrong((id *)&self->_knownClients, 0);
  objc_storeStrong((id *)&self->_outstandingMaintenance, 0);
  objc_storeStrong((id *)&self->_indexIdleTimer, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_blocksToRunWhenFinishedDraining, 0);
  objc_storeStrong((id *)&self->_assertedBundleIds, 0);
  objc_storeStrong((id *)&self->_reindexAllDelegateBundleIDs, 0);
  objc_storeStrong((id *)&self->_checkedInClients, 0);
}

- (void)notifyClientForItemUpdates:(void *)a1 updatedItems:(NSObject *)a2 batchMask:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_14(&dword_21F1CE000, a2, v3, "Performing job task CSIndexNotifyForSearchableItemUpdates with %lu items", v4);
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "SpotlightDaemonServer done handling job.", v2, v3, v4, v5, v6);
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "SpotlightDaemonServer done handling job with error: %@", v2, v3, v4, v5, v6);
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "CSIndexExtensionDelegate done handling job.", v2, v3, v4, v5, v6);
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_180_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "CSIndexExtensionDelegate done handling job with error: %@", v2, v3, v4, v5, v6);
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error deleting items for priority migration for default index: %@", v2, v3, v4, v5, v6);
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_215_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, (uint64_t)v0, "Failed to delete old priority index for priority migration at %@: %@", v1);
}

- (void)issuePriorityIndexFixup
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Need to perform priority migration OFF for index %@", v2, v3, v4, v5, v6);
}

- (void)reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:.cold.1()
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Cannot reindex attributes because the index is read-only. dataclass:%@", v2, v3, v4, v5, v6);
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Post fixup merged finished with error: %@", v2, v3, v4, v5, v6);
}

- (void)_cancelIdleTimer
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Index %@ timer canceled", v2, v3, v4, v5, v6);
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 168);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, a2, v4, "Index %@ timer reset %g", (uint8_t *)&v5);
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_433_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x263EF8340]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v1, (uint64_t)v1, "Error udpdating items for checked in client (%@): %@", (uint8_t *)&v2);
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_437_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [a2 dataclass];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_13(&dword_21F1CE000, a3, v6, "Complete wil modify fixup query for bundleID:%@ pc: %@", (uint8_t *)&v7);
}

void __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 dataclass];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_14(&dword_21F1CE000, a2, v4, "Complete pathFixup query pc: %@", v5);
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_13(&dword_21F1CE000, a4, a3, "Request reimport of %ld items for bundleID:%@ (expired items)", (uint8_t *)a2);
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_31();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(*(void *)v1 + 8) + 40) count];
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v2, "Request reimport of %ld items for bundleID:%@ (expired items)", v3);
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_454_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_48(v1);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v2, "Done reimporting %ld items for bundleID:%@ (expired items)", v3);
}

- (void)writeIndexSuccessfulOpenDate:.cold.1()
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_42(v1, v2), "dataclass");
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v4, "Error %@ writing index successful open date for %@", v5);
}

- (void)writeIndexDropAnalyticsDate:.cold.1()
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_42(v1, v2), "dataclass");
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v4, "Error %@ writing index drop analytics date for %@", v5);
}

- (void)writeIndexCreationDate:.cold.1()
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_42(v1, v2), "dataclass");
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v4, "Error %@ writing index creation date for %@", v5);
}

- (void)writeIndexCreationDate:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "Error fetching parent directory age: %d", v2, v3, v4, v5, v6);
}

- (void)writeSDBObjectCount:.cold.1()
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_42(v1, v2), "dataclass");
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v4, "Error %@ writing index object count for %@", v5);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(NSObject *)a3 size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = [a1 dataclass];
  uint64_t v6 = [v5 UTF8String];
  int v7 = [a2 objectForKeyedSubscript:@"indexrebuildcount"];
  uint64_t v8 = [v7 integerValue];
  __int16 v9 = [a2 objectForKeyedSubscript:@"readonly"];
  int v10 = [v9 BOOLValue];
  uint64_t v11 = [a2 objectForKeyedSubscript:@"prefix"];
  id v12 = [a2 objectForKeyedSubscript:@"propertyname"];
  id v13 = [a2 objectForKeyedSubscript:@"dropreason"];
  [v13 integerValue];
  int v16 = 136316418;
  uint64_t v17 = v6;
  OUTLINED_FUNCTION_43();
  uint64_t v18 = v8;
  __int16 v19 = 1024;
  int v20 = v10;
  __int16 v21 = 2112;
  uint64_t v22 = v11;
  __int16 v23 = 2112;
  id v24 = v12;
  __int16 v25 = v14;
  uint64_t v26 = v15;
  _os_log_error_impl(&dword_21F1CE000, a3, OS_LOG_TYPE_ERROR, "[VectorIndexDrop] (%s) count %ld, rdonly %d, prefix %@, property %@, reason %ld", (uint8_t *)&v16, 0x3Au);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Could not open heartbeat file", v2, v3, v4, v5, v6);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(void *)a1 size:(NSObject *)a2 openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 dataclass];
  [v3 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "[IndexLoss] (%s) Failed to get volume path url", v5);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.4()
{
  OUTLINED_FUNCTION_31();
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = [v1 dataclass];
  [v2 UTF8String];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v3, "[IndexLoss] (%s) Failed to get volume property flags, err:%@", v4);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(void *)a1 size:openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.5(void *a1)
{
  id v1 = [a1 dataclass];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v2, v3, "[IndexLoss] (%s) Failed to get FS info, err:%d", v4, v5, v6, v7, v8);
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(void *)a1 size:(NSObject *)a2 openingInReadOnly:fullyCreated:markedPurgeable:vectorIndexDrop:forAnalytics:.cold.6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 objectForKeyedSubscript:@"rebuildreason"];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "[IndexLoss] rebuild reason %@", v5);
}

- (void)writeIndexLossEventToFile:vector:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Empty dictionary", v2, v3, v4, v5, v6);
}

- (void)writeIndexLossEventToFile:vector:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Event does not have a timestamp", v2, v3, v4, v5, v6);
}

- (void)writeIndexLossEventToFile:vector:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Over 100 drops with same timestamp %@", v2, v3, v4, v5, v6);
}

- (void)writeIndexLossEventToFile:vector:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "[IndexLoss] Wrote to %@", v2, v3, v4, v5, v6);
}

- (void)writeIndexLossEventToFile:vector:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Failed to create file at %@", v2, v3, v4, v5, v6);
}

- (void)writeIndexLossEventToFile:vector:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Failed to create directory: %@", v2, v3, v4, v5, v6);
}

- (void)trialIntentionalDropUUID
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Error getting list of reset uuids %@", v2, v3, v4, v5, v6);
}

void __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_22(&dword_21F1CE000, v0, v1, "[%d] fetch error %@");
}

void __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_47();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_ERROR, "[%d] fetch parents for %@ error %@", v4, 0x1Cu);
}

void __73__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent_markedPurgeable___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  os_log_t v3 = [a1 valueForKey:*MEMORY[0x263F7C128]];
  [v3 integerValue];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "Failed to auto-bug capture: %ld", v5);
}

- (void)_saveCorruptIndexWithPath:shouldSendABC:fullyCreated:markedPurgeable:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, (uint64_t)v0, "Failed to move corrupt index to path:%@, error:%@", v1);
}

void __103__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated_markedPurgeable___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Failed to open index at path:%@", v2, v3, v4, v5, v6);
}

- (void)openIndexForUpgradeSynchronous:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "[IndexLoss] Failed to create touchfile: %d", v2, v3, v4, v5, v6);
}

- (void)openIndexForUpgradeSynchronous:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 dataclass];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "Can't upgrade dataclass:%@ - Not fully created", v5);
}

- (void)openIndex:(void *)a1 shouldReindexAll:(uint64_t)a2 readOnly:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_38((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v6, v4, "[IndexLoss] (%@) Trial intentional drop for %@", v5);
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "[IndexLoss] Failed to create touch file: %d", v2, v3, v4, v5, v6);
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[IndexLoss] Failed to create new index directory: %@", v2, v3, v4, v5, v6);
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.4()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "Failed to get properties of corrupted index, err: %d", v2, v3, v4, v5, v6);
}

- (void)openIndex:(void *)a1 shouldReindexAll:(NSObject *)a2 readOnly:.cold.8(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 dataclass];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "Can't open dataclass:%@ - Not fully created", v5);
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.9()
{
  OUTLINED_FUNCTION_10();
  __error();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v0, v1, "failed to set dir stats %s err %d", v2, v3, v4, v5, v6);
}

- (void)openIndex:(void *)a1 shouldReindexAll:(NSObject *)a2 readOnly:.cold.10(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 dataclass];
  [v3 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v4, "Attempting to create index for pc %s", v5);
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_891_cold_1()
{
  OUTLINED_FUNCTION_31();
  uint64_t v11 = *MEMORY[0x263EF8340];
  [*v2 timeIntervalSince1970];
  uint64_t v4 = v3;
  [v1 timeIntervalSince1970];
  int v7 = 134218240;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, v6, "<= 5 seconds off! bootTime:%.0f vs. stored bootTime:%.0f", (uint8_t *)&v7);
}

- (void)openJWLIndex
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = v0;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = v1;
  OUTLINED_FUNCTION_22(&dword_21F1CE000, v0, v2, "JWL index open failed, result:%d, dataclass:%@", v3, (void)v4, WORD4(v4));
}

- (void)mergeWithCompletionHandler:.cold.1()
{
}

- (void)cleanupStringsWithCompletionHandler:.cold.1()
{
}

- (void)fixupMessageAttachmentsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20(&dword_21F1CE000, v0, v1, "Cannot fixup messages attachment because the index is read-only", v2, v3, v4, v5, v6);
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_973_cold_1()
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "fixupMessageAttachments error %@", v2, v3, v4, v5, v6);
}

+ (void)dumpCrashStates:toFile:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, &_os_log_internal, v0, "Failed to open %s", v1, v2, v3, v4, v5);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_17(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_24(&dword_21F1CE000, v0, v1, "The index is unavailable, dataclass:%@, index:%p, suspended:%s, readOnly:%d", v2, v3, v4, v5, v6);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "JWL index open failed: %d", v2, v3, v4, v5, v6);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_3()
{
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_17(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_24(&dword_21F1CE000, v0, v1, "The index is unavailable (jwl FF off), dataclass:%@, index:%p, suspended:%s, readOnly:%d", v2, v3, v4, v5, v6);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_10();
  qos_class_self();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_46(&dword_21F1CE000, v0, v1, "QOS indexFromBundle %d %s", v2, v3, v4, v5, v6);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0;
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a3, (uint64_t)a3, "RequiresImport missing: UI:%@", a1);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_2(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(a2 + 48);
  *(_DWORD *)int buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = v4;
  _os_log_debug_impl(&dword_21F1CE000, log, OS_LOG_TYPE_DEBUG, "ABOUT TO DECODE 4 %d %@", buf, 0x12u);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_1089_cold_3()
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v1, (uint64_t)v1, "indexFromBundle: client state mismatch ... expected:%@ stored:%@", (uint8_t *)&v2);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x263EF8340]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v1, (uint64_t)v1, "Error writing back collaboration attributes for %@: %@", (uint8_t *)&v2);
}

void __186__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_itemsHTML_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_1166_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[TopHitAppShortcuts] indexFromBundle updating error %@", v2, v3, v4, v5, v6);
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Index items, bundleID:%@, items:%@");
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  int v3 = 138412802;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_43();
  uint64_t v5 = MEMORY[0x263EF8900];
  __int16 v6 = 2080;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEBUG, "Cannot index items because the index is read-only, dataclass:%@, index:%p, suspended:%s", (uint8_t *)&v3, 0x20u);
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_17(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_24(&dword_21F1CE000, v0, v1, "The index is unavailable, dataclass:%@, index:%p, suspended:%s, readonly:%d", v2, v3, v4, v5, v6);
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Allowing indexing activity while locked for bundle: %@, dataclass:%@");
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_1177_cold_2()
{
  OUTLINED_FUNCTION_33(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "SIDeleteCSAttributes, bundleID:%@, deletes:%ld");
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_1217_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_44(&dword_21F1CE000, v0, v1, "### Validation Error PC %@ validating %s: Result - %s\n");
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.1()
{
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.2()
{
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.3()
{
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.4()
{
}

- (void)startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:.cold.1()
{
}

- (void)_backgroundDeleteItems:bundleID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "_backgroundDeleteItems, bundleID:%@, identifiers:%@");
}

- (void)deleteItemsForQuery:bundleID:fromClient:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "NULL index in deleteItemsForQuery", v2, v3, v4, v5, v6);
}

- (void)deleteItemsForQuery:bundleID:fromClient:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "deleteItemsForQuery, query:\"%@\", bundleID:%@");
}

- (void)deleteSearchableItemsWithDomainIdentifiers:forBundleID:fromClient:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "domainIdentifiers:%@", v2, v3, v4, v5, v6);
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Index ref nil when updating shortcuts in delete", v2, v3, v4, v5, v6);
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_1263_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[TopHitAppShortcuts] deleteSearchableItems updating error %@", v2, v3, v4, v5, v6);
}

- (void)deleteSearchableItemsWithPersonaIds:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v1, v2, "deleteSearchableItemsWithPersonaIds, protectionClass:%@, domainIdentifiers:%@", (void)v3, DWORD2(v3));
}

- (void)deleteSearchableItemsWithFileProviderDomains:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_35(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v1, v2, "deleteSearchableItemsWithFileProviderDomains, protectionClass:%@, domains:%@", (void)v3, DWORD2(v3));
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Index ref nil in deleteWithFileProviderDomains", v2, v3, v4, v5, v6);
}

- (void)deleteAllUserActivities:fromClient:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "deleteAllUserActivities, bundleID:%@, protectionClass:%@");
}

- (void)restartAttachmentImport:maxCount:depth:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "==== restartAttachmentImport GOOD TIME", v2, v3, v4, v5, v6);
}

- (void)restartAttachmentImport:maxCount:depth:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_43();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v1, (uint64_t)v1, "==== restartAttachmentImport enter, maxCount: %lu, depth:%ld", v2);
}

void __73__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount_depth___block_invoke_1306_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_41();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  __int16 v7 = v0;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEBUG, "~~ restartAttachmentImport missing fields! %p %p %p %p", v4, 0x2Au);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, (uint64_t)v0, "Retry failed for removing index at %@ with error %@", v1);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, (uint64_t)v0, "Retrying after failure to remove index at %@ with error %@", v1);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_1345_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Index ref nil when updating shortcuts in deleteAll", v2, v3, v4, v5, v6);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_1353_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "[TopHitAppShortcuts] deleteAllSearchableItems updating error %@", v2, v3, v4, v5, v6);
}

- (void)fetchLastClientStateForBundleID:clientStateName:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "#index fetch state %@", v2, v3, v4, v5, v6);
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_cold_2()
{
}

- (void)_fetchAccumulatedStorageSizeForBundleId:completionHandler:.cold.1()
{
}

+ (void)_indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:.cold.1()
{
  OUTLINED_FUNCTION_31();
  uint64_t v8 = *MEMORY[0x263EF8340];
  [v2 count];
  int v5 = 134218240;
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_43();
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_13(&dword_21F1CE000, v0, v4, "[rewrite] qid:%ld _queryTokenRewritesWithMatchInfo: called with |topK|:%lu", (uint8_t *)&v5);
}

- (void)_removePurgeableTouchFile
{
  OUTLINED_FUNCTION_10();
  __error();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v0, v1, "Failed to remove touch file %@. errno=%d", v2, v3, v4, v5, v6);
}

- (void)getIndexDirectorySize:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Failed to open path:%@", v2, v3, v4, v5, v6);
}

- (void)getIndexDirectorySize:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Getting total size of all index files in %@", v2, v3, v4, v5, v6);
}

- (void)markDirectoryAtomicallyPurgeable:(NSObject *)a3 purgeableOrNot:.cold.2(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl(&dword_21F1CE000, a3, OS_LOG_TYPE_ERROR, "Failed to get dir stats %@. fd:%d errno:%d", (uint8_t *)&v7, 0x18u);
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! payload_fd: %d", v2, v3, v4, v5, v6);
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! container_fd: %d", v2, v3, v4, v5, v6);
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! node_fd: %d", v2, v3, v4, v5, v6);
}

@end