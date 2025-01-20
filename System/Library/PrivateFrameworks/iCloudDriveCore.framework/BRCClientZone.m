@interface BRCClientZone
- (BOOL)_checkIfEnumeratorContainsNonDiscretionaryOp:(id)a3;
- (BOOL)_crossZoneMoveDocumentsToZone:(id)a3;
- (BOOL)_deleteRelevantPackageItemsWithDB:(id)a3 error:(id *)a4;
- (BOOL)_dumpItemsToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)_hasAllItemsDidUploadHandlers;
- (BOOL)_hasNonDiscretionaryServerStitchingOperation;
- (BOOL)_isIdle;
- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3;
- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3 isWaitingOnShareAccept:(BOOL)a4;
- (BOOL)_performHardResetOnClientItemsAndWantsUnlink:(BOOL)a3 db:(id)a4 error:(id *)a5;
- (BOOL)_postHardResetHandlingWithDB:(id)a3 completionBlock:(id)a4 error:(id *)a5;
- (BOOL)_resetItemsTable;
- (BOOL)_shouldFailSyncDownWaitImmediately;
- (BOOL)activated;
- (BOOL)containsNonRejectedChildWithParentID:(id)a3 db:(id)a4;
- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5;
- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4;
- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)enhancedDrivePrivacyEnabled;
- (BOOL)existsByItemID:(id)a3;
- (BOOL)existsByItemID:(id)a3 db:(id)a4;
- (BOOL)existsByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5 db:(id)a6;
- (BOOL)handleSaltingErrorIfNeeded:(id)a3 record:(id)a4;
- (BOOL)handleZoneLevelErrorIfNeeded:(id)a3 forItemCreation:(BOOL)a4;
- (BOOL)hasCompletedInitialSyncDownOnce;
- (BOOL)hasHighPriorityWatchers;
- (BOOL)hasItems;
- (BOOL)hasItemsWithInFlightDiffs;
- (BOOL)isBusy;
- (BOOL)isCloudDocsZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientZone:(id)a3;
- (BOOL)isForeground;
- (BOOL)isPrivateZone;
- (BOOL)isSharedZone;
- (BOOL)isSyncBlocked;
- (BOOL)isSyncBlockedBecauseAppNotInstalled;
- (BOOL)isSyncBlockedBecauseOSNeedsUpgrade;
- (BOOL)needsSave;
- (BOOL)removeItemIsDownloadedBlock:(id)a3;
- (BOOL)removeItemOnDiskBlock:(id)a3;
- (BOOL)removeSyncDownForItemIDBlock:(id)a3;
- (BOOL)setStateBits:(unsigned int)a3;
- (BOOL)shouldSyncMangledID:(id)a3;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BRCAccountSessionFPFS)session;
- (BRCClientZone)init;
- (BRCClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7;
- (BRCClientZoneDelegate)delegate;
- (BRCDeadlineSource)syncDeadlineSource;
- (BRCItemID)rootItemID;
- (BRCPQLConnection)db;
- (BRCServerZone)serverZone;
- (BRCZoneRowID)dbRowID;
- (BRMangledID)mangledID;
- (NSArray)syncThrottles;
- (NSDate)lastAttemptedSyncDownDate;
- (NSDictionary)parentsOfCZMFaults;
- (NSMutableDictionary)plist;
- (NSSet)itemIDsBlockedFromSyncForCZMProcessing;
- (NSString)description;
- (NSString)osNameRequiredToSync;
- (NSString)zoneName;
- (brc_task_tracker)taskTracker;
- (char)itemTypeByItemID:(id)a3 db:(id)a4;
- (char)serverItemTypeByItemID:(id)a3 db:(id)a4;
- (float)syncUpBackoffDelay;
- (float)syncUpBackoffRatio;
- (id)_cancelAllOperationsForReset;
- (id)_faultsEnumeratorFromRow:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)_getRelevantClientTruthItemEnumerator;
- (id)allItems;
- (id)allItemsSortedByDepthDescending:(BOOL)a3;
- (id)asPrivateClientZone;
- (id)asSharedClientZone;
- (id)cancelFetchParentChainOperationAndReschedule:(id)a3;
- (id)cancelListOperationAndReschedule:(id)a3;
- (id)cancelLocateRecordOperationAndReschedule:(id)a3;
- (id)childBaseSaltForItemID:(id)a3;
- (id)clientChildCountWithParentID:(id)a3 db:(id)a4;
- (id)contentBoundaryKeyForItemID:(id)a3 withDB:(id)a4;
- (id)deadItemByParentID:(id)a3 andUnbouncedLogicalName:(id)a4;
- (id)descriptionWithContext:(id)a3;
- (id)directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:(id)a3;
- (id)directoryItemIDsCreatedLastSyncUp;
- (id)directoryOrRootItemIDByFileID:(unint64_t)a3;
- (id)directoryOrRootItemIDByFileID:(unint64_t)a3 db:(id)a4;
- (id)documentItemByItemID:(id)a3;
- (id)documentItemByItemID:(id)a3 db:(id)a4;
- (id)documentsNotIdleEnumeratorWithStartingRowID:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)fetchDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApplyScheduler:(BOOL)a5;
- (id)fetchParentChainIfNecessaryWithParentItemID:(id)a3 isUserWaiting:(BOOL)a4;
- (id)fetchRecursiveDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApply:(BOOL)a5;
- (id)insertParentChainForItem:(id)a3;
- (id)itemByDocumentID:(unsigned int)a3;
- (id)itemByDocumentID:(unsigned int)a3 db:(id)a4;
- (id)itemByFileID:(unint64_t)a3;
- (id)itemByFileID:(unint64_t)a3 db:(id)a4;
- (id)itemByItemID:(id)a3;
- (id)itemByItemID:(id)a3 db:(id)a4;
- (id)itemByParentID:(id)a3 andLogicalName:(id)a4;
- (id)itemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4;
- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemCountPendingUploadOrSyncUpAndReturnError:(id *)a3;
- (id)itemsEnumeratorWithDB:(id)a3;
- (id)itemsParentedToThisZoneButLivingInAnOtherZone;
- (id)itemsWithInFlightDiffsEnumerator;
- (id)liveItemByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4 excludingItemID:(id)a5;
- (id)liveItemByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5;
- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4;
- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4 maxOperationBackoff:(double)a5;
- (id)ownerName;
- (id)popDownloadedBlockForItemID:(id)a3;
- (id)popOnDiskBlockForItemID:(id)a3;
- (id)serverChildCountWithParentID:(id)a3 db:(id)a4;
- (id)serverHiddenChildCountWithParentID:(id)a3 db:(id)a4;
- (id)serverItemByItemID:(id)a3;
- (id)serverItemByItemID:(id)a3 db:(id)a4;
- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4;
- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)serverItemByRank:(int64_t)a3;
- (id)serverItemByRowID:(unint64_t)a3;
- (id)serverItemByRowID:(unint64_t)a3 db:(id)a4;
- (id)serverQuotaUsageWithParentID:(id)a3 db:(id)a4;
- (id)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(id *)a3;
- (id)syncDownAnalyticsError;
- (id)syncDownImmediately;
- (id)syncUpAnalyticsError;
- (int64_t)lastInsertedRank;
- (int64_t)serverRankByItemID:(id)a3;
- (int64_t)serverRankByItemID:(id)a3 db:(id)a4;
- (int64_t)throttleHashWithItemID:(id)a3;
- (unint64_t)allocateSyncUpRequestID;
- (unint64_t)currentRequestID;
- (unint64_t)hash;
- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4;
- (unsigned)_appLibrariesState;
- (unsigned)saltingStateForItemID:(id)a3;
- (unsigned)state;
- (unsigned)syncState;
- (unsigned)syncUpBatchSize;
- (void)_allItemsDidUploadWithError:(id)a3;
- (void)_appendToString:(id)a3 descriptionOfFieldNamed:(id)a4 inResultSet:(id)a5 pos:(int *)a6 containsSize:(BOOL)a7 context:(id)a8;
- (void)_blockSyncDownOnStitchingOperations;
- (void)_bumpNotificationRankOnTopLevelFolderSharesInZone;
- (void)_bumpNotificationRankOnTopLevelFolderSharesParentedToZone;
- (void)_cancelOutOfBandOperations;
- (void)_decreaseSyncUpBatchSizeAfterError;
- (void)_deleteJobsMatchingServerZone;
- (void)_dumpRecursivePropertiesOfItemByRowID:(unint64_t)a3 context:(id)a4 depth:(int)a5;
- (void)_enumerateAndClearLocateBlocksForRecordID:(id)a3 exists:(BOOL)a4;
- (void)_enumerateFaultsWithBlock:(id)a3 rowID:(unint64_t)a4 batchSize:(unint64_t)a5;
- (void)_finishedReset:(unint64_t)a3 completionHandler:(id)a4;
- (void)_fixupEnhancedDrivePrivacyState;
- (void)_fixupMissingCrossMovedItems;
- (void)_flushIdleBlocksIfNeeded;
- (void)_forDBUpgrade_setStateBits:(unsigned int)a3 clearStateBits:(unsigned int)a4;
- (void)_handleSoftResetOfLocalItem:(id)a3 wantsUnlink:(BOOL)a4;
- (void)_increaseSyncUpBatchSizeAfterSuccess;
- (void)_isIdle;
- (void)_markLatestSyncRequestFailed;
- (void)_markRequestIDAcked;
- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:(id)a3;
- (void)_performResetAndWantsUnlink:(BOOL)a3 clientTruthBlock:(id)a4 completionBlock:(id)a5;
- (void)_performSoftResetOnItems:(id)a3 wantsUnlink:(BOOL)a4;
- (void)_postSoftResetHandlingAndWantsUnlink:(BOOL)a3 completionBlock:(id)a4;
- (void)_prepareForForegroundSyncDown;
- (void)_recreateSyncBudgetsAndThrottlesIfNeeded;
- (void)_registerFetchParentChainOperation:(id)a3;
- (void)_registerListOperation:(id)a3 shareAcceptOperation:(id)a4;
- (void)_registerLocateRecordOperation:(id)a3;
- (void)_registerOperation:(id)a3 throttler:(id)a4;
- (void)_registerServerStitchingOperation:(id)a3;
- (void)_removeAllShareAcceptanceBlocks;
- (void)_removeDownloadedBlockToPerformForItemID:(id)a3;
- (void)_removeOnDiskBlockToPerformForItemID:(id)a3;
- (void)_reset:(unint64_t)a3 completionHandler:(id)a4;
- (void)_resetAndDeleteServerTruthData;
- (void)_scheduleZoneResetForUninstalledAppIfNecessary;
- (void)_shouldFailSyncDownWaitImmediately;
- (void)_startSync;
- (void)_syncUpOfRecords:(id)a3 createdAppLibraryNames:(id)a4 didFinishWithError:(id)a5 errorWasOnPCSChainedItem:(BOOL)a6 throttledItemInBatch:(BOOL)a7;
- (void)addOutOfBandOperation:(id)a3;
- (void)addSyncDownDependency:(id)a3;
- (void)asPrivateClientZone;
- (void)asSharedClientZone;
- (void)associateWithServerZone:(id)a3;
- (void)associateWithServerZone:(id)a3 offline:(BOOL)a4;
- (void)beginSyncBubbleActivityIfNecessary;
- (void)cancelReset;
- (void)clearAndRefetchRecentAndFavoriteDocuments;
- (void)clearStateBits:(unsigned int)a3;
- (void)clearSyncStateBits:(unsigned int)a3;
- (void)clearSyncUpError;
- (void)close;
- (void)dealloc;
- (void)didApplyTombstoneForRank:(int64_t)a3;
- (void)didClearOutOfQuota;
- (void)didGCTombstoneRanks:(id)a3;
- (void)didSyncDownRequestID:(unint64_t)a3 maxApplyRank:(int64_t)a4 caughtUpWithServer:(BOOL)a5 syncDownDate:(id)a6;
- (void)disconnectNSMDQListenerAsync;
- (void)enumerateFaultsAsyncWithBlock:(id)a3 batchSize:(unint64_t)a4;
- (void)fetchRecentAndFavoriteDocuments;
- (void)fetchRecentAndFavoriteDocuments:(BOOL)a3;
- (void)flushAppliedTombstones;
- (void)handleRootRecordDeletion;
- (void)itemMovedIntoShareInThisZone:(id)a3 associatedItemID:(id)a4;
- (void)learnCKInfosFromSavedRecords:(id)a3 isOutOfBandModifyRecords:(BOOL)a4;
- (void)listedUpToRank:(int64_t)a3;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)notifyClient:(id)a3 afterNextSyncDown:(id)a4;
- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4;
- (void)notifyClient:(id)a3 whenIdle:(id)a4;
- (void)performBlock:(id)a3 whenItemWithIDIsDownloaded:(id)a4;
- (void)performBlock:(id)a3 whenItemWithRecordIDIsOnDisk:(id)a4;
- (void)performBlock:(id)a3 whenLocatingCompletesForItemWithRecordID:(id)a4;
- (void)performBlock:(id)a3 whenSyncDownCompletesLookingForItemID:(id)a4;
- (void)prepareDirectoryForSyncUp:(id)a3;
- (void)recomputeAllItemsDidUploadState;
- (void)registerAllItemsDidUploadTracker:(id)a3;
- (void)removeOutOfBandOperation:(id)a3;
- (void)removeSyncDownDependency:(id)a3;
- (void)resetSyncBudgetAndThrottle;
- (void)resetSyncUpBackoffRatio;
- (void)resume;
- (void)rootItemID;
- (void)scheduleReset:(unint64_t)a3;
- (void)scheduleReset:(unint64_t)a3 completionHandler:(id)a4;
- (void)scheduleResetServerAndClientTruthsForReason:(id)a3;
- (void)scheduleResetServerAndClientTruthsForReason:(id)a3 completionHandler:(id)a4;
- (void)scheduleSyncDown;
- (void)scheduleSyncDownFirst;
- (void)scheduleSyncDownForOOBModifyRecordsAck;
- (void)scheduleSyncDownWithGroup:(id)a3;
- (void)scheduleSyncUp;
- (void)setDbRowID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAttemptedSyncDownDate:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setServerZone:(id)a3;
- (void)setSession:(id)a3;
- (void)setSyncStateBits:(unsigned int)a3;
- (void)signalFaultingWatchersWithError:(id)a3;
- (void)syncDownImmediately;
- (void)syncDownOperation:(id)a3 didFinishWithError:(id)a4 status:(int64_t)a5;
- (void)unregisterAllItemsDidUploadTracker:(id)a3;
- (void)updateWithPlist:(id)a3;
@end

@implementation BRCClientZone

- (id)directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:(id)a3
{
  id v4 = a3;
  v5 = [(BRCClientZone *)self db];
  v6 = [(BRCClientZone *)self dbRowID];
  v7 = (void *)[v5 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND basehash_salt_validation_key IS NULL AND item_type != 3 and zone_rowid = %@", v4, v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke;
  v10[3] = &unk_26507F1E8;
  v10[4] = self;
  v8 = [v7 enumerateObjects:v10];

  return v8;
}

id __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 session];
  v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (unsigned)saltingStateForItemID:(id)a3
{
  id v4 = a3;
  if ([v4 isNonDesktopRoot])
  {
    if (![(BRCClientZone *)self isPrivateZone])
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:]((uint64_t)v13, v14);
      }
    }
    id v5 = [(BRCClientZone *)self session];
    v6 = [v4 appLibraryRowID];

    v7 = [v5 appLibraryByRowID:v6];

    if (![v7 rootRecordCreated])
    {
      unsigned int v11 = -1;
      goto LABEL_9;
    }
    unsigned int v8 = [v7 saltingState];
  }
  else
  {
    v9 = [(BRCClientZone *)self db];
    v10 = [(BRCClientZone *)self dbRowID];
    v7 = (void *)[v9 numberWithSQL:@"SELECT salting_state FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", v4, v10];

    if (!v7) {
      return -1;
    }
    unsigned int v8 = [v7 intValue];
  }
  unsigned int v11 = v8;
LABEL_9:

  return v11;
}

- (id)childBaseSaltForItemID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isNonDesktopRoot])
  {
    if (![(BRCClientZone *)self isPrivateZone])
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:]((uint64_t)v15, v16);
      }
    }
    id v5 = [(BRCClientZone *)self session];
    v6 = [v4 appLibraryRowID];
    v7 = [v5 appLibraryByRowID:v6];
    unsigned int v8 = [v7 childBasehashSalt];
  }
  else
  {
    id v5 = [(BRCClientZone *)self db];
    v6 = [(BRCClientZone *)self dbRowID];
    unsigned int v8 = (void *)[v5 dataWithSQL:@"SELECT child_basehash_salt FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", v4, v6];
  }

  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_msgSend(v8, "brc_truncatedSHA256");
    v13 = objc_msgSend(v12, "brc_hexadecimalString");
    v14 = [v4 debugDescription];
    *(_DWORD *)buf = 138412802;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Found child basehash salt %@ from database for %@%@", buf, 0x20u);
  }
  return v8;
}

- (void)cancelReset
{
  if (self->_resetTimer)
  {
    v3 = [(BRCAccountSessionFPFS *)self->_session resetQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke;
    block[3] = &unk_26507ED70;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

void __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 304);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 304);
    *(void *)(v3 + 304) = 0;
  }
}

- (void)scheduleReset:(unint64_t)a3
{
}

- (void)scheduleReset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(BRCAccountSessionFPFS *)self->_session resetQueue];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]", 104, v18);
  unsigned int v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = v18[0];
    uint64_t v13 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling reset %s of %@%@", buf, 0x2Au);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke;
  v14[3] = &unk_265080EE0;
  v14[4] = self;
  unint64_t v17 = a3;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v15 = v11;
  dispatch_async_with_logs_3(v11, v14);

  __brc_leave_section(v18);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__14;
  v60 = __Block_byref_object_dispose__14;
  id v61 = 0;
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2;
  block[3] = &unk_265081620;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v62;
  uint64_t v3 = *(void *)(a1 + 56);
  block[6] = &v56;
  block[7] = v3;
  dispatch_sync(v2, block);

  if (v63[3])
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2([(id)v57[5] count], (uint64_t)v4, v75, v5);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v6 = (id)v57[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v74 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v52 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) waitUntilFinished];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v74 count:16];
      }
      while (v7);
    }

    int v10 = [*(id *)(a1 + 32) isSharedZone];
    id v11 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v10) {
      [v11 sharedAppLibraryResetThrottle];
    }
    else {
    uint64_t v13 = [v11 appLibraryResetThrottle];
    }
    v14 = [*(id *)(a1 + 32) zoneName];
    int64_t v15 = +[BRCThrottle throttleHashFormat:@"%@~%d", v14, v63[3]];

    unint64_t v16 = [v13 nsecsToNextRetry:v15 now:brc_current_date_nsec() increment:0];
    [v13 incrementRetryCount:v15];
    if (v16)
    {
      if (v16 < 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v47 = 0uLL;
        uint64_t v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 202, &v47);
        __int16 v21 = brc_bread_crumbs();
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = v47;
          brc_interval_from_nsec();
          uint64_t v38 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134218754;
          uint64_t v67 = v37;
          __int16 v68 = 2048;
          v69 = v39;
          __int16 v70 = 2112;
          uint64_t v71 = v38;
          __int16 v72 = 2112;
          v73 = v21;
          _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting %.3f secs to reset %@%@", buf, 0x2Au);
        }

        long long v49 = v47;
        uint64_t v50 = v48;
        if (*(void *)(*(void *)(a1 + 32) + 304))
        {
          v40 = brc_bread_crumbs();
          v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1();
          }
        }
        dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 40));
        uint64_t v24 = *(void *)(a1 + 32);
        __int16 v25 = *(void **)(v24 + 304);
        *(void *)(v24 + 304) = v23;

        v26 = *(NSObject **)(*(void *)(a1 + 32) + 304);
        dispatch_time_t v27 = dispatch_time(0, v16);
        dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
        uint64_t v28 = *(void *)(a1 + 32);
        v29 = *(void **)(v28 + 304);
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_7;
        v42[3] = &unk_265081648;
        long long v45 = v49;
        uint64_t v46 = v50;
        v42[4] = v28;
        v44 = &v62;
        id v43 = *(id *)(a1 + 48);
        id v30 = v29;
        v31 = v42;
        v32 = v30;
        v33 = v31;
        v34 = v33;
        v35 = v33;
        if (*MEMORY[0x263F32768])
        {
          v35 = ((void (*)(void *))*MEMORY[0x263F32768])(v33);
        }
        dispatch_block_t v36 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v35);
        dispatch_source_set_event_handler(v32, v36);

        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 304));
      }
      else
      {
        unint64_t v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v67 = v19;
          __int16 v68 = 2112;
          v69 = v17;
          _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] giving up on resetting %@%@", buf, 0x16u);
        }

        uint64_t v20 = *(void *)(a1 + 48);
        if (v20) {
          (*(void (**)(void))(v20 + 16))();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _reset:v63[3] completionHandler:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int v2 = [*(id *)(a1 + 32) state];
  if ((v2 & 0x20000) != 0) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 56);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    id v4 = [*(id *)(a1 + 32) asPrivateClientZone];
    id v5 = [v4 defaultAppLibrary];
    unsigned int v6 = [v5 state];
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 2uLL) {
    uint64_t v7 = 256;
  }
  else {
    uint64_t v7 = 131328;
  }
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = [*(id *)(a1 + 32) asPrivateClientZone];
    v9 = [v8 appLibraries];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) setStateBits:8];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v10);
    }
  }
  memset(v28, 0, sizeof(v28));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 138, v28);
  uint64_t v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v28[0];
    uint64_t v21 = BRCPrettyPrintEnum();
    uint64_t v22 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = v20;
    __int16 v35 = 2080;
    uint64_t v36 = v21;
    __int16 v37 = 2112;
    uint64_t v38 = v22;
    __int16 v39 = 2112;
    v40 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reset %s of %@%@", buf, 0x2Au);
  }

  if ((v2 & 0x100) != 0)
  {
    v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      BRCClientZoneStatePrettyPrint(v2);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      BRCAppLibraryStatePrettyPrint(v6);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v25 = BRCClientZoneStatePrettyPrint(v7 & ~v2);
      *(_DWORD *)buf = 138413058;
      uint64_t v34 = (uint64_t)v23;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v24;
      __int16 v37 = 2112;
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      v40 = v18;
      _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] zone is already resetting (zone:%@,appLibrary:%@) but adding (%@) for the next reset%@", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) setStateBits:v7];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    unint64_t v16 = *(void **)(v15 + 64);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_3;
    v26[3] = &unk_2650815F8;
    int v27 = v7;
    uint64_t v17 = *(void *)(a1 + 48);
    v26[4] = v15;
    v26[5] = v17;
    [v16 performWithFlags:16 action:v26];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "saveClientZoneToDB:");
  __brc_leave_section(v28);
}

uint64_t __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setStateBits:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) clearSyncStateBits:15];
  uint64_t v2 = [*(id *)(a1 + 32) _cancelAllOperationsForReset];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = brc_bread_crumbs();
  unsigned int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = BRCClientZoneStatePrettyPrint(*(_DWORD *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] flushing reset state (%@) for container %@%@", (uint8_t *)&v10, 0x20u);
  }
  return 1;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_7(uint64_t a1)
{
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_7_cold_1(&v6);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 304);
  *(void *)(v4 + 304) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_reset:completionHandler:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 40), v6, v7);
  __brc_leave_section((uint64_t *)&v6);
}

- (void)_reset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v6 = (void (**)(void))a4;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session resetQueue];
  dispatch_assert_queue_V2(v7);

  if (self->_activated)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(BRCClientZone *)self mangledID];
      *(_DWORD *)buf = 138412802;
      id v23 = v10;
      __int16 v24 = 2080;
      uint64_t v25 = BRCPrettyPrintEnum();
      __int16 v26 = 2112;
      int v27 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] resetting %@: %s%@", buf, 0x20u);
    }
    switch(a3)
    {
      case 4uLL:
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3;
        v16[3] = &unk_26507F850;
        v16[4] = self;
        uint64_t v17 = v6;
        [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:v16];
        uint64_t v11 = v17;
        goto LABEL_14;
      case 3uLL:
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2;
        uint64_t v18[3] = &unk_26507F850;
        v18[4] = self;
        uint64_t v19 = v6;
        [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkData:v18];
        uint64_t v11 = v19;
        goto LABEL_14;
      case 2uLL:
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke;
        v20[3] = &unk_26507F850;
        v20[4] = self;
        uint64_t v21 = v6;
        [(BRCClientZone *)self _performResetAndWantsUnlink:0 clientTruthBlock:0 completionBlock:v20];
        uint64_t v11 = v21;
LABEL_14:

        goto LABEL_18;
    }
    __int16 v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:]();
    }
  }
  else
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_notifications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:](self, (uint64_t)v12, v13);
    }

    if (v6) {
      v6[2](v6);
    }
  }
LABEL_18:
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:3 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:4 completionHandler:*(void *)(a1 + 40)];
}

- (void)_resetAndDeleteServerTruthData
{
  uint64_t v3 = self->_session;
  uint64_t v4 = [(BRCServerZone *)self->_serverZone db];
  id v5 = [v4 serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  uint64_t v8 = v3;
  long long v6 = v3;
  dispatch_sync(v5, v7);
}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1(a1);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) resetServerTruth];
  uint64_t v4 = [*(id *)(a1 + 40) stageRegistry];
  [v4 removeDatabaseObjectsForZone:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_deleteJobsMatchingServerZone
{
  uint64_t v3 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  [v3 deleteNonRejectionJobsForZone:self->_serverZone];

  uint64_t v4 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
  [v4 deleteJobsMatching:self->_serverZone];

  id v5 = [(BRCAccountSessionFPFS *)self->_session fsDownloader];
  [v5 deleteJobsMatching:self->_serverZone];

  id v6 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  [v6 deleteJobsMatching:self->_serverZone];
}

- (id)_getRelevantClientTruthItemEnumerator
{
  return [(BRCClientZone *)self allItemsSortedByDepthDescending:1];
}

- (void)_handleSoftResetOfLocalItem:(id)a3 wantsUnlink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [v5 resetWhileKeepingClientItemsAndWantsUnlink:v4];
  if (v4
    && ([v5 itemID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isDocumentsFolder],
        v6,
        (v7 & 1) == 0))
  {
    [v5 markForceRejected];
    if ([v5 isSharedToMeTopLevelItem]
      && [v5 isDead]
      && ([v5 localDiffs] & 8) != 0)
    {
      uint64_t v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        __int16 v14 = v8;
        _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Found a top level item that still needs to delete its alias %@.  Inserting a tombstone%@", (uint8_t *)&v11, 0x16u);
      }

      int v10 = [v5 asSharedToMeTopLevelItem];
      [v10 insertTombstoneAliasRecordInZone:0];
    }
  }
  else
  {
    [v5 markForceNeedsSyncUp];
  }
  [v5 saveToDB];
}

- (void)_performSoftResetOnItems:(id)a3 wantsUnlink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        __int16 v14 = (void *)MEMORY[0x2455D97F0](v9);
        if ((objc_msgSend(v7, "containsIndex:", objc_msgSend(v13, "dbRowID", (void)v15)) & 1) == 0)
        {
          objc_msgSend(v7, "addIndex:", objc_msgSend(v13, "dbRowID"));
          [(BRCClientZone *)self _handleSoftResetOfLocalItem:v13 wantsUnlink:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

- (void)_postSoftResetHandlingAndWantsUnlink:(BOOL)a3 completionBlock:(id)a4
{
  session = self->_session;
  id v5 = (void (**)(void))a4;
  id v6 = [(BRCAccountSessionFPFS *)session resetQueue];
  v5[2](v5);
}

- (BOOL)_deleteRelevantPackageItemsWithDB:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [v6 executeWithSlowStatementRadar:@"<rdar://problem/23829401>", @"DELETE FROM client_pkg_upload_items WHERE item_rowid IN (SELECT rowid FROM client_items WHERE zone_rowid = %@ AND +item_type = 1 AND  HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')", self->_dbRowID sql];
  if ((v7 & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:](v6, (uint64_t)v8, v9);
    }

    uint64_t v10 = [v6 lastError];
    if (v10)
    {
      uint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        __int16 v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        long long v16 = "-[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:]";
        __int16 v17 = 2080;
        if (!a4) {
          __int16 v14 = "(ignored by caller)";
        }
        long long v18 = v14;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v10;
    }
  }
  return v7;
}

- (BOOL)_performHardResetOnClientItemsAndWantsUnlink:(BOOL)a3 db:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ([(BRCClientZone *)self _deleteRelevantPackageItemsWithDB:v8 error:a5])
  {
    if (v6)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v9 = [(BRCClientZone *)self allItemsSortedByDepthDescending:1];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v34 = v8;
        uint64_t v12 = *(void *)v37;
        uint64_t v35 = *MEMORY[0x263F32430];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            long long v15 = [v14 itemID];
            int v16 = [v15 isDocumentsFolder];

            if (v16)
            {
              [v14 resetWhileKeepingClientItemsAndWantsUnlink:1];
              [v14 markNeedsUploadOrSyncingUp];
            }
            else
            {
              brc_bread_crumbs();
              __int16 v17 = (char *)objc_claimAutoreleasedReturnValue();
              long long v18 = brc_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v41 = (const char *)v14;
                __int16 v42 = 2112;
                id v43 = v17;
                _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Unlinking item %@%@", buf, 0x16u);
              }

              [v14 markForceRejected];
            }
            if (([v14 saveToDB] & 1) == 0)
            {
              __int16 v19 = [v14 db];
              uint64_t v20 = [v19 lastError];
              __int16 v21 = v20;
              if (v20)
              {
                uint64_t v22 = v20;
              }
              else
              {
                brc_bread_crumbs();
                uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
                __int16 v24 = brc_default_log();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v23;
                  _os_log_fault_impl(&dword_23FA42000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save to db without an error%@", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", v35, 15, @"unreachable: Failed to save to db without an error");
                uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v25 = v22;

              __int16 v26 = brc_bread_crumbs();
              int v27 = brc_default_log();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v41 = (const char *)v14;
                __int16 v42 = 2112;
                id v43 = v25;
                __int16 v44 = 2112;
                id v45 = v26;
                _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to save item %@ while resetting - %@%@", buf, 0x20u);
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v11);
        id v8 = v34;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (([v8 execute:@"DELETE FROM client_items WHERE zone_rowid = %@", self->_dbRowID] & 1) == 0)
    {
      uint64_t v28 = brc_bread_crumbs();
      long long v29 = brc_default_log();
      if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
        -[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:](v8, (uint64_t)v28, v29);
      }

      id v9 = [v8 lastError];
      if (v9)
      {
        long long v30 = brc_bread_crumbs();
        long long v31 = brc_default_log();
        if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
        {
          v33 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v41 = "-[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]";
          __int16 v42 = 2080;
          if (!a5) {
            v33 = "(ignored by caller)";
          }
          id v43 = v33;
          __int16 v44 = 2112;
          id v45 = v9;
          __int16 v46 = 2112;
          long long v47 = v30;
          _os_log_error_impl(&dword_23FA42000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5)
      {
        id v9 = v9;
        *a5 = v9;
      }
      goto LABEL_35;
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_36:

  return v6;
}

- (BOOL)_postHardResetHandlingWithDB:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  if (![(BRCClientZone *)self isPrivateZone])
  {
LABEL_13:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    __int16 v21 = [(BRCClientZone *)self itemsParentedToThisZoneButLivingInAnOtherZone];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          __int16 v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          int v27 = (void *)MEMORY[0x2455D97F0]();
          uint64_t v28 = [v26 appLibrary];
          [v28 clearStateBits:0x40000];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v23);
    }

    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v29 = [(BRCClientZone *)self asPrivateClientZone];
      [v29 clearProblemReport];
    }
    v9[2](v9);
    BOOL v30 = 1;
    goto LABEL_29;
  }
  uint64_t v10 = [(BRCClientZone *)self asPrivateClientZone];
  uint64_t v11 = [v10 defaultAppLibrary];
  uint64_t v12 = [v11 documentsFolderItemID];
  __int16 v13 = [(BRCClientZone *)self dbRowID];
  char v14 = [v8 executeWithSlowStatementRadar:@"<rdar://problem//26848061>", @"UPDATE client_items SET item_parent_id = %@ WHERE item_parent_zone_rowid != zone_rowid AND item_parent_zone_rowid = %@", v12, v13 sql];

  if (v14)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v15 = [v10 appLibraries];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          [v20 setStateBits:1310720];
          [(BRCAccountSessionFPFS *)self->_session saveAppLibraryToDB:v20];
          if ([v20 includesDataScope]) {
            [v20 recreateDocumentsFolderIfNeededInDB];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v17);
    }

    goto LABEL_13;
  }
  long long v31 = [v8 lastError];
  if (v31)
  {
    long long v32 = brc_bread_crumbs();
    v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
    {
      uint64_t v35 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      long long v47 = "-[BRCClientZone(BRCZoneReset) _postHardResetHandlingWithDB:completionBlock:error:]";
      __int16 v48 = 2080;
      if (!a5) {
        uint64_t v35 = "(ignored by caller)";
      }
      uint64_t v49 = v35;
      __int16 v50 = 2112;
      long long v51 = v31;
      __int16 v52 = 2112;
      long long v53 = v32;
      _os_log_error_impl(&dword_23FA42000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v31;
  }

  BOOL v30 = 0;
LABEL_29:

  return v30;
}

- (void)_performResetAndWantsUnlink:(BOOL)a3 clientTruthBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self->_session;
  uint64_t v11 = [(BRCAccountSessionFPFS *)v10 resetQueue];
  dispatch_assert_queue_V2(v11);
  [(BRCClientZone *)self _resetAndDeleteServerTruthData];
  uint64_t v12 = [(BRCPQLConnection *)self->_db serialQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke;
  v15[3] = &unk_265081698;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = a3;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v12, v15);
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_265081670;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v7 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 performWithFlags:46 action:v4];
}

uint64_t __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(a1 + 32) _deleteJobsMatchingServerZone];
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4((void *)(a1 + 32));
  }

  if ([*(id *)(a1 + 32) supportsKeepingClientItemsDuringReset])
  {
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1(a1);
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 _getRelevantClientTruthItemEnumerator];
    [v9 _performSoftResetOnItems:v10 wantsUnlink:*(unsigned __int8 *)(a1 + 56)];

    [*(id *)(a1 + 32) _postSoftResetHandlingAndWantsUnlink:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
  id v24 = 0;
  char v13 = [v11 _performHardResetOnClientItemsAndWantsUnlink:v12 db:v3 error:&v24];
  id v14 = v24;
  if ((v13 & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3();
    }
    goto LABEL_18;
  }
  long long v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  id v23 = v14;
  char v17 = [v15 _postHardResetHandlingWithDB:v3 completionBlock:v16 error:&v23];
  id v18 = v23;

  if ((v17 & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2();
    }
    id v14 = v18;
LABEL_18:

    uint64_t v19 = 0;
    goto LABEL_19;
  }

LABEL_12:
  uint64_t v19 = 1;
LABEL_19:

  return v19;
}

- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:(id)a3
{
}

- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:(id)a3
{
  id v4 = a3;
  if (![(BRCClientZone *)self isSharedZone])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(BRCZoneReset) _performAfterResetServerAndClientSharedTruthsAndUnlinkData:]();
    }
  }
  [(BRCClientZone *)self _performResetAndWantsUnlink:1 clientTruthBlock:0 completionBlock:v4];
}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkData:(id)a3
{
  id v4 = a3;
  if ([(BRCClientZone *)self isSharedZone]) {
    [(BRCClientZone *)self _performAfterResetServerAndClientSharedTruthsAndUnlinkData:v4];
  }
  else {
    [(BRCClientZone *)self _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:v4];
  }
}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke;
  v6[3] = &unk_26507F850;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkData:v6];
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) assertOnQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) resetQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2;
  v4[3] = &unk_26507F850;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async_with_logs_3(v2, v4);
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3;
  v3[3] = &unk_26507F850;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 deleteAllContentsOnServerWithCompletionBlock:v3];
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  dispatch_assert_queue_not_V2(v2);

  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4;
  v5[3] = &unk_26507F850;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async_with_logs_3(v3, v5);
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5;
  v2[3] = &unk_2650816C0;
  id v3 = *(id *)(a1 + 40);
  [v1 performWithFlags:8 action:v2];
}

uint64_t __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5(uint64_t a1)
{
  return 1;
}

- (id)_cancelAllOperationsForReset
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  v87 = self;
  if ([(BRCClientZone *)self isSharedZone])
  {
    id v4 = [(BRCClientZone *)self serverZone];
    id v5 = [v4 asSharedZone];
    id v6 = [v5 transferSyncContext];

    id v7 = [v6 uploadStream];
    id v8 = [v7 operations];
    [v3 addObjectsFromArray:v8];

    id v9 = [v6 downloadStream];
    uint64_t v10 = [v9 operations];
    [v3 addObjectsFromArray:v10];
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v11 = [(BRCClientZone *)self asPrivateClientZone];
    id v6 = [v11 appLibraries];

    uint64_t v12 = [v6 countByEnumeratingWithState:&v112 objects:v126 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v113 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = [*(id *)(*((void *)&v112 + 1) + 8 * i) transferSyncContext];
          char v17 = [v16 uploadStream];
          id v18 = [v17 operations];
          [v3 addObjectsFromArray:v18];

          uint64_t v19 = [v16 downloadStream];
          uint64_t v20 = [v19 operations];
          [v3 addObjectsFromArray:v20];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v112 objects:v126 count:16];
      }
      while (v13);
    }
  }

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v108 objects:v125 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v109;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v109 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v26 = *(BRCFetchRecentAndFavoriteDocumentsOperation **)(*((void *)&v108 + 1) + 8 * j);
        int v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v26;
          __int16 v123 = 2112;
          v124 = v27;
          _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [(_BRCOperation *)v26 cancel];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v108 objects:v125 count:16];
    }
    while (v23);
  }

  long long v29 = v87->_syncUpOperation;
  if (v29)
  {
    BOOL v30 = brc_bread_crumbs();
    long long v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]();
    }

    [v21 addObject:v29];
    [(_BRCOperation *)v29 cancel];
  }
  syncUpOperation = v87->_syncUpOperation;
  v87->_syncUpOperation = 0;

  lastSyncUpError = v87->_lastSyncUpError;
  v87->_lastSyncUpError = 0;

  id v34 = v87->_syncDownOperation;
  if (v34)
  {
    uint64_t v35 = brc_bread_crumbs();
    long long v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]();
    }

    [v21 addObject:v34];
    [(_BRCOperation *)v34 cancel];
  }
  syncDownOperation = v87->_syncDownOperation;
  v87->_syncDownOperation = 0;

  lastSyncDownError = v87->_lastSyncDownError;
  v87->_lastSyncDownError = 0;

  long long v39 = v87->_fetchRecentsOperation;
  if (v39)
  {
    long long v40 = brc_bread_crumbs();
    long long v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]();
    }

    [v21 addObject:v39];
    [(_BRCOperation *)v39 cancel];
  }
  fetchRecentsOperation = v87->_fetchRecentsOperation;
  v87->_fetchRecentsOperation = 0;

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v43 = [(NSMutableDictionary *)v87->_locateRecordOperations allValues];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v104 objects:v120 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v105;
    do
    {
      uint64_t v47 = 0;
      __int16 v48 = v39;
      do
      {
        if (*(void *)v105 != v46) {
          objc_enumerationMutation(v43);
        }
        long long v39 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v104 + 1) + 8 * v47);

        uint64_t v49 = brc_bread_crumbs();
        __int16 v50 = brc_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v39;
          __int16 v123 = 2112;
          v124 = v49;
          _os_log_debug_impl(&dword_23FA42000, v50, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v39];
        [(_BRCOperation *)v39 cancel];
        ++v47;
        __int16 v48 = v39;
      }
      while (v45 != v47);
      uint64_t v45 = [v43 countByEnumeratingWithState:&v104 objects:v120 count:16];
    }
    while (v45);
  }

  p_isa = (id *)&v87->super.isa;
  [(NSMutableDictionary *)v87->_locateRecordOperations removeAllObjects];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  __int16 v52 = [(NSMutableDictionary *)v87->_fetchParentOperations allValues];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    v55 = 0;
    uint64_t v56 = *(void *)v101;
    do
    {
      uint64_t v57 = 0;
      uint64_t v58 = v55;
      do
      {
        if (*(void *)v101 != v56) {
          objc_enumerationMutation(v52);
        }
        v55 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v100 + 1) + 8 * v57);

        v59 = brc_bread_crumbs();
        v60 = brc_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v55;
          __int16 v123 = 2112;
          v124 = v59;
          _os_log_debug_impl(&dword_23FA42000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v55];
        [(_BRCOperation *)v55 cancel];
        ++v57;
        uint64_t v58 = v55;
      }
      while (v54 != v57);
      uint64_t v54 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
    }
    while (v54);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[27] removeAllObjects];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v61 = [p_isa[26] allValues];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v96 objects:v118 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = 0;
    uint64_t v65 = *(void *)v97;
    do
    {
      uint64_t v66 = 0;
      uint64_t v67 = v64;
      do
      {
        if (*(void *)v97 != v65) {
          objc_enumerationMutation(v61);
        }
        uint64_t v64 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v96 + 1) + 8 * v66);

        __int16 v68 = brc_bread_crumbs();
        v69 = brc_default_log();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v64;
          __int16 v123 = 2112;
          v124 = v68;
          _os_log_debug_impl(&dword_23FA42000, v69, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v64];
        [(_BRCOperation *)v64 cancel];
        ++v66;
        uint64_t v67 = v64;
      }
      while (v63 != v66);
      uint64_t v63 = [v61 countByEnumeratingWithState:&v96 objects:v118 count:16];
    }
    while (v63);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[26] removeAllObjects];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  __int16 v70 = [p_isa[25] allValues];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v92 objects:v117 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    v73 = 0;
    uint64_t v74 = *(void *)v93;
    do
    {
      uint64_t v75 = 0;
      uint64_t v76 = v73;
      do
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v70);
        }
        v73 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v92 + 1) + 8 * v75);

        v77 = brc_bread_crumbs();
        v78 = brc_default_log();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v73;
          __int16 v123 = 2112;
          v124 = v77;
          _os_log_debug_impl(&dword_23FA42000, v78, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v73];
        [(_BRCOperation *)v73 cancel];
        ++v75;
        uint64_t v76 = v73;
      }
      while (v72 != v75);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v92 objects:v117 count:16];
    }
    while (v72);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[25] removeAllObjects];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v79 = p_isa[24];
  uint64_t v80 = [v79 countByEnumeratingWithState:&v88 objects:v116 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    id v82 = 0;
    uint64_t v83 = *(void *)v89;
    do
    {
      uint64_t v84 = 0;
      v85 = v82;
      do
      {
        if (*(void *)v89 != v83) {
          objc_enumerationMutation(v79);
        }
        id v82 = *(id *)(*((void *)&v88 + 1) + 8 * v84);

        [v82 schedule];
        ++v84;
        v85 = v82;
      }
      while (v81 != v84);
      uint64_t v81 = [v79 countByEnumeratingWithState:&v88 objects:v116 count:16];
    }
    while (v81);
  }
  [p_isa[24] removeAllObjects];
  [p_isa _removeAllShareAcceptanceBlocks];
  return v21;
}

- (void)_finishedReset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v48 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  objc_msgSend(NSString, "stringWithFormat:", @"reset %s", BRCPrettyPrintEnum());
  uint64_t v47 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) _finishedReset:completionHandler:]", 824, v72);
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v78 = v72[0];
    __int16 v79 = 2112;
    uint64_t v80 = v47;
    __int16 v81 = 2112;
    id v82 = self;
    __int16 v83 = 2112;
    uint64_t v84 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@ of %@%@", buf, 0x2Au);
  }

  int v8 = ![(BRCClientZone *)self isSharedZone];
  if (a3 < 3) {
    LOBYTE(v8) = 1;
  }
  if ((v8 & 1) == 0) {
    [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
  }
  if (a3 <= 2) {
    uint64_t v9 = 256;
  }
  else {
    uint64_t v9 = 131328;
  }
  [(BRCClientZone *)self clearStateBits:v9];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v10 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v11 = [v10 appLibraries];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * i) clearStateBits:503316482];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v12);
    }
  }
  if (([(BRCClientZone *)self state] & 0x20000) != 0)
  {
    brc_bread_crumbs();
    uint64_t v24 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v78 = (uint64_t)v47;
      __int16 v79 = 2112;
      uint64_t v80 = self;
      __int16 v81 = 2112;
      id v82 = v24;
      _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@ but we still need to delete data%@", buf, 0x20u);
    }

    [(BRCClientZone *)self scheduleResetServerAndClientTruthsForReason:@"still-wants-data-unlinked"];
  }
  else
  {
    lastSyncDownDate = self->_lastSyncDownDate;
    self->_lastSyncDownDate = 0;

    [(BRCClientZone *)self clearSyncStateBits:63];
    [(BRCClientZone *)self setStateBits:16];
    [(BRCClientZone *)self scheduleSyncDown];
    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v16 = [(BRCClientZone *)self asPrivateClientZone];
      char v17 = [v16 appLibraries];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v65 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            [v21 clearStateBits:134217730];
            [(BRCAccountSessionFPFS *)self->_session saveAppLibraryToDB:v21];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v18);
      }
    }
    brc_bread_crumbs();
    uint64_t v22 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v78 = (uint64_t)v47;
      __int16 v79 = 2112;
      uint64_t v80 = self;
      __int16 v81 = 2112;
      id v82 = v22;
      _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@%@", buf, 0x20u);
    }
  }
  [(BRCAccountSessionFPFS *)self->_session saveClientZoneToDB:self];
  __int16 v26 = dispatch_group_create();
  if (a3 > 2)
  {
    if (![(BRCClientZone *)self isPrivateZone]) {
      goto LABEL_54;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v33 = [(BRCClientZone *)self asPrivateClientZone];
    id v28 = [v33 appLibraries];

    uint64_t v34 = [v28 countByEnumeratingWithState:&v51 objects:v73 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * k) clearStateBits:8];
        }
        uint64_t v34 = [v28 countByEnumeratingWithState:&v51 objects:v73 count:16];
      }
      while (v34);
    }
  }
  else if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    int v27 = [(BRCClientZone *)self asPrivateClientZone];
    id v28 = [v27 appLibraries];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v29; ++m)
        {
          if (*(void *)v61 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = *(void **)(*((void *)&v60 + 1) + 8 * m);
          dispatch_group_enter(v26);
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke;
          v58[3] = &unk_26507EBD8;
          v59 = v26;
          [v32 reimportLibraryRootAndFinishResetWithCompletion:v58];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v60 objects:v74 count:16];
      }
      while (v29);
    }
  }
  else
  {
    id v28 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, item_type FROM client_items  WHERE zone_rowid = %@ AND (item_sharing_options & 4) != 0", self->_dbRowID];
    while ([v28 next])
    {
      long long v38 = (void *)MEMORY[0x2455D97F0]();
      uint64_t v39 = [v28 longLongAtIndex:0];
      unsigned __int8 v40 = [v28 intAtIndex:1];
      id v41 = objc_alloc(MEMORY[0x263F325A8]);
      if (v40 - 1 < 2 || v40 == 8) {
        uint64_t v43 = 2;
      }
      else {
        uint64_t v43 = 3;
      }
      uint64_t v44 = (void *)[v41 initWithRowID:v39 type:v43];
      uint64_t v45 = [v44 asString];
      dispatch_group_enter(v26);
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke_2;
      v55[3] = &unk_26507F7B0;
      id v46 = v45;
      id v56 = v46;
      uint64_t v57 = v26;
      +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v46 completionHandler:v55];
    }
  }

LABEL_54:
  if (v48)
  {
    long long v37 = [(BRCPQLConnection *)self->_db serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke_45;
    block[3] = &unk_265080B88;
    id v50 = v48;
    dispatch_group_notify(v26, v37, block);
  }
  __brc_leave_section(v72);
}

void __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke(uint64_t a1)
{
}

void __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed to signal reimport of %@ - %@%@", (uint8_t *)&v7, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)ownerName
{
  return (id)*MEMORY[0x263EFD488];
}

- (id)asPrivateClientZone
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone asPrivateClientZone]();
  }

  return 0;
}

- (id)asSharedClientZone
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone asSharedClientZone]();
  }

  return 0;
}

- (BRCItemID)rootItemID
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone rootItemID]();
  }

  return 0;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (unsigned)syncUpBatchSize
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  unsigned int v5 = [v4 maxRecordCountInModifyRecordsOperation];

  float syncUpBatchSizeMultiplier = self->_syncUpBatchSizeMultiplier;
  unsigned int v7 = (float)(syncUpBatchSizeMultiplier * (float)v5);
  if (syncUpBatchSizeMultiplier >= 1.0) {
    unsigned int v7 = v5;
  }
  if (v7 <= 2) {
    return 2;
  }
  else {
    return v7;
  }
}

- (void)_decreaseSyncUpBatchSizeAfterError
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  [v4 modifyRecordsCountMultiplicativeDecrease];
  float v6 = v5;

  self->_float syncUpBatchSizeMultiplier = v6 * self->_syncUpBatchSizeMultiplier;
}

- (void)_increaseSyncUpBatchSizeAfterSuccess
{
  if (self->_syncUpBatchSizeMultiplier < 1.0)
  {
    id v3 = [(BRCClientZone *)self mangledID];
    id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
    [v4 modifyRecordsCountAdditiveIncreaseFraction];
    float v6 = v5;

    float v7 = v6 + self->_syncUpBatchSizeMultiplier;
    if (v7 > 1.0) {
      float v7 = 1.0;
    }
    self->_float syncUpBatchSizeMultiplier = v7;
  }
}

- (void)setNeedsSave:(BOOL)a3
{
  if (self->_needsSave != a3)
  {
    if (a3)
    {
      [(BRCPQLConnection *)self->_db forceBatchStart];
      float v5 = brc_bread_crumbs();
      float v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone setNeedsSave:]((uint64_t)self);
      }
    }
    self->_needsSave = a3;
  }
}

- (BOOL)enhancedDrivePrivacyEnabled
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  int v5 = [v4 supportsEnhancedDrivePrivacy];

  if (v5)
  {
    float v6 = [(BRCClientZone *)self mangledID];
    float v7 = +[BRCUserDefaults defaultsForMangledID:v6];
    char v8 = [v7 enhancedDrivePrivacyForced];

    if (v8) {
      LOBYTE(v9) = 1;
    }
    else {
      return ([(BRCClientZone *)self state] >> 22) & 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BRCClientZone)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  int v5 = [NSString stringWithUTF8String:"-[BRCClientZone init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v54.receiver = self;
  v54.super_class = (Class)BRCClientZone;
  char v17 = [(BRCClientZone *)&v54 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_isInitialCreation = v7;
    uint64_t v19 = [v16 clientDB];
    db = v18->_db;
    v18->_db = (BRCPQLConnection *)v19;

    objc_storeStrong((id *)&v18->_dbRowID, a4);
    objc_storeStrong((id *)&v18->_session, a6);
    objc_storeStrong((id *)&v18->_mangledID, a3);
    uint64_t v21 = [v13 appLibraryOrZoneName];
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v21;

    uint64_t v23 = [v13 ownerName];
    ownerName = v18->_ownerName;
    v18->_ownerName = (NSString *)v23;

    uint64_t v25 = brc_task_tracker_create("zone-tracker");
    taskTracker = v18->_taskTracker;
    v18->_taskTracker = (brc_task_tracker *)v25;

    int v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    syncDownDependencies = v18->_syncDownDependencies;
    v18->_syncDownDependencies = v27;

    v18->_shouldShowiCloudDriveAppInstallationNotification = 1;
    v18->_float syncUpBatchSizeMultiplier = 1.0;
    uint64_t v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    currentSyncDownBarriers = v18->_currentSyncDownBarriers;
    v18->_currentSyncDownBarriers = v29;

    uint64_t v31 = objc_opt_new();
    blockedOperationsOnInitialSync = v18->_blockedOperationsOnInitialSync;
    v18->_blockedOperationsOnInitialSync = (NSMutableArray *)v31;

    uint64_t v33 = objc_opt_new();
    runningListOperations = v18->_runningListOperations;
    v18->_runningListOperations = (NSMutableDictionary *)v33;

    uint64_t v35 = objc_opt_new();
    recursiveListOperations = v18->_recursiveListOperations;
    v18->_recursiveListOperations = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_opt_new();
    fetchParentOperations = v18->_fetchParentOperations;
    v18->_fetchParentOperations = (NSMutableDictionary *)v37;

    uint64_t v39 = objc_opt_new();
    locateRecordOperations = v18->_locateRecordOperations;
    v18->_locateRecordOperations = (NSMutableDictionary *)v39;

    uint64_t v41 = objc_opt_new();
    directoriesCreatedLastSyncUp = v18->_directoriesCreatedLastSyncUp;
    v18->_directoriesCreatedLastSyncUp = (NSMutableArray *)v41;

    uint64_t v43 = +[BRCUserDefaults defaultsForMangledID:v13];
    uint64_t v44 = [v43 serverStitchingThrottleParams];

    uint64_t v45 = [[BRCThrottle alloc] initWithName:@"server-stitching-throttle" andParameters:v44];
    serverStitchingOperationThrottle = v18->_serverStitchingOperationThrottle;
    v18->_serverStitchingOperationThrottle = v45;

    uint64_t v47 = +[BRCUserDefaults defaultsForMangledID:v13];
    id v48 = [v47 locateRecordsThrottleParams];

    uint64_t v49 = [[BRCThrottle alloc] initWithName:@"locate-records-throttle" andParameters:v48];
    locateRecordsOperationThrottle = v18->_locateRecordsOperationThrottle;
    v18->_locateRecordsOperationThrottle = v49;

    if (v7)
    {
      uint64_t v51 = objc_msgSend(MEMORY[0x263EFD780], "br_syncDownInitial");
      syncDownGroup = v18->_syncDownGroup;
      v18->_syncDownGroup = (CKOperationGroup *)v51;

      [(BRCClientZone *)v18 setNeedsSave:1];
    }
    else
    {
      [(BRCClientZone *)v18 updateWithPlist:v15];
    }
    [(BRCClientZone *)v18 _recreateSyncBudgetsAndThrottlesIfNeeded];
  }
  return v18;
}

- (void)dealloc
{
  if (self->_hasWorkDidUpdateObserver)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_hasWorkDidUpdateObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCClientZone;
  [(BRCClientZone *)&v4 dealloc];
}

- (NSMutableDictionary)plist
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:12];
  objc_super v4 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  int v5 = [NSNumber numberWithUnsignedLongLong:self->_requestID];
  [v3 setObject:v5 forKeyedSubscript:@"requestID"];

  float v6 = [NSNumber numberWithLongLong:self->_lastInsertedRank];
  [v3 setObject:v6 forKeyedSubscript:@"lastApplyRank"];

  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  if (appliedTombstoneRanks) {
    [v3 setObject:appliedTombstoneRanks forKeyedSubscript:@"appliedTombstoneRanks"];
  }
  syncUpThrottle = self->_syncUpThrottle;
  if (syncUpThrottle) {
    [v3 setObject:syncUpThrottle forKeyedSubscript:@"syncUpThrottle"];
  }
  syncUpBudget = self->_syncUpBudget;
  if (syncUpBudget) {
    [v3 setObject:syncUpBudget forKeyedSubscript:@"syncUpBudget"];
  }
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  if (syncUpBackoffRatio) {
    [v3 setObject:syncUpBackoffRatio forKeyedSubscript:@"syncUpBackoffRatio"];
  }
  syncDownThrottle = self->_syncDownThrottle;
  if (syncDownThrottle) {
    [v3 setObject:syncDownThrottle forKeyedSubscript:@"syncDownThrottle"];
  }
  lastSyncDownDate = self->_lastSyncDownDate;
  if (lastSyncDownDate) {
    [v3 setObject:lastSyncDownDate forKeyedSubscript:@"lastSyncDownDate"];
  }
  osNameRequiredToSync = self->_osNameRequiredToSync;
  if (osNameRequiredToSync) {
    [v3 setObject:osNameRequiredToSync forKeyedSubscript:@"osNameRequiredToSync"];
  }
  syncDownGroup = self->_syncDownGroup;
  if (syncDownGroup) {
    [v3 setObject:syncDownGroup forKeyedSubscript:@"syncDownGroup"];
  }
  appUninstalledDate = self->_appUninstalledDate;
  if (appUninstalledDate) {
    [v3 setObject:appUninstalledDate forKeyedSubscript:@"appUninstalledDate"];
  }
  return (NSMutableDictionary *)v3;
}

- (void)_recreateSyncBudgetsAndThrottlesIfNeeded
{
  if (!self->_syncUpThrottle)
  {
    id v3 = [[BRCSyncOperationThrottle alloc] initWithMangledID:self->_mangledID isSyncDown:0];
    syncUpThrottle = self->_syncUpThrottle;
    self->_syncUpThrottle = v3;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncDownThrottle)
  {
    int v5 = [[BRCSyncOperationThrottle alloc] initWithMangledID:self->_mangledID isSyncDown:1];
    syncDownThrottle = self->_syncDownThrottle;
    self->_syncDownThrottle = v5;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncUpBudget)
  {
    BOOL v7 = objc_alloc_init(BRCSyncBudgetThrottle);
    syncUpBudget = self->_syncUpBudget;
    self->_syncUpBudget = v7;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncUpBackoffRatio)
  {
    BOOL v9 = objc_alloc_init(BRCSyncOperationBackoffRatio);
    syncUpBackoffRatio = self->_syncUpBackoffRatio;
    self->_syncUpBackoffRatio = v9;

    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)updateWithPlist:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"state"];
  self->_state = [v5 unsignedIntValue];

  float v6 = [v4 objectForKeyedSubscript:@"requestID"];
  self->_requestID = [v6 unsignedLongLongValue];

  BOOL v7 = [v4 objectForKeyedSubscript:@"lastApplyRank"];
  self->_lastInsertedRanuint64_t k = [v7 longLongValue];

  char v8 = [v4 objectForKeyedSubscript:@"appliedTombstoneRanks"];
  BOOL v9 = (NSMutableIndexSet *)[v8 mutableCopy];
  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  self->_appliedTombstoneRanks = v9;

  __int16 v11 = [v4 objectForKeyedSubscript:@"syncUpThrottle"];
  syncUpThrottle = self->_syncUpThrottle;
  self->_syncUpThrottle = v11;

  id v13 = [v4 objectForKeyedSubscript:@"syncUpBudget"];
  syncUpBudget = self->_syncUpBudget;
  self->_syncUpBudget = v13;

  id v15 = [v4 objectForKeyedSubscript:@"syncUpBackoffRatio"];
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  self->_syncUpBackoffRatio = v15;

  char v17 = [v4 objectForKeyedSubscript:@"syncDownThrottle"];
  syncDownThrottle = self->_syncDownThrottle;
  self->_syncDownThrottle = v17;

  uint64_t v19 = [v4 objectForKeyedSubscript:@"lastSyncDownDate"];
  lastSyncDownDate = self->_lastSyncDownDate;
  self->_lastSyncDownDate = v19;

  uint64_t v21 = [v4 objectForKeyedSubscript:@"osNameRequiredToSync"];
  osNameRequiredToSync = self->_osNameRequiredToSync;
  self->_osNameRequiredToSync = v21;

  uint64_t v23 = [v4 objectForKeyedSubscript:@"syncDownGroup"];
  syncDownGroup = self->_syncDownGroup;
  self->_syncDownGroup = v23;

  uint64_t v25 = [v4 objectForKeyedSubscript:@"appUninstalledDate"];

  appUninstalledDate = self->_appUninstalledDate;
  self->_appUninstalledDate = v25;

  if (!self->_syncUpBudget || (int v27 = self->_syncUpThrottle) == 0 || !self->_syncDownThrottle)
  {
    id v28 = brc_bread_crumbs();
    uint64_t v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone updateWithPlist:]();
    }

    int v27 = self->_syncUpThrottle;
  }
  [(BRCSyncOperationThrottle *)v27 setMangledID:self->_mangledID];
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle setMangledID:self->_mangledID];
}

- (void)associateWithServerZone:(id)a3
{
}

- (void)associateWithServerZone:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  float v6 = (BRCServerZone *)a3;
  BOOL v7 = brc_bread_crumbs();
  char v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] associating %@ with %@%@", (uint8_t *)&v11, 0x20u);
  }

  serverZone = self->_serverZone;
  self->_serverZone = v6;
  id v10 = v6;

  [(BRCServerZone *)v10 activateWithClientZone:self offline:v4];
  if (v4) {
    self->_activated = 1;
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
}

void __23__BRCClientZone_resume__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2455D97F0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startSync];
}

uint64_t __23__BRCClientZone_resume__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecentAndFavoriteDocuments];
}

uint64_t __23__BRCClientZone_resume__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleZoneResetForUninstalledAppIfNecessary];
}

- (void)close
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _activated%@", v2, v3, v4, v5, v6);
}

uint64_t __22__BRCClientZone_close__block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancel];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 128));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cancel];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) deleteAllContentsOperation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancel];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
  [v5 stopMonitoringFaultingForZone:*(void *)(a1 + 32)];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint8_t v6 = [*(id *)(*(void *)(a1 + 32) + 208) allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        [v11 cancel];
        [*(id *)(a1 + 40) addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v8);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 200) allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        [v17 cancel];
        [*(id *)(a1 + 40) addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v14);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 216) allValues];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        [v23 cancel];
        [*(id *)(a1 + 40) addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v20);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 224) allValues];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v40 + 1) + 8 * m);
        [v29 cancel];
        [*(id *)(a1 + 40) addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v26);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 232));
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) cancel];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * n), "schedule", (void)v36);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v36 objects:v56 count:16];
    }
    while (v32);
  }

  return [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
}

void __22__BRCClientZone_close__block_invoke_68(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
  uint64_t v2 = [v1 appLibraries];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) close];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3
{
}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken != -1) {
    dispatch_once(&scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken, &__block_literal_global_30);
  }
  long long v8 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  long long v9 = [v8 resetReasonsToTriggerTTR];

  if ([v9 containsObject:v6])
  {
    long long v10 = [NSString stringWithFormat:@"Zone Reset: %@", v6];
    int v11 = [(BRCAccountSessionFPFS *)self->_session tapToRadarManager];
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorZoneReset");
    [v11 requestTapToRadarWithTitle:v10 description:v10 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:0 displayReason:@"it got to an invalid state" triggerRootCause:v12];
  }
  if (([(id)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC containsObject:v6] & 1) == 0)
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone scheduleResetServerAndClientTruthsForReason:completionHandler:]((uint64_t)v6);
    }
  }
  uint64_t v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs server and client truths reset: %@%@", buf, 0x16u);
  }

  uint64_t v17 = +[BRCEventsAnalytics sharedAnalytics];
  [v17 registerAndSendNewContainerResetWithOutcome:v6];

  id v18 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:self->_mangledID enhancedDrivePrivacyEnabled:[(BRCClientZone *)self enhancedDrivePrivacyEnabled] lastSyncDate:self->_lastSyncDownDate error:0 errorDescription:v6];
  uint64_t v19 = [(BRCAccountSessionFPFS *)self->_session analyticsReporter];
  [v19 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v18];

  [(BRCClientZone *)self scheduleReset:2 completionHandler:v7];
}

void __79__BRCClientZone_scheduleResetServerAndClientTruthsForReason_completionHandler___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"crash-recovery", @"ipc-com.apple.finder", @"CKErrorInternalContainerReset", @"CKErrorUserDeleteZone", @"CKErrorZoneNotFound", @"CKErrorSharedZoneNotFound", @"still-wants-data-unlinked", @"zone became healthy", @"start-scan", @"testing", 0);
  uint64_t v1 = (void *)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC;
  scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC = v0;
}

- (BOOL)handleZoneLevelErrorIfNeeded:(id)a3 forItemCreation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v28 = 0;
  id v29 = 0;
  int v7 = objc_msgSend(v6, "brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:", &v28);
  id v8 = v28;
  id v9 = v28;
  if (v7)
  {
    objc_storeStrong((id *)&self->_osNameRequiredToSync, v8);
    [(BRCClientZone *)self setStateBits:0x200000];
  }
  long long v10 = [(BRCClientZone *)self serverZone];
  char v11 = [v10 hasFetchedServerZoneState];

  if (((v11 & 1) != 0 || v4)
    && (uint64_t v12 = objc_msgSend(v6, "brc_containerResetErrorForSharedZone:resetReason:", -[BRCClientZone isSharedZone](self, "isSharedZone"), &v29)) != 0)
  {
    uint64_t v13 = v12;
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v13;
      __int16 v33 = 2112;
      uint64_t v34 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs reset - %lu%@", buf, 0x16u);
    }

    id v16 = +[BRCEventsAnalytics sharedAnalytics];
    [v16 registerAndSendNewContainerResetWithOutcome:v29];

    mangledID = self->_mangledID;
    BOOL v18 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled];
    id v19 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:mangledID enhancedDrivePrivacyEnabled:v18 lastSyncDate:self->_lastSyncDownDate error:v6 errorDescription:v29];
    uint64_t v20 = [(BRCAccountSessionFPFS *)self->_session analyticsReporter];
    [v20 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v19];

    [(BRCClientZone *)self scheduleReset:v13];
    BOOL v21 = 1;
  }
  else if (objc_msgSend(v6, "brc_isCloudKitErrorZoneMigrated"))
  {
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Server zone has been moved to cloud docs%@", buf, 0xCu);
    }

    sessiouint64_t n = self->_session;
    serverZone = self->_serverZone;
    BOOL v21 = 1;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&serverZone count:1];
    [(BRCAccountSessionFPFS *)session scheduleZoneMovesToCloudDocs:v19];
  }
  else
  {
    if (!objc_msgSend(v6, "brc_isCloudKitErrorNeedsPCSPrep"))
    {
      BOOL v21 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = brc_bread_crumbs();
    uint64_t v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v25;
      _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Server tells us we need to redo PCS prep%@", buf, 0xCu);
    }

    id v19 = [(BRCAccountSessionFPFS *)self->_session containerScheduler];
    [v19 redoZonePCSPreperation];
    BOOL v21 = 0;
  }

LABEL_18:
  return v21;
}

- (BOOL)handleSaltingErrorIfNeeded:(id)a3 record:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    BOOL v14 = 0;
    goto LABEL_34;
  }
  if ((objc_msgSend(v6, "brc_isCloudKitValidationKeyMismatchError") & 1) == 0
    && !objc_msgSend(v6, "brc_isStaleRecordUpdateError"))
  {
    id v58 = 0;
    int v15 = objc_msgSend(v6, "brc_isCloudKitParentValidationKeyMismatchErrorWithFieldName:", &v58);
    id v16 = v58;
    if (v15)
    {
      uint64_t v17 = brc_bread_crumbs();
      BOOL v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        id v62 = v7;
        __int16 v63 = 2112;
        id v64 = v16;
        __int16 v65 = 2112;
        id v66 = v6;
        __int16 v67 = 2112;
        long long v68 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered parent validation key error for record:%@ field:%@ error:%@%@", buf, 0x2Au);
      }

      id v19 = [v7 objectForKeyedSubscript:@"parent"];
      uint64_t v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        id v21 = [v7 parent];
      }
      uint64_t v34 = v21;

      uint64_t v35 = [v34 recordID];

      if (!v35)
      {
        long long v46 = brc_bread_crumbs();
        long long v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
          -[BRCClientZone handleSaltingErrorIfNeeded:record:]();
        }
      }
      long long v36 = [(BRCClientZone *)self db];
      long long v37 = [v36 serialQueue];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_107;
      v56[3] = &unk_26507ED98;
      v56[4] = self;
      id v57 = v34;
      id v25 = v34;
      dispatch_async(v37, v56);
    }
    else
    {
      id v55 = 0;
      __int16 v22 = [v7 recordID];
      uint64_t v23 = [v22 zoneID];
      int v24 = objc_msgSend(v6, "brc_isCloudKitHasUnsaltedChildrenWithUnsaltedRecord:zoneID:", &v55, v23);
      id v25 = v55;

      if (v24)
      {
        uint64_t v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          id v62 = v7;
          __int16 v63 = 2112;
          id v64 = v6;
          __int16 v65 = 2112;
          id v66 = v25;
          __int16 v67 = 2112;
          long long v68 = v26;
          _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered unsalted children error for record:%@ error:%@ unsalted-records:%@%@", buf, 0x2Au);
        }

        id v28 = [(BRCClientZone *)self db];
        id v29 = [v28 serialQueue];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_108;
        v52[3] = &unk_26507ED98;
        id v53 = v25;
        long long v54 = self;
        dispatch_async(v29, v52);

        id v30 = v53;
      }
      else
      {
        if (!objc_msgSend(v6, "brc_isCloudKitDestinationNeedsSalting"))
        {
          BOOL v14 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v31 = [v7 objectForKeyedSubscript:@"parent"];
        uint64_t v32 = v31;
        if (v31)
        {
          id v33 = v31;
        }
        else
        {
          id v33 = [v7 parent];
        }
        long long v38 = v33;

        long long v39 = brc_bread_crumbs();
        long long v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          long long v45 = [v38 recordID];
          *(_DWORD *)buf = 138412802;
          id v62 = v45;
          __int16 v63 = 2112;
          id v64 = v6;
          __int16 v65 = 2112;
          id v66 = v39;
          _os_log_debug_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered destination record:%@ should be salted error:%@%@", buf, 0x20u);
        }
        long long v41 = [v38 recordID];

        if (!v41)
        {
          long long v48 = brc_bread_crumbs();
          long long v49 = brc_default_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            -[BRCClientZone handleSaltingErrorIfNeeded:record:]();
          }
        }
        long long v42 = [(BRCClientZone *)self db];
        long long v43 = [v42 serialQueue];
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_109;
        v50[3] = &unk_26507ED98;
        v50[4] = self;
        id v51 = v38;
        id v30 = v38;
        dispatch_async(v43, v50);
      }
    }
    BOOL v14 = 1;
    goto LABEL_33;
  }
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v62 = v7;
    __int16 v63 = 2112;
    id v64 = v6;
    __int16 v65 = 2112;
    id v66 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered validation key error for record:%@ error:%@%@", buf, 0x20u);
  }

  long long v10 = [v7 recordID];
  if ((objc_msgSend(v10, "brc_isZoneRootRecordID") & 1) == 0)
  {
    char v11 = [v7 recordID];
    objc_msgSend(v11, "brc_isAppLibraryRootRecordID");
  }
  uint64_t v12 = [(BRCClientZone *)self db];
  uint64_t v13 = [v12 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke;
  block[3] = &unk_26507ED98;
  void block[4] = self;
  id v60 = v7;
  dispatch_async(v13, block);

  BOOL v14 = 1;
LABEL_34:

  return v14;
}

void __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) recordID];
  id v2 = (id)[v1 locateRecordIfNecessaryForRecordID:v3 isUserWaiting:0];
}

void __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_107(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) recordID];
  id v2 = (id)[v1 locateRecordIfNecessaryForRecordID:v3 isUserWaiting:0];
}

void __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_108(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "locateRecordIfNecessaryForRecordID:isUserWaiting:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __51__BRCClientZone_handleSaltingErrorIfNeeded_record___block_invoke_109(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) recordID];
  id v2 = (id)[v1 locateRecordIfNecessaryForRecordID:v3 isUserWaiting:0];
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesInZone
{
  [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND zone_rowid = %@ AND item_type IN (0, 9, 10)", self->_dbRowID];
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesParentedToZone
{
  [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND item_parent_zone_rowid = %@ AND zone_rowid != item_parent_zone_rowid AND item_type IN (0, 9, 10)", self->_dbRowID];
}

- (id)itemCountPendingUploadOrSyncUpAndReturnError:(id *)a3
{
  if (a3)
  {
    id v5 = *a3;
    *a3 = 0;
  }
  uint64_t v6 = [(BRCClientZone *)self db];
  id v7 = [(BRCServerZone *)self->_serverZone dbRowID];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke;
  v11[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
  v11[4] = a3;
  long long v8 = (void *)MEMORY[0x2455D9A50](v11);
  long long v9 = (void *)[v6 numberWithSQL:@"SELECT COUNT(1) FROM client_items WHERE item_localsyncupstate IN (3, 4) AND zone_rowid = %@  AND call_block(%p, version_upload_error, item_id)", v7, v8];

  return v9;
}

void __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  if (+[BRCItemID isDocumentsItemIDWithSQLiteValue:*(void *)(a4 + 8)])
  {
    sqlite3_result_int(a2, 0);
  }
  else
  {
    id v7 = *(id **)(a1 + 32);
    checkErrorIsRetriable(a2, (sqlite3_value **)a4, v7);
  }
}

- (id)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(id *)a3
{
  if ([(BRCClientZone *)self isSyncBlocked])
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone sizeOfItemsNeedingSyncUpOrUploadAndReturnError:]((uint64_t)self);
    }
    id v7 = 0;
    goto LABEL_7;
  }
  id v5 = [(BRCClientZone *)self itemCountPendingUploadOrSyncUpAndReturnError:a3];
  if ([v5 intValue])
  {
    long long v8 = [(BRCClientZone *)self db];
    long long v9 = [(BRCServerZone *)self->_serverZone dbRowID];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke;
    v14[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    v14[4] = a3;
    long long v10 = (void *)MEMORY[0x2455D9A50](v14);
    uint64_t v6 = [v8 numberWithSQL:@"SELECT SUM(version_size) FROM client_items WHERE item_localsyncupstate IN (3, 4)   AND zone_rowid = %@   AND call_block(%p, version_upload_error)", v9, v10];

    uint64_t v11 = [v6 integerValue];
    uint64_t v12 = [v5 integerValue];
    id v7 = [NSNumber numberWithInteger:v11 + 100 * v12];
LABEL_7:

    goto LABEL_8;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

void __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
}

- (void)beginSyncBubbleActivityIfNecessary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (self->_bubbleSyncTask)
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      bubbleSyncTasuint64_t k = self->_bubbleSyncTask;
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = (uint64_t)bubbleSyncTask;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - We already have a bubble sync task %@%@", buf, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
  id v3 = [(BRCClientZone *)self sizeOfItemsNeedingSyncUpOrUploadAndReturnError:0];
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x263F841D8];
    id v7 = [NSString stringWithFormat:@"Still %@ bytes need to sync to the server", v3];
    long long v8 = [v6 taskWithName:@"com.apple.bird.uploads" reason:v7 forBundleID:self->_zoneName];

    long long v9 = brc_bread_crumbs();
    long long v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = [v3 unsignedLongLongValue];
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - shared iPad: needs to sync items in the sync bubble (sz:%llu)%@", buf, 0x20u);
    }

    objc_msgSend(v8, "setContentSize:", objc_msgSend(v3, "unsignedIntegerValue"));
    [v8 begin];
    uint64_t v4 = self->_bubbleSyncTask;
    self->_bubbleSyncTasuint64_t k = (UMUserSyncTask *)v8;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)registerAllItemsDidUploadTracker:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v9 = 0;
  id v5 = [(BRCClientZone *)self sizeOfItemsNeedingSyncUpOrUploadAndReturnError:&v9];
  if (v5)
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    if (!allItemsDidUploadTrackers)
    {
      id v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      long long v8 = self->_allItemsDidUploadTrackers;
      self->_allItemsDidUploadTrackers = v7;

      allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    }
    [(NSMutableArray *)allItemsDidUploadTrackers addObject:v4];
  }
  else
  {
    [v4 clientZone:self didFinishUploadingAllItemsWithError:v9];
  }
}

- (void)unregisterAllItemsDidUploadTracker:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableArray *)self->_allItemsDidUploadTrackers removeObject:v5];

  if (![(NSMutableArray *)self->_allItemsDidUploadTrackers count])
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;
  }
}

- (BOOL)isCloudDocsZone
{
  BOOL v3 = [(BRCClientZone *)self isPrivateZone];
  if (v3)
  {
    zoneName = self->_zoneName;
    uint64_t v5 = *MEMORY[0x263F324E8];
    LOBYTE(v3) = [(NSString *)zoneName isEqualToString:v5];
  }
  return v3;
}

- (void)disconnectNSMDQListenerAsync
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┣%llx disconnecting listener so that they gather again%@");
}

void __45__BRCClientZone_disconnectNSMDQListenerAsync__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx disconnected NSMDQ listeners for %@%@", buf, 0x20u);
  }

  __brc_leave_section((uint64_t *)&v5);
}

- (BOOL)isForeground
{
  id v2 = [(BRCClientZone *)self serverZone];
  BOOL v3 = [v2 metadataSyncContextIfExists];
  char v4 = [v3 isForeground];

  return v4;
}

- (void)_forDBUpgrade_setStateBits:(unsigned int)a3 clearStateBits:(unsigned int)a4
{
  unsigned int state = self->_state;
  unsigned int v5 = (state | a3) & ~a4;
  if (state != v5)
  {
    [(BRCClientZone *)self setNeedsSave:1];
    self->_unsigned int state = v5;
  }
}

- (void)_fixupEnhancedDrivePrivacyState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCClientZone *)self mangledID];
  char v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  unsigned int v5 = v4;
  unsigned int state = self->_state;
  if ((state & 0x400000) != 0)
  {
    if (![v4 supportsEnhancedDrivePrivacy])
    {
      uint64_t v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        uint64_t v13 = v3;
        __int16 v14 = 2112;
        __int16 v15 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Stripping enhanced drive privacy bit because it's not supported on %@%@", (uint8_t *)&v12, 0x16u);
      }

      unsigned int v9 = self->_state & 0xFFBFFFFF;
      goto LABEL_13;
    }
    unsigned int state = self->_state;
  }
  if ((state & 0x400000) == 0
    && [v5 supportsEnhancedDrivePrivacy]
    && [v5 enhancedDrivePrivacyForced])
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      __int16 v15 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Adding enhanced drive privacy bit because it's forced on %@%@", (uint8_t *)&v12, 0x16u);
    }

    unsigned int v9 = self->_state | 0x400000;
LABEL_13:
    self->_unsigned int state = v9;
    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)_scheduleZoneResetForUninstalledAppIfNecessary
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!self->_resetAfterAppUninstallTimer && (self->_state & 0x1000) != 0)
  {
    if ([(BRCClientZone *)self isPrivateZone])
    {
      BOOL v3 = [(BRCClientZone *)self db];
      char v4 = [(BRCClientZone *)self dbRowID];
      unsigned int v5 = (void *)[v3 numberWithSQL:@"SELECT 1 FROM client_items ci WHERE ci.zone_rowid = %@ AND NOT item_id_is_documents(ci.item_id)", v4];

      if (v5)
      {
        if (!self->_appUninstalledDate)
        {
          uint64_t v6 = [MEMORY[0x263EFF910] now];
          appUninstalledDate = self->_appUninstalledDate;
          self->_appUninstalledDate = v6;

          [(BRCClientZone *)self setNeedsSave:1];
        }
        uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
        [v8 zoneAutoResetDelayInSecAfterAppUninstall];
        double v10 = v9;
        __int16 v11 = [MEMORY[0x263EFF910] now];
        [v11 timeIntervalSinceDate:self->_appUninstalledDate];
        double v13 = v10 - v12;

        if (v13 <= 0.0)
        {
          [(BRCClientZone *)self scheduleReset:3];
        }
        else
        {
          __int16 v14 = brc_bread_crumbs();
          __int16 v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [(BRCClientZone *)self zoneName];
            *(_DWORD *)locatiouint64_t n = 134218498;
            *(double *)&location[4] = v13;
            __int16 v24 = 2112;
            id v25 = v20;
            __int16 v26 = 2112;
            uint64_t v27 = v14;
            _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] schedule zone reset timer to run after %f sec for %@%@", location, 0x20u);
          }
          objc_initWeak((id *)location, self);
          id v16 = objc_alloc(MEMORY[0x263F32648]);
          uint64_t v17 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke;
          v21[3] = &unk_265080790;
          objc_copyWeak(&v22, (id *)location);
          BOOL v18 = (BRTimer *)[v16 initWithName:@"zone-auto-reset" interval:v17 callbackQueue:v21 block:v13];
          resetAfterAppUninstallTimer = self->_resetAfterAppUninstallTimer;
          self->_resetAfterAppUninstallTimer = v18;

          [(BRTimer *)self->_resetAfterAppUninstallTimer start];
          objc_destroyWeak(&v22);
          objc_destroyWeak((id *)location);
        }
      }
    }
  }
}

uint64_t __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if ((*((unsigned char *)WeakRetained + 73) & 0x10) != 0)
    {
      BOOL v3 = brc_bread_crumbs();
      char v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_2();
      }

      [v2 scheduleReset:3];
    }
    unsigned int v5 = (void *)v2[58];
    v2[58] = 0;
  }
  else
  {
    unsigned int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_1();
    }
  }
  return 0;
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self _fixupEnhancedDrivePrivacyState];
  if (self->_state != a3)
  {
    [(BRCClientZone *)self setNeedsSave:1];
    self->_unsigned int state = a3;
  }
  if ((a3 & 0x100) != 0)
  {
    a3 &= ~0x10u;
    self->_unsigned int state = a3;
  }
  unsigned int v7 = a3 ^ a4;
  if (v7)
  {
    if (self->_needsSave)
    {
      uint64_t v8 = brc_bread_crumbs();
      double v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&local_container_state_entries, 0);
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = self;
        __int16 v32 = 2112;
        id v33 = v27;
        __int16 v34 = 2112;
        uint64_t v35 = v8;
        _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);
      }
    }
    if ((v7 & 0x200000) != 0)
    {
      if ((self->_state & 0x200000) != 0)
      {
        [(BRCClientZone *)self disconnectNSMDQListenerAsync];
      }
      else
      {
        osNameRequiredToSync = self->_osNameRequiredToSync;
        self->_osNameRequiredToSync = 0;
      }
    }
    unsigned int v11 = self->_state & 0x201000;
    if ((a4 & 0x201000) != v11)
    {
      if (v11)
      {
        double v12 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        [v12 deleteJobsMatching:self->_serverZone];

        if ((a4 & 0x1000) == 0 && (self->_state & 0x1000) != 0 && [(BRCClientZone *)self isPrivateZone])
        {
          double v13 = [MEMORY[0x263EFF910] now];
          appUninstalledDate = self->_appUninstalledDate;
          self->_appUninstalledDate = v13;

          [(BRCClientZone *)self setNeedsSave:1];
          [(BRCClientZone *)self _scheduleZoneResetForUninstalledAppIfNecessary];
        }
      }
      else
      {
        if (self->_resetAfterAppUninstallTimer)
        {
          __int16 v15 = brc_bread_crumbs();
          id v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[BRCClientZone _activateState:origState:]();
          }

          [(BRTimer *)self->_resetAfterAppUninstallTimer stop];
          resetAfterAppUninstallTimer = self->_resetAfterAppUninstallTimer;
          self->_resetAfterAppUninstallTimer = 0;
        }
        BOOL v18 = self->_appUninstalledDate;
        self->_appUninstalledDate = 0;

        [(BRCClientZone *)self setNeedsSave:1];
        id v19 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        [v19 repopulateJobsForZone:self->_serverZone];

        [(BRCClientZone *)self scheduleSyncDown];
        [(BRCClientZone *)self scheduleSyncUp];
      }
    }
    if ((v7 & 0x400000) != 0)
    {
      uint64_t v20 = self->_session;
      if ([(BRCClientZone *)self isCloudDocsZone])
      {
        sessiouint64_t n = self->_session;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __42__BRCClientZone__activateState_origState___block_invoke;
        uint64_t v28[3] = &unk_26507FB18;
        id v29 = v20;
        [(BRCAccountSessionFPFS *)session enumeratePrivateClientZones:v28];
        id v22 = v29;
      }
      else
      {
        if (![(BRCClientZone *)self isPrivateZone])
        {
LABEL_31:
          if ([(BRCClientZone *)self isPrivateZone]) {
            [(BRCClientZone *)self _bumpNotificationRankOnTopLevelFolderSharesParentedToZone];
          }
          else {
            [(BRCClientZone *)self _bumpNotificationRankOnTopLevelFolderSharesInZone];
          }

          goto LABEL_35;
        }
        uint64_t v23 = [(BRCClientZone *)self asPrivateClientZone];
        __int16 v24 = [v23 defaultAppLibrary];
        id v22 = [v24 documentsFolderItemID];

        id v25 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v22];
        [(BRCAccountSessionFPFS *)v20 bumpNotificationRankOnItemGlobalID:v25];
      }
      goto LABEL_31;
    }
  }
LABEL_35:
  [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
  return v7;
}

uint64_t __42__BRCClientZone__activateState_origState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 defaultAppLibrary];
  unsigned int v5 = [v4 documentsFolderItemID];

  uint64_t v6 = [BRCItemGlobalID alloc];
  unsigned int v7 = [v3 dbRowID];

  uint64_t v8 = [(BRCItemGlobalID *)v6 initWithZoneRowID:v7 itemID:v5];
  [*(id *)(a1 + 32) bumpNotificationRankOnItemGlobalID:v8];

  return 1;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state = self->_state;
  BOOL v4 = (a3 & ~state) != 0;
  -[BRCClientZone _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
}

- (BOOL)isSyncBlocked
{
  if (([(BRCClientZone *)self state] & 0x201000) != 0) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(BRCServerZone *)self->_serverZone state] >> 1) & 1;
  }
  return v3;
}

- (BOOL)isSyncBlockedBecauseAppNotInstalled
{
  return ([(BRCClientZone *)self state] >> 12) & 1;
}

- (BOOL)isSyncBlockedBecauseOSNeedsUpgrade
{
  return ([(BRCClientZone *)self state] >> 21) & 1;
}

- (BOOL)isEqualToClientZone:(id)a3
{
  BOOL v4 = a3;
  unsigned int v5 = [v4 mangledID];
  if (v5) {
    char v6 = [(BRMangledID *)self->_mangledID isEqualToMangledID:v4[7]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BRMangledID *)self->_mangledID hash];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (BRCClientZone *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRCClientZone *)self isEqualToClientZone:v4];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCClientZone *)self descriptionWithContext:0];
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCServerZone *)self->_serverZone changeState];
  if ([(BRCClientZone *)self isForeground])
  {
    char v6 = @"foreground";
    uint64_t v7 = 7;
  }
  else
  {
    char v6 = @"background";
    uint64_t v7 = 2;
  }
  uint64_t v8 = +[BRCDumpContext highlightedString:v6 type:v7 context:v4];
  id v17 = [NSString alloc];
  mangledID = self->_mangledID;
  dbRowID = self->_dbRowID;
  unsigned int v11 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&local_container_state_entries, v4);
  double v12 = BRCServerZoneStatePrettyPrintWithContext([(BRCServerZone *)self->_serverZone state], v4);
  if ([(BRCClientZone *)self syncState])
  {
    BRCPrettyPrintBitmap();
    double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v13 = @"idle";
  }
  __int16 v14 = [v5 descriptionWithContext:v4];
  __int16 v15 = (void *)[v17 initWithFormat:@"<%@[%@] %@ {client:%@ server:%@ sync:%@ %@ rid:%llu appuninstalled:%@}>", mangledID, dbRowID, v8, v11, v12, v13, v14, self->_requestID, self->_appUninstalledDate];

  return v15;
}

- (id)itemByDocumentID:(unsigned int)a3
{
  return [(BRCClientZone *)self itemByDocumentID:*(void *)&a3 db:self->_db];
}

- (id)itemByDocumentID:(unsigned int)a3 db:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__BRCClientZone_itemByDocumentID_db___block_invoke;
  v11[3] = &unk_26507F210;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  double v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@) AND item_doc_id = %u   AND +item_state IN (0)   AND +item_type IN (1, 2, 8, 6, 7)", dbRowID, dbRowID, v4 sql];

  return v9;
}

id __37__BRCClientZone_itemByDocumentID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByFileID:(unint64_t)a3
{
  return [(BRCClientZone *)self itemByFileID:a3 db:self->_db];
}

- (id)itemByFileID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__BRCClientZone_itemByFileID_db___block_invoke;
  v11[3] = &unk_26507F210;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  double v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items  WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@)     AND item_file_id = %lld    AND item_state IN (0)", dbRowID, dbRowID, a3 sql];

  return v9;
}

id __33__BRCClientZone_itemByFileID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self serverItemByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  BOOL v5 = (void *)[a5 fetchObject:v7, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", a3, a4, self->_dbRowID sql];
  return v5;
}

id __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  uint64_t v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self itemByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@  AND item_parent_zone_rowid = %@        AND item_bouncedname IS NULL)   OR  (item_parent_id = %@ AND item_bouncedname = %@ AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke;
    v19[3] = &unk_26507F210;
    v19[4] = self;
    id v20 = v10;
    id v12 = [v11 object:v19];
    if ([v11 next])
    {
      double v13 = brc_bread_crumbs();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = dbRowID;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = v12;
  }
  else
  {
    id v16 = [MEMORY[0x263F087E8] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v16];

    id v15 = 0;
  }

  return v15;
}

id __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@        AND item_localname IS NULL)   OR  (item_parent_id = %@ AND item_localname = %@ AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke;
    v19[3] = &unk_26507F210;
    v19[4] = self;
    id v20 = v10;
    id v12 = [v11 object:v19];
    if ([v11 next])
    {
      double v13 = brc_bread_crumbs();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = dbRowID;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = v12;
  }
  else
  {
    id v16 = [MEMORY[0x263F087E8] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v16];

    id v15 = 0;
  }

  return v15;
}

id __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4
{
  return [(BRCClientZone *)self itemByParentID:a3 andPhysicalName:a4 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 excludingItemID:a5 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 excludingItemID:0 db:a5];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5 db:(id)a6
{
  if (a5)
  {
    unsigned int v11 = (void *)MEMORY[0x263F8C710];
    id v12 = a6;
    id v13 = a4;
    id v14 = a3;
    [v11 formatInjection:@"AND item_id != %@", a5];
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F8C720];
    id v16 = a6;
    id v17 = a4;
    id v18 = a3;
    [v15 rawInjection:"" length:0];
  id v19 = };
  id v20 = (void *)[a6 numberWithSQL:@"SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ AND item_parent_zone_rowid = %@)) AND item_state != 1 %@ LIMIT 1", a3, a4, self->_dbRowID, a3, a4, self->_dbRowID, v19];

  char v21 = [v20 BOOLValue];
  return v21;
}

- (BOOL)existsByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4
{
  id v4 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@)) AND item_state != 1 LIMIT 1", a3, a4, self->_dbRowID, a3, a4, self->_dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (char)serverItemTypeByItemID:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSharedZoneRoot])
  {
    char v8 = 4;
  }
  else if ([v6 isNonDesktopRoot])
  {
    sessiouint64_t n = self->_session;
    id v10 = [v6 appLibraryRowID];
    unsigned int v11 = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v10];
    int v12 = [v11 state];

    if ((v12 & 0x2000000) != 0) {
      char v8 = 4;
    }
    else {
      char v8 = 9;
    }
  }
  else
  {
    id v13 = [(BRCClientZone *)self dbRowID];
    id v14 = (void *)[v7 numberWithSQL:@"SELECT item_type FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v6, v13];

    if (v14)
    {
      char v8 = [v14 integerValue];
    }
    else if ([v6 isDocumentsFolder])
    {
      id v15 = self->_session;
      id v16 = [v6 appLibraryRowID];
      id v17 = [(BRCAccountSessionFPFS *)v15 appLibraryByRowID:v16];
      int v18 = [v17 state];

      if ((v18 & 0x4000000) != 0) {
        char v8 = 0;
      }
      else {
        char v8 = 9;
      }
    }
    else
    {
      char v8 = -1;
    }
  }
  return v8;
}

- (id)itemsEnumeratorWithDB:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[v4 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@", self->_dbRowID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke;
  v9[3] = &unk_26507F210;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 enumerateObjects:v9];

  return v7;
}

id __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (BOOL)hasItems
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items WHERE zone_rowid = %@ LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)itemsWithInFlightDiffsEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0", self->_dbRowID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (BOOL)hasItemsWithInFlightDiffs
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0 LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)documentsNotIdleEnumeratorWithStartingRowID:(unint64_t)a3 batchSize:(unint64_t)a4
{
  id v5 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@    AND item_type IN (1, 6)    AND (item_localsyncupstate IN(      3,        4))   AND item_scope = 2   AND rowid > %lld ORDER BY rowid ASC LIMIT %lld", self->_dbRowID, a3, a4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke;
  v8[3] = &unk_26507F1E8;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)enumerateFaultsAsyncWithBlock:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BRCClientZone *)self taskTracker];
  char v8 = [(BRCClientZone *)self db];
  id v9 = [v8 serialQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke;
  v11[3] = &unk_265082968;
  v11[4] = self;
  id v12 = v6;
  unint64_t v13 = a4;
  id v10 = v6;
  brc_task_tracker_async_with_logs(v7, v9, v11, &__block_literal_global_203);
}

uint64_t __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateFaultsWithBlock:*(void *)(a1 + 40) rowID:0 batchSize:*(void *)(a1 + 48)];
}

- (void)_enumerateFaultsWithBlock:(id)a3 rowID:(unint64_t)a4 batchSize:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v8 = (unsigned int (**)(id, void *))a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = self;
  unint64_t v21 = a5;
  id v9 = [(BRCClientZone *)self _faultsEnumeratorFromRow:a4 batchSize:a5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12 + v11;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        if (!v8[2](v8, v16))
        {
          uint64_t v15 = v12 + v14;
          goto LABEL_12;
        }
        a4 = [v16 dbRowID];
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v12 = v15;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_12:

  if (v15 == v21)
  {
    id v17 = [(BRCClientZone *)v20 taskTracker];
    int v18 = [(BRCClientZone *)v20 db];
    id v19 = [v18 serialQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke;
    v22[3] = &unk_265082990;
    v22[4] = v20;
    __int16 v23 = v8;
    unint64_t v24 = a4;
    unint64_t v25 = v21;
    brc_task_tracker_async_with_logs(v17, v19, v22, &__block_literal_global_205);
  }
}

uint64_t __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateFaultsWithBlock:*(void *)(a1 + 40) rowID:*(void *)(a1 + 48) batchSize:*(void *)(a1 + 56)];
}

- (id)_faultsEnumeratorFromRow:(unint64_t)a3 batchSize:(unint64_t)a4
{
  dbRowID = self->_dbRowID;
  char v8 = self->_db;
  id v9 = [(BRCPQLConnection *)v8 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@    AND rowid > %llu   AND item_type = 2 ORDER BY rowid LIMIT %lu", dbRowID, a3, a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke;
  v12[3] = &unk_26507F1E8;
  v12[4] = self;
  uint64_t v10 = [v9 enumerateObjects:v12];

  return v10;
}

id __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)didClearOutOfQuota
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: updated sync-up throttle: %@%@");
}

- (unsigned)syncState
{
  return atomic_load_explicit((atomic_uint *volatile)&self->_syncState, memory_order_acquire);
}

- (void)setSyncStateBits:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v5 = [(BRCClientZone *)self isSyncBlocked];
  if ((a3 & 3) != 0 && v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone setSyncStateBits:]();
    }

    [(BRCClientZone *)self clearSyncStateBits:3];
    a3 &= 0xFFFFFFFC;
  }
  unsigned int v8 = atomic_fetch_or((atomic_uint *volatile)&self->_syncState, a3);
  char v9 = v8 | a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (v8 != (v8 | a3))
  {
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v8)
      {
        BRCPrettyPrintBitmap();
        unint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v21 = @"idle";
      }
      int v22 = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2112;
      unint64_t v25 = v21;
      __int16 v26 = 2112;
      long long v27 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] sync state changed: %@, was %@%@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v12 = (void *)MEMORY[0x263F32588];
    mangledID = self->_mangledID;
    uint64_t v14 = *MEMORY[0x263F32368];
    if (((v8 | a3) & 0xA) != 0) {
      unsigned int v15 = (2 * ((v9 & 5) != 0)) | 4;
    }
    else {
      unsigned int v15 = 2 * ((v9 & 5) != 0);
    }
    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    id v17 = [NSNumber numberWithUnsignedInt:v16];
    [v12 postContainerStatusChangeNotificationWithID:mangledID key:v14 value:v17];
  }
  if ((v8 & 0xF) == 0 && (v9 & 0xF) != 0) {
    [(BRCClientZone *)self setStateBits:16];
  }
  if ((v8 & 0x20) != 0 || ((v8 | a3) & 0x20) == 0)
  {
    if ((v9 & 0x23) == 1)
    {
      id v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone setSyncStateBits:]();
      }

      [(BRCClientZone *)self setSyncStateBits:2];
    }
  }
  else
  {
    [(BRCClientZoneDelegate *)self->_delegate didInitialSyncDownForClientZone:self];
  }
  if ((a3 & ~v8 & 3) != 0) {
    [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
  }
  [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
}

- (void)clearSyncStateBits:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v4 = atomic_fetch_and((atomic_uint *volatile)&self->_syncState, ~a3);
  unsigned int v5 = v4 & ~a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (v4 != v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (v4)
      {
        BRCPrettyPrintBitmap();
        unsigned int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned int v15 = @"idle";
      }
      int v16 = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v15;
      __int16 v20 = 2112;
      unint64_t v21 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ sync state changed, was %@%@", (uint8_t *)&v16, 0x20u);
    }
    unsigned int v8 = (void *)MEMORY[0x263F32588];
    mangledID = self->_mangledID;
    uint64_t v10 = *MEMORY[0x263F32368];
    if ((v5 & 0xA) != 0) {
      unsigned int v11 = (2 * ((v5 & 5) != 0)) | 4;
    }
    else {
      unsigned int v11 = 2 * ((v5 & 5) != 0);
    }
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = [NSNumber numberWithUnsignedInt:v12];
    [v8 postContainerStatusChangeNotificationWithID:mangledID key:v10 value:v13];
  }
  if ((v4 & 0xF) != 0 && (v5 & 0xF) == 0) {
    [(BRCClientZone *)self clearStateBits:16];
  }
}

- (void)addSyncDownDependency:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 completionBlock];
  objc_initWeak(&location, v4);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke;
  v12[3] = &unk_2650829B8;
  id v6 = v5;
  v12[4] = self;
  id v13 = v6;
  objc_copyWeak(&v14, &location);
  [v4 setCompletionBlock:v12];
  id v7 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  unsigned int v8 = [v7 serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke_2;
  v10[3] = &unk_26507ED98;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __39__BRCClientZone_addSyncDownDependency___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeSyncDownDependency:WeakRetained];
}

void __39__BRCClientZone_addSyncDownDependency___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 416) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = brc_bread_crumbs();
  char v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] added %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)addOutOfBandOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 completionBlock];
  objc_initWeak(&location, v4);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke;
  v12[3] = &unk_2650829B8;
  id v6 = v5;
  v12[4] = self;
  id v13 = v6;
  objc_copyWeak(&v14, &location);
  [v4 setCompletionBlock:v12];
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  __int16 v8 = [v7 serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke_2;
  v10[3] = &unk_26507ED98;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeOutOfBandOperation:WeakRetained];
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) addObject:*(void *)(a1 + 40)];
  os_log_t v1 = brc_bread_crumbs();
  uint64_t v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1();
  }
}

- (void)removeOutOfBandOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  id v6 = [v5 serialQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeOutOfBandOperation___block_invoke;
  v8[3] = &unk_26507ED98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) removeObject:*(void *)(a1 + 40)];
  os_log_t v1 = brc_bread_crumbs();
  uint64_t v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1();
  }
}

- (void)_cancelOutOfBandOperations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  char v3 = self->_outOfBandSyncOperations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeSyncDownDependency:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeSyncDownDependency___block_invoke;
  v8[3] = &unk_26507ED98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__BRCClientZone_removeSyncDownDependency___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 416) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = brc_bread_crumbs();
  char v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    long long v11 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }
}

- (id)syncDownImmediately
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCClientZone syncDownImmediately]", 1740, v34);
  char v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v34[0];
    int v6 = [(BRCClientZone *)self mangledID];
    *(_DWORD *)buf = 134218498;
    uint64_t v37 = v5;
    __int16 v38 = 2112;
    long long v39 = v6;
    __int16 v40 = 2112;
    long long v41 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@: starting sync down%@", buf, 0x20u);
  }
  if (self->_activated)
  {
    uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session serverState];
    mangledID = self->_mangledID;
    id v33 = 0;
    uint64_t v28 = [v7 migrationQueryKeyForMangledID:mangledID continuationCursor:&v33];
    id v27 = v33;

    uint64_t v9 = self;
    objc_sync_enter(v9);
    if (v28) {
      __int16 v10 = [[BRCMigrationQueryOperation alloc] initWithServerZone:v9->_serverZone migrationKey:v28 continuationCursor:v27 sessionContext:self->_session];
    }
    else {
      __int16 v10 = [[BRCSyncDownOperation alloc] initDeltaSyncWithServerZone:v9->_serverZone sessionContext:self->_session];
    }
    syncDownOperatiouint64_t n = v9->_syncDownOperation;
    v9->_syncDownOperatiouint64_t n = &v10->super;

    [(BRCClientZone *)v9 _blockSyncDownOnStitchingOperations];
    objc_sync_exit(v9);

    if (v9->_syncDownGroup)
    {
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:");
    }
    else
    {
      if ([(BRCServerZone *)v9->_serverZone hasFetchedServerZoneState]) {
        objc_msgSend(MEMORY[0x263EFD780], "br_syncDown");
      }
      else {
      id v14 = objc_msgSend(MEMORY[0x263EFD780], "br_syncDownInitial");
      }
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:", v14, v27);
    }
    if (v28)
    {
      syncDownGroup = v9->_syncDownGroup;
      v9->_syncDownGroup = 0;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v16 = v9->_syncDownDependencies;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v30;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * v19);
          unint64_t v21 = brc_bread_crumbs();
          uint64_t v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v20;
            __int16 v38 = 2112;
            long long v39 = v21;
            _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] adding sync down dependency: %@%@", buf, 0x16u);
          }

          [(_BRCOperation *)v9->_syncDownOperation addDependency:v20];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v17);
    }

    [(NSMutableArray *)v9->_currentSyncDownBarriers addObjectsFromArray:v9->_nextSyncDownBarriers];
    [(NSMutableArray *)v9->_nextSyncDownBarriers removeAllObjects];
    [(BRCClientZone *)v9 setSyncStateBits:8];
    [(BRCClientZone *)v9 clearSyncStateBits:2];
    [(BRCSyncOperationThrottle *)v9->_syncDownThrottle updateAfterSchedulingTask];
    __int16 v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone syncDownImmediately]();
    }

    [(BRCClientZone *)v9 _cancelOutOfBandOperations];
    [(_BRCOperation *)v9->_syncDownOperation schedule];
    unint64_t v25 = v9->_syncDownOperation;
    v9->_syncDeadlineSourceResumer = v25;
    uint64_t v12 = v25;
    long long v11 = v28;
  }
  else
  {
    brc_bread_crumbs();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone syncDownImmediately]();
    }
    uint64_t v12 = 0;
  }

  __brc_leave_section(v34);
  return v12;
}

- (unsigned)_appLibrariesState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(BRCClientZone *)self isPrivateZone]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = [(BRCClientZone *)self asPrivateClientZone];
  uint64_t v4 = [v3 appLibraries];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) state];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (void)_startSync
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _syncDownOperation == nil%@", v2, v3, v4, v5, v6);
}

BOOL __27__BRCClientZone__startSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  brc_current_date_nsec();
  unint64_t v29 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint8_t v6 = *(void **)(v4 + 8);
  uint64_t v5 = *(void *)(v4 + 16);
  unsigned int v7 = [v6 syncUpScheduler];
  LODWORD(v8) = *(_DWORD *)(a1 + 64);
  uint64_t v9 = +[BRCSyncUpOperation syncUpOperationForZone:v5 sessionContext:v6 syncUpCallback:v7 maxCost:&v29 retryAfter:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  long long v12 = objc_msgSend(MEMORY[0x263EFD780], "br_syncUp");
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGroup:v12];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  brc_current_date_nsec();
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104);
  if (v13)
  {
    long long v14 = brc_bread_crumbs();
    unsigned int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __27__BRCClientZone__startSync__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setSyncStateBits:4];
    objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __27__BRCClientZone__startSync__block_invoke_213;
    v25[3] = &unk_265082A08;
    objc_copyWeak(&v27, &location);
    v25[4] = *(void *)(a1 + 32);
    id v16 = v3;
    id v26 = v16;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSyncUpCompletionBlock:v25];
    [v16 forceBatchStart];
    [v16 makeNextFlushFullSync];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v29 < 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = brc_bread_crumbs();
      unint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __27__BRCClientZone__startSync__block_invoke_cold_3();
      }

      uint64_t v19 = v29 + *(void *)(a1 + 56);
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __27__BRCClientZone__startSync__block_invoke_cold_2();
      }

      [*(id *)(a1 + 32) clearSyncStateBits:1];
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *(void *)(*(void *)(a1 + 32) + 88) = v19;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 152);
    brc_interval_from_nsec();
    [v22 updateAfterSchedulingTaskWithMinimumDelay:v23 * 10.0];
  }

  return v13 != 0;
}

void __27__BRCClientZone__startSync__block_invoke_213(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v11 = WeakRetained;
  if (WeakRetained)
  {
    id v25 = v7;
    long long v12 = [WeakRetained createdAppLibraryNames];
    char v24 = [v11 encounteredErrorOnPCSChainedItem];
    char v13 = [v11 throttledItemInBatch];
    int v14 = objc_msgSend(v9, "brc_isCloudKitOutOfQuota");
    unsigned int v15 = [*(id *)(*(void *)(a1 + 32) + 8) fsUploader];
    id v16 = [*(id *)(a1 + 32) serverZone];
    uint64_t v17 = [v16 ownerName];
    if (v14) {
      [v15 ownerDidReceiveOutOfQuotaError:v17];
    }
    else {
      [v15 scheduleQuotaFetchIfNeededForOwner:v17];
    }

    id v7 = v25;
    char v18 = v24;
  }
  else
  {
    char v18 = 0;
    char v13 = 0;
    long long v12 = 0;
  }
  uint64_t v19 = *(void **)(a1 + 40);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __27__BRCClientZone__startSync__block_invoke_2;
  v26[3] = &unk_2650829E0;
  id v27 = v7;
  id v28 = v8;
  id v29 = v12;
  id v30 = v9;
  char v31 = v18;
  char v32 = v13;
  id v20 = v9;
  id v21 = v12;
  id v22 = v8;
  id v23 = v7;
  [v19 performWithFlags:4 action:v26];
}

uint64_t __27__BRCClientZone__startSync__block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __27__BRCClientZone__startSync__block_invoke_217(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 104))
  {
    [*(id *)(v2 + 152) updateAfterSchedulingTask];
  }
  else
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __27__BRCClientZone__startSync__block_invoke_217_cold_2();
    }

    if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isCancelled] & 1) == 0)
    {
      uint64_t v5 = brc_bread_crumbs();
      uint8_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __27__BRCClientZone__startSync__block_invoke_217_cold_1();
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
    }
  }
  [*(id *)(a1 + 32) _cancelOutOfBandOperations];
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) schedule];
}

- (void)scheduleSyncUp
{
  self->_syncUpRetryAfter = 0;
}

- (void)scheduleSyncDownWithGroup:(id)a3
{
  id v5 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (!self->_syncDownGroup) {
    objc_storeStrong((id *)&self->_syncDownGroup, a3);
  }
  [(BRCClientZone *)self setSyncStateBits:2];
}

- (void)scheduleSyncDown
{
}

- (void)scheduleSyncDownFirst
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self setSyncStateBits:66];
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self setSyncStateBits:194];
}

- (void)resetSyncBudgetAndThrottle
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  lastSyncDownError = self->_lastSyncDownError;
  self->_lastSyncDownError = 0;

  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;

  [(BRCSyncBudgetThrottle *)self->_syncUpBudget clear];
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle clear];
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio clear];
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle clear];
  syncDeadlineSource = self->_syncDeadlineSource;
  [(BRCDeadlineSource *)syncDeadlineSource signal];
}

- (void)clearSyncUpError
{
  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;
}

- (void)prepareDirectoryForSyncUp:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isKnownByServer] & 1) == 0
    && ([v4 localDiffs] & 0x400000000000000) == 0
    && ([(BRCServerZone *)self->_serverZone state] & 4) == 0)
  {
    id v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      char v13 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Item %@ isn't known by the server so marking it as created by the current device%@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = self->_directoriesCreatedLastSyncUp;
    objc_sync_enter(v7);
    directoriesCreatedLastSyncUp = self->_directoriesCreatedLastSyncUp;
    id v9 = [v4 itemID];
    [(NSMutableArray *)directoriesCreatedLastSyncUp addObject:v9];

    objc_sync_exit(v7);
  }
}

- (id)directoryItemIDsCreatedLastSyncUp
{
  id v3 = self->_directoriesCreatedLastSyncUp;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_directoriesCreatedLastSyncUp count])
  {
    id v4 = (void *)[(NSMutableArray *)self->_directoriesCreatedLastSyncUp copy];
    [(NSMutableArray *)self->_directoriesCreatedLastSyncUp removeAllObjects];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_markLatestSyncRequestFailed
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(BRCClientZone *)self itemsWithInFlightDiffsEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v8 markLatestSyncRequestFailedInZone:v9];

        [v8 saveToDB];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(BRCClientZone *)self _markRequestIDAcked];
}

- (void)_markRequestIDAcked
{
  self->_requestID |= 1uLL;
}

- (unint64_t)allocateSyncUpRequestID
{
  self->_requestID = (self->_requestID | 1) + 1;
  [(BRCClientZone *)self setSyncStateBits:256];
  return self->_requestID;
}

- (void)learnCKInfosFromSavedRecords:(id)a3 isOutOfBandModifyRecords:(BOOL)a4
{
  BOOL v120 = a4;
  uint64_t v164 = *MEMORY[0x263EF8340];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  obuint64_t j = a3;
  uint64_t v148 = [obj countByEnumeratingWithState:&v151 objects:v163 count:16];
  if (v148)
  {
    uint64_t v147 = *(void *)v152;
    v145 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v152 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v151 + 1) + 8 * v5);
        uint64_t v7 = (void *)MEMORY[0x2455D97F0]();
        id v8 = [[BRFieldCKInfo alloc] initWithRecord:v6];
        id v9 = [v6 recordID];
        long long v10 = objc_msgSend(v9, "brc_itemIDWithSession:", self->_session);

        long long v11 = objc_msgSend(v6, "brc_updateDroppedReason");
        uint64_t v12 = objc_msgSend(v6, "brc_oplockMergeEtag");
        long long v13 = (void *)v12;
        if (v11)
        {
          uint64_t v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = [v6 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v156 = (uint64_t)v16;
            __int16 v157 = 2112;
            uint64_t v158 = (uint64_t)v11;
            __int16 v159 = 2112;
            uint64_t v160 = (uint64_t)v14;
            _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the update was dropped: %@%@", buf, 0x20u);
          }
LABEL_12:

          goto LABEL_13;
        }
        if (v12)
        {
          uint64_t v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v33 = [v6 recordID];
            __int16 v34 = [v6 etag];
            *(_DWORD *)buf = 138413058;
            uint64_t v156 = (uint64_t)v33;
            __int16 v157 = 2112;
            uint64_t v158 = (uint64_t)v13;
            __int16 v159 = 2112;
            uint64_t v160 = (uint64_t)v34;
            __int16 v161 = 2112;
            v162 = v14;
            _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the server merged ETag %@ to produce %@%@", buf, 0x2Au);

            self = v145;
          }
          goto LABEL_12;
        }
        if (v10 && ([v10 isNonDesktopRoot] & 1) == 0)
        {
          uint64_t v17 = [(BRFieldCKInfo *)v8 etag];
          uint64_t v18 = [v17 length];

          if (v18)
          {
            v149[0] = MEMORY[0x263EF8330];
            v149[1] = 3221225472;
            v149[2] = __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke;
            v149[3] = &unk_26507F148;
            v140 = v8;
            v150 = v140;
            v141 = (void *)MEMORY[0x2455D9A50](v149);
            uint64_t v19 = [v6 recordType];
            int v20 = [v19 isEqualToString:@"structure"];

            if (v20)
            {
              v142 = v145;
              id v21 = [v6 recordID];
              id v22 = [v21 recordName];
              int v23 = [v22 hasPrefix:@"shareAlias/"];

              if (!v23)
              {
                v137 = 0;
                __int16 v123 = 0;
                goto LABEL_35;
              }
              char v24 = [v6 recordID];
              __int16 v123 = objc_msgSend(v24, "brc_itemIDWithSession:", v145->_session);

              v137 = v142;
              id v25 = [v6 objectForKeyedSubscript:@"target"];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                id v27 = [v6 objectForKeyedSubscript:@"target"];
                id v143 = objc_alloc(MEMORY[0x263F325E0]);
                id v28 = [v27 recordID];
                id v29 = [v28 zoneID];
                uint64_t v125 = [v143 initWithRecordZoneID:v29];

                id v30 = [v27 recordID];
                uint64_t v130 = objc_msgSend(v30, "brc_itemIDWithSession:", v145->_session);

                char v31 = (void *)v125;
                char v32 = [(BRCAccountSessionFPFS *)v145->_session serverZoneByMangledID:v125];
                v142 = [v32 clientZone];

                long long v10 = (void *)v130;
              }
              else
              {
                char v31 = v137;
                id v27 = [(BRCClientZone *)v137 serverItemByItemID:v10];
                uint64_t v43 = [v27 aliasTargetItemID];

                v142 = [v27 aliasTargetClientZone];
                long long v10 = (void *)v43;
              }

              if (v10 && v142)
              {
LABEL_35:
                long long v44 = v145;
                long long v45 = brc_bread_crumbs();
                long long v46 = brc_default_log();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  v135 = [v10 debugItemIDString];
                  uint64_t v107 = [(BRFieldCKInfo *)v140 etag];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v156 = (uint64_t)v135;
                  __int16 v157 = 2112;
                  uint64_t v158 = v107;
                  long long v108 = (void *)v107;
                  __int16 v159 = 2112;
                  uint64_t v160 = (uint64_t)v45;
                  _os_log_debug_impl(&dword_23FA42000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn structural ETag for %@: %@%@", buf, 0x20u);

                  long long v44 = v145;
                }

                db = v44->_db;
                long long v48 = [(BRCClientZone *)v142 dbRowID];
                long long v49 = [(BRCPQLConnection *)db fetch:@"SELECT item_stat_ckinfo, item_local_change_count, version_old_zone_item_id IS NOT NULL, item_parent_zone_rowid FROM client_items WHERE zone_rowid = %@ AND item_id = %@", v48, v10];

                os_log_t log = v49;
                if ([v49 next])
                {
                  long long v50 = [v49 objectOfClass:objc_opt_class() atIndex:0];
                  uint64_t v51 = [v49 unsignedLongLongAtIndex:1];
                  v131 = v50;
                  uint64_t v52 = [v50 etag];
                  id v53 = (void *)v52;
                  long long v54 = &stru_26F3822F0;
                  if (v52) {
                    long long v54 = (__CFString *)v52;
                  }
                  id v55 = v54;
                  if (v51)
                  {
                    uint64_t v117 = v51;
                    id v56 = v55;
                    uint64_t v57 = [(__CFString *)v55 stringByAppendingFormat:@";%llu", v117];

                    v126 = (__CFString *)v57;
                    long long v49 = log;
                  }
                  else
                  {
                    v126 = v55;
                  }

                  if ([v49 BOOLAtIndex:2])
                  {
                    v77 = [v131 etagBeforeCrossZoneMove];
                    [(BRFieldCKInfo *)v140 setEtagBeforeCrossZoneMove:v77];

                    long long v49 = log;
                  }
                  uint64_t v78 = [v49 objectOfClass:objc_opt_class() atIndex:3];

                  v118 = (void *)v78;
                  id v132 = v10;
                  if (v137)
                  {
                    if (v78)
                    {
                      __int16 v79 = [(BRCClientZone *)v137 dbRowID];
                      char v80 = [v79 isEqualToNumber:v78];

                      if ((v80 & 1) == 0)
                      {
                        long long v92 = brc_bread_crumbs();
                        long long v93 = brc_default_log();
                        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          uint64_t v156 = (uint64_t)v92;
                          _os_log_impl(&dword_23FA42000, v93, OS_LOG_TYPE_DEFAULT, "[WARNING] Share alias target item changed zones while we were syncing! Updating etag of any share alias instead%@", buf, 0xCu);
                        }

                        id v94 = v123;
                        long long v95 = v137;

                        id v132 = v94;
                        v142 = v95;
                      }
                    }
                  }
                  id v58 = v126;
                }
                else
                {
                  id v132 = v10;
                  id v58 = 0;
                  v118 = 0;
                }
                long long v96 = v145->_db;
                long long v97 = [(BRCClientZone *)v142 dbRowID];
                v129 = v58;
                long long v98 = v96;
                self = v145;
                [(BRCPQLConnection *)v98 execute:@"UPDATE client_items SET item_stat_ckinfo = %@, item_local_change_count = 0, item_old_version_identifier = %@  WHERE zone_rowid = %@ AND item_id = %@", v140, v58, v97, v132];

                if (![(BRCPQLConnection *)v145->_db changes])
                {
                  long long v99 = [v6 recordID];
                  long long v100 = [v99 recordName];
                  int v101 = [v100 hasPrefix:@"documentStructure/"];

                  self = v145;
                  if (v101)
                  {
                    long long v102 = brc_bread_crumbs();
                    long long v103 = brc_default_log();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v156 = (uint64_t)v10;
                      __int16 v157 = 2112;
                      uint64_t v158 = (uint64_t)v102;
                      _os_log_impl(&dword_23FA42000, v103, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn stat info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                    }

                    long long v104 = v145->_db;
                    long long v105 = (void *)MEMORY[0x2455D9A50](v141);
                    long long v106 = v104;
                    self = v145;
                    [(BRCPQLConnection *)v106 execute:@"UPDATE client_items SET item_stat_ckinfo = call_block(%p, item_stat_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@", v105, v145->_dbRowID, v132];
                  }
                }

                goto LABEL_85;
              }
              uint64_t v72 = brc_bread_crumbs();
              v73 = brc_default_log();
              self = v145;
              if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v156 = (uint64_t)v6;
                __int16 v157 = 2112;
                uint64_t v158 = (uint64_t)v72;
                _os_log_fault_impl(&dword_23FA42000, v73, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't locate alias target for %@%@", buf, 0x16u);
              }

              uint64_t v74 = v142;
LABEL_87:

              goto LABEL_88;
            }
            uint64_t v35 = [v6 recordType];
            int v36 = [v35 isEqualToString:@"content"];

            if (v36)
            {
              self = v145;
              int v124 = objc_msgSend(v6, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v145->_session);
              if (v124)
              {
                uint64_t v37 = objc_msgSend(v6, "brc_lastEditorDeviceName");
                __int16 v38 = [(BRCAccountSessionFPFS *)v145->_session deviceKeyForName:v37 db:v145->_db];
              }
              else
              {
                v59 = [(BRCAccountSessionFPFS *)v145->_session cachedCurrentUserRecordName];
                uint64_t v37 = objc_msgSend(v6, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v59, 0);

                id v60 = NSNumber;
                uint64_t v61 = [(BRCAccountSessionFPFS *)v145->_session userKeyForOwnerName:v37 db:v145->_db];
                uint64_t v62 = -[v61 longLongValue];
                __int16 v63 = v60;
                self = v145;
                uint64_t v133 = [v63 numberWithLongLong:v62];

                __int16 v38 = (void *)v133;
              }

              id v64 = [(BRCPQLConnection *)self->_db fetch:@"SELECT version_ckinfo, version_local_change_count, version_old_zone_item_id IS NOT NULL FROM client_items WHERE zone_rowid = %@ AND item_id = %@", self->_dbRowID, v10];
              v144 = v64;
              if ([v64 next])
              {
                v134 = v38;
                __int16 v65 = [v64 objectOfClass:objc_opt_class() atIndex:0];
                uint64_t v138 = [v64 unsignedLongLongAtIndex:1];
                uint64_t v127 = v65;
                uint64_t v66 = [v65 etag];
                __int16 v67 = (void *)v66;
                long long v68 = &stru_26F3822F0;
                if (v66) {
                  long long v68 = (__CFString *)v66;
                }
                uint64_t v69 = v68;
                long long v70 = v69;
                if (v138)
                {
                  uint64_t v71 = [(__CFString *)v69 stringByAppendingFormat:@";%llu", v138];

                  id v139 = (id)v71;
                  self = v145;
                }
                else
                {
                  id v139 = v69;
                }

                if ([v144 BOOLAtIndex:2])
                {
                  __int16 v81 = [v127 etagBeforeCrossZoneMove];
                  [(BRFieldCKInfo *)v140 setEtagBeforeCrossZoneMove:v81];

                  self = v145;
                }

                __int16 v38 = v134;
                if (!v134)
                {
LABEL_67:
                  id v82 = v38;
                  __int16 v83 = brc_bread_crumbs();
                  uint64_t v84 = brc_default_log();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                  {
                    long long v113 = [(BRFieldCKInfo *)v140 etag];
                    *(_DWORD *)buf = 138412802;
                    uint64_t v156 = (uint64_t)v10;
                    __int16 v157 = 2112;
                    uint64_t v158 = (uint64_t)v113;
                    __int16 v159 = 2112;
                    uint64_t v160 = (uint64_t)v83;
                    _os_log_debug_impl(&dword_23FA42000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag for %@: %@%@", buf, 0x20u);

                    self = v145;
                  }

                  [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET version_ckinfo = %@, version_local_change_count = 0, version_old_version_identifier = %@ WHERE zone_rowid = %@ AND item_id = %@", v140, v139, self->_dbRowID, v10];
                  __int16 v38 = v82;
                  uint64_t v76 = v139;
                  goto LABEL_70;
                }
              }
              else
              {
                id v139 = 0;
                if (!v38) {
                  goto LABEL_67;
                }
              }
              v128 = brc_bread_crumbs();
              uint64_t v75 = brc_default_log();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              {
                loga = v75;
                v136 = v38;
                uint64_t v109 = [v10 debugItemIDString];
                uint64_t v110 = [(BRFieldCKInfo *)v140 etag];
                if (v124) {
                  objc_msgSend(v6, "brc_lastEditorDeviceName");
                }
                else {
                uint64_t v111 = [v6 modifiedByDevice];
                }
                *(_DWORD *)buf = 138413058;
                v119 = (void *)v109;
                uint64_t v156 = v109;
                __int16 v157 = 2112;
                long long v114 = (void *)v110;
                uint64_t v158 = v110;
                __int16 v159 = 2112;
                uint64_t v160 = v111;
                __int16 v161 = 2112;
                v162 = v128;
                long long v115 = (void *)v111;
                uint64_t v75 = loga;
                _os_log_debug_impl(&dword_23FA42000, loga, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag and Last Editor for %@: %@, %@%@", buf, 0x2Au);

                __int16 v38 = v136;
              }

              uint64_t v76 = v139;
              [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET version_ckinfo = %@, version_device = %@,  version_local_change_count = 0, version_old_version_identifier = %@ WHERE zone_rowid = %@ AND item_id = %@", v140, v38, v139, self->_dbRowID, v10];
LABEL_70:
              uint64_t v85 = v144;
              if (![(BRCPQLConnection *)self->_db changes])
              {
                v86 = v38;
                v87 = brc_bread_crumbs();
                long long v88 = brc_default_log();
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v156 = (uint64_t)v10;
                  __int16 v157 = 2112;
                  uint64_t v158 = (uint64_t)v87;
                  _os_log_impl(&dword_23FA42000, v88, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn version info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                }

                long long v89 = v145->_db;
                long long v90 = (void *)MEMORY[0x2455D9A50](v141);
                long long v91 = v89;
                self = v145;
                [(BRCPQLConnection *)v91 execute:@"UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@", v90, v145->_dbRowID, v10];

                __int16 v38 = v86;
                uint64_t v85 = v144;
                uint64_t v76 = v139;
              }
            }
            else
            {
              long long v39 = [v6 recordType];
              int v40 = [v39 isEqualToString:@"perParticipantMetadata"];

              if (v40)
              {
                long long v41 = brc_bread_crumbs();
                uint64_t v42 = brc_default_log();
                self = v145;
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  long long v112 = [(BRFieldCKInfo *)v140 etag];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v156 = (uint64_t)v10;
                  __int16 v157 = 2112;
                  uint64_t v158 = (uint64_t)v112;
                  __int16 v159 = 2112;
                  uint64_t v160 = (uint64_t)v41;
                  _os_log_debug_impl(&dword_23FA42000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn side-car ETag for %@: %@%@", buf, 0x20u);

                  self = v145;
                }

                [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_side_car_ckinfo = %@ WHERE zone_rowid = %@ AND item_id = %@", v140, self->_dbRowID, v10];
              }
              else
              {
                self = v145;
              }
            }
LABEL_85:
            if (v120)
            {
              uint64_t v74 = [(BRCClientZone *)self itemByItemID:v10];
              [v74 scheduleSyncDownForOOBModifyRecordsAck];
              [v74 saveToDB];
              goto LABEL_87;
            }
LABEL_88:

            uint64_t v14 = v150;
LABEL_13:

            goto LABEL_14;
          }
          self = v145;
        }
LABEL_14:

        ++v5;
      }
      while (v148 != v5);
      uint64_t v116 = [obj countByEnumeratingWithState:&v151 objects:v163 count:16];
      uint64_t v148 = v116;
    }
    while (v116);
  }
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, void *a4)
{
  if (a3 != 1)
  {
    uint64_t v12 = brc_bread_crumbs();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1();
  }

  id v9 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  long long v10 = [*(id *)(a1 + 32) etag];
  [v9 setEtagBeforeCrossZoneMove:v10];

  id v11 = [v9 data];
  sqlite3_result_blob(a2, (const void *)[v11 bytes], objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)_syncUpOfRecords:(id)a3 createdAppLibraryNames:(id)a4 didFinishWithError:(id)a5 errorWasOnPCSChainedItem:(BOOL)a6 throttledItemInBatch:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (__CFString *)a5;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  memset(v59, 0, sizeof(v59));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]", 2363, v59);
  uint64_t v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v47 = v59[0];
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    float v49 = v48;
    uint64_t v50 = [v12 count];
    *(_DWORD *)buf = 134219266;
    uint64_t v51 = @"(successful)";
    unint64_t v62 = v47;
    if (v14) {
      uint64_t v51 = v14;
    }
    __int16 v63 = 2112;
    id v64 = self;
    __int16 v65 = 2048;
    double v66 = v49;
    __int16 v67 = 2048;
    uint64_t v68 = v50;
    __int16 v69 = 2112;
    long long v70 = v51;
    __int16 v71 = 2112;
    uint64_t v72 = v15;
    _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: completed sync up for %@, cost:%.1f, itemCount:%llu %@%@", buf, 0x3Eu);
  }

  if (!v14)
  {
    uint64_t v17 = [(BRCAccountSessionFPFS *)self->_session containerScheduler];
    uint64_t v18 = [v17 syncUpBudget];
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    objc_msgSend(v18, "consume:");

    syncUpBudget = self->_syncUpBudget;
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    -[BRCSyncBudgetThrottle consume:](syncUpBudget, "consume:");
    [(BRCClientZone *)self _increaseSyncUpBatchSizeAfterSuccess];
  }
  syncUpOperatiouint64_t n = self->_syncUpOperation;
  self->_syncUpOperatiouint64_t n = 0;

  objc_storeStrong((id *)&self->_lastSyncUpError, a5);
  self->_lastSyncUpErrorWasOnChainedIteuint64_t m = a6;
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio newSyncOperationWithError:v14];
  if ([(__CFString *)v14 brc_containsCloudKitErrorCode:27])
  {
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]();
    }

    [(BRCClientZone *)self _decreaseSyncUpBatchSizeAfterError];
  }
  if (v14)
  {
    if ([(__CFString *)v14 brc_isResetError])
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      char v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]();
      }
    }
    else if ([(__CFString *)v14 brc_isCloudKitErrorRequiringAssetRescan])
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      char v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        unint64_t requestID = self->_requestID;
        *(_DWORD *)buf = 134218498;
        unint64_t v62 = requestID;
        __int16 v63 = 2112;
        id v64 = (BRCClientZone *)v14;
        __int16 v65 = 2112;
        double v66 = v23;
        _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      char v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        unint64_t v53 = self->_requestID;
        *(_DWORD *)buf = 134218498;
        unint64_t v62 = v53;
        __int16 v63 = 2112;
        id v64 = (BRCClientZone *)v14;
        __int16 v65 = 2112;
        double v66 = v23;
        _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }

    int v36 = +[BRCAccountsManager sharedManager];
    [v36 retrySyncBubbleLaterIfNeededWithError:v14];

    if (([(__CFString *)v14 brc_isEverRetriable] & 1) == 0) {
      [(BRCClientZone *)self recomputeAllItemsDidUploadState];
    }
    if (([(__CFString *)v14 brc_isResetError] & 1) != 0
      || ![(__CFString *)v14 brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown])
    {
      uint64_t v34 = 19;
    }
    else
    {
      [(BRCClientZone *)self _markLatestSyncRequestFailed];
      uint64_t v37 = [(__CFString *)v14 userInfo];
      __int16 v38 = [v37 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke;
      v58[3] = &unk_265082A58;
      void v58[4] = self;
      [v38 enumerateKeysAndObjectsUsingBlock:v58];

      uint64_t v34 = 1;
    }
    long long v39 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v39 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncUp" forError:v14];
  }
  else
  {
    id v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]();
    }

    if ([(BRCClientZone *)self isPrivateZone])
    {
      id v27 = [(BRCClientZone *)self asPrivateClientZone];
      id v28 = [v27 defaultAppLibrary];
      [v28 setStateBits:2];
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v29 = v13;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v55;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(v29);
          }
          id v33 = -[BRCAccountSessionFPFS appLibraryByID:](self->_session, "appLibraryByID:", *(void *)(*((void *)&v54 + 1) + 8 * v32), (void)v54);
          [v33 setStateBits:2];

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v30);
    }

    [(BRCClientZone *)self learnCKInfosFromSavedRecords:v12 isOutOfBandModifyRecords:0];
    uint64_t v34 = 18;
  }
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", v34, (void)v54);
  [(BRCClientZone *)self clearSyncStateBits:4];
  if (v7
    && ([(BRCClientZone *)self mangledID],
        int v40 = objc_claimAutoreleasedReturnValue(),
        +[BRCUserDefaults defaultsForMangledID:v40],
        long long v41 = objc_claimAutoreleasedReturnValue(),
        char v42 = [v41 treatPerItemThrottleAsOperationSuccess],
        v41,
        v40,
        (v42 & 1) != 0))
  {
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v43 = v14;
  }
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle updateForError:v43];
  if (v14
    || ([(BRCClientZone *)self syncDownImmediately],
        long long v44 = objc_claimAutoreleasedReturnValue(),
        v44,
        !v44))
  {
    [(BRCDeadlineSource *)self->_syncDeadlineSource resume];
    [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
  }
  [(BRCClientZone *)self handleZoneLevelErrorIfNeeded:v14 forItemCreation:1];
  brc_bread_crumbs();
  double v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  long long v46 = brc_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    syncUpThrottle = self->_syncUpThrottle;
    *(_DWORD *)buf = 138412802;
    unint64_t v62 = (unint64_t)syncUpThrottle;
    __int16 v63 = 2112;
    id v64 = self;
    __int16 v65 = 2112;
    double v66 = v45;
    _os_log_debug_impl(&dword_23FA42000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: updated sync-up throttle: %@\n      and container state: %@%@", buf, 0x20u);
  }

  __brc_leave_section(v59);
}

void __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (objc_msgSend(v5, "brc_isCloudKitOutOfQuota"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = *(void **)(a1 + 32);
      BOOL v7 = objc_msgSend(v11, "brc_itemIDWithSession:", v6[1]);
      id v8 = [v6 itemByItemID:v7];

      if (([v8 isDead] & 1) == 0
        && [v8 needsSyncUp]
        && [v8 isDocument])
      {
        id v9 = [*(id *)(*(void *)(a1 + 32) + 8) fsUploader];
        long long v10 = [v8 asDocument];
        [v9 finishedSyncingUpItem:v10 withOutOfQuotaError:v5];
      }
    }
  }
}

- (NSArray)syncThrottles
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  syncThrottles = self->_syncThrottles;
  if (syncThrottles)
  {
    uint64_t v4 = syncThrottles;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(BRCClientZone *)self mangledID];
    BOOL v7 = +[BRCUserDefaults defaultsForMangledID:v6];
    id v8 = [v7 syncThrottles];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [[BRCSyncThrottle alloc] initWithName:@"defaultSyncThrottle" andParameters:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v14 = (NSArray *)[v5 copy];
    uint64_t v15 = self->_syncThrottles;
    self->_syncThrottles = v14;

    uint64_t v4 = self->_syncThrottles;
  }
  return v4;
}

- (BOOL)_isIdle
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v3 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v4 = [v3 appLibraries];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v9 state] & 4) != 0)
          {
            uint64_t v10 = brc_bread_crumbs();
            uint64_t v11 = brc_default_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v26 = self;
              __int16 v27 = 2112;
              id v28 = v9;
              __int16 v29 = 2112;
              uint64_t v30 = v10;
              _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't idle because %@ needs lost%@", buf, 0x20u);
            }

            goto LABEL_29;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  if ((self->_state & 0x110) != 0)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle].cold.5((uint64_t)self);
    }
LABEL_29:

    return 0;
  }
  char v12 = atomic_load(&self->_syncState);
  if ((v12 & 0xF) != 0)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle].cold.4((uint64_t)self);
    }
    goto LABEL_29;
  }
  id v13 = [(BRCAccountSessionFPFS *)self->_session fsDownloader];
  int v14 = [v13 haveActiveJobsMatching:self->_serverZone];

  if (v14)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_29;
  }
  uint64_t v15 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
  int v16 = [v15 haveActiveJobsMatching:self->_serverZone];

  if (v16)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_29;
  }
  long long v17 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  [v17 deleteExpiredJobs];

  long long v18 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  int v19 = [v18 haveActiveJobsMatching:self->_serverZone];

  if (v19)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_29;
  }
  return 1;
}

- (void)_flushIdleBlocksIfNeeded
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 mangledID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] %@ is still not idle%@", v4);
}

- (void)notifyClient:(id)a3 afterNextSyncDown:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCPQLConnection *)self->_db serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke;
  block[3] = &unk_26507F918;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1();
  }

  uint64_t v4 = *(unsigned char **)(a1 + 40);
  if (v4[76])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
    uint64_t v4 = *(unsigned char **)(a1 + 40);
  }
  if ([v4 isSyncBlocked])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorSyncBlocked");

    uint64_t v5 = (void *)v6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 368);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 368);
      *(void *)(v9 + 368) = v8;

      id v7 = *(void **)(*(void *)(a1 + 40) + 368);
    }
    uint64_t v11 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 48));
    [v7 addObject:v11];
  }
}

- (void)notifyClient:(id)a3 whenIdle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCPQLConnection *)self->_db serialQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke;
  v11[3] = &unk_265082AD0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async_with_logs_5(v8, v11);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 4;
  uint64_t v3 = [a1[4] mangledID];
  if (!*((unsigned char *)*v2 + 76))
  {
    uint64_t v4 = (void (**)(id, void, uint64_t))a1[6];
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
    goto LABEL_5;
  }
  if ([*v2 isSyncBlocked])
  {
    uint64_t v4 = (void (**)(id, void, uint64_t))a1[6];
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorSyncBlocked");
LABEL_5:
    id v6 = (void *)v5;
    v4[2](v4, 0, v5);

    goto LABEL_6;
  }
  if ([a1[4] _isIdle])
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1();
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    long long v29 = 0uLL;
    uint64_t v30 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2584, &v29);
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v20 = a1[5];
      *(_DWORD *)locatiouint64_t n = 134218754;
      *(void *)&location[4] = v29;
      __int16 v34 = 2112;
      uint64_t v35 = v3;
      __int16 v36 = 2112;
      id v37 = v20;
      __int16 v38 = 2112;
      long long v39 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for %@ to be idle for %@ because it is busy%@", location, 0x2Au);
    }

    long long v31 = v29;
    uint64_t v32 = v30;
    uint64_t v11 = (void *)*((void *)a1[4] + 49);
    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v13 = a1[4];
      id v14 = (void *)v13[49];
      v13[49] = v12;

      uint64_t v11 = (void *)*((void *)a1[4] + 49);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_264;
    v23[3] = &unk_265082A80;
    long long v27 = v31;
    uint64_t v28 = v32;
    id v24 = v3;
    id v25 = a1[5];
    id v26 = a1[6];
    uint64_t v15 = (void *)MEMORY[0x2455D9A50](v23);
    [v11 addObject:v15];

    int v16 = [MEMORY[0x263F08A00] defaultCenter];
    objc_initWeak((id *)location, a1[4]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266;
    v21[3] = &unk_265082AA8;
    objc_copyWeak(&v22, (id *)location);
    uint64_t v17 = [v16 addObserverForName:@"BRCFSSchedulerBaseDidUpdateHasWorkNotification" object:0 queue:0 usingBlock:v21];
    long long v18 = a1[4];
    int v19 = (void *)v18[48];
    v18[48] = v17;

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)location);
  }
LABEL_6:
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ is now idle, notifying %@%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __brc_leave_section((uint64_t *)&v8);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained[1] personaIdentifier];
    if ([v6 isEqualToString:@"__defaultPersonaID__"])
    {
    }
    else
    {
      id v7 = [v5[1] personaIdentifier];

      if (v7)
      {
        int v8 = 0;
        goto LABEL_9;
      }
    }
    if (_block_invoke___personaOnceToken_0 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_0, &__block_literal_global_271);
    }
    id v7 = (id)_block_invoke___personalPersona_0;
    int v8 = 1;
LABEL_9:
    uint64_t v9 = [MEMORY[0x263F841B0] sharedManager];
    id v10 = [v9 currentPersona];

    id v27 = 0;
    id v11 = [v10 userPersonaUniqueString];
    __int16 v12 = v11;
    if (v11 == v7 || ([v11 isEqualToString:v7] & 1) != 0)
    {
      uint64_t v13 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v26 = 0;
        uint64_t v15 = (void *)[v10 copyCurrentPersonaContextWithError:&v26];
        id v16 = v26;
        id v17 = v27;
        id v27 = v15;

        if (v16)
        {
          uint64_t v18 = brc_bread_crumbs();
          int v19 = brc_default_log();
          if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
            __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266_cold_1((uint64_t)v16);
          }
        }
        uint64_t v13 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

        if (!v13) {
          goto LABEL_12;
        }
        id v20 = brc_bread_crumbs();
        long long v21 = brc_default_log();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          id v22 = [v5[1] personaIdentifier];
          *(_DWORD *)buf = 138412802;
          long long v29 = v22;
          __int16 v30 = 2112;
          long long v31 = v13;
          __int16 v32 = 2112;
          id v33 = v20;
          _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (!v8 || ([v10 isDataSeparatedPersona] & 1) != 0)
        {
          long long v23 = brc_bread_crumbs();
          id v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          goto LABEL_12;
        }
        id v20 = brc_bread_crumbs();
        long long v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        uint64_t v13 = 0;
      }
    }
LABEL_12:
    __int16 v14 = [v5[8] serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_274;
    block[3] = &unk_26507ED70;
    void block[4] = v5;
    dispatch_async(v14, block);

    _BRRestorePersona();
  }
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)_block_invoke___personalPersona_0;
  _block_invoke___personalPersona_0 = v0;
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_274(uint64_t a1)
{
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2611, v4);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __39__BRCClientZone_notifyClient_whenIdle___block_invoke_274_cold_1();
  }

  [*(id *)(a1 + 32) _flushIdleBlocksIfNeeded];
  __brc_leave_section(v4);
}

- (void)syncDownOperation:(id)a3 didFinishWithError:(id)a4 status:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
  id v11 = [(BRCServerZone *)self->_serverZone ownerName];
  [v10 scheduleQuotaFetchIfNeededForOwner:v11];

  db = self->_db;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke;
  v15[3] = &unk_26507FCF8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  int64_t v18 = a5;
  id v13 = v9;
  id v14 = v8;
  [(BRCPQLConnection *)db performWithFlags:9 action:v15];
}

uint64_t __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 32);
  if (*(void *)(v4 + 136) == *(void *)(a1 + 40))
  {
    id v8 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;

    *((void *)*v5 + 17) = 0;
    [*((id *)*v5 + 23) resume];
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2();
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 176) updateForError:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) handleZoneLevelErrorIfNeeded:*(void *)(a1 + 48) forItemCreation:0];
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 32) mangledID];
  id v11 = +[BRCUserDefaults defaultsForMangledID:v10];
  int v12 = [v11 onlyTreatCaughtUpAsConsistent];

  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v9 > 2) {
    goto LABEL_10;
  }
  long long v31 = *(void **)(a1 + 48);
  if (v31)
  {
    if ((objc_msgSend(v31, "brc_isCloudKitCancellationError") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 48), "brc_isUserInitiatedRetriable") & 1) == 0)
    {
LABEL_10:
      id v14 = *v5;
      uint64_t v15 = (void *)*((void *)*v5 + 44);
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276;
      v66[3] = &unk_265082AF8;
      v66[4] = v14;
      [v15 enumerateKeysAndObjectsUsingBlock:v66];
      id v16 = (void *)*((void *)*v5 + 44);
      *((void *)*v5 + 44) = 0;

      if (([*v5 isSharedZone] & 1) == 0)
      {
        id v17 = [*v5 asPrivateClientZone];
        int64_t v18 = (void *)*((void *)*v5 + 39);
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_278;
        v64[3] = &unk_265082B20;
        id v65 = v17;
        id v19 = v17;
        [v18 enumerateKeysAndObjectsUsingBlock:v64];
      }
      uint64_t v20 = *(void *)(a1 + 32);
      long long v21 = *(void **)(v20 + 312);
      *(void *)(v20 + 312) = 0;

      if (*(void *)(a1 + 48))
      {
        uint64_t v52 = v13;
        uint64_t v53 = v9;
        id v22 = objc_opt_new();
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v23 = *((id *)*v5 + 24);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v61 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (objc_msgSend(v28, "nonDiscretionary", v52, v53))
              {
                long long v29 = brc_bread_crumbs();
                __int16 v30 = brc_default_log();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  __int16 v69 = v28;
                  __int16 v70 = 2112;
                  __int16 v71 = v29;
                  _os_log_debug_impl(&dword_23FA42000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing op %@ because the sync down failed%@", buf, 0x16u);
                }

                [v28 completedWithResult:0 error:*(void *)(a1 + 48)];
                [v28 cancel];
                [v28 schedule];
                [v22 addObject:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v72 count:16];
          }
          while (v25);
        }

        uint64_t v5 = (id *)(a1 + 32);
        [*(id *)(*(void *)(a1 + 32) + 192) removeObjectsInArray:v22];

        uint64_t v13 = v52;
        uint64_t v9 = v53;
      }
      goto LABEL_31;
    }
    if (*(void *)(a1 + 48)) {
      goto LABEL_31;
    }
  }
  if ([*((id *)*v5 + 44) count])
  {
    __int16 v32 = objc_opt_new();
    id v33 = *v5;
    uint64_t v34 = (void *)*((void *)*v5 + 44);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_281;
    v58[3] = &unk_265082B48;
    void v58[4] = v33;
    id v59 = v32;
    id v35 = v32;
    [v34 enumerateKeysAndObjectsUsingBlock:v58];
    [*((id *)*v5 + 44) removeObjectsForKeys:v35];
  }
LABEL_31:
  if (v9 <= v13)
  {
    LODWORD(v38) = 0;
    uint64_t v37 = 8;
LABEL_39:
    uint64_t v38 = v38 | 2;
    goto LABEL_40;
  }
  uint64_t v36 = *(void *)(a1 + 48);
  if (!v36 && v9 <= 2)
  {
    if ([*v5 hasHighPriorityWatchers]) {
      uint64_t v37 = 8;
    }
    else {
      uint64_t v37 = 344;
    }
    LODWORD(v38) = 32;
    goto LABEL_39;
  }
  uint64_t v38 = 32 * (v36 == 0);
  if (v36) {
    uint64_t v37 = 8;
  }
  else {
    uint64_t v37 = 344;
  }
  if (v9 < 3 || v36) {
    goto LABEL_39;
  }
LABEL_40:
  objc_msgSend(*v5, "clearSyncStateBits:", v37, v52, v53);
  [*v5 setSyncStateBits:v38];
  [*((id *)*v5 + 23) signal];
  if (v9 > 2 || *(void *)(a1 + 48))
  {
    if ([*((id *)*v5 + 47) count])
    {
      long long v39 = brc_bread_crumbs();
      uint64_t v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v69 = v39;
        _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEFAULT, "[NOTICE] signaling sync down waiters%@", buf, 0xCu);
      }
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = *((id *)*v5 + 47);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v54 + 1) + 8 * j) + 16))();
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v43);
    }

    [*((id *)*v5 + 47) removeAllObjects];
  }
  long long v46 = +[BRCAccountsManager sharedManager];
  [v46 retrySyncBubbleLaterIfNeededWithError:*(void *)(a1 + 48)];

  uint64_t v47 = *(void **)(a1 + 48);
  if (v47)
  {
    if ((objc_msgSend(v47, "brc_isEverRetriable") & 1) == 0) {
      [*v5 recomputeAllItemsDidUploadState];
    }
    if (*(void *)(a1 + 48))
    {
      float v48 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v48 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncDown" forError:*(void *)(a1 + 48)];
    }
  }
  float v49 = brc_bread_crumbs();
  uint64_t v50 = brc_default_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1();
  }

  return 1;
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) itemByItemID:v5];
  if (!v7)
  {
    id v7 = [*(id *)(a1 + 32) insertParentChainForItem:v5];
  }
  if (![v7 isLive] || objc_msgSend(v7, "isShareAcceptationFault"))
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276_cold_2((uint64_t)v7);
    }

    id v10 = [*(id *)(a1 + 32) serverItemByItemID:v5];
    id v11 = v10;
    if (v10
      && [v10 isLive]
      && (([v7 isIdleOrRejected] & 1) != 0 || objc_msgSend(v7, "isShareAcceptationFault")))
    {
      int v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v7;
        __int16 v28 = 2112;
        long long v29 = v11;
        __int16 v30 = 2112;
        long long v31 = v12;
        _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating item idle item %@ from server item %@ to fulfill the locate item request%@", buf, 0x20u);
      }

      [v7 updateFromServerItem:v11];
      if ([v7 saveToDBForServerEdit:1 keepAliases:0]) {
        goto LABEL_19;
      }
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
        __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276_cold_1(v7, (uint64_t)v14, v15);
      }
    }
    else
    {
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v7;
        __int16 v28 = 2112;
        long long v29 = v11;
        __int16 v30 = 2112;
        long long v31 = v14;
        _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't update local item %@ from server item %@%@", buf, 0x20u);
      }
    }

    id v7 = 0;
LABEL_19:
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void, uint64_t))(*(void *)(*((void *)&v21 + 1) + 8 * v20) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * v20), objc_msgSend(v7, "isLive", (void)v21));
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_278(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 serverAliasByUnsaltedBookmarkData:a2];
  id v7 = [v8 itemID];
  ((void (**)(void, void *))a3)[2](v6, v7);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = [*(id *)(a1 + 32) serverItemByItemID:v5];
        int v13 = [v12 isLive];

        if (v13) {
          (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)_fixupMissingCrossMovedItems
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db executeWithSlowStatementRadar:@"<rdar://problem/26073809> _fixupMissingCrossMovedItems causes slow SQL assertions", @"UPDATE client_items SET item_localsyncupunsigned int state = 1 WHERE zone_rowid = %@   AND item_localsyncupunsigned int state = 0   AND (item_local_diffs & 0x2000000000000000) != 0   AND NOT EXISTS (SELECT * FROM server_items WHERE server_items.item_id = client_items.item_id AND zone_rowid = %@)", self->_dbRowID, self->_dbRowID sql];
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [(BRCPQLConnection *)self->_db changes];
    *(_DWORD *)buf = 134218242;
    int64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] marked %lld items rejected after cross zone move%@", buf, 0x16u);
  }

  if ([(BRCPQLConnection *)self->_db changes])
  {
    id v6 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    [v6 repopulateJobsForZone:self->_serverZone];
  }
}

- (void)listedUpToRank:(int64_t)a3
{
  self->_lastInsertedRanuint64_t k = a3;
  [(BRCClientZone *)self setNeedsSave:1];
}

- (void)didSyncDownRequestID:(unint64_t)a3 maxApplyRank:(int64_t)a4 caughtUpWithServer:(BOOL)a5 syncDownDate:(id)a6
{
  BOOL v112 = a5;
  uint64_t v151 = *MEMORY[0x263EF8340];
  id v108 = a6;
  uint64_t v111 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  unint64_t requestID = self->_requestID;
  if (requestID) {
    BOOL v9 = requestID >= a3;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    long long v105 = brc_bread_crumbs();
    long long v106 = brc_default_log();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.4();
    }
  }
  if (!self->_lastSyncDownDate) {
    [(BRCClientZone *)self scheduleSyncUp];
  }
  if ([(NSMutableArray *)self->_blockedOperationsOnInitialSync count])
  {
    uint64_t v10 = [(BRCServerZone *)self->_serverZone changeState];
    uint64_t v11 = [v10 changeToken];

    if (v11)
    {
      [(NSMutableArray *)self->_blockedOperationsOnInitialSync sortWithOptions:16 usingComparator:&__block_literal_global_293];
    }
    else
    {
      int v12 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v134 = (unint64_t)v12;
        _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone wasn't found on sync down so failing all blocked operations right away%@", buf, 0xCu);
      }

      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v14 = self->_blockedOperationsOnInitialSync;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v129 objects:v150 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v130 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v129 + 1) + 8 * i);
            uint64_t v19 = (void *)MEMORY[0x263F087E8];
            uint64_t v20 = [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
            long long v21 = objc_msgSend(v19, "brc_errorClientZoneNotFound:", v20);
            [v18 completedWithResult:0 error:v21];

            [v18 cancel];
          }
          uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v129 objects:v150 count:16];
        }
        while (v15);
      }
    }
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v22 = self->_blockedOperationsOnInitialSync;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v125 objects:v149 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v126;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v126 != v24) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v125 + 1) + 8 * j) schedule];
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v125 objects:v149 count:16];
      }
      while (v23);
    }

    [(NSMutableArray *)self->_blockedOperationsOnInitialSync removeAllObjects];
  }
  self->_lastInsertedRanuint64_t k = a4;
  objc_storeStrong((id *)&self->_lastSyncDownDate, a6);
  [(BRCClientZone *)self setNeedsSave:1];
  if (v112)
  {
    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v124 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v121 = 0u;
      uint64_t v26 = [(BRCClientZone *)self asPrivateClientZone];
      id v27 = [v26 appLibraries];

      uint64_t v28 = [v27 countByEnumeratingWithState:&v121 objects:v148 count:16];
      if (v28)
      {
        char v29 = 0;
        uint64_t v30 = *(void *)v122;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v122 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void **)(*((void *)&v121 + 1) + 8 * k);
            [v32 state];
            if (([v32 state] & 0x400000) != 0)
            {
              [v32 clearStateBits:0x400000];
              char v29 = 1;
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v121 objects:v148 count:16];
        }
        while (v28);

        if (v29) {
          [(BRCClientZone *)self _fixupMissingCrossMovedItems];
        }
      }
      else
      {
      }
    }
    if (([(BRCClientZone *)self syncState] & 0x82) == 0x80)
    {
      [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_local_diffs = (item_local_diffs & (~%lld)) WHERE zone_rowid = %@ AND (item_local_diffs & %lld) != 0", 0x1000000000000000, self->_dbRowID, 0x1000000000000000];
      int64_t v35 = [(BRCPQLConnection *)self->_db changes];
      uint64_t v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
      }

      [(BRCClientZone *)self clearSyncStateBits:128];
      if (v35)
      {
        uint64_t v38 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        [v38 rescheduleSuspendedJobsMatching:self->_serverZone inState:22];
      }
    }
    unint64_t v39 = self->_requestID;
    if (v39 != a3 && v39)
    {
      if ((a3 | 1) == v39)
      {
        uint64_t v40 = brc_bread_crumbs();
        id v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
        }
      }
      else
      {
        long long v100 = brc_bread_crumbs();
        int v101 = brc_default_log();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v102 = self->_requestID;
          *(_DWORD *)buf = 134218754;
          unint64_t v134 = a3;
          __int16 v135 = 2048;
          unint64_t v136 = v102;
          __int16 v137 = 2112;
          uint64_t v138 = self;
          __int16 v139 = 2112;
          uint64_t v140 = (uint64_t)v100;
          _os_log_impl(&dword_23FA42000, v101, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking latest sync request failed because the requestIDs differ %llu vs %llu for %@\n%@", buf, 0x2Au);
        }

        if (self->_requestID < a3) {
          self->_unint64_t requestID = a3;
        }
        [(BRCClientZone *)self _markLatestSyncRequestFailed];
        __int16 v103 = atomic_load(&self->_syncState);
        if ((v103 & 0x100) != 0 && !self->_lastSyncUpError)
        {
          long long v104 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32360] code:32 userInfo:0];
          [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio newSyncOperationWithError:v104];
          [(BRCSyncOperationThrottle *)self->_syncUpThrottle updateForError:v104];
        }
      }
      goto LABEL_146;
    }
    if (!v39) {
      self->_unint64_t requestID = a3;
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    obuint64_t j = [(BRCClientZone *)self itemsWithInFlightDiffsEnumerator];
    uint64_t v115 = [obj countByEnumeratingWithState:&v117 objects:v147 count:16];
    if (v115)
    {
      uint64_t v113 = *(void *)v118;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v118 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void **)(*((void *)&v117 + 1) + 8 * v42);
          uint64_t v44 = (void *)MEMORY[0x2455D97F0]();
          double v45 = [v43 itemID];
          long long v46 = [(BRCClientZone *)self serverItemByItemID:v45];

          int v47 = [v43 isSharedToMeTopLevelItem];
          if (v46) {
            int v48 = 0;
          }
          else {
            int v48 = v47;
          }
          if (v48 == 1)
          {
            sessiouint64_t n = self->_session;
            uint64_t v50 = [(BRCClientZone *)self serverZone];
            long long v46 = [(BRCAccountSessionFPFS *)session serverAliasItemForSharedItem:v43 inZone:v50];
          }
          uint64_t v51 = brc_bread_crumbs();
          uint64_t v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v134 = a3;
            __int16 v135 = 2112;
            unint64_t v136 = (unint64_t)v43;
            __int16 v137 = 2112;
            uint64_t v138 = v46;
            __int16 v139 = 2112;
            uint64_t v140 = (uint64_t)v51;
            _os_log_debug_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEBUG, "[DEBUG] received item in request:%llu\n   local:  %@\n   server: %@\n%@", buf, 0x2Au);
          }

          if ([v43 isBRAlias])
          {
            if (v46)
            {
              BOOL v53 = ([v43 diffAgainstServerItem:v46] & 0x63) == 1;
              [v111 createApplyJobFromServerItem:v46 localItem:0 state:1 kind:2];
              if (v53) {
                [v43 updateStructuralCKInfoFromServerItem:v46];
              }
              goto LABEL_96;
            }
            goto LABEL_107;
          }
          int v54 = [v43 isSharedToMeTopLevelItem];
          if (v46)
          {
            if (v54 && [(BRCClientZone *)v46 isBRAlias])
            {
              long long v55 = [v43 asSharedToMeTopLevelItem];
              int v56 = [v55 diffAgainstServerAliasItem:v46];
            }
            else
            {
              int v56 = [v43 diffAgainstServerItem:v46];
            }
            if (([v43 localDiffs] & 0x1000000000000000) != 0)
            {
              BOOL v57 = 0;
            }
            else
            {
              BOOL v57 = (v56 & 0x7FFF) == 1;
              if ((v56 & 0x3FF0000) == 0x10000)
              {
                int v58 = [v43 isDocument];
                goto LABEL_90;
              }
            }
            int v58 = 0;
LABEL_90:
            id v65 = brc_bread_crumbs();
            double v66 = brc_default_log();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v88 = BRCItemFieldsPrettyPrint();
              long long v89 = (void *)v88;
              *(_DWORD *)buf = 134219522;
              if (v57) {
                long long v90 = "YES";
              }
              else {
                long long v90 = "NO";
              }
              unint64_t v134 = a3;
              if (v58) {
                long long v91 = "YES";
              }
              else {
                long long v91 = "NO";
              }
              __int16 v135 = 2112;
              unint64_t v136 = (unint64_t)v43;
              __int16 v137 = 2112;
              uint64_t v138 = v46;
              __int16 v139 = 2112;
              uint64_t v140 = v88;
              __int16 v141 = 2080;
              v142 = v90;
              __int16 v143 = 2080;
              v144 = v91;
              __int16 v145 = 2112;
              v146 = v65;
              _os_log_debug_impl(&dword_23FA42000, v66, OS_LOG_TYPE_DEBUG, "[DEBUG] item acknowledged in requestID:%llu\n   local:  %@\n   server: %@\n   diffs:  %@\n learning etag: structural:%s content:%s%@", buf, 0x48u);
            }
            [v111 createApplyJobFromServerItem:v46 localItem:0 state:1 kind:2];
            if (v57)
            {
              [v43 updateStructuralCKInfoFromServerItem:v46];
              if ((v58 & 1) == 0) {
                goto LABEL_96;
              }
            }
            else if (!v58)
            {
              goto LABEL_96;
            }
            __int16 v67 = [v43 asDocument];
            [v67 updateContentsCKInfoAndDeviceIDFromServerItem:v46];

            goto LABEL_96;
          }
          if (v54 && [(BRCClientZone *)self isPrivateZone])
          {
            id v59 = brc_bread_crumbs();
            long long v60 = brc_default_log();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v134 = (unint64_t)v43;
              __int16 v135 = 2112;
              unint64_t v136 = (unint64_t)v59;
              _os_log_debug_impl(&dword_23FA42000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Alias was rejected when syncing up in private zone %@%@", buf, 0x16u);
            }

            long long v61 = [(BRCServerZone *)self->_serverZone dbRowID];
            [v43 markLatestSyncRequestAcknowledgedInZone:v61];

            [v43 saveToDBForServerEdit:1 keepAliases:0];
            long long v62 = [v43 clientZone];
            long long v63 = [v43 itemID];
            id v64 = [v62 serverItemByItemID:v63];

            [v111 createApplyJobFromServerItem:v64 localItem:v43 state:1 kind:2];
          }
          else
          {
            memset(v116, 0, sizeof(v116));
            __brc_create_section(0, (uint64_t)"-[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]", 2959, v116);
            brc_bread_crumbs();
            __int16 v69 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
            __int16 v70 = brc_default_log();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              unint64_t v134 = v116[0];
              __int16 v135 = 2112;
              unint64_t v136 = (unint64_t)v43;
              __int16 v137 = 2112;
              uint64_t v138 = v69;
              _os_log_debug_impl(&dword_23FA42000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Resolving server-side folded path-match for: %@%@", buf, 0x20u);
            }

            __int16 v71 = [v43 st];
            uint64_t v72 = [v71 parentID];
            uint64_t v73 = [v43 st];
            uint64_t v74 = [v73 logicalNameWithoutLocalBounce];
            long long v46 = [(BRCClientZone *)self serverItemByParentID:v72 andLogicalName:v74];

            if (!v46) {
              goto LABEL_106;
            }
            if (([(BRCClientZone *)v46 canPathMatchMergeWithLocalItem:v43] & 1) == 0)
            {
              brc_bread_crumbs();
              uint64_t v75 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
              uint64_t v76 = brc_default_log();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v134 = (unint64_t)v46;
                __int16 v135 = 2112;
                unint64_t v136 = (unint64_t)v43;
                __int16 v137 = 2112;
                uint64_t v138 = v75;
                _os_log_impl(&dword_23FA42000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't merge %@ with %@%@", buf, 0x20u);
              }

LABEL_106:
              __brc_leave_section(v116);
LABEL_107:
              v77 = brc_bread_crumbs();
              uint64_t v78 = brc_default_log();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v134 = (unint64_t)v77;
                _os_log_debug_impl(&dword_23FA42000, v78, OS_LOG_TYPE_DEBUG, "[DEBUG] we couldn't find a suitable path-match, mark the item as rejected%@", buf, 0xCu);
              }

              __int16 v79 = [(BRCServerZone *)self->_serverZone dbRowID];
              [v43 markLatestSyncRequestRejectedInZone:v79];

              [v43 saveToDBForServerEdit:1 keepAliases:0];
              goto LABEL_110;
            }
            if ([v43 isDead])
            {
              __brc_leave_section(v116);
LABEL_134:
              [v111 createApplyJobFromServerItem:v46 localItem:0 state:1 kind:2];
LABEL_96:
              uint64_t v68 = [(BRCServerZone *)self->_serverZone dbRowID];
              [v43 markLatestSyncRequestAcknowledgedInZone:v68];

              [v43 saveToDBForServerEdit:1 keepAliases:0];
              goto LABEL_110;
            }
            char v80 = [(BRCClientZone *)v46 itemID];
            __int16 v81 = [(BRCClientZone *)self itemByItemID:v80];
            id v82 = brc_bread_crumbs();
            __int16 v83 = brc_default_log();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v134 = (unint64_t)v46;
              __int16 v135 = 2112;
              unint64_t v136 = (unint64_t)v82;
              _os_log_debug_impl(&dword_23FA42000, v83, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a path-match in the server truth: %@%@", buf, 0x16u);
            }

            if (!v81)
            {
              brc_bread_crumbs();
              id v94 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
              long long v95 = brc_default_log();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                long long v96 = [v43 itemID];
                *(_DWORD *)buf = 138412802;
                unint64_t v134 = (unint64_t)v80;
                __int16 v135 = 2112;
                unint64_t v136 = (unint64_t)v96;
                __int16 v137 = 2112;
                uint64_t v138 = v94;
                _os_log_debug_impl(&dword_23FA42000, v95, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match is new, learn new item ID %@ instead of %@%@", buf, 0x20u);
              }
              [v43 learnItemID:v80 serverItem:v46];
LABEL_133:

              __brc_leave_section(v116);
              if (v46) {
                goto LABEL_134;
              }
              goto LABEL_107;
            }
            if (![v81 isDirectory] || !objc_msgSend(v43, "isDirectory"))
            {
              long long v92 = brc_bread_crumbs();
              long long v93 = brc_default_log();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v134 = (unint64_t)v92;
                _os_log_debug_impl(&dword_23FA42000, v93, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match exists on the filesystem. Forcing a rejection%@", buf, 0xCu);
              }

              long long v46 = 0;
              goto LABEL_133;
            }
            uint64_t v84 = brc_bread_crumbs();
            uint64_t v85 = brc_default_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v134 = (unint64_t)v84;
              _os_log_debug_impl(&dword_23FA42000, v85, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match exists on the filesystem. Merging the contents of the directories%@", buf, 0xCu);
            }

            v86 = [v43 asDirectory];
            v87 = [v81 asDirectory];
            [v86 mergeContentsIntoDirectory:v87];

            __brc_leave_section(v116);
          }
LABEL_110:
          ++v42;
        }
        while (v115 != v42);
        uint64_t v97 = [obj countByEnumeratingWithState:&v117 objects:v147 count:16];
        uint64_t v115 = v97;
      }
      while (v97);
    }

    long long v98 = brc_bread_crumbs();
    long long v99 = brc_default_log();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
    }

    [(BRCClientZone *)self scheduleSyncUp];
    [(BRCClientZone *)self _markRequestIDAcked];
    [(BRCClientZone *)self recomputeAllItemsDidUploadState];
  }
  else
  {
    id v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v134 = (unint64_t)v33;
      _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] not enumerating in-flight items until we are caught up.%@", buf, 0xCu);
    }
  }
LABEL_146:
}

uint64_t __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 nonDiscretionary];
  int v7 = [v5 nonDiscretionary];
  if (!v6 || v7)
  {
    int v9 = [v5 nonDiscretionary];
    uint64_t v8 = v9 & ([v4 nonDiscretionary] ^ 1);
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (BOOL)_crossZoneMoveDocumentsToZone:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(BRCClientZone *)self isEqualToClientZone:v4])
  {
    id v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _crossZoneMoveDocumentsToZone:]();
    }

    char v7 = 0;
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(0, (uint64_t)"-[BRCClientZone _crossZoneMoveDocumentsToZone:]", 3101, v23);
    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = v23[0];
      __int16 v26 = 2112;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v4;
      __int16 v30 = 2112;
      long long v31 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cross zone move documents from %@ to %@%@", buf, 0x2Au);
    }

    uint64_t v10 = self->_session;
    uint64_t v11 = [(BRCClientZone *)self db];
    int v12 = [(BRCClientZone *)self asPrivateClientZone];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke;
    v17[3] = &unk_265082B90;
    id v13 = v12;
    id v18 = v13;
    id v14 = v11;
    id v19 = v14;
    uint64_t v20 = self;
    uint64_t v15 = v10;
    long long v21 = v15;
    id v22 = v4;
    char v7 = [v14 performWithFlags:24 action:v17];

    __brc_leave_section(v23);
  }

  return v7;
}

uint64_t __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v97 = a2;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v3 = [*(id *)(a1 + 32) itemsWithInFlightDiffsEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v114 objects:v129 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v115 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        int v9 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v10 = [*(id *)(a1 + 32) serverZone];
        uint64_t v11 = [v10 dbRowID];
        [v8 markLatestSyncRequestFailedInZone:v11];

        [v8 saveToDB];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v114 objects:v129 count:16];
    }
    while (v5);
  }

  int v12 = *(void **)(a1 + 40);
  id v13 = [*(id *)(a1 + 32) dbRowID];
  id v14 = (void *)[v12 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@ AND item_type in (1, 2, 6, 7)", v13];

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v109[0] = MEMORY[0x263EF8330];
  v109[1] = 3221225472;
  v109[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2;
  v109[3] = &unk_26507F1E8;
  long long v99 = (id *)(a1 + 40);
  v109[4] = *(void *)(a1 + 48);
  long long v98 = v14;
  obuint64_t j = [v14 enumerateObjects:v109];
  uint64_t v15 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v111;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v111 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v110 + 1) + 8 * v18);
        uint64_t v20 = (void *)MEMORY[0x2455D97F0]();
        long long v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v121 = (uint64_t)v19;
          __int16 v122 = 2112;
          long long v123 = v21;
          _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] cleaning up %@%@", buf, 0x16u);
        }

        uint64_t v23 = [v19 asDocument];
        uint64_t v24 = [*(id *)(a1 + 56) fsUploader];
        [v24 cancelAndCleanupItemUpload:v23];

        uint64_t v25 = [*(id *)(a1 + 56) fsDownloader];
        [v25 cancelAndCleanupItemDownloads:v23];

        __int16 v26 = [v23 currentVersion];
        id v27 = [v26 uploadedAssets];

        if (v27 || [v23 needsUpload])
        {
          [v23 markNeedsReading];
          [v23 saveToDB];
        }
        __int16 v28 = *(void **)(a1 + 40);
        id v29 = [*(id *)(a1 + 64) dbRowID];
        [v28 execute:@"UPDATE client_uploads SET zone_rowid = %@ WHERE throttle_id = %lld", v29, objc_msgSend(v23, "dbRowID")];

        __int16 v30 = *(void **)(a1 + 40);
        long long v31 = [*(id *)(a1 + 64) dbRowID];
        [v30 execute:@"UPDATE client_downloads SET zone_rowid = %@ WHERE throttle_id = %lld", v31, objc_msgSend(v23, "dbRowID")];

        if ([v23 needsReading] && objc_msgSend(*v99, "changes") <= 0)
        {
          uint64_t v32 = brc_bread_crumbs();
          id v33 = brc_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v121 = (uint64_t)v32;
            _os_log_fault_impl(&dword_23FA42000, v33, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !document.needsReading || db.changes > 0%@", buf, 0xCu);
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v34 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
      uint64_t v16 = v34;
    }
    while (v34);
  }

  int64_t v35 = [v14 error];

  if (v35)
  {
    uint64_t v36 = brc_bread_crumbs();
    uint64_t v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_6();
    }
LABEL_86:
    uint64_t v86 = 0;
    goto LABEL_87;
  }
  uint64_t v38 = *(void **)(a1 + 40);
  unint64_t v39 = [*(id *)(a1 + 32) dbRowID];
  int v40 = [v38 execute:@"DELETE FROM client_unapplied_table WHERE zone_rowid = %@", v39];

  if (v40)
  {
    id v41 = *(void **)(a1 + 40);
    uint64_t v42 = [*(id *)(a1 + 64) dbRowID];
    uint64_t v43 = [*(id *)(a1 + 32) dbRowID];
    int v40 = [v41 execute:@"UPDATE client_sync_up SET zone_rowid = %@ WHERE zone_rowid = %@   AND throttle_state != 0", v42, v43];

    if (v40)
    {
      uint64_t v44 = *(void **)(a1 + 40);
      double v45 = [*(id *)(a1 + 32) dbRowID];
      int v40 = [v44 execute:@"DELETE FROM client_sync_up WHERE zone_rowid = %@   AND throttle_state = 0", v45];

      if (v40)
      {
        long long v46 = *(void **)(a1 + 40);
        int v47 = [*(id *)(a1 + 32) dbRowID];
        int v40 = [v46 execute:@"DELETE FROM client_uploads WHERE zone_rowid = %@", v47];
      }
    }
  }
  if (![*v99 changes])
  {
    if (!v40) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  long long v91 = brc_bread_crumbs();
  long long v92 = brc_default_log();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT)) {
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();
  }

  if (v40)
  {
LABEL_35:
    int v48 = *(void **)(a1 + 40);
    float v49 = [*(id *)(a1 + 32) dbRowID];
    int v40 = [v48 execute:@"DELETE FROM client_downloads WHERE zone_rowid = %@", v49];
  }
LABEL_36:
  if ([*v99 changes])
  {
    long long v93 = brc_bread_crumbs();
    id v94 = brc_default_log();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();
    }

    if (!v40) {
      goto LABEL_84;
    }
  }
  else if (!v40)
  {
    goto LABEL_84;
  }
  uint64_t v50 = *(void **)(a1 + 40);
  uint64_t v51 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v50) = [v50 execute:@"DELETE FROM client_items WHERE zone_rowid = %@ AND item_type = 3", v51];

  if (!v50) {
    goto LABEL_84;
  }
  uint64_t v52 = *(void **)(a1 + 40);
  BOOL v53 = [*(id *)(a1 + 64) dbRowID];
  int v54 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v52) = [v52 execute:@"UPDATE client_items SET zone_rowid = %@, item_stat_ckinfo = call_block(%p, item_stat_ckinfo), version_ckinfo   = call_block(%p, version_ckinfo), item_local_diffs = (item_local_diffs | %lld)  WHERE zone_rowid = %@", v53, &__block_literal_global_328, &__block_literal_global_328, 0x2000000000000000, v54];

  if (!v52) {
    goto LABEL_84;
  }
  long long v55 = *(void **)(a1 + 40);
  int v56 = [*(id *)(a1 + 64) dbRowID];
  BOOL v57 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v55) = [v55 execute:@"UPDATE client_items SET item_parent_zone_rowid = %@ WHERE item_parent_zone_rowid = %@", v56, v57];

  if (!v55) {
    goto LABEL_84;
  }
  int v58 = *(void **)(a1 + 40);
  id v59 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v58) = [v58 execute:@"UPDATE client_items SET version_old_zone_rowid = NULL, version_old_zone_item_id = NULL WHERE version_old_zone_rowid = %@", v59];

  if (!v58) {
    goto LABEL_84;
  }
  long long v60 = *(void **)(a1 + 40);
  long long v61 = [*(id *)(a1 + 64) dbRowID];
  long long v62 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v60) = [v60 execute:@"UPDATE client_items SET version_old_zone_rowid = %@ WHERE version_old_zone_rowid = %@", v61, v62];

  if (!v60
    || (long long v63 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) dbRowID],
        id v64 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v63) = [v63 execute:@"DELETE FROM client_zones WHERE rowid = %@", v64],
        v64,
        (v63 & 1) == 0))
  {
LABEL_84:
    uint64_t v36 = brc_bread_crumbs();
    uint64_t v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3();
    }
    goto LABEL_86;
  }
  id v65 = brc_bread_crumbs();
  double v66 = brc_default_log();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = [*(id *)(a1 + 40) changes];
    uint64_t v68 = *(void **)(a1 + 32);
    __int16 v69 = *(NSObject **)(a1 + 64);
    *(_DWORD *)buf = 134218754;
    uint64_t v121 = v67;
    __int16 v122 = 2112;
    long long v123 = v68;
    __int16 v124 = 2112;
    long long v125 = v69;
    __int16 v126 = 2112;
    long long v127 = v65;
    _os_log_impl(&dword_23FA42000, v66, OS_LOG_TYPE_DEFAULT, "[NOTICE] cross zone moved %lld items from %@ to %@!%@", buf, 0x2Au);
  }

  [*(id *)(a1 + 64) scheduleSyncUp];
  [*(id *)(a1 + 64) scheduleSyncDownFirst];
  __int16 v70 = [*(id *)(a1 + 32) appLibraries];
  __int16 v71 = (void *)[v70 copy];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v36 = v71;
  uint64_t v72 = [v36 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v106;
    while (2)
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        if (*(void *)v106 != v74) {
          objc_enumerationMutation(v36);
        }
        uint64_t v76 = *(void **)(*((void *)&v105 + 1) + 8 * j);
        [*(id *)(a1 + 32) removeAppLibrary:v76];
        [v76 associateWithClientZone:*(void *)(a1 + 64)];
        [v76 setStateBits:6291456];
        v77 = [*(id *)(a1 + 64) serverZone];
        char v78 = [v77 state];

        if ((v78 & 0x20) != 0) {
          [v76 setStateBits:369098752];
        }
        else {
          [v76 clearStateBits:369098752];
        }
        if (([*(id *)(*(void *)(a1 + 48) + 8) saveAppLibraryToDB:v76] & 1) == 0)
        {
          v87 = brc_bread_crumbs();
          uint64_t v88 = brc_default_log();
          if (os_log_type_enabled(v88, (os_log_type_t)0x90u)) {
            __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2();
          }
          uint64_t v37 = v36;
LABEL_73:
          long long v90 = v97;
          goto LABEL_74;
        }
      }
      uint64_t v73 = [v36 countByEnumeratingWithState:&v105 objects:v119 count:16];
      if (v73) {
        continue;
      }
      break;
    }
  }

  __int16 v79 = [MEMORY[0x263EFF980] array];
  char v80 = [*(id *)(a1 + 64) defaultAppLibrary];
  [v79 addObject:v80];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v37 = v79;
  uint64_t v81 = [v37 countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v102;
    while (2)
    {
      for (uint64_t k = 0; k != v82; ++k)
      {
        if (*(void *)v102 != v83) {
          objc_enumerationMutation(v37);
        }
        uint64_t v85 = *(void **)(*((void *)&v101 + 1) + 8 * k);
        [v85 setStateBits:0x200000];
        if (([*(id *)(*(void *)(a1 + 48) + 8) saveAppLibraryToDB:v85] & 1) == 0)
        {
          uint64_t v88 = brc_bread_crumbs();
          long long v89 = brc_default_log();
          if (os_log_type_enabled(v89, (os_log_type_t)0x90u))
          {
            long long v96 = [*v99 lastError];
            *(_DWORD *)buf = 138412802;
            uint64_t v121 = (uint64_t)v85;
            __int16 v122 = 2112;
            long long v123 = v96;
            __int16 v124 = 2112;
            long long v125 = v88;
            _os_log_error_impl(&dword_23FA42000, v89, (os_log_type_t)0x90u, "[ERROR] can't save cross zone move state for appLibrary %@: %@%@", buf, 0x20u);
          }
          v87 = v37;
          goto LABEL_73;
        }
      }
      uint64_t v82 = [v37 countByEnumeratingWithState:&v101 objects:v118 count:16];
      if (v82) {
        continue;
      }
      break;
    }
  }

  if ([*(id *)(*(void *)(a1 + 48) + 8) saveClientZoneToDB:*(void *)(a1 + 64)])
  {
    uint64_t v86 = 1;
LABEL_87:
    long long v90 = v97;
    goto LABEL_88;
  }
  v87 = brc_bread_crumbs();
  uint64_t v88 = brc_default_log();
  long long v90 = v97;
  if (os_log_type_enabled(v88, (os_log_type_t)0x90u)) {
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1();
  }
LABEL_74:

  uint64_t v86 = 0;
LABEL_88:

  return v86;
}

id __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  uint64_t v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_326(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v6 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  [v6 markCrossZoneMoved];
  id v5 = [v6 data];
  sqlite3_result_blob(a2, (const void *)[v5 bytes], objc_msgSend(v5, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_hasAllItemsDidUploadHandlers
{
  return self->_bubbleSyncTask || self->_allItemsDidUploadTrackers != 0;
}

- (void)_allItemsDidUploadWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (![(BRCClientZone *)self _hasAllItemsDidUploadHandlers])
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _allItemsDidUploadWithError:]();
    }
  }
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] shared iPad: calling the upload handler because sync is failing: %@%@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _allItemsDidUploadWithError:]((uint64_t)self);
    }
  }

  bubbleSyncTasuint64_t k = self->_bubbleSyncTask;
  if (bubbleSyncTask)
  {
    [(UMUserSyncTask *)bubbleSyncTask end];
    uint64_t v8 = self->_bubbleSyncTask;
    self->_bubbleSyncTasuint64_t k = 0;
  }
  allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
  if (allItemsDidUploadTrackers)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = allItemsDidUploadTrackers;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "clientZone:didFinishUploadingAllItemsWithError:", self, v4, (void)v18);
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    uint64_t v15 = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;
  }
}

- (void)recomputeAllItemsDidUploadState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _hasAllItemsDidUploadHandlers])
  {
    p_lastSyncDownError = &self->_lastSyncDownError;
    lastSyncDownError = self->_lastSyncDownError;
    if ((lastSyncDownError && ![(NSError *)lastSyncDownError brc_isEverRetriable]
       || (p_lastSyncDownError = &self->_lastSyncUpError, (lastSyncUpError = self->_lastSyncUpError) != 0)
       && ![(NSError *)lastSyncUpError brc_isEverRetriable])
      && (id v6 = *p_lastSyncDownError) != 0)
    {
      uint64_t v10 = v6;
      [(BRCClientZone *)self _allItemsDidUploadWithError:v6];
    }
    else
    {
      id v11 = 0;
      char v7 = [(BRCClientZone *)self itemCountPendingUploadOrSyncUpAndReturnError:&v11];
      if ([v7 intValue])
      {
        uint64_t v8 = brc_bread_crumbs();
        int v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v13 = v7;
          __int16 v14 = 2112;
          uint64_t v15 = self;
          __int16 v16 = 2112;
          uint64_t v17 = v8;
          _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] shared iPad: Still need to sync up %@ more items for sync bubble for %@%@", buf, 0x20u);
        }
      }
      else
      {
        [(BRCClientZone *)self _allItemsDidUploadWithError:v11];
      }
    }
  }
}

- (void)handleRootRecordDeletion
{
  db = self->_db;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__BRCClientZone_handleRootRecordDeletion__block_invoke;
  v3[3] = &unk_26507F2F8;
  v3[4] = self;
  [(BRCPQLConnection *)db performWithFlags:17 action:v3];
}

uint64_t __41__BRCClientZone_handleRootRecordDeletion__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    id v2 = [*(id *)(a1 + 32) asPrivateClientZone];
    id v3 = [v2 defaultAppLibrary];
    [v3 clearStateBits:2];
  }
  if (([*(id *)(a1 + 32) isCloudDocsZone] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 asPrivateClientZone];
    id v6 = [v5 defaultAppLibrary];
    char v7 = [v6 dbRowID];
    uint64_t v8 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v7];
    int v9 = [v4 itemByItemID:v8];

    [v9 markForceNeedsSyncUp];
    [v9 saveToDB];
  }
  return 1;
}

- (void)didGCTombstoneRanks:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCPQLConnection *)self->_db serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__BRCClientZone_didGCTombstoneRanks___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__BRCClientZone_didGCTombstoneRanks___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) activated];
  if (result)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 264) removeIndexes:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 264) count])
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 264);
      *(void *)(v5 + 264) = 0;
    }
    return [*(id *)(a1 + 32) setNeedsSave:1];
  }
  return result;
}

- (void)didApplyTombstoneForRank:(int64_t)a3
{
  if (a3 >= 1)
  {
    appliedTombstoneRanks = self->_appliedTombstoneRanks;
    if (appliedTombstoneRanks)
    {
      [(NSMutableIndexSet *)appliedTombstoneRanks addIndex:a3];
    }
    else
    {
      uint64_t v5 = (NSMutableIndexSet *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndex:a3];
      id v6 = self->_appliedTombstoneRanks;
      self->_appliedTombstoneRanks = v5;
    }
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone didApplyTombstoneForRank:]();
    }

    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)flushAppliedTombstones
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Signaling that tombstones can be collected in %@%@");
}

- (BOOL)hasCompletedInitialSyncDownOnce
{
  return self->_lastSyncDownDate != 0;
}

- (BOOL)_checkIfEnumeratorContainsNonDiscretionaryOp:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "nonDiscretionary", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_hasNonDiscretionaryServerStitchingOperation
{
  id v3 = [(NSMutableDictionary *)self->_runningListOperations objectEnumerator];
  if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_recursiveListOperations objectEnumerator];
    if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v5])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(NSMutableDictionary *)self->_fetchParentOperations objectEnumerator];
      if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v6])
      {
        BOOL v4 = 1;
      }
      else
      {
        char v7 = [(NSMutableDictionary *)self->_locateRecordOperations objectEnumerator];
        BOOL v4 = [(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v7];
      }
    }
  }
  return v4;
}

- (void)_registerOperation:(id)a3 throttler:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = (BRCServerZone *)a3;
  db = self->_db;
  id v8 = a4;
  [(BRCPQLConnection *)db assertOnQueue];
  [(BRCServerZone *)v6 setOperationThrottle:v8];

  long long v9 = [(BRCServerZone *)self->_serverZone mangledID];
  long long v10 = +[BRCUserDefaults defaultsForMangledID:v9];

  long long v11 = [(BRCServerZone *)self->_serverZone clientZone];
  if ([v11 isSyncBlockedBecauseAppNotInstalled])
  {
    int v12 = [(BRCServerZone *)v6 nonDiscretionary];

    if (v12)
    {
      brc_bread_crumbs();
      uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        serverZone = self->_serverZone;
        int v41 = 138412802;
        uint64_t v42 = serverZone;
        __int16 v43 = 2112;
        uint64_t v44 = v6;
        __int16 v45 = 2112;
        long long v46 = v13;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone %@ is blocked because the app isn't installed but we have a non-discretionary op %@. Unblocking the zone%@", (uint8_t *)&v41, 0x20u);
      }

      [(BRCClientZone *)self clearStateBits:4096];
    }
  }
  else
  {
  }
  if (self->_syncDownOperation)
  {
    int v16 = [(BRCServerZone *)v6 nonDiscretionary];
    BOOL v17 = [(_BRCOperation *)self->_syncDownOperation nonDiscretionary];
    if (v16 && !v17)
    {
      uint64_t v18 = brc_bread_crumbs();
      long long v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _registerOperation:throttler:]();
      }

      [(BRCSyncOperationThrottle *)self->_syncDownThrottle graceNextRequest];
      [(_BRCOperation *)self->_syncDownOperation cancel];
      [(BRCClientZone *)self scheduleSyncDown];
    }
    [(BRCServerZone *)v6 addDependency:self->_syncDownOperation];
  }
  if (![(BRCClientZone *)self isSharedZone]
    && [(BRCServerZone *)self->_serverZone zoneCreationState] == 2)
  {
    long long v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerOperation:throttler:]();
    }

    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
    id v24 = objc_msgSend(v22, "brc_errorClientZoneNotFound:", v23);
    [(BRCServerZone *)v6 completedWithResult:0 error:v24];

    [(BRCServerZone *)v6 cancel];
    goto LABEL_22;
  }
  __int16 v25 = [(BRCServerZone *)self->_serverZone clientZone];
  if ([v25 hasCompletedInitialSyncDownOnce])
  {

LABEL_22:
    [(BRCServerZone *)v6 schedule];
    goto LABEL_23;
  }
  char v26 = [v10 allowsDirectoryListBeforeInitialChangeToken];

  if (v26) {
    goto LABEL_22;
  }
  [v10 throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp];
  double v28 = v27;
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle nextTry];
  double v30 = v29;
  brc_current_date_nsec();
  brc_interval_from_nsec();
  double v32 = v31;
  if ([(BRCServerZone *)v6 nonDiscretionary]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && !self->_syncDownOperation
    && v30 > v28 + v32)
  {
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      uint64_t v34 = lastSyncDownError;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
      uint64_t v34 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v37 = v34;
    uint64_t v38 = brc_bread_crumbs();
    unint64_t v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = +[BRCDumpContext stringFromInterval:0 context:v30 - v32];
      int v41 = 138413058;
      uint64_t v42 = v6;
      __int16 v43 = 2112;
      uint64_t v44 = v40;
      __int16 v45 = 2112;
      long long v46 = v37;
      __int16 v47 = 2112;
      int v48 = v38;
      _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Failing non-discretionary list operation %@ right away because we are heavily throttled (next try %@) %@%@", (uint8_t *)&v41, 0x2Au);
    }
    [(BRCServerZone *)v6 completedWithResult:0 error:v37];
    [(BRCServerZone *)v6 cancel];
    [(BRCServerZone *)v6 schedule];
  }
  else
  {
    int64_t v35 = brc_bread_crumbs();
    uint64_t v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerOperation:throttler:]((uint64_t)v6);
    }

    [(NSMutableArray *)self->_blockedOperationsOnInitialSync addObject:v6];
    [(BRCClientZone *)self scheduleSyncDownFirst];
  }
LABEL_23:
}

- (void)_registerServerStitchingOperation:(id)a3
{
}

- (void)_registerListOperation:(id)a3 shareAcceptOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v8 = brc_bread_crumbs();
  long long v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone _registerListOperation:shareAcceptOperation:](v6);
  }

  [(BRCClientZone *)self _registerServerStitchingOperation:v6];
  if (v7)
  {
    long long v10 = brc_bread_crumbs();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerListOperation:shareAcceptOperation:]((uint64_t)v7);
    }

    [v6 addDependency:v7];
  }
  int v12 = [(BRCServerZone *)self->_serverZone changeState];
  uint64_t v13 = [v12 changeToken];
  if (v13)
  {
  }
  else
  {
    BOOL v14 = [(BRCClientZone *)self isSyncBlockedBecauseAppNotInstalled];

    if (!v14)
    {
      BOOL v17 = [(BRCServerZone *)self->_serverZone clientZone];
      [v17 scheduleSyncDownFirst];

      goto LABEL_11;
    }
  }
  [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v6];
LABEL_11:
  runningListOperations = self->_runningListOperations;
  int v16 = [v6 folderToList];
  [(NSMutableDictionary *)runningListOperations setObject:v6 forKeyedSubscript:v16];
}

- (id)cancelListOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  runningListOperations = self->_runningListOperations;
  id v7 = [v5 folderToList];
  [(NSMutableDictionary *)runningListOperations removeObjectForKey:v7];

  id v8 = [v5 folderToList];
  long long v9 = -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:](self, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v8, [v5 nonDiscretionary], objc_msgSend(v5, "rescheduleApply"));

  [v5 cancelToBeReplacedByOperation:v9];
  return v9;
}

- (void)_registerFetchParentChainOperation:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v5 = [v4 parentIDToList];
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerFetchParentChainOperation:]((uint64_t)v5);
    }

    [(BRCClientZone *)self _registerServerStitchingOperation:v4];
    [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v4];
    [(NSMutableDictionary *)self->_fetchParentOperations setObject:v4 forKeyedSubscript:v5];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _registerFetchParentChainOperation:]((uint64_t)v4);
    }
  }
}

- (id)cancelFetchParentChainOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  id v6 = [v5 parentIDToList];
  [(NSMutableDictionary *)self->_fetchParentOperations removeObjectForKey:v6];
  id v7 = -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:](self, "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v6, [v5 nonDiscretionary]);
  [v5 cancelToBeReplacedByOperation:v7];

  return v7;
}

- (void)_registerLocateRecordOperation:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v5 = [v4 recordID];
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone _registerLocateRecordOperation:]((uint64_t)v5);
  }

  [(BRCClientZone *)self _registerOperation:v4 throttler:self->_locateRecordsOperationThrottle];
  [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v4];
  [(NSMutableDictionary *)self->_locateRecordOperations setObject:v4 forKeyedSubscript:v5];
}

- (id)cancelLocateRecordOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  id v6 = [v5 recordID];
  [(NSMutableDictionary *)self->_locateRecordOperations removeObjectForKey:v6];
  id v7 = -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:](self, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v6, [v5 nonDiscretionary]);
  [v5 cancelToBeReplacedByOperation:v7];

  return v7;
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3
{
  return [(BRCClientZone *)self _isSideSyncOperationBlockedWithName:a3 isWaitingOnShareAccept:0];
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3 isWaitingOnShareAccept:(BOOL)a4
{
  id v6 = a3;
  if (!self->_activated)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v6);
    }
    goto LABEL_15;
  }
  if ([(BRCClientZone *)self isSyncBlockedBecauseOSNeedsUpgrade])
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v6);
    }
LABEL_15:

    BOOL v10 = 1;
    goto LABEL_16;
  }
  if ((self->_state & 0x100) != 0)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.4((uint64_t)v6);
    }
    goto LABEL_15;
  }
  if ([(BRCServerZone *)self->_serverZone zoneCreationState] != 2)
  {
    BOOL v10 = 0;
    goto LABEL_16;
  }
  BOOL v9 = [(BRCClientZone *)self isSyncBlockedBecauseAppNotInstalled];
  BOOL v10 = 0;
  if (!v9 && !a4)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v6);
    }
    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

- (id)fetchDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApplyScheduler:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self isSharedZone])
  {
    BOOL v9 = [(BRCClientZone *)self asSharedClientZone];
    BOOL v10 = [v9 shareAcceptOperationForItemID:v8];
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"list" isWaitingOnShareAccept:v10 != 0])
  {
    long long v11 = 0;
    goto LABEL_24;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    int v12 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]();
    }

    goto LABEL_22;
  }
  int v12 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
  if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
  {
    if (v5)
    {
      id v16 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v8, self->_dbRowID];
      if ([v16 intValue] == 9)
      {
        BOOL v17 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        [v17 rescheduleItemsParentedToItemGlobalID:v12];
      }
    }
    uint64_t v18 = brc_bread_crumbs();
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.4();
    }

    goto LABEL_22;
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_runningListOperations objectForKeyedSubscript:v8];
  long long v11 = v13;
  if (v6 && v13)
  {
    if (![(_BRCOperation *)v13 nonDiscretionary])
    {
      BOOL v14 = v11;
      goto LABEL_31;
    }
LABEL_28:
    if (v5) {
      [(BRCListDirectoryContentsOperation *)v11 setRescheduleApply:1];
    }
    goto LABEL_23;
  }
  if (v13) {
    goto LABEL_28;
  }
  BOOL v14 = 0;
LABEL_31:
  long long v21 = [(BRCServerZone *)self->_serverZone failedListItemIDs];
  int v22 = [v21 containsObject:v8];

  if (!v22)
  {
    int v25 = [(BRCClientZone *)self serverItemTypeByItemID:v8 db:self->_db];
    if (v25 == -1) {
      int v25 = [(BRCClientZone *)self itemTypeByItemID:v8 db:self->_db];
    }
    if (v25 - 9 >= 2 && v25 != 255)
    {
      if (v5)
      {
        id v32 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v8, self->_dbRowID];
        if ([v32 intValue] == 9)
        {
          id v33 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
          [v33 rescheduleItemsParentedToItemGlobalID:v12];
        }
      }
      uint64_t v34 = brc_bread_crumbs();
      int64_t v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        int v40 = [v8 debugItemIDString];
        *(_DWORD *)locatiouint64_t n = 138413058;
        *(void *)&location[4] = v40;
        __int16 v47 = 2112;
        int v48 = self;
        __int16 v49 = 1024;
        int v50 = v25;
        __int16 v51 = 2112;
        uint64_t v52 = v34;
        _os_log_debug_impl(&dword_23FA42000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't list item %@ in zone %@ which isn't a directory fault %d%@", location, 0x26u);
      }
      goto LABEL_22;
    }
    if ([v8 isDocumentsFolder])
    {
      sessiouint64_t n = self->_session;
      double v27 = [v8 appLibraryRowID];
      double v28 = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v27];

      if (([v28 includesDataScope] & 1) == 0)
      {
        brc_bread_crumbs();
        uint64_t v36 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = [v28 mangledID];
          unint64_t v39 = [v38 debugDescription];
          *(_DWORD *)locatiouint64_t n = 138412546;
          *(void *)&location[4] = v39;
          __int16 v47 = 2112;
          int v48 = v36;
          _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to list documents directory of app library that don't have data scope. AppLibrary [%@].%@", location, 0x16u);
        }
        goto LABEL_22;
      }
    }
    double v29 = [[BRCListDirectoryContentsOperation alloc] initWithItemID:v8 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v6];
    [(BRCListDirectoryContentsOperation *)v29 setRescheduleApply:[(BRCListDirectoryContentsOperation *)v14 rescheduleApply] | v5];
    objc_initWeak((id *)location, self);
    if (v14)
    {
      double v30 = brc_bread_crumbs();
      double v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]((uint64_t)v14);
      }

      [(BRCListDirectoryContentsOperation *)v14 cancelToBeReplacedByOperation:v29];
    }
    else
    {
      objc_initWeak(&from, v29);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke;
      v41[3] = &unk_265082BB8;
      objc_copyWeak(&v43, (id *)location);
      objc_copyWeak(&v44, &from);
      id v42 = v8;
      [(BRCListDirectoryContentsOperation *)v29 addDirectoryListCompletionBlock:v41];

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&from);
    }
    [(BRCClientZone *)self _registerListOperation:v29 shareAcceptOperation:v10];
    long long v11 = v29;
    objc_destroyWeak((id *)location);

    goto LABEL_23;
  }
  uint64_t v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]();
  }

LABEL_22:
  long long v11 = 0;
LABEL_23:

LABEL_24:
  return v11;
}

void __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke(id *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained db];
    id v7 = [v6 serialQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2;
    v14[3] = &unk_26507ED98;
    v14[4] = WeakRetained;
    id v15 = a1[4];
    dispatch_async(v7, v14);
  }
  if (v3)
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [a1[4] debugItemIDString];
      *(_DWORD *)buf = 138413058;
      BOOL v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v3;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed listing directory %@ in %@ - %@%@", buf, 0x2Au);
    }
    [WeakRetained handleZoneLevelErrorIfNeeded:v3 forItemCreation:0];
  }
  else
  {
    long long v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [a1[4] debugItemIDString];
      *(_DWORD *)buf = 138412802;
      BOOL v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ in %@%@", buf, 0x20u);
    }
  }
}

uint64_t __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)fetchRecursiveDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"list recursively"])
  {
    goto LABEL_2;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    long long v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    p_super = brc_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:]();
    }
    goto LABEL_15;
  }
  if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
  {
    if (!v5)
    {
LABEL_2:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    long long v11 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
    uint64_t v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.5((uint64_t)v11);
    }

    p_super = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    [p_super rescheduleItemsRecursivelyUnderFolder:v11];
    goto LABEL_15;
  }
  BOOL v10 = [(NSMutableDictionary *)self->_recursiveListOperations objectForKeyedSubscript:v8];
  BOOL v9 = v10;
  if (!v6 || !v10)
  {
    if (!v10) {
      goto LABEL_26;
    }
LABEL_21:
    if (v5 && ([(BRCItemGlobalID *)v9 rescheduleApply] & 1) == 0)
    {
      [(BRCItemGlobalID *)v9 setRescheduleApply:1];
      id v16 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
      BOOL v17 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
      [v17 rescheduleItemsRecursivelyUnderFolder:v16];
    }
    brc_bread_crumbs();
    long long v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    p_super = brc_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:]();
    }
    goto LABEL_16;
  }
  if ([(BRCItemGlobalID *)v10 nonDiscretionary]) {
    goto LABEL_21;
  }
  [(BRCItemGlobalID *)v9 cancel];
LABEL_26:
  if (![v8 isDocumentsFolder])
  {
LABEL_29:
    __int16 v20 = [[BRCRecursiveListDirectoryContentsOperation alloc] initWithItemID:v8 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v6];
    [(BRCRecursiveListDirectoryContentsOperation *)v20 setRescheduleApply:v5];
    objc_initWeak(&location, self);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke;
    v40[3] = &unk_265082BE0;
    objc_copyWeak(&v42, &location);
    id v21 = v8;
    id v41 = v21;
    [(_BRCOperation *)v20 setFinishBlock:v40];
    [(NSMutableDictionary *)self->_recursiveListOperations setObject:v20 forKeyedSubscript:v21];
    if (v9)
    {
      __int16 v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = [v21 debugItemIDString];
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.4(v24, (uint64_t)v22, (uint64_t)buf);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      int v25 = [(BRCItemGlobalID *)v9 dependencies];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v25);
            }
            [(_BRCOperation *)v20 addDependency:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v26);
      }

      [(BRCAutoCancelOperation *)v20 beginObservingChanges];
      if ([(BRCItemGlobalID *)v9 isExecuting]) {
        [(_BRCOperation *)v20 addDependency:v9];
      }
    }
    else
    {
      double v29 = brc_bread_crumbs();
      double v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        double v31 = [v21 debugItemIDString];
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:](v31, (uint64_t)v29, (uint64_t)buf);
      }
    }
    [(_BRCOperation *)v20 schedule];
    long long v11 = v20;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    p_super = &v9->super;
    BOOL v9 = v11;
    goto LABEL_16;
  }
  sessiouint64_t n = self->_session;
  id v19 = [v8 appLibraryRowID];
  p_super = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v19];

  if ([p_super includesDataScope])
  {

    goto LABEL_29;
  }
  id v32 = brc_bread_crumbs();
  id v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [p_super mangledID];
    int64_t v35 = [v34 debugDescription];
    *(_DWORD *)buf = 138412546;
    long long v46 = v35;
    __int16 v47 = 2112;
    int v48 = v32;
    _os_log_impl(&dword_23FA42000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to rec-list documents directory of app library that don't have data scope. AppLibrary [%@].%@", buf, 0x16u);
  }
  long long v11 = v9;
LABEL_15:
  BOOL v9 = 0;
LABEL_16:

LABEL_17:
  return v9;
}

void __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained db];
    id v8 = [v7 serialQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2;
    v12[3] = &unk_26507ED98;
    v12[4] = v6;
    id v13 = *(id *)(a1 + 32);
    dispatch_async(v8, v12);
  }
  BOOL v9 = brc_bread_crumbs();
  BOOL v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ with error %@%@", buf, 0x20u);
  }
}

uint64_t __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)fetchParentChainIfNecessaryWithParentItemID:(id)a3 isUserWaiting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"fetch parent chain"])
  {
    id v7 = 0;
    goto LABEL_21;
  }
  if (!v6)
  {
    brc_bread_crumbs();
    id v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:]();
    }

    goto LABEL_19;
  }
  if (([(BRCServerZone *)self->_serverZone state] & 4) == 0)
  {
LABEL_15:
    if ([v6 isNonDesktopRoot])
    {
      brc_bread_crumbs();
      id v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v8;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't fetch parent chain of a root item%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
    __int16 v16 = [(NSMutableDictionary *)self->_fetchParentOperations objectForKeyedSubscript:v6];
    id v17 = v16;
    if (v4 && v16)
    {
      if (([v16 nonDiscretionary] & 1) == 0)
      {
LABEL_27:
        __int16 v18 = [[BRCFetchParentChainOperation alloc] initWithParentID:v6 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v4];
        objc_initWeak((id *)buf, self);
        if (v17)
        {
          [v17 cancelToBeReplacedByOperation:v18];
        }
        else
        {
          uint64_t v19 = MEMORY[0x263EF8330];
          uint64_t v20 = 3221225472;
          id v21 = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke;
          __int16 v22 = &unk_265082C08;
          objc_copyWeak(&v24, (id *)buf);
          id v23 = v6;
          [(BRCFetchParentChainOperation *)v18 addFetchParentChainCompletionBlock:&v19];

          objc_destroyWeak(&v24);
        }
        -[BRCClientZone _registerFetchParentChainOperation:](self, "_registerFetchParentChainOperation:", v18, v19, v20, v21, v22);
        id v8 = v18;
        objc_destroyWeak((id *)buf);

        id v7 = v8;
        goto LABEL_20;
      }
    }
    else if (!v16)
    {
      goto LABEL_27;
    }
    id v8 = v17;
    id v7 = v8;
    goto LABEL_20;
  }
  id v8 = [(BRCClientZone *)self insertParentChainForItem:v6];
  if (!v8)
  {
    brc_bread_crumbs();
    int v12 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find parent, we will try to create the operation even if we are in full sync%@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  BOOL v9 = brc_bread_crumbs();
  BOOL v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:]();
  }

LABEL_19:
  id v7 = 0;
LABEL_20:

LABEL_21:
  return v7;
}

void __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained db];
    BOOL v5 = [v4 serialQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2;
    v6[3] = &unk_26507ED98;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

uint64_t __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4 maxOperationBackoff:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"locate record"])
  {
    BOOL v9 = 0;
    goto LABEL_22;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    int v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:]();
    }
    goto LABEL_10;
  }
  BOOL v10 = [v8 recordName];
  if (![v10 hasPrefix:@"shareAlias/"])
  {

    goto LABEL_12;
  }
  BOOL v11 = [(BRCClientZone *)self isPrivateZone];

  if (v11)
  {
LABEL_12:
    BOOL v14 = [(NSMutableDictionary *)self->_locateRecordOperations objectForKeyedSubscript:v8];
    id v15 = v14;
    if (v6 && v14)
    {
      if (([v14 nonDiscretionary] & 1) == 0)
      {
LABEL_15:
        __int16 v16 = [[BRCLocateRecordOperation alloc] initWithRecordID:v8 serverZone:self->_serverZone isUserWaiting:v6 maxBackoff:self->_session sessionContext:a5];
        objc_initWeak(&location, self);
        if (v15)
        {
          [v15 cancelToBeReplacedByOperation:v16];
        }
        else
        {
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke;
          uint64_t v18[3] = &unk_265082C30;
          objc_copyWeak(&v20, &location);
          id v19 = v8;
          [(BRCLocateRecordOperation *)v16 addLocateRecordCompletionBlock:v18];

          objc_destroyWeak(&v20);
        }
        [(BRCClientZone *)self _registerLocateRecordOperation:v16];
        int v12 = v16;
        objc_destroyWeak(&location);

        BOOL v9 = v12;
        goto LABEL_21;
      }
    }
    else if (!v14)
    {
      goto LABEL_15;
    }
    int v12 = v15;
    BOOL v9 = v12;
    goto LABEL_21;
  }
  brc_bread_crumbs();
  int v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:]();
  }
LABEL_10:

  BOOL v9 = 0;
LABEL_21:

LABEL_22:
  return v9;
}

void __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained db];
    BOOL v5 = [v4 serialQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2;
    v6[3] = &unk_26507ED98;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

uint64_t __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4
{
  return [(BRCClientZone *)self locateRecordIfNecessaryForRecordID:a3 isUserWaiting:a4 maxOperationBackoff:1.79769313e308];
}

- (void)clearAndRefetchRecentAndFavoriteDocuments
{
  id v3 = [(BRCServerZone *)self->_serverZone db];
  BOOL v4 = [v3 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke;
  block[3] = &unk_26507ED70;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) clearStateBits:24];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2;
  block[3] = &unk_26507ED70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecentAndFavoriteDocuments:1];
}

- (void)fetchRecentAndFavoriteDocuments
{
}

- (void)fetchRecentAndFavoriteDocuments:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  BOOL v5 = [(BRCServerZone *)self->_serverZone db];
  BOOL v6 = [v5 serialQueue];

  if (v6)
  {
    id v7 = [(BRCServerZone *)self->_serverZone changeState];
    id v8 = [v7 changeToken];
    if (v8)
    {
    }
    else
    {
      BOOL v12 = [(BRCClientZone *)self hasCompletedInitialSyncDownOnce];

      if (!v12)
      {
        id v24 = brc_bread_crumbs();
        int v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.9();
        }
        goto LABEL_24;
      }
    }
    id v13 = [(BRCServerZone *)self->_serverZone changeState];
    BOOL v14 = [v13 changeToken];
    if (v14)
    {
    }
    else
    {
      BOOL v15 = [(BRCClientZone *)self hasCompletedInitialSyncDownOnce];

      if (v15)
      {
        __int16 v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
        }

        __int16 v18 = [(BRCServerZone *)self->_serverZone db];
        id v19 = [v18 serialQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke;
        block[3] = &unk_26507ED70;
        void block[4] = self;
        dispatch_async(v19, block);

        return;
      }
    }
    if (self->_fetchRecentsOperation)
    {
      id v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.8();
      }

      if (v3)
      {
        __int16 v22 = brc_bread_crumbs();
        id v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.7();
        }

        self->_invokeFetchRecentsOperatiouint64_t n = 1;
      }
      return;
    }
    if ([(BRCServerZone *)self->_serverZone hasFetchedRecentsAndFavorites])
    {
      id v24 = brc_bread_crumbs();
      int v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
      }
LABEL_24:

      return;
    }
    if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
    {
      double v30 = brc_bread_crumbs();
      double v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.6();
      }

      id v32 = [(BRCServerZone *)self->_serverZone db];
      id v33 = [v32 serialQueue];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_369;
      v50[3] = &unk_26507ED70;
      v50[4] = self;
      dispatch_async(v33, v50);
    }
    else if ([(BRCClientZone *)self isSharedZone])
    {
      uint64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
      }

      double v28 = [(BRCServerZone *)self->_serverZone db];
      double v29 = [v28 serialQueue];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_370;
      v49[3] = &unk_26507ED70;
      v49[4] = self;
      dispatch_async(v29, v49);
    }
    else
    {
      uint64_t v34 = [(BRCClientZone *)self asPrivateClientZone];
      int64_t v35 = [v34 defaultAppLibrary];
      long long v36 = [v35 containerMetadata];
      char v37 = [v36 isDocumentScopePublic];

      if (v37)
      {
        if (![(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"fetch recents and favorites"])
        {
          long long v38 = [[BRCFetchRecentAndFavoriteDocumentsOperation alloc] initWithServerZone:self->_serverZone sessionContext:self->_session];
          fetchRecentsOperatiouint64_t n = self->_fetchRecentsOperation;
          self->_fetchRecentsOperatiouint64_t n = v38;

          objc_initWeak((id *)buf, self);
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2;
          v46[3] = &unk_265082C58;
          objc_copyWeak(&v47, (id *)buf);
          [(_BRCOperation *)self->_fetchRecentsOperation setFinishBlock:v46];
          int v40 = brc_bread_crumbs();
          id v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.4();
          }

          [(BRCClientZone *)self _registerServerStitchingOperation:self->_fetchRecentsOperation];
          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        id v42 = brc_bread_crumbs();
        id v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.5();
        }

        id v44 = [(BRCServerZone *)self->_serverZone db];
        __int16 v45 = [v44 serialQueue];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_371;
        v48[3] = &unk_26507ED70;
        v48[4] = self;
        dispatch_async(v45, v48);
      }
    }
  }
  else
  {
    BOOL v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      serverZone = self->_serverZone;
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = serverZone;
      __int16 v54 = 2112;
      long long v55 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Zone doesn't have a serial queue anymore %@%@", buf, 0x16u);
    }
  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_369(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_370(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_371(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

void __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = [WeakRetained db];
  id v7 = [v6 serialQueue];

  if (v7)
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = WeakRetained[29];
      *(_DWORD *)buf = 138413058;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      __int16 v18 = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      __int16 v22 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished fetching recent documents (operation %@) for %@ - %@%@", buf, 0x2Au);
    }

    BOOL v10 = [WeakRetained db];
    BOOL v11 = [v10 serialQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_376;
    v13[3] = &unk_26507ED98;
    v13[4] = WeakRetained;
    id v14 = v4;
    dispatch_async(v11, v13);
  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_376(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = 0;

  if ((objc_msgSend(*(id *)(a1 + 40), "brc_isCloudKitCancellationError") & 1) != 0
    || (uint64_t result = objc_msgSend(*(id *)(a1 + 40), "brc_isRetriable"), result))
  {
    uint64_t result = [*(id *)(a1 + 32) state];
    if ((result & 0x100) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) activated];
      if (result) {
        *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 240))
  {
    *(unsigned char *)(v5 + 240) = 0;
    BOOL v6 = *(void **)(a1 + 32);
    return [v6 fetchRecentAndFavoriteDocuments];
  }
  return result;
}

- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v8 = self->_session;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 1;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2050000000;
  uint64_t v36 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke;
  v25[3] = &unk_265082C80;
  double v31 = v37;
  id v20 = v6;
  id v26 = v20;
  id v9 = v7;
  id v27 = v9;
  double v28 = self;
  BOOL v10 = v8;
  double v29 = v10;
  id v30 = 0;
  id v32 = &v33;
  uint64_t v34[3] = (uint64_t)v25;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v11 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v12 = [v11 appLibraries];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = v34[3];
          __int16 v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) rootItemID];
          LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, void, __CFString *, id *))(v16 + 16))(v16, v17, 0, @"/", a4);

          if ((v16 & 1) == 0)
          {
            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v39 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_13:
  }
  else
  {
    BOOL v18 = 1;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);

  return v18;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a4;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  char v70 = 1;
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2;
  v64[3] = &unk_265081ED8;
  uint64_t v67 = *(void *)(a1 + 72);
  id v65 = *(id *)(a1 + 32);
  uint64_t v68 = v69;
  id v56 = v8;
  id v66 = v56;
  id v9 = (void (**)(void))MEMORY[0x2455D9A50](v64);
  BOOL v10 = [*(id *)(a1 + 32) db];
  BOOL v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation     FROM client_items    WHERE item_parent_id = %@ ORDER BY item_filename", v7];
  long long v55 = v7;

  int v58 = v9;
  do
  {
    int v12 = [v11 next];
    if (!v12) {
      break;
    }
    uint64_t v13 = (void *)MEMORY[0x2455D97F0]();
    uint64_t v14 = [v11 integerAtIndex:0];
    if ([*(id *)(a1 + 32) isCancelled])
    {
      int v15 = 1;
    }
    else if ([*(id *)(a1 + 40) containsIndex:v14])
    {
      v9[2](v9);
      [*(id *)(a1 + 32) pushIndentation];
      uint64_t v16 = *(void **)(a1 + 32);
      __int16 v17 = [v11 objectOfClass:objc_opt_class() atIndex:2];
      BOOL v18 = +[BRCDumpContext stringFromItemID:v17 context:*(void *)(a1 + 32)];
      [v16 writeLineWithFormat:@"ERROR: item ID %@ seen twice", v18];

      [*(id *)(a1 + 32) popIndentation];
      int v15 = 2;
    }
    else
    {
      [*(id *)(a1 + 40) addIndex:v14];
      __int16 v19 = [*(id *)(a1 + 48) session];
      id v20 = [*(id *)(a1 + 32) db];
      long long v21 = (void *)[v19 newLocalItemFromPQLResultSet:v11 db:v20 error:a5];

      if (v21)
      {
        long long v22 = [*(id *)(a1 + 56) fsUploader];
        uint64_t v23 = [v22 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        long long v24 = [*(id *)(a1 + 56) applyScheduler];
        uint64_t v25 = [v24 descriptionForRejectedItem:v21 context:*(void *)(a1 + 32)];

        id v26 = [*(id *)(a1 + 56) fsDownloader];
        uint64_t v27 = [v26 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        double v28 = [*(id *)(a1 + 56) syncUpScheduler];
        uint64_t v29 = [v28 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        long long v62 = (void *)v25;
        long long v63 = (void *)v23;
        long long v60 = (void *)v29;
        long long v61 = (void *)v27;
        BOOL v30 = (v23 | v25 | v27 | v29) != 0;
        if ([v21 syncUpState])
        {
          double v31 = [v21 appLibrary];
          if (([v31 state] & 0x40000) != 0)
          {
            uint64_t v33 = [v21 itemID];
            int v32 = [v33 isDocumentsFolder] ^ 1;
          }
          else
          {
            int v32 = 1;
          }
        }
        else
        {
          int v32 = 0;
        }
        int v34 = v32 | v30;
        if ((v32 | v30) == 1)
        {
          ((void (*)(void))v58[2])();
          [*(id *)(a1 + 32) pushIndentation];
          uint64_t v35 = [v21 clientZone];
          uint64_t v36 = *(void **)(a1 + 48);

          if (v35 == v36)
          {
            uint64_t v40 = &stru_26F3822F0;
          }
          else
          {
            id v37 = [NSString alloc];
            char v38 = [v21 clientZone];
            long long v39 = [v38 mangledID];
            uint64_t v40 = (__CFString *)[v37 initWithFormat:@"zone:%@ ", v39];
          }
          id v41 = *(void **)(a1 + 32);
          id v42 = [v21 descriptionWithContext:v41];
          [v41 writeLineWithFormat:@"%@%@", v40, v42];

          int v34 = 1;
        }
        if (v30)
        {
          int v43 = v34;
          id v44 = objc_alloc_init(MEMORY[0x263F089D8]);
          __int16 v45 = v44;
          if (v63) {
            [v44 appendFormat:@" upload{%@}", v63];
          }
          if (v62) {
            [v45 appendFormat:@" rejected{%@}", v62];
          }
          if (v61) {
            [v45 appendFormat:@" downloader{%@}", v61];
          }
          if (v60) {
            [v45 appendFormat:@" sync-up{%@}", v60];
          }
          [*(id *)(a1 + 32) writeLineWithFormat:@">%@", v45];

          int v34 = v43;
        }
        if (v34) {
          [*(id *)(a1 + 32) popIndentation];
        }
        int v46 = [v21 isDirectory] ^ 1;
        if (a3 > 99) {
          LOBYTE(v46) = 1;
        }
        if (v46) {
          goto LABEL_37;
        }
        id v47 = *(void **)(a1 + 64);
        int v48 = [v21 itemID];
        LOBYTE(v47) = [v47 containsObject:v48];

        if (v47) {
          goto LABEL_37;
        }
        uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        int v50 = [v21 itemID];
        __int16 v51 = [v21 st];
        uint64_t v52 = [v51 filename];
        uint64_t v53 = [v56 stringByAppendingPathComponent:v52];
        LODWORD(v49) = (*(uint64_t (**)(uint64_t, void *, void, void *, uint64_t))(v49 + 16))(v49, v50, (a3 + 1), v53, a5);

        if (v49) {
LABEL_37:
        }
          int v15 = 0;
        else {
          int v15 = 1;
        }

        id v9 = v58;
      }
      else
      {
        int v15 = 1;
      }
    }
  }
  while ((v15 | 2) == 2);

  _Block_object_dispose(v69, 8);
  return v12 ^ 1u;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    [*(id *)(result + 32) writeLineWithFormat:@"Client Truth Unclean Items:"];
    uint64_t result = [*(id *)(v1 + 32) writeLineWithFormat:@"--------------------------"];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24))
  {
    uint64_t result = [*(id *)(v1 + 32) writeLineWithFormat:@"Under %@", *(void *)(v1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [v8 writeLineWithFormat:@"client items"];
  [v8 writeLineWithFormat:@"============"];
  [(BRCClientZone *)self _dumpItemsToContext:v8 includeAllItems:v6 error:a5];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v10 = [(BRCClientZone *)self serverZone];
  BOOL v11 = [v10 metadataSyncContextIfExists];
  if (v11) {
    [v9 addObject:v11];
  }
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v12 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v13 = [v12 appLibraries];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = [*(id *)(*((void *)&v41 + 1) + 8 * i) transferSyncContextIfExists];
          if (v18) {
            [v9 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v15);
    }
  }
  else
  {
    __int16 v19 = [v10 asSharedZone];
    uint64_t v13 = [v19 transferSyncContextIfExists];

    if (v13) {
      [v9 addObject:v13];
    }
  }

  if ((unint64_t)[v9 count] > 1)
  {
    uint64_t v35 = v10;
    uint64_t v36 = a5;
    [v8 writeLineWithFormat:@"scheduling sync contexts"];
    [v8 writeLineWithFormat:@"========================"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v9;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v27 = [v26 contextIdentifier];
          [v8 writeLineWithFormat:@"+ %@", v27];

          [v8 pushIndentation];
          [v26 dumpToContext:v8];
          [v8 popIndentation];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v23);
    }

    [v8 writeLineWithFormat:&stru_26F3822F0];
    BOOL v10 = v35;
    a5 = v36;
  }
  else
  {
    id v20 = [v9 anyObject];
    [v20 dumpToContext:v8];
  }
  double v28 = [0 error];

  if (v28)
  {
    uint64_t v29 = [0 error];
    if (v29)
    {
      BOOL v30 = a5;
      double v31 = brc_bread_crumbs();
      int v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        int v34 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v46 = "-[BRCClientZone dumpTablesToContext:includeAllItems:error:]";
        __int16 v47 = 2080;
        if (!v30) {
          int v34 = "(ignored by caller)";
        }
        int v48 = v34;
        __int16 v49 = 2112;
        int v50 = v29;
        __int16 v51 = 2112;
        uint64_t v52 = v31;
        _os_log_error_impl(&dword_23FA42000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      a5 = v30;
    }
    if (a5) {
      *a5 = v29;
    }
  }
  return v28 == 0;
}

- (BOOL)_resetItemsTable
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"implement this in subclass"];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    id v4 = brc_append_system_info_to_message();
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_fault_impl(&dword_23FA42000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v6, 0x16u);
  }
  brc_append_system_info_to_message();
  uint64_t v5 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone _resetItemsTable]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4293, v5);
}

- (id)allItems
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@", self->_dbRowID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__BRCClientZone_allItems__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __25__BRCClientZone_allItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)allItemsSortedByDepthDescending:(BOOL)a3
{
  if (a3)
  {
    id v4 = "item_level DESC";
    uint64_t v5 = 15;
  }
  else
  {
    id v4 = "item_level ASC";
    uint64_t v5 = 14;
  }
  id v6 = [MEMORY[0x263F8C720] rawInjection:v4 length:v5];
  if ([(BRCClientZone *)self isSharedZone])
  {
    id v7 = [MEMORY[0x263F8C720] rawInjection:"(item_sharing_options & 4) != 0" length:31];
  }
  else
  {
    __int16 v8 = (void *)MEMORY[0x263F8C710];
    id v9 = [(BRCClientZone *)self rootItemID];
    id v7 = [v8 formatInjection:@"item_parent_id = %@", v9];
  }
  id v10 = -[BRCPQLConnection fetch:](self->_db, "fetch:", &cfstr_WithRecursiveI_7, self->_dbRowID, v7, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke;
  v13[3] = &unk_26507F1E8;
  v13[4] = self;
  BOOL v11 = [v10 enumerateObjects:v13];

  return v11;
}

id __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)itemsParentedToThisZoneButLivingInAnOtherZone
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_parent_zone_rowid = %@ AND item_parent_zone_rowid != zone_rowid", self->_dbRowID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (int64_t)serverRankByItemID:(id)a3
{
  return [(BRCClientZone *)self serverRankByItemID:a3 db:self->_db];
}

- (id)serverItemByRank:(int64_t)a3
{
  db = self->_db;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__BRCClientZone_serverItemByRank___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = [(BRCPQLConnection *)db fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_rank = %lld AND zone_rowid = %@", a3, self->_dbRowID sql];
  return v4;
}

id __34__BRCClientZone_serverItemByRank___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (int64_t)serverRankByItemID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 fetch:@"SELECT item_rank FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  if ([v4 next])
  {
    int64_t v5 = [v4 longLongAtIndex:0];
    [v4 close];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)serverItemByItemID:(id)a3
{
  return [(BRCClientZone *)self serverItemByItemID:a3 db:self->_db];
}

- (id)serverItemByItemID:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__BRCClientZone_serverItemByItemID_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID sql];
  return v4;
}

id __39__BRCClientZone_serverItemByItemID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)serverItemByRowID:(unint64_t)a3
{
  return [(BRCClientZone *)self serverItemByRowID:a3 db:self->_db];
}

- (id)serverItemByRowID:(unint64_t)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__BRCClientZone_serverItemByRowID_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE rowid = %lld", a3 sql];
  return v4;
}

id __38__BRCClientZone_serverItemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)serverChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (id)clientChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT visible_child_count FROM client_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (BOOL)containsNonRejectedChildWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_user_visible = 1 AND item_localsyncupstate != 1 LIMIT 1", a3, self->_dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)serverQuotaUsageWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT quota_used FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (id)serverHiddenChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT COUNT(si.item_id) FROM server_items AS si LEFT JOIN client_unapplied_table AS cu ON si.item_rank = cu.throttle_id WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ((si.item_filename LIKE '.%%') OR (si.item_type = 3 AND cu.throttle_state = 24))", a3, self->_dbRowID];
  return v4;
}

- (id)itemByItemID:(id)a3
{
  return [(BRCClientZone *)self itemByItemID:a3 db:self->_db];
}

- (id)itemByItemID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v7];

  id v9 = [(BRCAccountSessionFPFS *)self->_session itemByItemGlobalID:v8 db:v6];

  return v9;
}

- (id)documentItemByItemID:(id)a3
{
  return [(BRCClientZone *)self documentItemByItemID:a3 db:self->_db];
}

- (id)documentItemByItemID:(id)a3 db:(id)a4
{
  id v4 = -[BRCClientZone itemByItemID:](self, "itemByItemID:", a3, a4);
  if ([v4 isDocument])
  {
    char v5 = [v4 asDocument];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCClientZone *)self itemByRowID:a3 db:self->_db];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __32__BRCClientZone_itemByRowID_db___block_invoke;
  v11[3] = &unk_26507F210;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  id v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE rowid = %lld AND zone_rowid = %@", a3, dbRowID sql];

  return v9;
}

id __32__BRCClientZone_itemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3
{
  return [(BRCClientZone *)self directoryOrRootItemIDByFileID:a3 db:self->_db];
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3 db:(id)a4
{
  id v4 = (void *)[a4 itemIDWithSQL:@"SELECT item_id FROM client_items  WHERE item_file_id = %lld    AND +item_type IN (0, 9, 10, 4)    AND item_state IN (0)    AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (BOOL)existsByItemID:(id)a3
{
  return [(BRCClientZone *)self existsByItemID:a3 db:self->_db];
}

- (BOOL)existsByItemID:(id)a3 db:(id)a4
{
  return [(BRCClientZone *)self itemTypeByItemID:a3 db:a4] != -1;
}

- (char)itemTypeByItemID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", a3, self->_dbRowID];
  char v5 = v4;
  if (v4) {
    char v6 = [v4 intValue];
  }
  else {
    char v6 = -1;
  }

  return v6;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"must implement in subclass"];
  objc_claimAutoreleasedReturnValue();
  char v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_fault_impl(&dword_23FA42000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone validateItemsLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4490, v8);
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"must implement in subclass"];
  objc_claimAutoreleasedReturnValue();
  char v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_fault_impl(&dword_23FA42000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone validateStructureLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4495, v8);
}

- (void)_removeAllShareAcceptanceBlocks
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v83 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] calling and removing all share acceptance blocks%@", buf, 0xCu);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  char v5 = [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v71 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v7);
  }

  downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
  self->_downloadedBlockToPerformForItemID = 0;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  __int16 v11 = [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID objectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v67 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v13);
  }

  onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
  self->_onDiskBlockToPerformForItemID = 0;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  __int16 v17 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForItemID objectEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v64;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v63 + 1) + 8 * v21);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v78 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v60;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v60 != v26) {
                objc_enumerationMutation(v23);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v59 + 1) + 8 * v27++) + 16))();
            }
            while (v25 != v27);
            uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v78 count:16];
          }
          while (v25);
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
    }
    while (v19);
  }

  syncDownBlockToPerformForItemID = self->_syncDownBlockToPerformForItemID;
  self->_syncDownBlockToPerformForItemID = 0;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v29 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID objectEnumerator];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v77 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        int v34 = *(void **)(*((void *)&v55 + 1) + 8 * v33);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v76 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v52;
          do
          {
            uint64_t v39 = 0;
            do
            {
              if (*(void *)v52 != v38) {
                objc_enumerationMutation(v35);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v51 + 1) + 8 * v39++) + 16))();
            }
            while (v37 != v39);
            uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v76 count:16];
          }
          while (v37);
        }

        ++v33;
      }
      while (v33 != v31);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v77 count:16];
    }
    while (v31);
  }

  locateBlocksToPerformForRecordID = self->_locateBlocksToPerformForRecordID;
  self->_locateBlocksToPerformForRecordID = 0;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v41 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForBookmarkData objectEnumerator];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v48;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(v41);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v47 + 1) + 8 * v45++) + 16))();
      }
      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
    }
    while (v43);
  }

  syncDownBlockToPerformForBookmarkData = self->_syncDownBlockToPerformForBookmarkData;
  self->_syncDownBlockToPerformForBookmarkData = 0;
}

- (void)_removeOnDiskBlockToPerformForItemID:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID count])
  {
    onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
    self->_onDiskBlockToPerformForItemID = 0;
  }
}

- (void)_removeDownloadedBlockToPerformForItemID:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID count])
  {
    downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
    self->_downloadedBlockToPerformForItemID = 0;
  }
}

- (id)popOnDiskBlockForItemID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] popOnDiskBlockForItemID [%@]%@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    [(BRCPQLConnection *)self->_db assertOnQueue];
    uint64_t v7 = [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID objectForKeyedSubscript:v4];
    [(BRCClientZone *)self _removeOnDiskBlockToPerformForItemID:v4];
    uint64_t v8 = (void *)MEMORY[0x2455D9A50](v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)popDownloadedBlockForItemID:(id)a3
{
  if (a3)
  {
    db = self->_db;
    id v5 = a3;
    [(BRCPQLConnection *)db assertOnQueue];
    uint64_t v6 = [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID objectForKeyedSubscript:v5];
    [(BRCClientZone *)self _removeDownloadedBlockToPerformForItemID:v5];

    uint64_t v7 = (void *)MEMORY[0x2455D9A50](v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)performBlock:(id)a3 whenItemWithRecordIDIsOnDisk:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithRecordIDIsOnDisk:]", 4577, &v25);
  uint64_t v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = (void *)v25;
    __int16 v31 = 2112;
    uint64_t v32 = v8;
    __int16 v33 = 2112;
    int v34 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be on disk%@", buf, 0x20u);
  }

  long long v27 = v25;
  uint64_t v28 = v26;
  if (v6 && v8)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke;
    v21[3] = &unk_265082CA8;
    long long v23 = v27;
    uint64_t v24 = v28;
    id v22 = v6;
    id v11 = (void *)MEMORY[0x2455D9A50](v21);
    __int16 v12 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    uint64_t v13 = [v12 serialQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_498;
    v17[3] = &unk_26507FBE0;
    void v17[4] = self;
    id v18 = v8;
    id v6 = v11;
    id v20 = v6;
    id v19 = v7;
    dispatch_async_with_logs_5(v13, v17);

    uint64_t v14 = v22;
  }
  else
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)MEMORY[0x2455D9A50](v6);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      int v34 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1();
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_498(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2;
  uint64_t v23[3] = &unk_265082CD0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v24 = v3;
  uint64_t v25 = v4;
  id v26 = *(id *)(a1 + 56);
  id v5 = (void (**)(void, void))MEMORY[0x2455D9A50](v23);
  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    long long v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v2;
      __int16 v31 = 2112;
      uint64_t v32 = v6;
      uint64_t v8 = "[WARNING] %@ is resetting. Not waiting on faulting of %@%@";
      uint64_t v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  if ([v2 isAlmostDead])
  {
    uint64_t v6 = brc_bread_crumbs();
    long long v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v2;
      __int16 v29 = 2112;
      uint64_t v30 = v6;
      uint64_t v8 = "[WARNING] %@ is dead, not waiting on faulting.%@";
      uint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v2)
  {
    if (([v2 isOnDisk] & 1) == 0)
    {
      ((void (**)(void, void *))v5)[2](v5, v2);
      goto LABEL_9;
    }
    uint64_t v6 = brc_bread_crumbs();
    long long v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_498_cold_1((uint64_t)v2);
    }
    goto LABEL_8;
  }
  __int16 v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] Local item not found. Wait for the item [%@] to be on disk.%@", buf, 0x16u);
  }

  uint64_t v15 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_500;
  v19[3] = &unk_265082D20;
  id v16 = *(id *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(a1 + 40);
  id v21 = v16;
  v19[4] = v17;
  id v20 = v18;
  id v22 = v5;
  [v15 performBlock:v19 whenLocatingCompletesForItemWithRecordID:*(void *)(a1 + 48)];

LABEL_9:
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v3;
    if (!v3) {
      id v10 = (id)a1[4];
    }
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be available%@", (uint8_t *)&v11, 0x16u);
  }

  if (!*(void *)(a1[5] + 336))
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void **)(v7 + 336);
    *(void *)(v7 + 336) = v6;
  }
  uint64_t v9 = (void *)MEMORY[0x2455D9A50](a1[6]);
  [*(id *)(a1[5] + 336) setObject:v9 forKeyedSubscript:a1[4]];
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_500(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_501;
    v6[3] = &unk_265082CF8;
    uint64_t v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    dispatch_async_with_logs_5(v3, v6);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_501(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  if ([v2 isOnDisk])
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412546;
      uint64_t v6 = v2;
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is on disk after syncing down and refreshing%@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)performBlock:(id)a3 whenItemWithIDIsDownloaded:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithIDIsDownloaded:]", 4657, &v23);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = (void *)v23;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be downloaded%@", buf, 0x20u);
  }

  long long v25 = v23;
  uint64_t v26 = v24;
  if (v6 && v7)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke;
    v19[3] = &unk_265082D48;
    long long v21 = v25;
    uint64_t v22 = v26;
    id v20 = v6;
    id v10 = (void *)MEMORY[0x2455D9A50](v19);
    int v11 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    id v12 = [v11 serialQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502;
    v16[3] = &unk_26507F918;
    v16[4] = self;
    id v17 = v7;
    id v6 = v10;
    id v18 = v6;
    dispatch_async_with_logs_5(v12, v16);

    __int16 v13 = v20;
  }
  else
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)MEMORY[0x2455D9A50](v6);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1();
  }

  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v3 = [v2 asDocument];

  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    long long v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      long long v23 = v9;
      __int16 v24 = 2112;
      long long v25 = v3;
      __int16 v26 = 2112;
      long long v27 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on download of %@%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if ([v3 hasLocalContent])
  {
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502_cold_1((uint64_t)v3);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_17;
  }
  id v10 = +[BRCSystemResourcesManager manager];
  char v11 = [v10 isNetworkReachable];

  if ((v11 & 1) == 0)
  {
    long long v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502_cold_2((uint64_t)v3);
    }
LABEL_16:

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_17:
    v6();
    goto LABEL_18;
  }
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v20 = v3;
    if (!v3) {
      id v20 = *(void **)(a1 + 40);
    }
    *(_DWORD *)buf = 138412546;
    long long v23 = v20;
    __int16 v24 = 2112;
    long long v25 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be downloaded%@", buf, 0x16u);
  }

  if (!*(void *)(*(void *)(a1 + 32) + 344))
  {
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 344);
    *(void *)(v15 + 344) = v14;
  }
  id v17 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 344) setObject:v17 forKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v18 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    id v19 = [v18 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_503;
    block[3] = &unk_26507ED70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v19, block);
  }
LABEL_18:
}

uint64_t __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_503(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleSyncDown];
}

- (void)_prepareForForegroundSyncDown
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(_BRCOperation *)self->_syncDownOperation usesBackgroundSession])
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync down operation that uses a background session%@", (uint8_t *)&v7, 0xCu);
    }

    [(_BRCOperation *)self->_syncDownOperation cancel];
  }
  if (self->_syncUpOperation)
  {
    int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync up operation because we need to sync down now%@", (uint8_t *)&v7, 0xCu);
    }

    [(_BRCOperation *)self->_syncUpOperation cancel];
  }
  [(BRCClientZone *)self scheduleSyncDownFirst];
  [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
}

- (BOOL)_shouldFailSyncDownWaitImmediately
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (([(BRCClientZone *)self state] & 0x100) != 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      char v11 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on sync down%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v3 = +[BRCSystemResourcesManager manager];
    char v4 = [v3 isNetworkReachable];

    if (v4) {
      return 0;
    }
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _shouldFailSyncDownWaitImmediately]((uint64_t)self);
    }
  }

  return 1;
}

- (void)performBlock:(id)a3 whenSyncDownCompletesLookingForItemID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0uLL;
  uint64_t v28 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenSyncDownCompletesLookingForItemID:]", 4730, &v27);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = (void *)v27;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    uint64_t v36 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting sync down to complete for item %@%@", buf, 0x20u);
  }

  long long v29 = v27;
  uint64_t v30 = v28;
  if (v6 && v7)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke;
    v22[3] = &unk_265082D98;
    long long v25 = v29;
    uint64_t v26 = v30;
    id v10 = v6;
    id v24 = v10;
    v22[4] = self;
    id v11 = v7;
    id v23 = v11;
    uint64_t v12 = (void *)MEMORY[0x2455D9A50](v22);
    __int16 v13 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_505;
    uint64_t v18[3] = &unk_265082CF8;
    void v18[4] = self;
    id v19 = v11;
    id v20 = v12;
    id v21 = v10;
    id v14 = v12;
    dispatch_async_with_logs_5(v13, v18);

    uint64_t v15 = v24;
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)MEMORY[0x2455D9A50](v6);
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    long long v17 = *(_OWORD *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 72);
    id v3 = brc_bread_crumbs();
    char v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
    __brc_leave_section((uint64_t *)&v17);
    return;
  }
  if (![*(id *)(a1 + 32) _shouldFailSyncDownWaitImmediately])
  {
    long long v17 = *(_OWORD *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 72);
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2();
    }

    int v8 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_504;
    v12[3] = &unk_265082D70;
    long long v15 = *(_OWORD *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 72);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v14 = v9;
    v12[4] = v10;
    id v13 = v11;
    dispatch_async_with_logs_5(v8, v12);

    goto LABEL_12;
  }
  int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v5();
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_504(uint64_t a1)
{
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2;
  uint64_t v12 = &unk_265082CA8;
  long long v14 = *(_OWORD *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 48);
  uint64_t v2 = (void *)MEMORY[0x2455D9A50](&v9);
  id v3 = *(void **)(*(void *)(a1 + 32) + 352);
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 352);
  }
  id v7 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(a1 + 40), v9, v10, v11, v12);
  if (!v7)
  {
    id v7 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 352) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  int v8 = (void *)MEMORY[0x2455D9A50](v2);
  [v7 addObject:v8];

  [*(id *)(a1 + 32) _prepareForForegroundSyncDown];
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1();
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_505(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) insertParentChainForItem:*(void *)(a1 + 40)];
  }
  if ([v3 isLive] && (objc_msgSend(v3, "isShareAcceptationFault") & 1) == 0
    || v2
    && ([v2 isLive]
     && [v3 isIdleOrRejected]
     && ([v3 updateFromServerItem:v2],
         [v3 saveToDBForServerEdit:1 keepAliases:0])
     || [v2 isLive]))
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_13:
    v4();
    goto LABEL_21;
  }
  if ([*(id *)(a1 + 32) _shouldFailSyncDownWaitImmediately])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_13;
  }
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v15 = 138412802;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for sync down for %@ in %@%@", (uint8_t *)&v15, 0x20u);
  }

  long long v7 = *(void **)(*(void *)(a1 + 32) + 352);
  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 352);
    *(void *)(v9 + 352) = v8;

    long long v7 = *(void **)(*(void *)(a1 + 32) + 352);
  }
  id v11 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v11)
  {
    id v11 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 352) setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v12 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 48));
  [v11 addObject:v12];

  [*(id *)(a1 + 32) _prepareForForegroundSyncDown];
LABEL_21:
}

- (id)insertParentChainForItem:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__24;
  uint64_t v18 = __Block_byref_object_dispose__24;
  id v19 = 0;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__BRCClientZone_insertParentChainForItem___block_invoke;
  v10[3] = &unk_265082DC0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  LOBYTE(self) = [v5 groupInTransaction:v10];

  if ((self & 1) == 0)
  {
    long long v7 = (void *)v15[5];
    void v15[5] = 0;
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

uint64_t __42__BRCClientZone_insertParentChainForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v5 = [v4 maxSyncPathDepth];

  id v6 = (void *)[v3 fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, height) AS(    SELECT item_parent_id, zone_rowid, 0 FROM server_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT si.item_parent_id, si.zone_rowid, p.height + 1 FROM server_items AS si  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT ip.item_id, ip.zone_rowid FROM item_parents AS ip WHERE NOT EXISTS (SELECT 1 FROM client_items AS ci WHERE ip.item_id = ci.item_id   AND ip.zone_rowid = ci.zone_rowid) AND NOT item_id_is_root(ip.item_id) ORDER BY ip.height DESC", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 32), v5];
  while ([v6 next])
  {
    long long v7 = [v6 objectOfClass:objc_opt_class() atIndex:0];
    id v8 = [v6 numberAtIndex:1];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 8) serverZoneByRowID:v8];
    uint64_t v10 = [v9 clientZone];
    id v11 = [v10 serverItemByItemID:v7];
    uint64_t v12 = (void *)[v11 newLocalItemWithServerZone:v9 dbRowID:0];
    char v13 = [v12 saveToDB];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
  }
  if ([*(id *)(a1 + 40) existsByItemID:*(void *)(a1 + 32)])
  {
    uint64_t v14 = 1;
  }
  else
  {
    int v15 = [*(id *)(a1 + 40) serverItemByItemID:*(void *)(a1 + 32)];
    uint64_t v16 = [*(id *)(a1 + 40) serverZone];
    uint64_t v17 = [v15 newLocalItemWithServerZone:v16 dbRowID:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) saveToDB];
  }
LABEL_8:

  return v14;
}

- (void)_enumerateAndClearLocateBlocksForRecordID:(id)a3 exists:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID removeObjectForKey:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
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
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)performBlock:(id)a3 whenLocatingCompletesForItemWithRecordID:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenLocatingCompletesForItemWithRecordID:]", 4873, &v30);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v35 = (void *)v30;
    __int16 v36 = 2112;
    uint64_t v37 = v8;
    __int16 v38 = 2112;
    id v39 = v7;
    __int16 v40 = 2112;
    long long v41 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting to locate item [%@] with record ID [%@]%@", buf, 0x2Au);
  }

  long long v32 = v30;
  uint64_t v33 = v31;
  if (v7 && v6 && v8)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke;
    uint64_t v23[3] = &unk_265082E10;
    long long v28 = v32;
    uint64_t v29 = v33;
    id v11 = v8;
    id v24 = v11;
    id v12 = v6;
    id v27 = v12;
    long long v25 = self;
    id v26 = v7;
    long long v13 = (void *)MEMORY[0x2455D9A50](v23);
    long long v14 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_521;
    v19[3] = &unk_265082CF8;
    void v19[4] = self;
    id v20 = v11;
    id v21 = v13;
    id v22 = v12;
    id v15 = v13;
    dispatch_async_with_logs_5(v14, v19);

    uint64_t v16 = v24;
  }
  else
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)MEMORY[0x2455D9A50](v6);
      *(_DWORD *)buf = 138413058;
      __int16 v35 = v18;
      __int16 v36 = 2112;
      uint64_t v37 = v8;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      long long v41 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %@, %@ and %@ must be non nil to register action%@", buf, 0x2Au);
    }
  }
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (a2 && (a3 & 1) == 0)
  {
    long long v42 = *(_OWORD *)(a1 + 64);
    uint64_t v43 = *(void *)(a1 + 80);
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v45 = (void *)v42;
      __int16 v46 = 2112;
      long long v47 = v29;
      __int16 v48 = 2112;
      long long v49 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Execute block directly.%@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __brc_leave_section((uint64_t *)&v42);
    return;
  }
  if (a2 && a3)
  {
    id v6 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v7 = [v6 maxSyncPathDepth];

    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
    uint64_t v9 = (void *)[v8 fetch:@" WITH RECURSIVE item_parents (item_parent_id, zone_rowid, height) AS(    SELECT item_parent_id, zone_rowid, 0 FROM server_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT si.item_parent_id, si.zone_rowid, p.height + 1 FROM server_items AS si  INNER JOIN item_parents AS p where (si.item_id = p.item_parent_id)  LIMIT %u) SELECT item_parent_id FROM item_parents ORDER BY height DESC", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 32), v7];

    if ([v9 next])
    {
      uint64_t v10 = [v9 objectOfClass:objc_opt_class() atIndex:0];
      if (([v10 isNonDesktopRoot] & 1) != 0 || objc_msgSend(v10, "isDocumentsFolder"))
      {
        long long v42 = *(_OWORD *)(a1 + 64);
        uint64_t v43 = *(void *)(a1 + 80);
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = [*(id *)(a1 + 32) debugItemIDString];
          *(_DWORD *)buf = 134218498;
          uint64_t v45 = (void *)v42;
          __int16 v46 = 2112;
          long long v47 = v33;
          __int16 v48 = 2112;
          long long v49 = v11;
          _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Parent chain confirmed. Execute block directly.%@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        __brc_leave_section((uint64_t *)&v42);

        return;
      }
    }
    else
    {
      long long v13 = brc_bread_crumbs();
      long long v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1();
      }
    }
  }
  long long v42 = *(_OWORD *)(a1 + 64);
  uint64_t v43 = *(void *)(a1 + 80);
  id v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v30 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 134218498;
    uint64_t v45 = (void *)v42;
    __int16 v46 = 2112;
    long long v47 = v30;
    __int16 v48 = 2112;
    long long v49 = v15;
    _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Need to locate item [%@]%@", buf, 0x20u);
  }
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_512;
  void v37[3] = &unk_265082DE8;
  long long v40 = *(_OWORD *)(a1 + 64);
  uint64_t v41 = *(void *)(a1 + 80);
  id v38 = *(id *)(a1 + 32);
  id v39 = *(id *)(a1 + 56);
  uint64_t v17 = (void *)MEMORY[0x2455D9A50](v37);
  uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 360);
  if (!v18)
  {
    uint64_t v19 = objc_opt_new();
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = *(void **)(v20 + 360);
    *(void *)(v20 + 360) = v19;

    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 360);
  }
  id v22 = [v18 objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v22)
  {
    id v22 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 40) + 360) setObject:v22 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  id v23 = (void *)MEMORY[0x2455D9A50](v17);
  [v22 addObject:v23];

  id v24 = [*(id *)(a1 + 40) locateRecordIfNecessaryForRecordID:*(void *)(a1 + 48) isUserWaiting:1];
  if (v24)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_513;
    uint64_t v34[3] = &unk_26507F5E0;
    id v25 = *(id *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 40);
    id v35 = v25;
    uint64_t v36 = v26;
    [v24 addLocateRecordCompletionBlock:v34];
  }
  else
  {
    id v27 = brc_bread_crumbs();
    long long v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      uint64_t v31 = [*(id *)(a1 + 32) debugItemIDString];
      long long v32 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = v31;
      __int16 v46 = 2112;
      long long v47 = v32;
      __int16 v48 = 2112;
      long long v49 = v27;
      _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] Fail to create LocateRecordOperation for item [%@] with record ID [%@] --> Fail all waiting blocks.%@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) _enumerateAndClearLocateBlocksForRecordID:*(void *)(a1 + 48) exists:0];
  }

  __brc_leave_section((uint64_t *)&v42);
}

uint64_t __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_512(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (long long *)(a1 + 48);
  if (a2)
  {
    long long v9 = *v3;
    uint64_t v10 = *(void *)(a1 + 64);
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      long long v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] located successfully%@", buf, 0x20u);
    }
  }
  else
  {
    long long v9 = *v3;
    uint64_t v10 = *(void *)(a1 + 64);
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      long long v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] was not located%@", buf, 0x20u);
    }
  }

  __brc_leave_section((uint64_t *)&v9);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_513(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      uint64_t v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] Locate record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  [*(id *)(a1 + 40) _enumerateAndClearLocateBlocksForRecordID:*(void *)(a1 + 32) exists:a2];
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_521(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(a1 + 40)];
  id v4 = [(id)*(v2 - 1) itemByItemID:*v2];
  if (!v4)
  {
    id v4 = [*(id *)(a1 + 32) insertParentChainForItem:*(void *)(a1 + 40)];
  }
  if ([v4 isLive] && (objc_msgSend(v4, "isShareAcceptationFault") & 1) == 0) {
    goto LABEL_9;
  }
  if (v3)
  {
    if ([v3 isLive])
    {
      if ([v4 isIdleOrRejected])
      {
        [v4 updateFromServerItem:v3];
        if ([v4 saveToDBForServerEdit:1 keepAliases:0])
        {
LABEL_9:
          id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_21:
          v5();
          goto LABEL_22;
        }
      }
    }
    if ([v3 isLive])
    {
      id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_21;
    }
  }
  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    int v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      __int16 v13 = [*(id *)(a1 + 40) debugItemIDString];
      int v14 = 138412802;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting to locate item [%@]%@", (uint8_t *)&v14, 0x20u);
    }
    goto LABEL_20;
  }
  id v6 = +[BRCSystemResourcesManager manager];
  char v7 = [v6 isNetworkReachable];

  if (v7)
  {
LABEL_20:
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_21;
  }
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_521_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_22:
}

- (BOOL)hasHighPriorityWatchers
{
  uint64_t v3 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForItemID count];
  uint64_t v4 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID count] + v3;
  uint64_t v5 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForBookmarkData count];
  uint64_t v6 = v4 + v5 + [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID count];
  uint64_t v7 = v6 + [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID count];
  return v7 + [(NSMutableArray *)self->_blockedOperationsOnInitialSync count] != 0;
}

- (BOOL)removeItemOnDiskBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BRCClientZone_removeItemOnDiskBlock___block_invoke;
  block[3] = &unk_265080510;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __39__BRCClientZone_removeItemOnDiskBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) popOnDiskBlockForItemID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (BOOL)removeItemIsDownloadedBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke;
  block[3] = &unk_265080510;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) popDownloadedBlockForItemID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (BOOL)removeSyncDownForItemIDBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke;
  block[3] = &unk_265080510;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

uint64_t __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 352) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 352);
  return [v4 removeObjectForKey:v3];
}

- (id)syncDownAnalyticsError
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  [v3 syncDownDelayForFailure];
  double v5 = v4;

  char v6 = atomic_load(&self->_syncState);
  if ((v6 & 2) != 0
    && self->_lastSyncDownError
    && ([(BRCSyncOperationThrottle *)self->_syncDownThrottle delay], v7 > v5)
    && (lastSyncDownError = self->_lastSyncDownError,
        uint64_t v13 = 0,
        [(NSError *)lastSyncDownError brc_telemetryReportableErrorWithRecordName:&v13], v9 = objc_claimAutoreleasedReturnValue(), BOOL v10 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled], v9))
  {
    uint64_t v11 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:0 enhancedDrivePrivacyEnabled:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)syncUpAnalyticsError
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  [v3 syncUpDelayForFailure];
  double v5 = v4;

  char v6 = atomic_load(&self->_syncState);
  if ((v6 & 1) != 0
    && self->_lastSyncUpError
    && ([(BRCSyncOperationThrottle *)self->_syncUpThrottle delay], v7 > v5)
    && (lastSyncUpError = self->_lastSyncUpError,
        uint64_t v14 = 0,
        [(NSError *)lastSyncUpError brc_telemetryReportableErrorWithRecordName:&v14], v9 = objc_claimAutoreleasedReturnValue(), lastSyncUpErrorWasOnChainedItem = self->_lastSyncUpErrorWasOnChainedItem, BOOL v11 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled], v9))
  {
    uint64_t v12 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:lastSyncUpErrorWasOnChainedItem enhancedDrivePrivacyEnabled:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (!a3)
  {
    if ([(BRCClientZone *)self hasHighPriorityWatchers])
    {
      double v4 = [(BRCPQLConnection *)self->_db serialQueue];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __44__BRCClientZone_networkReachabilityChanged___block_invoke;
      v5[3] = &unk_26507ED70;
      v5[4] = self;
      dispatch_async_with_logs_5(v4, v5);
    }
  }
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone networkReachabilityChanged:]_block_invoke", 5085, v4);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) _removeAllShareAcceptanceBlocks];
  __brc_leave_section(v4);
}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4 = a3;
  double v5 = [(BRCClientZone *)self mangledID];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [v4 hash];

  return v7 ^ v6;
}

- (void)_appendToString:(id)a3 descriptionOfFieldNamed:(id)a4 inResultSet:(id)a5 pos:(int *)a6 containsSize:(BOOL)a7 context:(id)a8
{
  BOOL v9 = a7;
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  if (v9)
  {
    ++*a6;
    uint64_t v16 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
    ++*a6;
    uint64_t v17 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  ++*a6;
  uint64_t v18 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  ++*a6;
  uint64_t v19 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  uint64_t v20 = v19;
  if (v16 || v17 || v18 || v19)
  {
    if (v9)
    {
      id v21 = +[BRCDumpContext stringFromByteCount:v17 context:v15];
      id v22 = +[BRCDumpContext stringFromByteCount:v16 context:v15];
      [v23 appendFormat:@"%@{needs:(count:%lld, size:%@) done:(count:%lld, size:%@)} ", v13, v20, v21, v18, v22];
    }
    else
    {
      [v23 appendFormat:@"%@{needs:%lld done:%lld} ", v13, v19, v18];
    }
  }
}

- (void)_dumpRecursivePropertiesOfItemByRowID:(unint64_t)a3 context:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  BOOL v9 = [v8 db];
  BOOL v10 = (void *)[v9 fetch:@"SELECT dir_faults_count, uploaded_size,needs_upload_size, uploaded_count,needs_upload_count, synced_up_count,needs_sync_up_count, over_quota_count, shared_by_me_count, shared_to_me_count, needs_delete_doc_count FROM item_recursive_properties  WHERE item_rowid = %llu", a3];

  if ([v10 next])
  {
    id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
    int v19 = 1;
    uint64_t v12 = [v10 unsignedLongLongAtIndex:0];
    if (v12) {
      objc_msgSend(v11, "appendFormat:", @"dir-faults:%lld ", v12);
    }
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"upload" inResultSet:v10 pos:&v19 containsSize:1 context:v8];
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"sync-up" inResultSet:v10 pos:&v19 containsSize:0 context:v8];
    ++v19;
    uint64_t v13 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v13) {
      objc_msgSend(v11, "appendFormat:", @"quota:%lld ", v13);
    }
    ++v19;
    uint64_t v14 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v14) {
      objc_msgSend(v11, "appendFormat:", @"sbmc:%lld ", v14);
    }
    ++v19;
    uint64_t v15 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v15) {
      objc_msgSend(v11, "appendFormat:", @"stmc:%lld ", v15);
    }
    ++v19;
    uint64_t v16 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v16) {
      objc_msgSend(v11, "appendFormat:", @"nd:%lld ", v16);
    }
    if (v19 != 11)
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone _dumpRecursivePropertiesOfItemByRowID:context:depth:]();
      }
    }
    if ([v11 length]) {
      [v8 writeLineWithFormat:@"%*s> %@", v5, "", v11];
    }
  }
}

- (BOOL)_dumpItemsToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  BOOL v10 = self->_session;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x2050000000;
  uint64_t v69 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  int v65 = 0;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke;
  v54[3] = &unk_265082E38;
  id v11 = v8;
  id v55 = v11;
  long long v59 = &v62;
  BOOL v61 = a4;
  id v41 = v9;
  id v56 = v41;
  long long v57 = self;
  long long v40 = v10;
  long long v58 = v40;
  long long v60 = &v66;
  v67[3] = (uint64_t)v54;
  long long v42 = self;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    uint64_t v12 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v13 = [v12 appLibraries];
    unint64_t v14 = [v13 count];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v15 = [(BRCClientZone *)self asPrivateClientZone];
    obuint64_t j = [v15 appLibraries];

    uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v71 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v51;
      char v18 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v14 >= 2)
          {
            if ((v18 & 1) == 0) {
              [v11 writeLineWithFormat:&stru_26F3822F0];
            }
            id v21 = [v20 logName];
            id v22 = [v20 dbRowID];
            [v11 writeLineWithFormat:@"----------------------%@[%@]----------------------", v21, v22];

            char v18 = 0;
          }
          id v23 = [v20 fetchRootItem];
          id v24 = [v23 descriptionWithContext:v11];
          [v11 writeLineWithFormat:@"%@", v24];

          *((_DWORD *)v63 + 6) = 0;
          uint64_t v25 = v67[3];
          uint64_t v26 = [v23 itemGlobalID];
          (*(void (**)(uint64_t, void *, void, id *))(v25 + 16))(v25, v26, 0, a5);

          LOBYTE(v25) = [v11 isCancelled];
          if (v25)
          {
            BOOL v38 = 0;
            goto LABEL_31;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v71 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  [v11 writeLineWithFormat:&stru_26F3822F0];
  id v27 = [v11 db];
  obuint64_t j = (id)[v27 numberWithSQL:@"SELECT COUNT(*) FROM client_items WHERE zone_rowid = %@", v42->_dbRowID];

  unint64_t v28 = [obj unsignedIntegerValue];
  if (v28 > [v41 count])
  {
    if (![(BRCClientZone *)v42 isSharedZone]) {
      [v11 writeLineWithFormat:@"ORPHANED ITEMS:"];
    }
    uint64_t v29 = [v11 db];
    long long v30 = (void *)[v29 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE zone_rowid = %@ AND NOT indexset_contains(%p, rowid)", v42->_dbRowID, v41];
    *((_DWORD *)v63 + 6) = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2;
    v44[3] = &unk_26507F210;
    v44[4] = v42;
    id v31 = v29;
    id v45 = v31;
    long long v32 = [v30 enumerateObjects:v44];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v70 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          ++*((_DWORD *)v63 + 6);
          if ((objc_msgSend(v11, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0)
          {

            BOOL v38 = 0;
            goto LABEL_30;
          }
          uint64_t v37 = [v36 descriptionWithContext:v11];
          [v11 writeLineWithFormat:@"%@", v37];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v70 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    [v11 writeLineWithFormat:&stru_26F3822F0];
    BOOL v38 = 1;
LABEL_30:
  }
  else
  {
    BOOL v38 = 1;
  }
LABEL_31:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  return v38;
}

uint64_t __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) db];
  id v9 = [v7 itemID];
  BOOL v10 = [v7 zoneRowID];
  id v11 = (void *)[v8 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation     FROM client_items AS ci     LEFT JOIN item_recursive_properties AS rp      ON ci.rowid = rp.item_rowid    WHERE ci.item_parent_id = %@ AND ci.item_parent_zone_rowid = %@ ORDER BY (rp.needs_sync_up_count + rp.needs_upload_count + rp.needs_delete_doc_count) DESC", v9, v10];

  if ([v11 next])
  {
    unsigned int v45 = a3 + 1;
    uint64_t v47 = a3;
    uint64_t v48 = a3;
    id v43 = v7;
    uint64_t v44 = a3;
    uint64_t v12 = a3;
    uint64_t v46 = a4;
    while (1)
    {
      uint64_t v13 = (void *)MEMORY[0x2455D97F0]();
      unint64_t v14 = *(void **)(a1 + 32);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (!objc_msgSend(v14, "shouldKeepDumpingWithItemCount:includeAllItems:")) {
        break;
      }
      uint64_t v15 = [v11 integerAtIndex:0];
      if ([*(id *)(a1 + 40) containsIndex:v15])
      {
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = [v11 objectOfClass:objc_opt_class() atIndex:2];
        char v18 = +[BRCDumpContext stringFromItemID:v17 context:*(void *)(a1 + 32)];
        [v16 writeLineWithFormat:@"%*sERROR: item ID %@ seen twice", v12, "", v18];
      }
      else
      {
        [*(id *)(a1 + 40) addIndex:v15];
        int v19 = [*(id *)(a1 + 48) session];
        uint64_t v20 = [*(id *)(a1 + 32) db];
        uint64_t v17 = (void *)[v19 newLocalItemFromPQLResultSet:v11 db:v20 error:a4];

        if (!v17) {
          goto LABEL_32;
        }
        id v21 = [v17 clientZone];
        id v22 = *(void **)(a1 + 48);

        if (v21 == v22)
        {
          char v18 = &stru_26F3822F0;
        }
        else
        {
          id v23 = [NSString alloc];
          id v24 = [v17 clientZone];
          uint64_t v25 = [v24 mangledID];
          char v18 = (__CFString *)[v23 initWithFormat:@"zone:%@ ", v25];

          uint64_t v12 = v48;
        }
        uint64_t v26 = *(void **)(a1 + 32);
        id v27 = [v17 descriptionWithContext:v26];
        [v26 writeLineWithFormat:@"%*s%@%@", v47, "", v18, v27];

        [*(id *)(a1 + 48) _dumpRecursivePropertiesOfItemByRowID:v15 context:*(void *)(a1 + 32) depth:v12];
        if ([*(id *)(a1 + 32) liveDaemon])
        {
          unint64_t v28 = [*(id *)(a1 + 56) fsUploader];
          uint64_t v29 = [v28 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          long long v30 = [*(id *)(a1 + 56) applyScheduler];
          id v31 = [v30 descriptionForRejectedItem:v17 context:*(void *)(a1 + 32)];

          long long v32 = [*(id *)(a1 + 56) fsDownloader];
          uint64_t v33 = [v32 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          uint64_t v34 = [*(id *)(a1 + 56) syncUpScheduler];
          id v35 = [v34 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          if (v29 || v31 || v33 || v35)
          {
            id v36 = objc_alloc_init(MEMORY[0x263F089D8]);
            uint64_t v37 = v36;
            if (v29) {
              [v36 appendFormat:@" upload{%@}", v29];
            }
            if (v31) {
              [v37 appendFormat:@" rejected{%@}", v31];
            }
            if (v33) {
              [v37 appendFormat:@" downloader{%@}", v33];
            }
            if (v35) {
              [v37 appendFormat:@" sync-up{%@}", v35];
            }
            [*(id *)(a1 + 32) writeLineWithFormat:@"%*s>%@", v44, "", v37];
          }
          a4 = v46;
          uint64_t v12 = v48;
        }
        int v38 = [v17 isDirectory];
        if ((int)v12 <= 99)
        {
          if (v38)
          {
            uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            long long v40 = [v17 itemGlobalID];
            LOBYTE(v39) = (*(uint64_t (**)(uint64_t, void *, void, uint64_t))(v39 + 16))(v39, v40, v45, a4);

            if ((v39 & 1) == 0)
            {

LABEL_32:
              break;
            }
          }
        }
      }

      if (([v11 next] & 1) == 0)
      {
        uint64_t v41 = 1;
        goto LABEL_34;
      }
    }
    uint64_t v41 = 0;
LABEL_34:
    id v7 = v43;
  }
  else
  {
    uint64_t v41 = 1;
  }

  return v41;
}

id __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!self->_activated) {
    goto LABEL_95;
  }
  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  char v95 = [(BRCClientZone *)self syncState];
  brc_current_date_nsec();
  long long v98 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    id v9 = [(BRCClientZone *)self asPrivateClientZone];
    BOOL v10 = [v9 defaultAppLibrary];
    int v11 = [v10 isGreedy];
    uint64_t v12 = @"(greedy)";
    if (!v11) {
      uint64_t v12 = &stru_26F3822F0;
    }
    [v7 writeLineWithFormat:@"pending activity %@", v12];
  }
  else
  {
    [v7 writeLineWithFormat:@"pending activity %@", &stru_26F3822F0];
  }
  [v7 writeLineWithFormat:@"================"];
  if (v5)
  {
    uint64_t v13 = [(BRCAccountSessionFPFS *)self->_session fsDownloader];
    unint64_t v14 = [v13 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ downloads:%@", v14];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ downloads: not dumping"];
  }
  [v7 pushIndentation];
  id v97 = v8;
  BOOL v96 = v5;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v15 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v16 = [v15 appLibraries];

    obuint64_t j = v16;
    uint64_t v103 = [v16 countByEnumeratingWithState:&v125 objects:v132 count:16];
    if (v103)
    {
      uint64_t v101 = *(void *)v126;
      do
      {
        for (uint64_t i = 0; i != v103; ++i)
        {
          if (*(void *)v126 != v101) {
            objc_enumerationMutation(obj);
          }
          char v18 = *(void **)(*((void *)&v125 + 1) + 8 * i);
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          int v19 = [v18 transferSyncContextIfExists];
          uint64_t v20 = [v19 downloadStream];
          id v21 = [v20 operations];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v121 objects:v131 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v122;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v122 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v121 + 1) + 8 * j);
                id v27 = [v18 logName];
                unint64_t v28 = [v26 descriptionWithContext:v7];
                [v7 writeLineWithFormat:@"%@: %@", v27, v28];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v121 objects:v131 count:16];
            }
            while (v23);
          }
        }
        uint64_t v103 = [obj countByEnumeratingWithState:&v125 objects:v132 count:16];
      }
      while (v103);
    }

    id v8 = v97;
    BOOL v5 = v96;
  }
  [v7 popIndentation];
  if (v5)
  {
    uint64_t v29 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
    long long v30 = [v29 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ uploads:  %@", v30];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ uploads:  not dumping"];
  }
  [v7 pushIndentation];
  id v31 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
  long long v32 = [v31 thumbnailGenerationManager];
  [v7 writeLineWithFormat:@"%@", v32];

  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    uint64_t v33 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v34 = [v33 appLibraries];

    id obja = v34;
    uint64_t v104 = [v34 countByEnumeratingWithState:&v117 objects:v130 count:16];
    if (v104)
    {
      uint64_t v102 = *(void *)v118;
      do
      {
        for (uint64_t k = 0; k != v104; ++k)
        {
          if (*(void *)v118 != v102) {
            objc_enumerationMutation(obja);
          }
          id v36 = *(void **)(*((void *)&v117 + 1) + 8 * k);
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          uint64_t v37 = [v36 transferSyncContextIfExists];
          int v38 = [v37 uploadStream];
          uint64_t v39 = [v38 operations];

          uint64_t v40 = [v39 countByEnumeratingWithState:&v113 objects:v129 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v114;
            do
            {
              for (uint64_t m = 0; m != v41; ++m)
              {
                if (*(void *)v114 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void **)(*((void *)&v113 + 1) + 8 * m);
                unsigned int v45 = [v36 logName];
                uint64_t v46 = [v44 descriptionWithContext:v7];
                [v7 writeLineWithFormat:@"%@: %@", v45, v46];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v113 objects:v129 count:16];
            }
            while (v41);
          }
        }
        uint64_t v104 = [obja countByEnumeratingWithState:&v117 objects:v130 count:16];
      }
      while (v104);
    }

    id v8 = v97;
    BOOL v5 = v96;
  }
  if (self->_allItemsDidUploadTrackers) {
    [v7 writeLineWithFormat:@"sync bubble waiting"];
  }
  [v7 popIndentation];
  if (v5)
  {
    uint64_t v47 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    uint64_t v48 = [v47 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ apply:    %@", v48];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ reader:   not dumping"];
    [v7 writeLineWithFormat:@"+ apply:    not dumping"];
  }
  if ([(NSMutableDictionary *)self->_runningListOperations count])
  {
    [v7 writeLineWithFormat:@"+ list:"];
    [v7 pushIndentation];
    long long v49 = (void *)[(NSMutableDictionary *)self->_runningListOperations copy];
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke;
    v111[3] = &unk_265082E60;
    id v50 = v7;
    id v112 = v50;
    [v49 enumerateKeysAndObjectsUsingBlock:v111];

    [v50 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_recursiveListOperations count])
  {
    [v7 writeLineWithFormat:@"+ rec-list:"];
    [v7 pushIndentation];
    long long v51 = (void *)[(NSMutableDictionary *)self->_recursiveListOperations copy];
    v109[0] = MEMORY[0x263EF8330];
    v109[1] = 3221225472;
    v109[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2;
    v109[3] = &unk_265082E88;
    id v52 = v7;
    id v110 = v52;
    [v51 enumerateKeysAndObjectsUsingBlock:v109];

    [v52 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_fetchParentOperations count])
  {
    [v7 writeLineWithFormat:@"+ fetch-parent:"];
    [v7 pushIndentation];
    long long v53 = (void *)[(NSMutableDictionary *)self->_fetchParentOperations copy];
    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3;
    v107[3] = &unk_265082EB0;
    id v54 = v7;
    id v108 = v54;
    [v53 enumerateKeysAndObjectsUsingBlock:v107];

    [v54 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_locateRecordOperations count])
  {
    [v7 writeLineWithFormat:@"+ locate-record:"];
    [v7 pushIndentation];
    id v55 = (void *)[(NSMutableDictionary *)self->_locateRecordOperations copy];
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4;
    v105[3] = &unk_265082ED8;
    id v56 = v7;
    id v106 = v56;
    [v55 enumerateKeysAndObjectsUsingBlock:v105];

    [v56 popIndentation];
  }
  if (self->_fetchRecentsOperation)
  {
    [v7 writeLineWithFormat:@"+ fetch-recents:"];
    [v7 pushIndentation];
    [v7 writeLineWithFormat:@"%@", self->_fetchRecentsOperation];
    [v7 popIndentation];
  }
  unsigned int v57 = [(BRCClientZone *)self _appLibrariesState];
  if ([v7 liveDaemon])
  {
    if (self->_syncUpOperation)
    {
      long long v58 = @" [sync-up running]";
      char v59 = v95;
    }
    else
    {
      char v59 = v95;
      if (!(self->_state & 0x100 | v57 & 0x80000) && (v95 & 0x71) == 0x21)
      {
        brc_interval_from_nsec();
        double v61 = v60;
        [(BRCSyncOperationThrottle *)self->_syncUpThrottle nextTry];
        if (v62 <= v61)
        {
          uint64_t v64 = @"because of item ";
        }
        else
        {
          [(BRCSyncOperationThrottle *)self->_syncUpThrottle nextTry];
          double v61 = v63;
          uint64_t v64 = &stru_26F3822F0;
        }
        [(BRCSyncBudgetThrottle *)self->_syncUpBudget nextDateWithBudgetWithDefaults:v98];
        if (v90 > v61)
        {
          [(BRCSyncBudgetThrottle *)self->_syncUpBudget nextDateWithBudgetWithDefaults:v98];
          double v61 = v91;
          uint64_t v64 = @"for budget ";
        }
        brc_interval_from_nsec();
        if (v61 <= v92)
        {
          int v65 = @" [sync-up waiting to be scheduled]";
          uint64_t v66 = 7;
        }
        else
        {
          id v93 = [NSString alloc];
          brc_interval_from_nsec();
          int v65 = (__CFString *)[v93 initWithFormat:@" [sync-up throttled %@(next-try:in %.01fs)]", v64, v61 - v94];
          uint64_t v66 = 3;
        }
        char v59 = v95;
        goto LABEL_74;
      }
      long long v58 = @" [sync-up waiting for sync down]";
    }
    if (v59) {
      int v65 = v58;
    }
    else {
      int v65 = 0;
    }
    if (v59) {
      uint64_t v66 = 7;
    }
    else {
      uint64_t v66 = 0;
    }
LABEL_74:
    if (self->_syncDownOperation)
    {
      long long v67 = 0;
      uint64_t v68 = 0;
    }
    else
    {
      long long v67 = 0;
      if ((self->_state & 0x100) != 0)
      {
        uint64_t v68 = 0;
      }
      else
      {
        uint64_t v68 = 0;
        if ((v59 & 2) != 0)
        {
          [(BRCSyncOperationThrottle *)self->_syncDownThrottle nextTry];
          double v86 = v85;
          brc_interval_from_nsec();
          if (v86 <= v87)
          {
            long long v67 = @" [sync-down waiting to be scheduled]";
            uint64_t v68 = 7;
          }
          else
          {
            uint64_t v88 = NSString;
            brc_interval_from_nsec();
            objc_msgSend(v88, "stringWithFormat:", @" [sync-down throttled (next-try:in %.01fs)]", v86 - v89);
            long long v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v68 = 3;
          }
        }
      }
    }
    if (v65)
    {
      uint64_t v69 = +[BRCDumpContext highlightedString:v65 type:v66 context:v7];
      [v8 appendString:v69];
    }
    if (v67)
    {
      long long v70 = +[BRCDumpContext highlightedString:v67 type:v68 context:v7];
      [v8 appendString:v70];
    }
    [v8 appendFormat:@" [scheduling: %@]", self->_syncDeadlineSource];
    [v7 writeLineWithFormat:@"+ sync:      %@", v8];
    long long v71 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
    uint64_t v72 = [v71 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"  up:        %@", v72];

    long long v73 = [(BRCSyncBudgetThrottle *)self->_syncUpBudget debugDescriptionWithDefaults:v98];
    [v7 writeLineWithFormat:@"  up-budget: %@", v73];

    lastSyncUpError = self->_lastSyncUpError;
    if (lastSyncUpError)
    {
      uint64_t v75 = +[BRCDumpContext stringFromError:lastSyncUpError context:v7];
      [v7 writeLineWithFormat:@"  up-error:  %@", v75];
    }
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      v77 = +[BRCDumpContext stringFromError:lastSyncDownError context:v7];
      [v7 writeLineWithFormat:@"  dn-error   %@", v77];
    }
    syncUpOperatiouint64_t n = self->_syncUpOperation;
    if (syncUpOperation || (syncUpOperatiouint64_t n = self->_syncDownOperation) != 0)
    {
      __int16 v79 = [syncUpOperation descriptionWithContext:v7];
      [v7 writeLineWithFormat:@"  operation: %@", v79];
    }
    char v80 = [(BRCClientZone *)self session];
    uint64_t v81 = [v80 serverState];
    uint64_t v82 = [(BRCClientZone *)self mangledID];
    uint64_t v83 = [v81 dumpMigrationQueriesForMangledID:v82];

    if (v83) {
      [v7 writeLineWithFormat:@"+ migration: %@", v83];
    }
  }
  if ([(NSSet *)self->_itemIDsBlockedFromSyncForCZMProcessing count]) {
    [v7 writeLineWithFormat:@"+ process-removal: %@", self->_itemIDsBlockedFromSyncForCZMProcessing];
  }
  if ([(NSMutableArray *)self->_faultsLiveBarriers count]) {
    objc_msgSend(v7, "writeLineWithFormat:", @"+ barriers:  %ld", -[NSMutableArray count](self->_faultsLiveBarriers, "count"));
  }

LABEL_95:
  return 1;
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

- (BOOL)shouldSyncMangledID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  int v6 = [v5 forceSyncOverride];

  if (v6 == 1) {
    goto LABEL_7;
  }
  if (v6 == 255)
  {
    char v7 = 0;
    goto LABEL_8;
  }
  if ([(BRCClientZone *)self isSharedZone]
    || ([(BRCAccountSessionFPFS *)self->_session appLibraryByMangledID:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasLocalChanges],
        v8,
        (v9 & 1) != 0)
    || [(BRCClientZone *)self _hasNonDiscretionaryServerStitchingOperation])
  {
LABEL_7:
    char v7 = 1;
    goto LABEL_8;
  }
  int v11 = [v4 appLibraryOrZoneName];
  uint64_t v12 = [(BRCClientZone *)self session];
  uint64_t v13 = [v12 appLibraryByMangledID:v4];
  unint64_t v14 = [v13 containerMetadata];
  char v15 = [v14 isDocumentScopePublic];

  char v16 = [v11 isEqualToString:*MEMORY[0x263F324E8]];
  char v7 = 1;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    uint64_t v17 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
    char v7 = [v17 isApplicationInstalledForContainerID:v11];
  }
LABEL_8:

  return v7;
}

- (float)syncUpBackoffDelay
{
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle delay];
  return v2;
}

- (float)syncUpBackoffRatio
{
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio backoffRatio];
  return result;
}

- (void)resetSyncUpBackoffRatio
{
}

- (BOOL)isBusy
{
  return (self->_state & 0x100) != 0
      || ([(BRCClientZone *)self _appLibrariesState] & 0x80000) != 0
      || ([(BRCClientZone *)self syncState] & 0xF) != 0;
}

- (BOOL)activated
{
  return self->_activated;
}

- (BRCClientZoneDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCZoneRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (unint64_t)currentRequestID
{
  return self->_requestID;
}

- (int64_t)lastInsertedRank
{
  return self->_lastInsertedRank;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCDeadlineSource)syncDeadlineSource
{
  return self->_syncDeadlineSource;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
}

- (NSString)osNameRequiredToSync
{
  return self->_osNameRequiredToSync;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (NSDate)lastAttemptedSyncDownDate
{
  return self->_lastAttemptedSyncDownDate;
}

- (void)setLastAttemptedSyncDownDate:(id)a3
{
}

- (NSSet)itemIDsBlockedFromSyncForCZMProcessing
{
  return self->_itemIDsBlockedFromSyncForCZMProcessing;
}

- (NSDictionary)parentsOfCZMFaults
{
  return self->_parentsOfCZMFaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentsOfCZMFaults, 0);
  objc_storeStrong((id *)&self->_itemIDsBlockedFromSyncForCZMProcessing, 0);
  objc_storeStrong((id *)&self->_osNameRequiredToSync, 0);
  objc_storeStrong((id *)&self->_syncThrottles, 0);
  objc_storeStrong((id *)&self->_resetAfterAppUninstallTimer, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_bubbleSyncTask, 0);
  objc_storeStrong((id *)&self->_outOfBandSyncOperations, 0);
  objc_storeStrong((id *)&self->_allItemsDidUploadTrackers, 0);
  objc_storeStrong((id *)&self->_syncDownDependencies, 0);
  objc_storeStrong((id *)&self->_syncDownGroup, 0);
  objc_storeStrong((id *)&self->_directoriesCreatedLastSyncUp, 0);
  objc_storeStrong((id *)&self->_nextIdleHandlers, 0);
  objc_storeStrong((id *)&self->_hasWorkDidUpdateObserver, 0);
  objc_storeStrong((id *)&self->_currentSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_nextSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_locateBlocksToPerformForRecordID, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_downloadedBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_onDiskBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_faultsLiveBarriers, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForBookmarkData, 0);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_appUninstalledDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptedSyncDownDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_appliedTombstoneRanks, 0);
  objc_storeStrong((id *)&self->_locateRecordsOperationThrottle, 0);
  objc_storeStrong((id *)&self->_serverStitchingOperationThrottle, 0);
  objc_storeStrong((id *)&self->_fetchRecentsOperation, 0);
  objc_storeStrong((id *)&self->_locateRecordOperations, 0);
  objc_storeStrong((id *)&self->_fetchParentOperations, 0);
  objc_storeStrong((id *)&self->_recursiveListOperations, 0);
  objc_storeStrong((id *)&self->_runningListOperations, 0);
  objc_storeStrong((id *)&self->_blockedOperationsOnInitialSync, 0);
  objc_storeStrong((id *)&self->_syncDeadlineSource, 0);
  objc_storeStrong((id *)&self->_syncDownThrottle, 0);
  objc_storeStrong((id *)&self->_syncUpBackoffRatio, 0);
  objc_storeStrong((id *)&self->_syncUpBudget, 0);
  objc_storeStrong((id *)&self->_syncUpThrottle, 0);
  objc_storeStrong((id *)&self->_lastSyncDownError, 0);
  objc_storeStrong((id *)&self->_syncDownOperation, 0);
  objc_storeStrong((id *)&self->_lastSyncUpError, 0);
  objc_storeStrong((id *)&self->_syncUpOperation, 0);
  objc_storeStrong((id *)&self->_readerThrottle, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)liveItemByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    [MEMORY[0x263F8C710] formatInjection:@"AND item_id != %@", v10];
  }
  else {
  int v11 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
  }
  id v12 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@        AND item_bouncedname IS NULL)   OR  (item_parent_id = %@ AND item_bouncedname = %@ AND item_parent_zone_rowid = %@))  AND item_state != 1  %@ LIMIT 1", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID, v11];
  if ([v12 next])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__BRCClientZone_FPFSAdditions__liveItemByParentID_andLogicalName_excludingItemID___block_invoke;
    v16[3] = &unk_26507F1E8;
    v16[4] = self;
    uint64_t v13 = [v12 object:v16];
  }
  else
  {
    unint64_t v14 = [MEMORY[0x263F087E8] errorWithSqliteCode:12 andMessage:@"item not found"];
    [(BRCPQLConnection *)self->_db setLastError:v14];

    uint64_t v13 = 0;
  }

  return v13;
}

id __82__BRCClientZone_FPFSAdditions__liveItemByParentID_andLogicalName_excludingItemID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(*(void *)(a1 + 32) + 64) error:a3];

  return v8;
}

- (id)liveItemByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4 excludingItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    [MEMORY[0x263F8C710] formatInjection:@"AND item_id != %@", v10];
  }
  else {
  int v11 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
  }
  id v12 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@        AND item_bouncedname IS NULL)   OR  (item_parent_id = %@ AND item_bouncedname = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@))  AND item_state != 1  %@ LIMIT 1", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID, v11];
  if ([v12 next])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __97__BRCClientZone_FPFSAdditions__liveItemByParentID_andCaseInsensitiveLogicalName_excludingItemID___block_invoke;
    v16[3] = &unk_26507F1E8;
    v16[4] = self;
    uint64_t v13 = [v12 object:v16];
  }
  else
  {
    unint64_t v14 = [MEMORY[0x263F087E8] errorWithSqliteCode:12 andMessage:@"item not found"];
    [(BRCPQLConnection *)self->_db setLastError:v14];

    uint64_t v13 = 0;
  }

  return v13;
}

id __97__BRCClientZone_FPFSAdditions__liveItemByParentID_andCaseInsensitiveLogicalName_excludingItemID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(*(void *)(a1 + 32) + 64) error:a3];

  return v8;
}

- (id)deadItemByParentID:(id)a3 andUnbouncedLogicalName:(id)a4
{
  id v5 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@ AND zone_rowid = %@ AND item_state IN (1, -3) LIMIT 1", a3, a4, self->_dbRowID, self->_dbRowID];
  if ([v5 next])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__BRCClientZone_FPFSAdditions__deadItemByParentID_andUnbouncedLogicalName___block_invoke;
    v9[3] = &unk_26507F1E8;
    v9[4] = self;
    id v6 = [v5 object:v9];
  }
  else
  {
    char v7 = [MEMORY[0x263F087E8] errorWithSqliteCode:12 andMessage:@"item not found"];
    [(BRCPQLConnection *)self->_db setLastError:v7];

    id v6 = 0;
  }

  return v6;
}

id __75__BRCClientZone_FPFSAdditions__deadItemByParentID_andUnbouncedLogicalName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(*(void *)(a1 + 32) + 64) error:a3];

  return v8;
}

- (void)itemMovedIntoShareInThisZone:(id)a3 associatedItemID:(id)a4
{
  id v5 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  db = self->_db;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__BRCClientZone_FPFSAdditions__itemMovedIntoShareInThisZone_associatedItemID___block_invoke;
  v8[3] = &unk_26507F2F8;
  id v9 = v5;
  id v7 = v5;
  [(BRCPQLConnection *)db groupInTransaction:v8];
}

uint64_t __78__BRCClientZone_FPFSAdditions__itemMovedIntoShareInThisZone_associatedItemID___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 st];
  id v4 = [v3 logicalName];
  id v5 = [*(id *)(a1 + 32) parentItemOnFS];
  [v2 updateWithLogicalName:v4 newParent:v5 forceTopLevelShareMove:1];

  [*(id *)(a1 + 32) saveToDB];
  return 1;
}

- (void)signalFaultingWatchersWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_faultsLiveBarriers;
  faultsLiveBarriers = self->_faultsLiveBarriers;
  self->_faultsLiveBarriers = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRCPQLConnection *)self->_db serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__BRCClientZone_FPFSAdditions__notifyClient_whenFaultingIsDone___block_invoke;
  block[3] = &unk_26507F918;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __64__BRCClientZone_FPFSAdditions__notifyClient_whenFaultingIsDone___block_invoke(uint64_t a1)
{
  double v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__BRCClientZone_FPFSAdditions__notifyClient_whenFaultingIsDone___block_invoke_cold_1(a1, (uint64_t)v2, v3);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + 76))
  {
    id v5 = *(void **)(v4 + 328);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void **)(v7 + 328);
      *(void *)(v7 + 328) = v6;

      id v5 = *(void **)(*(void *)(a1 + 40) + 328);
    }
    id v9 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 48));
    [v5 addObject:v9];

    id v10 = [*(id *)(*(void *)(a1 + 40) + 8) applyScheduler];
    [v10 monitorFaultingForZone:*(void *)(a1 + 40)];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)contentBoundaryKeyForItemID:(id)a3 withDB:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BRCClientZone *)self dbRowID];
  id v9 = (void *)[v6 dataWithSQL:@"SELECT content_boundary_key FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v7, v8];

  return v9;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self->_resetTimer%@", v2, v3, v4, v5, v6);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] waiting for %u cancelled operations to finish%@", buf, 0x12u);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_7_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┳%llx continuing reset%@", (void)v3, DWORD2(v3));
}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] deleting from server truth for %@%@", (void)v3, DWORD2(v3));
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = " and unlinking data";
  if (!*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = "";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] Keeping client items during reset%s%@", (void)v4, DWORD2(v4));
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, v0, (uint64_t)v0, "[ERROR] Received the following error while doing the post hard reset phase - %@%@", v1);
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, v0, (uint64_t)v0, "[ERROR] Received the following error while doing the hard reset phase - %@%@", v1);
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] deleting from client truth for %@%@", (void)v3, DWORD2(v3));
}

- (void)asPrivateClientZone
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asPrivateClientZone called on a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)asSharedClientZone
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asSharedClientZone called on a private zone%@", v2, v3, v4, v5, v6);
}

- (void)rootItemID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: must be implemented in subclass%@", v2, v3, v4, v5, v6);
}

- (void)setNeedsSave:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] container state now needs flush: %@%@", (void)v3, DWORD2(v3));
}

- (void)updateWithPlist:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _syncUpBudget && _syncUpThrottle && _syncDownThrottle%@", v2, v3, v4, v5, v6);
}

- (void)scheduleResetServerAndClientTruthsForReason:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: Container needs server and client truths reset: %@%@", (uint8_t *)&v2);
}

- (void)handleSaltingErrorIfNeeded:record:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parent.recordID%@", v2, v3, v4, v5, v6);
}

- (void)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] shared iPad: Not considering %@ for sync bubble tasks because sync is blocked%@", (void)v3, DWORD2(v3));
}

void __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] client zone deallocated%@", v2, v3, v4, v5, v6);
}

void __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] execute zone reset for %@%@", v4);
}

- (void)_activateState:origState:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] cancel zone reset timer for %@%@", v4);
}

- (void)setSyncStateBits:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Asking for sync up but we never synced down, do that first%@", v2, v3, v4, v5, v6);
}

- (void)setSyncStateBits:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Ignoring sync state change because sync is disabled for this container%@", v2, v3, v4, v5, v6);
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] added %@ as out of band sync operation%@");
}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] removed %@ out of band sync operation%@");
}

- (void)_blockSyncDownOnStitchingOperations
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync down has greater priority than %@%@");
}

- (void)syncDownImmediately
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: updated sync-down throttle: %@%@");
}

void __27__BRCClientZone__startSync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)v1 + 104) cost];
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v2, "[DEBUG] Sync: starting sync up with cost:%.1f%@", v3);
}

void __27__BRCClientZone__startSync__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Sync: nothing to sync up%@", v2, v3, v4, v5, v6);
}

void __27__BRCClientZone__startSync__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_14_0(v1);
  brc_interval_from_nsec();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v2, "[DEBUG] Sync: items to sync-up are throttled for another %.1fs%@", v3);
}

void __27__BRCClientZone__startSync__block_invoke_217_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Forcing cancel on sync op%@", v2, v3, v4, v5, v6);
}

void __27__BRCClientZone__startSync__block_invoke_217_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Executing cancelled op %@ so operations waiting on it can proceed%@");
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Located ckinfo in previous zone%@", v2, v3, v4, v5, v6);
}

- (void)_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: requestID:%llu succeeded%@");
}

- (void)_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: requestID:%llu cancelled%@");
}

- (void)_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] decreasing sync-up batch size since server says we exceeded limits%@", v2, v3, v4, v5, v6);
}

- (void)_isIdle
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ isn't idle because it's busy%@", (void)v3, DWORD2(v3));
}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Queueing sync barrier sync down for %@%@");
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Client zone is already idle%@", v2, v3, v4, v5, v6);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23FA42000, v1, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v2, 0x16u);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_274_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx received did-update-has-work notification%@");
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  uint64_t v1 = *(void *)(v0 + 176);
  int v4 = 138412802;
  uint64_t v5 = v1;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  __int16 v8 = 2112;
  uint64_t v9 = v2;
  _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: updated sync-down throttle: %@\n      and container state: %@%@", (uint8_t *)&v4, 0x20u);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Not resuming sync token because %p is still in flight%@");
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  __int16 v6 = [a1 db];
  uint64_t v7 = [v6 lastError];
  int v8 = 138412802;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_7_0();
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23FA42000, a3, (os_log_type_t)0x90u, "[ERROR] Failed to save item to db when updating from server item %@ - %@%@", (uint8_t *)&v8, 0x20u);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_276_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ isn't live, looking for server item%@", (void)v3, DWORD2(v3));
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: requestID:%llu acknowledged%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: just a new sync down without new sync up since requestID:%llu%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.3()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Updated %llu items to strip the oob-sync-ack bit%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _requestID == 0 || requestID <= _requestID%@", v2, v3, v4, v5, v6);
}

- (void)_crossZoneMoveDocumentsToZone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Not cross zone moving a zone to itself%@", v2, v3, v4, v5, v6);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_14_0(v0) lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_23FA42000, v2, v3, "[ERROR] can't save destination zone: %@%@", v4, v5, v6, v7, v8);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_14_0(v0) lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_23FA42000, v2, v3, "[ERROR] can't save cross zone move state: %@%@", v4, v5, v6, v7, v8);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_14_0(v1) lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, v3, "[CRIT] UNREACHABLE: can't cross move items! %@%@", v4);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: db.changes == 0%@", v2, v3, v4, v5, v6);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 error];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, v3, "[CRIT] UNREACHABLE: can't prepare cross move items! %@%@", v4);
}

- (void)_allItemsDidUploadWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] shared iPad: Completed upload for all items for %@%@", (void)v3, DWORD2(v3));
}

- (void)_allItemsDidUploadWithError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self._hasAllItemsDidUploadHandlers%@", v2, v3, v4, v5, v6);
}

void __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Tombstones with ranks are gone: %@%@");
}

- (void)didApplyTombstoneForRank:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking tombstone rank %llu as applied%@");
}

- (void)_registerOperation:(uint64_t)a1 throttler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Blocking server stitching op %@ until we fetch the initial change token%@", (void)v3, DWORD2(v3));
}

- (void)_registerOperation:throttler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] The server zone hasn't been created yet so failing the operation right away%@", v2, v3, v4, v5, v6);
}

- (void)_registerOperation:throttler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] op has priority over the sync down op so cancelling sync down and rescheduling%@", v2, v3, v4, v5, v6);
}

- (void)_registerListOperation:(uint64_t)a1 shareAcceptOperation:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Blocking list on share accept %@%@", (void)v3, DWORD2(v3));
}

- (void)_registerListOperation:(void *)a1 shareAcceptOperation:.cold.2(void *a1)
{
  os_log_t v2 = [a1 folderToList];
  long long v3 = [v2 debugItemIDString];
  [a1 nonDiscretionary];
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v4, v5, "[DEBUG] Starting to list the contents of %@ (%sdiscretionary)%@", v6, v7, v8, v9, 2u);
}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: unexpected nil parent itemID from operation %@%@", (uint8_t *)&v2);
}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Starting to fetch parent chain of %@%@", (void)v3, DWORD2(v3));
}

- (void)_registerLocateRecordOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Starting to locate record for %@%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Can't %@ when not activated%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Can't %@ when sync needs os upgrade%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Can't %@ when the zone doesn't exist%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Can't %@ when resetting%@", (void)v3, DWORD2(v3));
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this list operation%@", v2, v3, v4, v5, v6);
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.2()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Can't list %@ because it had failed previously%@", v4);
}

- (void)fetchDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApplyScheduler:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Cancelling operation %@ because it is discretionary and we have non-discretionary work%@", (void)v3, DWORD2(v3));
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.4()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Can't list changes on %@ when we have already completed full sync%@", v4);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this recursive list operation%@", v2, v3, v4, v5, v6);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:.cold.2()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Continue to recursive list the contents of %@%@", v4);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v6, v4, "[DEBUG] Starting to recursive list the contents of %@%@", v5);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.4(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v6, v4, "[DEBUG] Forcing %@ to list all changes because we cancelled an old version%@", v5);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApply:.cold.5(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] We've completed full sync so just recursively rescheduling items under %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this parent chain%@", v2, v3, v4, v5, v6);
}

- (void)fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Inserted parent chain for itemID because we already completed full sync%@", v2, v3, v4, v5, v6);
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no recordID passed to this locate operation%@", v2, v3, v4, v5, v6);
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't locate share alias record in a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)fetchRecentAndFavoriteDocuments:.cold.1()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Zone doesn't exist so already have recent documents in %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.2()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Already fetched recent and favorite documents in %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.3()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Not fetching recents on a shared zone %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.4()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Staring to fetch recent documents %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.5()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Not fetching recents on a non-public zone %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.6()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Completed full sync so already have recent documents in %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] _fetchRecentsOperation %@ is already running, will invoke the operation again after it finishes%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.8()
{
  OUTLINED_FUNCTION_12_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Already fetching recent documents in %@%@");
}

- (void)fetchRecentAndFavoriteDocuments:.cold.9()
{
  OUTLINED_FUNCTION_13_2();
  uint64_t v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v1, v2, "[DEBUG] Don't fetch recents and favorites before initial sync-down of %@.\n%@%@", v3, v4, v5, v6, 2u);
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx done waiting for item to be on disk%@");
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_498_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Item %@ already available%@", (void)v3, DWORD2(v3));
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx done waiting for item to be downloaded%@");
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Item %@ already downloaded%@", (void)v3, DWORD2(v3));
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_502_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] network is unreachable. Not waiting on download of %@%@", (void)v3, DWORD2(v3));
}

- (void)_shouldFailSyncDownWaitImmediately
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] network is unreachable. Not waiting on sync down of %@%@", (void)v3, DWORD2(v3));
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx done waiting for sync down to complete on first try%@");
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx Item failed first try waiting for sync down to complete... Retrying once...%@");
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┳%llx done waiting for sync down to complete after retry%@");
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Item in server items table. We should get at least that item parent id%@", v2, v3, v4, v5, v6);
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_521_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_14_0(v1) debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] network is unreachable, don't try to locate item [%@]%@", v4);
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Cancelling all share acceptance callbacks due to unreachable network%@");
}

- (void)_dumpRecursivePropertiesOfItemByRowID:context:depth:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: pos == ITEM_RECURSIVE_PROPERTIES_FIELDS_COUNT%@", v2, v3, v4, v5, v6);
}

void __64__BRCClientZone_FPFSAdditions__notifyClient_whenFaultingIsDone___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Queueing faults live barrier for %@%@", (uint8_t *)&v4, 0x16u);
}

@end