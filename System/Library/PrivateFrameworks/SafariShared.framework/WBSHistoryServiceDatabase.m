@interface WBSHistoryServiceDatabase
- (BOOL)_addAutocompleteTrigger:(id)a3 forURL:(id)a4 error:(id *)a5;
- (BOOL)_commitPendingItems:(id)a3;
- (BOOL)_commitPendingVisits:(id)a3;
- (BOOL)_isTesting;
- (BOOL)_prepareDatabase:(id *)a3;
- (BOOL)_reopenDatabase:(id *)a3;
- (BOOL)_shouldEmitLegacyTombstones;
- (NSString)databaseID;
- (NSURL)databaseURL;
- (WBSHistoryServiceDatabase)init;
- (WBSHistoryServiceDatabase)initWithID:(id)a3 url:(id)a4 options:(id)a5 fileOperationGroup:(id)a6 error:(id *)a7;
- (WBSHistoryServiceURLCompletion)urlCompletion;
- (double)_oldestLatestVisit;
- (id).cxx_construct;
- (id)_clearAllHistoryInsertingTombstoneUpToDate:(id)a3 clearAllSpotlightHistoryForProfile:(BOOL)a4;
- (id)_clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6;
- (id)_clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6;
- (id)_collectDeletedHighLevelDomainsForPlan:(void *)a3;
- (id)_collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:(void *)a3;
- (id)_collectDeletedHostnamesForPlan:(void *)a3;
- (id)_collectDeletedURLsForPlan:(void *)a3;
- (id)_convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4;
- (id)_dateForMetadataKey:(id)a3 error:(id *)a4;
- (id)_deleteOldestItems:(unint64_t)a3 forPlan:(void *)a4;
- (id)_ensureLatestVisitsAreComputed;
- (id)_executePlan:(void *)a3 outDeletedItemCount:(unint64_t *)a4 outDeletedVisitCount:(unint64_t *)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6;
- (id)_expireOldVisits:(double)a3;
- (id)_fetchEventsForListener:(id)a3 error:(id *)a4;
- (id)_fetchListenerNamesFromDatabase:(id *)a3;
- (id)_fetchObjectToTagMappingsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5;
- (id)_fetchTagsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5;
- (id)_fetchVisitsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5;
- (id)_findAllRelatedVisits:(const void *)a3 forPlan:(void *)a4 afterDate:(id)a5 beforeDate:(id)a6;
- (id)_findAllRelatedVisitsToItems:(const void *)a3 forPlan:(void *)a4;
- (id)_findItemIDsForPendingVisitsWithError:(id *)a3;
- (id)_findObsoleteItemsForPlan:(void *)a3;
- (id)_generateDisposedVisitsForPlan:(void *)a3;
- (id)_generateItemsDictionary:(const void *)a3;
- (id)_generateUpdatedLastVisit:(const void *)a3;
- (id)_generateVisitsDictionary:(const void *)a3;
- (id)_insertTombstonesForURLs:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6;
- (id)_lastSeenDateForCloudClientVersion:(unint64_t)a3;
- (id)_markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4;
- (id)_metadataForKey:(id)a3 error:(id *)a4;
- (id)_preparePlan:(void *)a3 ageLimit:(double)a4 itemCountLimit:(unint64_t)a5;
- (id)_preparePlan:(void *)a3 itemsToDelete:(const void *)a4 visitsToDelete:(const void *)a5 afterDate:(id)a6 beforeDate:(id)a7;
- (id)_recomputeItemScores:(void *)a3;
- (id)_recomputeVisitScores:(void *)a3;
- (id)_setMetadataValue:(id)a3 forKey:(id)a4;
- (id)_updateListenerRegistration:(id)a3 lastSeen:(double)a4;
- (int)_migrateToCurrentSchemaVersionIfNeeded;
- (int64_t)_currentGeneration;
- (int64_t)_lastSyncedGeneration;
- (int64_t)_permanentIDsForItemIfAvailable:(int64_t)a3;
- (int64_t)_permanentIDsForVisitIfAvailable:(int64_t)a3;
- (int64_t)_writeEventToDatabase:(id)a3 listeners:(id)a4 error:(id *)a5;
- (int64_t)allocateTemporaryIDRange:(int64_t *)a3;
- (unint64_t)_countOfItems;
- (unint64_t)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:(id)a3 error:(id *)a4;
- (unordered_map<long)_recomputeLatestVisitsForItems:(std:(std:(std:(long long>>> *__return_ptr)retstr :(WBSHistoryServiceDatabase *)self allocator<std:(SEL)a3 :(const void *)a4 pair<const long)long :(id *)a5 equal_to<long)long> :hash<long)long> error:;
- (void)_checkpointWriteAheadLog;
- (void)_clearWBSHistorySQLiteStoreClearHistoryKeys;
- (void)_closeTagController;
- (void)_commitPendingUpdates;
- (void)_dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6;
- (void)_ensureDatabaseIsSynced;
- (void)_finishedClearingHistory;
- (void)_notifyExecutionOfPlan:(void *)a3;
- (void)_queuePendingUpdates;
- (void)_registerHistoryTagFrecencyScoringFunction;
- (void)_removeSpotlightDonationsForItemURLs:(id)a3;
- (void)_startingClearHistoryOperationForStartDate:(id)a3 endDate:(id)a4;
- (void)_updateItem:(int64_t)a3 visitCountScore:(int64_t)a4 dailyVisitCounts:(id)a5 weeklyVisitCounts:(id)a6 shouldRecomputeDerivedVisitCounts:(BOOL)a7;
- (void)_updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 pendingVisit:(id)a6;
- (void)addAutocompleteTrigger:(id)a3 forURL:(id)a4 completionHandler:(id)a5;
- (void)addDelegate:(id)a3 listenerName:(id)a4 forConnection:(id)a5;
- (void)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 completionHandler:(id)a5;
- (void)checkIfLocalVisitExistsForDatabaseIDs:(id)a3 withCompletion:(id)a4;
- (void)clearAllHistoryInsertingTombstoneUpToDate:(id)a3 clearAllSpotlightHistoryForProfile:(BOOL)a4 completionHandler:(id)a5;
- (void)clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6 completionHandler:(id)a7;
- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6 completionHandler:(id)a7;
- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9;
- (void)convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4 completionHandler:(id)a5;
- (void)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7;
- (void)database:(id)a3 hadSevereError:(id)a4;
- (void)dealloc;
- (void)deletionPlanForAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5;
- (void)deletionPlanForItemsToDelete:(id)a3 visitsToDelete:(id)a4 completionHandler:(id)a5;
- (void)dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6;
- (void)ensureLatestVisitsAreComputed:(id)a3;
- (void)expireOldVisits:(double)a3 completionHandler:(id)a4;
- (void)exportHistory:(id)a3 completionHandler:(id)a4;
- (void)fetchAllTombstonesWithCompletionHandler:(id)a3;
- (void)fetchAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4;
- (void)fetchCloudClientVersionTable:(id)a3;
- (void)fetchDatabaseURL:(id)a3;
- (void)fetchDomainExpansions:(id)a3;
- (void)fetchEventsForListener:(id)a3 completionHandler:(id)a4;
- (void)fetchMetadataForKeys:(id)a3 completionHandler:(id)a4;
- (void)fetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5;
- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3;
- (void)flushWithCompletionHandler:(id)a3;
- (void)forceCloseWithCompletionHandler:(id)a3;
- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6;
- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)getVisitedLinksWithCompletionHandler:(id)a3;
- (void)groupVisitsIntoSessionsBetweenStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5;
- (void)importVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5;
- (void)lastSeenDateForCloudClientVersion:(unint64_t)a3 completionHandler:(id)a4;
- (void)markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4 completionHandler:(id)a5;
- (void)performMaintenanceWithAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5;
- (void)pruneTombstonesWithEndDatePriorToDate:(id)a3 completionHandler:(id)a4;
- (void)recomputeItemScoresWithCompletionHandler:(id)a3;
- (void)recordVisitWithIdentifier:(id)a3 sourceVisit:(id)a4 title:(id)a5 wasHTTPNonGet:(BOOL)a6 loadSuccessful:(BOOL)a7 origin:(int64_t)a8 attributes:(unint64_t)a9 statusCode:(int64_t)a10 completionHandler:(id)a11;
- (void)replayAndAddTombstones:(id)a3 completionHandler:(id)a4;
- (void)resetCloudHistoryDataWithCompletionHandler:(id)a3;
- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 writeHandle:(id)a6 completionHandler:(id)a7;
- (void)setLastSeenDate:(id)a3 forCloudClientVersion:(unint64_t)a4 completionHandler:(id)a5;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setTitle:(id)a3 ofTagWithID:(int64_t)a4 completionHandler:(id)a5;
- (void)startImportHistorySessionWithVisitTimePrecision:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateDatabaseAfterSuccessfulSyncWithGeneration:(int64_t)a3 completionHandler:(id)a4;
- (void)updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 completionHandler:(id)a6;
- (void)updateVisitWithIdentifier:(id)a3 title:(id)a4 completionHandler:(id)a5;
- (void)vacuumHistoryWithCompletionHandler:(id)a3;
- (void)visitIdentifiersMatchingExistingVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5;
- (void)visitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completionHandler:(id)a4;
- (void)warmUp;
@end

@implementation WBSHistoryServiceDatabase

uint64_t __59__WBSHistoryServiceDatabase__fetchEventsForListener_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __51__WBSHistoryServiceDatabase__metadataForKey_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

id __35__WBSHistoryServiceDatabase_warmUp__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _ensureLatestVisitsAreComputed];
  return (id)[*(id *)(*(void *)(a1 + 32) + 272) warmUpWithDatabase:*(void *)(*(void *)(a1 + 32) + 40)];
}

void __70__WBSHistoryServiceDatabase_fetchEventsForListener_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v4 = objc_msgSend(v2, "_updateListenerRegistration:lastSeen:", v3);
  if (v4)
  {
    id v5 = (id)v4;
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v9 = 0;
    v8 = [v6 _fetchEventsForListener:v7 error:&v9];
    id v5 = v9;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

id __68__WBSHistoryServiceDatabase_addDelegate_listenerName_forConnection___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 64) setObject:a1[5] forKey:a1[6]];
  uint64_t v3 = a1[7];
  if (v3)
  {
    [*(id *)(a1[4] + 72) setObject:v3 forKey:a1[6]];
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[7];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    return (id)objc_msgSend(v4, "_updateListenerRegistration:lastSeen:", v5);
  }
  return result;
}

- (id)_fetchEventsForListener:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v6 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"SELECT id, event_type, event_time, value FROM history_events WHERE pending_listeners LIKE ('%:' || ? || ':%') ORDER BY event_time" error:a4];
  uint64_t v7 = v6;
  v26 = v6;
  if (v6)
  {
    [v6 bindString:v27 atParameterIndex:1];
    v25 = [v7 fetch];
    if (v25)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__WBSHistoryServiceDatabase__fetchEventsForListener_error___block_invoke;
      v34[3] = &unk_1E5C8CA70;
      id v35 = v26;
      v24 = v8;
      [v8 setHandler:v34];
      id v28 = [MEMORY[0x1E4F1CA48] array];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v25;
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v13 = [v12 int64AtIndex:0];
            v14 = [v12 stringAtIndex:1];
            [v12 doubleAtIndex:2];
            double v16 = v15;
            v17 = [v12 dataAtIndex:3];
            v18 = [(WBSHistoryCrypto *)self->_crypto decryptDictionary:v17];
            if (v18)
            {
              v19 = [WBSHistoryServiceEvent alloc];
              v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v16];
              v21 = [(WBSHistoryServiceEvent *)v19 initWithEventID:v13 type:v14 time:v20 value:v18];

              if (v21) {
                [v28 addObject:v21];
              }
            }
            else
            {
              v22 = WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v37 = v13;
                _os_log_error_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_ERROR, "Failed to decrypt event %lli", buf, 0xCu);
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v9);
      }
    }
    else if (a4)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchEventsForListener:error:]");
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
    }
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (id)_updateListenerRegistration:(id)a3 lastSeen:(double)a4
{
  id v13 = a3;
  double v12 = a4;
  statements = self->_statements;
  id v11 = 0;
  uint64_t v7 = [(WBSSQLiteStatementCache *)statements statementForQuery:@"INSERT OR REPLACE INTO history_event_listeners (listener_name, last_seen) VALUES (?, ?)" error:&v11];
  id v8 = v11;
  if (v7)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,double &>(v7, &v13, &v12);
    if ([v7 execute] == 101)
    {
      [v7 reset];
      [(NSMutableSet *)self->_registeredListeners addObject:v13];
      uint64_t v9 = v8;
      id v8 = 0;
    }
    else
    {
      [v7 reset];
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _updateListenerRegistration:lastSeen:]");
      uint64_t v9 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v8;
}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  id v20 = 0;
  id v21 = 0;
  SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v21, &v20);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v21;
  id v4 = v20;
  if (v2)
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(id *)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
    id v8 = [v7 beginActivityWithOptions:0x80000000000 reason:@"-[WBSHistoryServiceDatabase fetchDomainExpansions:]"];

    MEMORY[0x1AD0C5610]();
    id v6 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_2;
    v17[3] = &unk_1E5C8D980;
    id v9 = v4;
    id v18 = v9;
    id v2 = v8;
    id v19 = v2;
    [v6 setHandler:v17];
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    [v3 closeFile];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 40), @"SELECT history_items.domain_expansion, COUNT(*) AS count FROM history_items WHERE domain_expansion IS NOT NULL GROUP BY domain_expansion" query];
    id v13 = v12;
    if (v12)
    {
      v14 = (sqlite3_stmt *)[v12 handle];
      int v22 = 3;
      SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v16, [v9 fileDescriptor]);
      do
      {
        if (sqlite3_step(v14) != 100) {
          break;
        }
        v23 = sqlite3_column_text(v14, 0);
        sqlite3_int64 v24 = sqlite3_column_int64(v14, 1);
      }
      while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v16, (uint64_t)&v22));
      SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v16);
    }
    else
    {
      double v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(*(void *)(a1 + 32) + 40) lastErrorWithMethodName:"-[WBSHistoryServiceDatabase fetchDomainExpansions:]_block_invoke"];
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_cold_1();
      }
    }
  }
}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_2(uint64_t a1)
{
  MEMORY[0x1AD0C5620]([*(id *)(a1 + 32) closeFile]);
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 endActivity:*(void *)(a1 + 40)];
}

void __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1)
{
  MEMORY[0x1AD0C5620]([*(id *)(a1 + 32) closeFile]);
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 endActivity:*(void *)(a1 + 40)];
}

void __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = [*(id *)(a1 + 32) _ensureLatestVisitsAreComputed];
  if (v2)
  {
    id v29 = (id)v2;
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  else
  {
    id v33 = 0;
    id v34 = 0;
    SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v34, &v33);
    uint64_t v5 = (WBSScopeTimeoutHandler *)objc_claimAutoreleasedReturnValue();
    id v6 = v34;
    id v7 = v33;
    if (v5)
    {
      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
    else if ((*(unsigned char *)(a1 + 56) & 0xE3) != 0)
    {
      uint64_t v10 = [WBSScopeTimeoutHandler alloc];
      id v11 = [*(id *)(a1 + 40) description];
      uint64_t v5 = [(WBSScopeTimeoutHandler *)v10 initWithTimeout:@"SafariShared" autoBugCaptureDomain:@"com.apple.Safari.History" detectedProcess:v11 context:10.0];

      double v12 = [MEMORY[0x1E4F28F80] processInfo];
      id v13 = [v12 beginActivityWithOptions:0x80000000000 reason:@"-[WBSHistoryServiceDatabase fetchWithOptions:predicate:completionHandler:]"];

      MEMORY[0x1AD0C5610]();
      id v14 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke_2;
      v30[3] = &unk_1E5C8D980;
      id v15 = v7;
      id v31 = v15;
      id v16 = v13;
      id v32 = v16;
      [v14 setHandler:v30];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v18 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)(*(void *)(a1 + 32) + 88));
      (*(void (**)(uint64_t, uint64_t, id, void))(v17 + 16))(v17, v18, v6, 0);
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = 0;

      [v6 closeFile];
      uint64_t v21 = *(void *)(a1 + 56);
      if ((v21 & 2) != 0)
      {
        id v22 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithOptions:predicate:writeDescriptor:", v21, *(void *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        uint64_t v21 = *(void *)(a1 + 56);
      }
      if ((v21 & 0x20) != 0)
      {
        id v23 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchTagsWithOptions:predicate:writeDescriptor:", v21, *(void *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        uint64_t v21 = *(void *)(a1 + 56);
      }
      if ((v21 & 0x40) != 0)
      {
        id v24 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchObjectToTagMappingsWithOptions:predicate:writeDescriptor:", v21, *(void *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        uint64_t v21 = *(void *)(a1 + 56);
      }
      if ((v21 & 0x80) != 0) {
        id v25 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchObjectToTagMappingsWithOptions:predicate:writeDescriptor:", v21, *(void *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
      }
    }
    else
    {
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v27);

      uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = *(WBSScopeTimeoutHandler **)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }
  }
}

- (id)_ensureLatestVisitsAreComputed
{
  if (self->_hasComputedLatestVisit)
  {
    uint64_t v2 = 0;
  }
  else
  {
    function_uint64_t v2 = sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], "safari_compute_latest_visit_map", 4, 5, &self->_latestVisitMap, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))WBSSQLiteComputeLatestVisitStep, (void (__cdecl *)(sqlite3_context *))WBSSQLiteComputeLatestVisitFinal, 0);
    database = self->_database;
    if (function_v2
      || (int v6 = sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)database handle], "safari_latest_visit_for", 1, 5, &self->_latestVisitMap, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))WBSSQLiteLatestVisitFor, 0, 0, 0), database = self->_database, v6))
    {
      uint64_t v2 = -[WBSSQLiteDatabase lastErrorWithMethodName:](database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _ensureLatestVisitsAreComputed]");
    }
    else
    {
      uint64_t v8 = SafariShared::WBSSQLiteDatabaseFetch<>(database, @"SELECT safari_compute_latest_visit_map(history_item, id, visit_time, synthesized) FROM history_visits");
      id v9 = [v8 nextObject];
      if (v9 || [v8 lastResultCode] == 101)
      {
        uint64_t v2 = 0;
        self->_hasComputedLatestVisit = 1;
      }
      else
      {
        uint64_t v2 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _ensureLatestVisitsAreComputed]");
      }
    }
  }
  return v2;
}

- (void)_ensureDatabaseIsSynced
{
  id pendingVisitsTimeout = self->_pendingVisitsTimeout;
  if (pendingVisitsTimeout)
  {
    dispatch_block_cancel(pendingVisitsTimeout);
    [(WBSHistoryServiceDatabase *)self _commitPendingUpdates];
  }
}

- (id)_fetchVisitsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  char v6 = a3;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  database = self->_database;
  id v55 = v8;
  v56 = self;
  statements = self->_statements;
  id v78 = 0;
  id v11 = [v8 statementForDatabase:database cache:statements fetchOptions:v6 & 0x2B error:&v78];
  id v12 = v78;
  v57 = v11;
  if (!v11)
  {
    uint64_t v18 = v12;
    goto LABEL_106;
  }
  v54 = v12;
  v77.var0.var0 = 1;
  v76.var0.var0 = 2;
  memset(v74, 0, sizeof(v74));
  int v75 = 1065353216;
  memset(v72, 0, sizeof(v72));
  int v73 = 1065353216;
  int v71 = 1065353216;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v13 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)&v56->_latestVisitMap);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v74, vcvtps_u32_f32((float)v13 / 1.0));
  unint64_t v14 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)&v56->_latestVisitMap);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v72, vcvtps_u32_f32((float)v14 / 1.0));
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v68, a5);
  id v15 = (sqlite3_stmt *)[v11 handle];
  if (v6) {
    int v16 = 10;
  }
  else {
    int v16 = 0;
  }
  if ([v55 conformsToProtocol:&unk_1EFC6D028]) {
    id v17 = v55;
  }
  else {
    id v17 = 0;
  }
  while (sqlite3_step(v15) == 100)
  {
    if (v6)
    {
      v77.var1 = sqlite3_column_int64(v15, 0);
      v77.var6 = (char *)sqlite3_column_text(v15, 1);
      v77.var2 = sqlite3_column_int64(v15, 3);
      v77.var7 = (int *)sqlite3_column_blob(v15, 4);
      v77.var8 = sqlite3_column_bytes(v15, 4);
      v77.var9 = (int *)sqlite3_column_blob(v15, 5);
      v77.var10 = sqlite3_column_bytes(v15, 5);
      v77.var4 = sqlite3_column_int64(v15, 7);
      v77.var3 = sqlite3_column_int64(v15, 8);
      v77.var5 = sqlite3_column_int64(v15, 9);
      if (!v77.var6)
      {
        uint64_t v19 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]4(&v66, v67, v19);
        }
      }
      if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v68, &v77))
      {
        id v20 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]3();
        }
        break;
      }
    }
    initializeStreamedHistoryVisitFromSQLiteRow(v15, &v76, v16);
    if (!v17 || [v17 evaluateHistoryStreamedVisit:&v76])
    {
      if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v68, &v76)) {
        break;
      }
      std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v74, (unint64_t *)&v77.var1, &v77.var1);
      std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v72, (unint64_t *)&v76.var1, &v76.var1);
      std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v69, (unint64_t *)&v76.var1);
      if ((v6 & 0x10) != 0)
      {
        if (v76.var8
          && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v72, (unint64_t *)&v76.var8))
        {
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v69, (unint64_t *)&v76.var8, &v76.var8);
        }
        if (v76.var9)
        {
          if (!std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v72, (unint64_t *)&v76.var9))std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v69, (unint64_t *)&v76.var9, &v76.var9); {
        }
          }
      }
    }
  }
  [v57 reset];
  if ((v6 & 0x10) != 0)
  {
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v56->_database query:@"SELECT * FROM history_visits WHERE id IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"];

    if (!v21)
    {
      v53 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](v56->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]();
      }

      v57 = 0;
      uint64_t v18 = -[WBSSQLiteDatabase lastErrorWithMethodName:](v56->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]");
      goto LABEL_105;
    }
    v57 = v21;
    id v22 = (sqlite3_stmt *)[v21 handle];
    long long v80 = 0u;
    long long v81 = 0u;
    int v82 = 1065353216;
    long long v63 = 0u;
    long long v64 = 0u;
    int v65 = 1065353216;
    long long v60 = 0u;
    long long v61 = 0u;
    int v62 = 1065353216;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&v60, 0x18uLL);
    if (*((void *)&v70 + 1))
    {
      while (1)
      {
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&v60);
        id v23 = (void *)v70;
        if (!(void)v70) {
          break;
        }
        unsigned int v24 = 0;
        do
        {
          sqlite3_bind_int64(v22, v24 + 1, v23[2]);
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v60, v23 + 2, v23 + 2);
          if (++v24 > 0x17) {
            break;
          }
          id v23 = (void *)*v23;
        }
        while (v23);
        if (v24 < 0x18)
        {
          int k = v24 + 1;
          goto LABEL_37;
        }
LABEL_38:
        for (int i = 0; ; ++i)
        {
          int v27 = sqlite3_step(v22);
          if (v27 != 100) {
            break;
          }
          v76.var2 = sqlite3_column_int64(v22, 1);
          v76.var1 = sqlite3_column_int64(v22, 0);
          v76.var3 = sqlite3_column_double(v22, 2);
          v76.var13 = (char *)sqlite3_column_text(v22, 3);
          v76.var4 = sqlite3_column_int64(v22, 4);
          v76.var5 = sqlite3_column_int64(v22, 5);
          v76.var6 = sqlite3_column_int64(v22, 6);
          v76.var8 = sqlite3_column_int64(v22, 7);
          v76.var9 = sqlite3_column_int64(v22, 8);
          v76.var10 = sqlite3_column_int64(v22, 9);
          v76.var11 = sqlite3_column_int64(v22, 10);
          v76.var12 = sqlite3_column_int64(v22, 11);
          v76.var7 = sqlite3_column_int64(v22, 12);
          if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v68, &v76))
          {
            uint64_t v28 = WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]2(&buf, v59, v28);
            }
            int i = 1;
            break;
          }
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v72, (unint64_t *)&v76.var1, &v76.var1);
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v69, (unint64_t *)&v76.var1);
          if (v76.var8
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v72, (unint64_t *)&v76.var8))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v69, (unint64_t *)&v76.var8, &v76.var8);
          }
          if (v76.var9
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v72, (unint64_t *)&v76.var9))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v69, (unint64_t *)&v76.var9, &v76.var9);
          }
          if (!std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v74, (unint64_t *)&v76.var2))std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v80, (unint64_t *)&v76.var2, &v76.var2); {
        }
          }
        sqlite3_reset(v22);
        if (!i)
        {
          id v29 = (void *)v61;
          if ((void)v61)
          {
            do
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v63, v29 + 2, v29 + 2);
              id v29 = (void *)*v29;
            }
            while (v29);
            long long v30 = (void *)v61;
            if ((void)v61)
            {
              do
              {
                std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v72, v30 + 2, v30 + 2);
                long long v30 = (void *)*v30;
              }
              while (v30);
              for (j = (void *)v61; j; j = (void *)*j)
              {
                v79[0] = j[2];
                std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v69, v79);
              }
            }
          }
        }
        if (!*((void *)&v70 + 1) || v27 == 100) {
          goto LABEL_62;
        }
      }
      for (int k = 1; k != 25; ++k)
LABEL_37:
        sqlite3_bind_int64(v22, k, -1);
      goto LABEL_38;
    }
LABEL_62:
    [v57 reset];
    if (*((void *)&v81 + 1) | *((void *)&v64 + 1))
    {
      id v32 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]1();
      }
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v56->_database, 0, @"PRAGMA foreign_keys = OFF") != 101)
      {
        id v33 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]0();
        }
      }
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v56->_database, 0, @"BEGIN TRANSACTION") != 101)
      {
        id v34 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.9();
        }
      }
      if (*((void *)&v81 + 1))
      {
        id v35 = v56->_database;
        v36 = createQueryWithList(@"UPDATE history_visits SET redirect_source = NULL WHERE redirect_source IN (SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)&v80, CFSTR("))");
        LODWORD(v35) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v35, 0, v36);

        if (v35 != 101)
        {
          uint64_t v37 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
          }
        }
        v38 = v56->_database;
        uint64_t v39 = createQueryWithList(@"UPDATE history_visits SET redirect_destination = NULL WHERE redirect_destination IN (SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)&v80, CFSTR("))");
        LODWORD(v38) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v38, 0, v39);

        if (v38 != 101)
        {
          v40 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
          }
        }
        v41 = v56->_database;
        v42 = createQueryWithList(@"DELETE FROM history_visits WHERE history_item IN ("), (uint64_t)&v80, CFSTR(")");
        LODWORD(v41) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v41, 0, v42);

        if (v41 != 101)
        {
          v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
          }
        }
      }
      if (*((void *)&v64 + 1))
      {
        v44 = v56->_database;
        v45 = createQueryWithList(@"UPDATE history_visits SET redirect_source = NULL WHERE redirect_source IN ("), (uint64_t)&v63, CFSTR(")");
        LODWORD(v44) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v44, 0, v45);

        if (v44 != 101)
        {
          v46 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.5();
          }
        }
        v47 = v56->_database;
        v48 = createQueryWithList(@"UPDATE history_visits SET redirect_destination = NULL WHERE redirect_destination IN ("), (uint64_t)&v63, CFSTR(")");
        LODWORD(v47) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v47, 0, v48);

        if (v47 != 101)
        {
          v49 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.4();
          }
        }
      }
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v56->_database, 0, @"COMMIT TRANSACTION") != 101)
      {
        v50 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]();
        }
      }
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v56->_database, 0, @"PRAGMA foreign_keys = ON") != 101)
      {
        v51 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)v56->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]();
        }
      }
    }
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v60);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v63);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v80);
  }
  uint64_t v18 = 0;
LABEL_105:

  SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v68);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v69);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v72);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v74);

LABEL_106:
  return v18;
}

- (void)fetchDatabaseURL:(id)a3
{
}

- (int64_t)allocateTemporaryIDRange:(int64_t *)a3
{
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSHistoryServiceDatabase_allocateTemporaryIDRange___block_invoke;
  block[3] = &unk_1E5C9C848;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(queue, block);
  *a3 = v9[3];
  int64_t v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)addDelegate:(id)a3 listenerName:(id)a4 forConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__WBSHistoryServiceDatabase_addDelegate_listenerName_forConnection___block_invoke;
  v15[3] = &unk_1E5C9B5C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)fetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__23;
  v15[4] = __Block_byref_object_dispose__23;
  id v16 = (id)MEMORY[0x1AD0C4F80](a5);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9C870;
  id v13 = v15;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);

  _Block_object_dispose(v15, 8);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *((unsigned char *)self + 224) = 0;
  return self;
}

- (void)fetchMetadataForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WBSHistoryServiceDatabase fetchMetadataForKeys:completionHandler:]((uint64_t)v6, v8);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSHistoryServiceDatabase_fetchMetadataForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  id v13 = v6;
  unint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __77__WBSHistoryServiceDatabase_initWithID_url_options_fileOperationGroup_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _prepareDatabase:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (WBSHistoryServiceDatabase)initWithID:(id)a3 url:(id)a4 options:(id)a5 fileOperationGroup:(id)a6 error:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v51.receiver = self;
  v51.super_class = (Class)WBSHistoryServiceDatabase;
  id v16 = [(WBSHistoryServiceDatabase *)&v51 init];
  if (v16)
  {
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceDatabase", v17);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_fileOperationGroup, a6);
    objc_storeStrong((id *)&v16->_databaseID, a3);
    objc_storeStrong((id *)&v16->_databaseURL, a4);
    objc_storeStrong((id *)&v16->_databaseOptions, a5);
    v16->_currentRangeForTemporaryID = 1;
    id v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingVisits = v16->_pendingVisits;
    v16->_pendingVisits = v20;

    id v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v42);
    id v23 = objc_alloc_init(WBSHistoryCrypto);
    crypto = v16->_crypto;
    v16->_crypto = v23;

    id v25 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      [v22 timeIntervalSinceNow];
      -[WBSHistoryServiceDatabase initWithID:url:options:fileOperationGroup:error:](v26);
    }

    uint64_t v27 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegates = v16->_delegates;
    v16->_delegates = (NSMapTable *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v29;

    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    id v31 = [MEMORY[0x1E4F1C9C8] date];
    id v32 = v16->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__WBSHistoryServiceDatabase_initWithID_url_options_fileOperationGroup_error___block_invoke;
    block[3] = &unk_1E5C9C820;
    v45 = &v47;
    id v33 = v16;
    v44 = v33;
    v46 = a7;
    dispatch_sync(v32, block);
    if (*((unsigned char *)v48 + 24))
    {
      id v34 = 0;
    }
    else
    {
      id v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        [v31 timeIntervalSinceNow];
        *(_DWORD *)uint8_t buf = 136446466;
        v53 = "database_total_opening";
        __int16 v54 = 2048;
        double v55 = -v36;
        _os_log_impl(&dword_1A6B5F000, v35, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
      }

      uint64_t v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      v38 = objc_msgSend(v37, "safari_settingsDirectoryURL");
      uint64_t v39 = [v38 URLByAppendingPathComponent:@"ClearHistoryInProgress" isDirectory:0];
      clearHistoryInProgressFileURL = v33->_clearHistoryInProgressFileURL;
      v33->_clearHistoryInProgressFileURL = (NSURL *)v39;

      id v34 = v33;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

- (BOOL)_prepareDatabase:(id *)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  int64_t v5 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:self->_databaseURL queue:self->_queue];
  database = self->_database;
  self->_database = v5;

  uint64_t v56 = [MEMORY[0x1E4F1C9C8] date];
  if ([(WBSSQLiteDatabase *)self->_database openWithAccessType:3 error:a3])
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [v56 timeIntervalSinceNow];
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.7(v8);
    }

    if ([(NSDictionary *)self->_databaseOptions safari_BOOLForKey:@"WBSHistoryConnectionOptionCheckIntegrity"])
    {
      id v57 = [MEMORY[0x1E4F1C9C8] date];
      id v9 = [(WBSSQLiteDatabase *)self->_database checkIntegrity];
      id v10 = v9;
      if (v9)
      {
        if (a3) {
          *a3 = v9;
        }
        id v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _prepareDatabase:].cold.6();
        }

        [(WBSSQLiteDatabase *)self->_database close];
        BOOL v12 = 0;
LABEL_55:

        goto LABEL_56;
      }
      id v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        [v57 timeIntervalSinceNow];
        -[WBSHistoryServiceDatabase _prepareDatabase:].cold.5(v15);
      }
    }
    id v16 = self->_database;
    id v62 = 0;
    char v17 = [(WBSSQLiteDatabase *)v16 enableWAL:&v62];
    id v57 = v62;
    if (v17)
    {
      [MEMORY[0x1E4F1C9C8] date];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      double v55 = v59 = 0u;
      uint64_t v18 = [&unk_1EFC22190 countByEnumeratingWithState:&v58 objects:v106 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(&unk_1EFC22190);
            }
            uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            id v22 = [v21 objectAtIndexedSubscript:0];
            int v23 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, v22);
            unsigned int v24 = [v21 objectAtIndexedSubscript:1];
            BOOL v25 = v23 == [v24 intValue];

            if (!v25)
            {
              v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                databaseURL = self->_databaseURL;
                char v50 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
                *(_DWORD *)uint8_t buf = 138544643;
                *(void *)&uint8_t buf[4] = v22;
                *(_WORD *)&buf[12] = 2113;
                *(void *)_HistoryStreamedVisit v76 = databaseURL;
                *(_WORD *)&v76[8] = 1024;
                *(_DWORD *)_HistoryStreamedItem v77 = v23;
                *(_WORD *)&v77[4] = 2080;
                *(void *)&v77[6] = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
                *(_WORD *)&v77[14] = 2114;
                *(void *)&v77[16] = v50;
                *(_WORD *)&v77[24] = 1024;
                *(_DWORD *)&v77[26] = v23;
                _os_log_error_impl(&dword_1A6B5F000, v44, OS_LOG_TYPE_ERROR, "Failed to set pragma \"%{public}@\" for History store at URL: %{private}@ with error: %d: %s %{public}@ (%d)", buf, 0x36u);
              }
              [(WBSSQLiteDatabase *)self->_database close];
              goto LABEL_53;
            }
          }
          uint64_t v18 = [&unk_1EFC22190 countByEnumeratingWithState:&v58 objects:v106 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      double v26 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        [v55 timeIntervalSinceNow];
        -[WBSHistoryServiceDatabase _prepareDatabase:](v27);
      }

      id v22 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v28 = 0;
      *(void *)uint8_t buf = "safari_sha512";
      *(_DWORD *)&buf[8] = 2;
      *(void *)&v76[2] = WBSSQLiteSHA512;
      *(void *)_HistoryStreamedItem v77 = 0;
      *(void *)&v77[8] = 0;
      *(void *)&v77[16] = "safari_domainexpansion";
      *(_DWORD *)&v77[24] = 1;
      id v78 = WBSSQLiteExtractDomainExpansion;
      uint64_t v79 = 0;
      uint64_t v80 = 0;
      long long v81 = "safari_hostname";
      int v82 = 1;
      uint64_t v83 = WBSSQLiteExtractHostname;
      uint64_t v84 = 0;
      uint64_t v85 = 0;
      v86 = "safari_high_level_domain";
      int v87 = 1;
      v88 = WBSSQLiteExtractHighLevelDomain;
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      v91 = "safari_visit_score";
      int v92 = 2;
      v93 = WBSSQLiteVisitScore;
      uint64_t v94 = 0;
      uint64_t v95 = 0;
      v96 = "safari_compute_daily_visit_counts";
      int v97 = 4;
      uint64_t v98 = 0;
      v99 = WBSSQLiteDailyVisitCountsStep;
      v100 = WBSSQLiteDailyVisitCountsFinal;
      v101 = "safari_compute_weekly_visit_counts";
      int v102 = 4;
      uint64_t v103 = 0;
      v104 = WBSSQLiteWeeklyVisitCountsStep;
      v105 = WBSSQLiteWeeklyVisitCountsFinal;
      while (1)
      {
        uint64_t v29 = *(const char **)&buf[v28];
        function_uint64_t v2 = sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], v29, *(_DWORD *)&buf[v28 + 8], 2049, 0, *(void (__cdecl **)(sqlite3_context *, int, sqlite3_value **))&v76[v28 + 2], *(void (__cdecl **)(sqlite3_context *, int, sqlite3_value **))&v77[v28], *(void (__cdecl **)(sqlite3_context *))&v77[v28 + 8], 0);
        if (function_v2) {
          break;
        }
        v28 += 40;
        if (v28 == 280)
        {
          id v31 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            [v22 timeIntervalSinceNow];
            -[WBSHistoryServiceDatabase _prepareDatabase:](v32);
          }

          id v33 = [MEMORY[0x1E4F1C9C8] date];
          int v34 = [(WBSHistoryServiceDatabase *)self _migrateToCurrentSchemaVersionIfNeeded];
          BOOL v12 = v34 == 16;
          if (v34 == 16)
          {
            id v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              [v33 timeIntervalSinceNow];
              -[WBSHistoryServiceDatabase _prepareDatabase:](v36);
            }

            uint64_t v37 = objc_alloc_init(WBSHistoryServiceURLCompletion);
            urlCompletion = self->_urlCompletion;
            self->_urlCompletion = v37;

            uint64_t v39 = (WBSSQLiteStatementCache *)[objc_alloc(MEMORY[0x1E4F97FA8]) initWithDatabase:self->_database];
            statements = self->_statements;
            self->_statements = v39;

            [(WBSSQLiteDatabase *)self->_database setDelegate:self];
            [(WBSHistoryServiceDatabase *)self _registerHistoryTagFrecencyScoringFunction];
            v41 = [[WBSHistoryTagDatabaseController alloc] initWithDatabase:self->_database];
            tagController = self->_tagController;
            self->_tagController = v41;

            [(WBSHistoryServiceDatabase *)self warmUp];
          }
          else
          {
            uint64_t v47 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v53 = self->_databaseURL;
              __int16 v54 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
              *(_DWORD *)uint8_t buf = 67110403;
              *(_DWORD *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = 16;
              *(_WORD *)_HistoryStreamedVisit v76 = 2113;
              *(void *)&v76[2] = v53;
              *(_WORD *)_HistoryStreamedItem v77 = 2080;
              *(void *)&v77[2] = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
              *(_WORD *)&v77[10] = 2114;
              *(void *)&v77[12] = v54;
              *(_WORD *)&v77[20] = 1024;
              *(_DWORD *)&v77[22] = 0;
              _os_log_error_impl(&dword_1A6B5F000, v47, OS_LOG_TYPE_ERROR, "History store schema version (%d) does not match our supported schema version (%d) in store at %{private}@: %s %{public}@ (%d)", buf, 0x32u);
            }
            [(WBSSQLiteDatabase *)self->_database close];
          }

          goto LABEL_54;
        }
      }
      v45 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_super v51 = self->_databaseURL;
        v52 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        *(_DWORD *)long long v63 = 136447491;
        long long v64 = v29;
        __int16 v65 = 2113;
        uint8_t v66 = v51;
        __int16 v67 = 1024;
        int v68 = function_v2;
        __int16 v69 = 2080;
        long long v70 = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
        __int16 v71 = 2114;
        v72 = v52;
        __int16 v73 = 1024;
        int v74 = function_v2;
        _os_log_error_impl(&dword_1A6B5F000, v45, OS_LOG_TYPE_ERROR, "Failed to create function: \"%{public}s\" for History store at URL: %{private}@ with error: %d: %s %{public}@ (%d)", v63, 0x36u);
      }
      [(WBSSQLiteDatabase *)self->_database close];
LABEL_53:
      BOOL v12 = 0;
LABEL_54:

      id v10 = v55;
      goto LABEL_55;
    }
    v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v57, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.4();
    }

    if (a3) {
      *a3 = v57;
    }
    [(WBSSQLiteDatabase *)self->_database close];
  }
  else
  {
    if (a3) {
      id v57 = *a3;
    }
    else {
      id v57 = 0;
    }
    id v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v57, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.8();
    }

    [(WBSSQLiteDatabase *)self->_database close];
  }
  BOOL v12 = 0;
LABEL_56:

  return v12;
}

- (void)warmUp
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __35__WBSHistoryServiceDatabase_warmUp__block_invoke;
  activity_block[3] = &unk_1E5C8CA70;
  activity_void block[4] = self;
  _os_activity_initiate(&dword_1A6B5F000, "Warm Up", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

- (void)_registerHistoryTagFrecencyScoringFunction
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to create a frecency sorting function with error code: %d", (uint8_t *)v2, 8u);
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  uint64_t v3 = [WBSHistorySQLiteSchema alloc];
  crypto = self->_crypto;
  database = self->_database;
  id v6 = [(NSDictionary *)self->_databaseOptions safari_dateForKey:@"WBSHistoryConnectionOptionLegacyDatabaseImportAfterDate"];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  double v8 = [(WBSHistorySQLiteSchema *)v3 initWithDatabase:database crypto:crypto migrateVisitsAfterDate:v7];
  if (!v6) {

  }
  int v9 = [(WBSHistorySQLiteSchema *)v8 migrateToCurrentSchemaVersionIfNeeded];
  return v9;
}

void *__54__WBSHistoryServiceDatabase_allocateTemporaryIDRange___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = ((*(void *)(result[4] + 24))++ << 47) | 0x8000000000000000;
  *(void *)(*(void *)(result[6] + 8) + 24) = (*(void *)(result[4] + 24) << 47) | 0x8000000000000000;
  return result;
}

void __35__WBSHistoryServiceDatabase_warmUp__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WBSHistoryServiceDatabase_warmUp__block_invoke_2;
  block[3] = &unk_1E5C8CA70;
  void block[4] = v1;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);
}

- (void)fetchDomainExpansions:(id)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__23;
  v6[4] = __Block_byref_object_dispose__23;
  id v7 = (id)MEMORY[0x1AD0C4F80](a3, a2);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke;
  v5[3] = &unk_1E5C8E1B8;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(queue, v5);
  _Block_object_dispose(v6, 8);
}

void __68__WBSHistoryServiceDatabase_fetchMetadataForKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      double v8 = v4;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v10 = *(void **)(a1 + 40);
        id v13 = v8;
        id v11 = [v10 _metadataForKey:v9 error:&v13];
        id v4 = v13;

        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v4 == 0;
        }
        if (!v12)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_14;
        }
        [v2 setObject:v11 forKeyedSubscript:v9];

        ++v7;
        double v8 = v4;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (id)_metadataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"SELECT value FROM metadata WHERE key = ?" error:a4];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__WBSHistoryServiceDatabase__metadataForKey_error___block_invoke;
    v15[3] = &unk_1E5C8CA70;
    id v9 = v7;
    id v16 = v9;
    [v8 setHandler:v15];
    [v9 bindString:v6 atParameterIndex:1];
    id v10 = [v9 fetch];
    id v11 = [v10 nextObject];
    BOOL v12 = v11;
    if (v11)
    {
      id v13 = [v11 objectAtIndex:0];
    }
    else if (a4 && [v10 lastResultCode] != 101)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _metadataForKey:error:]");
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)fetchEventsForListener:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__WBSHistoryServiceDatabase_fetchEventsForListener_completionHandler___block_invoke;
    block[3] = &unk_1E5C8D730;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (WBSHistoryServiceDatabase)init
{
  return 0;
}

- (void)dealloc
{
  id v3 = self->_statements;
  id v4 = self->_database;
  queue = self->_queue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WBSHistoryServiceDatabase_dealloc__block_invoke;
  block[3] = &unk_1E5C8D980;
  id v11 = v3;
  id v12 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_group_async(fileOperationGroup, queue, block);

  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryServiceDatabase;
  [(WBSHistoryServiceDatabase *)&v9 dealloc];
}

uint64_t __36__WBSHistoryServiceDatabase_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 close];
}

- (void)forceCloseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSHistoryServiceDatabase_forceCloseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __61__WBSHistoryServiceDatabase_forceCloseWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _closeTagController];
  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) close];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (BOOL)_reopenDatabase:(id *)a3
{
  [(WBSSQLiteStatementCache *)self->_statements invalidate];
  statements = self->_statements;
  self->_statements = 0;

  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;

  SafariShared::LatestVisitInformationMap::clear((SafariShared::LatestVisitInformationMap *)&self->_latestVisitMap);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&self->_temporaryIDToItem.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&self->_visitForTemporaryID.__table_.__bucket_list_.__ptr_.__value_);
  self->_hasComputedLatestVisit = 0;
  [(WBSHistoryServiceDatabase *)self _closeTagController];
  return [(WBSHistoryServiceDatabase *)self _prepareDatabase:a3];
}

- (void)_closeTagController
{
  tagController = self->_tagController;
  self->_tagController = 0;
}

- (void)database:(id)a3 hadSevereError:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  char v7 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_integrityCheckPending.__a_.__a_value, (unsigned __int8 *)&v7, 1u);
  if (!v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke;
    v9[3] = &unk_1E5C8D980;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(queue, v9);
  }
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t *)(a1 + 32);
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 224));
  [*(id *)(*(void *)(a1 + 32) + 40) setDelegate:0];
  uint64_t v2 = [*(id *)(*v1 + 40) checkIntegrity];

  uint64_t v3 = *v1;
  if (v2)
  {
    [*(id *)(v3 + 56) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    [*(id *)(*(void *)(a1 + 32) + 40) close];
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    [*(id *)(a1 + 32) _closeTagController];
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_3();
    }

    objc_super v9 = dispatch_group_create();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
          dispatch_group_enter(v9);
          uint64_t v15 = *(void *)(a1 + 40);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_36;
          v33[3] = &unk_1E5C8CA70;
          int v34 = v9;
          [v14 reportSevereError:v15 completionHandler:v33];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v9, v16);
    long long v17 = *(void **)(a1 + 32);
    id v32 = 0;
    char v18 = [v17 _reopenDatabase:&v32];
    id v19 = v32;
    if ((v18 & 1) == 0)
    {
      id v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_2();
      }

      uint64_t v21 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_1A6B5F000, v21, OS_LOG_TYPE_DEFAULT, "Falling back to in-memory database", buf, 2u);
      }
      uint64_t v22 = WBSHistoryInMemoryDatabaseURL();
      uint64_t v23 = *(void *)(a1 + 32);
      unsigned int v24 = *(void **)(v23 + 264);
      *(void *)(v23 + 264) = v22;

      BOOL v25 = *(void **)(a1 + 32);
      id v31 = 0;
      char v26 = [v25 _reopenDatabase:&v31];
      id v27 = v31;
      if ((v26 & 1) == 0)
      {
        uint64_t v28 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    uint64_t v29 = *(void **)(v3 + 40);
    objc_msgSend(v29, "setDelegate:");
  }
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_36(uint64_t a1)
{
}

- (void)ensureLatestVisitsAreComputed:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasComputedLatestVisit)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  else
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke;
    v7[3] = &unk_1E5C8C9F8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureLatestVisitsAreComputed];
  qos_class_t v3 = qos_class_self();
  id v4 = dispatch_get_global_queue(v3, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke_2;
  v7[3] = &unk_1E5C8C660;
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (unordered_map<long)_recomputeLatestVisitsForItems:(std:(std:(std:(long long>>> *__return_ptr)retstr :(WBSHistoryServiceDatabase *)self allocator<std:(SEL)a3 :(const void *)a4 pair<const long)long :(id *)a5 equal_to<long)long> :hash<long)long> error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_hasComputedLatestVisit)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *((void *)a4 + 3);
      *(_DWORD *)uint8_t buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Recomputing latest visits for %zu items", buf, 0xCu);
    }
    *(_OWORD *)uint8_t buf = 0u;
    long long v25 = 0u;
    int v26 = 1065353216;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)buf, (unint64_t)(float)*((unint64_t *)a4 + 3));
    p_latestVisitMap = &self->_latestVisitMap;
    SafariShared::LatestVisitInformationMap::lastVisitsForItems(&self->_latestVisitMap._map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)a4, (uint64_t)buf);
    SafariShared::LatestVisitInformationMap::removeItems((uint64_t *)&self->_latestVisitMap, (uint64_t)a4);
    database = self->_database;
    uint64_t v13 = createQueryWithList(@"SELECT safari_compute_latest_visit_map(history_item, id, visit_time, synthesized) FROM history_visits WHERE history_item IN ("), (uint64_t)a4, CFSTR(")");
    long long v14 = SafariShared::WBSSQLiteDatabaseFetch<>(database, v13);

    uint64_t v15 = [v14 nextObject];
    if (!v15 && [v14 lastResultCode] != 101)
    {
      if (a5)
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v18 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]();
        }
      }
    }
    retstr->__table_.__bucket_list_ = 0u;
    *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
    retstr->__table_.__p3_.__value_ = 1.0;
    for (uint64_t i = (void *)v25; i; uint64_t i = (void *)*i)
    {
      unint64_t v20 = i[2];
      uint64_t v21 = (void *)i[3];
      VisitID = SafariShared::LatestVisitInformationMap::lastVisitID((SafariShared::LatestVisitInformationMap *)p_latestVisitMap, v20);
      if (VisitID != v21)
      {
        *(void *)&long long v23 = v20;
        *((void *)&v23 + 1) = VisitID;
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::pair<long long,long long>>((uint64_t)retstr, (unint64_t *)&v23, &v23);
      }
    }

    return (unordered_map<long long, long long, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, long long>>> *)std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
  }
  else
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
    dispatch_time_t v16 = WBS_LOG_CHANNEL_PREFIXHistory();
    uint64_t result = (unordered_map<long long, long long, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, long long>>> *)os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (result) {
      -[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]();
    }
    retstr->__table_.__bucket_list_ = 0u;
    *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
    retstr->__table_.__p3_.__value_ = 1.0;
  }
  return result;
}

- (id)_fetchTagsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  id v7 = a4;
  database = self->_database;
  statements = self->_statements;
  id v22 = 0;
  uint64_t v10 = [v7 statementForDatabase:database cache:statements fetchOptions:32 error:&v22];
  id v11 = v22;
  if (v10)
  {
    LODWORD(v16) = 7;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v15, a5);
    uint64_t v12 = (sqlite3_stmt *)[v10 handle];
    do
    {
      if (sqlite3_step(v12) != 100) {
        break;
      }
      *((void *)&v16 + 1) = sqlite3_column_int64(v12, 0);
      sqlite3_int64 v17 = sqlite3_column_int64(v12, 1);
      sqlite3_int64 v18 = sqlite3_column_int64(v12, 2);
      id v19 = sqlite3_column_text(v12, 3);
      unint64_t v20 = sqlite3_column_text(v12, 4);
      double v21 = sqlite3_column_double(v12, 5);
    }
    while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v15, &v16));
    [v10 reset];
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v15);
    uint64_t v13 = v11;
    id v11 = 0;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v11;
}

- (id)_fetchObjectToTagMappingsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  id v8 = a4;
  database = self->_database;
  statements = self->_statements;
  id v20 = 0;
  id v11 = [v8 statementForDatabase:database cache:statements fetchOptions:a3 error:&v20];
  id v12 = v20;
  if (v11)
  {
    LODWORD(v17) = 8;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v16, a5);
    uint64_t v13 = (sqlite3_stmt *)[v11 handle];
    do
    {
      if (sqlite3_step(v13) != 100) {
        break;
      }
      *((void *)&v17 + 1) = sqlite3_column_int64(v13, 0);
      sqlite3_int64 v18 = sqlite3_column_int64(v13, 1);
      double v19 = sqlite3_column_double(v13, 2);
    }
    while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v16, &v17));
    [v11 reset];
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v16);
    long long v14 = v12;
    id v12 = 0;
  }
  else
  {
    long long v14 = 0;
  }

  return v12;
}

- (void)getVisitedLinksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WBSHistoryServiceDatabase_getVisitedLinksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__WBSHistoryServiceDatabase_getVisitedLinksWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = SafariShared::WBSSQLiteDatabaseFetch<>(*(void **)(*(void *)(a1 + 32) + 40), @"SELECT url FROM history_items");
  qos_class_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = (void *)MEMORY[0x1E4F1CB10];
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "stringAtIndex:", 0, (void)v12);
        uint64_t v10 = objc_msgSend(v8, "safari_URLWithDataAsString:", v9);

        if (v10) {
          [v3 addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v11 = [v4 statement];
  [v11 invalidate];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)groupVisitsIntoSessionsBetweenStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9B058;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke(id *a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [a1[4] _ensureDatabaseIsSynced];
  uint64_t v2 = (void *)*((void *)a1[4] + 5);
  [a1[5] timeIntervalSinceReferenceDate];
  uint64_t v43 = v3;
  id v20 = a1;
  [a1[6] timeIntervalSinceReferenceDate];
  uint64_t v37 = v4;
  double v21 = SafariShared::WBSSQLiteDatabaseFetch<double,double>(v2, @"SELECT url, title, visit_time FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE history_visits.id = safari_latest_visit_for (history_items.id)AND visit_time >= ? AND visit_time <= ? ORDER BY visit_time DESC", (double *)&v43, (double *)&v37);
  id v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__101;
  uint64_t v47 = __Block_byref_object_dispose__102;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__101;
  uint64_t v41 = __Block_byref_object_dispose__102;
  id v42 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke_103;
  v32[3] = &unk_1E5C9C898;
  id v27 = v22;
  id v33 = v27;
  long long v35 = &v37;
  id v24 = v23;
  id v34 = v24;
  long long v36 = &v43;
  long long v25 = (void (**)(void))MEMORY[0x1AD0C4F80](v32);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v21;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1AD0C4CF0]();
        id v10 = (void *)MEMORY[0x1E4F1C9C8];
        [v8 doubleAtIndex:2];
        uint64_t v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
        if (v38[5] && (objc_msgSend(v27, "isDate:inSameDayAsDate:", v11) & 1) == 0)
        {
          v25[2]();
          [(id)v44[5] removeAllObjects];
        }
        id v12 = (void *)MEMORY[0x1E4F1CB10];
        id v13 = [v8 stringAtIndex:0];
        id v14 = objc_msgSend(v12, "safari_URLWithDataAsString:", v13);

        long long v15 = [v8 stringAtIndex:1];
        id v16 = (void *)v44[5];
        id v17 = [[WBSRemoteHistoryItem alloc] initWithURL:v14 title:v15 lastVisitTime:v11];
        [v16 addObject:v17];

        id v18 = (void *)v38[5];
        v38[5] = v11;

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v49 count:16];
    }
    while (v5);
  }

  if ([(id)v44[5] count]) {
    v25[2]();
  }
  double v19 = [obj statement];
  [v19 invalidate];

  (*((void (**)(void))v20[7] + 2))();
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke_103(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) startOfDayForDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:1];
  uint64_t v3 = [*(id *)(a1 + 32) dateByAddingComponents:v2 toDate:v6 options:4096];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [[WBSRemoteHistorySession alloc] initWithStartDate:v6 endDate:v3 items:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v4 addObject:v5];
}

- (void)fetchCloudClientVersionTable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v9 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke_2;
  v6[3] = &unk_1E5C9C8C0;
  id v4 = v2;
  id v7 = v4;
  id v8 = (id)MEMORY[0x1AD0C4F80](v6);
  SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(int,NSDate *)>(v3, (uint64_t)&v9, @"SELECT client_version, last_seen FROM history_client_versions", &v8);
  id v5 = v9;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithInt:a2];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (id)_lastSeenDateForCloudClientVersion:(unint64_t)a3
{
  unint64_t v9 = a3;
  uint64_t v3 = SafariShared::WBSSQLiteDatabaseFetch<unsigned long &>(self->_database, @"SELECT last_seen FROM history_client_versions WHERE client_version = ?", &v9);
  id v4 = [v3 nextObject];
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  if (v4)
  {
    [v4 doubleAtIndex:0];
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = };

  return v7;
}

- (void)lastSeenDateForCloudClientVersion:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__WBSHistoryServiceDatabase_lastSeenDateForCloudClientVersion_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C8E8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __81__WBSHistoryServiceDatabase_lastSeenDateForCloudClientVersion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _lastSeenDateForCloudClientVersion:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)setLastSeenDate:(id)a3 forCloudClientVersion:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke;
    v12[3] = &unk_1E5C9AFE0;
    v12[4] = self;
    unint64_t v15 = a4;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(queue, v12);
  }
  else
  {
    unint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

void __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke(uint64_t a1)
{
  v19[5] = *(double *)MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 56);
  uint64_t v3 = [*(id *)(a1 + 32) _lastSeenDateForCloudClientVersion:*(void *)(a1 + 56)];
  if (v3 && [*(id *)(a1 + 40) compare:v3] != 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 56);
    id v18 = 0;
    id v5 = [v4 statementForQuery:@"INSERT OR REPLACE INTO history_client_versions (client_version, last_seen)VALUES (?, ?)", &v18 error];
    id v6 = v18;
    if (v5)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      unint64_t v15 = __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_2;
      id v16 = &unk_1E5C8CA70;
      id v8 = v5;
      id v17 = v8;
      [v7 setHandler:&v13];
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate", v13, v14, v15, v16);
      v19[0] = v9;
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long const&,double>(v8, v2, v19);
      if ([v8 execute] == 101)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        id v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_cold_1();
        }

        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = [*(id *)(*(void *)(a1 + 32) + 40) lastErrorWithMethodName:"-[WBSHistoryServiceDatabase setLastSeenDate:forCloudClientVersion:completionHandler:]_block_invoke"];
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (BOOL)_shouldEmitLegacyTombstones
{
  id v2 = [(WBSHistoryServiceDatabase *)self _lastSeenDateForCloudClientVersion:1];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 > -7776000.0;

  return v4;
}

- (id)_setMetadataValue:(id)a3 forKey:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      database = self->_database;
      id v32 = v6;
      int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSData * {__strong}>(database, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, &v32);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = self->_database;
        id v31 = v6;
        int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}>(v12, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, &v31);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = self->_database;
          [v6 timeIntervalSinceReferenceDate];
          *(void *)uint8_t buf = v14;
          int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v13, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, (double *)buf);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            double v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              id v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _setMetadataValue:forKey:]();
            }

            uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
            goto LABEL_28;
          }
          id v15 = v6;
          id v16 = (const char *)[v15 objCType];
          if (!strcmp(v16, "B"))
          {
            long long v23 = self->_database;
            buf[0] = [v15 BOOLValue];
            int v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,BOOL>(v23, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, buf);
          }
          else if (!strcmp(v16, "f") || !strcmp(v16, "d"))
          {
            double v21 = self->_database;
            [v15 doubleValue];
            *(void *)uint8_t buf = v22;
            int v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v21, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, (double *)buf);
          }
          else
          {
            id v17 = self->_database;
            *(void *)uint8_t buf = [v15 longLongValue];
            int v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long>(v17, 0, @"INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)", &v33, buf);
          }
          int v8 = v18;
        }
      }
    }
    if (v8 == 101) {
      goto LABEL_24;
    }
    long long v25 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v27 = v33;
      long long v28 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)uint8_t buf = 138413058;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v35 = 2080;
      long long v36 = "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]";
      __int16 v37 = 2114;
      long long v38 = v28;
      __int16 v39 = 1024;
      int v40 = v8;
      _os_log_error_impl(&dword_1A6B5F000, v25, OS_LOG_TYPE_ERROR, "Failed to update metadata value %@: %s %{public}@ (%d)", buf, 0x26u);
    }
    uint64_t v11 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]");
  }
  else
  {
    int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, @"DELETE FROM metadata WHERE key = ?", &v33);
    if (v9 == 101)
    {
LABEL_24:
      id v24 = 0;
      goto LABEL_29;
    }
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v29 = v33;
      long long v30 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)uint8_t buf = 138413058;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v35 = 2080;
      long long v36 = "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]";
      __int16 v37 = 2114;
      long long v38 = v30;
      __int16 v39 = 1024;
      int v40 = v9;
      _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to delete metadata value %@: %s %{public}@ (%d)", buf, 0x26u);
    }
    uint64_t v11 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]");
  }
LABEL_28:
  id v24 = (void *)v11;
LABEL_29:

  return v24;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (v9)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__WBSHistoryServiceDatabase_setMetadataValue_forKey_completionHandler___block_invoke;
    v14[3] = &unk_1E5C9C910;
    id v17 = v10;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(queue, v14);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

void __71__WBSHistoryServiceDatabase_setMetadataValue_forKey_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  id v2 = [*(id *)(a1 + 32) _setMetadataValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (unint64_t)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:]((uint64_t)v6, v7);
  }
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  id v10 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"DELETE FROM history_tombstones WHERE end_time < ?" error:a4];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__WBSHistoryServiceDatabase__pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate_error___block_invoke;
    v16[3] = &unk_1E5C8CA70;
    id v12 = v10;
    id v17 = v12;
    [v11 setHandler:v16];
    [v12 bindDouble:1 atParameterIndex:v9];
    if ([v12 execute] == 101)
    {
      unint64_t v13 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
    }
    else
    {
      uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:]();
      }

      if (a4)
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:]");
        unint64_t v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v13 = 0;
      }
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

uint64_t __89__WBSHistoryServiceDatabase__pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)pruneTombstonesWithEndDatePriorToDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__WBSHistoryServiceDatabase_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke;
    block[3] = &unk_1E5C8D730;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

void __85__WBSHistoryServiceDatabase_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int64_t v33 = a4;
  int64_t v34 = a3;
  int v26 = [MEMORY[0x1E4F1CA60] dictionary];
  SafariShared::WBSSQLiteDatabaseFetch<long long &,long long &>(self->_database, @"SELECT id, url FROM history_tombstones WHERE generation > ? AND generation <= ? AND url IS NOT NULL", &v33, &v34);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    id v24 = @"url_salt";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "int64AtIndex:", 0, v24);
        double v9 = [v7 dataAtIndex:1];
        uint64_t v10 = [(WBSHistoryCrypto *)self->_crypto decryptDictionary:v9];
        id v11 = (void *)[(id)v10 mutableCopy];

        id v12 = [v11 objectForKeyedSubscript:@"url"];
        LOBYTE(v10) = v12 == 0;

        if ((v10 & 1) == 0)
        {
          unint64_t v13 = [v11 objectForKeyedSubscript:@"url_hash"];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            id v15 = [(WBSHistoryCrypto *)self->_crypto salt];
            id v16 = objc_msgSend(v11, "safari_stringForKey:", @"url");
            id v17 = WBSHistorySHA512(v15, v16);
            [v11 setObject:v17 forKeyedSubscript:@"url_hash"];

            [v11 setObject:v15 forKeyedSubscript:v24];
          }
          [v11 removeObjectForKey:@"url"];
          uint64_t v18 = [NSNumber numberWithLongLong:v8];
          [v26 setObject:v11 forKeyedSubscript:v18];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }

  if (![v26 count]) {
    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION") == 101)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __96__WBSHistoryServiceDatabase__convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration___block_invoke;
    v28[3] = &unk_1E5C9C938;
    v28[4] = self;
    [v26 enumerateKeysAndObjectsUsingBlock:v28];
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION") == 101)
    {
LABEL_15:
      double v19 = 0;
      goto LABEL_23;
    }
    uint64_t v22 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]();
    }

    uint64_t v21 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]");
  }
  else
  {
    id v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]();
    }

    uint64_t v21 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]");
  }
  double v19 = (void *)v21;
LABEL_23:

  return v19;
}

void __96__WBSHistoryServiceDatabase__convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 40);
  id v12 = [*(id *)(v7 + 32) encryptDictionary:v6];
  *(void *)uint8_t buf = [v5 integerValue];
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong},long>(v8, 0, @"UPDATE history_tombstones SET url = ? WHERE id = ?", &v12, buf);

  if (v9 != 101)
  {
    uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      *(_DWORD *)uint8_t buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v14 = 2080;
      id v15 = "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]_block_invoke";
      __int16 v16 = 2114;
      id v17 = v11;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Failed to convert tombstone %@: %s %{public}@ (%d)", buf, 0x26u);
    }
  }
}

- (void)convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__WBSHistoryServiceDatabase_convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9C960;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a3;
  int64_t v14 = a4;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __113__WBSHistoryServiceDatabase_convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _convertTombstoneWithGenerationToSecureFormat:*(void *)(a1 + 48) lastSyncedGeneration:*(void *)(a1 + 56)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)replayAndAddTombstones:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v25 = a4;
  dispatch_group_t v22 = dispatch_group_create();
  qos_class_t v5 = qos_class_self();
  id v6 = dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  dispatch_queue_t v7 = dispatch_queue_create(0, v6);

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__101;
  v42[4] = __Block_byref_object_dispose__102;
  id v43 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke;
  v38[3] = &unk_1E5C9C988;
  dispatch_queue_t queue = v7;
  dispatch_queue_t v39 = queue;
  uint64_t v41 = v42;
  dispatch_group_t group = v22;
  dispatch_group_t v40 = group;
  long long v29 = (void *)MEMORY[0x1AD0C4F80](v38);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v23;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v8)
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
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1E4F1C9C8];
        [v10 startTime];
        id v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        int64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
        [v10 endTime];
        int64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        id v15 = [v10 urlString];
        dispatch_group_enter(group);
        if (v15)
        {
          __int16 v16 = [[WBSHistoryServiceURLRepresentation alloc] initWithURLString:v15];
LABEL_10:
          uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
          [(WBSHistoryServiceDatabase *)self clearHistoryItems:v20 afterDate:v12 beforeDate:v14 tombstoneMode:3 completionHandler:v29];

          goto LABEL_11;
        }
        if ([v10 isSecure])
        {
          id v17 = [WBSHistoryServiceURLRepresentation alloc];
          __int16 v18 = [v10 urlHash];
          int v19 = [v10 urlSalt];
          __int16 v16 = [(WBSHistoryServiceURLRepresentation *)v17 initWithURLHash:v18 salt:v19];

          goto LABEL_10;
        }
        [(WBSHistoryServiceDatabase *)self clearHistoryVisitsAddedAfterDate:v12 beforeDate:v14 tombstoneMode:3 clearAllSpotlightHistoryForProfile:0 completionHandler:v29];
LABEL_11:

        ++v9;
      }
      while (v8 != v9);
      uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      uint64_t v8 = v21;
    }
    while (v21);
  }

  if (v25)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C9C9B0;
    id v32 = v25;
    int64_t v33 = v42;
    dispatch_group_notify(group, queue, block);
  }
  _Block_object_dispose(v42, 8);
}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_cold_1();
    }

    qos_class_t v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_143;
    v6[3] = &unk_1E5C8E190;
    uint64_t v8 = *(void *)(a1 + 48);
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_143(uint64_t a1)
{
}

uint64_t __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)fetchAllTombstonesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WBSHistoryServiceDatabase_fetchAllTombstonesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__WBSHistoryServiceDatabase_fetchAllTombstonesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = SafariShared::WBSSQLiteDatabaseFetch<>(*(void **)(*(void *)(a1 + 32) + 40), @"SELECT * FROM history_tombstones");
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [WBSHistoryTombstone alloc];
        id v10 = -[WBSHistoryTombstone initWithSQLiteRow:crypto:](v9, "initWithSQLiteRow:crypto:", v8, *(void *)(*(void *)(a1 + 32) + 32), (void)v11);
        [v3 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queuePendingUpdates
{
  if (!self->_pendingVisitsTimeout)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__WBSHistoryServiceDatabase__queuePendingUpdates__block_invoke;
    block[3] = &unk_1E5C8CA70;
    void block[4] = self;
    dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, block);
    id pendingVisitsTimeout = self->_pendingVisitsTimeout;
    self->_id pendingVisitsTimeout = v3;

    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_after(v5, (dispatch_queue_t)self->_queue, self->_pendingVisitsTimeout);
  }
}

uint64_t __49__WBSHistoryServiceDatabase__queuePendingUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitPendingUpdates];
}

- (void)_commitPendingUpdates
{
  id pendingVisitsTimeout = self->_pendingVisitsTimeout;
  self->_id pendingVisitsTimeout = 0;

  id v4 = (void *)MEMORY[0x1AD0C4CF0]();
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke;
  v6[3] = &unk_1E5C9B080;
  void v6[4] = self;
  [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v6];
}

uint64_t __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke(uint64_t a1)
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v9[0] = 0;
  dispatch_block_t v3 = [v2 _findItemIDsForPendingVisitsWithError:v9];
  id v4 = v9[0];
  if (!v3)
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_cold_1();
    }

    goto LABEL_7;
  }
  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 216) sortedArrayUsingComparator:&__block_literal_global_65];
  if (([*(id *)(a1 + 32) _commitPendingItems:v3] & 1) == 0)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _commitPendingVisits:v3];
LABEL_8:

  return v6;
}

uint64_t __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 visitTime];
  double v7 = v6;
  [v5 visitTime];
  if (v7 >= v8)
  {
    [v4 visitTime];
    double v11 = v10;
    [v5 visitTime];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)_findItemIDsForPendingVisitsWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](self->_pendingVisits, "count"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"SELECT id FROM history_items WHERE url = ?" error:a3];
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v6 = self->_pendingVisits;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v20 = 0;
          double v11 = objc_msgSend(v10, "urlString", v17);
          __int16 v18 = &v20;
          id v19 = v11;
          char v12 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},std::tuple<long long &>>(v5, (uint64_t)a3, &v19, (void **)&v18);

          if (v12)
          {
            long long v13 = [NSNumber numberWithLongLong:v20];
            long long v14 = [v10 urlString];
            [v17 setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    [v5 invalidate];
    id v15 = 0;
  }
  else
  {
    id v15 = v17;
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_commitPendingItems:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = [MEMORY[0x1E4F1CA80] set];
  long long v60 = [MEMORY[0x1E4F1CA80] set];
  long long v63 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  dispatch_block_t v3 = self->_pendingVisits;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v87 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ([v7 operation])
        {
          uint64_t v8 = NSNumber;
          uint64_t v9 = [v7 urlString];
          double v10 = [v64 objectForKeyedSubscript:v9];
          double v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v7, "visitCount") + objc_msgSend(v10, "unsignedIntValue"));
          char v12 = [v7 urlString];
          [v64 setObject:v11 forKeyedSubscript:v12];
        }
        long long v13 = [v7 urlString];
        long long v14 = [v62 objectForKeyedSubscript:v13];
        BOOL v15 = v14 == 0;

        uint64_t v16 = [v7 urlString];
        if (v15) {
          [v59 addObject:v16];
        }
        else {
          [v60 addObject:v16];
        }

        id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
        __int16 v18 = [v7 urlString];
        [v63 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v4);
  }

  if ([v59 count])
  {
    id v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v60 count];
      *(_DWORD *)uint8_t buf = 134217984;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_INFO, "Inserting %zu items", buf, 0xCu);
    }

    id v21 = objc_alloc(MEMORY[0x1E4F97FA0]);
    database = self->_database;
    id v85 = 0;
    long long v23 = (void *)[v21 initWithDatabase:database, @"INSERT INTO history_items (url, visit_count, visit_count_score, daily_visit_counts, weekly_visit_counts, domain_expansion, should_recompute_derived_visit_counts, status_code)VALUES (?, ?, ?, ?, ?, safari_domainexpansion(?1), 0, ?)", &v85 query error];
    id v24 = v85;
    if (!v23)
    {
      double v55 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v24, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _commitPendingItems:]();
      }
      goto LABEL_51;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v25 = v59;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v95 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v82;
      id v57 = &v94;
      do
      {
        uint64_t v28 = 0;
        long long v29 = v24;
        do
        {
          if (*(void *)v82 != v27) {
            objc_enumerationMutation(v25);
          }
          *(void *)uint8_t buf = *(void *)(*((void *)&v81 + 1) + 8 * v28);
          id v79 = 0;
          id location = 0;
          id obj = 0;
          uint64_t v78 = 0;
          urlCompletion = self->_urlCompletion;
          id v76 = 0;
          -[WBSHistoryServiceURLCompletion queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:](urlCompletion, "queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:", v57);
          objc_storeStrong(&location, obj);
          objc_storeStrong(&v79, v76);
          long long v31 = [v64 objectForKeyedSubscript:*(void *)buf];
          uint64_t v75 = [v31 unsignedIntegerValue];
          uint64_t v32 = [v63 objectForKeyedSubscript:*(void *)buf];
          uint64_t v74 = [(id)v32 integerValue];
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,unsigned long,long long &,NSData * {__strong}&,NSData * {__strong},long>(v23, buf, &v75, &v78, &location, &v79, &v74);

          id v73 = v29;
          LOBYTE(v32) = [v23 execute:&v73];
          id v24 = v73;

          if (v32)
          {
            int64_t v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID"));
            [v62 setObject:v33 forKeyedSubscript:*(void *)buf];

            [v23 reset];
          }
          else
          {
            long long v34 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v24, "safari_privacyPreservingDescription");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _commitPendingItems:]();
            }
          }
          ++v28;
          long long v29 = v24;
        }
        while (v26 != v28);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v95 count:16];
      }
      while (v26);
    }

    [v23 invalidate];
  }
  if ([v60 count])
  {
    long long v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = [v60 count];
      *(_DWORD *)uint8_t buf = 134217984;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_impl(&dword_1A6B5F000, v35, OS_LOG_TYPE_INFO, "Updating %zu items", buf, 0xCu);
    }

    id v37 = objc_alloc(MEMORY[0x1E4F97FA0]);
    long long v38 = self->_database;
    id v72 = 0;
    dispatch_queue_t v39 = [v37 initWithDatabase:v38, @"UPDATE history_items SET visit_count = visit_count + ?, visit_count_score = ?, daily_visit_counts = ?, weekly_visit_counts = ?, status_code = ? WHERE id = ?", &v72 query error];
    id v24 = v72;
    if (v39)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v40 = v60;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:v93 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v69;
        uint64_t v58 = 134218242;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v69 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void *)(*((void *)&v68 + 1) + 8 * j);
            id v79 = 0;
            id location = 0;
            uint64_t v78 = 0;
            uint64_t v75 = 0;
            uint64_t v45 = objc_msgSend(v62, "objectForKeyedSubscript:", v44, v58);
            uint64_t v46 = [v45 longValue];

            uint64_t v75 = v46;
            uint64_t v47 = self->_urlCompletion;
            id v66 = v79;
            id v67 = location;
            [(WBSHistoryServiceURLCompletion *)v47 queryVisitCounts:v44 outVisitCountScore:&v78 outDailyVisitCounts:&v67 outWeeklyVisitCounts:&v66];
            objc_storeStrong(&location, v67);
            objc_storeStrong(&v79, v66);
            id v48 = [v64 objectForKeyedSubscript:v44];
            *(void *)uint8_t buf = [v48 unsignedIntegerValue];
            uint64_t v49 = [v63 objectForKeyedSubscript:v44];
            uint64_t v74 = [(id)v49 integerValue];
            SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long,long long &,NSData * {__strong}&,NSData * {__strong}&,long,long long &>(v39, buf, &v78, &location, &v79, &v74, &v75);

            id v65 = v24;
            LOBYTE(v49) = [v39 execute:&v65];
            id v50 = v65;

            id v24 = v50;
            if ((v49 & 1) == 0)
            {
              objc_super v51 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                uint64_t v52 = v75;
                v53 = objc_msgSend(v50, "safari_privacyPreservingDescription");
                *(_DWORD *)uint8_t buf = v58;
                *(void *)&uint8_t buf[4] = v52;
                __int16 v91 = 2114;
                int v92 = v53;
                _os_log_error_impl(&dword_1A6B5F000, v51, OS_LOG_TYPE_ERROR, "Failed to update item %lli: %{public}@", buf, 0x16u);
              }
            }
            [v39 reset];
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:v93 count:16];
        }
        while (v41);
      }

      [v39 invalidate];
      BOOL v54 = 1;
      double v55 = v39;
      goto LABEL_52;
    }
    double v55 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v24, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingItems:]();
    }
LABEL_51:
    BOOL v54 = 0;
LABEL_52:

    goto LABEL_53;
  }
  BOOL v54 = 1;
LABEL_53:

  return v54;
}

- (BOOL)_commitPendingVisits:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  int64_t v149 = [(WBSHistoryServiceDatabase *)self _currentGeneration];
  id v4 = objc_alloc(MEMORY[0x1E4F97FA0]);
  database = self->_database;
  id v148 = 0;
  uint64_t v6 = [v4 initWithDatabase:database query:@"SELECT id FROM history_visits WHERE visit_time = ?" error:&v148];
  id v7 = v148;
  v114 = (void *)v6;
  if (!v6)
  {
    v115 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:]();
    }
    BOOL v105 = 0;
    goto LABEL_99;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F97FA0]);
  uint64_t v9 = self->_database;
  id v147 = v7;
  v115 = [v8 initWithDatabase:v9, @"INSERT INTO history_visits (history_item, visit_time, title, load_successful, http_non_get, origin, generation, attributes, score)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", &v147 query error];
  v111 = self;
  id v10 = v147;

  if (!v115)
  {
    v110 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:]();
    }
    BOOL v105 = 0;
    goto LABEL_98;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F97FA0]);
  char v12 = self->_database;
  id v146 = v10;
  v110 = [v11 initWithDatabase:v12 query:@"UPDATE history_visits SET title = ? WHERE id = ?" error:&v146];
  id v13 = v146;

  if (!v110)
  {
    v109 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v13, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:]();
    }
    BOOL v105 = 0;
    goto LABEL_97;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F97FA0]);
  BOOL v15 = self->_database;
  id v145 = v13;
  v109 = [v14 initWithDatabase:v15, @"UPDATE history_visits SET attributes = ?, score = ? WHERE id = ?", &v145 query error];
  id v16 = v145;

  if (!v109)
  {
    id v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.4();
    }
    BOOL v105 = 0;
    goto LABEL_96;
  }
  id v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](self->_pendingVisits, "count"));
  long long v160 = 0u;
  long long v161 = 0u;
  int v162 = 1065353216;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  __int16 v18 = self->_pendingVisits;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v142 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        if (([v22 operation] & 1) == 0)
        {
          v140 = 0;
          id v132 = v16;
          [v22 visitTime];
          *(void *)uint8_t buf = v23;
          v134 = &v140;
          char v24 = SafariShared::WBSSQLiteDatabaseEnumerate<double,std::tuple<long long &>>(v114, (uint64_t)&v132, (double *)buf, (double *)&v134);
          id v25 = v132;

          if (v24)
          {
            uint64_t v26 = [NSNumber numberWithLongLong:v140];
            uint64_t v27 = [v22 visitIdentifier];
            [v17 setObject:v26 forKeyedSubscript:v27];

            if (([v22 operation] & 2) == 0) {
              goto LABEL_15;
            }
            id v131 = [v22 title];
            SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},long long &>(v110, &v131, &v140);

            id v130 = v25;
            char v28 = [v110 execute:&v130];
            id v29 = v130;

            if (v28)
            {
              id v25 = v29;
LABEL_15:
              if (([v22 operation] & 4) == 0)
              {
LABEL_32:
                id v16 = v25;
                continue;
              }
              *(void *)uint8_t buf = [v22 attributes];
              v134 = (sqlite3_int64 **)[v22 score];
              SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long,unsigned long,long long &>(v109, buf, &v134, &v140);
              id v129 = v25;
              char v30 = [v109 execute:&v129];
              id v29 = v129;

              if (v30)
              {
                id v25 = v29;
                goto LABEL_32;
              }
              uint64_t v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                double v55 = (void *)MEMORY[0x1E4F1C9C8];
                [v22 visitTime];
                objc_msgSend(v55, "dateWithTimeIntervalSinceReferenceDate:");
                id v56 = (id)objc_claimAutoreleasedReturnValue();
                id v57 = [v22 urlString];
                uint64_t v58 = objc_msgSend(v29, "safari_privacyPreservingDescription");
                *(_DWORD *)uint8_t buf = 138543875;
                *(void *)&uint8_t buf[4] = v56;
                __int16 v155 = 2113;
                v156 = v57;
                __int16 v157 = 2114;
                v158 = v58;
                _os_log_error_impl(&dword_1A6B5F000, v41, OS_LOG_TYPE_ERROR, "Failed to update attributes of visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              uint64_t v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                uint64_t v47 = (void *)MEMORY[0x1E4F1C9C8];
                [v22 visitTime];
                objc_msgSend(v47, "dateWithTimeIntervalSinceReferenceDate:");
                id v48 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v49 = [v22 urlString];
                id v50 = objc_msgSend(v29, "safari_privacyPreservingDescription");
                *(_DWORD *)uint8_t buf = 138543875;
                *(void *)&uint8_t buf[4] = v48;
                __int16 v155 = 2113;
                v156 = v49;
                __int16 v157 = 2114;
                v158 = v50;
                _os_log_error_impl(&dword_1A6B5F000, v41, OS_LOG_TYPE_ERROR, "Failed to update title of visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);
              }
            }
            id v25 = v29;
          }
          else
          {
            uint64_t v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              uint64_t v42 = (void *)MEMORY[0x1E4F1C9C8];
              [v22 visitTime];
              objc_msgSend(v42, "dateWithTimeIntervalSinceReferenceDate:");
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v44 = [v22 urlString];
              uint64_t v45 = objc_msgSend(v25, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 138543875;
              *(void *)&uint8_t buf[4] = v43;
              __int16 v155 = 2117;
              v156 = v44;
              __int16 v157 = 2114;
              v158 = v45;
              _os_log_error_impl(&dword_1A6B5F000, v41, OS_LOG_TYPE_ERROR, "Failed to find ID of visit %{public}@ of item %{sensitive}@: %{public}@", buf, 0x20u);
            }
          }

          goto LABEL_32;
        }
        v140 = 0;
        long long v31 = [v22 urlString];
        uint64_t v32 = [v113 objectForKeyedSubscript:v31];
        int64_t v33 = (sqlite3_int64 *)[(id)v32 longLongValue];

        v140 = v33;
        [v22 visitTime];
        *(void *)uint8_t buf = v34;
        id v139 = [v22 title];
        unsigned int v138 = [v22 loadSuccessful];
        unsigned int v137 = [v22 wasHTTPNonGet];
        unsigned int v136 = [v22 origin];
        unsigned int v135 = [v22 attributes];
        v134 = (sqlite3_int64 **)[v22 score];
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,double,NSString * {__strong},int,int,int,long &,int,unsigned long>(v115, &v140, (double *)buf, &v139, &v138, &v137, &v136, &v149, &v135, &v134);

        id v133 = v16;
        LOBYTE(v32) = [v115 execute:&v133];
        id v35 = v133;

        id v16 = v35;
        if (v32)
        {
          int64_t v36 = [(WBSSQLiteDatabase *)v111->_database lastInsertRowID];
          id v37 = [NSNumber numberWithLongLong:v36];
          long long v38 = [v22 visitIdentifier];
          [v17 setObject:v37 forKeyedSubscript:v38];

          [v115 reset];
          dispatch_queue_t v39 = v140;
          [v22 visitTime];
          if (SafariShared::LatestVisitInformationMap::update((SafariShared::LatestVisitInformationMap *)&v111->_latestVisitMap, (unint64_t)v39, v36, v40, 0))
          {
            *(void *)uint8_t buf = &v140;
            std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&v160, (unint64_t *)&v140, (uint64_t)&std::piecewise_construct, (void **)buf)[3] = v36;
          }
        }
        else
        {
          uint64_t v46 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            objc_super v51 = (void *)MEMORY[0x1E4F1C9C8];
            [v22 visitTime];
            objc_msgSend(v51, "dateWithTimeIntervalSinceReferenceDate:");
            id v52 = (id)objc_claimAutoreleasedReturnValue();
            v53 = [v22 urlString];
            BOOL v54 = objc_msgSend(v16, "safari_privacyPreservingDescription");
            *(_DWORD *)uint8_t buf = 138543875;
            *(void *)&uint8_t buf[4] = v52;
            __int16 v155 = 2113;
            v156 = v53;
            __int16 v157 = 2114;
            v158 = v54;
            _os_log_error_impl(&dword_1A6B5F000, v46, OS_LOG_TYPE_ERROR, "Failed to insert visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v19);
  }

  [v115 invalidate];
  [v110 invalidate];
  [v109 invalidate];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v59 = v111->_pendingVisits;
  char v60 = 0;
  uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v125 objects:v153 count:16];
  if (!v61) {
    goto LABEL_49;
  }
  uint64_t v62 = *(void *)v126;
  do
  {
    uint64_t v63 = 0;
    id v64 = v16;
    do
    {
      if (*(void *)v126 != v62) {
        objc_enumerationMutation(v59);
      }
      id v65 = [*(id *)(*((void *)&v125 + 1) + 8 * v63) sourceVisitIdentifier];
      if (!v65) {
        goto LABEL_43;
      }
      id v66 = [v17 objectForKeyedSubscript:v65];
      BOOL v67 = v66 == 0;

      if (!v67)
      {
        char v60 = 1;
LABEL_43:
        id v16 = v64;
        goto LABEL_47;
      }
      *(void *)uint8_t buf = 0;
      id v124 = v64;
      v140 = (sqlite3_int64 *)buf;
      char v68 = SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(v114, (uint64_t)&v124, &v140);
      id v16 = v124;

      if (v68)
      {
        long long v69 = [NSNumber numberWithLongLong:*(void *)buf];
        [v17 setObject:v69 forKeyedSubscript:v65];
      }
      char v60 = 1;
LABEL_47:

      ++v63;
      id v64 = v16;
    }
    while (v61 != v63);
    uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v125 objects:v153 count:16];
  }
  while (v61);
LABEL_49:

  [v114 invalidate];
  if ((v60 & 1) == 0) {
    goto LABEL_70;
  }
  id v70 = objc_alloc(MEMORY[0x1E4F97FA0]);
  long long v71 = v111->_database;
  id v123 = v16;
  v112 = (SafariShared::LatestVisitInformationMap *)[v70 initWithDatabase:v71 query:@"UPDATE history_visits SET redirect_source = ? where id = ?" error:&v123];
  id v72 = v123;

  if (!v112)
  {
    v104 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v72, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.5();
    }
    BOOL v105 = 0;
LABEL_94:

    id v16 = v72;
    goto LABEL_95;
  }
  id v73 = objc_alloc(MEMORY[0x1E4F97FA0]);
  uint64_t v74 = v111->_database;
  id v122 = v72;
  uint64_t v75 = (void *)[v73 initWithDatabase:v74 query:@"UPDATE history_visits SET redirect_destination = ? where id = ?" error:&v122];
  id v16 = v122;

  if (!v75)
  {
    v106 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.6();
    }

    [(SafariShared::LatestVisitInformationMap *)v112 invalidate];
    BOOL v105 = 0;
    v104 = v112;
LABEL_93:
    id v72 = v16;
    goto LABEL_94;
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v111->_pendingVisits;
  uint64_t v76 = [(NSMutableArray *)obj countByEnumeratingWithState:&v118 objects:v152 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v119;
    do
    {
      for (uint64_t j = 0; j != v76; ++j)
      {
        if (*(void *)v119 != v77) {
          objc_enumerationMutation(obj);
        }
        id v79 = *(void **)(*((void *)&v118 + 1) + 8 * j);
        uint64_t v80 = [v79 sourceVisitIdentifier];
        if (v80)
        {
          v140 = 0;
          long long v81 = [v79 visitIdentifier];
          long long v82 = [v17 objectForKeyedSubscript:v81];
          long long v83 = (sqlite3_int64 *)[v82 longValue];

          v140 = v83;
          v134 = 0;
          uint64_t v84 = [v17 objectForKeyedSubscript:v80];
          uint64_t v85 = [(id)v84 longValue];

          v134 = (sqlite3_int64 **)v85;
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,long long &>(v112, &v134, &v140);
          id v117 = v16;
          LOBYTE(v84) = [(SafariShared::LatestVisitInformationMap *)v112 execute:&v117];
          id v86 = v117;

          long long v87 = v86;
          if ((v84 & 1) == 0)
          {
            long long v88 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            {
              int v92 = v140;
              v93 = objc_msgSend(v87, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 134218242;
              *(void *)&uint8_t buf[4] = v92;
              __int16 v155 = 2114;
              v156 = v93;
              _os_log_error_impl(&dword_1A6B5F000, v88, OS_LOG_TYPE_ERROR, "Failed to update source of visit %lli: %{public}@", buf, 0x16u);
            }
          }
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,long long &>(v75, &v140, &v134);
          id v116 = v87;
          char v89 = [v75 execute:&v116];
          id v90 = v116;

          id v16 = v90;
          if ((v89 & 1) == 0)
          {
            __int16 v91 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              int v94 = v140;
              uint64_t v95 = objc_msgSend(v16, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 134218242;
              *(void *)&uint8_t buf[4] = v94;
              __int16 v155 = 2114;
              v156 = v95;
              _os_log_error_impl(&dword_1A6B5F000, v91, OS_LOG_TYPE_ERROR, "Failed to update destionation of visit %lli: %{public}@", buf, 0x16u);
            }
          }
          [(SafariShared::LatestVisitInformationMap *)v112 reset];
          [v75 reset];
        }
      }
      uint64_t v76 = [(NSMutableArray *)obj countByEnumeratingWithState:&v118 objects:v152 count:16];
    }
    while (v76);
  }

  [(SafariShared::LatestVisitInformationMap *)v112 invalidate];
  [v75 invalidate];

LABEL_70:
  v96 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    uint64_t v97 = [(NSMutableArray *)v111->_pendingVisits count];
    *(_DWORD *)uint8_t buf = 134217984;
    *(void *)&uint8_t buf[4] = v97;
    _os_log_impl(&dword_1A6B5F000, v96, OS_LOG_TYPE_INFO, "Inserted/Updated %zu visits", buf, 0xCu);
  }

  [(NSMutableArray *)v111->_pendingVisits removeAllObjects];
  if (*((void *)&v161 + 1))
  {
    uint64_t v98 = [WBSHistoryServiceEvent alloc];
    v99 = [MEMORY[0x1E4F1C9C8] date];
    v150[0] = @"updateLatestVisits";
    v100 = [(WBSHistoryServiceDatabase *)v111 _generateUpdatedLastVisit:&v160];
    v151[0] = v100;
    v150[1] = @"updateItems";
    v101 = [(WBSHistoryServiceDatabase *)v111 _generateItemsDictionary:&v160];
    v151[1] = v101;
    v150[2] = @"updateVisits";
    int v102 = [(WBSHistoryServiceDatabase *)v111 _generateVisitsDictionary:&v160];
    v151[2] = v102;
    uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:3];
    v104 = [(WBSHistoryServiceEvent *)v98 initWithType:@"update" time:v99 value:v103];

    [(WBSHistoryServiceDatabase *)v111 _dispatchEvent:v104 listenersToIgnore:0 persistForDelayedDispatching:0 completionHandler:&__block_literal_global_186_0];
    BOOL v105 = 1;
    goto LABEL_93;
  }
  BOOL v105 = 1;
LABEL_95:
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v160);
LABEL_96:

  id v13 = v16;
LABEL_97:

  id v10 = v13;
LABEL_98:

  id v7 = v10;
LABEL_99:

  return v105;
}

void __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke_cold_1();
    }
  }
}

- (int64_t)_permanentIDsForItemIfAvailable:(int64_t)a3
{
  int64_t v6 = a3;
  if (a3 < 0)
  {
    id v4 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_temporaryIDToItem.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v6);
    id v3 = v4 + 3;
    if (!v4) {
      id v3 = &v6;
    }
  }
  else
  {
    id v3 = &v6;
  }
  return *v3;
}

- (int64_t)_permanentIDsForVisitIfAvailable:(int64_t)a3
{
  int64_t v6 = a3;
  if (a3 < 0)
  {
    id v4 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_visitForTemporaryID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v6);
    id v3 = v4 + 3;
    if (!v4) {
      id v3 = &v6;
    }
  }
  else
  {
    id v3 = &v6;
  }
  return *v3;
}

- (void)_checkpointWriteAheadLog
{
  id v3 = (void *)os_transaction_create();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke;
  v6[3] = &unk_1E5C8D980;
  void v6[4] = self;
  id v7 = v3;
  id v4 = v3;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v6);
  _os_activity_initiate(&dword_1A6B5F000, "Cleaning WAL", OS_ACTIVITY_FLAG_DETACHED, v5);
}

void __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke_2;
  v3[3] = &unk_1E5C8D980;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  if (![*(id *)(*(void *)(a1 + 32) + 40) checkpointWriteAheadLogWithLogFrameCount:(char *)&v2 + 4 checkpointedFrameCount:&v2])
  {
    uint64_t v1 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint8_t buf = 67109376;
      int v4 = HIDWORD(v2);
      __int16 v5 = 1024;
      int v6 = v2;
      _os_log_impl(&dword_1A6B5F000, v1, OS_LOG_TYPE_INFO, "Checkpointed write ahead log. Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
}

- (BOOL)_addAutocompleteTrigger:(id)a3 forURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v17 = 0;
  id v18 = a4;
  database = self->_database;
  id v16 = &v17;
  if (SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong}&,std::tuple<NSData * {__strong}&>>(database, (uint64_t)a5, @"SELECT autocomplete_triggers FROM history_items WHERE url = ?", &v18, &v16))
  {
    if (!v17
      || (WBSHistoryDecodeAutocompleteTriggers((uint64_t)v17), (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    if (WBSHistoryAddAutocompleteTriggerToArray(v10, v8)
      && ([MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:a5],
          id v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = v17,
          id v17 = v11,
          v12,
          v17)
      && ((int v13 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong}&,NSString * {__strong}&>(self->_database, a5, @"UPDATE history_items SET autocomplete_triggers = ? WHERE url = ?", &v17, &v18), v13 == 101)|| !v13))
    {
      [(WBSHistoryServiceURLCompletion *)self->_urlCompletion updateURLString:v18 autocompleteTriggerData:v17];
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
    id v10 = 0;
  }

  return v14;
}

- (void)addAutocompleteTrigger:(id)a3 forURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    dispatch_queue_t queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__WBSHistoryServiceDatabase_addAutocompleteTrigger_forURL_completionHandler___block_invoke;
    v13[3] = &unk_1E5C9B058;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __77__WBSHistoryServiceDatabase_addAutocompleteTrigger_forURL_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = 0;
  [v2 _addAutocompleteTrigger:v3 forURL:v4 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__WBSHistoryServiceDatabase_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __85__WBSHistoryServiceDatabase_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  id v8 = 0;
  id v9 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v7 = &v9;
  char v3 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * const {__strong}&,std::tuple<NSData * {__strong}&>>(v2, (uint64_t)&v8, @"SELECT autocomplete_triggers FROM history_items WHERE url = ?", (id *)(a1 + 40), &v7);
  id v4 = v8;
  if (v3)
  {
    if (v9)
    {
      id v5 = WBSHistoryDecodeAutocompleteTriggers((uint64_t)v9);
    }
    else
    {
      id v5 = 0;
    }
    if (v5) {
      id v6 = v5;
    }
    else {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)recordVisitWithIdentifier:(id)a3 sourceVisit:(id)a4 title:(id)a5 wasHTTPNonGet:(BOOL)a6 loadSuccessful:(BOOL)a7 origin:(int64_t)a8 attributes:(unint64_t)a9 statusCode:(int64_t)a10 completionHandler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a11;
  if (v17)
  {
    dispatch_queue_t queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __149__WBSHistoryServiceDatabase_recordVisitWithIdentifier_sourceVisit_title_wasHTTPNonGet_loadSuccessful_origin_attributes_statusCode_completionHandler___block_invoke;
    block[3] = &unk_1E5C9CA18;
    unint64_t v29 = a9;
    id v24 = v17;
    id v25 = self;
    id v26 = v18;
    BOOL v32 = a6;
    BOOL v33 = a7;
    id v27 = v19;
    int64_t v30 = a8;
    int64_t v31 = a10;
    id v28 = v20;
    dispatch_async(queue, block);
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v20 + 2))(v20, v21);
  }
}

void __149__WBSHistoryServiceDatabase_recordVisitWithIdentifier_sourceVisit_title_wasHTTPNonGet_loadSuccessful_origin_attributes_statusCode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[WBSHistoryServicePendingVisit alloc] initWithWithVisitIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 72);
  id v13 = v2;
  if ((v3 & 0xE) == 0)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 272);
    id v5 = [*(id *)(a1 + 32) urlString];
    [v4 lastVisitTimeForURLString:v5];
    double v7 = v6;

    if (v7 <= 0.0) {
      goto LABEL_8;
    }
    [*(id *)(a1 + 32) visitTime];
    if (v7 >= v8) {
      goto LABEL_8;
    }
    [*(id *)(a1 + 32) visitTime];
    float v10 = (v9 - v7) / 60.0;
    if (v10 < 1.0)
    {
      v3 |= 2uLL;
LABEL_8:
      uint64_t v2 = v13;
      goto LABEL_9;
    }
    if (v10 < 8.0)
    {
      v3 |= 4uLL;
      goto LABEL_8;
    }
    uint64_t v2 = v13;
    if (v10 < 60.0) {
      v3 |= 8uLL;
    }
  }
LABEL_9:
  [(WBSHistoryServicePendingVisit *)v2 setOperation:1];
  [(WBSHistoryServicePendingVisit *)v13 setSourceVisitIdentifier:*(void *)(a1 + 48)];
  [(WBSHistoryServicePendingVisit *)v13 setTitle:*(void *)(a1 + 56)];
  [(WBSHistoryServicePendingVisit *)v13 setWasHTTPNonGet:*(unsigned __int8 *)(a1 + 96)];
  [(WBSHistoryServicePendingVisit *)v13 setLoadSuccessful:*(unsigned __int8 *)(a1 + 97)];
  [(WBSHistoryServicePendingVisit *)v13 setWasHTTPNonGet:*(unsigned __int8 *)(a1 + 96)];
  [(WBSHistoryServicePendingVisit *)v13 setOrigin:*(void *)(a1 + 80)];
  [(WBSHistoryServicePendingVisit *)v13 setAttributes:v3];
  [(WBSHistoryServicePendingVisit *)v13 setStatusCode:*(void *)(a1 + 88)];
  float v11 = WBHistoryVisitWeightForAttributesAndOrigin(v3, *(void *)(a1 + 80));
  LODWORD(v12) = WBSHistoryVisitScoreForWeightedVisitCount(v11);
  [*(id *)(*(void *)(a1 + 40) + 272) recordVisit:*(void *)(a1 + 32) sourceVisit:*(void *)(a1 + 48) title:*(void *)(a1 + 56) loadSuccessful:*(unsigned __int8 *)(a1 + 97) origin:*(void *)(a1 + 80) increaseVisitCount:1 score:v12 statusCode:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(a1 + 40) + 216) addObject:v13];
  [*(id *)(a1 + 40) _queuePendingUpdates];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 pendingVisit:(id)a6
{
  id v13 = a3;
  id v10 = a6;
  uint64_t v11 = [v10 score];
  objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") & ~a4);
  objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | a5);
  uint64_t v12 = [v10 score];
  if (v11 != v12) {
    [(WBSHistoryServiceURLCompletion *)self->_urlCompletion updateVisit:v13 oldScore:v11 newScore:v12 completionHandler:&__block_literal_global_198];
  }
}

- (void)updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    dispatch_queue_t queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__WBSHistoryServiceDatabase_updateVisitWithIdentifier_removeAttributes_addAttributes_completionHandler___block_invoke;
    block[3] = &unk_1E5C9CA40;
    void block[4] = self;
    id v15 = v10;
    unint64_t v17 = a4;
    unint64_t v18 = a5;
    id v16 = v11;
    dispatch_async(queue, block);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v11 + 2))(v11, v13);
  }
}

void __104__WBSHistoryServiceDatabase_updateVisitWithIdentifier_removeAttributes_addAttributes_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 216);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v7 = [v6 visitIdentifier];
        char v8 = [v7 isEqual:*(void *)(a1 + 40)];

        if ((v8 & 1) != 0 && ([v6 operation] & 5) != 0)
        {
          [*(id *)(a1 + 32) _updateVisitWithIdentifier:*(void *)(a1 + 40) removeAttributes:*(void *)(a1 + 56) addAttributes:*(void *)(a1 + 64) pendingVisit:v6];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          goto LABEL_16;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v19 = 0;
  uint64_t v20 = 0;
  double v9 = *(void **)(*(void *)(a1 + 32) + 40);
  id v18 = [*(id *)(a1 + 40) urlString];
  [*(id *)(a1 + 40) visitTime];
  id v17 = v10;
  *(void *)uint8_t buf = &v20;
  *(void *)&buf[8] = (char *)&v20 + 4;
  LOBYTE(v9) = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},double,std::tuple<int &,int &>>(v9, (uint64_t)&v19, @"SELECT origin, attributes FROM history_visits INNER JOIN history_items ON history_visits.history_item = history_items.id WHERE url = ? AND visit_time = ?", &v18, &v17, (long long *)buf);
  id v2 = v19;

  if (v9)
  {
    id v11 = [[WBSHistoryServicePendingVisit alloc] initWithWithVisitIdentifier:*(void *)(a1 + 40)];
    [(WBSHistoryServicePendingVisit *)v11 setOrigin:(int)v20];
    [(WBSHistoryServicePendingVisit *)v11 setAttributes:SHIDWORD(v20)];
    [*(id *)(*(void *)(a1 + 32) + 216) addObject:v11];
    [*(id *)(a1 + 32) _updateVisitWithIdentifier:*(void *)(a1 + 40) removeAttributes:*(void *)(a1 + 56) addAttributes:*(void *)(a1 + 64) pendingVisit:v11];
    [*(id *)(a1 + 32) _queuePendingUpdates];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 40) urlString];
      id v14 = (void *)MEMORY[0x1E4F1C9C8];
      [*(id *)(a1 + 40) visitTime];
      id v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
      id v16 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      *(_DWORD *)uint8_t buf = 138740483;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&unsigned char buf[14] = v15;
      __int16 v26 = 2113;
      id v27 = v16;
      _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Unable to determine existing attributes for visit %{sensitive}@ at %{public}@: %{private}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_16:
}

- (void)updateVisitWithIdentifier:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    dispatch_queue_t queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__WBSHistoryServiceDatabase_updateVisitWithIdentifier_title_completionHandler___block_invoke;
    v13[3] = &unk_1E5C9B058;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __79__WBSHistoryServiceDatabase_updateVisitWithIdentifier_title_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (WBSHistoryServicePendingVisit *)*(id *)(*(void *)(a1 + 32) + 216);
  uint64_t v3 = [(WBSHistoryServicePendingVisit *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        double v7 = objc_msgSend(v6, "visitIdentifier", (void)v9);
        char v8 = [v7 isEqual:*(void *)(a1 + 40)];

        if (v8)
        {
          [v6 setTitle:*(void *)(a1 + 48)];
          [*(id *)(*(void *)(a1 + 32) + 272) updateVisit:*(void *)(a1 + 40) title:*(void *)(a1 + 48) databaseID:*(void *)(*(void *)(a1 + 32) + 256)];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(WBSHistoryServicePendingVisit *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v2 = [[WBSHistoryServicePendingVisit alloc] initWithWithVisitIdentifier:*(void *)(a1 + 40)];
  [(WBSHistoryServicePendingVisit *)v2 setTitle:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 216) addObject:v2];
  [*(id *)(a1 + 32) _queuePendingUpdates];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:
}

- (void)_updateItem:(int64_t)a3 visitCountScore:(int64_t)a4 dailyVisitCounts:(id)a5 weeklyVisitCounts:(id)a6 shouldRecomputeDerivedVisitCounts:(BOOL)a7
{
  id v12 = a5;
  id v13 = a6;
  database = self->_database;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke;
  v17[3] = &unk_1E5C9CA68;
  BOOL v22 = a7;
  int64_t v20 = a3;
  int64_t v21 = a4;
  void v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v17];
}

uint64_t __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke(uint64_t a1)
{
  v13[4] = *(id *)MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 40);
    v13[0] = 0;
    int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long const&>(v2, v13, @"UPDATE history_items SET should_recompute_derived_visit_counts = 1 WHERE id = ?", (void *)(a1 + 56));
    id v4 = v13[0];
    id v5 = v4;
    if (v3 && v3 != 101)
    {
      long long v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_2();
      }
      goto LABEL_12;
    }
    double v6 = v4;
  }
  else
  {
    double v6 = 0;
  }
  double v7 = *(void **)(*(void *)(a1 + 32) + 40);
  id v12 = v6;
  int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long const&,NSData * const {__strong}&,NSData * const {__strong},long long const&>(v7, &v12, @"UPDATE history_items SET visit_count_score = ?, daily_visit_counts = ?, weekly_visit_counts = ? WHERE id = ?", (void *)(a1 + 64), (void *)(a1 + 40), (void *)(a1 + 48), (void *)(a1 + 56));
  id v5 = v12;

  uint64_t v9 = 1;
  if (v8 && v8 != 101)
  {
    long long v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_1();
    }
LABEL_12:

    uint64_t v9 = 0;
  }

  return v9;
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSHistoryServiceDatabase_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__WBSHistoryServiceDatabase_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (int64_t)_currentGeneration
{
  id v2 = [(WBSHistoryServiceDatabase *)self _metadataForKey:@"current_generation" error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)_lastSyncedGeneration
{
  id v2 = [(WBSHistoryServiceDatabase *)self _metadataForKey:@"last_synced_generation" error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)_clearAllHistoryInsertingTombstoneUpToDate:(id)a3 clearAllSpotlightHistoryForProfile:(BOOL)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__101;
  id v25 = __Block_byref_object_dispose__102;
  id v26 = 0;
  [(WBSHistoryServiceDatabase *)self _startingClearHistoryOperationForStartDate:0 endDate:v6];
  database = self->_database;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke;
  id v16 = &unk_1E5C9CAE0;
  id v17 = self;
  BOOL v20 = a4;
  id v8 = v6;
  id v18 = v8;
  id v19 = &v21;
  LOBYTE(database) = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:&v13];
  [(WBSHistoryServiceDatabase *)self _finishedClearingHistory];
  if (database)
  {
    uint64_t v9 = [WBSHistoryServiceEvent alloc];
    long long v10 = [(WBSHistoryServiceEvent *)v9 initWithType:@"clear" time:v8 value:MEMORY[0x1E4F1CC08]];
    [(WBSHistoryServiceDatabase *)self _dispatchEvent:v10 listenersToIgnore:0 persistForDelayedDispatching:1 completionHandler:0];

    id v11 = 0;
  }
  else
  {
    id v11 = (id)v22[5];
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

uint64_t __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = [*(id *)(a1 + 32) _currentGeneration];
  id v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  if (*(unsigned char *)(a1 + 56))
  {
    int64_t v3 = +[WBSSiriIntelligenceDonor sharedInstance];
    [v3 removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:*(void *)(*(void *)(a1 + 32) + 256)];
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x5812000000;
    id v48 = __Block_byref_object_copy__209;
    memset(v50, 0, sizeof(v50));
    uint64_t v49 = __Block_byref_object_dispose__210;
    uint64_t v51 = 0;
    int v52 = 1065353216;
    id v4 = *(id *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v42 = *(id *)(v6 + 40);
    id v43 = v4;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_214;
    v40[3] = &unk_1E5C9CA90;
    v40[4] = &v45;
    id v41 = (id)MEMORY[0x1AD0C4F80](v40);
    LODWORD(v5) = SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v5, (uint64_t)&v42, @"SELECT id FROM history_visits WHERE visit_time < ?", &v43, &v41);
    objc_storeStrong((id *)(v6 + 40), v42);

    if (v5)
    {
      double v7 = createQueryWithList(@"SELECT history_items.id FROM history_items LEFT JOIN history_visits ON history_visits.history_item = history_items.id AND history_visits.id NOT IN ("), (uint64_t)(v46 + 6), CFSTR(") GROUP BY history_items.id HAVING COUNT(history_visits.history_item) = 0");
      uint64_t v32 = 0;
      BOOL v33 = &v32;
      uint64_t v34 = 0x5812000000;
      id v35 = __Block_byref_object_copy__209;
      memset(v37, 0, sizeof(v37));
      int64_t v36 = __Block_byref_object_dispose__210;
      uint64_t v38 = 0;
      int v39 = 1065353216;
      id v8 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v9 + 40);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_2;
      v29[3] = &unk_1E5C9CA90;
      v29[4] = &v32;
      id v30 = (id)MEMORY[0x1AD0C4F80](v29);
      LODWORD(v8) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(v8, (uint64_t)&obj, v7, &v30);
      objc_storeStrong((id *)(v9 + 40), obj);

      if (v8)
      {
        long long v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v33[9]];
        id v11 = *(void **)(*(void *)(a1 + 32) + 40);
        id v12 = createQueryWithList(@"SELECT id, url FROM history_items WHERE id IN ("), (uint64_t)(v33 + 6), CFSTR(")");
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_3;
        v26[3] = &unk_1E5C9CAB8;
        id v13 = v10;
        id v27 = v13;
        id v28 = (id)MEMORY[0x1AD0C4F80](v26);
        LODWORD(v11) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,NSString *)>(v11, 0, v12, &v28);

        if (v11)
        {
          [*(id *)(a1 + 32) _removeSpotlightDonationsForItemURLs:v13];
        }
        else
        {
          id v16 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_6();
          }
        }
      }
      else
      {
        id v15 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_7();
        }
      }
      _Block_object_dispose(&v32, 8);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v37[8]);
    }
    else
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_8();
      }
    }

    _Block_object_dispose(&v45, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v50[8]);
  }
  id v17 = *(void **)(*(void *)(a1 + 32) + 40);
  [v2 timeIntervalSinceReferenceDate];
  uint64_t v45 = v18;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v32 = v19;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double,long &>(v17, 0, @"INSERT INTO history_tombstones (start_time, end_time, generation) VALUES (?,?,?)", (double *)&v45, (double *)&v32, &v44) != 101)
  {
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_3();
    }
    goto LABEL_36;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 40), 0, @"DELETE FROM history_visits") != 101)
  {
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_4();
    }
    goto LABEL_36;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 40), 0, @"DELETE FROM history_items") != 101)
  {
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_3();
    }
    goto LABEL_36;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 40), 0, @"DELETE FROM history_items_to_tags") != 101)
  {
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_2();
    }
    goto LABEL_36;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 40), 0, @"DELETE FROM history_tags") != 101)
  {
    uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_1();
    }
LABEL_36:

    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 40) lastErrorWithMethodName:"-[WBSHistoryServiceDatabase _clearAllHistoryInsertingTombstoneUpToDate:clearAllSpotlightHistoryForProfile:]_block_invoke"];
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    uint64_t v20 = 0;
    goto LABEL_37;
  }
  uint64_t v20 = 1;
LABEL_37:

  return v20;
}

void *__107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_214(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void *__107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [NSNumber numberWithLongLong:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (void)clearAllHistoryInsertingTombstoneUpToDate:(id)a3 clearAllSpotlightHistoryForProfile:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = (void (**)(void, void))v9;
  if (v8)
  {
    dispatch_queue_t queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __124__WBSHistoryServiceDatabase_clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke;
    v13[3] = &unk_1E5C9CB08;
    v13[4] = self;
    id v15 = v9;
    id v14 = v8;
    BOOL v16 = a4;
    dispatch_async(queue, v13);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void *))v10)[2](v10, v12);
  }
}

uint64_t __124__WBSHistoryServiceDatabase_clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = [*(id *)(a1 + 32) _clearAllHistoryInsertingTombstoneUpToDate:*(void *)(a1 + 40) clearAllSpotlightHistoryForProfile:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id v4 = *(void **)(a1 + 32);
  return [v4 _checkpointWriteAheadLog];
}

- (id)_generateDisposedVisitsForPlan:(void *)a3
{
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((void *)a3 + 23)];
  for (uint64_t i = (void *)*((void *)a3 + 22); i; uint64_t i = (void *)*i)
  {
    id v6 = [NSNumber numberWithLongLong:i[2]];
    [v4 addObject:v6];
  }
  return v4;
}

- (id)_generateUpdatedLastVisit:(const void *)a3
{
  if (*((void *)a3 + 3))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:");
    for (uint64_t i = (void *)*((void *)a3 + 2); i; uint64_t i = (void *)*i)
    {
      uint64_t v6 = i[2];
      double v7 = [NSNumber numberWithLongLong:i[3]];
      id v8 = [NSNumber numberWithLongLong:v6];
      [v4 setObject:v7 forKeyedSubscript:v8];
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v4;
}

- (id)_generateItemsDictionary:(const void *)a3
{
  v18[4] = *(id *)MEMORY[0x1E4F143B8];
  if (*((void *)a3 + 3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F97FA0]);
    database = self->_database;
    v18[0] = 0;
    double v7 = (void *)[v5 initWithDatabase:database query:@"SELECT * FROM history_items WHERE id = ?" error:v18];
    id v8 = v18[0];
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*((void *)a3 + 3)];
      for (uint64_t i = (void *)*((void *)a3 + 2); i; uint64_t i = (void *)*i)
      {
        uint64_t v11 = i[2];
        [v7 bindInt64:v11 atParameterIndex:1];
        id v12 = [v7 fetch];
        id v13 = [v12 nextObject];
        if (v13)
        {
          id v14 = [[WBSHistoryServiceItem alloc] initWithSQLRow:v13];
          id v15 = [NSNumber numberWithLongLong:v11];
          [v9 setObject:v14 forKeyedSubscript:v15];

          [v7 reset];
        }
      }
      [v7 invalidate];
    }
    else
    {
      BOOL v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _generateItemsDictionary:]();
      }

      id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v9;
}

- (id)_generateVisitsDictionary:(const void *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*((void *)a3 + 3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F97FA0]);
    database = self->_database;
    id v22 = 0;
    double v7 = (void *)[v5 initWithDatabase:database query:@"SELECT * FROM history_visits WHERE id = ?" error:&v22];
    id v8 = v22;
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*((void *)a3 + 3)];
      long long v23 = 0u;
      long long v24 = 0u;
      int v25 = 1065353216;
      memset(v20, 0, sizeof(v20));
      int v21 = 1065353216;
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&v23, (unint64_t)(float)*((unint64_t *)a3 + 3));
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v20, vcvtps_u32_f32((float)*((unint64_t *)a3 + 3) / 1.0));
      for (uint64_t i = (uint64_t *)*((void *)a3 + 2); i; uint64_t i = (uint64_t *)*i)
      {
        long long v19 = *((_OWORD *)i + 1);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v19 + 1, (void *)&v19 + 1);
      }
      while (*((void *)&v24 + 1))
      {
        *(void *)&long long v19 = *(void *)(v24 + 16);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::erase(&v23, (uint64_t *)v24);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v20, (unint64_t *)&v19, &v19);
        [v7 bindInt64:(void)v19 atParameterIndex:1];
        uint64_t v11 = [v7 fetch];
        id v12 = [v11 nextObject];
        if (v12)
        {
          id v13 = [[WBSHistoryServiceVisit alloc] initWithSQLRow:v12];
          id v14 = [NSNumber numberWithLongLong:(void)v19];
          [v9 setObject:v13 forKeyedSubscript:v14];

          uint64_t v18 = 0;
          uint64_t v18 = [(WBSHistoryServiceVisit *)v13 redirectSource];
          if (v18
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v20, (unint64_t *)&v18))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v18, &v18);
          }
          uint64_t v17 = 0;
          uint64_t v17 = [(WBSHistoryServiceVisit *)v13 redirectDestination];
          if (v17
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v20, (unint64_t *)&v17))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v17, &v17);
          }
          [v7 reset];
        }
      }
      [v7 invalidate];
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v20);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v23);
    }
    else
    {
      id v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _generateItemsDictionary:]();
      }

      id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v9;
}

- (id)_clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(WBSHistoryServiceDatabase *)self _startingClearHistoryOperationForStartDate:v10 endDate:v11];
  uint64_t v51 = 0;
  int v52 = &v51;
  uint64_t v53 = 0x3032000000;
  BOOL v54 = __Block_byref_object_copy__101;
  double v55 = __Block_byref_object_dispose__102;
  id v56 = 0;
  uint64_t v32 = 0;
  BOOL v33 = &v32;
  uint64_t v34 = 0x11012000000;
  id v35 = __Block_byref_object_copy__249;
  int64_t v36 = __Block_byref_object_dispose__250;
  uint64_t v37 = 768;
  memset(v38, 0, sizeof(v38));
  memset(v40, 0, sizeof(v40));
  int v39 = 1065353216;
  int v41 = 1065353216;
  memset(v42, 0, sizeof(v42));
  memset(v44, 0, sizeof(v44));
  int v43 = 1065353216;
  int v45 = 1065353216;
  memset(v46, 0, sizeof(v46));
  int v47 = 1065353216;
  id v49 = 0;
  id v50 = 0;
  id v48 = 0;
  tagController = self->_tagController;
  id obj = 0;
  BOOL v13 = [(WBSHistoryTagDatabaseController *)tagController clearTagsFromStartDate:v10 endDate:v11 error:&obj];
  objc_storeStrong(&v56, obj);
  if (v13)
  {
    database = self->_database;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke;
    v24[3] = &unk_1E5C9CB30;
    unint64_t v29 = a5;
    v24[4] = self;
    id v15 = v10;
    id v25 = v15;
    id v16 = v11;
    id v26 = v16;
    id v27 = &v51;
    id v28 = &v32;
    BOOL v30 = a6;
    char v17 = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v24];
    [(WBSHistoryServiceDatabase *)self _finishedClearingHistory];
    if (v17)
    {
      [(WBSHistoryServiceDatabase *)self _notifyExecutionOfPlan:v33 + 6];
      uint64_t v18 = [WBSHistoryServiceEvent alloc];
      long long v19 = [MEMORY[0x1E4F1C9C8] date];
      v57[0] = @"startDate";
      v57[1] = @"endDate";
      v58[0] = v15;
      v58[1] = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
      int v21 = [(WBSHistoryServiceEvent *)v18 initWithType:@"clear" time:v19 value:v20];

      [(WBSHistoryServiceDatabase *)self _dispatchEvent:v21 listenersToIgnore:0 persistForDelayedDispatching:1 completionHandler:0];
      id v22 = 0;
    }
    else
    {
      id v22 = (id)v52[5];
    }
  }
  else
  {
    [(WBSHistoryServiceDatabase *)self _finishedClearingHistory];
    id v22 = (id)v52[5];
  }
  _Block_object_dispose(&v32, 8);

  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v46);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v44);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v42);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v40);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v38);
  _Block_object_dispose(&v51, 8);

  return v22;
}

BOOL __123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2
    || (v2 != 3 ? (uint64_t v3 = [*(id *)(a1 + 32) _currentGeneration]) : (uint64_t v3 = 0),
        *(void *)&v24[0] = v3,
        id v4 = *(void **)(*(void *)(a1 + 32) + 40),
        [*(id *)(a1 + 40) timeIntervalSinceReferenceDate],
        uint64_t v31 = v5,
        [*(id *)(a1 + 48) timeIntervalSinceReferenceDate],
        id v30 = v6,
        SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double,long long const&>(v4, 0, @"INSERT INTO history_tombstones (start_time, end_time, generation) VALUES (?,?,?)", (double *)&v31, (double *)&v30, v24) == 101))
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x5812000000;
    uint64_t v34 = __Block_byref_object_copy__209;
    memset(v36, 0, sizeof(v36));
    id v35 = __Block_byref_object_dispose__210;
    uint64_t v37 = 0;
    int v38 = 1065353216;
    id v30 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    id v29 = v7;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke_2;
    v26[3] = &unk_1E5C9CA90;
    void v26[4] = &v31;
    id v27 = (id)MEMORY[0x1AD0C4F80](v26);
    LOBYTE(v8) = SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v8, (uint64_t)&obj, @"SELECT id FROM history_visits WHERE visit_time >= ? AND visit_time < ?", &v30, &v29, &v27);
    objc_storeStrong((id *)(v9 + 40), obj);

    if (v8)
    {
      if (!v32[9])
      {
        BOOL v14 = 1;
        goto LABEL_15;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8) + 48;
      memset(v24, 0, sizeof(v24));
      int v25 = 1065353216;
      uint64_t v11 = [*(id *)(a1 + 32) _preparePlan:v10 itemsToDelete:v24 visitsToDelete:v32 + 6 afterDate:*(void *)(a1 + 40) beforeDate:*(void *)(a1 + 48)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v24);
      if (!v11)
      {
        uint64_t v23 = 0;
        *(void *)&v24[0] = 0;
        uint64_t v19 = [*(id *)(a1 + 32) _executePlan:*(void *)(*(void *)(a1 + 64) + 8) + 48 outDeletedItemCount:v24 outDeletedVisitCount:&v23 clearAllSpotlightHistoryForProfile:*(unsigned __int8 *)(a1 + 80)];
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
        int v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        BOOL v14 = v19 == 0;
        goto LABEL_15;
      }
    }
    BOOL v14 = 0;
LABEL_15:

    _Block_object_dispose(&v31, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v36[8]);
    return v14;
  }
  id v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) lastErrorMessage];
    objc_claimAutoreleasedReturnValue();
    __123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke_cold_1();
  }

  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 40) lastErrorWithMethodName:"-[WBSHistoryServiceDatabase _clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:clearAllSpotlightHistoryForProfile:]_block_invoke"];
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  return 0;
}

void *__123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)_notifyExecutionOfPlan:(void *)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  if ([*((id *)a3 + 25) count])
  {
    uint64_t v5 = [WBSHistoryServiceEvent alloc];
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    v26[0] = @"disposedURLs";
    id v6 = *((id *)a3 + 25);
    id v7 = (void *)[v6 copy];
    v27[0] = v7;
    v26[1] = @"disposedHighLevelDomains";
    id v8 = *((id *)a3 + 26);
    uint64_t v9 = (void *)[v8 copy];
    v27[1] = v9;
    v26[2] = @"disposedHostnames";
    id v10 = *((id *)a3 + 27);
    uint64_t v11 = (void *)[v10 copy];
    v27[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    BOOL v13 = [(WBSHistoryServiceEvent *)v5 initWithType:@"maintenance" time:v22 value:v12];

    [(WBSHistoryServiceDatabase *)self _dispatchEvent:v13 listenersToIgnore:0 persistForDelayedDispatching:1 completionHandler:0];
  }
  if (*((void *)a3 + 23) | *((void *)a3 + 13))
  {
    BOOL v14 = [WBSHistoryServiceEvent alloc];
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
    v24[0] = @"disposedVisits";
    id v15 = [(WBSHistoryServiceDatabase *)self _generateDisposedVisitsForPlan:a3];
    v25[0] = v15;
    v24[1] = @"updateLatestVisits";
    uint64_t v16 = (char *)a3 + 120;
    uint64_t v17 = [(WBSHistoryServiceDatabase *)self _generateUpdatedLastVisit:(char *)a3 + 120];
    v25[1] = v17;
    _OWORD v24[2] = @"updateItems";
    uint64_t v18 = [(WBSHistoryServiceDatabase *)self _generateItemsDictionary:v16];
    v25[2] = v18;
    v24[3] = @"updateVisits";
    uint64_t v19 = [(WBSHistoryServiceDatabase *)self _generateVisitsDictionary:v16];
    v25[3] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    int v21 = [(WBSHistoryServiceEvent *)v14 initWithType:@"maintenance" time:v23 value:v20];

    [(WBSHistoryServiceDatabase *)self _dispatchEvent:v21 listenersToIgnore:0 persistForDelayedDispatching:0 completionHandler:0];
  }
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12 && v13)
  {
    MEMORY[0x1AD0C5610]();
    dispatch_queue_t queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __140__WBSHistoryServiceDatabase_clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke;
    v17[3] = &unk_1E5C9CB58;
    void v17[4] = self;
    id v20 = v14;
    id v18 = v12;
    id v19 = v13;
    unint64_t v21 = a5;
    BOOL v22 = a6;
    dispatch_async(queue, v17);
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v16);
  }
}

void __140__WBSHistoryServiceDatabase_clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void *)(a1 + 56);
  unint64_t v3 = [*(id *)(a1 + 32) _clearHistoryVisitsAddedAfterDate:*(void *)(a1 + 40) beforeDate:*(void *)(a1 + 48) tombstoneMode:*(void *)(a1 + 64) clearAllSpotlightHistoryForProfile:*(unsigned __int8 *)(a1 + 72)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  [*(id *)(a1 + 32) _checkpointWriteAheadLog];
  JUMPOUT(0x1AD0C5620);
}

- (id)_insertTombstonesForURLs:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v10 = a4;
  id v42 = a5;
  id v39 = v10;
  BOOL v43 = (a6 & 0xFFFFFFFFFFFFFFFELL) != 2
     && [(WBSHistoryServiceDatabase *)self _shouldEmitLegacyTombstones];
  int64_t v11 = 0;
  int64_t v54 = 0;
  if (a6 != 3) {
    int64_t v11 = [(WBSHistoryServiceDatabase *)self _currentGeneration];
  }
  int64_t v54 = v11;
  objc_msgSend(v10, "timeIntervalSinceReferenceDate", v39);
  uint64_t v53 = v12;
  [v42 timeIntervalSinceReferenceDate];
  uint64_t v52 = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F97FA0]);
  database = self->_database;
  id v51 = 0;
  uint64_t v16 = (void *)[v14 initWithDatabase:database, @"INSERT INTO history_tombstones (url, start_time, end_time, generation) VALUES (?, ?, ?, ?)", &v51 query error];
  id v17 = v51;
  if (!v16)
  {
    id v18 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:]();
    }
    int64_t v36 = 0;
    goto LABEL_30;
  }
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v41;
  uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v19) {
    goto LABEL_23;
  }
  uint64_t v20 = *(void *)v48;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v48 != v20) {
        objc_enumerationMutation(obj);
      }
      BOOL v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      uint64_t v23 = [v22 urlHash];
      if (!v23
        || ([v22 urlSalt],
            long long v24 = objc_claimAutoreleasedReturnValue(),
            BOOL v25 = v24 == 0,
            v24,
            v23,
            v25))
      {
        id v28 = [v22 urlString];
        BOOL v29 = v28 == 0;

        if (v29) {
          continue;
        }
        if (v43)
        {
          id v30 = [v22 urlString];
          [v18 setObject:v30 forKeyedSubscript:@"url"];
        }
        uint64_t v31 = [(WBSHistoryCrypto *)self->_crypto salt];
        uint64_t v32 = [v22 urlString];
        uint64_t v33 = WBSHistorySHA512(v31, v32);
        [v18 setObject:v33 forKeyedSubscript:@"url_hash"];

        id v27 = [(WBSHistoryCrypto *)self->_crypto salt];
        [v18 setObject:v27 forKeyedSubscript:@"url_salt"];
      }
      else
      {
        id v26 = [v22 urlHash];
        [v18 setObject:v26 forKeyedSubscript:@"url_hash"];

        id v27 = [v22 urlSalt];
        [v18 setObject:v27 forKeyedSubscript:@"url_salt"];
      }

      id v46 = [(WBSHistoryCrypto *)self->_crypto encryptDictionary:v18];
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSData * {__strong}&,double const&,double const&,long const&>(v16, &v46, (double *)&v53, (double *)&v52, &v54);
      id v45 = v17;
      char v34 = [v16 execute:&v45];
      id v35 = v45;

      if ((v34 & 1) == 0)
      {
        uint64_t v37 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v35, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:]();
        }

        [v16 invalidate];
        int64_t v36 = 0;
        id v17 = v35;
        goto LABEL_30;
      }
      [v16 reset];

      id v17 = v35;
    }
    uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_23:

  [v16 invalidate];
  int64_t v36 = v17;
  id v17 = 0;
LABEL_30:

  return v17;
}

- (id)_clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v70 = a4;
  id v69 = a5;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x5812000000;
  id v64 = __Block_byref_object_copy__209;
  memset(v66, 0, sizeof(v66));
  id v65 = __Block_byref_object_dispose__210;
  uint64_t v67 = 0;
  int v68 = 1065353216;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __83__WBSHistoryServiceDatabase__clearHistoryItems_afterDate_beforeDate_tombstoneMode___block_invoke;
  v59[3] = &unk_1E5C9CA90;
  v59[4] = &v61;
  id v60 = (id)MEMORY[0x1AD0C4F80](v59);
  id v46 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"SELECT id FROM history_items WHERE url = ? LIMIT 1"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database, @"SELECT id FROM history_items WHERE safari_sha512(url, ?) = ? LIMIT 1" query];
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"SELECT id FROM history_visits WHERE history_item = ? AND visit_time > ? AND visit_time < ?"];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v41;
  uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v86 count:16];
  BOOL v43 = v8;
  if (v9)
  {
    uint64_t v10 = *(void *)v56;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
        *(void *)&v71[0] = 0;
        uint64_t v13 = [v12 urlString];
        BOOL v14 = v13 == 0;

        if (!v14)
        {
          id v54 = 0;
          id v53 = [v12 urlString];
          *(void *)uint8_t buf = v71;
          char v15 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},std::tuple<long long &>>(v46, (uint64_t)&v54, &v53, (void **)buf);
          id v16 = v54;

          if ((v15 & 1) == 0)
          {
            BOOL v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              id v30 = objc_msgSend(v16, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 138543362;
              *(void *)&uint8_t buf[4] = v30;
              _os_log_impl(&dword_1A6B5F000, v29, OS_LOG_TYPE_INFO, "Unable to locate URL in database: %{public}@", buf, 0xCu);
            }
            uint64_t v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v31 = [v12 urlString];
              uint64_t v32 = objc_msgSend(v16, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 138478083;
              *(void *)&uint8_t buf[4] = v31;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&unsigned char buf[14] = v32;
              _os_log_debug_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_DEBUG, "Unable to locate %{private}@ in database: %{public}@", buf, 0x16u);
            }
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_8;
        }
        id v16 = [v12 urlSalt];
        if (!v16) {
          goto LABEL_25;
        }
        uint64_t v23 = [v12 urlHash];
        BOOL v24 = v23 == 0;

        if (!v24)
        {
          id v52 = 0;
          id v51 = [v12 urlSalt];
          id v50 = [v12 urlHash];
          *(void *)uint8_t buf = v71;
          char v25 = SafariShared::WBSSQLiteDatabaseEnumerate<NSData * {__strong},NSData * {__strong},std::tuple<long long &>>(v8, (uint64_t)&v52, &v51, &v50, (uint64_t *)buf);
          id v16 = v52;

          if ((v25 & 1) == 0)
          {
            id v26 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              id v27 = objc_msgSend(v16, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 138543362;
              *(void *)&uint8_t buf[4] = v27;
              _os_log_impl(&dword_1A6B5F000, v26, OS_LOG_TYPE_INFO, "Unable to locate URL in database: %{public}@", buf, 0xCu);
            }
            uint64_t v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              id v28 = objc_msgSend(v16, "safari_privacyPreservingDescription");
              *(_DWORD *)uint8_t buf = 138412546;
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&unsigned char buf[14] = v28;
              _os_log_debug_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_DEBUG, "Unable to locate %@ in database: %{public}@", buf, 0x16u);
            }
            goto LABEL_24;
          }
LABEL_8:
          id v17 = v16;
          id v49 = v16;
          char v18 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong}&)(long long)>(v44, (uint64_t)&v49, (sqlite3_int64 *)v71, (sqlite3_int64 *)&v70, (sqlite3_int64 *)&v69, (sqlite3_int64 *)&v60);
          id v16 = v49;

          if (v18) {
            goto LABEL_25;
          }
          uint64_t v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = *(void *)&v71[0];
            char v34 = objc_msgSend(v16, "safari_privacyPreservingDescription");
            *(_DWORD *)uint8_t buf = 134218242;
            *(void *)&uint8_t buf[4] = v33;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&unsigned char buf[14] = v34;
            _os_log_error_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch visits for URL with item ID %lli in database: %{public}@", buf, 0x16u);

            id v8 = v43;
          }

          uint64_t v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v21 = *(void *)&v71[0];
            BOOL v22 = objc_msgSend(v16, "safari_privacyPreservingDescription");
            *(_DWORD *)uint8_t buf = 138478339;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&unsigned char buf[14] = v21;
            *(_WORD *)&unsigned char buf[22] = 2114;
            *(void *)&buf[24] = v22;
            _os_log_debug_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_DEBUG, "Unable to fetch visits for %{private}@ (%lli) in database: %{public}@", buf, 0x20u);

            id v8 = v43;
          }
          goto LABEL_24;
        }
        id v16 = 0;
LABEL_25:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v86 count:16];
      uint64_t v9 = v35;
    }
    while (v35);
  }

  [v46 invalidate];
  [v8 invalidate];
  [v44 invalidate];
  if (!a6
    || (-[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:](self, "_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:", obj, v70, v69), (int64_t v36 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v62[9])
    {
      memset(buf, 0, sizeof(buf));
      memset(v75, 0, sizeof(v75));
      int v74 = 1065353216;
      int v76 = 1065353216;
      memset(v77, 0, sizeof(v77));
      memset(v79, 0, sizeof(v79));
      int v78 = 1065353216;
      int v80 = 1065353216;
      memset(v81, 0, sizeof(v81));
      int v82 = 1065353216;
      id v84 = 0;
      id v83 = 0;
      id v85 = 0;
      memset(v71, 0, sizeof(v71));
      int v72 = 1065353216;
      int64_t v36 = [(WBSHistoryServiceDatabase *)self _preparePlan:buf itemsToDelete:v71 visitsToDelete:v62 + 6 afterDate:v70 beforeDate:v69];
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v71);
      if (v36)
      {
        uint64_t v37 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v36, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:]();
        }
      }
      else
      {
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        int64_t v36 = [(WBSHistoryServiceDatabase *)self _executePlan:buf outDeletedItemCount:&v48 outDeletedVisitCount:&v47 clearAllSpotlightHistoryForProfile:0];
        if (v36)
        {
          int v38 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v36, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:]();
          }
        }
        else
        {
          [(WBSHistoryServiceDatabase *)self _notifyExecutionOfPlan:buf];
        }
      }

      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v81);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v79);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v77);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v75);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
    }
    else
    {
      int64_t v36 = 0;
    }
  }

  _Block_object_dispose(&v61, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v66[8]);

  return v36;
}

void *__83__WBSHistoryServiceDatabase__clearHistoryItems_afterDate_beforeDate_tombstoneMode___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 count])
  {
    if (v13 && v14)
    {
      MEMORY[0x1AD0C5610]();
      dispatch_queue_t queue = self->_queue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke;
      v18[3] = &unk_1E5C9B030;
      v18[4] = self;
      id v19 = v12;
      id v20 = v13;
      id v21 = v14;
      unint64_t v23 = a6;
      id v22 = v15;
      dispatch_async(queue, v18);
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      (*((void (**)(id, void *))v15 + 2))(v15, v17);
    }
  }
  else
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

void __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke(uint64_t a1)
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__101;
  void v17[4] = __Block_byref_object_dispose__102;
  id v18 = 0;
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 40);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke_2;
  uint64_t v10 = &unk_1E5C9CB80;
  id v15 = v17;
  uint64_t v11 = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  id v14 = v4;
  uint64_t v16 = v5;
  [v3 tryToPerformTransactionInBlock:&v7];
  objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLog", v7, v8, v9, v10, v11);
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  MEMORY[0x1AD0C5620](v6);

  _Block_object_dispose(v17, 8);
}

BOOL __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clearHistoryItems:*(void *)(a1 + 40) afterDate:*(void *)(a1 + 48) beforeDate:*(void *)(a1 + 56) tombstoneMode:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == 0;
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v16 = 0;
  uint64_t v3 = [v2 _dateForMetadataKey:@"clear_history_start_date" error:&v16];
  id v4 = v16;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v15 = v5;
    id v8 = [v7 _dateForMetadataKey:@"clear_history_end_date" error:&v15];
    id v13 = v15;

    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v13 == 0;
    }
    if (v9)
    {
      if (v8)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        if (v3) {
          [v10 _clearHistoryVisitsAddedAfterDate:v3 beforeDate:v8 tombstoneMode:1 clearAllSpotlightHistoryForProfile:0];
        }
        else {
        id v12 = [v10 _clearAllHistoryInsertingTombstoneUpToDate:v8 clearAllSpotlightHistoryForProfile:0];
        }
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

        MEMORY[0x1AD0C5620]();
      }
      else
      {
        id v14 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_cold_1();
        }
        [*(id *)(a1 + 32) _finishedClearingHistory];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v13 = v5;
  }
}

- (double)_oldestLatestVisit
{
  uint64_t v2 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT MIN(visit_time) FROM history_visits WHERE id = safari_latest_visit_for (history_item) AND history_item IN (SELECT id FROM history_items)");
  uint64_t v3 = [v2 nextObject];
  [v3 doubleAtIndex:0];
  double v5 = v4;

  return v5;
}

- (id)_expireOldVisits:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 134217984;
    double v13 = a3;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Expiring old visits. Interval is %f", buf, 0xCu);
  }
  id v6 = [(WBSHistoryServiceDatabase *)self _ensureLatestVisitsAreComputed];
  [(WBSHistoryServiceDatabase *)self _oldestLatestVisit];
  double v11 = v7 - a3;
  if (v7 - a3 < 0.0
    || SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double &>(self->_database, 0, @"DELETE FROM history_visits WHERE visit_time < ?", &v11) == 101)
  {
    id v8 = 0;
  }
  else
  {
    BOOL v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _expireOldVisits:]();
    }

    id v8 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _expireOldVisits:]");
  }
  return v8;
}

- (void)expireOldVisits:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSHistoryServiceDatabase_expireOldVisits_completionHandler___block_invoke;
  block[3] = &unk_1E5C9B0A8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __63__WBSHistoryServiceDatabase_expireOldVisits_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _expireOldVisits:*(double *)(a1 + 48)];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (id)_recomputeVisitScores:(void *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Recomputing visit scores", buf, 2u);
  }
  database = self->_database;
  id v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__WBSHistoryServiceDatabase__recomputeVisitScores___block_invoke;
  v19[3] = &__block_descriptor_40_e8_v16__0q8l;
  v19[4] = a3;
  id v20 = (id)MEMORY[0x1AD0C4F80](v19);
  char v7 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v21, @"SELECT id FROM history_visits WHERE history_item IN (SELECT id FROM history_items WHERE should_recompute_derived_visit_counts <> 0) AND score <> safari_visit_score(attributes, origin)", &v20);
  id v8 = v21;

  if (v7)
  {
    if (*((void *)a3 + 3))
    {
      BOOL v9 = self->_database;
      id v18 = v8;
      id v10 = createQueryWithList(@"UPDATE history_visits SET score = safari_visit_score(attributes, origin) WHERE id IN ("), (uint64_t)a3, CFSTR(")");
      int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v9, &v18, v10);
      id v12 = v18;

      if (v11 && v11 != 101)
      {
        id v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          [v12 safari_privacyPreservingDescription];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _recomputeVisitScores:]();
        }
        id v8 = v12;
      }
      else
      {
        double v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
          *(_DWORD *)uint8_t buf = 134217984;
          uint64_t v23 = v14;
          _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Updated score of %zi visits", buf, 0xCu);
        }

        id v8 = 0;
        id v15 = v12;
      }
    }
    else
    {
      id v16 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryServiceDatabase _recomputeVisitScores:]();
      }
      id v15 = v8;
      id v8 = 0;
    }
  }
  else
  {
    id v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v8 safari_privacyPreservingDescription];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _recomputeVisitScores:]();
    }
  }

  return v8;
}

void *__51__WBSHistoryServiceDatabase__recomputeVisitScores___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1 + 32), &v3, &v3);
}

- (id)_recomputeItemScores:(void *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Recomputing item scores", buf, 2u);
  }
  database = self->_database;
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__WBSHistoryServiceDatabase__recomputeItemScores___block_invoke;
  v25[3] = &__block_descriptor_40_e8_v16__0q8l;
  void v25[4] = a3;
  id v26 = (id)MEMORY[0x1AD0C4F80](v25);
  char v7 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v27, @"SELECT id FROM history_items WHERE should_recompute_derived_visit_counts <> 0", &v26);
  id v8 = v27;

  if (v7)
  {
    if (!*((void *)a3 + 3))
    {
      id v17 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryServiceDatabase _recomputeItemScores:]();
      }
      BOOL v9 = v8;
      goto LABEL_21;
    }
    BOOL v9 = createQueryWithList(@"WITH view_history_visit_ranges_by_item(id, min, max) AS (SELECT history_item AS id, max(min(visit_time), max(visit_time) - ?) AS min, max(visit_time) AS max FROM history_visits WHERE history_visits.history_item IN ("), (uint64_t)a3, CFSTR(") GROUP BY history_visits.history_item), view_history_item_scores(id, visit_count_score, daily_visit_counts, weekly_visit_counts) AS (SELECT history_visits.history_item AS id,sum(score) AS visit_count_score,safari_compute_daily_visit_counts(view_history_visit_ranges_by_item.min, view_history_visit_ranges_by_item.max, visit_time, score) AS daily_visit_counts,safari_compute_weekly_visit_counts(view_history_visit_ranges_by_item.min, view_history_visit_ranges_by_item.max, visit_time, score) AS weekly_visit_counts FROM history_visits INNER JOIN view_history_visit_ranges_by_item ON view_history_visit_ranges_by_item.id = history_visits.history_item WHERE history_visits.visit_time >= view_history_visit_ranges_by_item.min GROUP BY history_visits.history_item) UPDATE history_items SET visit_count_score = (SELECT view_history_item_scores.visit_count_score FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),daily_visit_counts = (SELECT view_history_item_scores.daily_visit_counts FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),weekly_visit_counts = (SELECT view_history_item_scores.weekly_visit_counts FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),should_recompute_derived_visit_counts = 0 WHERE history_items.id IN (SELECT view_history_item_scores.id FROM view_history_item_scores)");
    double v24 = 86400.0 * (double)0x31uLL;
    id v10 = self->_database;
    uint64_t v23 = v8;
    int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&>(v10, &v23, v9, &v24);
    id v12 = v23;

    id v8 = v12;
    if (!v11 || v11 == 101)
    {
      if (![(WBSSQLiteDatabase *)self->_database changedRowCount])
      {
        double v13 = createQueryWithList(@"SELECT COUNT(*) FROM history_visits WHERE history_visits.history_item IN ("), (uint64_t)a3, CFSTR(")");
        uint64_t v14 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, v13);
        id v15 = [v14 nextObject];
        id v16 = v15;
        if (v15) {
          [v15 int64AtIndex:0];
        }

        id v18 = [v14 statement];
        [v18 invalidate];

        id v19 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[WBSHistoryServiceDatabase _recomputeItemScores:]();
        }
      }
      id v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
        *(_DWORD *)uint8_t buf = 134217984;
        uint64_t v29 = v21;
        _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_INFO, "Updated score of %zi items", buf, 0xCu);
      }

LABEL_21:
      id v8 = 0;
    }
  }
  else
  {
    BOOL v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v8 safari_privacyPreservingDescription];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _recomputeItemScores:]();
    }
  }

  return v8;
}

void *__50__WBSHistoryServiceDatabase__recomputeItemScores___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1 + 32), &v3, &v3);
}

- (void)recomputeItemScoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSHistoryServiceDatabase_recomputeItemScoresWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __70__WBSHistoryServiceDatabase_recomputeItemScoresWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  memset(v7, 0, sizeof(v7));
  int v8 = 1065353216;
  uint64_t v2 = [*(id *)(a1 + 32) _recomputeItemScores:v7];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v2);
  }
  else
  {
    double v5 = [[WBSSetInt64 alloc] initWithMovableSet:v7];
    (*(void (**)(uint64_t, WBSSetInt64 *, void))(v3 + 16))(v3, v5, 0);
  }
  MEMORY[0x1AD0C5620](v4);

  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v7);
}

- (id)_findAllRelatedVisits:(const void *)a3 forPlan:(void *)a4 afterDate:(id)a5 beforeDate:(id)a6
{
  id v60 = a5;
  id v59 = a6;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x5812000000;
  long long v55 = __Block_byref_object_copy__209;
  long long v56 = __Block_byref_object_dispose__210;
  uint64_t v57 = 0;
  std::unordered_set<long long>::unordered_set((uint64_t)v58, (uint64_t)a3);
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x5812000000;
  uint64_t v47 = __Block_byref_object_copy__209;
  memset(v49, 0, sizeof(v49));
  uint64_t v48 = __Block_byref_object_dispose__210;
  uint64_t v50 = 0;
  int v51 = 1065353216;
  id v10 = &v37[8];
  do
  {
    if (!v53[9]) {
      goto LABEL_20;
    }
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x5812000000;
    uint64_t v35 = __Block_byref_object_copy__209;
    int64_t v36 = __Block_byref_object_dispose__210;
    memset(v37, 0, sizeof(v37));
    uint64_t v38 = 0;
    int v39 = 1065353216;
    int v11 = createQueryWithList(@"SELECT id, history_item, redirect_source, redirect_destination FROM history_visits WHERE id IN ("), (uint64_t)(v53 + 6), CFSTR(")");
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)a4, vcvtps_u32_f32((float)(unint64_t)(v53[9] + *((void *)a4 + 3)) / *((float *)a4 + 8)));
    id v12 = v53;
    double v13 = (void *)v53[8];
    if (v13)
    {
      do
      {
        v31[0] = v13[2];
        v31[1] = 0;
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::pair<long long,int>>((uint64_t)a4, v31, (uint64_t)v31);
        double v13 = (void *)*v13;
      }
      while (v13);
      id v12 = v53;
    }
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(v12 + 6);
    database = self->_database;
    id v30 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke;
    v28[3] = &unk_1E5C9CBC8;
    v28[4] = self;
    void v28[5] = &v44;
    v28[9] = a4;
    v28[10] = a4;
    v28[6] = &v32;
    v28[7] = &v52;
    v28[8] = &v40;
    id v29 = (id)MEMORY[0x1AD0C4F80](v28);
    LOBYTE(database) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,long long,long long,long long)>(database, (uint64_t)&v30, v11, &v29);
    id v15 = v30;

    if ((database & 1) == 0)
    {
      id v20 = 0;
      LODWORD(v16) = 1;
      id v24 = v15;
      goto LABEL_18;
    }
    if (!v41[3])
    {
      LODWORD(v16) = 3;
LABEL_17:
      id v20 = v15;
      goto LABEL_18;
    }
    LODWORD(v16) = 0;
    if (!v33[9] || !v60 || !v59) {
      goto LABEL_17;
    }
    id v17 = v10;
    id v18 = createQueryWithList(@"SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)(v33 + 6), CFSTR(") AND redirect_destination IS NULL AND visit_time > ? AND visit_time < ?");

    id v19 = self->_database;
    id v27 = v15;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke_2;
    v25[3] = &unk_1E5C9CBF0;
    void v25[4] = &v52;
    void v25[5] = a4;
    id v26 = (id)MEMORY[0x1AD0C4F80](v25);
    SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v19, (uint64_t)&v27, v18, &v60, &v59, &v26);
    id v20 = v27;

    id v16 = (void *)v33[8];
    if (v16)
    {
      uint64_t v21 = (uint64_t)(v45 + 6);
      do
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(v21, v16 + 2, v16 + 2);
        id v16 = (void *)*v16;
      }
      while (v16);
    }
    int v11 = v18;
    id v10 = v17;
LABEL_18:

    _Block_object_dispose(&v32, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v10);
    _Block_object_dispose(&v40, 8);
  }
  while (!v16);
  if (v16 == 3)
  {
LABEL_20:
    id v22 = 0;
    goto LABEL_22;
  }
  id v22 = v24;
LABEL_22:
  _Block_object_dispose(&v44, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v49[8]);
  _Block_object_dispose(&v52, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v58);

  return v22;
}

void *__80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v14 = a3;
  id v15 = (void *)a2;
  unint64_t v12 = a5;
  unint64_t v13 = a4;
  if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((void *)(a1[9] + 40), (unint64_t *)&v14))
  {
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[9] + 80, (unint64_t *)&v14, &v14);
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[9] + 160, (unint64_t *)&v15, &v15);
    if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((void *)(*(void *)(a1[5] + 8) + 48), (unint64_t *)&v14))
    {
      VisitID = SafariShared::LatestVisitInformationMap::lastVisitID((SafariShared::LatestVisitInformationMap *)(a1[4] + 88), v14);
      if (VisitID == v15) {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1[6] + 8) + 48, (unint64_t *)&v14, &v14);
      }
    }
  }
  uint64_t v9 = v14;
  uint64_t v10 = a1[10];
  id v16 = (unint64_t *)&v15;
  uint64_t result = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v10, (unint64_t *)&v15, (uint64_t)&std::piecewise_construct, &v16);
  result[3] = v9;
  if (a4)
  {
    uint64_t result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((void *)a1[10], &v13);
    if (!result) {
      uint64_t result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1[7] + 8) + 48, &v13, &v13);
    }
  }
  if (a5)
  {
    uint64_t result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((void *)a1[10], &v12);
    if (!result) {
      uint64_t result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1[7] + 8) + 48, &v12, &v12);
    }
  }
  ++*(void *)(*(void *)(a1[8] + 8) + 24);
  return result;
}

void *__80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = a2;
  uint64_t result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(*(void **)(a1 + 40), &v4);
  if (!result) {
    return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v4, &v4);
  }
  return result;
}

- (id)_findAllRelatedVisitsToItems:(const void *)a3 forPlan:(void *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x5812000000;
  id v17 = __Block_byref_object_copy__209;
  id v18 = __Block_byref_object_dispose__210;
  memset(v19, 0, sizeof(v19));
  uint64_t v20 = 0;
  int v21 = 1065353216;
  database = self->_database;
  id v13 = 0;
  char v7 = createQueryWithList(@"SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)a3, CFSTR(")");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__WBSHistoryServiceDatabase__findAllRelatedVisitsToItems_forPlan___block_invoke;
  v11[3] = &unk_1E5C9CA90;
  v11[4] = &v14;
  id v12 = (id)MEMORY[0x1AD0C4F80](v11);
  LOBYTE(database) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v13, v7, &v12);
  id v8 = v13;

  if (database)
  {
    uint64_t v9 = [(WBSHistoryServiceDatabase *)self _findAllRelatedVisits:v15 + 6 forPlan:a4 afterDate:0 beforeDate:0];
  }
  else
  {
    uint64_t v9 = v8;
    id v8 = 0;
  }
  _Block_object_dispose(&v14, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v19 + 8);

  return v9;
}

void *__66__WBSHistoryServiceDatabase__findAllRelatedVisitsToItems_forPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (id)_findObsoleteItemsForPlan:(void *)a3
{
  double v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Searching for obsolete items", buf, 2u);
  }
  if (*((void *)a3 + 23))
  {
    id v6 = createQueryWithList(@"SELECT history_items.id FROM history_items LEFT JOIN history_visits ON history_visits.history_item = history_items.id AND history_visits.id NOT IN ("), (uint64_t)a3 + 160, CFSTR(") GROUP BY history_items.id HAVING COUNT(history_visits.history_item) = 0");
    database = self->_database;
    id v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__WBSHistoryServiceDatabase__findObsoleteItemsForPlan___block_invoke;
    v13[3] = &__block_descriptor_40_e8_v16__0q8l;
    v13[4] = a3;
    id v14 = (id)MEMORY[0x1AD0C4F80](v13);
    int v8 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v15, v6, &v14);
    id v9 = v15;

    if (v8) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v8) {
      int v11 = 0;
    }
    else {
      int v11 = v9;
    }
  }
  else
  {
    int v11 = 0;
  }
  return v11;
}

void *__55__WBSHistoryServiceDatabase__findObsoleteItemsForPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(a1 + 32) + 40, &v3, &v3);
}

- (id)_preparePlan:(void *)a3 itemsToDelete:(const void *)a4 visitsToDelete:(const void *)a5 afterDate:(id)a6 beforeDate:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "Preparing plan", (uint8_t *)&v23, 2u);
  }
  for (uint64_t i = (void *)*((void *)a4 + 2); i; uint64_t i = (void *)*i)
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)a3 + 40, i + 2, i + 2);
  if (!*((void *)a5 + 3)
    || ([(WBSHistoryServiceDatabase *)self _findAllRelatedVisits:a5 forPlan:a3 afterDate:v12 beforeDate:v13], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!*((void *)a4 + 3)
      || ([(WBSHistoryServiceDatabase *)self _findAllRelatedVisitsToItems:a4 forPlan:a3], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v16 = [(WBSHistoryServiceDatabase *)self _findObsoleteItemsForPlan:a3];
      if (!v16)
      {
        SafariShared::DeletionPlan::sanitizeItemTouched((uint64_t *)a3);
        SafariShared::DeletionPlan::sanitizeVisitsToDelete(a3);
        id v17 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = *((void *)a3 + 8);
          uint64_t v19 = *((void *)a3 + 23);
          int v23 = 134218240;
          uint64_t v24 = v18;
          __int16 v25 = 2048;
          uint64_t v26 = v19;
          _os_log_impl(&dword_1A6B5F000, v17, OS_LOG_TYPE_INFO, "Plan will delete %zu items, %zu visits", (uint8_t *)&v23, 0x16u);
        }
        uint64_t v20 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *((void *)a3 + 13);
          int v23 = 134217984;
          uint64_t v24 = v21;
          _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_INFO, "Plan will modify %zu items", (uint8_t *)&v23, 0xCu);
        }
        uint64_t v16 = 0;
      }
    }
  }

  return v16;
}

- (unint64_t)_countOfItems
{
  database = self->_database;
  unint64_t v4 = (sqlite3_int64 *)&v5;
  unint64_t v5 = 0;
  SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(database, 0, @"SELECT count(*) FROM history_items", &v4);
  return v5;
}

- (id)_deleteOldestItems:(unint64_t)a3 forPlan:(void *)a4
{
  id v6 = (char *)a4 + 40;
  char v7 = [NSString stringWithFormat:@" GROUP BY history_items.id ORDER BY MAX(visit_time) LIMIT %zu"], a3);
  int v8 = createQueryWithList(@"SELECT history_items.id FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE history_items.id NOT IN ("), (uint64_t)v6, v7;

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x5812000000;
  int v23 = __Block_byref_object_copy__209;
  uint64_t v24 = __Block_byref_object_dispose__210;
  memset(v25, 0, sizeof(v25));
  uint64_t v26 = 0;
  int v27 = 1065353216;
  database = self->_database;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__WBSHistoryServiceDatabase__deleteOldestItems_forPlan___block_invoke;
  v17[3] = &unk_1E5C9CA90;
  void v17[4] = &v20;
  id v18 = (id)MEMORY[0x1AD0C4F80](v17);
  char v10 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v19, v8, &v18);
  id v11 = v19;

  if (v10)
  {
    id v12 = v21;
    id v13 = (void *)v21[8];
    if (v13)
    {
      do
      {
        unint64_t v16 = v13[2];
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v6, &v16, &v16);
        id v13 = (void *)*v13;
      }
      while (v13);
      id v12 = v21;
    }
    [(WBSHistoryServiceDatabase *)self _findAllRelatedVisitsToItems:v12 + 6 forPlan:a4];
    id v14 = v11;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
  _Block_object_dispose(&v20, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v25 + 8);

  return v11;
}

void *__56__WBSHistoryServiceDatabase__deleteOldestItems_forPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (id)_preparePlan:(void *)a3 ageLimit:(double)a4 itemCountLimit:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v33 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x5812000000;
  id v28 = __Block_byref_object_copy__209;
  id v29 = __Block_byref_object_dispose__210;
  memset(v30, 0, sizeof(v30));
  uint64_t v31 = 0;
  int v32 = 1065353216;
  database = self->_database;
  id v24 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__WBSHistoryServiceDatabase__preparePlan_ageLimit_itemCountLimit___block_invoke;
  v22[3] = &unk_1E5C9CA90;
  v22[4] = &v25;
  id v23 = (id)MEMORY[0x1AD0C4F80](v22, a2);
  char v9 = SafariShared::WBSSQLiteDatabaseEnumerate<double &,void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v24, @"SELECT id FROM history_visits WHERE visit_time < ?", &v33, &v23);
  id v10 = v24;

  if (v9)
  {
    memset(buf, 0, sizeof(buf));
    int v35 = 1065353216;
    id v11 = [(WBSHistoryServiceDatabase *)self _preparePlan:a3 itemsToDelete:buf visitsToDelete:v26 + 6 afterDate:0 beforeDate:0];
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
    unint64_t v12 = [(WBSHistoryServiceDatabase *)self _countOfItems];
    uint64_t v13 = *((void *)a3 + 8);
    if (v12 != v13)
    {
      if (v12 - v13 > a5)
      {
        uint64_t v14 = [(WBSHistoryServiceDatabase *)self _deleteOldestItems:v12 - a5 - v13 forPlan:a3];
        if (v14
          || ([(WBSHistoryServiceDatabase *)self _findObsoleteItemsForPlan:a3],
              (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v15 = v10;
          id v10 = (id)v14;
          goto LABEL_14;
        }
        SafariShared::DeletionPlan::sanitizeItemTouched((uint64_t *)a3);
        SafariShared::DeletionPlan::sanitizeVisitsToDelete(a3);
      }
      unint64_t v16 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *((void *)a3 + 8);
        uint64_t v18 = *((void *)a3 + 23);
        *(_DWORD *)uint8_t buf = 134218240;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&unsigned char buf[14] = v18;
        _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_INFO, "Plan will delete %zu items, %zu visits", buf, 0x16u);
      }
      id v19 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *((void *)a3 + 13);
        *(_DWORD *)uint8_t buf = 134217984;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_INFO, "Plan will modify %zu items", buf, 0xCu);
      }
    }
    id v15 = v10;
    id v10 = 0;
  }
  else
  {
    id v15 = 0;
  }
LABEL_14:
  _Block_object_dispose(&v25, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v30 + 8);

  return v10;
}

void *__66__WBSHistoryServiceDatabase__preparePlan_ageLimit_itemCountLimit___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)deletionPlanForItemsToDelete:(id)a3 visitsToDelete:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__WBSHistoryServiceDatabase_deletionPlanForItemsToDelete_visitsToDelete_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9B058;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __91__WBSHistoryServiceDatabase_deletionPlanForItemsToDelete_visitsToDelete_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  memset(v8, 0, sizeof(v8));
  LODWORD(v9) = 1065353216;
  memset(v10, 0, sizeof(v10));
  LODWORD(v11) = 1065353216;
  memset(v12, 0, sizeof(v12));
  LODWORD(v13) = 1065353216;
  memset(v14, 0, sizeof(v14));
  LODWORD(v15) = 1065353216;
  memset(v16, 0, sizeof(v16));
  LODWORD(v17) = 1065353216;
  id v18 = 0;
  id v19 = 0;
  id v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:", v8, objc_msgSend(*(id *)(a1 + 40), "set", 0, 0, 0, 0, v9, 0, 0, 0, 0, v11, 0, 0, 0,
      0,
      v13,
      0,
      0,
      0,
      0,
      v15,
      0,
      0,
      0,
      0,
      v17),
    [*(id *)(a1 + 48) set],
    0,
  uint64_t v2 = 0);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2)
  {
    (*(void (**)(void, void, void, void, void *))(v3 + 16))(*(void *)(a1 + 56), 0, 0, 0, v2);
  }
  else
  {
    unint64_t v4 = [[WBSSetInt64 alloc] initWithMovableSet:v10];
    unint64_t v5 = [[WBSSetInt64 alloc] initWithMovableSet:v16];
    id v6 = [[WBSSetInt64 alloc] initWithMovableSet:v12];
    (*(void (**)(uint64_t, WBSSetInt64 *, WBSSetInt64 *, WBSSetInt64 *, void))(v3 + 16))(v3, v4, v5, v6, 0);
  }
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v16);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v14);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v12);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v10);
  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v8);
}

- (void)deletionPlanForAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  dispatch_queue_t queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__WBSHistoryServiceDatabase_deletionPlanForAgeLimit_itemCountLimit_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9CC18;
  double v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __86__WBSHistoryServiceDatabase_deletionPlanForAgeLimit_itemCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  memset(v8, 0, sizeof(v8));
  int v9 = 1065353216;
  memset(v10, 0, sizeof(v10));
  int v11 = 1065353216;
  memset(v12, 0, sizeof(v12));
  int v13 = 1065353216;
  memset(v14, 0, sizeof(v14));
  int v15 = 1065353216;
  memset(v16, 0, sizeof(v16));
  int v17 = 1065353216;
  id v18 = 0;
  id v19 = 0;
  id v20 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _preparePlan:v8 ageLimit:*(void *)(a1 + 56) itemCountLimit:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void, void, void, void, void *))(v3 + 16))(*(void *)(a1 + 40), 0, 0, 0, v2);
  }
  else
  {
    unint64_t v4 = [[WBSSetInt64 alloc] initWithMovableSet:v10];
    unint64_t v5 = [[WBSSetInt64 alloc] initWithMovableSet:v16];
    id v6 = [[WBSSetInt64 alloc] initWithMovableSet:v12];
    (*(void (**)(uint64_t, WBSSetInt64 *, WBSSetInt64 *, WBSSetInt64 *, void))(v3 + 16))(v3, v4, v5, v6, 0);
  }
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v16);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v14);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v12);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v10);
  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v8);
}

- (id)_collectDeletedURLsForPlan:(void *)a3
{
  if (*((void *)a3 + 8))
  {
    unint64_t v4 = (char *)a3 + 40;
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:");
    database = self->_database;
    char v7 = createQueryWithList(@"SELECT id, url FROM history_items WHERE id IN ("), (uint64_t)v4, CFSTR(")");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _OWORD v10[2] = __56__WBSHistoryServiceDatabase__collectDeletedURLsForPlan___block_invoke;
    v10[3] = &unk_1E5C9CAB8;
    id v8 = v5;
    id v11 = v8;
    id v12 = (id)MEMORY[0x1AD0C4F80](v10);
    SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,NSString *)>(database, 0, v7, &v12);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v8;
}

void __56__WBSHistoryServiceDatabase__collectDeletedURLsForPlan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unint64_t v5 = [NSNumber numberWithLongLong:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_collectDeletedHighLevelDomainsForPlan:(void *)a3
{
  if (*((void *)a3 + 8))
  {
    if ([*((id *)a3 + 27) count])
    {
      id v5 = [(WBSHistoryServiceDatabase *)self _collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:a3];
    }
    else
    {
      id v6 = createQueryWithList(@"WITH deleted_item_ids AS (SELECT id FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")), deleted_domains_with_counts AS (SELECT safari_high_level_domain(url) AS deleted_domain, COUNT(*) AS deleted_domain_count FROM history_items WHERE id IN (SELECT id FROM deleted_item_ids) GROUP BY deleted_domain) SELECT safari_high_level_domain(url) AS domain FROM history_items WHERE domain IN (SELECT deleted_domain FROM deleted_domains_with_counts) GROUP BY domain HAVING (COUNT(*) - (SELECT deleted_domain_count FROM deleted_domains_with_counts WHERE deleted_domain = safari_high_level_domain(url))) <= 0");
      char v7 = [MEMORY[0x1E4F1CA48] array];
      database = self->_database;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      _OWORD v10[2] = __68__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsForPlan___block_invoke;
      v10[3] = &unk_1E5C8DB88;
      id v5 = v7;
      id v11 = v5;
      id v12 = (id)MEMORY[0x1AD0C4F80](v10);
      SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(NSString *)>(database, 0, v6, &v12);
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

uint64_t __68__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsForPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:(void *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = objc_msgSend(*((id *)a3 + 27), "safari_mapObjectsUsingBlock:", &__block_literal_global_320);
  char v7 = [v5 setWithArray:v6];
  uint64_t v31 = (void *)[v7 mutableCopy];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_2;
  v41[3] = &__block_descriptor_40_e27___NSString_16__0__NSArray_8l;
  v41[4] = a3;
  id v30 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v41);
  uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
  id v8 = v31;
  id v28 = [MEMORY[0x1E4F1CA48] array];
  int v9 = [MEMORY[0x1E4F1CA48] array];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_3;
  v36[3] = &unk_1E5C9CC60;
  id v10 = v9;
  id v37 = v10;
  id v11 = v27;
  id v38 = v11;
  uint64_t v40 = v30;
  id v12 = v28;
  id v39 = v12;
  id v29 = v10;
  [v31 enumerateObjectsUsingBlock:v36];
  if ([v10 count])
  {
    int v13 = ((void (**)(void, id))v30)[2](v30, v10);
    [v11 addObject:v13];

    unint64_t v14 = (void *)[v10 copy];
    [v12 addObject:v14];

    id v8 = v31;
  }
  int v15 = [MEMORY[0x1E4F1CA80] set];
  for (unint64_t i = 0; i < [v11 count]; ++i)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    database = self->_database;
    id v18 = [v11 objectAtIndexedSubscript:i];
    id v19 = [v12 objectAtIndexedSubscript:i];
    id v20 = [(WBSSQLiteDatabase *)database fetchQuery:v18 stringArguments:v19];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = [*(id *)(*((void *)&v32 + 1) + 8 * j) stringAtIndex:0];
          [v15 addObject:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v21);
    }

    id v8 = v31;
  }
  [v8 minusSet:v15];
  uint64_t v25 = [v8 allObjects];

  return v25;
}

id __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "safari_highLevelDomainFromHost");
  return v2;
}

id __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = objc_msgSend(@"?", "safari_stringByRepeatingWithCount:joinedByString:", objc_msgSend(v3, "count"), @",");
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT safari_high_level_domain(url) FROM history_items WHERE safari_high_level_domain(url) IN (%@) AND NOT id IN ("), v4;
  id v6 = createQueryWithList(v5, *(void *)(a1 + 32) + 40, @""));

  return v6;
}

void __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x64)
  {
    id v3 = *(void **)(a1 + 40);
    unint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [v3 addObject:v4];

    id v5 = *(void **)(a1 + 48);
    id v6 = (void *)[*(id *)(a1 + 32) copy];
    [v5 addObject:v6];

    [*(id *)(a1 + 32) removeAllObjects];
  }
}

- (id)_collectDeletedHostnamesForPlan:(void *)a3
{
  if (*((void *)a3 + 8))
  {
    unint64_t v4 = createQueryWithList(@"WITH deleted_item_ids AS (SELECT id FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")), deleted_hostnames_with_counts AS (SELECT safari_hostname(url) AS deleted_hostname, COUNT(*) AS deleted_hostname_count FROM history_items WHERE id IN (SELECT id FROM deleted_item_ids) GROUP BY deleted_hostname) SELECT safari_hostname(url) AS hostname FROM history_items WHERE hostname IN (SELECT deleted_hostname FROM deleted_hostnames_with_counts) GROUP BY hostname HAVING (COUNT(*) - (SELECT deleted_hostname_count FROM deleted_hostnames_with_counts WHERE deleted_hostname = safari_hostname(url))) <= 0");
    id v5 = [MEMORY[0x1E4F1CA48] array];
    database = self->_database;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__WBSHistoryServiceDatabase__collectDeletedHostnamesForPlan___block_invoke;
    v9[3] = &unk_1E5C8DB88;
    id v7 = v5;
    id v10 = v7;
    id v11 = (id)MEMORY[0x1AD0C4F80](v9);
    SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(NSString *)>(database, 0, v4, &v11);
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

uint64_t __61__WBSHistoryServiceDatabase__collectDeletedHostnamesForPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_executePlan:(void *)a3 outDeletedItemCount:(unint64_t *)a4 outDeletedVisitCount:(unint64_t *)a5 clearAllSpotlightHistoryForProfile:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = (char *)a3 + 160;
  if (*((void *)a3 + 23))
  {
    id v12 = createQueryWithList(@"WITH view_visit_count_adjustments AS(SELECT history_item AS id, COUNT(*) AS count, TOTAL(score) AS total_score FROM history_visits WHERE history_visits.id IN ("), (uint64_t)v11, CFSTR(") GROUP BY history_item) UPDATE history_items SET visit_count = MAX(1, visit_count - (SELECT view_visit_count_adjustments.count FROM view_visit_count_adjustments WHERE view_visit_count_adjustments.id = history_items.id)), visit_count_score = MAX(0, visit_count_score - (SELECT view_visit_count_adjustments.total_score FROM view_visit_count_adjustments WHERE view_visit_count_adjustments.id = history_items.id)), should_recompute_derived_visit_counts = 1 WHERE history_items.id IN (SELECT view_visit_count_adjustments.id FROM view_visit_count_adjustments)");
    database = self->_database;
    id v43 = 0;
    int v14 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, &v43, v12);
    id v15 = v43;
    if (v14 && v14 != 101)
    {

      goto LABEL_30;
    }
    id v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
      *(_DWORD *)uint8_t buf = 67109120;
      LODWORD(v45) = v17;
      _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_INFO, "Updated %i visit scores", buf, 8u);
    }
  }
  if (*((void *)a3 + 8))
  {
    uint64_t v18 = [(WBSHistoryServiceDatabase *)self _collectDeletedURLsForPlan:a3];
    id v19 = (void *)*((void *)a3 + 25);
    *((void *)a3 + 25) = v18;

    uint64_t v20 = [(WBSHistoryServiceDatabase *)self _collectDeletedHostnamesForPlan:a3];
    uint64_t v21 = (void *)*((void *)a3 + 27);
    *((void *)a3 + 27) = v20;

    uint64_t v22 = [(WBSHistoryServiceDatabase *)self _collectDeletedHighLevelDomainsForPlan:a3];
    id v23 = (void *)*((void *)a3 + 26);
    *((void *)a3 + 26) = v22;

    id v24 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *((void *)a3 + 8);
      *(_DWORD *)uint8_t buf = 134217984;
      uint64_t v45 = v25;
      _os_log_impl(&dword_1A6B5F000, v24, OS_LOG_TYPE_INFO, "Deleting %zu items", buf, 0xCu);
    }
    uint64_t v26 = self->_database;
    id v42 = 0;
    uint64_t v27 = createQueryWithList(@"DELETE FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")");
    int v28 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v26, &v42, v27);
    id v15 = v42;

    if (v28 && v28 != 101) {
      goto LABEL_30;
    }
    if (v6)
    {
      id v29 = +[WBSSiriIntelligenceDonor sharedInstance];
      [v29 removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:self->_databaseID];
    }
    else
    {
      [(WBSHistoryServiceDatabase *)self _removeSpotlightDonationsForItemURLs:*((void *)a3 + 25)];
    }
    if (a4) {
      *a4 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
    }
    SafariShared::LatestVisitInformationMap::removeItems((uint64_t *)&self->_latestVisitMap, (uint64_t)a3 + 40);
    urlCompletion = self->_urlCompletion;
    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    id v32 = *((id *)a3 + 25);
    long long v33 = [v32 allKeys];
    long long v34 = [v31 setWithArray:v33];
    [(WBSHistoryServiceURLCompletion *)urlCompletion removeURLStrings:v34];
  }
  if (!*((void *)a3 + 23))
  {
LABEL_27:
    if (*((void *)a3 + 13))
    {
      [(WBSHistoryServiceDatabase *)self _recomputeLatestVisitsForItems:(char *)a3 + 80 error:0];
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__move_assign((uint64_t)a3 + 120, (uint64_t *)buf);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
    }
    id v15 = 0;
    goto LABEL_30;
  }
  long long v35 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = *((void *)a3 + 23);
    *(_DWORD *)uint8_t buf = 134217984;
    uint64_t v45 = v36;
    _os_log_impl(&dword_1A6B5F000, v35, OS_LOG_TYPE_INFO, "Deleting %zu visits", buf, 0xCu);
  }
  id v37 = self->_database;
  id v41 = 0;
  id v38 = createQueryWithList(@"DELETE FROM history_visits WHERE id IN ("), (uint64_t)v11, CFSTR(")");
  int v39 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v37, &v41, v38);
  id v15 = v41;

  if (!v39 || v39 == 101)
  {
    if (a5) {
      *a5 = [(WBSSQLiteDatabase *)self->_database changedRowCount];
    }

    goto LABEL_27;
  }
LABEL_30:
  return v15;
}

- (void)_removeSpotlightDonationsForItemURLs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if (![(WBSHistoryServiceDatabase *)self _isTesting])
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_databaseID;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v15;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v10) {
            BOOL v11 = v5 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (v11)
          {
            id v12 = WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint8_t buf = 0;
              _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "URL or Profile ID were malformed when clearing spotlight donation for history items.", buf, 2u);
            }
          }
          else
          {
            int v13 = +[WBSSiriIntelligenceDonor historyItemIdentifierForURL:v10 profileIdentifier:v5];
            [v4 addObject:v13];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      int v14 = +[WBSSiriIntelligenceDonor sharedInstance];
      [v14 removeCoreSpotlightDataWithIDs:v4 completionHandler:0];
    }
  }
}

- (void)performMaintenanceWithAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 134218240;
    double v17 = a3;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Starting maintenance. Age Limit is %f. Item Count Limit is %zu", buf, 0x16u);
  }
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _OWORD v12[2] = __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke;
  v12[3] = &unk_1E5C9CC18;
  v12[4] = self;
  id v13 = v8;
  double v14 = a3;
  unint64_t v15 = a4;
  id v11 = v8;
  dispatch_async(queue, v12);
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[WBSScopeTimeoutHandler alloc] initWithTimeout:@"SafariShared" autoBugCaptureDomain:@"com.apple.Safari.History" detectedProcess:@"Maintenance" context:30.0];
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  memset(v44, 0, sizeof(v44));
  int v45 = 1065353216;
  memset(v46, 0, sizeof(v46));
  int v47 = 1065353216;
  memset(v48, 0, sizeof(v48));
  memset(v50, 0, sizeof(v50));
  int v49 = 1065353216;
  int v51 = 1065353216;
  long long v52 = 0u;
  long long v53 = 0u;
  int v54 = 1065353216;
  id v55 = 0;
  id v56 = 0;
  id v57 = 0;
  id v3 = [*(id *)(a1 + 32) _expireOldVisits:86400.0 * (double)0x31uLL + 86400.0 * (double)0x31uLL];
  if (!v3)
  {
    memset(v66, 0, sizeof(v66));
    int v67 = 1065353216;
    id v6 = [*(id *)(a1 + 32) _recomputeVisitScores:v66];
    if (v6)
    {
      uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_4();
      }

      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      MEMORY[0x1AD0C5620](v8);

      goto LABEL_30;
    }
    memset(v64, 0, sizeof(v64));
    int v65 = 1065353216;
    int v9 = [*(id *)(a1 + 32) _recomputeItemScores:v64];
    if (v9)
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_3();
      }
    }
    else
    {
      int v9 = [*(id *)(a1 + 32) _preparePlan:v44 ageLimit:*(void *)(a1 + 56) itemCountLimit:*(double *)(a1 + 48)];
      if (!v9)
      {
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        id v12 = [*(id *)(a1 + 32) _executePlan:v44 outDeletedItemCount:&v43 outDeletedVisitCount:&v42 clearAllSpotlightHistoryForProfile:0];
        if (v12)
        {
          id v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            [(WBSHistoryServiceEvent *)v12 safari_privacyPreservingDescription];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:]();
          }

          uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
          MEMORY[0x1AD0C5620](v14);
        }
        else
        {
          unint64_t v15 = 0x1E4F1C000uLL;
          if ([v55 count])
          {
            id v16 = [WBSHistoryServiceEvent alloc];
            uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
            v62[0] = @"disposedURLs";
            id v38 = v55;
            id v37 = (void *)[v38 copy];
            v63[0] = v37;
            v62[1] = @"disposedHighLevelDomains";
            id v17 = v56;
            __int16 v18 = (void *)[v17 copy];
            v63[1] = v18;
            v62[2] = @"disposedHostnames";
            id v19 = v57;
            uint64_t v20 = (void *)[v19 copy];
            v63[2] = v20;
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
            uint64_t v22 = [(WBSHistoryServiceEvent *)v16 initWithType:@"maintenance" time:v40 value:v21];

            [*(id *)(a1 + 32) _dispatchEvent:v22 listenersToIgnore:0 persistForDelayedDispatching:1 completionHandler:0];
            unint64_t v15 = 0x1E4F1C000;
          }
          if (*((void *)&v53 + 1))
          {
            id v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
            for (uint64_t i = (void *)v53; i; uint64_t i = (void *)*i)
            {
              uint64_t v25 = [NSNumber numberWithLongLong:i[2]];
              [v23 addObject:v25];
            }
            uint64_t v26 = [WBSHistoryServiceEvent alloc];
            id v41 = [MEMORY[0x1E4F1C9C8] date];
            v60[0] = @"disposedVisits";
            v61[0] = [v23 copy];
            v60[1] = @"updateLatestVisits";
            int v39 = (void *)v61[0];
            uint64_t v27 = [*(id *)(a1 + 32) _generateUpdatedLastVisit:v50];
            v61[1] = v27;
            v60[2] = @"updateItems";
            int v28 = [*(id *)(a1 + 32) _generateItemsDictionary:v50];
            v61[2] = v28;
            v60[3] = @"updateVisits";
            id v29 = [*(id *)(a1 + 32) _generateVisitsDictionary:v50];
            v61[3] = v29;
            id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:4];
            uint64_t v31 = [(WBSHistoryServiceEvent *)v26 initWithType:@"maintenance" time:v41 value:v30];

            [*(id *)(a1 + 32) _dispatchEvent:v31 listenersToIgnore:0 persistForDelayedDispatching:0 completionHandler:0];
            unint64_t v15 = 0x1E4F1C000uLL;
          }
          id v32 = [WBSHistoryServiceEvent alloc];
          long long v33 = [*(id *)(v15 + 2504) date];
          long long v58 = @"endDate";
          long long v34 = [*(id *)(v15 + 2504) dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 48)];
          id v59 = v34;
          long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v12 = [(WBSHistoryServiceEvent *)v32 initWithType:@"clear" time:v33 value:v35];

          [*(id *)(a1 + 32) _dispatchEvent:v12 listenersToIgnore:0 persistForDelayedDispatching:0 completionHandler:0];
          uint64_t v36 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
          MEMORY[0x1AD0C5620](v36);
        }

        goto LABEL_29;
      }
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:]();
      }
    }

    uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    MEMORY[0x1AD0C5620](v11);

LABEL_29:
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v64);
LABEL_30:
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v66);
    goto LABEL_31;
  }
  unint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_5();
  }

  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  MEMORY[0x1AD0C5620](v5);

LABEL_31:
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v52);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v50);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v48);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v46);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v44);
}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __64__WBSHistoryServiceDatabase_vacuumHistoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__WBSHistoryServiceDatabase_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v5 = 0;
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, &v5, @"VACUUM");
  id v3 = v5;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  MEMORY[0x1AD0C5620](v4);
}

- (void)checkIfLocalVisitExistsForDatabaseIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSHistoryServiceDatabase_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __82__WBSHistoryServiceDatabase_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = NSString;
  uint64_t v4 = [*(id *)(a1 + 40) componentsJoinedByString:@","];
  id v5 = [v3 stringWithFormat:@"SELECT origin FROM history_visits WHERE history_item IN (%@) AND origin = ? LIMIT 1", v4];
  uint64_t v9 = 0;
  id v6 = SafariShared::WBSSQLiteDatabaseFetch<WBSHistoryVisitOrigin>(v2, v5, &v9);

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [v6 allObjects];
  (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, [v8 count] != 0);
}

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C060;
  BOOL v21 = a5;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    id v16 = 0;
    uint64_t v4 = [NSString stringWithFormat:@"%@ AND origin = ? %@", @"SELECT safari_high_level_domain(url) AS high_level_domain FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time > ? AND visit_time < ? AND high_level_domain IS NOT NULL AND (url LIKE 'http://%' OR url LIKE 'https://%')", @" GROUP BY high_level_domain"];
    int v15 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _OWORD v12[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5C8DB88;
    id v13 = v2;
    uint64_t v14 = MEMORY[0x1AD0C4F80](v12);
    SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,NSDate * const {__strong},int,void({block_pointer} {__strong})(NSString *)>(v3, (uint64_t)&v16, v4, (id *)(a1 + 40), (id *)(a1 + 48), &v15, &v14);
    id v5 = &v13;
    id v6 = v16;
    uint64_t v7 = (void *)v14;
  }
  else
  {
    id v11 = 0;
    uint64_t v4 = [@"SELECT safari_high_level_domain(url) AS high_level_domain FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time > ? AND visit_time < ? AND high_level_domain IS NOT NULL AND (url LIKE 'http://%' OR url LIKE 'https://%')" stringByAppendingString:@" GROUP BY high_level_domain"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _OWORD v8[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5C8DB88;
    id v9 = v2;
    uint64_t v10 = MEMORY[0x1AD0C4F80](v8);
    SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,NSDate * const {__strong},void({block_pointer} {__strong})(NSString *)>(v3, (uint64_t)&v11, v4, (id *)(a1 + 40), (id *)(a1 + 48), &v10);
    id v5 = &v9;
    id v6 = v11;
    uint64_t v7 = (void *)v10;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryServiceDatabase_getItemCountBeforeDate_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __70__WBSHistoryServiceDatabase_getItemCountBeforeDate_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  id v5 = 0;
  uint64_t v6 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = (id *)&v6;
  SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,std::tuple<long long &>>(v2, (uint64_t)&v5, @"SELECT COUNT(history_items.id) FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time < ? AND history_visits.id = safari_latest_visit_for (history_item);",
    (id *)(a1 + 40),
    &v4);
  id v3 = v5;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 writeHandle:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    dispatch_group_t v15 = dispatch_group_create();
    dispatch_queue_t v16 = dispatch_queue_create("WBSHistoryServiceDatabase.encodeQueue", 0);
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x4812000000;
    v28[3] = __Block_byref_object_copy__370;
    v28[4] = __Block_byref_object_dispose__371;
    void v28[5] = &unk_1A6DD304D;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v29, [v13 fileDescriptor]);
    urlCompletion = self->_urlCompletion;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    _OWORD v24[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke;
    v24[3] = &unk_1E5C9CC88;
    id v18 = v15;
    uint64_t v25 = v18;
    id v19 = v16;
    uint64_t v26 = v19;
    uint64_t v27 = v28;
    [(WBSHistoryServiceURLCompletion *)urlCompletion searchForUserTypedString:v12 options:a4 currentTime:v18 enumerationGroup:v24 enumerationBlock:a5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_3;
    block[3] = &unk_1E5C8C9F8;
    id v22 = v13;
    id v23 = v14;
    dispatch_group_notify(v18, v19, block);

    _Block_object_dispose(v28, 8);
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v29);
  }
  else
  {
    [v13 closeFile];
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v20);
  }
}

void __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5C8E1B8;
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  dispatch_group_async(v4, v5, v8);
}

BOOL __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "entries", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), (const _HistoryStreamedMatchEntry *)[*(id *)(*((void *)&v7 + 1) + 8 * v5++) streamData]);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), (const _HistoryStreamedMatchData *)[*(id *)(a1 + 32) streamData]);
}

uint64_t __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
}

- (id)_fetchListenerNamesFromDatabase:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"SELECT listener_name FROM history_event_listeners" error:a3];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _OWORD v20[2] = __61__WBSHistoryServiceDatabase__fetchListenerNamesFromDatabase___block_invoke;
    v20[3] = &unk_1E5C8CA70;
    id v7 = v5;
    id v21 = v7;
    [v6 setHandler:v20];
    long long v8 = [v7 fetch];
    if (v8)
    {
      long long v9 = [MEMORY[0x1E4F1CA80] set];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stringAtIndex:", 0, (void)v16);
            [v9 addObject:v14];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v11);
      }
    }
    else if (a3)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchListenerNamesFromDatabase:]");
      long long v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v9 = 0;
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

uint64_t __61__WBSHistoryServiceDatabase__fetchListenerNamesFromDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (id)_markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] && objc_msgSend(v5, "length"))
  {
    id v7 = NSString;
    id v42 = v6;
    long long v8 = [v6 commaSeparatedValues];
    uint64_t v9 = [v7 stringWithFormat:@"SELECT id, pending_listeners FROM history_events WHERE id IN (%@)", v8];

    id v41 = (void *)v9;
    uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:v9];
    if (v43)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __70__WBSHistoryServiceDatabase__markEventsAsReceivedByListener_eventIDs___block_invoke;
      v54[3] = &unk_1E5C8CA70;
      id v11 = v43;
      id v55 = v11;
      int v39 = v10;
      [v10 setHandler:v54];
      uint64_t v12 = [v11 fetch];
      uint64_t v40 = v12;
      if (v12)
      {
        memset(buf, 0, sizeof(buf));
        int v61 = 1065353216;
        long long v51 = 0u;
        long long v52 = 0u;
        int v53 = 1065353216;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v48 != v15) {
                objc_enumerationMutation(v13);
              }
              long long v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v56[0] = 0;
              v56[0] = [v17 int64AtIndex:0];
              id v18 = [v17 stringAtIndex:1];
              unint64_t v19 = [v18 length];
              id v20 = (void *)MEMORY[0x1E4F1CAD0];
              if (v19 > 1)
              {
                id v22 = objc_msgSend(v18, "substringWithRange:", 1, objc_msgSend(v18, "length") - 2);
                uint64_t v23 = [v22 componentsSeparatedByString:@":"];
                id v21 = [v20 setWithArray:v23];
              }
              else
              {
                id v21 = [MEMORY[0x1E4F1CAD0] set];
              }

              if ([v21 containsObject:v5])
              {
                id v24 = (void *)[v21 mutableCopy];
                [v24 removeObject:v5];
                if ([v24 count])
                {
                  uint64_t v25 = eventListenerSetToString(v24);
                  unint64_t v57 = v56[0];
                  id v58 = v25;
                  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>((uint64_t)&v51, &v57, (uint64_t *)&v57);
                }
                else
                {
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)buf, v56, v56);
                }
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v59 count:16];
          }
          while (v14);
        }

        if (*(void *)&buf[24]
          && (uint64_t v26 = self->_database,
              id v46 = 0,
              createQueryWithList(@"DELETE FROM history_events WHERE id IN ("), (uint64_t)buf, CFSTR(")"),
              uint64_t v27 = objc_claimAutoreleasedReturnValue(),
              SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v26, &v46, v27),
              id v28 = v46,
              v27,
              v28))
        {
          id v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]();
          }
        }
        else if (*((void *)&v52 + 1) && (uint64_t v31 = (void *)v52) != 0)
        {
          while (1)
          {
            id v32 = (void *)v31[3];
            unint64_t v57 = v31[2];
            id v58 = v32;
            database = self->_database;
            id v45 = 0;
            SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long const&>(database, &v45, @"UPDATE history_events SET pending_listeners = ? WHERE id = ?", &v58, &v57);
            id v34 = v45;
            if (v34) {
              break;
            }

            uint64_t v31 = (void *)*v31;
            if (!v31) {
              goto LABEL_33;
            }
          }
          id v28 = v34;
          uint64_t v36 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]();
          }
        }
        else
        {
LABEL_33:
          id v28 = 0;
        }
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v51);
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
      }
      else
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
        id v28 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v30 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v37 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
        id v38 = objc_msgSend(v37, "safari_privacyPreservingDescription");
        *(_DWORD *)uint8_t buf = 138412546;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&unsigned char buf[14] = v38;
        _os_log_error_impl(&dword_1A6B5F000, v30, OS_LOG_TYPE_ERROR, "Failed to bless events %@: %{public}@", buf, 0x16u);
      }
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v6 = v42;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

uint64_t __70__WBSHistoryServiceDatabase__markEventsAsReceivedByListener_eventIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (v8)
  {
    dispatch_queue_t queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _OWORD v14[2] = __87__WBSHistoryServiceDatabase_markEventsAsReceivedByListener_eventIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5C9C910;
    id v17 = v10;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(queue, v14);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

void __87__WBSHistoryServiceDatabase_markEventsAsReceivedByListener_eventIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  id v2 = [*(id *)(a1 + 32) _markEventsAsReceivedByListener:*(void *)(a1 + 40) eventIDs:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (int64_t)_writeEventToDatabase:(id)a3 listeners:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  crypto = self->_crypto;
  id v11 = [v8 value];
  id v24 = [(WBSHistoryCrypto *)crypto encryptDictionary:v11];

  if (v24)
  {
    uint64_t v12 = [(WBSSQLiteStatementCache *)self->_statements statementForQuery:@"INSERT INTO history_events (event_type, event_time, pending_listeners, value) VALUES (?, ?, ?, ?)" error:a5];
    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67__WBSHistoryServiceDatabase__writeEventToDatabase_listeners_error___block_invoke;
      v22[3] = &unk_1E5C8CA70;
      id v14 = v12;
      id v23 = v14;
      [v13 setHandler:v22];
      id v21 = [v8 eventType];
      id v15 = [v8 time];
      [v15 timeIntervalSinceReferenceDate];
      uint64_t v20 = v16;
      eventListenerSetToString(v9);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,NSString * {__strong},NSData * {__strong}&>(v14, &v21, (double *)&v20, &v19, &v24);

      if ([v14 execute] == 101)
      {
        int64_t v17 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
      }
      else
      {
        if (a5)
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _writeEventToDatabase:listeners:error:]");
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        int64_t v17 = -1;
      }
    }
    else
    {
      int64_t v17 = -1;
    }
  }
  else
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:2 userInfo:0];
    }
    int64_t v17 = -1;
  }

  return v17;
}

uint64_t __67__WBSHistoryServiceDatabase__writeEventToDatabase_listeners_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)_dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v9 = a4;
  id v28 = a6;
  if (!self->_registeredListeners)
  {
    id v10 = [(WBSHistoryServiceDatabase *)self _fetchListenerNamesFromDatabase:0];
    registeredListeners = self->_registeredListeners;
    self->_registeredListeners = v10;
  }
  MEMORY[0x1AD0C5610]();
  id v32 = (void *)[(NSMutableSet *)self->_registeredListeners mutableCopy];
  id v30 = dispatch_group_create();
  dispatch_queue_t v31 = dispatch_queue_create("WBSHistoryServiceDatabase.dispatchEvent", 0);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v12 = [(NSMapTable *)self->_listeners keyEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [(NSMapTable *)self->_listeners objectForKey:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        if ([v9 containsObject:v16]) {
          [v32 removeObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v13);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  int64_t v17 = [(NSMapTable *)self->_delegates keyEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        id v22 = [(NSMapTable *)self->_listeners objectForKey:v21];
        id v23 = [(NSMapTable *)self->_delegates objectForKey:v21];
        if (v23 && ([v9 containsObject:v22] & 1) == 0)
        {
          dispatch_group_enter(v30);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke;
          v39[3] = &unk_1E5C9CCB0;
          uint64_t v40 = v31;
          id v41 = v22;
          id v42 = v32;
          uint64_t v43 = v30;
          [v23 handleEvent:v29 completionHandler:v39];
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v18);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_3;
  block[3] = &unk_1E5C9CCD8;
  BOOL v38 = a5;
  id v34 = v32;
  long long v35 = self;
  id v36 = v29;
  id v37 = v28;
  id v24 = v29;
  id v25 = v28;
  id v26 = v32;
  dispatch_group_notify(v30, v31, block);
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C9B5C8;
  id v7 = v3;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 48), "removeObject:");
  }
  id v2 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v2);
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_3(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count] || !*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
    }
    JUMPOUT(0x1AD0C5620);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(NSObject **)(v2 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4;
  v5[3] = &unk_1E5C9B058;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(v3, v5);
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4(void *a1)
{
  void v8[4] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  v8[0] = 0;
  [v2 _writeEventToDatabase:v3 listeners:v4 error:v8];
  id v5 = v8[0];
  uint64_t v6 = a1[7];
  if (v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 1, v5);
  }
  else if (v5)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4_cold_1();
    }
  }
  MEMORY[0x1AD0C5620](v6);
}

- (void)dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    dispatch_queue_t queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__WBSHistoryServiceDatabase_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke;
    block[3] = &unk_1E5C9C060;
    void block[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v19 = a5;
    id v18 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
  }
}

uint64_t __108__WBSHistoryServiceDatabase_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchEvent:*(void *)(a1 + 40) listenersToIgnore:*(void *)(a1 + 48) persistForDelayedDispatching:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (id)_dateForMetadataKey:(id)a3 error:(id *)a4
{
  void v15[4] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15[0] = 0;
  id v7 = [(WBSHistoryServiceDatabase *)self _metadataForKey:v6 error:v15];
  id v8 = v15[0];
  id v9 = v8;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 doubleValue];
      id v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_13;
    }
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryServiceDatabase _dateForMetadataKey:error:]((uint64_t)v6, v13);
    }
    [(WBSHistoryServiceDatabase *)self _clearWBSHistorySQLiteStoreClearHistoryKeys];
  }
  else if (v8)
  {
    id v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _dateForMetadataKey:error:]();
    }

    if (a4)
    {
      id v11 = 0;
      *a4 = v9;
      goto LABEL_13;
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (void)_startingClearHistoryOperationForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSHistoryServiceDatabase *)self _setMetadataValue:v6 forKey:@"clear_history_start_date"];
  if (v8)
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:].cold.4();
    }

    [(WBSHistoryServiceDatabase *)self _clearWBSHistorySQLiteStoreClearHistoryKeys];
  }
  else
  {
    id v10 = [(WBSHistoryServiceDatabase *)self _setMetadataValue:v7 forKey:@"clear_history_end_date"];
    if (v10)
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:]();
      }

      id v8 = v10;
      [(WBSHistoryServiceDatabase *)self _clearWBSHistorySQLiteStoreClearHistoryKeys];
    }
    else
    {
      if (self->_clearHistoryInProgressFileURL)
      {
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v13 = [(NSURL *)self->_clearHistoryInProgressFileURL URLByDeletingLastPathComponent];
        uint64_t v14 = objc_msgSend(v12, "safari_ensureDirectoryExists:", v13);

        if (v14)
        {
          id v15 = [(NSURL *)self->_clearHistoryInProgressFileURL path];
          char v16 = [v12 createFileAtPath:v15 contents:0 attributes:0];

          if ((v16 & 1) == 0)
          {
            id v17 = WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:]();
            }
          }
        }
        else
        {
          id v18 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:]();
          }
        }
      }
      id v8 = 0;
    }
  }
}

- (void)_finishedClearingHistory
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to remove file at _clearHistoryInProgressFileURL: %{public}@", v5);
}

- (void)_clearWBSHistorySQLiteStoreClearHistoryKeys
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to clear WBSHistorySQLiteStoreClearHistoryStartDateKey: %{public}@", v5);
}

- (void)visitIdentifiersMatchingExistingVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT COUNT(*) FROM history_items INNER JOIN history_visits ON history_items.id = history_visits.history_item WHERE url = ? AND CAST((visit_time * %1$ld) AS INT) = CAST((? * %1$ld) AS INT)", a4);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = @"SELECT COUNT(*) FROM history_items INNER JOIN history_visits ON history_items.id = history_visits.history_item WHERE url = ? AND visit_time = ?";
  }
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke;
  block[3] = &unk_1E5C9CD00;
  void block[4] = self;
  char v16 = v10;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a4;
  id v12 = v8;
  id v13 = v9;
  uint64_t v14 = v10;
  dispatch_async(queue, block);
}

void __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v28 = 0;
  os_log_t v4 = [v3 statementForQuery:v2 error:&v28];
  id v5 = v28;
  if (!v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_24;
  }
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v7) {
    goto LABEL_22;
  }
  uint64_t v8 = *(void *)v25;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      id v22 = v5;
      uint64_t v23 = 0;
      id v21 = [v10 urlString];
      [v10 visitTime];
      *(void *)uint8_t buf = v11;
      unint64_t v19 = &v23;
      char v12 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},double,std::tuple<long long &>>(v4, (uint64_t)&v22, &v21, (id *)buf, (id *)&v19);
      id v13 = v22;

      id v5 = v13;
      if ((v12 & 1) == 0)
      {
        uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke_cold_1();
        }
      }
      uint64_t v15 = v23;
      if (*(void *)(a1 + 64))
      {
        char v16 = v6;
        if (!v23) {
          goto LABEL_20;
        }
LABEL_19:
        [v16 addObject:v10];
        goto LABEL_20;
      }
      char v16 = v6;
      if (v23 >= 2)
      {
        id v17 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl(&dword_1A6B5F000, v17, OS_LOG_TYPE_INFO, "Unexpected duplicate visit in database", buf, 2u);
        }
        uint64_t v15 = v23;
      }
      if (v15) {
        goto LABEL_19;
      }
LABEL_20:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  }
  while (v7);
LABEL_22:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_24:
}

- (void)resetCloudHistoryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __72__WBSHistoryServiceDatabase_resetCloudHistoryDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __72__WBSHistoryServiceDatabase_resetCloudHistoryDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentGeneration];
  id v3 = (id)[*(id *)(a1 + 32) _setMetadataValue:0 forKey:@"server_change_token"];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithLongLong:v2];
  id v6 = (id)[v4 _setMetadataValue:v5 forKey:@"last_synced_generation"];

  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithLongLong:v2 + 1];
  id v9 = (id)[v7 _setMetadataValue:v8 forKey:@"current_generation"];

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v19 = 0;
  [v10 _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:v11 error:&v19];
  id v12 = v19;

  id v13 = (id)[*(id *)(a1 + 32) _setMetadataValue:0 forKey:@"push_throttler_data"];
  id v14 = (id)[*(id *)(a1 + 32) _setMetadataValue:0 forKey:@"fetch_throttler_data"];
  id v15 = (id)[*(id *)(a1 + 32) _setMetadataValue:0 forKey:@"sync_circle_size_retrieval_throttler_data"];
  id v16 = (id)[*(id *)(a1 + 32) _setMetadataValue:&unk_1EFC227F8 forKey:@"cached_sync_circle_size"];
  id v17 = (id)[*(id *)(a1 + 32) _setMetadataValue:MEMORY[0x1E4F1CC28] forKey:@"push_notifications_initialized"];
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  MEMORY[0x1AD0C5620](v18);
}

- (void)startImportHistorySessionWithVisitTimePrecision:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, WBSHistoryServiceImporter *, void))a4;
  id v6 = [[WBSHistoryServiceImporter alloc] initWithDatabase:self visitTimePrecision:a3];
  v7[2](v7, v6, 0);
}

- (void)importVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[v8 copy];

  uint64_t v11 = objc_msgSend(v10, "safari_setByApplyingBlock:", &__block_literal_global_407);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__WBSHistoryServiceDatabase_importVisits_desiredVisitTimePrecision_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5C9CD48;
  id v12 = v9;
  id v19 = v12;
  id v16 = v11;
  id v13 = v10;
  id v17 = v13;
  uint64_t v18 = self;
  id v14 = v11;
  [(WBSHistoryServiceDatabase *)self visitIdentifiersMatchingExistingVisits:v14 desiredVisitTimePrecision:a4 completionHandler:v15];
}

id __86__WBSHistoryServiceDatabase_importVisits_desiredVisitTimePrecision_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 visitIdentifier];
  return v2;
}

void __86__WBSHistoryServiceDatabase_importVisits_desiredVisitTimePrecision_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v23 = a3;
  if (v23)
  {
    uint64_t v5 = a1;
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __86__WBSHistoryServiceDatabase_importVisits_desiredVisitTimePrecision_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(v5 + 56) + 16))();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    if (v7 == [v27 count])
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping import: All visits were found in the database", buf, 2u);
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = *(id *)(a1 + 40);
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v26 = a1;
      if (v9)
      {
        uint64_t v25 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v12 = [v11 visitIdentifier];
            char v13 = [v27 containsObject:v12];

            if ((v13 & 1) == 0)
            {
              float v14 = WBHistoryVisitWeightForAttributesAndOrigin([v11 attributes], objc_msgSend(v11, "origin"));
              int v15 = WBSHistoryVisitScoreForWeightedVisitCount(v14);
              id v16 = *(void **)(*(void *)(v26 + 48) + 272);
              id v17 = [v11 visitIdentifier];
              uint64_t v18 = [v11 sourceVisitIdentifier];
              id v19 = [v11 title];
              uint64_t v20 = [v11 loadSuccessful];
              uint64_t v21 = [v11 origin];
              LODWORD(v22) = v15 * [v11 visitCount];
              [v16 recordVisit:v17 sourceVisit:v18 title:v19 loadSuccessful:v20 origin:v21 increaseVisitCount:1 score:v22 statusCode:0];

              [*(id *)(*(void *)(v26 + 48) + 216) addObject:v11];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v9);
      }

      a1 = v26;
      [*(id *)(v26 + 48) _commitPendingUpdates];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)exportHistory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9CD98;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v13);
  _os_activity_initiate(&dword_1A6B5F000, "Export History", OS_ACTIVITY_FLAG_DETACHED, v12);
}

void __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C9CD98;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_2(uint64_t a1)
{
  void v9[4] = *(id *)MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v9[0] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5C9CD70;
  id v7 = *(id *)(a1 + 40);
  id v8 = (id)MEMORY[0x1AD0C4F80](v6);
  char v3 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(NSString *,double,NSString *,int,int,NSString *,double,NSString *,double,long long)>(v2, (uint64_t)v9, @"WITH view_visits_identifiers(id, url, visit_time) AS(SELECT history_visits.id, url, visit_time FROM history_visits, history_items WHERE  history_items.id = history_visits.history_item) SELECT history_items.url, history_visits.visit_time, history_visits.title, load_successful, http_non_get, rs.url, rs.visit_time, rd.url, rd.visit_time, visit_count FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item LEFT JOIN view_visits_identifiers rs ON history_visits.redirect_source = rs.id LEFT JOIN view_visits_identifiers rd ON history_visits.redirect_destination = rd.id WHERE history_visits.id = safari_latest_visit_for (history_visits.history_item)", &v8);
  id v4 = v9[0];

  if ((v3 & 1) == 0)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_2_cold_1();
    }
  }
  [*(id *)(a1 + 40) finishWithCompletionHandler:*(void *)(a1 + 56)];
}

uint64_t __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntryWithURLString:visitTime:title:loadSuccessful:httpGet:redirectSourceURLString:redirectSourceVisitTime:redirectDestinationURLString:redirectDestinationVisitTime:visitCount:", a2, a3, a4 != 0, a5 == 0, a6, a7, a8);
}

- (void)visitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke;
  block[3] = &unk_1E5C9B0A8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _ensureDatabaseIsSynced];
  uint64_t v2 = [*(id *)(a1 + 32) _currentGeneration];
  sqlite3_int64 v38 = [*(id *)(a1 + 32) _lastSyncedGeneration];
  char v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithLongLong:v2 + 1];
  id v5 = (id)[v3 _setMetadataValue:v4 forKey:@"current_generation"];

  id v6 = *(void **)(*(void *)(a1 + 32) + 56);
  id v37 = 0;
  id v27 = [v6 statementForQuery:@"WITH view_visits_queried(id) AS (SELECT id FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 UNION SELECT redirect_source FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 AND redirect_source IS NOT NULL UNION SELECT redirect_destination FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 AND redirect_destination IS NOT NULL),view_visits_identifiers(id, url, visit_time) AS(SELECT history_visits.id, url, visit_time FROM view_visits_queried, history_visits, history_items WHERE  history_visits.id = view_visits_queried.id AND history_items.id = history_visits.history_item AND history_items.status_code < 400) SELECT vs.url, vs.visit_time, title, load_successful, http_non_get, rs.url, rs.visit_time, rd.url, rd.visit_time FROM history_visits INNER JOIN view_visits_identifiers vs ON history_visits.id = vs.id LEFT JOIN view_visits_identifiers rs ON history_visits.redirect_source = rs.id LEFT JOIN view_visits_identifiers rd ON history_visits.redirect_destination = rd.id", &v37 error];
  id v7 = v37;
  if (v27)
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    id v36 = v7;
    v40[0] = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_420;
    v33[3] = &unk_1E5C9CDC0;
    id v25 = v8;
    id v34 = v25;
    id v35 = (id)MEMORY[0x1AD0C4F80](v33);
    char v9 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,int,double const&,void({block_pointer} {__strong})(NSString *,double,NSString *,int,int,NSString *,double,NSString *,double)>(v27, (uint64_t)&v36, &v38, v40, a1 + 48, &v35);
    id v10 = v36;

    if (v9)
    {
      double v11 = *(void **)(*(void *)(a1 + 32) + 56);
      id v32 = 0;
      uint64_t v26 = [v11 statementForQuery:@"SELECT * FROM history_tombstones WHERE generation > ?" error:&v32];
      id v7 = v32;

      if (v26)
      {
        dispatch_block_t v12 = [MEMORY[0x1E4F1CA80] set];
        [v26 bindInt64:v38 atParameterIndex:1];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        char v13 = [v26 fetch];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v29;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v29 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = [[WBSHistoryTombstone alloc] initWithSQLiteRow:*(void *)(*((void *)&v28 + 1) + 8 * v16) crypto:*(void *)(*(void *)(a1 + 32) + 32)];
              if (v17) {
                [v12 addObject:v17];
              }

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v39 count:16];
          }
          while (v14);
        }

        [v26 reset];
        uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        MEMORY[0x1AD0C5620](v18);
      }
      else
      {
        id v23 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_2();
        }

        uint64_t v24 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        MEMORY[0x1AD0C5620](v24);
      }
    }
    else
    {
      uint64_t v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_3();
      }

      uint64_t v22 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      MEMORY[0x1AD0C5620](v22);
      id v7 = v10;
    }
  }
  else
  {
    id v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_1();
    }

    uint64_t v20 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    MEMORY[0x1AD0C5620](v20);
  }
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_420(uint64_t a1, void *a2, void *a3, int a4, int a5, void *a6, void *a7, double a8, double a9, double a10)
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a6;
  id v22 = a7;
  id v23 = v22;
  if (v19)
  {
    uint64_t v30 = a1;
    if (v21)
    {
      uint64_t v24 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v21 visitTime:a9];
      if (v23)
      {
LABEL_4:
        id v25 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v23 visitTime:a10];
LABEL_9:
        id v27 = [WBSCloudHistoryVisit alloc];
        long long v28 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v19 visitTime:a8];
        long long v29 = [(WBSCloudHistoryVisit *)v27 initWithVisitIdentifier:v28 title:v20 loadSuccessful:a4 != 0 httpNonGet:a5 != 0 redirectSourceVisitIdentifier:v24 redirectDestinationVisitIdentifier:v25];

        if (v29) {
          [*(id *)(v30 + 32) addObject:v29];
        }

        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (v22) {
        goto LABEL_4;
      }
    }
    id v25 = 0;
    goto LABEL_9;
  }
  uint64_t v26 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_420_cold_1();
  }
LABEL_12:
}

- (void)updateDatabaseAfterSuccessfulSyncWithGeneration:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  MEMORY[0x1AD0C5610]();
  dispatch_queue_t queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke;
  block[3] = &unk_1E5C9B0A8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lastSyncedGeneration];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2 <= v3)
  {
    if (v2 != v3)
    {
      id v8 = *(void **)(a1 + 32);
      char v9 = objc_msgSend(NSNumber, "numberWithLongLong:");
      id v10 = (id)[v8 _setMetadataValue:v9 forKey:@"last_synced_generation"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    JUMPOUT(0x1AD0C5620);
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  return MEMORY[0x1AD0C5620]();
}

- (void)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  dispatch_queue_t queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  _OWORD v19[2] = __94__WBSHistoryServiceDatabase_createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke;
  v19[3] = &unk_1E5C9CDE8;
  v19[4] = self;
  id v20 = v12;
  unint64_t v23 = a5;
  int64_t v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

void __94__WBSHistoryServiceDatabase_createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 248);
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  id v9 = 0;
  id v7 = [v3 createTagsForIdentifiers:v2 withTitles:v4 type:v5 level:v6 error:&v9];
  id v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__WBSHistoryServiceDatabase_assignURLString_toTopicTagsWithIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9B058;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __82__WBSHistoryServiceDatabase_assignURLString_toTopicTagsWithIDs_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 248);
  uint64_t v4 = a1[6];
  id v6 = 0;
  [v3 assignURLString:v2 toTopicTagsWithIDs:v4 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)setTitle:(id)a3 ofTagWithID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__WBSHistoryServiceDatabase_setTitle_ofTagWithID_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9AFE0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __68__WBSHistoryServiceDatabase_setTitle_ofTagWithID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 248);
  uint64_t v4 = a1[7];
  id v6 = 0;
  [v3 renameTagWithID:v4 toTitle:v2 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)_isTesting
{
  if ([(NSString *)self->_databaseID hasPrefix:@"test"]) {
    return 1;
  }
  databaseID = self->_databaseID;
  return [(NSString *)databaseID hasPrefix:@"_test"];
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (WBSHistoryServiceURLCompletion)urlCompletion
{
  return self->_urlCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCompletion, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong(&self->_pendingVisitsTimeout, 0);
  objc_storeStrong((id *)&self->_clearHistoryInProgressFileURL, 0);
  objc_storeStrong((id *)&self->_pendingVisits, 0);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_visitForTemporaryID);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_temporaryIDToItem);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_latestVisitMap);
  objc_storeStrong((id *)&self->_registeredListeners, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_databaseOptions, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_storeStrong((id *)&self->_fileOperationGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithID:(double)a1 url:options:fileOperationGroup:error:.cold.1(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_acquiring_crypto", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.1(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_migrate_schema", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.2(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_create_methods", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.3(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_setting_pragmas", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to enable write-ahead logging on history SQLite store at %{private}@: %{public}@", v4, v5);
}

- (void)_prepareDatabase:(double)a1 .cold.5(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_checking_integrity", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.6()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed integrity check for History store at URL: %{private}@ with error: %{public}@", v4, v5);
}

- (void)_prepareDatabase:(double)a1 .cold.7(double a1)
{
  double v1 = OUTLINED_FUNCTION_13(a1);
  *uint64_t v2 = 136446466;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, (uint64_t)"database_opening", v1);
  OUTLINED_FUNCTION_1_1(&dword_1A6B5F000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.8()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to open History store database at URL: %{private}@ with error: %{public}@", v4, v5);
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to fall back to in-memory database: %{public}@", v5);
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to reopen database %@: %{public}@", v4, v5);
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "History database failed integrity check: %{public}@", v5);
}

- (void)_recomputeLatestVisitsForItems:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Latest visit were not computed", v2, v3, v4, v5, v6);
}

- (void)_recomputeLatestVisitsForItems:error:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to recompute latest visits: %{public}@", v6);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to run load redirection chain query: %{public}@", v6);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to reenable foreign keys: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to commit: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.4()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to correct redirect_destination: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.5()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to correct redirect_source: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.6()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete visits associated with invalid items: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.9()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to begin transaction: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.10()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to disable foreign keys: %s %{public}@ (%d)", v4, v5);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.11()
{
  OUTLINED_FUNCTION_18();
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_17(&dword_1A6B5F000, v1, v2, "Inconsistencies found in the history_visits table: %zi invalid items, %zi invalid visits", v3, v4);
}

- (void)_fetchVisitsWithOptions:(uint8_t *)buf predicate:(unsigned char *)a2 writeDescriptor:(os_log_t)log .cold.12(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Encountered write error while fetching redirect chains", buf, 2u);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.13()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Encountered write error while fetching items", v2, v3, v4, v5, v6);
}

- (void)_fetchVisitsWithOptions:(uint8_t *)buf predicate:(unsigned char *)a2 writeDescriptor:(os_log_t)log .cold.14(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_FAULT, "Invalid database content: NULL url in history_items", buf, 2u);
}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v4, v5, "Failed to prepare query for domain expansion: %{public}@", v6);
}

void __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to insert or update version information in history_client_versions table: %s %{public}@ (%d)", v4, v5);
}

- (void)fetchMetadataForKeys:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Querying metadata keys: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setMetadataValue:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Invalid object type: %{public}@", v5);
}

- (void)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to prune old tombstones: %s %{public}@ (%d)", v4, v5);
}

- (void)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Prune tombstones with end date prior to date: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to commit transaction: %s %{public}@ (%d)", v4, v5);
}

- (void)_convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to begin transaction: %s %{public}@ (%d)", v4, v5);
}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to replay tombstone: %{public}@", v5);
}

void __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to retrieve items ID for URLs: %{public}@", v5);
}

- (void)_commitPendingItems:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create update item statement: %{public}@", v5);
}

- (void)_commitPendingItems:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create insert item statement: %{public}@", v5);
}

- (void)_commitPendingItems:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 138543362;
  *int v3 = v2;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to insert item: %{public}@", v4, 0xCu);
}

- (void)_commitPendingVisits:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create find visit statement: %{public}@", v5);
}

- (void)_commitPendingVisits:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create insert visit statement: %{public}@", v5);
}

- (void)_commitPendingVisits:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create update title visit statement: %{public}@", v5);
}

- (void)_commitPendingVisits:.cold.4()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create update attributes visit statement: %{public}@", v5);
}

- (void)_commitPendingVisits:.cold.5()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create update visit's source statement: %{public}@", v5);
}

- (void)_commitPendingVisits:.cold.6()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_0(&dword_1A6B5F000, v3, v4, "Failed to create update visit's destination statement: %{public}@", v5);
}

void __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to dispatch update event: %{public}@", v5);
}

void __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to update item %lli with updated visit counts: %{public}@", v4, v5);
}

void __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to update item %lli to scheduler a visit counts recomputation: %{public}@", v4, v5);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete all items from the history_tags table: %s %{public}@ (%d)", v4, v5);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete all items from the history_items_to_tags table: %s %{public}@ (%d)", v4, v5);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete all items from the history_items table: %s %{public}@ (%d)", v4, v5);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete all visits from the history_visits table: %s %{public}@ (%d)", v4, v5);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to retrieve urls for history items that should be deleted from Spotlight.", v2, v3, v4, v5, v6);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to retrieve obsolete items to be removed from Spotlight.", v2, v3, v4, v5, v6);
}

void __107__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate_clearAllSpotlightHistoryForProfile___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to retrieve items from the history_visits table for all history that should be delted from Spotlight.", v2, v3, v4, v5, v6);
}

- (void)_generateItemsDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to create statement: %{public}@", v5);
}

void __123__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_clearAllSpotlightHistoryForProfile___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to insert tombstone: %s %{public}@ (%d)", v4, v5);
}

- (void)_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to prepare insert tombstone statement: %{public}@", v5);
}

- (void)_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to insert tombstone: %{public}@", v5);
}

- (void)_clearHistoryItems:afterDate:beforeDate:tombstoneMode:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to execute deletion plan: %{public}@", v5);
}

- (void)_clearHistoryItems:afterDate:beforeDate:tombstoneMode:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to prepare deletion plan: %{public}@", v5);
}

void __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "No history clearing operation to finish.", v2, v3, v4, v5, v6);
}

- (void)_expireOldVisits:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4_1(&dword_1A6B5F000, "Failed to delete all items from the history_items table: %s %{public}@ (%d)", v4, v5);
}

- (void)_recomputeVisitScores:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "No visit score was changed", v2, v3, v4, v5, v6);
}

- (void)_recomputeVisitScores:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update visit score: %{public}@", v5);
}

- (void)_recomputeVisitScores:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to determine which visit score should be recomputed: %{public}@", v5);
}

- (void)_recomputeItemScores:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "No item score was changed", v2, v3, v4, v5, v6);
}

- (void)_recomputeItemScores:.cold.2()
{
  OUTLINED_FUNCTION_18();
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_17(&dword_1A6B5F000, v0, v1, "Failed to modify rows when recomputing item scores despite finding %lu modified items. %ld history visits reference a modified item", v2, v3);
}

- (void)_recomputeItemScores:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to determine which item score should be recomputed: %{public}@", v5);
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to recompute item scores: %{public}@", v5);
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to recompute visit scores: %{public}@", v5);
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to expire old visits: %{public}@", v5);
}

- (void)_markEventsAsReceivedByListener:eventIDs:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to delete events: %{public}@", v5);
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to save event to database: %{public}@", v5);
}

- (void)_dateForMetadataKey:error:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to read metadata for %{public}@: %{public}@", v4, v5);
}

- (void)_dateForMetadataKey:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "The value of %{public}@ was an unexpected type", (uint8_t *)&v2, 0xCu);
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to create enclosing folder for _clearHistoryInProgressFileURL", v2, v3, v4, v5, v6);
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to create _clearHistoryInProgressFileURL", v2, v3, v4, v5, v6);
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to set WBSHistorySQLiteStoreClearHistoryEndDateKey: %{public}@", v5);
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.4()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to set WBSHistoryServiceEventClearStartDateKey: %{public}@", v5);
}

void __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  *uint64_t v1 = 138543362;
  *int v3 = v2;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to find existing visit: %{public}@", v4, 0xCu);
}

void __86__WBSHistoryServiceDatabase_importVisits_desiredVisitTimePrecision_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to match existing visits: %{public}@", v5);
}

void __61__WBSHistoryServiceDatabase_exportHistory_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to export history: %{public}@", v5);
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to prepare visits needing sync query: %{public}@", v5);
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to prepare tombstones needing sync query: %{public}@", v5);
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to execute visits needing sync query: %{public}@", v5);
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_420_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Visit's URL is nil", v2, v3, v4, v5, v6);
}

void __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Last synced generation is greater to generation argument", v2, v3, v4, v5, v6);
}

@end