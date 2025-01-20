@interface BRCXPCRegularIPCsClient
- (BOOL)_saveOrDeleteContainerMetadataRecordName:(id)a3 saveRecord:(BOOL)a4 error:(id *)a5;
- (id)_loggedInUserPropertyValuesForKeys:(id)a3 error:(id *)a4;
- (id)_removeSandboxedAttributes:(id)a3;
- (id)startDownloadFileObject:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 reply:(id)a6;
- (id)uploadItemIdentifier:(id)a3 withContents:(id)a4 baseVersion:(id)a5 reply:(id)a6;
- (void)_createFileProvidingRequestOperationOfFileObject:(id)a3 localItem:(id)a4 etagIfLoser:(id)a5 etagToDownload:(id)a6 progress:(id)a7 options:(unint64_t)a8 reply:(id)a9;
- (void)_createSharingInfoForLocalItem:(id)a3 reply:(id)a4;
- (void)_fetchLatestContentRevisionAndSharingStateForItemIdentifier:(id)a3 reply:(id)a4;
- (void)_getPublishedURLForLocalItem:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6;
- (void)_getiWorkNeedsShareMigrateForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_getiWorkPublishingBadgingStatusForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_getiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_launchItemCountMismatchChecksForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_presentAcceptDialogsWithMetadata:(id)a3 reply:(id)a4;
- (void)_queueOrCallCompletionBlock:(id)a3;
- (void)_refreshLatestRevisionAndSharingStateForItemIdentifier:(id)a3 reply:(id)a4;
- (void)_setiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 publish:(BOOL)a5 readonly:(BOOL)a6 reply:(id)a7;
- (void)_startOperation:(id)a3 toCopyParticipantTokenWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toCopySharingAccessTokenWithLocalItem:(id)a4 itemIdentifier:(id)a5 reply:(id)a6;
- (void)_startOperation:(id)a3 toCopySharingInfoWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toModifyRecordAccessWithLocalItem:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)_startOperation:(id)a3 toPrepFolderForSharingWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toProcessSubitemsWithLocalItem:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)_t_extractMetadataForAllContainersWithReply:(id)a3;
- (void)_t_getEntitledContainerIDsForBundleID:(id)a3 reply:(id)a4;
- (void)_t_getEntitlementsForBundleID:(id)a3 reply:(id)a4;
- (void)_unboostFilePresenterForItemIdentifier:(id)a3 handledAppLibrarys:(id)a4 completionHandler:(id)a5;
- (void)_unregisterPrematurely;
- (void)accessItemIdentifier:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 LocalItemHandler:(id)a6 ServerItemHandler:(id)a7;
- (void)accessItemIdentifierLocalItem:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 handler:(id)a6;
- (void)accessItemIdentifierServerItem:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 handler:(id)a6;
- (void)backupDatabaseWithURLWrapper:(id)a3 reply:(id)a4;
- (void)boostFilePresenterForItemIdentifier:(id)a3 reply:(id)a4;
- (void)calculateSignatureForItemIdentifier:(id)a3 forURL:(id)a4 reply:(id)a5;
- (void)cancelTreeConsistencyCheckWithReply:(id)a3;
- (void)capabilityWhenTryingToReparentItemIdentifier:(id)a3 toNewParent:(id)a4 reply:(id)a5;
- (void)checkIfItemIsShareableWithItemIdentifier:(id)a3 reply:(id)a4;
- (void)cloneLatestContentRevisionForItemIdentifier:(id)a3 reply:(id)a4;
- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3;
- (void)copyCollaborationIdentifierForFileObjectID:(id)a3 reply:(id)a4;
- (void)copyCurrentUserIdentifierWithReply:(id)a3;
- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3;
- (void)copyShareIDForItemIdentifier:(id)a3 reply:(id)a4;
- (void)corruptDatabase:(id)a3;
- (void)createAccountWithACAccountID:(id)a3 dsid:(id)a4 reply:(id)a5;
- (void)createContainerWithID:(id)a3 ownerName:(id)a4 reply:(id)a5;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 additionalItemAttributes:(id)a7 completionHandler:(id)a8;
- (void)createSharingInfoForItemID:(id)a3 reply:(id)a4;
- (void)currentNotifRankWithReply:(id)a3;
- (void)deleteAllContentsOfContainerID:(id)a3 onClient:(BOOL)a4 onServer:(BOOL)a5 wait:(BOOL)a6 reply:(id)a7;
- (void)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)didReceiveHandoffRequestForBundleID:(id)a3 reply:(id)a4;
- (void)dropSpotlightIndexWithReply:(id)a3;
- (void)dumpCoordinationInfoTo:(id)a3 reply:(id)a4;
- (void)dumpDatabaseTo:(id)a3 containerID:(id)a4 personaID:(id)a5 includeAllItems:(BOOL)a6 verbose:(BOOL)a7 reply:(id)a8;
- (void)dumpFPFSMigrationStatusTo:(id)a3 personaID:(id)a4 includeNonMigratedItems:(BOOL)a5 reply:(id)a6;
- (void)enumerateItemsInFolder:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 completion:(id)a7;
- (void)enumerateTrashItemsFromRank:(unint64_t)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)enumerateWorkingSetChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)evictOldDocumentsWithReply:(id)a3;
- (void)forceSyncContainerID:(id)a3 reply:(id)a4;
- (void)forceSyncWithBarrierContainerID:(id)a3 timeout:(unint64_t)a4 reply:(id)a5;
- (void)forceSyncZoneHealthWithBarrierWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)generateSmallItemThumbnailForFileObject:(id)a3 reply:(id)a4;
- (void)getApplicationDocumentUsageInfoForBundleID:(id)a3 withReply:(id)a4;
- (void)getApplicationStatus:(id)a3;
- (void)getApplicationStatusForProcess:(id *)a3 reply:(id)a4;
- (void)getAttributeValues:(id)a3 forItemIdentifier:(id)a4 reply:(id)a5;
- (void)getBookmarkDataForItemIdentifier:(id)a3 onlyAllowItemKnowByServer:(BOOL)a4 allowAccessByBundleID:(id)a5 documentID:(id)a6 isDirectory:(BOOL)a7 reply:(id)a8;
- (void)getClientSaltingVerificationKeysAtItemIdentifier:(id)a3 reply:(id)a4;
- (void)getContainerForMangledID:(id)a3 personaID:(id)a4 reply:(id)a5;
- (void)getContainerLastServerUpdateWithID:(id)a3 reply:(id)a4;
- (void)getContainerStatusWithID:(id)a3 reply:(id)a4;
- (void)getContainerURLForID:(id)a3 forProcess:(id *)a4 reply:(id)a5;
- (void)getContainerURLForID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5;
- (void)getContainerURLForID:(id)a3 reply:(id)a4;
- (void)getContainersByID:(id)a3;
- (void)getContainersNeedingUpload:(id)a3;
- (void)getCreatorNameComponentsForItemIdentifier:(id)a3 reply:(id)a4;
- (void)getDefaultAppContainerItemForContainerID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5;
- (void)getItemUpdateSenderWithReceiver:(id)a3 reply:(id)a4;
- (void)getLastSyncDateWithReply:(id)a3;
- (void)getLocalizedLastSyncWithReply:(id)a3;
- (void)getLoggedInUserPropertyValuesForKeys:(id)a3 reply:(id)a4;
- (void)getPathForRecordID:(id)a3 forContainer:(id)a4 reply:(id)a5;
- (void)getPublishedURLForItemIdentifier:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6;
- (void)getQueryItemForBRFileObjectID:(id)a3 reply:(id)a4;
- (void)getServerContentSignatureAtItemIdentifier:(id)a3 reply:(id)a4;
- (void)getServerSaltingKeysAtItemIdentifier:(id)a3 reply:(id)a4;
- (void)getShareOptionsOfItemIdentifier:(id)a3 reply:(id)a4;
- (void)getSyncState:(unint64_t)a3 reply:(id)a4;
- (void)getTotalApplicationDocumentUsageWithReply:(id)a3;
- (void)getiWorkNeedsShareMigrateForItemIdentifier:(id)a3 reply:(id)a4;
- (void)getiWorkPublishingBadgingStatusForItemIdentifier:(id)a3 reply:(id)a4;
- (void)getiWorkPublishingInfoForItemIdentifier:(id)a3 reply:(id)a4;
- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
- (void)hasOptimizeStorageWithReply:(id)a3;
- (void)healthStatusStringForContainer:(id)a3 reply:(id)a4;
- (void)iCloudDesktopSettingsChangedWithAttributes:(id)a3 reply:(id)a4;
- (void)iWorkForceSyncContainerID:(id)a3 ownedByMe:(BOOL)a4 reply:(id)a5;
- (void)invalidateAccountCacheWithReply:(id)a3;
- (void)jetsamCloudDocsAppsWithReply:(id)a3;
- (void)keepDataLocalOnSignOut:(BOOL)a3 reply:(id)a4;
- (void)launchItemCountMismatchChecksForItemIdentifier:(id)a3 reply:(id)a4;
- (void)launchSyncConsistencyChecksWithContainerIDs:(id)a3 reply:(id)a4;
- (void)listNonLocalVersionsWithItemIdentifier:(id)a3 reply:(id)a4;
- (void)logoutAccountWithACAccountID:(id)a3 reply:(id)a4;
- (void)lookupExcludedExtensionsForLogoutWithReply:(id)a3;
- (void)lookupExcludedFilenamesForLogoutWithReply:(id)a3;
- (void)lookupMinFileSizeForThumbnailTransferWithReply:(id)a3;
- (void)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 additionalAttrs:(id)a8 completionHandler:(id)a9;
- (void)notifyReimportCompleted:(id)a3;
- (void)pauseSyncConsistencyWithReply:(id)a3;
- (void)performSelfCheck:(id)a3 reply:(id)a4;
- (void)presyncContainerWithID:(id)a3 reply:(id)a4;
- (void)printStatus:(id)a3 containerID:(id)a4 reply:(id)a5;
- (void)purgeAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5;
- (void)queryEligibleAccountDescriptorsWithReply:(id)a3;
- (void)queryPathsForPersona:(id)a3 reply:(id)a4;
- (void)queryTelemetryEnablementWithReply:(id)a3;
- (void)reclaimAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5;
- (void)refreshSharingStateForItemIdentifier:(id)a3 reply:(id)a4;
- (void)registerInitialSyncBarrierForID:(id)a3 reply:(id)a4;
- (void)reimportItemIdentifier:(id)a3 reply:(id)a4;
- (void)removeFPFSDomain:(id)a3;
- (void)resetBudgets:(id)a3 reply:(id)a4;
- (void)resolveBookmarkDataToURL:(id)a3 reply:(id)a4;
- (void)resolveFileObjectIDsToContentRecordIDsForThumbnails:(id)a3 reply:(id)a4;
- (void)resumeSyncConsistencyWithReply:(id)a3;
- (void)setEnhancedDrivePrivacyEnabled:(BOOL)a3 forContainer:(id)a4 onServer:(BOOL)a5 onClient:(BOOL)a6 reply:(id)a7;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 reply:(id)a6;
- (void)setStorageOpimizationEnabled:(BOOL)a3 reply:(id)a4;
- (void)setiWorkPublishingInfoForItemIdentifier:(id)a3 isForPublish:(BOOL)a4 readonly:(BOOL)a5 reply:(id)a6;
- (void)setupInstanceWithDict:(id)a3 reply:(id)a4;
- (void)simulateHealthIssueWithContainer:(id)a3 status:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toAcceptShareLink:(id)a4 skipAcceptDialogs:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyAvailableQuotaWithReply:(id)a4;
- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyParticipantTokenWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingAccessTokenOfItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingInfoWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingWebAuthTokenForContainerID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShortTokenOfItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toModifyRecordAccessWithItemID:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toPrepFolderForSharingWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toProcessSubitemsWithItemID:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toUploadAllFilesInContainer:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toWaitForFPFSMigrationWithReply:(id)a4;
- (void)unboostFilePresenterForItemIdentifiers:(id)a3 reply:(id)a4;
- (void)updateAccountDisplayName:(id)a3 reply:(id)a4;
- (void)updateContainerMetadataForID:(id)a3;
- (void)updatePrivilegesDescriptor;
- (void)userVerifiedTermsWithReply:(id)a3;
- (void)validateCloudDocsSupported:(BOOL)a3 withReply:(id)a4;
- (void)validateConnectionDomainWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5 reply:(id)a6;
- (void)verifyAccountLoaded:(id)a3;
- (void)waitForAccountToLoadWithReply:(id)a3;
- (void)waitForStabilizationWithReply:(id)a3;
- (void)waitUntilIdle:(id)a3 timeout:(id)a4 reply:(id)a5;
- (void)zoneNameForContainer:(id)a3 reply:(id)a4;
@end

@implementation BRCXPCRegularIPCsClient

- (void)queryPathsForPersona:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient queryPathsForPersona:reply:]", 1913, v23);
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v23[0];
    qos_class_t v11 = qos_class_self();
    v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v25 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v26 = 2112;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2080;
    v31 = "-[BRCXPCRegularIPCsClient queryPathsForPersona:reply:]";
    __int16 v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__BRCXPCRegularIPCsClient_queryPathsForPersona_reply___block_invoke;
  v21[3] = &unk_265080B38;
  v21[4] = self;
  id v13 = v7;
  id v22 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 0, v21);

  if (v14)
  {
    v15 = [MEMORY[0x263F32580] cloudDocsHelper];
    id v20 = 0;
    v16 = [v15 queryPathsForPersona:v6 withError:&v20];
    id v17 = v20;
    brc_bread_crumbs();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v13 + 2))(v13, v16, v17);
  }
  __brc_leave_section(v23);
}

void __80__BRCXPCRegularIPCsClient_getContainerURLForID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v7, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ can't access %@: %@%@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)getContainerURLForID:(id)a3 reply:(id)a4
{
}

- (void)updateContainerMetadataForID:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient updateContainerMetadataForID:]", 1671, v34);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v34[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    v36 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v37 = 2112;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v9;
    __int16 v41 = 2080;
    v42 = "-[BRCXPCRegularIPCsClient updateContainerMetadataForID:]";
    __int16 v43 = 2112;
    id v44 = v4;
    __int16 v45 = 2112;
    v46 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v4) {
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v4];
  }
  else {
    __int16 v10 = 0;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke;
  v32[3] = &unk_26507F7B0;
  v32[4] = self;
  uint64_t v11 = (BRCXPCRegularIPCsClient *)v4;
  v33 = v11;
  int v12 = _brc_ipc_check_applibrary_write_access(self, 1, v10, v32);

  if (v12)
  {
    if (v4
      && ([(BRCXPCClient *)self entitledAppLibraryIDs],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 containsObject:v11],
          v13,
          (v14 & 1) != 0))
    {
      __int16 v15 = [(BRCXPCClient *)self bundleID];
      uint64_t v16 = [(BRCXPCClient *)self session];
      __int16 v17 = [v16 appLibraryByID:v11];

      if (v17)
      {
        v18 = BRCBundleServiceConnection();
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_298;
        v30[3] = &unk_26507EBD8;
        uint64_t v19 = v18;
        v31 = v19;
        id v20 = [v19 remoteObjectProxyWithErrorHandler:v30];
        v21 = [v17 containerMetadata];
        id v22 = [v21 versionNumberForBundleIdentifier:v15];

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_2;
        v25[3] = &unk_265085B10;
        v23 = v19;
        __int16 v26 = v23;
        v27 = v17;
        __int16 v28 = self;
        id v29 = v15;
        [v20 extractMetadataForContainerID:v11 bundleID:v29 minimumBundleVersion:v22 reply:v25];

        v24 = v31;
      }
      else
      {
        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
          -[BRCXPCRegularIPCsClient updateContainerMetadataForID:]();
        }
      }
    }
    else
    {
      __int16 v15 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v11;
        __int16 v39 = 2112;
        v40 = v15;
        _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is not owning %@ and updating its metadata%@", buf, 0x20u);
      }
    }
  }
  __brc_leave_section(v34);
}

- (void)getContainerURLForID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerURLForID:recreateDocumentsIfNeeded:reply:]", 1594, v26);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v26[0];
    qos_class_t v13 = qos_class_self();
    char v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    __int16 v28 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v29 = 2112;
    __int16 v30 = self;
    __int16 v31 = 2112;
    __int16 v32 = v14;
    __int16 v33 = 2080;
    uint64_t v34 = "-[BRCXPCRegularIPCsClient getContainerURLForID:recreateDocumentsIfNeeded:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v8) {
    __int16 v15 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v8];
  }
  else {
    __int16 v15 = 0;
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __80__BRCXPCRegularIPCsClient_getContainerURLForID_recreateDocumentsIfNeeded_reply___block_invoke;
  v24[3] = &unk_265080B38;
  v24[4] = self;
  id v16 = v9;
  id v25 = v16;
  int v17 = _brc_ipc_check_applibrary_read_access(self, 1, v15, v24);

  if (v17)
  {
    int active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
    {
      if (!dyld_program_sdk_at_least())
      {
        if (!v15)
        {
          __int16 v15 = [(BRCXPCClient *)self defaultMangledID];
          if (!v15) {
            goto LABEL_19;
          }
        }
LABEL_17:
        [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v15 recreateDocumentsIfNeeded:v6 reply:v16];
        goto LABEL_22;
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    }
    if (v8)
    {
      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v19 = [(BRCXPCClient *)self defaultMangledID];

      __int16 v15 = (void *)v19;
      if (v19) {
        goto LABEL_17;
      }
    }
LABEL_19:
    id v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", 0);
      *(_DWORD *)buf = 138413570;
      __int16 v28 = self;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      __int16 v31 = 2112;
      __int16 v32 = 0;
      __int16 v33 = 2112;
      uint64_t v34 = 0;
      __int16 v35 = 2112;
      id v36 = v22;
      __int16 v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
    }
    v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", 0);
    (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v23);

    __int16 v15 = 0;
  }
LABEL_22:

  __brc_leave_section(v26);
}

- (void)accessItemIdentifier:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 LocalItemHandler:(id)a6 ServerItemHandler:(id)a7
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v52 = a3;
  id v11 = a6;
  id v12 = a7;
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCRegularIPCsClient(FPFSAdditions) accessItemIdentifier:dbAccessKind:synchronouslyIfPossible:LocalItemHandler:ServerItemHandler:].cold.4();
    }
  }
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke;
  v63[3] = &unk_265082F08;
  id v13 = v11;
  id v64 = v13;
  id v14 = v12;
  id v65 = v14;
  int v15 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v63);

  if (v15)
  {
    id v16 = [(BRCXPCClient *)self session];
    int v17 = [v16 personaIdentifier];
    if ([v17 isEqualToString:@"__defaultPersonaID__"])
    {
    }
    else
    {
      v18 = [(BRCXPCClient *)self session];
      id v19 = [v18 personaIdentifier];

      if (v19)
      {
        int v20 = 0;
        goto LABEL_10;
      }
    }
    if (accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler____personaOnceToken != -1) {
      dispatch_once(&accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler____personaOnceToken, &__block_literal_global_31);
    }
    id v19 = (id)accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler____personalPersona;
    int v20 = 1;
LABEL_10:
    v21 = [MEMORY[0x263F841B0] sharedManager];
    v51 = [v21 currentPersona];

    id v62 = 0;
    id v22 = [v51 userPersonaUniqueString];
    v23 = v22;
    if (v22 == v19 || ([v22 isEqualToString:v19] & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v61 = 0;
        __int16 v35 = (void *)[v51 copyCurrentPersonaContextWithError:&v61];
        id v36 = v61;
        id v37 = v62;
        id v62 = v35;

        if (v36)
        {
          v38 = brc_bread_crumbs();
          uint64_t v39 = brc_default_log();
          if (os_log_type_enabled(v39, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        v24 = [v51 generateAndRestorePersonaContextWithPersonaUniqueString:v19];

        if (!v24) {
          goto LABEL_13;
        }
        v40 = brc_bread_crumbs();
        __int16 v41 = brc_default_log();
        if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
        {
          v42 = [(BRCXPCClient *)self session];
          uint64_t v43 = [v42 personaIdentifier];
          v49 = v42;
          *(_DWORD *)buf = 138412802;
          uint64_t v67 = v43;
          __int16 v68 = 2112;
          v69 = v24;
          __int16 v70 = 2112;
          v71 = v40;
          id v44 = (void *)v43;
          _os_log_error_impl(&dword_23FA42000, v41, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (!v20 || ([v51 isDataSeparatedPersona] & 1) != 0)
        {
          __int16 v45 = brc_bread_crumbs();
          v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          goto LABEL_13;
        }
        v40 = brc_bread_crumbs();
        __int16 v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        v24 = 0;
      }
    }
LABEL_13:
    if (a4 == 1
      && (+[BRCUserDefaults defaultsForMangledID:0],
          id v25 = objc_claimAutoreleasedReturnValue(),
          int v26 = [v25 allowReadOnlyDBInIPC],
          v25,
          v26))
    {
      v27 = [(BRCXPCClient *)self session];
      __int16 v28 = [v27 readOnlyWorkloop];
      char v29 = 1;
    }
    else
    {
      v27 = [(BRCXPCClient *)self session];
      __int16 v28 = [v27 clientTruthWorkloop];
      char v29 = 0;
    }

    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke_9;
    v56[3] = &unk_265082F30;
    char v60 = v29;
    v56[4] = self;
    id v57 = v52;
    id v30 = v13;
    id v58 = v30;
    id v31 = v14;
    id v59 = v31;
    uint64_t v32 = MEMORY[0x2455D9A50](v56);
    __int16 v33 = (void *)v32;
    if (a5)
    {
      (*(void (**)(uint64_t))(v32 + 16))(v32);
    }
    else
    {
      tracker = self->super._tracker;
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke_2_11;
      v53[3] = &unk_265082F58;
      id v54 = v30;
      id v55 = v31;
      brc_task_tracker_async_with_logs(tracker, v28, v33, v53);
    }
    _BRRestorePersona();
  }
}

uint64_t __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 || (uint64_t v3 = *(void *)(a1 + 40)) != 0) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  return MEMORY[0x270F9A790]();
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler____personalPersona;
  accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler____personalPersona = v0;
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke_9(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = [*(id *)(a1 + 32) session];
  id v4 = v3;
  if (v2) {
    [v3 readOnlyDB];
  }
  else {
  v5 = [v3 clientDB];
  }

  [v5 assertOnQueue];
  BOOL v6 = [*(id *)(a1 + 32) session];
  uint64_t v7 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v8 = [v6 itemByFileObjectID:v7 db:v5];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
  }
  uint64_t v10 = *(void *)(a1 + 48);
  id v16 = (id)v9;
  if (v10)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
  }
  else if (*(void *)(a1 + 56))
  {
    id v11 = [v8 clientZone];
    id v12 = [v8 itemID];
    id v13 = [v11 serverItemByItemID:v12 db:v5];

    if (v13)
    {
      id v14 = v16;
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));

      id v14 = (id)v15;
    }
    id v16 = v14;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__accessItemIdentifier_dbAccessKind_synchronouslyIfPossible_LocalItemHandler_ServerItemHandler___block_invoke_2_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 || (uint64_t v1 = *(void *)(a1 + 40)) != 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  }
}

- (void)accessItemIdentifierLocalItem:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 handler:(id)a6
{
}

- (void)accessItemIdentifierServerItem:(id)a3 dbAccessKind:(int64_t)a4 synchronouslyIfPossible:(BOOL)a5 handler:(id)a6
{
}

- (void)removeFPFSDomain:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v54, 0, sizeof(v54));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) removeFPFSDomain:]", 197, v54);
  v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v54[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v56 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v57 = 2112;
    id v58 = self;
    __int16 v59 = 2112;
    char v60 = v9;
    __int16 v61 = 2080;
    id v62 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) removeFPFSDomain:]";
    __int16 v63 = 2112;
    id v64 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x263F323E0];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __59__BRCXPCRegularIPCsClient_FPFSAdditions__removeFPFSDomain___block_invoke;
  v52[3] = &unk_265080B38;
  v52[4] = self;
  id v11 = v4;
  id v53 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v52);

  if (v10)
  {
    id v12 = [(BRCXPCClient *)self session];
    id v13 = [v12 personaIdentifier];

    if (!v13)
    {
      id v14 = [MEMORY[0x263F841B0] sharedManager];
      objc_msgSend(v14, "br_currentPersonaID");
      id v13 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    }
    if ([(BRCXPCRegularIPCsClient *)v13 isEqualToString:@"__defaultPersonaID__"])uint64_t v15 = 0; {
    else
    }
      uint64_t v15 = v13;
    id v16 = v15;
    int v17 = v13;
    if (!v16)
    {
      if (removeFPFSDomain____personaOnceToken != -1) {
        dispatch_once(&removeFPFSDomain____personaOnceToken, &__block_literal_global_14);
      }
      int v17 = (BRCXPCRegularIPCsClient *)(id)removeFPFSDomain____personalPersona;
    }
    v18 = [MEMORY[0x263F841B0] sharedManager];
    id v44 = [v18 currentPersona];

    id v51 = 0;
    id v19 = [v44 userPersonaUniqueString];
    int v20 = v19;
    if (v19 == v17 || ([(BRCXPCRegularIPCsClient *)v19 isEqualToString:v17] & 1) != 0) {
      goto LABEL_15;
    }
    if (voucher_process_can_use_arbitrary_personas())
    {
      id v50 = 0;
      id v30 = (void *)[v44 copyCurrentPersonaContextWithError:&v50];
      id v31 = v50;
      id v32 = v51;
      id v51 = v30;

      if (v31)
      {
        __int16 v33 = brc_bread_crumbs();
        uint64_t v34 = brc_default_log();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u)) {
          -[_BRCOperation completedWithResult:error:]();
        }
      }
      uint64_t v43 = [v44 generateAndRestorePersonaContextWithPersonaUniqueString:v17];

      if (!v43)
      {
LABEL_15:
        uint64_t v43 = 0;
LABEL_16:
        id v49 = 0;
        objc_msgSend(MEMORY[0x263F055B8], "br_getDomainForCurrentPersonaWithError:", &v49);
        v21 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        id v22 = (BRCXPCRegularIPCsClient *)v49;
        if (v22)
        {
          v23 = brc_bread_crumbs();
          v24 = brc_default_log();
          if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
            -[BRCXPCRegularIPCsClient(FPFSAdditions) removeFPFSDomain:]();
          }

          id v25 = brc_bread_crumbs();
          int v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v56 = self;
            __int16 v57 = 2112;
            id v58 = v22;
            __int16 v59 = 2112;
            char v60 = v25;
            _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }

          (*((void (**)(id, BRCXPCRegularIPCsClient *))v11 + 2))(v11, v22);
        }
        else if (v21)
        {
          v27 = brc_bread_crumbs();
          __int16 v28 = brc_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v56 = v21;
            __int16 v57 = 2112;
            id v58 = v13;
            __int16 v59 = 2112;
            char v60 = v27;
            _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] removing FPFS domain %@ with adopted persona = %@%@", buf, 0x20u);
          }

          char v29 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __59__BRCXPCRegularIPCsClient_FPFSAdditions__removeFPFSDomain___block_invoke_16;
          v45[3] = &unk_265080DE0;
          v46 = v21;
          uint64_t v47 = self;
          id v48 = v11;
          objc_msgSend(v29, "br_removeDomain:sync:completionHandler:", v46, 0, v45);
        }
        else
        {
          uint64_t v39 = brc_bread_crumbs();
          v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            -[BRCXPCRegularIPCsClient(FPFSAdditions) removeFPFSDomain:]();
          }

          __int16 v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v56 = self;
            __int16 v57 = 2112;
            id v58 = 0;
            __int16 v59 = 2112;
            char v60 = v41;
            _os_log_impl(&dword_23FA42000, v42, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }

          (*((void (**)(id, void))v11 + 2))(v11, 0);
        }

        _BRRestorePersona();
        goto LABEL_45;
      }
      __int16 v35 = brc_bread_crumbs();
      id v36 = brc_default_log();
      if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v13;
        __int16 v57 = 2112;
        id v58 = v43;
        __int16 v59 = 2112;
        char v60 = v35;
        _os_log_error_impl(&dword_23FA42000, v36, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
    }
    else
    {
      if (v16 || ([v44 isDataSeparatedPersona] & 1) != 0)
      {
        id v37 = brc_bread_crumbs();
        v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_3();
        }

        uint64_t v43 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
        goto LABEL_16;
      }
      __int16 v35 = brc_bread_crumbs();
      id v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      uint64_t v43 = 0;
    }

    goto LABEL_16;
  }
LABEL_45:
  __brc_leave_section(v54);
}

void __59__BRCXPCRegularIPCsClient_FPFSAdditions__removeFPFSDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__BRCXPCRegularIPCsClient_FPFSAdditions__removeFPFSDomain___block_invoke_12()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)removeFPFSDomain____personalPersona;
  removeFPFSDomain____personalPersona = v0;
}

void __59__BRCXPCRegularIPCsClient_FPFSAdditions__removeFPFSDomain___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = [*(id *)(a1 + 32) identifier];
    int v10 = 138412802;
    __int16 v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed domain %@ with error %@%@", (uint8_t *)&v10, 0x20u);
  }
  if (!v3) {
    BRPostAccountTokenChangedNotification();
  }
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void **)(a1 + 40);
    int v10 = 138412802;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getPathForRecordID:(id)a3 forContainer:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v32, 0, 24);
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getPathForRecordID:forContainer:reply:]", 237, v32);
  __int16 v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v32[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v34 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v35 = 2112;
    id v36 = self;
    __int16 v37 = 2112;
    v38 = v15;
    __int16 v39 = 2080;
    v40 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getPathForRecordID:forContainer:reply:]";
    __int16 v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = (void *)*MEMORY[0x263F323E0];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke;
  v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v17 = v10;
  id v31 = v17;
  LODWORD(v16) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v16, v30);

  if (v16)
  {
    v32[3] = 0;
    v32[4] = 0;
    if (_br_parseUUIDString())
    {
      v18 = [(BRCXPCClient *)self session];
      id v19 = [v18 clientTruthWorkloop];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke_20;
      v24[3] = &unk_265080CA0;
      id v25 = v18;
      id v26 = v9;
      v27 = self;
      id v29 = v17;
      id v28 = v8;
      id v20 = v18;
      dispatch_async(v19, v24);
    }
    else
    {
      brc_bread_crumbs();
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"RecordID", v8);
        *(_DWORD *)buf = 138413058;
        uint64_t v34 = self;
        __int16 v35 = 2112;
        id v36 = 0;
        __int16 v37 = 2112;
        v38 = v23;
        __int16 v39 = 2112;
        v40 = v21;
        _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"RecordID", v8);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v17 + 2))(v17, 0, v20);
    }
  }
  __brc_leave_section(v32);
}

void __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke_20(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) appLibraryByID:*(void *)(a1 + 40)];
  id v3 = [v2 defaultClientZone];

  if (v3)
  {
    id v4 = [[BRCItemID alloc] initWithUUIDString:*(void *)(a1 + 56)];
    v5 = [v3 itemByItemID:v4];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
      int v7 = [v5 fileObjectID];
      uint64_t v8 = [v7 asString];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke_22;
      v20[3] = &unk_265082F80;
      v20[4] = *(void *)(a1 + 48);
      id v21 = *(id *)(a1 + 64);
      [v6 getUserVisibleURLForItemIdentifier:v8 completionHandler:v20];
    }
    else
    {
      qos_class_t v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        id v17 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 56));
        *(_DWORD *)buf = 138413058;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
        __int16 v26 = 2112;
        v27 = v17;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v18 = *(void *)(a1 + 64);
      id v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 56));
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
  }
  else
  {
    __int16 v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorClientZoneNotFound:", *(void *)(a1 + 40));
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v13 = *(void *)(a1 + 64);
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorClientZoneNotFound:", *(void *)(a1 + 40));
    id v4 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, BRCItemID *))(v13 + 16))(v13, 0, v4);
  }
}

void __80__BRCXPCRegularIPCsClient_FPFSAdditions__getPathForRecordID_forContainer_reply___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 path];
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v5 path];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
}

- (void)getQueryItemForBRFileObjectID:(id)a3 reply:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getQueryItemForBRFileObjectID:reply:]", 265, v30);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v30[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v32 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v33 = 2112;
    uint64_t v34 = self;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2080;
    v38 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getQueryItemForBRFileObjectID:reply:]";
    __int16 v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __78__BRCXPCRegularIPCsClient_FPFSAdditions__getQueryItemForBRFileObjectID_reply___block_invoke;
  v28[3] = &unk_265080B38;
  v28[4] = self;
  id v13 = v7;
  id v29 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v28);

  if (v14)
  {
    if ([v6 isRootContainerItem])
    {
      __int16 v15 = [BRCNotification alloc];
      uint64_t v16 = [(BRCXPCClient *)self session];
      __int16 v17 = [(BRCNotification *)v15 initRootContainerNotificationWithSessionContext:v16];

      id v18 = [(BRCXPCClient *)self session];
      __int16 v19 = [v18 fsUploader];
      id v20 = [v19 quotaAvailableForOwner:*MEMORY[0x263EFD488]];

      [(BRCXPCRegularIPCsClient *)v17 setAttribute:v20 forKey:*MEMORY[0x263F327B0]];
      brc_bread_crumbs();
      uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v17;
        __int16 v35 = 2112;
        id v36 = 0;
        __int16 v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v13 + 2))(v13, v17, 0);
    }
    else
    {
      uint64_t v23 = [(BRCXPCClient *)self session];
      __int16 v24 = [v23 readOnlyWorkloop];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __78__BRCXPCRegularIPCsClient_FPFSAdditions__getQueryItemForBRFileObjectID_reply___block_invoke_25;
      v25[3] = &unk_26507F918;
      void v25[4] = self;
      id v26 = v6;
      id v27 = v13;
      dispatch_async_and_wait(v24, v25);
    }
  }
  __brc_leave_section(v30);
}

void __78__BRCXPCRegularIPCsClient_FPFSAdditions__getQueryItemForBRFileObjectID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__BRCXPCRegularIPCsClient_FPFSAdditions__getQueryItemForBRFileObjectID_reply___block_invoke_25(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) session];
  id v5 = [v4 readOnlyDB];
  uint64_t v6 = [v2 itemByFileObjectID:v3 db:v5];

  if (v6 && ![v6 isDead])
  {
    uint64_t v15 = +[BRCNotification notificationFromItem:v6];
    if ([v6 isFSRoot])
    {
      __int16 v17 = (void *)MEMORY[0x263F32610];
      id v18 = [v6 appLibrary];
      __int16 v19 = [v18 containerMetadata];
      uint64_t v20 = [v17 containerItemForContainer:v19 withRepresentativeItem:v15];

      uint64_t v15 = (void *)v20;
    }
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v24 = 138413058;
      uint64_t v25 = v23;
      __int16 v26 = 2112;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = 0;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *(void *)(a1 + 32);
      __int16 v11 = [*(id *)(a1 + 40) asString];
      id v12 = objc_msgSend(v9, "brc_errorItemNotFound:", v11);
      int v24 = 138413058;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      id v27 = 0;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
    }
    __int16 v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 40) asString];
    uint64_t v16 = objc_msgSend(v13, "brc_errorItemNotFound:", v15);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);
  }
}

- (void)getDefaultAppContainerItemForContainerID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getDefaultAppContainerItemForContainerID:recreateDocumentsIfNeeded:reply:]", 295, v34);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v34[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v36 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v37 = 2112;
    v38 = self;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2080;
    v42 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getDefaultAppContainerItemForContainerID:recreateDocumentsIfNeeded:reply:]";
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke;
  v32[3] = &unk_265080B38;
  v32[4] = self;
  id v15 = v9;
  id v33 = v15;
  int v16 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v32);

  if (v16)
  {
    if (v8 && (__int16 v17 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v8]) != 0)
    {
      id v31 = 0;
      id v18 = [(BRCXPCClient *)self _setupAppLibrary:v17 error:&v31];
      if (v18)
      {
        __int16 v19 = [(BRCXPCClient *)self session];
        uint64_t v20 = [v19 clientTruthWorkloop];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke_31;
        block[3] = &unk_265082FA8;
        BOOL v30 = a4;
        block[4] = self;
        id v27 = v18;
        id v28 = v8;
        id v29 = v15;
        dispatch_async_and_wait(v20, block);
      }
      else
      {
        brc_bread_crumbs();
        int v24 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v36 = self;
          __int16 v37 = 2112;
          v38 = 0;
          __int16 v39 = 2112;
          id v40 = v31;
          __int16 v41 = 2112;
          v42 = v24;
          _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, void, id))v15 + 2))(v15, 0, v31);
      }
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", 0);
        *(_DWORD *)buf = 138413058;
        id v36 = self;
        __int16 v37 = 2112;
        v38 = 0;
        __int16 v39 = 2112;
        id v40 = v23;
        __int16 v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      __int16 v17 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", 0);
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v17);
    }
  }
  __brc_leave_section(v34);
}

void __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke_31(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [*(id *)(a1 + 32) session];
    id v3 = [v2 clientDB];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke_2;
    v15[3] = &unk_26507F2F8;
    id v16 = *(id *)(a1 + 40);
    [v3 performWithFlags:4 action:v15];
  }
  id v4 = [*(id *)(a1 + 40) fetchDocumentsDirectoryItem];
  id v5 = +[BRCNotification notificationFromItem:v4];

  uint64_t v6 = (void *)MEMORY[0x263F32610];
  int v7 = [*(id *)(a1 + 40) containerMetadata];
  uint64_t v8 = [v6 containerItemForContainer:v7 withRepresentativeItem:v5];

  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] getDefaultAppContainerItemForContainerID(%@) = %@%@", buf, 0x20u);
  }

  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = 0;
    __int16 v23 = 2112;
    int v24 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __115__BRCXPCRegularIPCsClient_FPFSAdditions__getDefaultAppContainerItemForContainerID_recreateDocumentsIfNeeded_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recreateDocumentsFolderIfNeededInDB];
}

- (void)_queueOrCallCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(BRCXPCClient *)self session];
  id v5 = [v6 clientDB];
  [v5 scheduleFlushWithCheckpoint:1 whenFlushed:v4];
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 additionalItemAttributes:(id)a7 completionHandler:(id)a8
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v13 = (BRCXPCRegularIPCsClient *)a3;
  id v64 = a5;
  id v63 = a7;
  id v14 = a8;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__25;
  v87[4] = __Block_byref_object_dispose__25;
  uint64_t v15 = (BRCImportBookmark *)(a6 & 1);
  id v88 = [NSNumber numberWithUnsignedInteger:v15];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke;
  v84[3] = &unk_265082FD0;
  v86 = v87;
  id v62 = v14;
  id v85 = v62;
  id v16 = (void *)MEMORY[0x2455D9A50](v84);
  memset(v83, 0, sizeof(v83));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) createItemBasedOnTemplate:fields:contents:options:additionalItemAttributes:completionHandler:]", 351, v83);
  __int16 v17 = brc_bread_crumbs();
  uint64_t v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = v13;
    uint64_t v20 = v83[0];
    qos_class_t v21 = qos_class_self();
    id v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v90 = (BRCXPCRegularIPCsClient *)v20;
    __int16 v91 = 2112;
    v92 = self;
    __int16 v93 = 2112;
    *(void *)v94 = v22;
    *(_WORD *)&v94[8] = 2080;
    *(void *)&v94[10] = "-[BRCXPCRegularIPCsClient(FPFSAdditions) createItemBasedOnTemplate:fields:contents:options:add"
                          "itionalItemAttributes:completionHandler:]";
    *(_WORD *)&v94[18] = 2112;
    *(void *)&v94[20] = v17;
    _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    uint64_t v13 = v19;
  }

  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_45;
  v81[3] = &unk_265080B38;
  v81[4] = self;
  id v23 = v16;
  id v82 = v23;
  int v24 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v81);

  if (v24)
  {
    uint64_t v25 = [(BRCXPCRegularIPCsClient *)v13 parentItemIdentifier];
    char v26 = [v25 isEqualToString:*MEMORY[0x263F053F8]];

    if (v26)
    {
      id v27 = 0;
    }
    else
    {
      id v28 = (void *)MEMORY[0x263F325B8];
      id v29 = [(BRCXPCRegularIPCsClient *)v13 parentItemIdentifier];
      id v27 = [v28 fileObjectIDWithString:v29];

      if (!v27)
      {
        uint64_t v47 = brc_bread_crumbs();
        id v48 = brc_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          __int16 v57 = [(BRCXPCRegularIPCsClient *)v13 parentItemIdentifier];
          *(_DWORD *)buf = 138412802;
          v90 = v57;
          __int16 v91 = 2112;
          v92 = v13;
          __int16 v93 = 2112;
          *(void *)v94 = v47;
          _os_log_debug_impl(&dword_23FA42000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to get new parent identifier from %@, template %@%@", buf, 0x20u);
        }
        id v49 = brc_bread_crumbs();
        id v50 = brc_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          id v51 = (void *)MEMORY[0x263F087E8];
          id v52 = [(BRCXPCRegularIPCsClient *)v13 parentItemIdentifier];
          id v53 = objc_msgSend(v51, "brc_errorInvalidParameter:value:", @"parentItemIdentifier", v52);
          *(_DWORD *)buf = 138413314;
          v90 = self;
          __int16 v91 = 2112;
          v92 = 0;
          __int16 v93 = 1024;
          *(_DWORD *)v94 = 0;
          *(_WORD *)&v94[4] = 2112;
          *(void *)&v94[6] = v53;
          *(_WORD *)&v94[14] = 2112;
          *(void *)&v94[16] = v49;
          _os_log_impl(&dword_23FA42000, v50, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
        }
        id v54 = (void *)MEMORY[0x263F087E8];
        id v27 = [(BRCXPCRegularIPCsClient *)v13 parentItemIdentifier];
        BOOL v30 = objc_msgSend(v54, "brc_errorInvalidParameter:value:", @"parentItemIdentifier", v27);
        (*((void (**)(id, void, void, void *))v23 + 2))(v23, 0, 0, v30);
        goto LABEL_35;
      }
    }
    BOOL v30 = [(BRCXPCClient *)self session];
    if (![v27 isRootContainerItem])
    {
      if (a6)
      {
        buf[0] = 0;
        uint64_t v38 = +[BRCImportBookmark extractBookmarkDataFromTemplateItem:isTrashBookmark:](BRCImportBookmark, "extractBookmarkDataFromTemplateItem:isTrashBookmark:");
        if (v38)
        {
          __int16 v39 = [BRCImportBookmark alloc];
          uint64_t v15 = [(BRCImportBookmark *)v39 initWithBookmarkData:v38 isTrashBookmark:buf[0] session:v30];
          id v40 = (void *)v38;
          if (!v15)
          {
            char v60 = brc_bread_crumbs();
            __int16 v41 = brc_default_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
              -[BRCXPCRegularIPCsClient(FPFSAdditions) createItemBasedOnTemplate:fields:contents:options:additionalItemAttributes:completionHandler:]();
            }
          }
          v42 = [(BRCImportBookmark *)v15 mangledID];
          if ([v42 isShared]) {
            id v43 = (id)[v30 getOrCreateSharedZones:v42];
          }
          else {
            id v55 = (id)[v30 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v42];
          }
        }
        else
        {
          uint64_t v15 = 0;
          id v40 = 0;
        }
      }
      v56 = [v30 clientTruthWorkloop];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51;
      v65[3] = &unk_2650830D8;
      id v66 = v64;
      unint64_t v75 = a4;
      unint64_t v76 = a6;
      uint64_t v67 = v13;
      v74 = v87;
      id v68 = v30;
      char v77 = v26;
      id v69 = v27;
      __int16 v70 = self;
      id v73 = v23;
      v71 = v15;
      id v72 = v63;
      __int16 v37 = v15;
      dispatch_async_and_wait(v56, v65);

      goto LABEL_34;
    }
    id v31 = [(BRCXPCRegularIPCsClient *)v13 contentType];
    if (objc_msgSend(v31, "br_isDirectoryType"))
    {
      uint64_t v32 = (void *)MEMORY[0x263F325E0];
      id v33 = [(BRCXPCRegularIPCsClient *)v13 filename];
      LOBYTE(v32) = [v32 validateMangledIDString:v33 strict:1];

      if (v32)
      {
        if (v64)
        {
          id v58 = brc_bread_crumbs();
          __int16 v59 = brc_default_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
            -[BRCXPCRegularIPCsClient(FPFSAdditions) createItemBasedOnTemplate:fields:contents:options:additionalItemAttributes:completionHandler:]();
          }
        }
        uint64_t v34 = [v30 fsImporter];
        __int16 v35 = [v34 importAppLibraryRootFromTemplateItem:v13];

        id v36 = [v30 clientTruthWorkloop];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_49;
        block[3] = &unk_26507F918;
        block[4] = self;
        id v79 = v35;
        id v80 = v23;
        __int16 v37 = v35;
        dispatch_async_and_wait(v36, block);

LABEL_34:
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
    }
    id v44 = brc_bread_crumbs();
    uint64_t v45 = brc_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorExcludedFromSyncUnderRoot");
      *(_DWORD *)buf = 138413314;
      v90 = self;
      __int16 v91 = 2112;
      v92 = 0;
      __int16 v93 = 1024;
      *(_DWORD *)v94 = 0;
      *(_WORD *)&v94[4] = 2112;
      *(void *)&v94[6] = v46;
      *(_WORD *)&v94[14] = 2112;
      *(void *)&v94[16] = v44;
      _os_log_impl(&dword_23FA42000, v45, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
    }
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorExcludedFromSyncUnderRoot");
    __int16 v37 = (BRCImportBookmark *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, BRCImportBookmark *))v23 + 2))(v23, 0, 0, v37);
    goto LABEL_34;
  }
LABEL_36:
  __brc_leave_section(v83);

  _Block_object_dispose(v87, 8);
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  if (v6)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) BOOLValue]
      && (objc_msgSend(v6, "br_isCloudDocsErrorCode:", 82) & 1) == 0)
    {
      int v7 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      uint64_t v8 = v7;
      __int16 v9 = @"FPFSMigration";
      goto LABEL_8;
    }
    if ((objc_msgSend(v6, "br_isCloudDocsErrorCode:", 14) & 1) != 0
      || objc_msgSend(v6, "br_isPOSIXErrorCode:", 17))
    {
      int v7 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      uint64_t v8 = v7;
      __int16 v9 = @"SyncHealth";
LABEL_8:
      [v7 captureLogsForOperationType:v9 ofSubtype:@"ErrorCreatingItem" forError:v6];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", (uint8_t *)&v7, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_49(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_2;
  v3[3] = &unk_26507F918;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _queueOrCallCompletionBlock:v3];
}

uint64_t __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138413314;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", (uint8_t *)&v7, 0x30u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) url];
  memset(v77, 0, sizeof(v77));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) createItemBasedOnTemplate:fields:contents:options:additionalItemAttributes:completionHandler:]_block_invoke", 421, v77);
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v63 = v77[0];
    id v64 = *(void **)(a1 + 40);
    uint64_t v65 = [v2 path];
    id v66 = BRCPrettyPrintBitmap();
    uint64_t v67 = *(void *)(a1 + 112);
    *(_DWORD *)buf = 134219266;
    uint64_t v79 = v63;
    __int16 v80 = 2112;
    v81 = v64;
    __int16 v82 = 2112;
    *(void *)v83 = v65;
    *(_WORD *)&v83[8] = 2112;
    *(void *)&v83[10] = v66;
    *(_WORD *)&v83[18] = 2048;
    *(void *)&v83[20] = v67;
    __int16 v84 = 2112;
    id v85 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating item based on template %@ at '%@' fields:%@ options:%llu%@", buf, 0x3Eu);
  }
  uint64_t v5 = NSNumber;
  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) BOOLValue]) {
    BOOL v6 = [*(id *)(a1 + 48) fpfsMigrationState] == 1;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = [v5 numberWithInt:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
  __int16 v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void **)(a1 + 48);
  if (*(unsigned char *)(a1 + 120))
  {
    __int16 v11 = [*(id *)(a1 + 72) mangledID];
    int v12 = [v10 clientZoneByMangledID:v11];

    __int16 v13 = [*(id *)(a1 + 72) itemID];
    uint64_t v14 = [v12 itemByItemID:v13];

    if (![v14 isDirectory]
      || ([v14 asDirectory], (__int16 v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v16 = [*(id *)(a1 + 48) cloudDocsClientZone];
      uint64_t v17 = [*(id *)(a1 + 48) clientDB];
      __int16 v15 = [v16 fetchZoneRootItemInDB:v17];
    }
    uint64_t v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51_cold_2();
    }

    goto LABEL_13;
  }
  __int16 v35 = [*(id *)(a1 + 48) itemByFileObjectID:*(void *)(a1 + 56)];
  __int16 v15 = [v35 asDirectory];

  if (v15 && ![v15 isDead])
  {
LABEL_13:
    int v20 = [v2 startAccessingSecurityScopedResource];
    uint64_t v76 = 0;
    qos_class_t v21 = [*(id *)(a1 + 48) fsImporter];
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 104);
    uint64_t v24 = *(void *)(a1 + 112);
    uint64_t v26 = *(void *)(a1 + 72);
    uint64_t v25 = *(void *)(a1 + 80);
    id v75 = 0;
    id v27 = [v21 importNewItemAtURL:v2 parentItem:v15 templateItem:v22 fields:v23 options:v24 additionalItemAttributes:v25 importBookmark:v26 stillPendingFields:&v76 error:&v75];
    id v28 = v75;

    if (v20) {
      [v2 stopAccessingSecurityScopedResource];
    }
    if (v27)
    {
      id v29 = [[BRCNotification alloc] initWithLocalItem:v27 itemDiffs:0];
      if ([v27 isZoneRoot])
      {
        BOOL v30 = [v27 appLibrary];
        id v31 = [v30 containerMetadata];

        uint64_t v32 = [MEMORY[0x263F32610] containerItemForContainer:v31 withRepresentativeItem:v29];

        id v29 = (BRCNotification *)v32;
      }
      id v33 = *(void **)(a1 + 64);
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_58;
      v71[3] = &unk_265080F58;
      v71[4] = v33;
      uint64_t v34 = v29;
      id v72 = v34;
      uint64_t v74 = v76;
      id v73 = *(id *)(a1 + 88);
      [v33 _queueOrCallCompletionBlock:v71];
    }
    else
    {
      id v49 = brc_bread_crumbs();
      id v50 = brc_default_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138413314;
        uint64_t v79 = v51;
        __int16 v80 = 2112;
        v81 = 0;
        __int16 v82 = 1024;
        *(_DWORD *)v83 = 0;
        *(_WORD *)&v83[4] = 2112;
        *(void *)&v83[6] = v28;
        *(_WORD *)&v83[14] = 2112;
        *(void *)&v83[16] = v49;
        _os_log_impl(&dword_23FA42000, v50, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
      }

      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
    goto LABEL_36;
  }
  if (([v15 isDead] & 1) != 0
    || ([*(id *)(a1 + 48) recentsEnumerator],
        id v36 = objc_claimAutoreleasedReturnValue(),
        int v37 = [v36 hasDeletedFileObjectID:*(void *)(a1 + 56)],
        v36,
        v37))
  {
    uint64_t v38 = brc_bread_crumbs();
    __int16 v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51_cold_1((void *)(a1 + 56));
    }

    id v40 = brc_bread_crumbs();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *(void *)(a1 + 64);
      id v44 = [*(id *)(a1 + 56) asString];
      uint64_t v45 = objc_msgSend(v42, "brc_errorParentItemRemotelyDeleted:", v44);
      *(_DWORD *)buf = 138413314;
      uint64_t v79 = v43;
      __int16 v80 = 2112;
      v81 = 0;
      __int16 v82 = 1024;
      *(_DWORD *)v83 = 0;
      *(_WORD *)&v83[4] = 2112;
      *(void *)&v83[6] = v45;
      *(_WORD *)&v83[14] = 2112;
      *(void *)&v83[16] = v40;
      _os_log_impl(&dword_23FA42000, v41, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
    }
    uint64_t v46 = *(void *)(a1 + 88);
    uint64_t v47 = (void *)MEMORY[0x263F087E8];
    id v27 = [*(id *)(a1 + 56) asString];
    id v48 = objc_msgSend(v47, "brc_errorParentItemRemotelyDeleted:", v27);
    (*(void (**)(uint64_t, void, void, void *))(v46 + 16))(v46, 0, 0, v48);
  }
  else
  {
    id v52 = brc_bread_crumbs();
    id v53 = brc_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v68 = *(void *)(a1 + 56);
      id v69 = @"Parent marked as dead";
      uint64_t v70 = *(void *)(a1 + 40);
      if (!v15) {
        id v69 = @"No such item";
      }
      *(_DWORD *)buf = 138413314;
      uint64_t v79 = v68;
      __int16 v80 = 2112;
      v81 = v15;
      __int16 v82 = 2112;
      *(void *)v83 = v69;
      *(_WORD *)&v83[8] = 2112;
      *(void *)&v83[10] = v70;
      *(_WORD *)&v83[18] = 2112;
      *(void *)&v83[20] = v52;
      _os_log_debug_impl(&dword_23FA42000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to get parent item with item identifier %@. parentItem: %@. error: %@. template %@%@", buf, 0x34u);
    }

    id v54 = brc_bread_crumbs();
    id v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      uint64_t v56 = *(void *)(a1 + 64);
      __int16 v57 = (void *)MEMORY[0x263F087E8];
      id v58 = [*(id *)(a1 + 40) parentItemIdentifier];
      __int16 v59 = objc_msgSend(v57, "brc_errorItemNotFound:", v58);
      *(_DWORD *)buf = 138413314;
      uint64_t v79 = v56;
      __int16 v80 = 2112;
      v81 = 0;
      __int16 v82 = 1024;
      *(_DWORD *)v83 = 0;
      *(_WORD *)&v83[4] = 2112;
      *(void *)&v83[6] = v59;
      *(_WORD *)&v83[14] = 2112;
      *(void *)&v83[16] = v54;
      _os_log_impl(&dword_23FA42000, v55, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
    }
    uint64_t v60 = *(void *)(a1 + 88);
    __int16 v61 = (void *)MEMORY[0x263F087E8];
    id v27 = [*(id *)(a1 + 40) parentItemIdentifier];
    id v62 = objc_msgSend(v61, "brc_errorItemNotFound:", v27);
    (*(void (**)(uint64_t, void, void, void *))(v60 + 16))(v60, 0, 0, v62);
  }
  id v28 = 0;
LABEL_36:

  __brc_leave_section(v77);
}

uint64_t __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_58(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[7];
    int v8 = 138413314;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %lu, %@)%@", (uint8_t *)&v8, 0x34u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)listNonLocalVersionsWithItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) listNonLocalVersionsWithItemIdentifier:reply:]", 495, v23);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v23[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    id v27 = self;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2080;
    id v31 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) listNonLocalVersionsWithItemIdentifier:reply:]";
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke;
  v21[3] = &unk_265080B38;
  v21[4] = self;
  id v13 = v7;
  id v22 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v21);

  if (v14)
  {
    uint64_t v15 = [(BRCXPCClient *)self session];
    __int16 v16 = [v15 clientTruthWorkloop];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_59;
    v17[3] = &unk_26507F918;
    id v18 = v6;
    __int16 v19 = self;
    id v20 = v13;
    dispatch_async_and_wait(v16, v17);
  }
  __brc_leave_section(v23);
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_59(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) session];
  uint64_t v4 = [v3 itemByFileObjectID:v2];

  if (!v4) {
    goto LABEL_5;
  }
  if ([v4 isDocument])
  {
    uint64_t v5 = [BRCListNonLocalVersionsOperation alloc];
    uint64_t v6 = [v4 asDocument];
    int v7 = [*(id *)(a1 + 40) session];
    uint64_t v8 = [(BRCListNonLocalVersionsOperation *)v5 initWithDocumentItem:v6 sessionContext:v7];

    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    __int16 v19 = __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_61;
    id v20 = &unk_265083100;
    __int16 v9 = *(void **)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 40);
    id v22 = v9;
    [(_BRCOperation *)v8 setFinishBlock:&v17];
    objc_msgSend(*(id *)(a1 + 40), "addOperation:", v8, v17, v18, v19, v20, v21);

    goto LABEL_11;
  }
  if (([v4 isDocument] & 1) == 0)
  {
LABEL_5:
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_59_cold_1();
    }
  }
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 32));
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = 0;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }
  uint64_t v16 = *(void *)(a1 + 48);
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 32));
  uint64_t v8 = (BRCListNonLocalVersionsOperation *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, BRCListNonLocalVersionsOperation *))(v16 + 16))(v16, 0, v8);
LABEL_11:
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)_createFileProvidingRequestOperationOfFileObject:(id)a3 localItem:(id)a4 etagIfLoser:(id)a5 etagToDownload:(id)a6 progress:(id)a7 options:(unint64_t)a8 reply:(id)a9
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  __int16 v15 = (BRCXPCRegularIPCsClient *)a3;
  id v16 = (BRCXPCRegularIPCsClient *)a4;
  unint64_t v17 = (unint64_t)a5;
  unint64_t v18 = (unint64_t)a6;
  id v102 = a7;
  id v19 = a9;
  id v20 = brc_bread_crumbs();
  uint64_t v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    v61 = id v60 = v19;
    *(_DWORD *)buf = 138413314;
    v118 = v16;
    __int16 v119 = 2112;
    unint64_t v120 = v18;
    __int16 v121 = 2112;
    v122 = (BRCFileProvidingRequestOperation *)v17;
    __int16 v123 = 2112;
    v124 = v61;
    __int16 v125 = 2112;
    v126 = v20;
    _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating a file providing request operation for: li = %@, etag = %@, etagIfLoser = %@, options = %@%@", buf, 0x34u);

    id v19 = v60;
  }

  v101 = (void *)v18;
  if (v16)
  {
    if (v17 | v18)
    {
      if (v18)
      {
        v99 = v19;
        v100 = v15;
        id v22 = v16;
        uint64_t v23 = (void *)v17;
        uint64_t v24 = [(BRCXPCClient *)self session];
        __int16 v25 = [v24 fsDownloader];

        uint64_t v26 = v22;
        __int16 v27 = [(BRCXPCRegularIPCsClient *)v22 asDocument];
        __int16 v28 = [v25 generateContentStageFileNameForItem:v27 etag:v18];

        uint64_t v29 = BRCConvertDownloadOptionsToInternal(a8);
        if ((v29 & 4) == 0) {
          [v25 addPendingOperationProgress:v102 withStageFileName:v28];
        }
        __int16 v30 = v26;
        uint64_t v95 = [[BRCNotification alloc] initWithLocalItem:v26 itemDiffs:0];
        v97 = [(BRCXPCRegularIPCsClient *)v26 liveStageFilename];
        uint64_t v31 = [BRCFileProvidingRequestOperation alloc];
        __int16 v32 = [(BRCXPCRegularIPCsClient *)v26 asDocument];
        id v33 = self;
        uint64_t v34 = [(BRCXPCClient *)self session];
        unint64_t v96 = (unint64_t)v23;
        __int16 v35 = [(BRCFileProvidingRequestOperation *)v31 initWithDocumentItem:v32 client:v33 session:v34 etagIfLoser:v23 stageFileName:v28 options:v29];

        uint64_t v36 = [(BRCFileProvidingRequestOperation *)v35 kind];
        LODWORD(v32) = v36;
        int v37 = [NSNumber numberWithInt:v36];
        [v102 setUserInfoObject:v37 forKey:@"BRProgressDownloadKindKey"];

        v103[0] = MEMORY[0x263EF8330];
        v103[1] = 3221225472;
        v103[2] = __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke;
        v103[3] = &unk_265083150;
        v103[4] = v33;
        v104 = v100;
        id v105 = v23;
        id v106 = v25;
        int v116 = (int)v32;
        id v16 = v30;
        id v107 = v101;
        v108 = v95;
        id v109 = v28;
        unint64_t v114 = a8;
        id v110 = v102;
        uint64_t v115 = v29;
        id v113 = v99;
        id v111 = v97;
        v112 = v30;
        id v98 = v97;
        id v38 = v28;
        __int16 v39 = v95;
        id v40 = v25;
        __int16 v15 = v100;
        id v41 = v40;
        [(BRCFileProvidingRequestOperation *)v35 addCompletionCallback:v103];
        [(BRCXPCClient *)v33 addOperation:v35];

        unint64_t v17 = v96;
        id v19 = v99;

        goto LABEL_48;
      }
      goto LABEL_40;
    }
    if (![(BRCXPCRegularIPCsClient *)v16 isDocument]) {
      goto LABEL_40;
    }
    if ([(BRCXPCRegularIPCsClient *)v16 syncUpState] == 7)
    {
      id v52 = [(BRCXPCRegularIPCsClient *)v16 asDocument];
      char v53 = [v52 hasFileIDForUpload];

      if ((v53 & 1) == 0)
      {
        uint64_t v67 = brc_bread_crumbs();
        uint64_t v68 = brc_default_log();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
          -[BRCXPCRegularIPCsClient(FPFSAdditions) _createFileProvidingRequestOperationOfFileObject:localItem:etagIfLoser:etagToDownload:progress:options:reply:]();
        }

        id v58 = brc_bread_crumbs();
        __int16 v59 = brc_default_log();
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
LABEL_28:
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemBusy");
        id v69 = v19;
        uint64_t v70 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v118 = self;
        __int16 v119 = 2112;
        unint64_t v120 = 0;
        __int16 v121 = 2112;
        v122 = v70;
        __int16 v123 = 2112;
        v124 = v58;
        _os_log_impl(&dword_23FA42000, v59, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

        id v19 = v69;
LABEL_29:

        objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemBusy");
        __int16 v35 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
LABEL_47:
        (*((void (**)(id, void, BRCFileProvidingRequestOperation *))v19 + 2))(v19, 0, v35);
        goto LABEL_48;
      }
    }
    id v54 = [(BRCXPCRegularIPCsClient *)v16 asDocument];
    int v55 = [v54 isDocumentBeingCopiedToNewZone];

    if (v55)
    {
      uint64_t v56 = brc_bread_crumbs();
      __int16 v57 = brc_default_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v118 = v15;
        __int16 v119 = 2112;
        unint64_t v120 = (unint64_t)v56;
        _os_log_impl(&dword_23FA42000, v57, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is undergoing CZM so returning back with busy error%@", buf, 0x16u);
      }

      id v58 = brc_bread_crumbs();
      __int16 v59 = brc_default_log();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    id v62 = [(BRCXPCRegularIPCsClient *)v16 asDocument];
    uint64_t v63 = [v62 localDiffs];

    if ((v63 & 0x400000000000000) == 0)
    {
      id v64 = [(BRCXPCRegularIPCsClient *)v16 asDocument];
      uint64_t v65 = [v64 currentVersion];
      id v66 = [v65 ckInfo];
      if (v66)
      {
      }
      else
      {
        [(BRCXPCRegularIPCsClient *)v16 asDocument];
        v78 = id v77 = v19;
        int v79 = [v78 isKnownByServer];

        id v19 = v77;
        if (v79)
        {
          __int16 v80 = brc_bread_crumbs();
          v81 = brc_default_log();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
            -[BRCXPCRegularIPCsClient(FPFSAdditions) _createFileProvidingRequestOperationOfFileObject:localItem:etagIfLoser:etagToDownload:progress:options:reply:]();
          }

          id v58 = brc_bread_crumbs();
          __int16 v59 = brc_default_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemBusy");
            __int16 v82 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v118 = self;
            __int16 v119 = 2112;
            unint64_t v120 = 0;
            __int16 v121 = 2112;
            v122 = v82;
            __int16 v123 = 2112;
            v124 = v58;
            _os_log_impl(&dword_23FA42000, v59, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

            id v19 = v77;
          }
          goto LABEL_29;
        }
      }
LABEL_40:
      v83 = brc_bread_crumbs();
      __int16 v84 = brc_default_log();
      if (os_log_type_enabled(v84, (os_log_type_t)0x90u)) {
        -[BRCXPCRegularIPCsClient(FPFSAdditions) _createFileProvidingRequestOperationOfFileObject:localItem:etagIfLoser:etagToDownload:progress:options:reply:]();
      }

      id v85 = (void *)MEMORY[0x263F087E8];
      uint64_t v86 = [(BRCXPCRegularIPCsClient *)v15 asString];
      objc_msgSend(v85, "brc_errorNoEtagAvailableForDownloadOfItemWithIdentifier:", v86);
      __int16 v35 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();

      v87 = [(BRCXPCRegularIPCsClient *)v16 clientZone];
      LODWORD(v86) = [v87 isPrivateZone];

      if (v86)
      {
        id v88 = +[BRCAutoBugCaptureReporter sharedABCReporter];
        [v88 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"ErrorFetchItemContent" forError:v35];

        v89 = [(BRCXPCClient *)self session];
        v90 = [v89 tapToRadarManager];
        [NSString stringWithFormat:@"Got a nil etag for %@. Can't tell which is the latest version to download", v16];
        v92 = id v91 = v19;
        [v90 requestTapToRadarWithTitle:@"[fetch content: Got a nil etag on private zone]" description:v92 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"Can't tell which is the latest version to download" triggerRootCause:v35];

        id v19 = v91;
      }
      __int16 v93 = brc_bread_crumbs();
      v94 = brc_default_log();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v118 = self;
        __int16 v119 = 2112;
        unint64_t v120 = 0;
        __int16 v121 = 2112;
        v122 = v35;
        __int16 v123 = 2112;
        v124 = v93;
        _os_log_impl(&dword_23FA42000, v94, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      goto LABEL_47;
    }
    v71 = brc_bread_crumbs();
    id v72 = brc_default_log();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v15;
      __int16 v119 = 2112;
      unint64_t v120 = (unint64_t)v71;
      _os_log_impl(&dword_23FA42000, v72, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is undergoing zone reset so returning back with busy error%@", buf, 0x16u);
    }

    id v73 = brc_bread_crumbs();
    uint64_t v74 = brc_default_log();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemBusy");
      id v75 = v19;
      uint64_t v76 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v118 = self;
      __int16 v119 = 2112;
      unint64_t v120 = 0;
      __int16 v121 = 2112;
      v122 = v76;
      __int16 v123 = 2112;
      v124 = v73;
      _os_log_impl(&dword_23FA42000, v74, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

      id v19 = v75;
    }

    objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemBusy");
    __int16 v35 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, BRCFileProvidingRequestOperation *))v19 + 2))(v19, 0, v35);
  }
  else
  {
    v42 = brc_bread_crumbs();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v15;
      __int16 v119 = 2112;
      unint64_t v120 = (unint64_t)v42;
      _os_log_impl(&dword_23FA42000, v43, OS_LOG_TYPE_DEFAULT, "[WARNING] We have no item to download for %@. Returning to FP that the item isn't found%@", buf, 0x16u);
    }

    id v44 = brc_bread_crumbs();
    uint64_t v45 = brc_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      id v46 = v19;
      uint64_t v47 = (void *)MEMORY[0x263F087E8];
      id v48 = [(BRCXPCRegularIPCsClient *)v15 asString];
      id v49 = [v47 fileProviderErrorForNonExistentItemWithIdentifier:v48];
      *(_DWORD *)buf = 138413058;
      v118 = self;
      __int16 v119 = 2112;
      unint64_t v120 = 0;
      __int16 v121 = 2112;
      v122 = v49;
      __int16 v123 = 2112;
      v124 = v44;
      _os_log_impl(&dword_23FA42000, v45, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

      id v19 = v46;
    }

    id v50 = (void *)MEMORY[0x263F087E8];
    __int16 v35 = [(BRCXPCRegularIPCsClient *)v15 asString];
    uint64_t v51 = [v50 fileProviderErrorForNonExistentItemWithIdentifier:v35];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v51);
  }
LABEL_48:
}

uint64_t __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) session];
  id v5 = [v4 clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2;
  block[3] = &unk_265083128;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  int v26 = *(_DWORD *)(a1 + 136);
  id v17 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 80);
  uint64_t v24 = *(void *)(a1 + 120);
  id v18 = v7;
  id v19 = v3;
  id v20 = *(id *)(a1 + 88);
  id v8 = *(id *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 128);
  id v23 = v8;
  uint64_t v25 = v9;
  id v21 = *(id *)(a1 + 96);
  id v22 = *(id *)(a1 + 104);
  id v10 = v3;
  dispatch_async(v5, block);

  return 1;
}

void __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) session];
  id v5 = [v4 clientDB];
  id v6 = [v2 itemByFileObjectID:v3 db:v5];

  if (*(void *)(a1 + 48))
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = [v6 asDocument];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(unsigned int *)(a1 + 144);
    id v60 = 0;
    id v61 = 0;
    [v7 deviceAndEditorNamesOfItem:v8 etag:v9 downloadKind:v10 lastEditorDeviceName:&v61 lastModifiedNameComponents:&v60];
    id v11 = v61;
    id v12 = v60;

    [*(id *)(a1 + 72) markAsLoserVersionWithEtag:*(void *)(a1 + 48) modificationDate:0 editorNameComponents:v12 lastEditorDeviceName:v11 size:0];
  }
  id v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2_cold_2(a1, (uint64_t)v13, v14);
  }

  id v15 = *(void **)(a1 + 56);
  id v16 = [v6 asDocument];
  [v15 cancelAndCleanupItemDownload:v16 kind:*(unsigned int *)(a1 + 144) etag:*(void *)(a1 + 64)];

  [*(id *)(a1 + 56) removePendingOperationProgressWithStageFileName:*(void *)(a1 + 80)];
  id v17 = *(void **)(a1 + 88);
  if (!v17)
  {
    id v23 = [*(id *)(a1 + 32) session];
    uint64_t v24 = [v23 stageRegistry];
    uint64_t v25 = [v24 downloadStageURLWithStageID:*(void *)(a1 + 80)];

    uint64_t v26 = *(void *)(a1 + 136);
    __int16 v27 = [*(id *)(a1 + 32) session];
    __int16 v28 = v27;
    if ((v26 & 4) != 0)
    {
      id v38 = [v27 stageRegistry];
      uint64_t v39 = *(void *)(a1 + 104);
      id v59 = 0;
      id v22 = [v38 createStageURLForThumbnailFromLiveStageFilename:v39 error:&v59];
      id v40 = v59;

      if (v40)
      {
        id v41 = brc_bread_crumbs();
        v42 = brc_default_log();
        if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
        {
          __int16 v57 = *(void **)(a1 + 112);
          *(_DWORD *)buf = 138412802;
          uint64_t v63 = v57;
          __int16 v64 = 2112;
          id v65 = v40;
          __int16 v66 = 2112;
          id v67 = v41;
          _os_log_error_impl(&dword_23FA42000, v42, (os_log_type_t)0x90u, "[ERROR] Unable to create temp file for thumbnail creation stage url for item %@ with error %@%@", buf, 0x20u);
        }

        uint64_t v43 = brc_bread_crumbs();
        id v44 = brc_default_log();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
          goto LABEL_26;
        }
LABEL_25:
        id v49 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        uint64_t v63 = v49;
        __int16 v64 = 2112;
        id v65 = 0;
        __int16 v66 = 2112;
        id v67 = v40;
        __int16 v68 = 2112;
        id v69 = v43;
        _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
LABEL_26:

        (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v29 = [v27 downloadStagePathForCurrentPersona];

      __int16 v30 = [v29 stringByAppendingPathComponent:*(void *)(a1 + 80)];
      uint64_t v31 = NSURL;
      __int16 v32 = objc_msgSend(v30, "br_realpath");
      id v22 = [v31 fileURLWithPath:v32 isDirectory:0];
    }
    if (v22)
    {
      uint64_t v45 = [MEMORY[0x263F08850] defaultManager];
      id v58 = 0;
      char v46 = objc_msgSend(v45, "br_forceMoveItemAtURL:toURL:error:", v25, v22, &v58);
      id v40 = v58;

      if ((v46 & 1) == 0)
      {
        uint64_t v47 = brc_bread_crumbs();
        id v48 = brc_default_log();
        if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v63 = v25;
          __int16 v64 = 2112;
          id v65 = v22;
          __int16 v66 = 2112;
          id v67 = v40;
          __int16 v68 = 2112;
          id v69 = v47;
          _os_log_error_impl(&dword_23FA42000, v48, (os_log_type_t)0x90u, "[ERROR] Unable to move %@ to group container %@ with error %@%@", buf, 0x2Au);
        }

        uint64_t v43 = brc_bread_crumbs();
        id v44 = brc_default_log();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
    }
    else
    {
      id v40 = 0;
    }
    id v50 = brc_bread_crumbs();
    uint64_t v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = [*(id *)(a1 + 40) asString];
      *(_DWORD *)buf = 138412802;
      uint64_t v63 = v22;
      __int16 v64 = 2112;
      id v65 = v56;
      __int16 v66 = 2112;
      id v67 = v50;
      _os_log_debug_impl(&dword_23FA42000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning %@ to ICDFileProviderExtension for item %@%@", buf, 0x20u);
    }
    id v52 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [v52 setObject:v22 forKeyedSubscript:@"url"];
    [v52 setObject:*(void *)(a1 + 72) forKeyedSubscript:@"item"];
    char v53 = brc_bread_crumbs();
    id v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      int v55 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v63 = v55;
      __int16 v64 = 2112;
      id v65 = v52;
      __int16 v66 = 2112;
      id v67 = 0;
      __int16 v68 = 2112;
      id v69 = v53;
      _os_log_impl(&dword_23FA42000, v54, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
    goto LABEL_33;
  }
  if (objc_msgSend(v17, "br_isCloudDocsErrorCode:", 115))
  {
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2_cold_1((void *)(a1 + 40));
    }

    id v20 = *(void **)(a1 + 56);
    id v21 = [v6 asDocument];
    id v22 = [v20 getDownloadEtagForItem:v21 etagIfLoser:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) _createFileProvidingRequestOperationOfFileObject:*(void *)(a1 + 40) localItem:v6 etagIfLoser:*(void *)(a1 + 48) etagToDownload:v22 progress:*(void *)(a1 + 96) options:*(void *)(a1 + 128) reply:*(void *)(a1 + 120)];
  }
  else
  {
    id v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = *(void **)(a1 + 32);
      uint64_t v36 = objc_msgSend(*(id *)(a1 + 88), "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v63 = v35;
      __int16 v64 = 2112;
      id v65 = 0;
      __int16 v66 = 2112;
      id v67 = v36;
      __int16 v68 = 2112;
      id v69 = v33;
      _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v37 = *(void *)(a1 + 120);
    id v22 = objc_msgSend(*(id *)(a1 + 88), "brc_wrappedError");
    (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v22);
  }
LABEL_34:
}

- (void)generateSmallItemThumbnailForFileObject:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__BRCXPCRegularIPCsClient_FPFSAdditions__generateSmallItemThumbnailForFileObject_reply___block_invoke;
  v9[3] = &unk_2650831A0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(BRCXPCRegularIPCsClient *)self startDownloadFileObject:a3 options:2 etagIfLoser:0 reply:v9];
}

void __88__BRCXPCRegularIPCsClient_FPFSAdditions__generateSmallItemThumbnailForFileObject_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      __int16 v30 = 0;
      *(_WORD *)uint64_t v31 = 2112;
      *(void *)&v31[2] = v6;
      *(_WORD *)&v31[10] = 2112;
      *(void *)&v31[12] = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v30 = __Block_byref_object_copy__25;
    *(void *)uint64_t v31 = __Block_byref_object_dispose__25;
    *(void *)&v31[8] = [v5 objectForKeyedSubscript:@"url"];
    id v10 = [*(id *)(*(void *)&buf[8] + 40) lastPathComponent];
    id v23 = objc_msgSend(v10, "brc_stringByDeletingPathExtension");

    id v11 = [*(id *)(a1 + 32) session];
    id v12 = [v11 stageRegistry];
    id v13 = [v12 createURLForThumbnailUploadWithStageID:v23];

    char v14 = [*(id *)(*(void *)&buf[8] + 40) startAccessingSecurityScopedResource];
    id v15 = +[BRCThumbnailGenerationManager defaultManager];
    uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
    id v17 = [*(id *)(a1 + 32) session];
    id v18 = [v17 syncContextProvider];
    id v19 = [v18 defaultSyncContext];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __88__BRCXPCRegularIPCsClient_FPFSAdditions__generateSmallItemThumbnailForFileObject_reply___block_invoke_92;
    v24[3] = &unk_265083178;
    char v28 = v14;
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = *(void **)(a1 + 40);
    __int16 v27 = buf;
    void v24[4] = v20;
    id v26 = v21;
    id v22 = v13;
    id v25 = v22;
    [v15 addOutOfBandThumbnailGenerationJobAtURL:v16 targetURL:v22 syncContext:v19 completionHandler:v24];

    _Block_object_dispose(buf, 8);
  }
}

void __88__BRCXPCRegularIPCsClient_FPFSAdditions__generateSmallItemThumbnailForFileObject_reply___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stopAccessingSecurityScopedResource];
  }
  id v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v31 = 0;
  char v9 = [v7 removeItemAtURL:v8 error:&v31];
  id v10 = v31;

  if ((v9 & 1) == 0 && (objc_msgSend(v10, "br_isCocoaErrorCode:", 4) & 1) == 0)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unable to remove thumbnail temporary file: %@ error %@%@", buf, 0x20u);
    }
  }
  if (v6)
  {
    id v13 = brc_bread_crumbs();
    char v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v34 = v15;
      __int16 v35 = 2112;
      id v36 = 0;
      __int16 v37 = 2112;
      id v38 = 0;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v16 = NSURL;
    id v17 = objc_msgSend(NSString, "brc_groupDownloadStagePath");
    v32[0] = v17;
    id v18 = [v5 lastPathComponent];
    v32[1] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    uint64_t v20 = [v16 fileURLWithPathComponents:v19];

    id v21 = [MEMORY[0x263F08850] defaultManager];
    id v30 = 0;
    LOBYTE(v19) = objc_msgSend(v21, "br_forceMoveItemAtURL:toURL:error:", v5, v20, &v30);
    id v22 = v30;

    if ((v19 & 1) == 0)
    {
      id v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413058;
        uint64_t v34 = v29;
        __int16 v35 = 2112;
        id v36 = v20;
        __int16 v37 = 2112;
        id v38 = v22;
        __int16 v39 = 2112;
        id v40 = v23;
        _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] Unable to move thumbnail file %@ to %@ with error %@%@", buf, 0x2Au);
      }

      uint64_t v20 = 0;
    }
    id v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = 0;
      __int16 v39 = 2112;
      id v40 = v22;
      __int16 v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)startDownloadFileObject:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 reply:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  memset(v35, 0, sizeof(v35));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) startDownloadFileObject:options:etagIfLoser:reply:]", 715, v35);
  id v13 = brc_bread_crumbs();
  char v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v35[0];
    qos_class_t v16 = qos_class_self();
    id v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v37 = v15;
    __int16 v38 = 2112;
    __int16 v39 = self;
    __int16 v40 = 2112;
    __int16 v41 = v17;
    __int16 v42 = 2080;
    uint64_t v43 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) startDownloadFileObject:options:etagIfLoser:reply:]";
    __int16 v44 = 2112;
    uint64_t v45 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke;
  v33[3] = &unk_265080B38;
  v33[4] = self;
  id v18 = v12;
  id v34 = v18;
  int v19 = _brc_ipc_check_applibrary_proxy(self, 1, v33);

  if (v19)
  {
    uint64_t v20 = [[BRCProgress alloc] initWithIgnorePublish:1];
    [(BRCProgress *)v20 setUserInfoObject:v11 forKey:@"BRProgressEtagIfLoserKey"];
    id v21 = [(BRCXPCClient *)self session];
    id v22 = [v21 clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99;
    block[3] = &unk_265083240;
    block[4] = self;
    unint64_t v32 = a4;
    id v28 = v10;
    id v31 = v18;
    id v29 = v11;
    id v23 = v20;
    id v30 = v23;
    dispatch_async(v22, block);

    uint64_t v24 = v30;
    id v25 = v23;
  }
  else
  {
    id v25 = 0;
  }
  __brc_leave_section(v35);

  return v25;
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  uint64_t v3 = *(void *)(a1 + 40);
  unint64_t v4 = *(void *)(a1 + 72);
  id v5 = [v2 clientDB];
  uint64_t v6 = [v2 itemByFileObjectID:v3 db:v5];

  if ([v6 isDocument])
  {
    if ([v6 isShareAcceptationFault]) {
      unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFF7;
    }
    else {
      unint64_t v7 = v4;
    }
    if ((v7 & 2) != 0)
    {
      uint64_t v8 = [v6 asDocument];
      __int16 v9 = [v8 currentVersion];
      char v10 = [v9 isSmallAndMostRecentClientsGenerateThumbnails];

      if ((v10 & 1) == 0)
      {
        __int16 v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
          __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99_cold_2();
        }

        __int16 v13 = brc_bread_crumbs();
        char v14 = brc_default_log();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        uint64_t v16 = *MEMORY[0x263F32360];
        if (v15)
        {
          id v17 = *(void **)(a1 + 32);
          id v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 15, @"Download for thumbnail only should be small file");
          *(_DWORD *)buf = 138413058;
          id v78 = v17;
          __int16 v79 = 2112;
          __int16 v80 = 0;
          __int16 v81 = 2112;
          __int16 v82 = v18;
          __int16 v83 = 2112;
          __int16 v84 = v13;
          _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        uint64_t v19 = *(void *)(a1 + 64);
        uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", v16, 15, @"Download for thumbnail only should be small file");
        (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
      }
    }
    if ([v6 isShareAcceptationFault])
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99_cold_1((void *)(a1 + 40));
      }

      id v23 = [v6 clientZone];
      uint64_t v24 = [v23 asSharedClientZone];

      id v25 = [v6 itemID];
      id v26 = [v24 shareAcceptOperationForItemID:v25];

      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_103;
      v65[3] = &unk_2650831F0;
      id v66 = *(id *)(a1 + 40);
      id v27 = v24;
      id v67 = v27;
      id v28 = v6;
      uint64_t v29 = *(void *)(a1 + 32);
      id v68 = v28;
      uint64_t v69 = v29;
      id v73 = *(id *)(a1 + 64);
      id v70 = v2;
      id v71 = *(id *)(a1 + 48);
      id v72 = *(id *)(a1 + 56);
      unint64_t v74 = v7;
      uint64_t v30 = MEMORY[0x2455D9A50](v65);
      id v31 = (void *)v30;
      if (v26)
      {
        unint64_t v32 = brc_bread_crumbs();
        id v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v78 = v28;
          __int16 v79 = 2112;
          __int16 v80 = v26;
          __int16 v81 = 2112;
          __int16 v82 = v32;
          _os_log_debug_impl(&dword_23FA42000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking download of %@ on accept op %@%@", buf, 0x20u);
        }

        objc_initWeak((id *)buf, v26);
        id v34 = [v26 completionBlock];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_106;
        v59[3] = &unk_265083218;
        id v35 = v34;
        id v61 = v35;
        objc_copyWeak(&v64, (id *)buf);
        id v36 = *(void **)(a1 + 40);
        v59[4] = *(void *)(a1 + 32);
        id v60 = v36;
        id v62 = *(id *)(a1 + 64);
        id v63 = v31;
        [v26 setCompletionBlock:v59];

        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        (*(void (**)(uint64_t))(v30 + 16))(v30);
      }

      goto LABEL_34;
    }
    if (([v6 needsUpload] & 1) != 0 || objc_msgSend(v6, "needsSyncUp"))
    {
      uint64_t v46 = [v6 asDocument];
      if ([v46 hasFileIDForUpload])
      {
        BOOL v47 = *(void *)(a1 + 48) == 0;

        if (v47)
        {
          id v48 = [v2 stageRegistry];
          id v49 = [v6 asDocument];
          id v58 = 0;
          id v50 = [v48 createStageURLFromLiveURLForItem:v49 options:v7 error:&v58];
          id v27 = v58;

          uint64_t v51 = brc_bread_crumbs();
          id v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            char v53 = [v50 path];
            *(_DWORD *)buf = 138412802;
            id v78 = v53;
            __int16 v79 = 2112;
            __int16 v80 = v6;
            __int16 v81 = 2112;
            __int16 v82 = v51;
            _os_log_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] Created stage url %@ from live url for download of %@%@", buf, 0x20u);
          }
          if (v50)
          {
            v76[0] = v50;
            v75[0] = @"url";
            v75[1] = @"item";
            id v54 = [[BRCNotification alloc] initWithLocalItem:v6 itemDiffs:0];
            v76[1] = v54;
            int v55 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];

            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          else
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }

          goto LABEL_34;
        }
      }
      else
      {
      }
    }
    uint64_t v56 = [v2 fsDownloader];
    __int16 v57 = [v6 asDocument];
    id v27 = [v56 getDownloadEtagForItem:v57 etagIfLoser:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) _createFileProvidingRequestOperationOfFileObject:*(void *)(a1 + 40) localItem:v6 etagIfLoser:*(void *)(a1 + 48) etagToDownload:v27 progress:*(void *)(a1 + 56) options:v7 reply:*(void *)(a1 + 64)];
    goto LABEL_34;
  }
  uint64_t v37 = brc_bread_crumbs();
  __int16 v38 = brc_default_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    __int16 v39 = (void *)MEMORY[0x263F087E8];
    __int16 v40 = *(void **)(a1 + 32);
    __int16 v41 = [*(id *)(a1 + 40) asString];
    __int16 v42 = objc_msgSend(v39, "brc_errorItemNotFound:", v41);
    *(_DWORD *)buf = 138413058;
    id v78 = v40;
    __int16 v79 = 2112;
    __int16 v80 = 0;
    __int16 v81 = 2112;
    __int16 v82 = v42;
    __int16 v83 = 2112;
    __int16 v84 = v37;
    _os_log_impl(&dword_23FA42000, v38, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }
  uint64_t v43 = *(void *)(a1 + 64);
  __int16 v44 = (void *)MEMORY[0x263F087E8];
  id v27 = [*(id *)(a1 + 40) asString];
  uint64_t v45 = objc_msgSend(v44, "brc_errorItemNotFound:", v27);
  (*(void (**)(uint64_t, void, void *))(v43 + 16))(v43, 0, v45);

LABEL_34:
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_103(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_103_cold_1(a1);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_104;
  v10[3] = &unk_2650831C8;
  unint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 88);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 96);
  id v16 = v7;
  uint64_t v18 = v8;
  __int16 v9 = objc_msgSend(*(id *)(a1 + 48), "itemID", v10[0], 3221225472, __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_104, &unk_2650831C8);
  [v4 performBlock:v10 whenSyncDownCompletesLookingForItemID:v9];
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_104(uint64_t a1, char a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void **)(a1 + 56);
    id v5 = [v3 clientDB];
    id v21 = [v3 itemByFileObjectID:v4 db:v5];

    uint64_t v6 = [*(id *)(a1 + 56) fsDownloader];
    id v7 = [v21 asDocument];
    uint64_t v8 = [v6 getDownloadEtagForItem:v7 etagIfLoser:*(void *)(a1 + 64)];

    [*(id *)(a1 + 40) _createFileProvidingRequestOperationOfFileObject:*(void *)(a1 + 48) localItem:v21 etagIfLoser:*(void *)(a1 + 64) etagToDownload:v8 progress:*(void *)(a1 + 72) options:*(void *)(a1 + 88) reply:*(void *)(a1 + 80)];
  }
  else
  {
    __int16 v9 = brc_bread_crumbs();
    char v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_104_cold_1(a1);
    }

    id v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [*(id *)(a1 + 48) asString];
      id v16 = objc_msgSend(v13, "brc_errorAcceptShareFailedForItem:", v15);
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = [*(id *)(a1 + 48) asString];
    uint64_t v20 = objc_msgSend(v18, "brc_errorAcceptShareFailedForItem:", v19);
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v20);
  }
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_106(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v4 = [WeakRetained error];

  if (v4)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_106_cold_1((id *)(a1 + 72));
    }

    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) asString];
      uint64_t v12 = objc_msgSend(v9, "brc_errorAcceptShareFailedForItem:", v11);
      int v18 = 138413058;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v18, 0x2Au);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    id v15 = [*(id *)(a1 + 40) asString];
    id v16 = objc_msgSend(v14, "brc_errorAcceptShareFailedForItem:", v15);
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v16);
  }
  else
  {
    uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v17();
  }
}

- (void)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v10 = (BRCXPCRegularIPCsClient *)a3;
  id v35 = a4;
  id v11 = a6;
  memset(v49, 0, sizeof(v49));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) deleteItemWithIdentifier:baseVersion:options:completionHandler:]", 842, v49);
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v10;
    uint64_t v15 = v49[0];
    qos_class_t v16 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    uint64_t v51 = v15;
    __int16 v52 = 2112;
    char v53 = self;
    __int16 v54 = 2112;
    int v55 = v17;
    __int16 v56 = 2080;
    __int16 v57 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) deleteItemWithIdentifier:baseVersion:options:completionHandler:]";
    __int16 v58 = 2112;
    unint64_t v59 = (unint64_t)v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    uint64_t v10 = v14;
  }

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke;
  v47[3] = &unk_265080B38;
  v47[4] = self;
  id v18 = v11;
  id v48 = v18;
  int v19 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v47);

  if (v19)
  {
    memset(v46, 0, sizeof(v46));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) deleteItemWithIdentifier:baseVersion:options:completionHandler:]", 851, v46);
    __int16 v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unint64_t v22 = a5;
      a5 = (unint64_t)v10;
      uint64_t v23 = v46[0];
      qos_class_t v24 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      uint64_t v25 = (char *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend(v35, "br_prettyDescription");
      *(_DWORD *)buf = 134219778;
      uint64_t v51 = v23;
      __int16 v52 = 2112;
      char v53 = self;
      __int16 v54 = 2112;
      int v55 = v25;
      __int16 v56 = 2080;
      __int16 v57 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) deleteItemWithIdentifier:baseVersion:options:completionHandler:]";
      __int16 v58 = 2112;
      uint64_t v10 = (BRCXPCRegularIPCsClient *)a5;
      unint64_t v59 = a5;
      __int16 v60 = 2112;
      id v61 = v26;
      __int16 v62 = 2048;
      LOBYTE(a5) = v22;
      unint64_t v63 = v22;
      __int16 v64 = 2112;
      id v65 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@, %@, 0x%lx%@", buf, 0x52u);
    }
    memset(v45, 0, sizeof(v45));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) deleteItemWithIdentifier:baseVersion:options:completionHandler:]", 854, v45);
    brc_bread_crumbs();
    id v27 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v28 = brc_default_log();
    char v29 = a5 & 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v34 = " recursively";
      *(_DWORD *)buf = 134218754;
      if ((a5 & 1) == 0) {
        id v34 = "";
      }
      uint64_t v51 = v45[0];
      __int16 v52 = 2112;
      char v53 = v10;
      __int16 v54 = 2080;
      int v55 = v34;
      __int16 v56 = 2112;
      __int16 v57 = v27;
      _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx deleting item %@%s%@", buf, 0x2Au);
    }

    uint64_t v30 = [MEMORY[0x263F325B8] fileObjectIDWithString:v10];
    if ([v30 type] == 1 || !objc_msgSend(v30, "type"))
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_110;
      v43[3] = &unk_265083268;
      v43[4] = self;
      id v44 = v18;
      [(BRCXPCRegularIPCsClient *)self getQueryItemForBRFileObjectID:v30 reply:v43];
    }
    else
    {
      id v31 = [(BRCXPCClient *)self session];
      unint64_t v32 = [v31 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_112;
      block[3] = &unk_265083290;
      id v37 = v31;
      id v38 = v30;
      __int16 v39 = self;
      char v42 = v29;
      id v40 = v35;
      id v41 = v18;
      id v33 = v31;
      dispatch_async_and_wait(v32, block);
    }
    __brc_leave_section(v45);
    __brc_leave_section(v46);
  }
  __brc_leave_section(v49);
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_110_cold_1();
  }

  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorForRejectedDeletionOfItem:", v3);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorForRejectedDeletionOfItem:", v3);
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_112(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) itemByFileObjectID:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) session];
  uint64_t v4 = [v3 fsImporter];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = 0;
  [v4 deleteItem:v2 recursively:v5 baseVersion:v6 error:&v11];
  id v7 = v11;

  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 additionalAttrs:(id)a8 completionHandler:(id)a9
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v43 = a4;
  id v44 = a6;
  id v42 = a8;
  id v14 = a9;
  memset(v59, 0, sizeof(v59));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) modifyItem:baseVersion:changedFields:contents:options:additionalAttrs:completionHandler:]", 901, v59);
  id v15 = brc_bread_crumbs();
  __int16 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v59[0];
    qos_class_t v18 = qos_class_self();
    int v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v61 = (BRCXPCRegularIPCsClient *)v17;
    __int16 v62 = 2112;
    unint64_t v63 = self;
    __int16 v64 = 2112;
    *(void *)id v65 = v19;
    *(_WORD *)&v65[8] = 2080;
    *(void *)&v65[10] = "-[BRCXPCRegularIPCsClient(FPFSAdditions) modifyItem:baseVersion:changedFields:contents:options"
                          ":additionalAttrs:completionHandler:]";
    *(_WORD *)&v65[18] = 2112;
    *(void *)&v65[20] = v15;
    _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke;
  v57[3] = &unk_265080B38;
  v57[4] = self;
  id v20 = v14;
  id v58 = v20;
  int v21 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v57);

  if (v21)
  {
    id v40 = [v44 url];
    memset(v56, 0, sizeof(v56));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) modifyItem:baseVersion:changedFields:contents:options:additionalAttrs:completionHandler:]", 912, v56);
    unint64_t v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      unint64_t v39 = a7;
      uint64_t v24 = v56[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "br_prettyDescription");
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 134220290;
      id v61 = (BRCXPCRegularIPCsClient *)v24;
      __int16 v62 = 2112;
      unint64_t v63 = self;
      __int16 v64 = 2112;
      *(void *)id v65 = v26;
      *(_WORD *)&v65[8] = 2080;
      *(void *)&v65[10] = "-[BRCXPCRegularIPCsClient(FPFSAdditions) modifyItem:baseVersion:changedFields:contents:optio"
                            "ns:additionalAttrs:completionHandler:]";
      *(_WORD *)&v65[18] = 2112;
      *(void *)&v65[20] = v45;
      __int16 v66 = 2112;
      id v67 = v27;
      __int16 v68 = 2112;
      uint64_t v69 = v28;
      __int16 v70 = 2112;
      id v71 = v40;
      __int16 v72 = 2048;
      unint64_t v73 = v39;
      __int16 v74 = 2112;
      id v75 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@, %@, <%@>, %@, 0x%lx%@", buf, 0x66u);
    }
    char v29 = [(BRCXPCClient *)self session];
    uint64_t v30 = (void *)MEMORY[0x263F325B8];
    id v31 = [v45 itemIdentifier];
    unint64_t v32 = [v30 fileObjectIDWithString:v31];

    if ([v32 isRootContainerItem])
    {
      id v33 = [BRCNotification alloc];
      id v34 = [(BRCXPCClient *)self session];
      id v35 = [(BRCNotification *)v33 initRootContainerNotificationWithSessionContext:v34];

      id v36 = brc_bread_crumbs();
      id v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413314;
        id v61 = self;
        __int16 v62 = 2112;
        unint64_t v63 = v35;
        __int16 v64 = 1024;
        *(_DWORD *)id v65 = 0;
        *(_WORD *)&void v65[4] = 2112;
        *(void *)&v65[6] = 0;
        *(_WORD *)&v65[14] = 2112;
        *(void *)&v65[16] = v36;
        _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
      }

      (*((void (**)(id, BRCXPCRegularIPCsClient *, void, void))v20 + 2))(v20, v35, 0, 0);
    }
    else
    {
      id v38 = [v29 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_113;
      block[3] = &unk_2650831F0;
      BOOL v47 = v29;
      id v48 = v32;
      id v49 = self;
      id v50 = v45;
      id v54 = v20;
      id v51 = v40;
      id v52 = v43;
      unint64_t v55 = a5;
      id v53 = v42;
      dispatch_async(v38, block);

      id v35 = v47;
    }

    __brc_leave_section(v56);
  }
  __brc_leave_section(v59);
}

void __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    __int16 v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", (uint8_t *)&v7, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_113(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clientDB];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_2;
  v8[3] = &unk_2650832B8;
  id v9 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  id v16 = *(id *)(a1 + 88);
  id v13 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 96);
  id v14 = v6;
  uint64_t v17 = v7;
  id v15 = *(id *)(a1 + 80);
  [v2 groupInTransaction:v8];
}

uint64_t __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) itemByFileObjectID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (!v2 || [v2 isDead])
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = [*(id *)(a1 + 56) itemIdentifier];
      id v9 = objc_msgSend(v6, "brc_errorItemNotFound:", v8);
      *(_DWORD *)buf = 138413314;
      unint64_t v63 = v7;
      __int16 v64 = 2112;
      id v65 = 0;
      __int16 v66 = 1024;
      int v67 = 0;
      __int16 v68 = 2112;
      id v69 = v9;
      __int16 v70 = 2112;
      id v71 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
    }
    uint64_t v10 = *(void *)(a1 + 88);
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    id v12 = [*(id *)(a1 + 56) itemIdentifier];
    id v13 = objc_msgSend(v11, "brc_errorItemNotFound:", v12);
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v13);

LABEL_6:
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  if (([v3 isZoneRoot] & 1) == 0)
  {
    id v16 = [v3 appLibrary];
    uint64_t v17 = [v16 mangledID];
    qos_class_t v18 = +[BRCUserDefaults defaultsForMangledID:v17];
    if (![v18 failModifyRequestsWhenInFlightUnAckedChanges])
    {
LABEL_19:

      goto LABEL_20;
    }
    int v19 = [v3 st];
    uint64_t v20 = [v19 localChangeCount];
    if (v20) {
      goto LABEL_11;
    }
    if (![v3 isDocument])
    {
LABEL_18:

      goto LABEL_19;
    }
    id v53 = [v3 asDocument];
    id v52 = [v53 currentVersion];
    if ([v52 localChangeCount])
    {
LABEL_11:
      int v21 = [*(id *)(a1 + 32) syncUpScheduler];
      unint64_t v22 = [v3 clientZone];
      uint64_t v23 = [v22 dbRowID];
      if ([v21 inFlightDiffsForItem:v3 zoneRowID:v23])
      {
        [v3 clientZone];
        uint64_t v55 = v20;
        qos_class_t v25 = v24 = v19;
        unsigned int v54 = ([v25 syncState] >> 2) & 1;

        int v19 = v24;
        unsigned int v26 = v54;

        if (v55) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }

      if (v20) {
        goto LABEL_18;
      }
    }
    unsigned int v26 = 0;
LABEL_33:

LABEL_34:
    if (v26)
    {
      id v44 = brc_bread_crumbs();
      id v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v63 = v3;
        __int16 v64 = 2112;
        id v65 = v44;
        _os_log_impl(&dword_23FA42000, v45, OS_LOG_TYPE_DEFAULT, "[WARNING] Received modify item request while we have un-acked in-flight diffs for %@. Returning with an error to retry later%@", buf, 0x16u);
      }

      uint64_t v46 = brc_bread_crumbs();
      BOOL v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = *(void **)(a1 + 48);
        id v49 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPostponeUpload");
        *(_DWORD *)buf = 138413314;
        unint64_t v63 = v48;
        __int16 v64 = 2112;
        id v65 = 0;
        __int16 v66 = 1024;
        int v67 = 0;
        __int16 v68 = 2112;
        id v69 = v49;
        __int16 v70 = 2112;
        id v71 = v46;
        _os_log_impl(&dword_23FA42000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
      }
      uint64_t v50 = *(void *)(a1 + 88);
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorPostponeUpload");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, id))(v50 + 16))(v50, 0, 0, v12);
      goto LABEL_6;
    }
  }
LABEL_20:
  int v27 = [*(id *)(a1 + 64) startAccessingSecurityScopedResource];
  uint64_t v61 = 0;
  __int16 v28 = [*(id *)(a1 + 32) fsImporter];
  uint64_t v29 = *(void *)(a1 + 96);
  uint64_t v30 = *(void *)(a1 + 56);
  uint64_t v31 = *(void *)(a1 + 64);
  uint64_t v32 = *(void *)(a1 + 72);
  uint64_t v33 = *(void *)(a1 + 80);
  id v60 = 0;
  LOBYTE(v51) = 0;
  uint64_t v14 = [v28 changeItem:v3 baseVersion:v32 changedFields:v29 newValues:v30 contents:v31 additionalAttrs:v33 clearCKInfoOnSyncUp:v51 stillPendingFields:&v61 error:&v60];
  id v12 = v60;

  if (v27) {
    [*(id *)(a1 + 64) stopAccessingSecurityScopedResource];
  }
  if (v12) {
    int v34 = 0;
  }
  else {
    int v34 = v14;
  }
  if (v34 == 1)
  {
    id v35 = [[BRCNotification alloc] initWithLocalItem:v3 itemDiffs:0];
    if ([v3 isZoneRoot])
    {
      id v36 = [v3 appLibrary];
      id v37 = [v36 containerMetadata];

      uint64_t v38 = [MEMORY[0x263F32610] containerItemForContainer:v37 withRepresentativeItem:v35];

      id v35 = (BRCNotification *)v38;
    }
    unint64_t v39 = *(void **)(a1 + 48);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_114;
    uint64_t v56[3] = &unk_265080F58;
    v56[4] = v39;
    __int16 v57 = v35;
    uint64_t v59 = v61;
    id v58 = *(id *)(a1 + 88);
    id v40 = v35;
    [v39 _queueOrCallCompletionBlock:v56];
  }
  else
  {
    id v41 = brc_bread_crumbs();
    id v42 = brc_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      unint64_t v63 = v43;
      __int16 v64 = 2112;
      id v65 = 0;
      __int16 v66 = 1024;
      int v67 = 0;
      __int16 v68 = 2112;
      id v69 = v12;
      __int16 v70 = 2112;
      id v71 = v41;
      _os_log_impl(&dword_23FA42000, v42, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", buf, 0x30u);
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
LABEL_7:

  return v14;
}

uint64_t __130__BRCXPCRegularIPCsClient_FPFSAdditions__modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler___block_invoke_114(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[7];
    int v8 = 138413314;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %lu, %@)%@", (uint8_t *)&v8, 0x34u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)reimportItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) reimportItemIdentifier:reply:]", 983, v45);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v45[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v47 = v10;
    __int16 v48 = 2112;
    id v49 = self;
    __int16 v50 = 2112;
    uint64_t v51 = (uint64_t)v12;
    __int16 v52 = 2080;
    id v53 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) reimportItemIdentifier:reply:]";
    __int16 v54 = 2112;
    uint64_t v55 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x263F323E0];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __71__BRCXPCRegularIPCsClient_FPFSAdditions__reimportItemIdentifier_reply___block_invoke;
  v43[3] = &unk_265080B38;
  v43[4] = self;
  id v14 = v7;
  id v44 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v43);

  if (v13)
  {
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(FPFSAdditions) reimportItemIdentifier:reply:].cold.4();
    }

    uint64_t v17 = [MEMORY[0x263F841B0] sharedManager];
    uint64_t v18 = [v17 currentPersona];
    int v19 = objc_msgSend(v18, "br_personaID");

    if ([v19 isEqualToString:@"__defaultPersonaID__"]) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v19;
    }
    id v21 = v20;
    id v22 = v19;
    if (!v21)
    {
      if (reimportItemIdentifier_reply____personaOnceToken != -1) {
        dispatch_once(&reimportItemIdentifier_reply____personaOnceToken, &__block_literal_global_117);
      }
      id v22 = (id)reimportItemIdentifier_reply____personalPersona;
    }
    uint64_t v23 = [MEMORY[0x263F841B0] sharedManager];
    uint64_t v24 = [v23 currentPersona];

    id v42 = 0;
    id v25 = [v24 userPersonaUniqueString];
    unsigned int v26 = v25;
    if (v25 == v22 || ([v25 isEqualToString:v22] & 1) != 0)
    {
      int v27 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v41 = 0;
        __int16 v28 = (void *)[v24 copyCurrentPersonaContextWithError:&v41];
        id v36 = v41;
        id v29 = v42;
        id v42 = v28;

        if (v36)
        {
          uint64_t v30 = brc_bread_crumbs();
          uint64_t v31 = brc_default_log();
          if (os_log_type_enabled(v31, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        objc_msgSend(v24, "generateAndRestorePersonaContextWithPersonaUniqueString:", v22, v36);
        int v27 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();

        if (!v27) {
          goto LABEL_16;
        }
        uint64_t v38 = brc_bread_crumbs();
        uint64_t v32 = brc_default_log();
        if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v47 = (uint64_t)v19;
          __int16 v48 = 2112;
          id v49 = v27;
          __int16 v50 = 2112;
          uint64_t v33 = (void *)v38;
          uint64_t v51 = v38;
          _os_log_error_impl(&dword_23FA42000, v32, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
        else
        {
          uint64_t v33 = (void *)v38;
        }
      }
      else
      {
        if (v21 || ([v24 isDataSeparatedPersona] & 1) != 0)
        {
          int v34 = brc_bread_crumbs();
          id v35 = brc_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          int v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          goto LABEL_16;
        }
        uint64_t v33 = brc_bread_crumbs();
        uint64_t v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        int v27 = 0;
      }
    }
LABEL_16:
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __71__BRCXPCRegularIPCsClient_FPFSAdditions__reimportItemIdentifier_reply___block_invoke_119;
    v39[3] = &unk_265080B38;
    v39[4] = self;
    id v40 = v14;
    +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v6 completionHandler:v39];

    _BRRestorePersona();
  }
  __brc_leave_section(v45);
}

void __71__BRCXPCRegularIPCsClient_FPFSAdditions__reimportItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCXPCRegularIPCsClient_FPFSAdditions__reimportItemIdentifier_reply___block_invoke_115()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)reimportItemIdentifier_reply____personalPersona;
  reimportItemIdentifier_reply____personalPersona = v0;
}

void __71__BRCXPCRegularIPCsClient_FPFSAdditions__reimportItemIdentifier_reply___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateTrashItemsFromRank:(unint64_t)a3 limit:(unint64_t)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a5;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) enumerateTrashItemsFromRank:limit:completion:]", 1003, v30);
  __int16 v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v30[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v11;
    __int16 v33 = 2112;
    int v34 = self;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2080;
    uint64_t v38 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) enumerateTrashItemsFromRank:limit:completion:]";
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke;
  v28[3] = &unk_265080B38;
  v28[4] = self;
  id v14 = v8;
  id v29 = v14;
  int v15 = _brc_ipc_check_applibrary_proxy(self, 1, v28);

  if (v15)
  {
    __int16 v16 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    uint64_t v18 = [v16 readOnlyWorkloop];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke_120;
    v22[3] = &unk_2650832E0;
    unint64_t v26 = a4;
    id v19 = v16;
    unint64_t v27 = a3;
    id v23 = v19;
    uint64_t v24 = self;
    id v25 = v14;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke_122;
    v20[3] = &unk_26507F850;
    v20[4] = self;
    id v21 = v25;
    brc_task_tracker_async_with_logs(tracker, v18, v22, v20);
  }
  __brc_leave_section(v30);
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    __int16 v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", (uint8_t *)&v7, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke_120(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a1[7]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = (void *)v1[4];
  uint64_t v5 = v1[7];
  uint64_t v4 = v1[8];
  uint64_t v6 = [v3 readOnlyDB];
  int v7 = [v3 trashedItemsEnumeratorFromNotifRank:v4 batchSize:v5 db:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v22 = v1;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = [v13 notifsRank];
        __int16 v15 = +[BRCNotification notificationFromItem:v13];
        __int16 v16 = [v15 asFileProviderItem];

        if (v16) {
          [v2 addObject:v16];
        }
      }
      v10 += v9;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v9);
    uint64_t v17 = v14 + 1;
    uint64_t v1 = v22;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v17 = 0;
  }

  if (v10 >= v1[7]) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = brc_bread_crumbs();
  uint64_t v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = v1[5];
    *(_DWORD *)buf = 138413314;
    uint64_t v28 = v21;
    __int16 v29 = 2112;
    uint64_t v30 = v2;
    __int16 v31 = 2048;
    uint64_t v32 = v18;
    __int16 v33 = 2112;
    uint64_t v34 = 0;
    __int16 v35 = 2112;
    id v36 = v19;
    _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %@)%@", buf, 0x34u);
  }

  (*(void (**)(void))(v1[6] + 16))();
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__enumerateTrashItemsFromRank_limit_completion___block_invoke_122(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413314;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 2112;
    __int16 v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %d, %@)%@", (uint8_t *)&v8, 0x30u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
}

- (void)notifyReimportCompleted:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) notifyReimportCompleted:]", 1035, v21);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v21[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v23 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v24 = 2112;
    long long v25 = self;
    __int16 v26 = 2112;
    unint64_t v27 = v9;
    __int16 v28 = 2080;
    __int16 v29 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) notifyReimportCompleted:]";
    __int16 v30 = 2112;
    __int16 v31 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__BRCXPCRegularIPCsClient_FPFSAdditions__notifyReimportCompleted___block_invoke;
  v19[3] = &unk_265080B38;
  v19[4] = self;
  id v10 = v4;
  id v20 = v10;
  int v11 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v19);

  if (v11)
  {
    __int16 v12 = [(BRCXPCClient *)self session];
    int v13 = [v12 clientTruthWorkloop];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __66__BRCXPCRegularIPCsClient_FPFSAdditions__notifyReimportCompleted___block_invoke_123;
    v17[3] = &unk_26507ED70;
    id v14 = v12;
    id v18 = v14;
    dispatch_async_and_wait(v13, v17);

    __int16 v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      long long v23 = self;
      __int16 v24 = 2112;
      long long v25 = 0;
      __int16 v26 = 2112;
      unint64_t v27 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v21);
}

void __66__BRCXPCRegularIPCsClient_FPFSAdditions__notifyReimportCompleted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __66__BRCXPCRegularIPCsClient_FPFSAdditions__notifyReimportCompleted___block_invoke_123(uint64_t a1)
{
  return [*(id *)(a1 + 32) markMigrationToFPFSComplete];
}

- (void)boostFilePresenterForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "br_isBoostableItemIdentifier"))
  {
    memset(v17, 0, sizeof(v17));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) boostFilePresenterForItemIdentifier:reply:]", 1077, v17);
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v17[0];
      qos_class_t v11 = qos_class_self();
      __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      id v19 = (BRCXPCRegularIPCsClient *)v10;
      __int16 v20 = 2112;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      long long v23 = v12;
      __int16 v24 = 2080;
      long long v25 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) boostFilePresenterForItemIdentifier:reply:]";
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      __int16 v29 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__BRCXPCRegularIPCsClient_FPFSAdditions__boostFilePresenterForItemIdentifier_reply___block_invoke;
    v15[3] = &unk_265083308;
    void v15[4] = self;
    id v16 = v7;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v6 dbAccessKind:0 synchronouslyIfPossible:0 handler:v15];

    __brc_leave_section(v17);
  }
  else
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      long long v23 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __84__BRCXPCRegularIPCsClient_FPFSAdditions__boostFilePresenterForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = objc_msgSend(v5, "brc_wrappedError");
      int v26 = 138412802;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      __int16 v29 = v9;
      __int16 v30 = 2112;
      __int16 v31 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    qos_class_t v11 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    __int16 v12 = [a2 appLibrary];
    qos_class_t v11 = v12;
    if (v12
      && ([v12 defaultClientZone],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isSyncBlockedBecauseAppNotInstalled],
          v13,
          !v14))
    {
      [*(id *)(a1 + 32) addAppLibrary:v11];
      id v18 = (void *)*MEMORY[0x263F32308];
      id v19 = [v11 session];
      __int16 v20 = [v19 personaIdentifier];
      uint64_t v21 = objc_msgSend(v18, "br_libnotifyPerPersonaNotificationName:", v20);

      __int16 v22 = [MEMORY[0x263F08A00] defaultCenter];
      [v22 postNotificationName:v21 object:0];

      long long v23 = brc_bread_crumbs();
      __int16 v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        int v26 = 138412802;
        uint64_t v27 = v25;
        __int16 v28 = 2112;
        __int16 v29 = 0;
        __int16 v30 = 2112;
        __int16 v31 = v23;
        _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v26, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      __int16 v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v26 = 138412802;
        uint64_t v27 = v17;
        __int16 v28 = 2112;
        __int16 v29 = 0;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v26, 0x20u);
      }

      (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
    }
  }
}

- (void)_unboostFilePresenterForItemIdentifier:(id)a3 handledAppLibrarys:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) _unboostFilePresenterForItemIdentifier:handledAppLibrarys:completionHandler:]", 1093, v22);
  qos_class_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v22[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    int v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) _unboostFilePresenterForItemIdentifier:handledAppLibrarys:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __118__BRCXPCRegularIPCsClient_FPFSAdditions___unboostFilePresenterForItemIdentifier_handledAppLibrarys_completionHandler___block_invoke;
  v18[3] = &unk_265083330;
  id v16 = v10;
  id v21 = v16;
  id v17 = v9;
  id v19 = v17;
  __int16 v20 = self;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v8 dbAccessKind:0 synchronouslyIfPossible:0 handler:v18];

  __brc_leave_section(v22);
}

void __118__BRCXPCRegularIPCsClient_FPFSAdditions___unboostFilePresenterForItemIdentifier_handledAppLibrarys_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    objc_msgSend(a3, "brc_wrappedError");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    uint64_t v5 = [a2 appLibrary];
    id v7 = (id)v5;
    if (v5)
    {
      char v6 = [*(id *)(a1 + 32) containsObject:v5];
      uint64_t v5 = (uint64_t)v7;
      if ((v6 & 1) == 0)
      {
        [*(id *)(a1 + 40) removeAppLibrary:v7];
        uint64_t v5 = (uint64_t)v7;
      }
    }
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, 0);
  }
}

- (void)unboostFilePresenterForItemIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) unboostFilePresenterForItemIdentifiers:reply:]", 1098, v34);
  char v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v34[0];
    qos_class_t v9 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    id v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v37 = v10;
    *(_WORD *)uint64_t v38 = 2080;
    *(void *)&v38[2] = "-[BRCXPCRegularIPCsClient(FPFSAdditions) unboostFilePresenterForItemIdentifiers:reply:]";
    *(_WORD *)&v38[10] = 2112;
    *(void *)&v38[12] = v5;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v37 = __Block_byref_object_copy__25;
  *(void *)uint64_t v38 = __Block_byref_object_dispose__25;
  *(void *)&v38[8] = 0;
  qos_class_t v11 = objc_opt_new();
  __int16 v12 = dispatch_group_create();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v17, "br_isBoostableItemIdentifier", v21))
        {
          dispatch_group_enter(v12);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__unboostFilePresenterForItemIdentifiers_reply___block_invoke;
          uint64_t v26[3] = &unk_265083358;
          __int16 v29 = buf;
          id v18 = v11;
          id v27 = v18;
          __int16 v28 = v12;
          [(BRCXPCRegularIPCsClient *)self _unboostFilePresenterForItemIdentifier:v17 handledAppLibrarys:v18 completionHandler:v26];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }

  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__BRCXPCRegularIPCsClient_FPFSAdditions__unboostFilePresenterForItemIdentifiers_reply___block_invoke_2;
  block[3] = &unk_265083380;
  __int16 v25 = buf;
  void block[4] = self;
  id v24 = v21;
  id v20 = v21;
  dispatch_group_notify(v12, queue, block);

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v34);
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__unboostFilePresenterForItemIdentifiers_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __87__BRCXPCRegularIPCsClient_FPFSAdditions__unboostFilePresenterForItemIdentifiers_reply___block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)capabilityWhenTryingToReparentItemIdentifier:(id)a3 toNewParent:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) capabilityWhenTryingToReparentItemIdentifier:toNewParent:reply:]", 1146, v21);
  __int16 v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v21[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    __int16 v25 = self;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2080;
    __int16 v29 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) capabilityWhenTryingToReparentItemIdentifier:toNewParent:reply:]";
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    long long v33 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __105__BRCXPCRegularIPCsClient_FPFSAdditions__capabilityWhenTryingToReparentItemIdentifier_toNewParent_reply___block_invoke;
  v18[3] = &unk_2650833D0;
  void v18[4] = self;
  id v16 = v10;
  id v20 = v16;
  id v17 = v9;
  id v19 = v17;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v8 dbAccessKind:1 synchronouslyIfPossible:0 handler:v18];

  __brc_leave_section(v21);
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__capabilityWhenTryingToReparentItemIdentifier_toNewParent_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v29 = v19;
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = 1;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v20;
      *(_WORD *)&v31[14] = 2112;
      *(void *)&v31[16] = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v21 = *(void *)(a1 + 48);
    __int16 v22 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v21 + 16))(v21, 1, v22);
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) capabilityWhenTryingToReparentItemIdentifier:toNewParent:reply:]_block_invoke", 1145, v27);
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v27[0];
      uint64_t v11 = *(void *)(a1 + 32);
      qos_class_t v12 = qos_class_self();
      uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134219266;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      *(void *)id v31 = v11;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v13;
      *(_WORD *)&v31[18] = 2080;
      *(void *)&unsigned char v31[20] = "-[BRCXPCRegularIPCsClient(FPFSAdditions) capabilityWhenTryingToReparentItemIdentifier:toNewP"
                            "arent:reply:]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __105__BRCXPCRegularIPCsClient_FPFSAdditions__capabilityWhenTryingToReparentItemIdentifier_toNewParent_reply___block_invoke_128;
    uint64_t v23[3] = &unk_2650833A8;
    v23[4] = v15;
    id v24 = 0;
    id v26 = *(id *)(a1 + 48);
    id v25 = v5;
    [v15 accessItemIdentifierLocalItem:v16 dbAccessKind:1 synchronouslyIfPossible:0 handler:v23];

    __brc_leave_section(v27);
  }
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__capabilityWhenTryingToReparentItemIdentifier_toNewParent_reply___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      id v24 = objc_msgSend(*(id *)(a1 + 40), "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v31 = v23;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = 1;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v24;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v25 = *(void *)(a1 + 56);
    id v26 = objc_msgSend(*(id *)(a1 + 40), "brc_wrappedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v25 + 16))(v25, 1, v26);
  }
  else
  {
    memset(v29, 0, sizeof(v29));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) capabilityWhenTryingToReparentItemIdentifier:toNewParent:reply:]_block_invoke", 1139, v29);
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      uint64_t v31 = v29[0];
      __int16 v32 = 2112;
      *(void *)uint64_t v33 = v27;
      *(_WORD *)&v33[8] = 2112;
      *(void *)&v33[10] = v5;
      *(_WORD *)&v33[18] = 2112;
      *(void *)&v33[20] = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx getting move status to reparent %@ to %@%@", buf, 0x2Au);
    }

    uint64_t v10 = +[BRCDaemonContainerHelper sharedHelper];
    uint64_t v11 = *(void **)(a1 + 48);
    qos_class_t v12 = [v11 session];
    id v28 = 0;
    uint64_t v13 = objc_msgSend(v10, "br_capabilityToMoveFromLocalItem:toNewParent:session:error:", v11, v5, v12, &v28);
    id v14 = v28;

    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = objc_msgSend(v14, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v31 = v17;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = v13;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v18;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v19 = *(void *)(a1 + 56);
    id v20 = objc_msgSend(v14, "brc_wrappedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, v13, v20);

    __brc_leave_section(v29);
  }
}

- (void)getBookmarkDataForItemIdentifier:(id)a3 onlyAllowItemKnowByServer:(BOOL)a4 allowAccessByBundleID:(id)a5 documentID:(id)a6 isDirectory:(BOOL)a7 reply:(id)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v28 = a5;
  id v15 = a6;
  id v16 = a8;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getBookmarkDataForItemIdentifier:onlyAllowItemKnowByServer:allowAccessByBundleID:documentID:isDirectory:reply:]", 1181, v36);
  uint64_t v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v27 = v15;
    BOOL v19 = a4;
    BOOL v20 = a7;
    uint64_t v21 = v36[0];
    qos_class_t v22 = qos_class_self();
    uint64_t v23 = BRCPrettyPrintEnumWithContext(v22, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v38 = v21;
    __int16 v39 = 2112;
    id v40 = self;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2080;
    id v44 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getBookmarkDataForItemIdentifier:onlyAllowItemKnowByServer:allowAcces"
          "sByBundleID:documentID:isDirectory:reply:]";
    __int16 v45 = 2112;
    id v46 = v14;
    __int16 v47 = 2112;
    __int16 v48 = v17;
    _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    a7 = v20;
    a4 = v19;
    id v15 = v27;
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __152__BRCXPCRegularIPCsClient_FPFSAdditions__getBookmarkDataForItemIdentifier_onlyAllowItemKnowByServer_allowAccessByBundleID_documentID_isDirectory_reply___block_invoke;
  uint64_t v29[3] = &unk_2650833F8;
  BOOL v34 = a4;
  BOOL v35 = a7;
  id v24 = v14;
  id v30 = v24;
  id v25 = v15;
  id v31 = v25;
  __int16 v32 = self;
  id v26 = v16;
  id v33 = v26;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v24 dbAccessKind:0 synchronouslyIfPossible:0 handler:v29];

  __brc_leave_section(v36);
}

void __152__BRCXPCRegularIPCsClient_FPFSAdditions__getBookmarkDataForItemIdentifier_onlyAllowItemKnowByServer_allowAccessByBundleID_documentID_isDirectory_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    qos_class_t v12 = 0;
LABEL_13:
    uint64_t v11 = 0;
    int v7 = 0;
    goto LABEL_14;
  }
  if ([v5 isKnownByServer])
  {
    if (([v5 isFSRoot] & 1) == 0)
    {
      int v7 = [v5 bookmarkData];
      if ([v5 isDocument])
      {
        id v8 = [v5 asDocument];
        id v9 = [v8 currentVersion];
        uint64_t v10 = [v9 ckInfo];
        uint64_t v11 = [v10 etag];
      }
      else
      {
        id v8 = [v5 st];
        id v9 = [v8 ckInfo];
        uint64_t v11 = [v9 etag];
      }

      qos_class_t v12 = 0;
      goto LABEL_14;
    }
  }
  else if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
LABEL_12:
    qos_class_t v12 = (void *)v13;
    goto LABEL_13;
  }
  if (![v5 isDocument] || *(unsigned char *)(a1 + 65))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", *(void *)(a1 + 32), 21);
    goto LABEL_12;
  }
  BOOL v20 = NSString;
  uint64_t v21 = *(void *)(a1 + 40);
  qos_class_t v22 = [v5 serverZone];
  int v7 = [v20 bookmarkDataWithDocumentID:v21 serverZone:v22];

  qos_class_t v12 = 0;
  uint64_t v11 = 0;
LABEL_14:
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = objc_msgSend(v12, "brc_wrappedError");
    int v23 = 138413314;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 2112;
    __int16 v32 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v23, 0x34u);
  }
  uint64_t v18 = *(void *)(a1 + 56);
  BOOL v19 = objc_msgSend(v12, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v18 + 16))(v18, v7, v11, v19);
}

- (void)getPublishedURLForItemIdentifier:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke;
  v31[3] = &unk_265083420;
  v31[4] = self;
  id v12 = v11;
  id v32 = v12;
  uint64_t v13 = (void *)MEMORY[0x2455D9A50](v31);
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getPublishedURLForItemIdentifier:forStreaming:requestedTTL:reply:]", 1214, v30);
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v23 = v13;
    BOOL v16 = a4;
    unint64_t v17 = a5;
    uint64_t v18 = v30[0];
    qos_class_t v19 = qos_class_self();
    BOOL v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v34 = v18;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v20;
    __int16 v39 = 2080;
    id v40 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getPublishedURLForItemIdentifier:forStreaming:requestedTTL:reply:]";
    __int16 v41 = 2112;
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    a5 = v17;
    a4 = v16;
    uint64_t v13 = v23;
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke_134;
  v24[3] = &unk_265083448;
  id v21 = v13;
  id v27 = v21;
  id v22 = v10;
  id v25 = v22;
  id v26 = self;
  BOOL v29 = a4;
  unint64_t v28 = a5;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v22 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

  __brc_leave_section(v30);
}

void __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || !v8 || v9)
  {
    if (!v9)
    {
      id v10 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 15, @"Publish failed but no error was set");
    }

    id v8 = 0;
    id v7 = 0;
  }
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = objc_msgSend(v10, "brc_wrappedError");
    int v17 = 138413314;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  BOOL v16 = objc_msgSend(v10, "brc_wrappedError");
  (*(void (**)(uint64_t, id, id, void *))(v15 + 16))(v15, v7, v8, v16);
}

void __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (!v5)
    {
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke_134_cold_1(a1);
      }
    }
    [*(id *)(a1 + 40) _getPublishedURLForLocalItem:v5 forStreaming:*(unsigned __int8 *)(a1 + 64) requestedTTL:*(void *)(a1 + 56) reply:*(void *)(a1 + 48)];
  }
}

- (void)getAttributeValues:(id)a3 forItemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getAttributeValues:forItemIdentifier:reply:]", 1230, v21);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v21[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    __int16 v25 = self;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2080;
    BOOL v29 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getAttributeValues:forItemIdentifier:reply:]";
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__getAttributeValues_forItemIdentifier_reply___block_invoke;
  v18[3] = &unk_265083470;
  void v18[4] = self;
  id v16 = v8;
  id v19 = v16;
  id v17 = v10;
  id v20 = v17;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v9 dbAccessKind:0 synchronouslyIfPossible:0 handler:v18];

  __brc_leave_section(v21);
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__getAttributeValues_forItemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) _removeSandboxedAttributes:*(void *)(a1 + 40)];
    id v7 = +[BRCUbiquitousAttributes brc_attributesValues:v8 localItem:v5];
  }
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138413058;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getiWorkPublishingInfoForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingInfoForItemIdentifier:reply:]", 1238, v26);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    __int16 v30 = self;
    __int16 v31 = 2112;
    __int16 v32 = v12;
    __int16 v33 = 2080;
    uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingInfoForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x263F32350];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingInfoForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v14 = v7;
  id v25 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v24);

  if (v13)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingInfoForItemIdentifier:reply:]", 1247, v23);
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      id v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      __int16 v33 = 2080;
      uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingInfoForItemIdentifier:reply:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __88__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingInfoForItemIdentifier_reply___block_invoke_136;
    v20[3] = &unk_2650833D0;
    v20[4] = self;
    id v22 = v14;
    id v21 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v21 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __88__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingInfoForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    qos_class_t v18 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v7, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingInfoForItemIdentifier_reply___block_invoke_136(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413570;
      uint64_t v10 = v8;
      __int16 v11 = 1024;
      int v12 = 0;
      __int16 v13 = 1024;
      int v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v9, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _getiWorkPublishingInfoForLocalItem:a2 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

- (void)setiWorkPublishingInfoForItemIdentifier:(id)a3 isForPublish:(BOOL)a4 readonly:(BOOL)a5 reply:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) setiWorkPublishingInfoForItemIdentifier:isForPublish:readonly:reply:]", 1257, v36);
  int v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BOOL v14 = a4;
    BOOL v15 = a5;
    uint64_t v16 = v36[0];
    qos_class_t v17 = qos_class_self();
    id v18 = BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = v16;
    __int16 v39 = 2112;
    id v40 = self;
    __int16 v41 = 2112;
    id v42 = v18;
    __int16 v43 = 2080;
    id v44 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) setiWorkPublishingInfoForItemIdentifier:isForPublish:readonly:reply:]";
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a5 = v15;
    a4 = v14;
  }

  __int16 v19 = (void *)*MEMORY[0x263F32350];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __110__BRCXPCRegularIPCsClient_FPFSAdditions__setiWorkPublishingInfoForItemIdentifier_isForPublish_readonly_reply___block_invoke;
  uint64_t v34[3] = &unk_265080B38;
  v34[4] = self;
  id v20 = v11;
  id v35 = v20;
  LODWORD(v19) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v19, v34);

  if (v19)
  {
    memset(v33, 0, sizeof(v33));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) setiWorkPublishingInfoForItemIdentifier:isForPublish:readonly:reply:]", 1268, v33);
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v27 = a4;
      BOOL v23 = a5;
      uint64_t v24 = v33[0];
      qos_class_t v25 = qos_class_self();
      __int16 v26 = BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v38 = v24;
      __int16 v39 = 2112;
      id v40 = self;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2080;
      id v44 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) setiWorkPublishingInfoForItemIdentifier:isForPublish:readonly:reply:]";
      __int16 v45 = 2112;
      id v46 = v10;
      __int16 v47 = 2112;
      __int16 v48 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      a5 = v23;
      a4 = v27;
    }

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __110__BRCXPCRegularIPCsClient_FPFSAdditions__setiWorkPublishingInfoForItemIdentifier_isForPublish_readonly_reply___block_invoke_137;
    v28[3] = &unk_265083498;
    v28[4] = self;
    id v30 = v20;
    id v29 = v10;
    BOOL v31 = a4;
    BOOL v32 = a5;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v29 dbAccessKind:0 synchronouslyIfPossible:0 handler:v28];

    __brc_leave_section(v33);
  }
  __brc_leave_section(v36);
}

void __110__BRCXPCRegularIPCsClient_FPFSAdditions__setiWorkPublishingInfoForItemIdentifier_isForPublish_readonly_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __110__BRCXPCRegularIPCsClient_FPFSAdditions__setiWorkPublishingInfoForItemIdentifier_isForPublish_readonly_reply___block_invoke_137(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = objc_msgSend(v5, "brc_wrappedError");
      int v12 = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      BOOL v15 = v9;
      __int16 v16 = 2112;
      qos_class_t v17 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    __int16 v11 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    [*(id *)(a1 + 32) _setiWorkPublishingInfoForLocalItem:a2 itemIdentifier:*(void *)(a1 + 40) publish:*(unsigned __int8 *)(a1 + 56) readonly:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
  }
}

- (void)getiWorkPublishingBadgingStatusForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingBadgingStatusForItemIdentifier:reply:]", 1276, v26);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = self;
    __int16 v31 = 2112;
    BOOL v32 = v12;
    __int16 v33 = 2080;
    uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingBadgingStatusForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x263F32350];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __97__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingBadgingStatusForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v14 = v7;
  id v25 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v24);

  if (v13)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingBadgingStatusForItemIdentifier:reply:]", 1285, v23);
    BOOL v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      __int16 v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = self;
      __int16 v31 = 2112;
      BOOL v32 = v19;
      __int16 v33 = 2080;
      uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkPublishingBadgingStatusForItemIdentifier:reply:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __97__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingBadgingStatusForItemIdentifier_reply___block_invoke_138;
    v20[3] = &unk_2650833D0;
    v20[4] = self;
    id v22 = v14;
    id v21 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v21 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __97__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingBadgingStatusForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkPublishingBadgingStatusForItemIdentifier_reply___block_invoke_138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      uint64_t v10 = v8;
      __int16 v11 = 1024;
      int v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v9, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _getiWorkPublishingBadgingStatusForLocalItem:a2 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

- (void)getiWorkNeedsShareMigrateForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkNeedsShareMigrateForItemIdentifier:reply:]", 1293, v26);
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = self;
    __int16 v31 = 2112;
    BOOL v32 = v12;
    __int16 v33 = 2080;
    uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkNeedsShareMigrateForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v13 = (void *)*MEMORY[0x263F32350];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkNeedsShareMigrateForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v14 = v7;
  id v25 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v24);

  if (v13)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkNeedsShareMigrateForItemIdentifier:reply:]", 1302, v23);
    __int16 v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      __int16 v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = self;
      __int16 v31 = 2112;
      BOOL v32 = v19;
      __int16 v33 = 2080;
      uint64_t v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getiWorkNeedsShareMigrateForItemIdentifier:reply:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkNeedsShareMigrateForItemIdentifier_reply___block_invoke_139;
    v20[3] = &unk_2650833D0;
    v20[4] = self;
    id v22 = v14;
    id v21 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v21 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __91__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkNeedsShareMigrateForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__BRCXPCRegularIPCsClient_FPFSAdditions__getiWorkNeedsShareMigrateForItemIdentifier_reply___block_invoke_139(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      uint64_t v10 = v8;
      __int16 v11 = 1024;
      int v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v9, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _getiWorkNeedsShareMigrateForLocalItem:a2 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

- (void)_refreshLatestRevisionAndSharingStateForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) _refreshLatestRevisionAndSharingStateForItemIdentifier:reply:]", 1359, v18);
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v18[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2080;
    __int16 v26 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) _refreshLatestRevisionAndSharingStateForItemIdentifier:reply:]";
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke;
  v15[3] = &unk_2650833D0;
  void v15[4] = self;
  id v13 = v7;
  id v17 = v13;
  id v14 = v6;
  id v16 = v14;
  [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v14 dbAccessKind:0 synchronouslyIfPossible:0 handler:v15];

  __brc_leave_section(v18);
}

void __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v9;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_21;
  }
  if (([v5 isIdleOrRejected] & 1) == 0 && (objc_msgSend(v5, "localDiffs") & 0x3FF0000) != 0)
  {
    uint64_t v10 = brc_bread_crumbs();
    qos_class_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v12;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    __int16 v15 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
LABEL_20:

    goto LABEL_21;
  }
  if ([v5 isDocument])
  {
    id v16 = [v5 itemID];
    id v17 = [v16 itemIDString];
    __int16 v15 = [@"documentContent/" stringByAppendingString:v17];

    id v18 = objc_alloc(MEMORY[0x263EFD7E8]);
    __int16 v19 = [v5 serverZone];
    uint64_t v20 = [v19 zoneID];
    __int16 v21 = (void *)[v18 initWithRecordName:v15 zoneID:v20];

    id v22 = [v5 clientZone];
    __int16 v23 = +[BRCUserDefaults defaultsForMangledID:0];
    [v23 refreshRevisionMaxBackoff];
    uint64_t v24 = objc_msgSend(v22, "locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:", v21, 1);

    if (v24)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_141;
      v37[3] = &unk_2650834C0;
      v37[4] = *(void *)(a1 + 32);
      id v40 = *(id *)(a1 + 48);
      id v38 = *(id *)(a1 + 40);
      id v39 = v5;
      [v24 addLocateRecordCompletionBlock:v37];
    }
    else
    {
      uint64_t v31 = brc_bread_crumbs();
      BOOL v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = *(void *)(a1 + 32);
        uint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = v33;
        __int16 v43 = 2112;
        id v44 = v34;
        __int16 v45 = 2112;
        id v46 = v31;
        _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      uint64_t v35 = *(void *)(a1 + 48);
      id v36 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
      (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);
    }
    goto LABEL_20;
  }
  __int16 v25 = brc_bread_crumbs();
  __int16 v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    id v28 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    uint64_t v42 = v27;
    __int16 v43 = 2112;
    id v44 = v28;
    __int16 v45 = 2112;
    id v46 = v25;
    _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v29 = *(void *)(a1 + 48);
  id v30 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

LABEL_21:
}

void __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_141(uint64_t a1, char a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_msgSend(v5, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    qos_class_t v11 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else if (a2)
  {
    uint64_t v12 = [*(id *)(a1 + 32) session];
    id v13 = [v12 clientTruthWorkloop];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_142;
    uint64_t v21[3] = &unk_26507FBE0;
    uint64_t v14 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v14;
    id v24 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 48);
    dispatch_async(v13, v21);
  }
  else
  {
    __int16 v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
}

void __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_142(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 itemByFileObjectID:v3];

  if (!v4)
  {
    uint64_t v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v21 = *(void *)(a1 + 56);
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    id v16 = *(void (**)(void))(v21 + 16);
    goto LABEL_11;
  }
  id v5 = [v4 clientZone];
  id v6 = [*(id *)(a1 + 48) itemID];
  id v7 = [v5 serverItemByItemID:v6];

  if (v7)
  {
    uint64_t v8 = [v4 asDocument];
    uint64_t v9 = [v8 currentVersion];
    uint64_t v10 = [v7 latestVersion];
    if ([v9 isEtagEqual:v10])
    {
      uint64_t v11 = [v4 sharingOptions];
      uint64_t v12 = [v7 sharingOptions];

      if (v11 == v12)
      {
        id v13 = brc_bread_crumbs();
        uint64_t v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          uint64_t v32 = v15;
          __int16 v33 = 2112;
          uint64_t v34 = 0;
          __int16 v35 = 2112;
          id v36 = v13;
          _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }

        id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_11:
        v16();
        goto LABEL_22;
      }
    }
    else
    {
    }
    if ([v4 isIdleOrRejected])
    {
      if ([v7 isLive])
      {
        [v4 updateFromServerItem:v7];
        [v4 saveToDBForServerEdit:1 keepAliases:0];
      }
      goto LABEL_18;
    }
  }
  else if ([v4 isIdleOrRejected])
  {
LABEL_18:
    id v22 = [v4 db];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_143;
    uint64_t v29[3] = &unk_26507F850;
    void v29[4] = *(void *)(a1 + 32);
    id v30 = *(id *)(a1 + 56);
    [v22 scheduleFlushWithCheckpoint:0 whenFlushed:v29];

    goto LABEL_22;
  }
  id v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    uint64_t v34 = v26;
    __int16 v35 = 2112;
    id v36 = v23;
    _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v27 = *(void *)(a1 + 56);
  id v28 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemChanged");
  (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

LABEL_22:
}

uint64_t __103__BRCXPCRegularIPCsClient_FPFSAdditions___refreshLatestRevisionAndSharingStateForItemIdentifier_reply___block_invoke_143(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchLatestContentRevisionAndSharingStateForItemIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __108__BRCXPCRegularIPCsClient_FPFSAdditions___fetchLatestContentRevisionAndSharingStateForItemIdentifier_reply___block_invoke;
  v10[3] = &unk_265083510;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(BRCXPCRegularIPCsClient *)self _refreshLatestRevisionAndSharingStateForItemIdentifier:v8 reply:v10];
}

void __108__BRCXPCRegularIPCsClient_FPFSAdditions___fetchLatestContentRevisionAndSharingStateForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(v3, "brc_wrappedError");
      *(_DWORD *)buf = 138413314;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = objc_msgSend(v3, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __108__BRCXPCRegularIPCsClient_FPFSAdditions___fetchLatestContentRevisionAndSharingStateForItemIdentifier_reply___block_invoke_145;
    v11[3] = &unk_2650834E8;
    uint64_t v10 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    +[BRCImportUtil forceLatestVersionOnDiskForItemID:v10 completionHandler:v11];
  }
}

void __108__BRCXPCRegularIPCsClient_FPFSAdditions___fetchLatestContentRevisionAndSharingStateForItemIdentifier_reply___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v19 = 138413314;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      id v24 = 0;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v19, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = [BRFieldContentSignature alloc];
    id v11 = [v5 contentVersion];
    id v12 = [(BRFieldContentSignature *)v10 initWithData:v11];

    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [(BRFieldContentSignature *)v12 contentSignature];
      int v19 = 138413314;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = 0;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [(BRFieldContentSignature *)v12 contentSignature];
    (*(void (**)(uint64_t, void *, id, void))(v17 + 16))(v17, v18, v5, 0);
  }
}

- (void)calculateSignatureForItemIdentifier:(id)a3 forURL:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) calculateSignatureForItemIdentifier:forURL:reply:]", 1393, v30);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v30[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v13;
    __int16 v33 = 2112;
    uint64_t v34 = self;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2080;
    id v38 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) calculateSignatureForItemIdentifier:forURL:reply:]";
    __int16 v39 = 2112;
    id v40 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke;
  v28[3] = &unk_265080B38;
  v28[4] = self;
  id v16 = v10;
  id v29 = v16;
  int v17 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v28);

  if (v17)
  {
    memset(v27, 0, sizeof(v27));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) calculateSignatureForItemIdentifier:forURL:reply:]", 1408, v27);
    uint64_t v18 = brc_bread_crumbs();
    int v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v27[0];
      qos_class_t v21 = qos_class_self();
      id v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      uint64_t v34 = self;
      __int16 v35 = 2112;
      id v36 = v22;
      __int16 v37 = 2080;
      id v38 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) calculateSignatureForItemIdentifier:forURL:reply:]";
      __int16 v39 = 2112;
      id v40 = v8;
      __int16 v41 = 2112;
      uint64_t v42 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke_148;
    uint64_t v23[3] = &unk_2650833A8;
    v23[4] = self;
    id v24 = v8;
    id v26 = v16;
    id v25 = v9;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v24 dbAccessKind:1 synchronouslyIfPossible:0 handler:v23];

    __brc_leave_section(v27);
  }
  __brc_leave_section(v30);
}

void __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke_148(void *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 asDocument];
    int v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 clientZone];
      __int16 v9 = [v7 itemID];
      uint64_t v10 = [v7 db];
      __int16 v11 = [v8 contentBoundaryKeyForItemID:v9 withDB:v10];

      if (v11)
      {
        id v12 = [v7 clientZone];
        char v13 = [v12 enhancedDrivePrivacyEnabled];

        if ((v13 & 1) == 0)
        {
          qos_class_t v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke_148_cold_1();
          }
        }
      }
      id v16 = brc_bread_crumbs();
      int v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = a1[4];
        uint64_t v19 = a1[6];
        id v35 = 0;
        uint64_t v20 = +[BRCDocumentSignatureCalculator calculateSignatureForURL:v19 boundaryKey:v11 error:&v35];
        id v21 = v35;
        *(_DWORD *)buf = 138413058;
        uint64_t v37 = v18;
        __int16 v38 = 2112;
        __int16 v39 = v20;
        __int16 v40 = 2112;
        id v41 = v21;
        __int16 v42 = 2112;
        uint64_t v43 = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      else
      {
        id v21 = 0;
      }

      uint64_t v30 = a1[6];
      uint64_t v31 = a1[7];
      id v34 = v21;
      uint64_t v32 = +[BRCDocumentSignatureCalculator calculateSignatureForURL:v30 boundaryKey:v11 error:&v34];
      id v33 = v34;

      (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v32, v33);
    }
    else
    {
      id v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = a1[4];
        id v28 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", a1[5], @"Item is not a document");
        *(_DWORD *)buf = 138413058;
        uint64_t v37 = v27;
        __int16 v38 = 2112;
        __int16 v39 = 0;
        __int16 v40 = 2112;
        id v41 = v28;
        __int16 v42 = 2112;
        uint64_t v43 = v25;
        _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v29 = a1[7];
      __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", a1[5], @"Item is not a document");
      (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v11);
    }
  }
  else
  {
    id v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = a1[4];
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      __int16 v39 = 0;
      __int16 v40 = 2112;
      id v41 = v5;
      __int16 v42 = 2112;
      uint64_t v43 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)cloneLatestContentRevisionForItemIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__cloneLatestContentRevisionForItemIdentifier_reply___block_invoke;
  v10[3] = &unk_265083510;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(BRCXPCRegularIPCsClient *)self _refreshLatestRevisionAndSharingStateForItemIdentifier:v8 reply:v10];
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__cloneLatestContentRevisionForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
    id v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __92__BRCXPCRegularIPCsClient_FPFSAdditions__cloneLatestContentRevisionForItemIdentifier_reply___block_invoke_153;
    v10[3] = &unk_2650831A0;
    void v10[4] = v8;
    id v11 = *(id *)(a1 + 48);
    id v9 = (id)[v8 startDownloadFileObject:v7 options:0 etagIfLoser:0 reply:v10];
  }
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__cloneLatestContentRevisionForItemIdentifier_reply___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v19 = 138413314;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v19, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:@"item"];
    id v11 = [v10 asFileProviderItem];

    id v12 = [v5 objectForKeyedSubscript:@"url"];
    uint64_t v13 = brc_bread_crumbs();
    __int16 v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      __int16 v16 = [v11 itemVersion];
      int v19 = 138413314;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = 0;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v19, 0x34u);
    }
    uint64_t v17 = *(void *)(a1 + 40);
    __int16 v18 = [v11 itemVersion];
    (*(void (**)(uint64_t, void *, void *, void))(v17 + 16))(v17, v12, v18, 0);
  }
}

- (void)refreshSharingStateForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) refreshSharingStateForItemIdentifier:reply:]", 1436, v26);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2080;
    id v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) refreshSharingStateForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v13 = v7;
  id v25 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v24);

  if (v14)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) refreshSharingStateForItemIdentifier:reply:]", 1438, v23);
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v6 UTF8String];
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 2080;
      id v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) refreshSharingStateForItemIdentifier:reply:]";
      __int16 v35 = 2080;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      __int16 v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Refreshing sharing state for %s%@", buf, 0x3Eu);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_154;
    uint64_t v21[3] = &unk_265083538;
    id v22 = v13;
    [(BRCXPCRegularIPCsClient *)self _fetchLatestContentRevisionAndSharingStateForItemIdentifier:v6 reply:v21];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_154(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a4, "brc_wrappedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

- (void)launchItemCountMismatchChecksForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) launchItemCountMismatchChecksForItemIdentifier:reply:]", 1457, v26);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2080;
    id v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) launchItemCountMismatchChecksForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __95__BRCXPCRegularIPCsClient_FPFSAdditions__launchItemCountMismatchChecksForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v13 = v7;
  id v25 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v24);

  if (v14)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) launchItemCountMismatchChecksForItemIdentifier:reply:]", 1466, v23);
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      id v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 2080;
      id v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) launchItemCountMismatchChecksForItemIdentifier:reply:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      __int16 v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __95__BRCXPCRegularIPCsClient_FPFSAdditions__launchItemCountMismatchChecksForItemIdentifier_reply___block_invoke_156;
    v20[3] = &unk_2650833D0;
    v20[4] = self;
    id v22 = v13;
    id v21 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v21 dbAccessKind:0 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __95__BRCXPCRegularIPCsClient_FPFSAdditions__launchItemCountMismatchChecksForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__BRCXPCRegularIPCsClient_FPFSAdditions__launchItemCountMismatchChecksForItemIdentifier_reply___block_invoke_156(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      uint64_t v10 = v8;
      __int16 v11 = 1024;
      int v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v9, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _launchItemCountMismatchChecksForLocalItem:a2 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

- (void)copyShareIDForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) copyShareIDForItemIdentifier:reply:]", 1474, v28);
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v28[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v10;
    __int16 v31 = 2112;
    id v32 = self;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2080;
    id v36 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) copyShareIDForItemIdentifier:reply:]";
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingPrivateInterfaceEntitled];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __77__BRCXPCRegularIPCsClient_FPFSAdditions__copyShareIDForItemIdentifier_reply___block_invoke;
  uint64_t v26[3] = &unk_265080B38;
  void v26[4] = self;
  id v15 = v7;
  id v27 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingPrivateInterfaceEntitled", v26);

  if (v16)
  {
    memset(v25, 0, sizeof(v25));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) copyShareIDForItemIdentifier:reply:]", 1489, v25);
    uint64_t v17 = brc_bread_crumbs();
    qos_class_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = v25[0];
      qos_class_t v20 = qos_class_self();
      id v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      id v32 = self;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2080;
      id v36 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) copyShareIDForItemIdentifier:reply:]";
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      __int16 v40 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__BRCXPCRegularIPCsClient_FPFSAdditions__copyShareIDForItemIdentifier_reply___block_invoke_158;
    uint64_t v22[3] = &unk_2650833D0;
    void v22[4] = self;
    id v24 = v15;
    id v23 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v23 dbAccessKind:1 synchronouslyIfPossible:0 handler:v22];

    __brc_leave_section(v25);
  }
  __brc_leave_section(v28);
}

void __77__BRCXPCRegularIPCsClient_FPFSAdditions__copyShareIDForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__BRCXPCRegularIPCsClient_FPFSAdditions__copyShareIDForItemIdentifier_reply___block_invoke_158(void *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[4];
      int v34 = 138413058;
      uint64_t v35 = v9;
      __int16 v36 = 2112;
      __int16 v37 = 0;
      __int16 v38 = 2112;
      id v39 = v6;
      __int16 v40 = 2112;
      uint64_t v41 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v34, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_16;
  }
  if (!v5)
  {
    qos_class_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = a1[4];
      id v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", a1[5], 2);
      int v34 = 138413058;
      uint64_t v35 = v20;
      __int16 v36 = 2112;
      __int16 v37 = 0;
      __int16 v38 = 2112;
      id v39 = v21;
      __int16 v40 = 2112;
      uint64_t v41 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v34, 0x2Au);
    }
    char v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = a1[5];
    uint64_t v16 = a1[6];
    uint64_t v17 = 2;
    goto LABEL_14;
  }
  if (![v5 isDocument] || objc_msgSend(v5, "isFinderBookmark"))
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = a1[4];
      __int16 v13 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", a1[5], 21);
      int v34 = 138413058;
      uint64_t v35 = v12;
      __int16 v36 = 2112;
      __int16 v37 = 0;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 2112;
      uint64_t v41 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v34, 0x2Au);
    }
    char v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = a1[5];
    uint64_t v16 = a1[6];
    uint64_t v17 = 21;
LABEL_14:
    uint64_t v22 = objc_msgSend(v14, "brc_errorNoDocument:underlyingPOSIXError:", v15, v17);
LABEL_15:
    id v23 = (void *)v22;
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 16))(v16, 0, v22);

    goto LABEL_16;
  }
  if (([v5 isKnownByServer] & 1) == 0)
  {
    uint64_t v30 = brc_bread_crumbs();
    __int16 v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = a1[4];
      __int16 v33 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", a1[5]);
      int v34 = 138413058;
      uint64_t v35 = v32;
      __int16 v36 = 2112;
      __int16 v37 = 0;
      __int16 v38 = 2112;
      id v39 = v33;
      __int16 v40 = 2112;
      uint64_t v41 = v30;
      _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v34, 0x2Au);
    }
    uint64_t v16 = a1[6];
    uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", a1[5]);
    goto LABEL_15;
  }
  id v24 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v25 = [v5 asShareableItem];
  id v26 = (void *)[v24 initShareIDWithShareableItem:v25];

  id v27 = brc_bread_crumbs();
  uint64_t v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = a1[4];
    int v34 = 138413058;
    uint64_t v35 = v29;
    __int16 v36 = 2112;
    __int16 v37 = v26;
    __int16 v38 = 2112;
    id v39 = 0;
    __int16 v40 = 2112;
    uint64_t v41 = v27;
    _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v34, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
LABEL_16:
}

- (void)checkIfItemIsShareableWithItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) checkIfItemIsShareableWithItemIdentifier:reply:]", 1498, v25);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v25[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    __int16 v32 = 2080;
    __int16 v33 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) checkIfItemIsShareableWithItemIdentifier:reply:]";
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__BRCXPCRegularIPCsClient_FPFSAdditions__checkIfItemIsShareableWithItemIdentifier_reply___block_invoke;
  uint64_t v23[3] = &unk_265080B38;
  v23[4] = self;
  id v13 = v7;
  id v24 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v23);

  if (v14)
  {
    memset(v22, 0, sizeof(v22));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) checkIfItemIsShareableWithItemIdentifier:reply:]", 1505, v22);
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v22[0];
      qos_class_t v18 = qos_class_self();
      uint64_t v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = self;
      __int16 v30 = 2112;
      __int16 v31 = v19;
      __int16 v32 = 2080;
      __int16 v33 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) checkIfItemIsShareableWithItemIdentifier:reply:]";
      __int16 v34 = 2112;
      id v35 = v6;
      __int16 v36 = 2112;
      __int16 v37 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __89__BRCXPCRegularIPCsClient_FPFSAdditions__checkIfItemIsShareableWithItemIdentifier_reply___block_invoke_159;
    v20[3] = &unk_265083308;
    v20[4] = self;
    id v21 = v13;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v6 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v22);
  }
  __brc_leave_section(v25);
}

void __89__BRCXPCRegularIPCsClient_FPFSAdditions__checkIfItemIsShareableWithItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89__BRCXPCRegularIPCsClient_FPFSAdditions__checkIfItemIsShareableWithItemIdentifier_reply___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v9;
      __int16 v17 = 1024;
      int v18 = 0;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v15, 0x26u);
    }

    int v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v13;
      __int16 v17 = 1024;
      int v18 = [v5 isShareableItem];
      __int16 v19 = 2112;
      id v20 = 0;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v15, 0x26u);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    [v5 isShareableItem];
    int v10 = *(void (**)(void))(v14 + 16);
  }
  v10();
}

- (void)getCreatorNameComponentsForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getCreatorNameComponentsForItemIdentifier:reply:]", 1512, v26);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    __int16 v30 = self;
    __int16 v31 = 2112;
    __int16 v32 = v12;
    __int16 v33 = 2080;
    __int16 v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getCreatorNameComponentsForItemIdentifier:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __90__BRCXPCRegularIPCsClient_FPFSAdditions__getCreatorNameComponentsForItemIdentifier_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v13 = v7;
  id v25 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v24);

  if (v14)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getCreatorNameComponentsForItemIdentifier:reply:]", 1528, v23);
    int v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v23[0];
      qos_class_t v18 = qos_class_self();
      __int16 v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      __int16 v33 = 2080;
      __int16 v34 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getCreatorNameComponentsForItemIdentifier:reply:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __90__BRCXPCRegularIPCsClient_FPFSAdditions__getCreatorNameComponentsForItemIdentifier_reply___block_invoke_160;
    v20[3] = &unk_2650833D0;
    v20[4] = self;
    id v22 = v13;
    id v21 = v6;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v21 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v26);
}

void __90__BRCXPCRegularIPCsClient_FPFSAdditions__getCreatorNameComponentsForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_FPFSAdditions__getCreatorNameComponentsForItemIdentifier_reply___block_invoke_160(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[4];
      int v24 = 138413058;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      __int16 v31 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
    }
LABEL_4:

    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_5;
  }
  if (v5)
  {
    if ([v5 isZoneRoot])
    {
      int v7 = brc_bread_crumbs();
      uint64_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = a1[4];
        int v24 = 138413058;
        uint64_t v25 = v10;
        __int16 v26 = 2112;
        uint64_t v27 = 0;
        __int16 v28 = 2112;
        id v29 = 0;
        __int16 v30 = 2112;
        __int16 v31 = v7;
        _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
      }
      goto LABEL_4;
    }
    uint64_t v17 = [v5 st];
    qos_class_t v18 = [v17 creatorRowID];
    __int16 v19 = [v5 db];
    id v20 = +[BRCAccountSessionFPFS nameComponentsForKey:v18 db:v19];

    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = a1[4];
      int v24 = 138413058;
      uint64_t v25 = v23;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      id v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = a1[4];
      int v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", a1[5]);
      int v24 = 138413058;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      __int16 v31 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v24, 0x2Au);
    }
    uint64_t v15 = a1[6];
    uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", a1[5]);
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
  }
LABEL_5:
}

- (void)validateConnectionDomainWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5 reply:(id)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v10 = (BRCXPCRegularIPCsClient *)a3;
  __int16 v11 = (BRCXPCRegularIPCsClient *)a4;
  id v12 = a5;
  id v13 = a6;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __116__BRCXPCRegularIPCsClient_FPFSAdditions__validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply___block_invoke;
  v68[3] = &unk_265080B38;
  v68[4] = self;
  id v14 = v13;
  id v69 = v14;
  int v15 = _brc_ipc_check_entitlement(self, @"com.apple.clouddocs.internal.fpfs-extension", v68);

  if (v15)
  {
    uint64_t v16 = +[BRCAccountsManager sharedManager];
    uint64_t v17 = [v16 accountsLoadingBarrier];
    [v17 waitForBarrier];

    qos_class_t v18 = +[BRCAccountsManager sharedManager];
    __int16 v19 = [v18 accountHandlerForCurrentPersona];

    id v20 = [v19 waitForSessionDBLoadingBarrier];
    id v21 = v20;
    if (v20
      && ([v20 databaseID], id v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
    {
      uint64_t v23 = [v21 domainID];
      __int16 v64 = [v21 databaseID];
      unint64_t v63 = v23;
      if (([(BRCXPCRegularIPCsClient *)v10 isEqualToString:v23] & 1) == 0)
      {
        int v24 = brc_bread_crumbs();
        uint64_t v25 = brc_default_log();
        if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v71 = v10;
          __int16 v72 = 2112;
          unint64_t v73 = v23;
          __int16 v74 = 2112;
          id v75 = v24;
          _os_log_error_impl(&dword_23FA42000, v25, (os_log_type_t)0x90u, "[ERROR] DomainID %@ doesn't match session domainID %@%@", buf, 0x20u);
        }

        [(BRCXPCClient *)self invalidate];
        __int16 v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        uint64_t v29 = *MEMORY[0x263F05370];
        if (v28)
        {
          [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1000 userInfo:0];
          id v65 = v21;
          __int16 v30 = v11;
          id v31 = v12;
          uint64_t v32 = v10;
          __int16 v34 = v33 = v19;
          *(_DWORD *)buf = 138412802;
          id v71 = self;
          __int16 v72 = 2112;
          unint64_t v73 = v34;
          __int16 v74 = 2112;
          id v75 = v26;
          _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);

          __int16 v19 = v33;
          uint64_t v10 = v32;
          id v12 = v31;
          __int16 v11 = v30;
          id v21 = v65;
        }

        __int16 v35 = [MEMORY[0x263F087E8] errorWithDomain:v29 code:-1000 userInfo:0];
        (*((void (**)(id, void *))v14 + 2))(v14, v35);

        uint64_t v23 = v63;
      }
      if ([(BRCXPCRegularIPCsClient *)v11 isEqualToString:v64])
      {
        id v36 = brc_bread_crumbs();
        __int16 v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[BRCXPCRegularIPCsClient(FPFSAdditions) validateConnectionDomainWithDomainIdentifier:databaseID:backChannel:reply:]();
        }

        [v21 setExtensionBackChannel:v12];
        uint64_t v38 = brc_bread_crumbs();
        uint64_t v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v71 = self;
          __int16 v72 = 2112;
          unint64_t v73 = 0;
          __int16 v74 = 2112;
          id v75 = v38;
          _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }

        (*((void (**)(id, void))v14 + 2))(v14, 0);
      }
      else
      {
        int v67 = v19;
        uint64_t v49 = brc_bread_crumbs();
        __int16 v50 = brc_default_log();
        if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v71 = v11;
          __int16 v72 = 2112;
          unint64_t v73 = v64;
          __int16 v74 = 2112;
          id v75 = v49;
          _os_log_error_impl(&dword_23FA42000, v50, (os_log_type_t)0x90u, "[ERROR] Database ID %@ doesn't match loaded database ID %@%@", buf, 0x20u);
        }

        if (!v11 && [v21 isOpen])
        {
          brc_bread_crumbs();
          uint64_t v51 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          __int16 v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v71 = v51;
            _os_log_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] Recovering the domain decoration%@", buf, 0xCu);
          }

          [v21 fixFileProviderDomainDecorations];
          id v53 = +[BRCUserDefaults defaultsForMangledID:0];
          int v54 = [v53 reimportRootContainerWhenDomainDecorationIsInvalid];

          if (v54)
          {
            brc_bread_crumbs();
            uint64_t v55 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
            uint64_t v56 = brc_default_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v71 = v55;
              _os_log_impl(&dword_23FA42000, v56, OS_LOG_TYPE_DEFAULT, "[WARNING] Reimporting the root container to make sure the domain is fully synced with our DB%@", buf, 0xCu);
            }

            +[BRCImportUtil reimportItemsBelowItemWithIdentifier:*MEMORY[0x263F053F0] completionHandler:&__block_literal_global_165];
          }
        }
        [v12 invalidateExtension];
        __int16 v57 = brc_bread_crumbs();
        id v58 = brc_default_log();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
        uint64_t v60 = *MEMORY[0x263F05370];
        if (v59)
        {
          uint64_t v61 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1000 userInfo:0];
          *(_DWORD *)buf = 138412802;
          id v71 = self;
          __int16 v72 = 2112;
          unint64_t v73 = v61;
          __int16 v74 = 2112;
          id v75 = v57;
          _os_log_impl(&dword_23FA42000, v58, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        __int16 v62 = [MEMORY[0x263F087E8] errorWithDomain:v60 code:-1000 userInfo:0];
        (*((void (**)(id, void *))v14 + 2))(v14, v62);

        __int16 v19 = v67;
        uint64_t v23 = v63;
      }
    }
    else
    {
      __int16 v66 = v21;
      __int16 v40 = v11;
      id v41 = v12;
      uint64_t v42 = v10;
      uint64_t v43 = v19;
      [(BRCXPCClient *)self invalidate];
      uint64_t v44 = brc_bread_crumbs();
      __int16 v45 = brc_default_log();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
      uint64_t v47 = *MEMORY[0x263F05370];
      if (v46)
      {
        __int16 v48 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1000 userInfo:0];
        *(_DWORD *)buf = 138412802;
        id v71 = self;
        __int16 v72 = 2112;
        unint64_t v73 = v48;
        __int16 v74 = 2112;
        id v75 = v44;
        _os_log_impl(&dword_23FA42000, v45, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:v47 code:-1000 userInfo:0];
      (*((void (**)(id, void *))v14 + 2))(v14, v23);
      __int16 v19 = v43;
      uint64_t v10 = v42;
      id v12 = v41;
      __int16 v11 = v40;
      id v21 = v66;
    }
  }
}

void __116__BRCXPCRegularIPCsClient_FPFSAdditions__validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __116__BRCXPCRegularIPCsClient_FPFSAdditions__validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply___block_invoke_163(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __116__BRCXPCRegularIPCsClient_FPFSAdditions__validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply___block_invoke_163_cold_1();
    }
  }
}

- (void)startOperation:(id)a3 toWaitForFPFSMigrationWithReply:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) startOperation:toWaitForFPFSMigrationWithReply:]", 1594, v20);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v20[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    int v24 = self;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    __int16 v27 = 2080;
    BOOL v28 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) startOperation:toWaitForFPFSMigrationWithReply:]";
    __int16 v29 = 2112;
    __int16 v30 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke;
  uint64_t v18[3] = &unk_265080B38;
  void v18[4] = self;
  id v13 = v7;
  id v19 = v13;
  int v14 = _brc_ipc_check_applibraries_access(self, 1, v18);

  if (v14)
  {
    int v15 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke_166;
    block[3] = &unk_26507F850;
    void block[4] = self;
    id v17 = v13;
    dispatch_async_and_wait(v15, block);
  }
  __brc_leave_section(v20);
}

void __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke_166(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 24) fpfsMigrationState])
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke_2;
    v8[3] = &unk_265083560;
    id v3 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v4 = (id)[v2 addObserverForName:@"kBRCFPFSMigrationStateKey" object:0 queue:0 usingBlock:v8];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = 0;
      __int16 v14 = 2112;
      int v15 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __89__BRCXPCRegularIPCsClient_FPFSAdditions__startOperation_toWaitForFPFSMigrationWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [a2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"kBRCFPFSMigrationStateKey"];

  if (![v4 intValue])
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412802;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      uint64_t v11 = 0;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getClientSaltingVerificationKeysAtItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getClientSaltingVerificationKeysAtItemIdentifier:reply:]", 1614, v25);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v25[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    __int16 v29 = self;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2080;
    __int16 v33 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getClientSaltingVerificationKeysAtItemIdentifier:reply:]";
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __97__BRCXPCRegularIPCsClient_FPFSAdditions__getClientSaltingVerificationKeysAtItemIdentifier_reply___block_invoke;
  uint64_t v23[3] = &unk_265080B38;
  v23[4] = self;
  id v13 = v7;
  id v24 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v23);

  if (v14)
  {
    memset(v22, 0, sizeof(v22));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getClientSaltingVerificationKeysAtItemIdentifier:reply:]", 1628, v22);
    int v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v22[0];
      qos_class_t v18 = qos_class_self();
      id v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      __int16 v29 = self;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      __int16 v32 = 2080;
      __int16 v33 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getClientSaltingVerificationKeysAtItemIdentifier:reply:]";
      __int16 v34 = 2112;
      id v35 = v6;
      __int16 v36 = 2112;
      __int16 v37 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __97__BRCXPCRegularIPCsClient_FPFSAdditions__getClientSaltingVerificationKeysAtItemIdentifier_reply___block_invoke_171;
    uint64_t v20[3] = &unk_265083588;
    v20[4] = self;
    id v21 = v13;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierServerItem:v6 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

    __brc_leave_section(v22);
  }
  __brc_leave_section(v25);
}

void __97__BRCXPCRegularIPCsClient_FPFSAdditions__getClientSaltingVerificationKeysAtItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 1024;
    int v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v7, 0x44u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__BRCXPCRegularIPCsClient_FPFSAdditions__getClientSaltingVerificationKeysAtItemIdentifier_reply___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) session];
    uint64_t v8 = [v7 readOnlyDB];
    __int16 v9 = [v5 itemID];
    uint64_t v10 = [v5 clientZone];
    __int16 v11 = [v10 dbRowID];
    uint64_t v12 = (void *)[v8 fetch:@"SELECT basehash_salt_validation_key, validation_key(child_basehash_salt), validation_key(content_boundary_key), salting_state FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v9, v11];

    if ([v12 next])
    {
      __int16 v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = [v12 dataAtIndex:0];
        __int16 v17 = [v12 dataAtIndex:1];
        id v18 = [v12 dataAtIndex:2];
        *(_DWORD *)buf = 138413826;
        uint64_t v32 = v15;
        __int16 v33 = 2112;
        __int16 v34 = v16;
        __int16 v35 = 2112;
        __int16 v36 = v17;
        __int16 v37 = 2112;
        uint64_t v38 = v18;
        __int16 v39 = 1024;
        int v40 = [v12 intAtIndex:3];
        __int16 v41 = 2112;
        id v42 = 0;
        __int16 v43 = 2112;
        uint64_t v44 = v13;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", buf, 0x44u);
      }
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = [v12 dataAtIndex:0];
      uint64_t v21 = [v12 dataAtIndex:1];
      uint64_t v22 = [v12 dataAtIndex:2];
      (*(void (**)(uint64_t, void *, void *, void *, uint64_t, void))(v19 + 16))(v19, v20, v21, v22, [v12 intAtIndex:3], 0);
    }
    else
    {
      __int16 v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        __int16 v29 = [v12 error];
        *(_DWORD *)buf = 138413826;
        uint64_t v32 = v28;
        __int16 v33 = 2112;
        __int16 v34 = 0;
        __int16 v35 = 2112;
        __int16 v36 = 0;
        __int16 v37 = 2112;
        uint64_t v38 = 0;
        __int16 v39 = 1024;
        int v40 = -1;
        __int16 v41 = 2112;
        id v42 = v29;
        __int16 v43 = 2112;
        uint64_t v44 = v26;
        _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", buf, 0x44u);
      }
      uint64_t v30 = *(void *)(a1 + 40);
      id v20 = [v12 error];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v30 + 16))(v30, 0, 0, 0, 0xFFFFFFFFLL, v20);
    }
  }
  else
  {
    __int16 v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413826;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      __int16 v34 = 0;
      __int16 v35 = 2112;
      __int16 v36 = 0;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      __int16 v39 = 1024;
      int v40 = -1;
      __int16 v41 = 2112;
      id v42 = v6;
      __int16 v43 = 2112;
      uint64_t v44 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", buf, 0x44u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getServerSaltingKeysAtItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerSaltingKeysAtItemIdentifier:reply:]", 1636, v31);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v31[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v33 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v34 = 2112;
    __int16 v35 = self;
    __int16 v36 = 2112;
    __int16 v37 = v12;
    __int16 v38 = 2080;
    __int16 v39 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerSaltingKeysAtItemIdentifier:reply:]";
    __int16 v40 = 2112;
    *(void *)__int16 v41 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke;
  uint64_t v29[3] = &unk_265080B38;
  void v29[4] = self;
  id v13 = v7;
  id v30 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v29);

  if (v14)
  {
    uint64_t v15 = +[BRCUserDefaults defaultsForMangledID:0];
    char v16 = [v15 supportsEnhancedDrivePrivacy];

    if (v16)
    {
      memset(v28, 0, sizeof(v28));
      __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerSaltingKeysAtItemIdentifier:reply:]", 1681, v28);
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v28[0];
        qos_class_t v20 = qos_class_self();
        uint64_t v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
        *(_DWORD *)buf = 134219266;
        __int16 v33 = (BRCXPCRegularIPCsClient *)v19;
        __int16 v34 = 2112;
        __int16 v35 = self;
        __int16 v36 = 2112;
        __int16 v37 = v21;
        __int16 v38 = 2080;
        __int16 v39 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerSaltingKeysAtItemIdentifier:reply:]";
        __int16 v40 = 2112;
        *(void *)__int16 v41 = v6;
        *(_WORD *)&v41[8] = 2112;
        *(void *)&v41[10] = v17;
        _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
      }
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke_179;
      uint64_t v26[3] = &unk_265083308;
      void v26[4] = self;
      id v27 = v13;
      [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v6 dbAccessKind:1 synchronouslyIfPossible:0 handler:v26];

      __brc_leave_section(v28);
    }
    else
    {
      uint64_t v22 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
        *(_DWORD *)buf = 138413826;
        __int16 v33 = self;
        __int16 v34 = 2112;
        __int16 v35 = 0;
        __int16 v36 = 2112;
        __int16 v37 = 0;
        __int16 v38 = 2112;
        __int16 v39 = 0;
        __int16 v40 = 1024;
        *(_DWORD *)__int16 v41 = 0;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v24;
        *(_WORD *)&v41[14] = 2112;
        *(void *)&v41[16] = v22;
        _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", buf, 0x44u);
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
      (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v25);
    }
  }
  __brc_leave_section(v31);
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 1024;
    int v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    qos_class_t v20 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v7, 0x44u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    __int16 v19 = brc_bread_crumbs();
    qos_class_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138413826;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      uint64_t v35 = 0;
      __int16 v36 = 1024;
      int v37 = 0;
      __int16 v38 = 2112;
      __int16 v39 = v22;
      __int16 v40 = 2112;
      __int16 v41 = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", buf, 0x44u);
    }
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void, void, void *))(v23 + 16))(v23, 0, 0, 0, 0, v8);
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    __int16 v9 = [v5 structureRecordID];
    [v8 addObject:v9];
    if ([v5 isDocument])
    {
      uint64_t v10 = [v5 asDocument];
      __int16 v11 = [v10 documentRecordID];
      [v8 addObject:v11];
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFD6D8]) initWithRecordIDs:v8];
    v27[0] = @"boundaryKey";
    v27[1] = @"childBasehashSalt";
    v27[2] = @"saltingState";
    uint64_t v27[3] = @"basehash";
    __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    [v12 setDesiredKeys:v13];

    uint64_t v14 = objc_msgSend(MEMORY[0x263EFD780], "br_testTrigger");
    [v12 setGroup:v14];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke_185;
    v24[3] = &unk_2650835B0;
    __int16 v15 = *(void **)(a1 + 40);
    void v24[4] = *(void *)(a1 + 32);
    id v26 = v15;
    id v25 = v5;
    [v12 setFetchRecordsCompletionBlock:v24];
    int v16 = [*(id *)(a1 + 32) session];
    __int16 v17 = [v16 syncContextProvider];
    id v18 = [v17 defaultSyncContext];
    [v18 addOperation:v12];
  }
}

void __85__BRCXPCRegularIPCsClient_FPFSAdditions__getServerSaltingKeysAtItemIdentifier_reply___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
      int v26 = 138413826;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 1024;
      int v35 = 0;
      __int16 v36 = 2112;
      int v37 = v10;
      __int16 v38 = 2112;
      __int16 v39 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v26, 0x44u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void, void, void *))(v11 + 16))(v11, 0, 0, 0, 0, v12);
  }
  else
  {
    if ([*(id *)(a1 + 40) isDocument])
    {
      __int16 v13 = [*(id *)(a1 + 40) asDocument];
      uint64_t v14 = [v13 documentRecordID];
      __int16 v15 = [v5 objectForKeyedSubscript:v14];

      int v16 = [v15 encryptedValues];
      __int16 v17 = [v16 objectForKeyedSubscript:@"boundaryKey"];
    }
    else
    {
      __int16 v17 = 0;
    }
    id v18 = [*(id *)(a1 + 40) structureRecordID];
    __int16 v19 = [v5 objectForKeyedSubscript:v18];

    qos_class_t v20 = [v19 encryptedValues];
    uint64_t v12 = [v20 objectForKeyedSubscript:@"childBasehashSalt"];

    uint64_t v21 = [v19 objectForKeyedSubscript:@"saltingState"];

    uint64_t v22 = [v19 objectForKeyedSubscript:@"basehash"];
    uint64_t v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      int v26 = 138413826;
      uint64_t v27 = v25;
      __int16 v28 = 2112;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      __int16 v34 = 1024;
      int v35 = (int)v21;
      __int16 v36 = 2112;
      int v37 = 0;
      __int16 v38 = 2112;
      __int16 v39 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %d, %@)%@", (uint8_t *)&v26, 0x44u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getServerContentSignatureAtItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerContentSignatureAtItemIdentifier:reply:]", 1689, v32);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v32[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v35 = 2112;
    __int16 v36 = self;
    __int16 v37 = 2112;
    __int16 v38 = v12;
    __int16 v39 = 2080;
    uint64_t v40 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerContentSignatureAtItemIdentifier:reply:]";
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke;
  uint64_t v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v13 = v7;
  id v31 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v30);

  if (v14)
  {
    __int16 v15 = +[BRCUserDefaults defaultsForMangledID:0];
    char v16 = [v15 supportsEnhancedDrivePrivacy];

    if (v16)
    {
      memset(v29, 0, sizeof(v29));
      __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerContentSignatureAtItemIdentifier:reply:]", 1718, v29);
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v29[0];
        qos_class_t v20 = qos_class_self();
        uint64_t v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
        *(_DWORD *)buf = 134219266;
        __int16 v34 = (BRCXPCRegularIPCsClient *)v19;
        __int16 v35 = 2112;
        __int16 v36 = self;
        __int16 v37 = 2112;
        __int16 v38 = v21;
        __int16 v39 = 2080;
        uint64_t v40 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) getServerContentSignatureAtItemIdentifier:reply:]";
        __int16 v41 = 2112;
        id v42 = v6;
        __int16 v43 = 2112;
        uint64_t v44 = v17;
        _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
      }
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke_186;
      uint64_t v26[3] = &unk_2650833D0;
      void v26[4] = self;
      id v28 = v13;
      id v27 = v6;
      [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v27 dbAccessKind:1 synchronouslyIfPossible:0 handler:v26];

      __brc_leave_section(v29);
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
        *(_DWORD *)buf = 138413058;
        __int16 v34 = self;
        __int16 v35 = 2112;
        __int16 v36 = 0;
        __int16 v37 = 2112;
        __int16 v38 = v24;
        __int16 v39 = 2112;
        uint64_t v40 = v22;
        _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v25);
    }
  }
  __brc_leave_section(v32);
}

void __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    id v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v38 = v20;
      __int16 v39 = 2112;
      uint64_t v40 = 0;
      __int16 v41 = 2112;
      id v42 = v21;
      __int16 v43 = 2112;
      uint64_t v44 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v22 = *(void *)(a1 + 48);
    __int16 v9 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v9);
  }
  else if ([v5 isDocument])
  {
    uint64_t v8 = [v5 asDocument];
    __int16 v9 = [v8 documentRecordID];

    id v10 = objc_alloc(MEMORY[0x263EFD6D8]);
    __int16 v36 = v9;
    __int16 v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    id v12 = (void *)[v10 initWithRecordIDs:v11];

    v35[0] = @"fileContent";
    v35[1] = @"pkgSignature";
    __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    [v12 setDesiredKeys:v13];

    int v14 = objc_msgSend(MEMORY[0x263EFD780], "br_testTrigger");
    [v12 setGroup:v14];

    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    __int16 v30 = __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke_187;
    id v31 = &unk_2650835B0;
    uint64_t v32 = *(void *)(a1 + 32);
    id v34 = *(id *)(a1 + 48);
    id v33 = v5;
    [v12 setFetchRecordsCompletionBlock:&v28];
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "session", v28, v29, v30, v31, v32);
    char v16 = [v15 syncContextProvider];
    __int16 v17 = [v16 defaultSyncContext];
    [v17 addOperation:v12];
  }
  else
  {
    uint64_t v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      int v26 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", *(void *)(a1 + 40), @"Item is not a document");
      *(_DWORD *)buf = 138413058;
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      uint64_t v40 = 0;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      uint64_t v44 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v27 = *(void *)(a1 + 48);
    __int16 v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", *(void *)(a1 + 40), @"Item is not a document");
    (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v9);
  }
}

void __90__BRCXPCRegularIPCsClient_FPFSAdditions__getServerContentSignatureAtItemIdentifier_reply___block_invoke_187(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "brc_wrappedError");
      int v23 = 138413058;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      int v26 = 0;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      __int16 v30 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v23, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
  else
  {
    __int16 v13 = [*(id *)(a1 + 40) asDocument];
    int v14 = [v13 documentRecordID];
    id v12 = [v5 objectForKeyedSubscript:v14];

    uint64_t v15 = [v12 objectForKeyedSubscript:@"fileContent"];
    char v16 = [v12 objectForKeyedSubscript:@"pkgSignature"];
    __int16 v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      if (v15)
      {
        uint64_t v20 = [v15 signature];
      }
      else
      {
        uint64_t v20 = v16;
      }
      int v23 = 138413058;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      int v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v23, 0x2Au);
      if (v15) {
    }
      }
    uint64_t v21 = *(void *)(a1 + 48);
    if (v15)
    {
      uint64_t v22 = [v15 signature];
      (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v16, 0);
    }
  }
}

- (void)waitForStabilizationWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) waitForStabilizationWithReply:]", 1725, v17);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v17[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    int v23 = v9;
    __int16 v24 = 2080;
    __int16 v25 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) waitForStabilizationWithReply:]";
    __int16 v26 = 2112;
    __int16 v27 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__BRCXPCRegularIPCsClient_FPFSAdditions__waitForStabilizationWithReply___block_invoke;
  v15[3] = &unk_265080B38;
  void v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  int v11 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v15);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__BRCXPCRegularIPCsClient_FPFSAdditions__waitForStabilizationWithReply___block_invoke_188;
    v13[3] = &unk_265080B38;
    v13[4] = self;
    id v14 = v10;
    [v12 waitForUploadsToCompleteInSyncBubbleWithReply:v13];
  }
  __brc_leave_section(v17);
}

void __72__BRCXPCRegularIPCsClient_FPFSAdditions__waitForStabilizationWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__BRCXPCRegularIPCsClient_FPFSAdditions__waitForStabilizationWithReply___block_invoke_188(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)uploadItemIdentifier:(id)a3 withContents:(id)a4 baseVersion:(id)a5 reply:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) uploadItemIdentifier:withContents:baseVersion:reply:]", 1739, v47);
  id v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = v12;
    id v17 = v11;
    uint64_t v18 = v47[0];
    qos_class_t v19 = qos_class_self();
    __int16 v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v49 = v18;
    __int16 v50 = 2112;
    uint64_t v51 = self;
    __int16 v52 = 2112;
    id v53 = v20;
    __int16 v54 = 2080;
    uint64_t v55 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) uploadItemIdentifier:withContents:baseVersion:reply:]";
    __int16 v56 = 2112;
    id v57 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    id v11 = v17;
    id v12 = v16;
  }

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke;
  uint64_t v45[3] = &unk_265080B38;
  void v45[4] = self;
  id v21 = v13;
  id v46 = v21;
  int v22 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.clouddocs.internal.fpfs-extension", v45);

  if (v22)
  {
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__25;
    __int16 v43 = __Block_byref_object_dispose__25;
    id v44 = 0;
    memset(v38, 0, sizeof(v38));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(FPFSAdditions) uploadItemIdentifier:withContents:baseVersion:reply:]", 1761, v38);
    int v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = v12;
      id v26 = v11;
      uint64_t v27 = v38[0];
      qos_class_t v28 = qos_class_self();
      __int16 v29 = BRCPrettyPrintEnumWithContext(v28, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v49 = v27;
      __int16 v50 = 2112;
      uint64_t v51 = self;
      __int16 v52 = 2112;
      id v53 = v29;
      __int16 v54 = 2080;
      uint64_t v55 = "-[BRCXPCRegularIPCsClient(FPFSAdditions) uploadItemIdentifier:withContents:baseVersion:reply:]";
      __int16 v56 = 2112;
      id v57 = v10;
      __int16 v58 = 2112;
      BOOL v59 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v11 = v26;
      id v12 = v25;
    }

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke_189;
    uint64_t v32[3] = &unk_2650835D8;
    v32[4] = self;
    id v36 = v21;
    id v33 = v10;
    __int16 v37 = &v39;
    id v34 = v11;
    id v35 = v12;
    [(BRCXPCRegularIPCsClient *)self accessItemIdentifierLocalItem:v33 dbAccessKind:1 synchronouslyIfPossible:0 handler:v32];

    __brc_leave_section(v38);
    id v30 = (id)v40[5];
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v30 = 0;
  }
  __brc_leave_section(v47);

  return v30;
}

void __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      if ([v5 isDocument])
      {
        uint64_t v10 = [*(id *)(a1 + 32) session];
        __int16 v11 = [v10 fsUploader];
        id v12 = [v5 asDocument];
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke_190;
        uint64_t v29[3] = &unk_2650834E8;
        void v29[4] = *(void *)(a1 + 32);
        id v30 = *(id *)(a1 + 64);
        uint64_t v15 = [v11 uploadDocument:v12 withContents:v13 baseVersion:v14 reply:v29];
        uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        goto LABEL_15;
      }
      __int16 v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", *(void *)(a1 + 40), @"Item is not a document");
        *(_DWORD *)buf = 138413058;
        uint64_t v32 = v26;
        __int16 v33 = 2112;
        uint64_t v34 = 0;
        __int16 v35 = 2112;
        id v36 = v27;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v22 = *(void *)(a1 + 64);
      uint64_t v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnexpectedItemType:description:", *(void *)(a1 + 40), @"Item is not a document");
    }
    else
    {
      uint64_t v18 = brc_bread_crumbs();
      qos_class_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
        *(_DWORD *)buf = 138413058;
        uint64_t v32 = v20;
        __int16 v33 = 2112;
        uint64_t v34 = 0;
        __int16 v35 = 2112;
        id v36 = v21;
        __int16 v37 = 2112;
        uint64_t v38 = v18;
        _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v22 = *(void *)(a1 + 64);
      uint64_t v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    }
    qos_class_t v28 = (void *)v23;
    (*(void (**)(uint64_t, void, uint64_t))(v22 + 16))(v22, 0, v23);

    goto LABEL_15;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v32 = v9;
    __int16 v33 = 2112;
    uint64_t v34 = 0;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    uint64_t v38 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_15:
}

void __94__BRCXPCRegularIPCsClient_FPFSAdditions__uploadItemIdentifier_withContents_baseVersion_reply___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v10, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presyncContainerWithID:(id)a3 reply:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient presyncContainerWithID:reply:]", 1632, v20);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v20[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    __int16 v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2080;
    qos_class_t v28 = "-[BRCXPCRegularIPCsClient presyncContainerWithID:reply:]";
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke;
  uint64_t v18[3] = &unk_265080B38;
  void v18[4] = self;
  id v13 = v7;
  id v19 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v18);

  if (v14)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v6];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke_296;
    v16[3] = &unk_265085AE8;
    v16[4] = self;
    id v17 = v13;
    [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v15 recreateDocumentsIfNeeded:0 reply:v16];
  }
  __brc_leave_section(v20);
}

void __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v3, "brc_wrappedError");
    int v10 = 138412802;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke_296(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  __int16 v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

- (void)getContainerURLForID:(id)a3 forProcess:(id *)a4 reply:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerURLForID:forProcess:reply:]", 1647, v37);
  int v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v37[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v14;
    __int16 v39 = 2080;
    uint64_t v40 = "-[BRCXPCRegularIPCsClient getContainerURLForID:forProcess:reply:]";
    __int16 v41 = 2112;
    id v42 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  void v35[2] = __65__BRCXPCRegularIPCsClient_getContainerURLForID_forProcess_reply___block_invoke;
  uint64_t v35[3] = &unk_265080B38;
  v35[4] = self;
  id v15 = v9;
  id v36 = v15;
  int v16 = _brc_ipc_check_applibrary_proxy(self, 1, v35);

  if (v16)
  {
    __int16 v17 = [BRCClientPrivilegesDescriptor alloc];
    long long v18 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&buf[16] = v18;
    uint64_t v19 = [(BRCClientPrivilegesDescriptor *)v17 initWithAuditToken:buf];
    uint64_t v20 = [(BRCClientPrivilegesDescriptor *)v19 appLibraryIDs];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      __int16 v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = (void *)MEMORY[0x263F087E8];
        qos_class_t v28 = [(BRCClientPrivilegesDescriptor *)v19 applicationIdentifier];
        __int16 v29 = objc_msgSend(v27, "brc_errorNoAppLibraryForBundle:", v28);
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = 0;
        __int16 v39 = 2112;
        uint64_t v40 = 0;
        __int16 v41 = 2112;
        id v42 = v29;
        __int16 v43 = 2112;
        id v44 = v25;
        _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
      }
      id v30 = (void *)MEMORY[0x263F087E8];
      __int16 v24 = [(BRCClientPrivilegesDescriptor *)v19 applicationIdentifier];
      uint64_t v31 = objc_msgSend(v30, "brc_errorNoAppLibraryForBundle:", v24);
      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v31);
    }
    else
    {
      if (!v8)
      {
        id v8 = [(BRCClientPrivilegesDescriptor *)v19 defaultAppLibraryID];
      }
      uint64_t v22 = [(BRCClientPrivilegesDescriptor *)v19 appLibraryIDs];
      char v23 = [v22 containsObject:v8];

      if (v23)
      {
        __int16 v24 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v8];
        [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v24 recreateDocumentsIfNeeded:0 reply:v15];
      }
      else
      {
        uint64_t v32 = brc_bread_crumbs();
        __int16 v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v8);
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&unsigned char buf[24] = 0;
          __int16 v39 = 2112;
          uint64_t v40 = 0;
          __int16 v41 = 2112;
          id v42 = v34;
          __int16 v43 = 2112;
          id v44 = v32;
          _os_log_impl(&dword_23FA42000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
        }
        __int16 v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v8);
        (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v24);
      }
    }
  }
  __brc_leave_section(v37);
}

void __65__BRCXPCRegularIPCsClient_getContainerURLForID_forProcess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v3, "brc_wrappedError");
    int v10 = 138413570;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    BOOL v21 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v10, 0x3Eu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void, void, void, void *))(v8 + 16))(v8, 0, 0, 0, v9);
}

uint64_t __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_298(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  id v7 = [*(id *)(a1 + 40) defaultClientZone];
  int v8 = [v7 activated];
  if (v5 && v8)
  {
    id v9 = *(void **)(*(void *)(a1 + 48) + 8);
    int v10 = [*(id *)(a1 + 40) db];
    uint64_t v11 = [v10 serialQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_3;
    v12[3] = &unk_2650850C8;
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    id v15 = v5;
    id v16 = v6;
    id v17 = *(id *)(a1 + 56);
    brc_task_tracker_async_with_logs(v9, v11, v12, 0);
  }
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activated])
  {
    id v2 = [*(id *)(a1 + 40) containerMetadata];
    int v3 = [v2 isDocumentScopePublic];

    id v4 = [*(id *)(a1 + 40) containerMetadata];
    int v5 = [v4 updateMetadataWithExtractorProperties:*(void *)(a1 + 48) iconPaths:*(void *)(a1 + 56) bundleID:*(void *)(a1 + 64)];

    if (v5) {
      [*(id *)(a1 + 40) scheduleContainerMetadataSyncUp];
    }
    id v6 = [*(id *)(a1 + 40) containerMetadata];
    int v7 = [v6 isDocumentScopePublic];

    if (v3 != v7)
    {
      int v8 = *(void **)(a1 + 40);
      [v8 didUpdateDocumentScopePublic];
    }
  }
}

- (void)deleteAllContentsOfContainerID:(id)a3 onClient:(BOOL)a4 onServer:(BOOL)a5 wait:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v53 = (BRCXPCRegularIPCsClient *)a3;
  id v10 = a7;
  uint64_t v11 = 2;
  if (v9) {
    uint64_t v11 = 3;
  }
  BOOL v55 = v8;
  if (v8) {
    uint64_t v11 = 4;
  }
  uint64_t v52 = v11;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]", 1753, v72);
  __int16 v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v76 = (BRCXPCRegularIPCsClient *)v72[0];
    __int16 v77 = 2112;
    id v78 = v53;
    __int16 v79 = 2112;
    __int16 v80 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx IPC-initiated reset for %@%@", buf, 0x20u);
  }

  memset(v71, 0, sizeof(v71));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]", 1757, v71);
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v71[0];
    qos_class_t v17 = qos_class_self();
    __int16 v18 = BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v76 = (BRCXPCRegularIPCsClient *)v16;
    __int16 v77 = 2112;
    id v78 = self;
    __int16 v79 = 2112;
    __int16 v80 = v18;
    __int16 v81 = 2080;
    __int16 v82 = "-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]";
    __int16 v83 = 2112;
    __int16 v84 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke;
  v69[3] = &unk_265080B38;
  v69[4] = self;
  id v48 = v10;
  id v70 = v48;
  int v19 = _brc_ipc_check_applibrary_proxy(self, 1, v69);

  if (v19)
  {
    __int16 v20 = [(BRCXPCClient *)self session];
    id v68 = 0;
    BOOL v21 = [v20 clientZonesMatchingSearchString:v53 error:&v68];
    uint64_t v47 = (BRCXPCRegularIPCsClient *)v68;

    uint64_t v22 = objc_opt_new();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v21;
    uint64_t v23 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v65;
      uint64_t v25 = *MEMORY[0x263F324E8];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v65 != v24) {
            objc_enumerationMutation(obj);
          }
          __int16 v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v27 isCloudDocsZone]
            && ([(BRCXPCRegularIPCsClient *)v53 isEqualToString:v25] & 1) == 0)
          {
            brc_bread_crumbs();
            qos_class_t v28 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
            __int16 v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v76 = v53;
              __int16 v77 = 2112;
              id v78 = v28;
              _os_log_debug_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Not deleting container %@ which is moved to clouddocs%@", buf, 0x16u);
            }
          }
          else
          {
            [v22 addObject:v27];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v23);
    }

    if ([v22 count])
    {
      id v30 = dispatch_group_create();
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v49 = v22;
      uint64_t v31 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (!v31) {
        goto LABEL_42;
      }
      uint64_t v32 = *(void *)v61;
      while (1)
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v61 != v32) {
            objc_enumerationMutation(v49);
          }
          uint64_t v34 = *(BRCXPCRegularIPCsClient **)(*((void *)&v60 + 1) + 8 * j);
          if (v55 && [*(id *)(*((void *)&v60 + 1) + 8 * j) isSharedZone])
          {
            brc_bread_crumbs();
            __int16 v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
            id v36 = brc_default_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v76 = v34;
              __int16 v77 = 2112;
              id v78 = v35;
              _os_log_debug_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] We can't delete server zone for shared zone, skipping %@%@", buf, 0x16u);
            }

            goto LABEL_38;
          }
          __int16 v37 = brc_bread_crumbs();
          uint64_t v38 = brc_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            uint64_t v43 = BRCPrettyPrintEnum();
            *(_DWORD *)buf = 136315650;
            uint64_t v76 = (BRCXPCRegularIPCsClient *)v43;
            __int16 v77 = 2112;
            id v78 = v34;
            __int16 v79 = 2112;
            __int16 v80 = v37;
            _os_log_fault_impl(&dword_23FA42000, v38, OS_LOG_TYPE_FAULT, "[CRIT] %s reset for %@%@", buf, 0x20u);
          }

          __int16 v39 = +[BRCEventsAnalytics sharedAnalytics];
          uint64_t v40 = NSString;
          __int16 v41 = [(BRCXPCClient *)self bundleID];
          id v42 = [v40 stringWithFormat:@"ipc-%@", v41];
          [v39 registerAndSendNewContainerResetWithOutcome:v42];

          if (a6)
          {
            dispatch_group_enter(v30);
            v58[0] = MEMORY[0x263EF8330];
            v58[1] = 3221225472;
            v58[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_305;
            v58[3] = &unk_26507ED70;
            BOOL v59 = v30;
            [(BRCXPCRegularIPCsClient *)v34 scheduleReset:v52 completionHandler:v58];
            __int16 v35 = (BRCXPCRegularIPCsClient *)v59;
LABEL_38:

            continue;
          }
          [(BRCXPCRegularIPCsClient *)v34 scheduleReset:v52];
        }
        uint64_t v31 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (!v31)
        {
LABEL_42:

          queue = self->super._queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_2;
          block[3] = &unk_26507F850;
          void block[4] = self;
          id v57 = v48;
          dispatch_group_notify(v30, queue, block);

          goto LABEL_46;
        }
      }
    }
    uint64_t v45 = brc_bread_crumbs();
    id v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v76 = self;
      __int16 v77 = 2112;
      id v78 = v47;
      __int16 v79 = 2112;
      __int16 v80 = v45;
      _os_log_impl(&dword_23FA42000, v46, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *))v48 + 2))(v48, v47);
LABEL_46:
  }
  __brc_leave_section(v71);
  __brc_leave_section(v72);
}

void __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_305(uint64_t a1)
{
}

uint64_t __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerInitialSyncBarrierForID:(id)a3 reply:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient registerInitialSyncBarrierForID:reply:]", 1806, v26);
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v26[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    qos_class_t v28 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v29 = 2112;
    id v30 = self;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    __int16 v33 = 2080;
    uint64_t v34 = "-[BRCXPCRegularIPCsClient registerInitialSyncBarrierForID:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__BRCXPCRegularIPCsClient_registerInitialSyncBarrierForID_reply___block_invoke;
  v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v13 = v7;
  id v25 = v13;
  int v14 = _brc_ipc_check_applibraries_access(self, 1, v24);

  if (v14)
  {
    id v23 = 0;
    if (v6)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v6];
    }
    else
    {
      uint64_t v15 = [(BRCXPCClient *)self defaultMangledID];
    }
    uint64_t v16 = (void *)v15;
    qos_class_t v17 = [(BRCXPCClient *)self _setupAppLibrary:v15 error:&v23];
    if (v17)
    {
      [(BRCXPCClient *)self addAppLibrary:v17];
      __int16 v18 = [v17 defaultClientZone];
      int v19 = [(BRCXPCClient *)self description];
      [v18 notifyClient:v19 whenFaultingIsDone:v13];
    }
    else
    {
      __int16 v20 = brc_bread_crumbs();
      BOOL v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v23, "brc_wrappedError");
        uint64_t v22 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        qos_class_t v28 = self;
        __int16 v29 = 2112;
        id v30 = v22;
        __int16 v31 = 2112;
        uint64_t v32 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v18 = objc_msgSend(v23, "brc_wrappedError");
      (*((void (**)(id, void *))v13 + 2))(v13, v18);
    }
  }
  __brc_leave_section(v26);
}

void __65__BRCXPCRegularIPCsClient_registerInitialSyncBarrierForID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_removeSandboxedAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (![(BRCXPCClient *)self isSandboxed])
  {
    int v5 = v4;
    if (![(BRCXPCClient *)self hasPrivateSharingInterfaceEntitlement])
    {
      uint64_t v6 = [MEMORY[0x263EFF9C0] setWithArray:v4];
      int v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFF810], *MEMORY[0x263EFF808], *MEMORY[0x263EFF800], 0);
      int v5 = v4;
      if ([v6 intersectsSet:v7])
      {
        [v6 minusSet:v7];
        uint64_t v8 = brc_bread_crumbs();
        __int16 v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v12 = v4;
          __int16 v13 = 2112;
          int v14 = v6;
          __int16 v15 = 2112;
          uint64_t v16 = v8;
          _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Stripping attributes request from %@ to %@%@", buf, 0x20u);
        }

        int v5 = [v6 allObjects];
      }
    }
  }

  return v5;
}

- (void)getItemUpdateSenderWithReceiver:(id)a3 reply:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v6 = a4;
  memset(v50, 0, sizeof(v50));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]", 1857, v50);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v50[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v53 = v9;
    __int16 v54 = 2112;
    BOOL v55 = self;
    __int16 v56 = 2112;
    uint64_t v57 = (uint64_t)v11;
    __int16 v58 = 2080;
    BOOL v59 = "-[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]";
    __int16 v60 = 2112;
    long long v61 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke;
  v48[3] = &unk_265080B38;
  v48[4] = self;
  id v33 = v6;
  id v49 = v33;
  int v12 = _brc_ipc_check_applibraries_access(self, 1, v48);

  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]();
    }

    __int16 v15 = [(BRCXPCClient *)self session];
    uint64_t v32 = [v15 notificationManager];

    uint64_t v47 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v16 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    uint64_t v17 = 0;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v18)
    {
      id v38 = 0;
      uint64_t v39 = *(void *)v44;
      uint64_t v36 = *MEMORY[0x263F32788];
      uint64_t v35 = *MEMORY[0x263F32780];
      obuint64_t j = v16;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          BOOL v21 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v20];
          uint64_t v22 = [(BRCXPCClient *)self _setupAppLibrary:v21 error:&v47];
          if (v22)
          {
            [(BRCXPCClient *)self addAppLibrary:v22];
            uint64_t v23 = [v22 url];

            if ([(BRCXPCClient *)self canAccessPhysicalURL:v23])
            {
              uint64_t v24 = 0;
            }
            else
            {
              uint64_t v24 = [(BRCXPCClient *)self issueContainerExtensionForURL:v23 error:0];
            }
            uint64_t v26 = [v22 containerMetadata];
            __int16 v27 = [(BRCXPCClient *)self bundleID];
            uint64_t v25 = [v26 versionNumberForBundleIdentifier:v27];

            if (v24 | v25)
            {
              qos_class_t v28 = [MEMORY[0x263EFF9A0] dictionary];
              __int16 v29 = v28;
              if (v24) {
                [v28 setObject:v24 forKeyedSubscript:v36];
              }
              if (v25) {
                [v29 setObject:v25 forKeyedSubscript:v35];
              }
              if (!v38) {
                id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              id v30 = [v22 appLibraryID];
              [v38 setObject:v29 forKeyedSubscript:v30];
            }
            uint64_t v17 = (void *)v23;
          }
          else
          {
            uint64_t v24 = brc_bread_crumbs();
            uint64_t v25 = brc_default_log();
            if (os_log_type_enabled((os_log_t)v25, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v53 = v20;
              __int16 v54 = 2112;
              BOOL v55 = v47;
              __int16 v56 = 2112;
              uint64_t v57 = v24;
              _os_log_error_impl(&dword_23FA42000, (os_log_t)v25, (os_log_type_t)0x90u, "[ERROR] can't setup container %@: %@%@", buf, 0x20u);
            }
          }
        }
        uint64_t v16 = obj;
        uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v18);
    }
    else
    {
      id v38 = 0;
    }

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke_309;
    v40[3] = &unk_265085B38;
    v40[4] = self;
    id v31 = v38;
    id v41 = v31;
    id v42 = v33;
    [v32 getPipeWithXPCReceiver:v34 client:self reply:v40];
  }
  __brc_leave_section(v50);
}

void __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke_309(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138413314;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v8, 0x34u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __54__BRCXPCRegularIPCsClient_queryPathsForPersona_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryEligibleAccountDescriptorsWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void))a3;
  int v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [MEMORY[0x263F32570] allEligibleAccountDescriptors];
    int v9 = 138413058;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v8 = [MEMORY[0x263F32570] allEligibleAccountDescriptors];
  v4[2](v4, v8, 0);
}

- (void)getTotalApplicationDocumentUsageWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getTotalApplicationDocumentUsageWithReply:]", 1932, v22);
  int v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    int v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    qos_class_t v28 = v9;
    __int16 v29 = 2080;
    id v30 = "-[BRCXPCRegularIPCsClient getTotalApplicationDocumentUsageWithReply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x263F32348];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v11 = v4;
  id v21 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v20);

  if (v10)
  {
    id v12 = objc_msgSend(MEMORY[0x263F325C0], "br_getProviderDomainIDForCurrentPersona");
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient getTotalApplicationDocumentUsageWithReply:]();
    }

    __int16 v15 = (void *)MEMORY[0x263F054C8];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke_315;
    uint64_t v17[3] = &unk_2650835B0;
    void v17[4] = self;
    id v19 = v11;
    id v16 = v12;
    id v18 = v16;
    [v15 accumulatedSizeOfItemsInDomain:v16 completion:v17];
  }
  __brc_leave_section(v22);
}

void __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke_315(void *a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = a1[4];
      *(_DWORD *)buf = 138413058;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      id v34 = 0;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F04FC0]];
    uint64_t v10 = (void *)v9;
    if (v9) {
      __int16 v11 = (void *)v9;
    }
    else {
      __int16 v11 = &unk_26F3DD4C0;
    }
    id v12 = v11;

    uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F04FB8]];
    uint64_t v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = &unk_26F3DD4C0;
    }
    id v16 = v15;

    uint64_t v17 = [v5 objectForKeyedSubscript:*MEMORY[0x263F052F8]];
    id v18 = (void *)v17;
    if (v17) {
      id v19 = (void *)v17;
    }
    else {
      id v19 = &unk_26F3DD4C0;
    }
    id v20 = v19;

    v29[0] = @"Total Size";
    v29[1] = @"Evictable Size";
    v30[0] = v12;
    v30[1] = v16;
    v29[2] = @"Document Count";
    v30[2] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    uint64_t v27 = a1[5];
    qos_class_t v28 = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = a1[4];
      *(_DWORD *)buf = 138413058;
      uint64_t v32 = v26;
      __int16 v33 = 2112;
      id v34 = v22;
      __int16 v35 = 2112;
      id v36 = 0;
      __int16 v37 = 2112;
      id v38 = v23;
      _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)getApplicationDocumentUsageInfoForBundleID:(id)a3 withReply:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = (BRCXPCRegularIPCsClient *)a3;
  id v7 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]", 1983, v47);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v47[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v51 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v52 = 2112;
    uint64_t v53 = self;
    __int16 v54 = 2112;
    BOOL v55 = v12;
    __int16 v56 = 2080;
    uint64_t v57 = "-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]";
    __int16 v58 = 2112;
    BOOL v59 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x263F32348];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke;
  uint64_t v45[3] = &unk_265080B38;
  void v45[4] = self;
  id v14 = v7;
  id v46 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v45);

  if (v13)
  {
    memset(v44, 0, sizeof(v44));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]", 1985, v44);
    uint64_t v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = (BRCXPCRegularIPCsClient *)v44[0];
      __int16 v52 = 2112;
      uint64_t v53 = v6;
      __int16 v54 = 2112;
      BOOL v55 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx getting usage for %@%@", buf, 0x20u);
    }

    uint64_t v17 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v6 placeholder:0];
    if (v17)
    {
      id v18 = BREntitledContainerIdentifiersForProxy();
    }
    else
    {
      brc_bread_crumbs();
      id v19 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v51 = v6;
        __int16 v52 = 2112;
        uint64_t v53 = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to find bundleID %@%@", buf, 0x16u);
      }

      id v18 = 0;
    }
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    id v21 = [(BRCXPCClient *)self session];
    if ([v18 count])
    {
      uint64_t v22 = [v21 clientTruthWorkloop];
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      id v30 = __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke_328;
      __int16 v31 = &unk_265085B60;
      id v32 = v18;
      id v33 = v21;
      id v34 = &v40;
      __int16 v35 = &v36;
      dispatch_async_and_wait(v22, &v28);
    }
    v48[0] = *MEMORY[0x263F32318];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v37 + 24), v28, v29, v30, v31);
    v48[1] = *MEMORY[0x263F32310];
    v49[0] = v23;
    uint64_t v24 = [NSNumber numberWithBool:*((unsigned __int8 *)v41 + 24)];
    v49[1] = v24;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

    brc_bread_crumbs();
    uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v51 = self;
      __int16 v52 = 2112;
      uint64_t v53 = v25;
      __int16 v54 = 2112;
      BOOL v55 = 0;
      __int16 v56 = 2112;
      uint64_t v57 = v26;
      _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v14 + 2))(v14, v25, 0);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    __brc_leave_section(v44);
  }
  __brc_leave_section(v47);
}

void __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke_328(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = objc_msgSend(*(id *)(a1 + 40), "appLibraryByID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v9 + 24))
        {
          char v10 = 1;
        }
        else
        {
          char v10 = [v7 hasLocalChanges];
          uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        }
        *(unsigned char *)(v9 + 24) = v10;
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(unsigned char *)(v11 + 24))
        {
          char v12 = 1;
        }
        else
        {
          char v12 = [v8 hasUbiquitousDocuments];
          uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        }
        *(unsigned char *)(v11 + 24) = v12;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {

          goto LABEL_18;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)hasOptimizeStorageWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient hasOptimizeStorageWithReply:]", 2026, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    *(void *)uint64_t v22 = self;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v9;
    *(_WORD *)&v22[18] = 2080;
    *(void *)&v22[20] = "-[BRCXPCRegularIPCsClient hasOptimizeStorageWithReply:]";
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  char v10 = (void *)*MEMORY[0x263F32420];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__BRCXPCRegularIPCsClient_hasOptimizeStorageWithReply___block_invoke;
  v16[3] = &unk_265080B38;
  v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    char v12 = [(BRCXPCClient *)self session];
    uint64_t v13 = [v12 hasOptimizeStorageEnabled];

    long long v14 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v20 = self;
      __int16 v21 = 1024;
      *(_DWORD *)uint64_t v22 = v13;
      *(_WORD *)&void v22[4] = 2112;
      *(void *)&v22[6] = 0;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, v13, 0);
  }
  __brc_leave_section(v18);
}

void __55__BRCXPCRegularIPCsClient_hasOptimizeStorageWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    long long v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setStorageOpimizationEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setStorageOpimizationEnabled:reply:]", 2036, v19);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v19[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v21 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v22 = 2112;
    __int16 v23 = self;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    __int16 v26 = 2080;
    uint64_t v27 = "-[BRCXPCRegularIPCsClient setStorageOpimizationEnabled:reply:]";
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v12 = (void *)*MEMORY[0x263F32420];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__BRCXPCRegularIPCsClient_setStorageOpimizationEnabled_reply___block_invoke;
  uint64_t v17[3] = &unk_265080B38;
  void v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  LODWORD(v12) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v12, v17);

  if (v12)
  {
    long long v14 = [(BRCXPCClient *)self session];
    [v14 setOptimizeStorageEnabled:v4 synchronous:0];

    uint64_t v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = 0;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  __brc_leave_section(v19);
}

void __62__BRCXPCRegularIPCsClient_setStorageOpimizationEnabled_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)evictOldDocumentsWithReply:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient evictOldDocumentsWithReply:]", 2046, v25);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v25[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    __int16 v31 = v9;
    __int16 v32 = 2080;
    id v33 = "-[BRCXPCRegularIPCsClient evictOldDocumentsWithReply:]";
    __int16 v34 = 2112;
    __int16 v35 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x263F32420];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__BRCXPCRegularIPCsClient_evictOldDocumentsWithReply___block_invoke;
  uint64_t v23[3] = &unk_265080B38;
  v23[4] = self;
  id v11 = v4;
  id v24 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v23);

  if (v10)
  {
    id v12 = +[BRCUserDefaults defaultsForMangledID:0];
    [v12 defaultTimeDeltaForEviction];
    double v14 = v13;
    [v12 defaultOnDiskAccessTimeDefaultForEviction];
    double v16 = v15;
    id v17 = [(BRCXPCClient *)self session];
    id v18 = [v17 diskReclaimer];
    id v22 = 0;
    [v18 performOptimizeStorageWithTimeDelta:&v22 onDiskAccessTimeDelta:v14 error:v16];
    id v19 = (BRCXPCRegularIPCsClient *)v22;

    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *))v11 + 2))(v11, v19);
  }
  __brc_leave_section(v25);
}

void __54__BRCXPCRegularIPCsClient_evictOldDocumentsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)iCloudDesktopSettingsChangedWithAttributes:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void *))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  uint64_t v9 = *MEMORY[0x263F07F70];
  if (v8)
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    int v12 = 138412802;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    double v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
  }
  __int16 v11 = [MEMORY[0x263F087E8] errorWithDomain:v9 code:3328 userInfo:0];
  v5[2](v5, v11);
}

- (void)getContainersByID:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainersByID:]", 2080, v24);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v24[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v26 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient getContainersByID:]";
    __int16 v33 = 2112;
    __int16 v34 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v10 = v4;
  id v23 = v10;
  int v11 = _brc_ipc_check_applibrary_proxy(self, 1, v22);

  if (v11)
  {
    int v12 = objc_opt_new();
    uint64_t v13 = +[BRCDaemonContainerHelper sharedHelper];
    __int16 v14 = [(BRCXPCClient *)self session];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_330;
    uint64_t v19[3] = &unk_26507F0B0;
    id v15 = v13;
    id v20 = v15;
    __int16 v16 = v12;
    __int16 v21 = v16;
    [v14 enumerateAppLibraries:v19];

    brc_bread_crumbs();
    id v17 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v26 = self;
      __int16 v27 = 2112;
      __int16 v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v16, 0);
  }
  __brc_leave_section(v24);
}

void __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_330(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 containerMetadata];
  if (v4)
  {
    objc_msgSend(v4, "setIsCloudSyncTCCDisabled:", objc_msgSend(*(id *)(a1 + 32), "cloudSyncTCCDisabledForContainerMeta:", v4));
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v3 appLibraryID];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_330_cold_1();
    }
  }
  return 1;
}

- (void)getContainerForMangledID:(id)a3 personaID:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerForMangledID:personaID:reply:]", 2118, v22);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v22[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient getContainerForMangledID:personaID:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v16 = v10;
  id v21 = v16;
  int v17 = _brc_ipc_check_logged_status(self, 0, v20);

  if (v17)
  {
    id v19 = v16;
    id v18 = v8;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v22);
}

void __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke_332(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = a1[4];
      int v21 = 138413058;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      id v26 = v3;
      __int16 v27 = 2112;
      __int16 v28 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];
    uint64_t v10 = v9;
    if (v9)
    {
      __int16 v11 = [v9 appLibraryByMangledID:a1[5]];
      id v12 = [v11 containerMetadataFilledWithTCCInfo];
      __int16 v13 = brc_bread_crumbs();
      qos_class_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = a1[4];
        int v21 = 138413058;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = 0;
        __int16 v27 = 2112;
        __int16 v28 = v13;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      id v16 = brc_bread_crumbs();
      int v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = a1[4];
        id v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
        int v21 = 138413058;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        id v26 = v19;
        __int16 v27 = 2112;
        __int16 v28 = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
      }
      uint64_t v20 = a1[6];
      __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v11);
    }
  }
}

- (void)didReceiveHandoffRequestForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient didReceiveHandoffRequestForBundleID:reply:]", 2151, v31);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v31[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    __int16 v39 = 2080;
    uint64_t v40 = "-[BRCXPCRegularIPCsClient didReceiveHandoffRequestForBundleID:reply:]";
    __int16 v41 = 2112;
    uint64_t v42 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __69__BRCXPCRegularIPCsClient_didReceiveHandoffRequestForBundleID_reply___block_invoke;
  void v29[3] = &unk_265080B38;
  void v29[4] = self;
  id v13 = v7;
  id v30 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v29);

  if (v14)
  {
    uint64_t v15 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
    id v16 = [v15 containerIDsForApplicationIdentifier:v6];

    int v17 = [(BRCXPCClient *)self session];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = objc_msgSend(v17, "appLibraryByID:", *(void *)(*((void *)&v25 + 1) + 8 * v21), (void)v25);
          [v22 didReceiveHandoffRequest];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v19);
    }

    __int16 v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      uint64_t v38 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  __brc_leave_section(v31);
}

void __69__BRCXPCRegularIPCsClient_didReceiveHandoffRequestForBundleID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_loggedInUserPropertyValuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v29 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v6 = [MEMORY[0x263EFB210] defaultStore];
  int v7 = objc_msgSend(v6, "br_accountForCurrentPersona");
  if (v7)
  {
    uint64_t v24 = a4;
    long long v25 = v6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = *MEMORY[0x263F32438];
      uint64_t v28 = *MEMORY[0x263F32448];
      uint64_t v27 = *MEMORY[0x263F32440];
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          int v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v14 isEqualToString:v12])
            {
              uint64_t v15 = objc_msgSend(v7, "br_firstName");
            }
            else if ([v14 isEqualToString:v28])
            {
              uint64_t v15 = objc_msgSend(v7, "br_lastName");
            }
            else
            {
              if (![v14 isEqualToString:v27])
              {
                if (v24)
                {
                  objc_msgSend(MEMORY[0x263F087E8], "brc_errorUnknownKey:", v14);
                  id *v24 = (id)objc_claimAutoreleasedReturnValue();
                }

                id v18 = 0;
                goto LABEL_31;
              }
              uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "br_isManagedAppleID"));
            }
            id v16 = (char *)v15;
            if (v15) {
              [v29 setObject:v15 forKeyedSubscript:v14];
            }
          }
          else
          {
            brc_bread_crumbs();
            id v16 = (char *)objc_claimAutoreleasedReturnValue();
            int v17 = brc_default_log();
            if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v36 = (const char *)v14;
              __int16 v37 = 2112;
              uint64_t v38 = v16;
              _os_log_error_impl(&dword_23FA42000, v17, (os_log_type_t)0x90u, "[ERROR] key: %@ is not of class NSString%@", buf, 0x16u);
            }
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v18 = v29;
LABEL_31:
    uint64_t v6 = v25;
    id v5 = v26;
  }
  else
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", @"account");
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        __int16 v23 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = "-[BRCXPCRegularIPCsClient _loggedInUserPropertyValuesForKeys:error:]";
        __int16 v37 = 2080;
        if (!a4) {
          __int16 v23 = "(ignored by caller)";
        }
        uint64_t v38 = v23;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        __int16 v41 = 2112;
        uint64_t v42 = v20;
        _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v19;
    }

    id v18 = 0;
  }

  return v18;
}

- (void)getLoggedInUserPropertyValuesForKeys:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLoggedInUserPropertyValuesForKeys:reply:]", 2204, v24);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v26 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2080;
    long long v32 = "-[BRCXPCRegularIPCsClient getLoggedInUserPropertyValuesForKeys:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingPrivateInterfaceEntitled];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__BRCXPCRegularIPCsClient_getLoggedInUserPropertyValuesForKeys_reply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingPrivateInterfaceEntitled", v22);

  if (v16)
  {
    id v21 = 0;
    int v17 = [(BRCXPCRegularIPCsClient *)self _loggedInUserPropertyValuesForKeys:v6 error:&v21];
    id v18 = v21;
    brc_bread_crumbs();
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      long long v32 = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v15 + 2))(v15, v17, v18);
  }
  __brc_leave_section(v24);
}

void __70__BRCXPCRegularIPCsClient_getLoggedInUserPropertyValuesForKeys_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setupInstanceWithDict:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setupInstanceWithDict:reply:]", 2218, v17);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v17[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2080;
    long long v25 = "-[BRCXPCRegularIPCsClient setupInstanceWithDict:reply:]";
    __int16 v26 = 2112;
    __int16 v27 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__BRCXPCRegularIPCsClient_setupInstanceWithDict_reply___block_invoke;
  v15[3] = &unk_265080B38;
  void v15[4] = self;
  id v14 = v8;
  id v16 = v14;
  _brc_ipc_spi(self, -1, (uint64_t)a2, v15);

  __brc_leave_section(v17);
}

void __55__BRCXPCRegularIPCsClient_setupInstanceWithDict_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetBudgets:(id)a3 reply:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resetBudgets:reply:]", 2226, v26);
  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v26[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    id v30 = self;
    __int16 v31 = 2112;
    long long v32 = v13;
    __int16 v33 = 2080;
    __int16 v34 = "-[BRCXPCRegularIPCsClient resetBudgets:reply:]";
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke;
  uint64_t v24[3] = &unk_265080B38;
  void v24[4] = self;
  id v14 = v8;
  id v25 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v24);

  if (v15)
  {
    id v16 = [(BRCXPCClient *)self session];
    int v17 = [v16 clientDB];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_339;
    uint64_t v19[3] = &unk_265085B88;
    id v18 = v16;
    id v20 = v18;
    id v21 = v7;
    __int16 v22 = self;
    id v23 = v14;
    [v17 performWithFlags:5 action:v19];
  }
  __brc_leave_section(v26);
}

void __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    qos_class_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_339(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [a2 forceBatchStart];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_2;
  v13[3] = &unk_265084488;
  id v3 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v3 enumerateServerZones:v13];
  id v4 = *(void **)(a1 + 40);
  if (!v4 || [v4 containsObject:@"global"])
  {
    id v5 = [*(id *)(a1 + 32) containerScheduler];
    uint64_t v6 = [v5 syncUpBudget];
    [v6 clear];

    [*(id *)(a1 + 32) resetThrottles];
  }
  int v7 = [*(id *)(a1 + 32) containerScheduler];
  uint64_t v8 = [v7 syncScheduler];
  [v8 signal];

  __int16 v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  return 1;
}

uint64_t __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (!v5
    || ([v3 zoneName],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 containsObject:v6],
        v6,
        v7))
  {
    uint64_t v8 = [v4 clientZone];
    [v8 resetSyncBudgetAndThrottle];
  }
  return 1;
}

- (void)performSelfCheck:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient performSelfCheck:reply:]", 2253, v28);
  __int16 v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v28[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v30 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v31 = 2112;
    *(void *)long long v32 = self;
    *(_WORD *)&v32[8] = 2112;
    *(void *)&v32[10] = v13;
    *(_WORD *)&v32[18] = 2080;
    *(void *)&v32[20] = "-[BRCXPCRegularIPCsClient performSelfCheck:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __50__BRCXPCRegularIPCsClient_performSelfCheck_reply___block_invoke;
  uint64_t v26[3] = &unk_265080B38;
  void v26[4] = self;
  id v14 = v8;
  id v27 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v26);

  if (v15)
  {
    int v16 = dup([v7 fileDescriptor]);
    __int16 v17 = fdopen(v16, "a");
    if (v17)
    {
      uint64_t v18 = +[BRCDaemonFPFS daemon];
      uint64_t v19 = [v18 selfCheck:v17];

      fclose(v17);
      if (v19)
      {
        id v20 = 0;
      }
      else
      {
        id v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1003, @"self check failed: broken invariant");
      }
      __int16 v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)long long v32 = v19;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v20;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = v24;
        _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
      }

      (*((void (**)(id, uint64_t, void *))v14 + 2))(v14, v19, v20);
    }
    else
    {
      uint64_t v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)long long v32 = 0;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v23;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = v21;
        _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
      }
      id v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v20);
    }
  }
  __brc_leave_section(v28);
}

void __50__BRCXPCRegularIPCsClient_performSelfCheck_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)printStatus:(id)a3 containerID:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient printStatus:containerID:reply:]", 2271, v29);
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v29[0];
    qos_class_t v15 = qos_class_self();
    int v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    __int16 v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    __int16 v36 = 2080;
    uint64_t v37 = "-[BRCXPCRegularIPCsClient printStatus:containerID:reply:]";
    __int16 v38 = 2112;
    __int16 v39 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke;
  uint64_t v27[3] = &unk_265080B38;
  void v27[4] = self;
  id v17 = v11;
  id v28 = v17;
  int v18 = _brc_ipc_spi(self, 1, (uint64_t)a2, v27);

  if (v18)
  {
    tracker = self->super._tracker;
    id v20 = dispatch_get_global_queue(0, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_348;
    uint64_t v23[3] = &unk_26507EEB0;
    v23[4] = self;
    id v24 = v9;
    id v25 = v10;
    id v26 = v17;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_349;
    uint64_t v21[3] = &unk_26507F850;
    void v21[4] = self;
    id v22 = v26;
    brc_task_tracker_async_with_logs(tracker, v20, v23, v21);
  }
  __brc_leave_section(v29);
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_348(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2455D97F0]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = 0;
  uint64_t v7 = [v3 dumpStatusToFileHandle:v4 zoneName:v5 tracker:v6 error:&v15];
  id v8 = v15;

  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = objc_msgSend(v8, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = objc_msgSend(v8, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v7, v14);
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_349(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)dumpFPFSMigrationStatusTo:(id)a3 personaID:(id)a4 includeNonMigratedItems:(BOOL)a5 reply:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  int v11 = (__CFString *)a4;
  id v12 = a6;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:]", 2291, v24);
  uint64_t v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v24[0];
    qos_class_t v16 = qos_class_self();
    uint64_t v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v18 = v12;
  id v23 = v18;
  int v19 = _brc_ipc_spi(self, 0, (uint64_t)a2, v22);

  if (v19)
  {
    if (!v11) {
      int v11 = @"__defaultPersonaID__";
    }
    id v21 = v18;
    id v20 = v10;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v24);
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_350(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v33 = v6;
      __int16 v34 = 1024;
      int v35 = 0;
      __int16 v36 = 2112;
      id v37 = v3;
      __int16 v38 = 2112;
      __int16 v39 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];

    if (v9)
    {
      int v10 = *(void **)(*(void *)(a1 + 32) + 8);
      __int16 v11 = dispatch_get_global_queue(0, 0);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_351;
      uint64_t v26[3] = &unk_265082FA8;
      id v27 = v8;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 32);
      id v28 = v12;
      uint64_t v29 = v13;
      char v31 = *(unsigned char *)(a1 + 56);
      id v30 = *(id *)(a1 + 48);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_352;
      uint64_t v24[3] = &unk_26507F850;
      void v24[4] = *(void *)(a1 + 32);
      id v25 = *(id *)(a1 + 48);
      brc_task_tracker_async_with_logs(v10, v11, v26, v24);

      __int16 v14 = v27;
    }
    else
    {
      uint64_t v15 = brc_bread_crumbs();
      qos_class_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        id v18 = (void *)MEMORY[0x263F087E8];
        int v19 = [v8 loggedOutError];
        id v20 = objc_msgSend(v18, "brc_errorLoggedOutWithUnderlyingError:", v19);
        *(_DWORD *)buf = 138413058;
        uint64_t v33 = v17;
        __int16 v34 = 1024;
        int v35 = 0;
        __int16 v36 = 2112;
        id v37 = v20;
        __int16 v38 = 2112;
        __int16 v39 = v15;
        _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      uint64_t v21 = *(void *)(a1 + 48);
      __int16 v22 = (void *)MEMORY[0x263F087E8];
      __int16 v14 = [v8 loggedOutError];
      id v23 = objc_msgSend(v22, "brc_errorLoggedOutWithUnderlyingError:", v14);
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v23);
    }
  }
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_351(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2455D97F0]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  id v15 = 0;
  uint64_t v7 = [v3 dumpFPFSMigrationStatusToFileHandle:v4 tracker:v5 includeNonMigratedItems:v6 error:&v15];
  id v8 = v15;

  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(v8, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  __int16 v14 = objc_msgSend(v8, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v7, v14);
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_352(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)dumpDatabaseTo:(id)a3 containerID:(id)a4 personaID:(id)a5 includeAllItems:(BOOL)a6 verbose:(BOOL)a7 reply:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = (__CFString *)a5;
  id v15 = a8;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]", 2329, v31);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = v13;
    id v19 = v12;
    uint64_t v20 = v31[0];
    qos_class_t v21 = qos_class_self();
    __int16 v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v20;
    __int16 v34 = 2112;
    int v35 = self;
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2080;
    __int16 v39 = "-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]";
    __int16 v40 = 2112;
    __int16 v41 = v16;
    _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    id v12 = v19;
    id v13 = v18;
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke;
  uint64_t v29[3] = &unk_265080B38;
  void v29[4] = self;
  id v23 = v15;
  id v30 = v23;
  int v24 = _brc_ipc_spi(self, 0, (uint64_t)a2, v29);

  if (v24)
  {
    if (!v14) {
      __int16 v14 = @"__defaultPersonaID__";
    }
    id v28 = v23;
    id v26 = v12;
    id v27 = v13;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v31);
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_353(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];

    if (!v9)
    {
      id v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        __int16 v22 = (void *)MEMORY[0x263F087E8];
        id v23 = [v8 loggedOutError];
        int v24 = objc_msgSend(v22, "brc_errorLoggedOutWithUnderlyingError:", v23);
        *(_DWORD *)buf = 138413058;
        uint64_t v46 = v21;
        __int16 v47 = 1024;
        *(_DWORD *)id v48 = 0;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v24;
        *(_WORD *)&v48[14] = 2112;
        *(void *)&v48[16] = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      uint64_t v25 = *(void *)(a1 + 56);
      id v26 = (void *)MEMORY[0x263F087E8];
      id v27 = [v8 loggedOutError];
      id v28 = objc_msgSend(v26, "brc_errorLoggedOutWithUnderlyingError:", v27);
      (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v28);

      goto LABEL_17;
    }
    memset(v44, 0, sizeof(v44));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]_block_invoke", 2348, v44);
    int v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v44[0];
      uint64_t v13 = *(void *)(a1 + 32);
      qos_class_t v14 = qos_class_self();
      uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      uint64_t v46 = v12;
      __int16 v47 = 2112;
      *(void *)id v48 = v13;
      *(_WORD *)&v48[8] = 2112;
      *(void *)&v48[10] = v15;
      *(_WORD *)&v48[18] = 2080;
      *(void *)&v48[20] = "-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]_block_invoke";
      __int16 v49 = 2112;
      __int16 v50 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v8 session];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_354;
    v42[3] = &unk_265080B38;
    v42[4] = *(void *)(a1 + 32);
    id v43 = *(id *)(a1 + 56);
    if (v16)
    {
      char v18 = _brc_ipc_check_logged_status(v16, 1, v42);

      if ((v18 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 8);
    id v30 = dispatch_get_global_queue(0, 0);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    void v35[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_355;
    uint64_t v35[3] = &unk_265085BD8;
    id v36 = v8;
    id v37 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 48);
    __int16 v41 = *(_WORD *)(a1 + 64);
    uint64_t v32 = *(void *)(a1 + 32);
    id v38 = v31;
    uint64_t v39 = v32;
    id v40 = *(id *)(a1 + 56);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_356;
    uint64_t v33[3] = &unk_26507F850;
    v33[4] = *(void *)(a1 + 32);
    id v34 = *(id *)(a1 + 56);
    brc_task_tracker_async_with_logs(v29, v30, v35, v33);

LABEL_16:
    __brc_leave_section(v44);
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v46 = v6;
    __int16 v47 = 1024;
    *(_DWORD *)id v48 = 0;
    *(_WORD *)&v48[4] = 2112;
    *(void *)&v48[6] = v3;
    *(_WORD *)&v48[14] = 2112;
    *(void *)&v48[16] = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_354(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_355(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2455D97F0]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = 0;
  uint64_t v9 = [v3 dumpDatabaseToFileHandle:v4 zoneName:v5 includeAllItems:v6 verbose:v7 tracker:v8 error:&v17];
  id v10 = v17;

  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 56);
    qos_class_t v14 = objc_msgSend(v10, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v13;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = objc_msgSend(v10, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v9, v16);
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_356(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)backupDatabaseWithURLWrapper:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient backupDatabaseWithURLWrapper:reply:]", 2366, v32);
  uint64_t v9 = brc_bread_crumbs();
  __int16 v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v32[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v34 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v35 = 2112;
    id v36 = self;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2080;
    id v40 = "-[BRCXPCRegularIPCsClient backupDatabaseWithURLWrapper:reply:]";
    __int16 v41 = 2112;
    uint64_t v42 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __62__BRCXPCRegularIPCsClient_backupDatabaseWithURLWrapper_reply___block_invoke;
  void v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v14 = v8;
  id v31 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v30);

  if (v15)
  {
    uint64_t v16 = [v7 url];
    id v17 = NSURL;
    char v18 = NSString;
    uint64_t v19 = [(BRCXPCClient *)self session];
    __int16 v20 = [v19 sessionDirPath];
    uint64_t v21 = [v18 stringWithFormat:@"%@/db", v20];
    __int16 v22 = [v17 fileURLWithPath:v21];

    id v23 = v16;
    __int16 v24 = +[BRCAccountSessionFPFS sessionForBackingUpDatabasesAtURL:v22];
    id v29 = 0;
    LOBYTE(v21) = [v24 backupDatabaseToURL:v23 includeServer:1 doNotObfuscate:1 error:&v29];
    id v25 = v29;
    if (v21)
    {
      brc_bread_crumbs();
      uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v34 = self;
        __int16 v35 = 2112;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v25;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v28 = v23;
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v34 = self;
        __int16 v35 = 2112;
        id v36 = 0;
        __int16 v37 = 2112;
        id v38 = v25;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v28 = 0;
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v14 + 2))(v14, v28, v25);
  }
  __brc_leave_section(v32);
}

void __62__BRCXPCRegularIPCsClient_backupDatabaseWithURLWrapper_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dumpCoordinationInfoTo:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpCoordinationInfoTo:reply:]", 2387, v25);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v25[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2080;
    uint64_t v33 = "-[BRCXPCRegularIPCsClient dumpCoordinationInfoTo:reply:]";
    __int16 v34 = 2112;
    __int16 v35 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke;
  uint64_t v23[3] = &unk_265080B38;
  v23[4] = self;
  id v14 = v8;
  id v24 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v23);

  if (v15)
  {
    tracker = self->super._tracker;
    id v17 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_361;
    uint64_t v20[3] = &unk_26507F918;
    v20[4] = self;
    id v21 = v7;
    id v22 = v14;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_362;
    uint64_t v18[3] = &unk_26507F850;
    void v18[4] = self;
    id v19 = v22;
    brc_task_tracker_async_with_logs(tracker, v17, v20, v18);
  }
  __brc_leave_section(v25);
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_361(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2455D97F0]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = 0;
  uint64_t v5 = [v3 dumpFileCoordinationInfoToFileHandle:v4 error:&v13];
  id v6 = v13;

  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v5, v12);
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_362(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)simulateHealthIssueWithContainer:(id)a3 status:(id)a4 reply:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v68 = (BRCXPCRegularIPCsClient *)a3;
  uint64_t v9 = (BRCXPCRegularIPCsClient *)a4;
  id v10 = a5;
  memset(v78, 0, sizeof(v78));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2403, v78);
  brc_bread_crumbs();
  int v11 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v78[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v81 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v82 = 2112;
    __int16 v83 = self;
    __int16 v84 = 2112;
    uint64_t v85 = v15;
    __int16 v86 = 2080;
    v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
    __int16 v88 = 2112;
    v89 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  void v76[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke;
  v76[3] = &unk_265080B38;
  v76[4] = self;
  id v16 = v10;
  id v77 = v16;
  int v17 = _brc_ipc_spi(self, 1, (uint64_t)a2, v76);

  if (v17)
  {
    memset(v75, 0, sizeof(v75));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2407, v75);
    __int16 v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v75[0];
      qos_class_t v21 = qos_class_self();
      uint64_t v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      __int16 v81 = (BRCXPCRegularIPCsClient *)v20;
      __int16 v82 = 2112;
      __int16 v83 = self;
      __int16 v84 = 2112;
      uint64_t v85 = v22;
      __int16 v86 = 2080;
      v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
      __int16 v88 = 2112;
      v89 = v68;
      __int16 v90 = 2112;
      id v91 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v68) {
      id v23 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v68];
    }
    else {
      id v23 = 0;
    }
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_363;
    v73[3] = &unk_265080B38;
    v73[4] = self;
    id v25 = v16;
    id v74 = v25;
    int v26 = _brc_ipc_check_applibrary_write_access(self, 1, v23, v73);

    if (!v26)
    {
      id v24 = v9;
LABEL_31:

      __brc_leave_section(v75);
      goto LABEL_32;
    }
    memset(v72, 0, sizeof(v72));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2408, v72);
    brc_bread_crumbs();
    uint64_t v27 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v66 = v16;
      id v29 = v25;
      __int16 v30 = v23;
      uint64_t v31 = v72[0];
      qos_class_t v32 = qos_class_self();
      uint64_t v33 = BRCPrettyPrintEnumWithContext(v32, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      __int16 v81 = (BRCXPCRegularIPCsClient *)v31;
      __int16 v82 = 2112;
      __int16 v83 = self;
      __int16 v84 = 2112;
      uint64_t v85 = v33;
      __int16 v86 = 2080;
      v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
      __int16 v88 = 2112;
      v89 = v27;
      _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s simulating health issue%@", buf, 0x34u);

      id v23 = v30;
      id v25 = v29;
      id v16 = v66;
    }

    __int16 v34 = brc_bread_crumbs();
    __int16 v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v81 = v68;
      __int16 v82 = 2112;
      __int16 v83 = v9;
      __int16 v84 = 2112;
      uint64_t v85 = v34;
      _os_log_impl(&dword_23FA42000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] simulating health issue on %@: %@%@", buf, 0x20u);
    }

    long long v65 = [(BRCXPCClient *)self session];
    uint64_t v36 = [v65 appLibraryByID:v68];
    long long v67 = [v36 defaultClientZone];

    if (v67)
    {
      id v24 = [(BRCXPCRegularIPCsClient *)v9 lowercaseString];

      if ([(BRCXPCRegularIPCsClient *)v24 isEqualToString:@"healthy"])
      {
        id v37 = objc_alloc(MEMORY[0x263EFD7E8]);
        id v38 = [v67 zoneName];
        __int16 v39 = objc_msgSend(MEMORY[0x263EFD808], "brc_zoneHealthZoneID");
        id v40 = (void *)[v37 initWithRecordName:v38 zoneID:v39];

        __int16 v41 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"zoneState" recordID:v40];
        [v41 setObject:&unk_26F3DD4D8 forKeyedSubscript:@"state"];
        uint64_t v42 = NSNumber;
        uint64_t v43 = [MEMORY[0x263EFF910] date];
        [v43 timeIntervalSince1970];
        long long v45 = [v42 numberWithUnsignedLongLong:(unint64_t)v44];
        [v41 setObject:v45 forKeyedSubscript:@"updateTime"];

        [v41 setObject:&stru_26F3822F0 forKeyedSubscript:@"clientInfo"];
        uint64_t v46 = [v67 zoneHealthState];
        __int16 v47 = [v46 ckInfo];
        [v47 setCKInfoFieldsInRecord:v41 includeCZMEtag:0];

        id v48 = objc_alloc(MEMORY[0x263EFD748]);
        __int16 v79 = v41;
        __int16 v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
        __int16 v50 = (void *)[v48 initWithRecordsToSave:v49 recordIDsToDelete:0];

        uint64_t v51 = objc_msgSend(MEMORY[0x263EFD780], "br_zoneHealthSimulation");
        [v50 setGroup:v51];

        __int16 v52 = objc_opt_new();
        [v50 setConfiguration:v52];

        uint64_t v53 = [v50 configuration];
        [v53 setSourceApplicationBundleIdentifier:*MEMORY[0x263F32550]];

        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_379;
        v69[3] = &unk_265085458;
        v69[4] = self;
        id v71 = v25;
        id v54 = v65;
        id v70 = v54;
        [v50 setModifyRecordsCompletionBlock:v69];
        BOOL v55 = [v54 syncContextProvider];
        __int16 v56 = [v55 zoneHealthSyncContext];
        [v56 addOperation:v50];

        uint64_t v9 = v24;
      }
      else
      {
        if ([(BRCXPCRegularIPCsClient *)v24 isEqualToString:@"partial"])
        {
          [v67 reportProblemWithType:6 recordName:@"root"];
          uint64_t v60 = brc_bread_crumbs();
          long long v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v81 = self;
            __int16 v82 = 2112;
            __int16 v83 = 0;
            __int16 v84 = 2112;
            uint64_t v85 = v60;
            _os_log_impl(&dword_23FA42000, v61, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }

          (*((void (**)(id, void))v25 + 2))(v25, 0);
          goto LABEL_30;
        }
        uint64_t v62 = brc_bread_crumbs();
        long long v63 = brc_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"newStatus", v24);
          long long v64 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          __int16 v81 = self;
          __int16 v82 = 2112;
          __int16 v83 = v64;
          __int16 v84 = 2112;
          uint64_t v85 = v62;
          _os_log_impl(&dword_23FA42000, v63, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        id v40 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"newStatus", v24);
        (*((void (**)(id, void *))v25 + 2))(v25, v40);
        uint64_t v9 = v24;
      }
    }
    else
    {
      uint64_t v57 = brc_bread_crumbs();
      __int16 v58 = brc_default_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v68);
        BOOL v59 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v81 = self;
        __int16 v82 = 2112;
        __int16 v83 = v59;
        __int16 v84 = 2112;
        uint64_t v85 = v57;
        _os_log_impl(&dword_23FA42000, v58, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      id v40 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v68);
      (*((void (**)(id, void *))v25 + 2))(v25, v40);
    }

    id v24 = v9;
LABEL_30:

    __brc_leave_section(v72);
    goto LABEL_31;
  }
  id v24 = v9;
LABEL_32:
  __brc_leave_section(v78);
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_363(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_379(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = objc_msgSend(v5, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    __int16 v18 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  __int16 v11 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  __int16 v12 = [*(id *)(a1 + 40) containerScheduler];
  [v12 scheduleSyncDownForZoneHealthWithGroup:0];
}

- (void)healthStatusStringForContainer:(id)a3 reply:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2457, v48);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v48[0];
    qos_class_t v12 = qos_class_self();
    int v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v50 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v51 = 2112;
    __int16 v52 = self;
    __int16 v53 = 2112;
    id v54 = v13;
    __int16 v55 = 2080;
    __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
    __int16 v57 = 2112;
    id v58 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke;
  uint64_t v46[3] = &unk_265080B38;
  v46[4] = self;
  id v14 = v8;
  id v47 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v46);

  if (v15)
  {
    memset(v45, 0, sizeof(v45));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2461, v45);
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v45[0];
      qos_class_t v19 = qos_class_self();
      uint64_t v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      __int16 v50 = (BRCXPCRegularIPCsClient *)v18;
      __int16 v51 = 2112;
      __int16 v52 = self;
      __int16 v53 = 2112;
      id v54 = v20;
      __int16 v55 = 2080;
      __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
      __int16 v57 = 2112;
      id v58 = v7;
      __int16 v59 = 2112;
      uint64_t v60 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v7) {
      qos_class_t v21 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v7];
    }
    else {
      qos_class_t v21 = 0;
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke_390;
    v43[3] = &unk_265080B38;
    v43[4] = self;
    id v22 = v14;
    id v44 = v22;
    __int16 v41 = v21;
    int v23 = _brc_ipc_check_applibrary_read_access(self, 1, v21, v43);

    if (v23)
    {
      memset(v42, 0, sizeof(v42));
      __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2463, v42);
      id v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = v42[0];
        qos_class_t v27 = qos_class_self();
        __int16 v28 = BRCPrettyPrintEnumWithContext(v27, (uint64_t)&brc_qos_entries, 0);
        *(_DWORD *)buf = 134219266;
        __int16 v50 = (BRCXPCRegularIPCsClient *)v26;
        __int16 v51 = 2112;
        __int16 v52 = self;
        __int16 v53 = 2112;
        id v54 = v28;
        __int16 v55 = 2080;
        __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
        __int16 v57 = 2112;
        id v58 = v7;
        __int16 v59 = 2112;
        uint64_t v60 = v24;
        _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s getting health status on %@%@", buf, 0x3Eu);
      }
      id v29 = [(BRCXPCClient *)self session];
      __int16 v30 = [v29 appLibraryByID:v7];
      uint64_t v31 = [v30 defaultClientZone];

      if (v31)
      {
        brc_bread_crumbs();
        qos_class_t v32 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = [v31 zoneHealthState];
          zoneHealthStateDescriptionForCode([v34 state]);
          __int16 v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          __int16 v50 = self;
          __int16 v51 = 2112;
          __int16 v52 = v35;
          __int16 v53 = 2112;
          id v54 = 0;
          __int16 v55 = 2112;
          __int16 v56 = v32;
          _os_log_impl(&dword_23FA42000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        uint64_t v36 = [v31 zoneHealthState];
        id v37 = zoneHealthStateDescriptionForCode([v36 state]);
        (*((void (**)(id, void *, void))v22 + 2))(v22, v37, 0);
      }
      else
      {
        brc_bread_crumbs();
        id v38 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v7);
          *(_DWORD *)buf = 138413058;
          __int16 v50 = self;
          __int16 v51 = 2112;
          __int16 v52 = 0;
          __int16 v53 = 2112;
          id v54 = v40;
          __int16 v55 = 2112;
          __int16 v56 = v38;
          _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        uint64_t v36 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v7);
        (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v36);
      }

      __brc_leave_section(v42);
    }

    __brc_leave_section(v45);
  }
  __brc_leave_section(v48);
}

void __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke_390(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)zoneNameForContainer:(id)a3 reply:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  memset(v43, 0, sizeof(v43));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]", 2478, v43);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v43[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v45 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v46 = 2112;
    id v47 = self;
    __int16 v48 = 2112;
    __int16 v49 = v13;
    __int16 v50 = 2080;
    __int16 v51 = "-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]";
    __int16 v52 = 2112;
    id v53 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke;
  v41[3] = &unk_265080B38;
  v41[4] = self;
  id v14 = v8;
  id v42 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v41);

  if (v15)
  {
    memset(v40, 0, sizeof(v40));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]", 2482, v40);
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v40[0];
      qos_class_t v19 = qos_class_self();
      uint64_t v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      long long v45 = (BRCXPCRegularIPCsClient *)v18;
      __int16 v46 = 2112;
      id v47 = self;
      __int16 v48 = 2112;
      __int16 v49 = v20;
      __int16 v50 = 2080;
      __int16 v51 = "-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]";
      __int16 v52 = 2112;
      id v53 = v7;
      __int16 v54 = 2112;
      __int16 v55 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v7) {
      qos_class_t v21 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v7];
    }
    else {
      qos_class_t v21 = 0;
    }
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    uint64_t v36 = __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke_391;
    id v37 = &unk_265080B38;
    id v38 = self;
    id v22 = v14;
    id v39 = v22;
    int v23 = _brc_ipc_check_applibrary_read_access(self, 1, v21, &v34);

    if (v23)
    {
      id v24 = [(BRCXPCClient *)self session];
      id v25 = [v24 appLibraryByID:v7];
      uint64_t v26 = [v25 defaultClientZone];

      if (v26)
      {
        brc_bread_crumbs();
        qos_class_t v27 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [v26 zoneName];
          *(_DWORD *)buf = 138413058;
          long long v45 = self;
          __int16 v46 = 2112;
          id v47 = v29;
          __int16 v48 = 2112;
          __int16 v49 = 0;
          __int16 v50 = 2112;
          __int16 v51 = v27;
          _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        __int16 v30 = [v26 zoneName];
        (*((void (**)(id, void *, void))v22 + 2))(v22, v30, 0);
      }
      else
      {
        brc_bread_crumbs();
        uint64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
        qos_class_t v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v7);
          *(_DWORD *)buf = 138413058;
          long long v45 = self;
          __int16 v46 = 2112;
          id v47 = 0;
          __int16 v48 = 2112;
          __int16 v49 = v33;
          __int16 v50 = 2112;
          __int16 v51 = v31;
          _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        __int16 v30 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v7);
        (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v30);
      }
    }
    __brc_leave_section(v40);
  }
  __brc_leave_section(v43);
}

void __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke_391(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:(unint64_t)a3 reply:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v53, 0, sizeof(v53));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]", 2497, v53);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v53[0];
    qos_class_t v10 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    __int16 v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v61 = v11;
    *(_WORD *)uint64_t v62 = 2080;
    *(void *)&v62[2] = "-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]";
    *(_WORD *)&v62[10] = 2112;
    *(void *)&v62[12] = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke;
  v51[3] = &unk_265080B38;
  v51[4] = self;
  id v12 = v6;
  id v52 = v12;
  int v13 = _brc_ipc_check_applibraries_access(self, 1, v51);

  if (v13)
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]", 2499, buf);
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]();
    }

    long long v49 = *(_OWORD *)buf;
    uint64_t v50 = *(void *)&buf[16];
    uint64_t v45 = 0;
    __int16 v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    id v16 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v61 = __Block_byref_object_copy__48;
    *(void *)uint64_t v62 = __Block_byref_object_dispose__48;
    *(void *)&v62[8] = 0;
    dispatch_group_enter(v16);
    __int16 v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 containerScheduler];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392;
    uint64_t v40[3] = &unk_26507FDC0;
    long long v43 = v49;
    uint64_t v44 = v50;
    id v42 = buf;
    qos_class_t v19 = v16;
    __int16 v41 = v19;
    [v18 notifyAfterNextZoneHealthSyncDown:v40];

    uint64_t v20 = [(BRCXPCClient *)self session];
    qos_class_t v21 = [v20 containerScheduler];
    [v21 scheduleSyncDownForZoneHealthWithGroup:0];

    queue = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_393;
    block[3] = &unk_265085C28;
    long long v38 = v49;
    uint64_t v39 = v50;
    void block[4] = self;
    uint64_t v36 = &v45;
    id v37 = buf;
    id v23 = v12;
    id v35 = v23;
    dispatch_group_notify(v19, queue, block);
    if (a3)
    {
      dispatch_time_t v24 = dispatch_time(0, 1000000000 * a3);
      if (dispatch_group_wait(v19, v24))
      {
        long long v32 = v49;
        uint64_t v33 = v50;
        id v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]();
        }

        qos_class_t v27 = self;
        objc_sync_enter(v27);
        if (!*((unsigned char *)v46 + 24))
        {
          *((unsigned char *)v46 + 24) = 1;
          __int16 v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            __int16 v30 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"zone-health sync timed-out", v32, v33);
            *(_DWORD *)__int16 v54 = 138412802;
            __int16 v55 = v27;
            __int16 v56 = 2112;
            __int16 v57 = v30;
            __int16 v58 = 2112;
            __int16 v59 = v28;
            _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v54, 0x20u);
          }
          uint64_t v31 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"zone-health sync timed-out");
          (*((void (**)(id, void *))v23 + 2))(v23, v31);
        }
        objc_sync_exit(v27);

        __brc_leave_section((uint64_t *)&v32);
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v45, 8);
  }
  __brc_leave_section(v53);
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v11 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392_cold_2();
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError", v11, v12);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  __brc_leave_section((uint64_t *)&v11);
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_393(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v11 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 80);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_393_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 1;
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
  }
  objc_sync_exit(v4);

  __brc_leave_section((uint64_t *)&v11);
}

- (void)forceSyncWithBarrierContainerID:(id)a3 timeout:(unint64_t)a4 reply:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  memset(v79, 0, sizeof(v79));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]", 2544, v79);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v79[0];
    qos_class_t v12 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v88 = v13;
    *(_WORD *)v89 = 2080;
    *(void *)&v89[2] = "-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]";
    *(_WORD *)&v89[10] = 2112;
    *(void *)&v89[12] = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke;
  uint64_t v77[3] = &unk_265080B38;
  v77[4] = self;
  id v14 = v8;
  id v78 = v14;
  int v15 = _brc_ipc_check_applibraries_access(self, 1, v77);

  if (v15)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v88 = __Block_byref_object_copy__48;
    *(void *)v89 = __Block_byref_object_dispose__48;
    *(void *)&v89[8] = 0;
    v75[0] = 0;
    v75[1] = v75;
    void v75[2] = 0x3032000000;
    uint64_t v75[3] = __Block_byref_object_copy__48;
    v75[4] = __Block_byref_object_dispose__48;
    id v76 = 0;
    group = dispatch_group_create();
    uint64_t v16 = *MEMORY[0x263F324D8];
    v86[0] = *MEMORY[0x263F32528];
    v86[1] = v16;
    uint64_t v17 = *MEMORY[0x263F327C8];
    v86[2] = *MEMORY[0x263F32550];
    v86[3] = v17;
    uint64_t v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:4];
    int v18 = [v47 containsObject:v7];
    char v19 = v18;
    if (v18)
    {
      uint64_t v20 = brc_bread_crumbs();
      qos_class_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]();
      }

      id v22 = v7;
      id v23 = 0;
    }
    else
    {
      if (v7)
      {
        uint64_t v24 = [objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v7];
      }
      else
      {
        uint64_t v24 = [(BRCXPCClient *)self defaultMangledID];
      }
      id v25 = (id)v24;
      id v23 = [(BRCXPCClient *)self _setupAppLibrary:v24 error:*(void *)&buf[8] + 40];
      if (!v23)
      {
        long long v43 = brc_bread_crumbs();
        uint64_t v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "brc_wrappedError");
          *(_DWORD *)__int16 v82 = 138412802;
          *(void *)&v82[4] = self;
          *(_WORD *)&v82[12] = 2112;
          *(void *)&v82[14] = v45;
          *(_WORD *)&v82[22] = 2112;
          id v83 = v43;
          _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v82, 0x20u);
        }
        __int16 v46 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "brc_wrappedError");
        (*((void (**)(id, void *))v14 + 2))(v14, v46);

        id v23 = 0;
        goto LABEL_27;
      }
      [(BRCXPCClient *)self addAppLibrary:v23];
      uint64_t v26 = [v23 defaultClientZone];
      id v22 = [v26 zoneName];
    }
    memset(v80, 0, sizeof(v80));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]", 2578, v80);
    qos_class_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v82 = 134218754;
      *(void *)&v82[4] = *(void *)v80;
      *(_WORD *)&v82[12] = 2112;
      *(void *)&v82[14] = v7;
      *(_WORD *)&v82[22] = 2112;
      id v83 = v22;
      __int16 v84 = 2112;
      uint64_t v85 = v27;
      _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for next sync down for %@ -> %@%@", v82, 0x2Au);
    }

    long long v73 = *(_OWORD *)v80;
    uint64_t v74 = *(void *)&v80[16];
    if ((v19 & 1) == 0)
    {
      dispatch_group_enter(group);
      id v29 = [v23 defaultClientZone];
      __int16 v30 = [(BRCXPCClient *)self description];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_397;
      v67[3] = &unk_265085C50;
      long long v71 = v73;
      uint64_t v72 = v74;
      id v68 = v22;
      id v70 = buf;
      id v69 = group;
      [v29 notifyClient:v30 afterNextSyncDown:v67];
    }
    dispatch_group_enter(group);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_398;
    v61[3] = &unk_265085C50;
    long long v65 = v73;
    uint64_t v66 = v74;
    id v31 = v22;
    id v62 = v31;
    long long v64 = v75;
    long long v32 = group;
    uint64_t v63 = v32;
    [(BRCXPCRegularIPCsClient *)self forceSyncContainerID:v31 reply:v61];
    *(void *)__int16 v82 = 0;
    *(void *)&v82[8] = v82;
    *(void *)&v82[16] = 0x2020000000;
    LOBYTE(v83) = 0;
    queue = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_399;
    block[3] = &unk_265085C78;
    long long v59 = v73;
    uint64_t v60 = v74;
    id v25 = v31;
    id v53 = v25;
    __int16 v54 = self;
    __int16 v56 = v82;
    __int16 v57 = buf;
    __int16 v58 = v75;
    id v34 = v14;
    id v55 = v34;
    dispatch_group_notify(v32, queue, block);
    if (a4)
    {
      dispatch_time_t v35 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_group_wait(v32, v35))
      {
        long long v50 = v73;
        uint64_t v51 = v74;
        uint64_t v36 = brc_bread_crumbs();
        id v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int16 v80 = 134218498;
          *(void *)&v80[4] = v50;
          *(_WORD *)&v80[12] = 2112;
          *(void *)&v80[14] = v25;
          *(_WORD *)&v80[22] = 2112;
          __int16 v81 = v36;
          _os_log_debug_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx timed-out: sync of %@%@", v80, 0x20u);
        }

        long long v38 = self;
        objc_sync_enter(v38);
        if (!*(unsigned char *)(*(void *)&v82[8] + 24))
        {
          *(unsigned char *)(*(void *)&v82[8] + 24) = 1;
          uint64_t v39 = brc_bread_crumbs();
          id v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            __int16 v41 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"sync-down timed out: %@", v7);
            *(_DWORD *)__int16 v80 = 138412802;
            *(void *)&v80[4] = v38;
            *(_WORD *)&v80[12] = 2112;
            *(void *)&v80[14] = v41;
            *(_WORD *)&v80[22] = 2112;
            __int16 v81 = v39;
            _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v80, 0x20u);
          }
          id v42 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"sync-down timed out: %@", v7);
          (*((void (**)(id, void *))v34 + 2))(v34, v42);
        }
        objc_sync_exit(v38);

        __brc_leave_section((uint64_t *)&v50);
      }
    }

    _Block_object_dispose(v82, 8);
LABEL_27:

    _Block_object_dispose(v75, 8);
    _Block_object_dispose(buf, 8);
  }
  __brc_leave_section(v79);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    qos_class_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_397(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished sync down for %@%@", buf, 0x20u);
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_397_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError");
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v12);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_398(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished scheduling sync for %@%@", buf, 0x20u);
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_398_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError");
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v12);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_399(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v12 = *(_OWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 96);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished all sync down tasks for %@%@", buf, 0x20u);
  }

  id v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 1;
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v9) {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      char v19 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v10) {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10);
  }
  objc_sync_exit(v4);

  __brc_leave_section((uint64_t *)&v12);
}

- (void)forceSyncContainerID:(id)a3 reply:(id)a4
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v70 = a3;
  id v69 = (void (**)(id, void))a4;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  unint64_t v96 = __Block_byref_object_copy__48;
  v97 = __Block_byref_object_dispose__48;
  id v98 = 0;
  memset(v92, 0, sizeof(v92));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]", 2633, v92);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v92[0];
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v102 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v103 = 2112;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v10;
    __int16 v107 = 2080;
    v108 = "-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]";
    __int16 v109 = 2112;
    id v110 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke;
  v91[3] = &unk_26507F8C8;
  v91[4] = &v93;
  _brc_ipc_check_applibraries_access(self, 1, v91);
  uint64_t v11 = (void *)v94[5];
  if (!v11) {
    goto LABEL_6;
  }
  if ((objc_msgSend(v11, "br_isCloudDocsErrorCode:", 16) & 1) == 0)
  {
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  if (![(BRCXPCClient *)self _hasPrivateIPCEntitlementForSelector:a2 error:0])
  {
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_55:
      id v62 = (BRCXPCRegularIPCsClient *)v94[5];
      *(_DWORD *)buf = 138412802;
      id v102 = self;
      __int16 v103 = 2112;
      v104 = v62;
      __int16 v105 = 2112;
      id v106 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
LABEL_56:

    v69[2](v69, v94[5]);
    goto LABEL_57;
  }
LABEL_6:
  memset(v90, 0, sizeof(v90));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]", 2648, v90);
  brc_bread_crumbs();
  long long v12 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    id v102 = (BRCXPCRegularIPCsClient *)v90[0];
    __int16 v103 = 2112;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v70;
    __int16 v107 = 2112;
    v108 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: force syncing containers matching '%@'%@", buf, 0x2Au);
  }

  if (v70)
  {
    id v14 = [(id)*MEMORY[0x263F32528] lowercaseString];
    uint64_t v15 = [v70 lowercaseString];
    int v16 = [v14 containsString:v15];

    uint64_t v17 = [(id)*MEMORY[0x263F324D8] lowercaseString];
    __int16 v18 = [v70 lowercaseString];
    int v68 = [v17 containsString:v18];

    char v19 = [(id)*MEMORY[0x263F32550] lowercaseString];
    uint64_t v20 = [v70 lowercaseString];
    int v67 = [v19 containsString:v20];

    qos_class_t v21 = [(id)*MEMORY[0x263F327C8] lowercaseString];
    id v22 = [v70 lowercaseString];
    int v66 = [v21 containsString:v22];
  }
  else
  {
    int v66 = 1;
    int v67 = 1;
    int v68 = 1;
    int v16 = 1;
  }
  [(BRCXPCClient *)self session];
  uint64_t v72 = v89 = 0;
  id v25 = [v72 appLibrariesMatchingSearchString:v70 error:&v89];
  uint64_t v26 = (BRCXPCRegularIPCsClient *)v89;
  long long v65 = v25;
  if (v25) {
    int v27 = 1;
  }
  else {
    int v27 = v16;
  }
  if ((v27 | v68 | v67 | v66))
  {
    __int16 v28 = objc_opt_new();
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v29 = v25;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v86 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          [(BRCXPCClient *)self addAppLibrary:v33];
          id v34 = [v33 defaultClientZone];
          [v28 addObject:v34];
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v100 count:16];
      }
      while (v30);
    }

    __int16 v84 = v26;
    long long v64 = [v72 clientZonesMatchingSearchString:v70 error:&v84];
    uint64_t v63 = v84;

    [v28 addObjectsFromArray:v64];
    if (v16)
    {
      brc_bread_crumbs();
      dispatch_time_t v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v102 = self;
        __int16 v103 = 2112;
        v104 = v35;
        _os_log_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing shared database%@", buf, 0x16u);
      }

      id v37 = [v72 containerScheduler];
      [v37 scheduleSyncDownForSharedDatabaseImmediately:1];
    }
    long long v38 = dispatch_group_create();
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    obuint64_t j = v28;
    uint64_t v39 = [obj countByEnumeratingWithState:&v80 objects:v99 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v81 != v40) {
            objc_enumerationMutation(obj);
          }
          id v42 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          long long v43 = brc_bread_crumbs();
          uint64_t v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v42 mangledID];
            *(_DWORD *)buf = 138412802;
            id v102 = self;
            __int16 v103 = 2112;
            v104 = v45;
            __int16 v105 = 2112;
            id v106 = v43;
            _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing %@%@", buf, 0x20u);
          }
          dispatch_group_enter(v38);
          tracker = self->super._tracker;
          uint64_t v47 = [v72 clientTruthWorkloop];
          v78[0] = MEMORY[0x263EF8330];
          v78[1] = 3221225472;
          v78[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_403;
          uint64_t v78[3] = &unk_26507ED98;
          v78[4] = v42;
          __int16 v79 = v38;
          v76[0] = MEMORY[0x263EF8330];
          v76[1] = 3221225472;
          void v76[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_2;
          v76[3] = &unk_26507ED70;
          id v77 = v79;
          brc_task_tracker_async_with_logs(tracker, v47, v78, v76);
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v80 objects:v99 count:16];
      }
      while (v39);
    }

    if (v68)
    {
      brc_bread_crumbs();
      char v48 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      long long v49 = brc_default_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v102 = self;
        __int16 v103 = 2112;
        v104 = v48;
        _os_log_impl(&dword_23FA42000, v49, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing container metadata%@", buf, 0x16u);
      }

      long long v50 = [v72 containerScheduler];
      [v50 scheduleSyncDownForContainerMetadataWithGroup:0];
    }
    if (v67)
    {
      brc_bread_crumbs();
      uint64_t v51 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v102 = self;
        __int16 v103 = 2112;
        v104 = v51;
        _os_log_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: forcing syncing zone health%@", buf, 0x16u);
      }

      id v53 = [v72 containerScheduler];
      [v53 scheduleSyncDownForZoneHealthWithGroup:0];
    }
    if (v66)
    {
      brc_bread_crumbs();
      __int16 v54 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v55 = brc_default_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v102 = self;
        __int16 v103 = 2112;
        v104 = v54;
        _os_log_impl(&dword_23FA42000, v55, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: forcing syncing side car zone%@", buf, 0x16u);
      }

      __int16 v56 = [v72 containerScheduler];
      __int16 v57 = objc_msgSend(MEMORY[0x263EFD780], "br_syncDownPushTriggered");
      [v56 scheduleSyncDownForSideCarWithGroup:v57];
    }
    queue = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_404;
    block[3] = &unk_26507F850;
    void block[4] = self;
    id v75 = v69;
    dispatch_group_notify(v38, queue, block);

    uint64_t v26 = v63;
    long long v59 = v65;
  }
  else
  {
    uint64_t v60 = brc_bread_crumbs();
    uint64_t v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v102 = self;
      __int16 v103 = 2112;
      v104 = v26;
      __int16 v105 = 2112;
      id v106 = v60;
      _os_log_impl(&dword_23FA42000, v61, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    ((void (**)(id, BRCXPCRegularIPCsClient *))v69)[2](v69, v26);
    long long v59 = v65;
  }

  __brc_leave_section(v90);
LABEL_57:
  __brc_leave_section(v92);
  _Block_object_dispose(&v93, 8);
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_403(uint64_t a1)
{
  [*(id *)(a1 + 32) resetSyncBudgetAndThrottle];
  [*(id *)(a1 + 32) clearStateBits:0x200000];
  [*(id *)(a1 + 32) scheduleSyncDown];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_2(uint64_t a1)
{
}

uint64_t __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_404(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)iWorkForceSyncContainerID:(id)a3 ownedByMe:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(v39, 0, sizeof(v39));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]", 2718, v39);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v39[0];
    qos_class_t v13 = qos_class_self();
    id v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v41 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v42 = 2112;
    long long v43 = self;
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2080;
    *(void *)uint64_t v47 = "-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]";
    *(_WORD *)&v47[8] = 2112;
    *(void *)&v47[10] = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v15 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v16 = [v15 isSharingPrivateInterfaceEntitled];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke;
  uint64_t v37[3] = &unk_265080B38;
  v37[4] = self;
  id v17 = v9;
  id v38 = v17;
  char v18 = _brc_ipc_check_client_privilege(self, 1, v16, (uint64_t)"isSharingPrivateInterfaceEntitled", v37);

  if (v18)
  {
    memset(v36, 0, sizeof(v36));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]", 2720, v36);
    char v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      __int16 v41 = (BRCXPCRegularIPCsClient *)v36[0];
      __int16 v42 = 2112;
      long long v43 = self;
      __int16 v44 = 2112;
      id v45 = v8;
      __int16 v46 = 1024;
      *(_DWORD *)uint64_t v47 = v6;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v19;
      _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: iWork force syncing containers matching '%@' ownedByMe:%d%@", buf, 0x30u);
    }

    qos_class_t v21 = [(BRCXPCClient *)self session];
    id v22 = v21;
    if (v6)
    {
      id v23 = [v21 appLibraryByID:v8];
      tracker = self->super._tracker;
      id v25 = [v22 clientTruthWorkloop];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke_405;
      uint64_t v34[3] = &unk_26507ED70;
      id v26 = v23;
      id v35 = v26;
      brc_task_tracker_async_with_logs(tracker, v25, v34, 0);

      int v27 = brc_bread_crumbs();
      __int16 v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        if (v8)
        {
          id v29 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", 0);
          id v29 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412802;
        __int16 v41 = self;
        __int16 v42 = 2112;
        long long v43 = v29;
        __int16 v44 = 2112;
        id v45 = v27;
        _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        if (!v8) {
      }
        }
      if (v8)
      {
        uint64_t v33 = 0;
      }
      else
      {
        uint64_t v33 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", 0);
      }
      (*((void (**)(id, void *))v17 + 2))(v17, v33);
      if (!v8) {
    }
      }
    else
    {
      uint64_t v30 = [v21 containerScheduler];
      [v30 scheduleSyncDownForSharedDatabaseImmediately:1];

      uint64_t v31 = brc_bread_crumbs();
      long long v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v41 = self;
        __int16 v42 = 2112;
        long long v43 = 0;
        __int16 v44 = 2112;
        id v45 = v31;
        _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }

      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }

    __brc_leave_section(v36);
  }
  __brc_leave_section(v39);
}

void __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke_405(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) defaultClientZone];
  [v1 scheduleSyncDown];
}

- (void)createContainerWithID:(id)a3 ownerName:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createContainerWithID:ownerName:reply:]", 2740, v27);
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v27[0];
    qos_class_t v15 = qos_class_self();
    char v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v29 = (BRCXPCRegularIPCsClient *)v14;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    __int16 v34 = 2080;
    id v35 = "-[BRCXPCRegularIPCsClient createContainerWithID:ownerName:reply:]";
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __65__BRCXPCRegularIPCsClient_createContainerWithID_ownerName_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v17 = v11;
  id v26 = v17;
  int v18 = _brc_ipc_spi(self, 1, (uint64_t)a2, v25);

  if (v18)
  {
    char v19 = [(BRCXPCClient *)self session];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v9 ownerName:v10];
    if ([v20 isShared]) {
      id v21 = (id)[v19 getOrCreateSharedZones:v20];
    }
    else {
      id v22 = (id)[v19 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v20];
    }
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = self;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
  __brc_leave_section(v27);
}

void __65__BRCXPCRegularIPCsClient_createContainerWithID_ownerName_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient computePurgeableSpaceForAllUrgenciesWithReply:]", 2759, v23);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v23[0];
    qos_class_t v9 = qos_class_self();
    id v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v25 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v26 = 2112;
    int v27 = self;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2080;
    uint64_t v31 = "-[BRCXPCRegularIPCsClient computePurgeableSpaceForAllUrgenciesWithReply:]";
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  uint64_t v21[3] = &unk_265080B38;
  void v21[4] = self;
  id v11 = v5;
  id v22 = v11;
  int v12 = _brc_ipc_spi(self, 1, (uint64_t)a2, v21);

  if (v12)
  {
    uint64_t v13 = [(BRCXPCClient *)self session];
    uint64_t v14 = [v13 diskReclaimer];

    if (v14)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_406;
      uint64_t v19[3] = &unk_265085CA0;
      void v19[4] = self;
      id v20 = v11;
      [v14 computePurgeableSpaceForAllUrgenciesWithReply:v19];
    }
    else
    {
      qos_class_t v15 = brc_bread_crumbs();
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
        id v17 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        id v25 = self;
        __int16 v26 = 2112;
        int v27 = 0;
        __int16 v28 = 2112;
        id v29 = 0;
        __int16 v30 = 2112;
        uint64_t v31 = v17;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }
      int v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v18);
    }
  }
  __brc_leave_section(v23);
}

void __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    char v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_406(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138413314;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v13, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)purgeAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient purgeAmount:withUrgency:reply:]", 2777, v24);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v24[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v26 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v14;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient purgeAmount:withUrgency:reply:]";
    __int16 v33 = 2112;
    uint64_t v34 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__BRCXPCRegularIPCsClient_purgeAmount_withUrgency_reply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v15 = v9;
  id v23 = v15;
  int v16 = _brc_ipc_spi(self, 1, (uint64_t)a2, v22);

  if (v16)
  {
    __int16 v17 = [(BRCXPCClient *)self session];
    id v18 = [v17 diskReclaimer];

    uint64_t v19 = [v18 purgeSpace:a3 withUrgency:v5];
    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v26 = self;
      __int16 v27 = 2048;
      __int16 v28 = (BRCXPCRegularIPCsClient *)v19;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lld)%@", buf, 0x20u);
    }

    (*((void (**)(id, uint64_t))v15 + 2))(v15, v19);
  }
  __brc_leave_section(v24);
}

uint64_t __57__BRCXPCRegularIPCsClient_purgeAmount_withUrgency_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d)%@", (uint8_t *)&v6, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reclaimAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient reclaimAmount:withUrgency:reply:]", 2787, v22);
  __int16 v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v22[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient reclaimAmount:withUrgency:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__BRCXPCRegularIPCsClient_reclaimAmount_withUrgency_reply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v13 = v7;
  id v21 = v13;
  int v14 = _brc_ipc_spi(self, 1, (uint64_t)a2, v20);

  if (v14)
  {
    id v15 = [(BRCXPCClient *)self session];
    int v16 = [v15 diskReclaimer];

    uint64_t v17 = [v16 periodicReclaimSpace];
    id v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = self;
      __int16 v25 = 2048;
      __int16 v26 = (BRCXPCRegularIPCsClient *)v17;
      __int16 v27 = 2112;
      __int16 v28 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lld)%@", buf, 0x20u);
    }

    (*((void (**)(id, uint64_t))v13 + 2))(v13, v17);
  }
  __brc_leave_section(v22);
}

uint64_t __59__BRCXPCRegularIPCsClient_reclaimAmount_withUrgency_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 2112;
    qos_class_t v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d)%@", (uint8_t *)&v6, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dropSpotlightIndexWithReply:(id)a3
{
}

- (void)launchSyncConsistencyChecksWithContainerIDs:(id)a3 reply:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v6 = a4;
  memset(v40, 0, sizeof(v40));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient launchSyncConsistencyChecksWithContainerIDs:reply:]", 2810, v40);
  uint64_t v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v40[0];
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v43 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v44 = 2112;
    id v45 = self;
    __int16 v46 = 2112;
    uint64_t v47 = v11;
    __int16 v48 = 2080;
    long long v49 = "-[BRCXPCRegularIPCsClient launchSyncConsistencyChecksWithContainerIDs:reply:]";
    __int16 v50 = 2112;
    uint64_t v51 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v12 = (void *)*MEMORY[0x263F323E0];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke;
  uint64_t v38[3] = &unk_265080B38;
  v38[4] = self;
  id v13 = v6;
  id v39 = v13;
  LODWORD(v12) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v12, v38);

  if (v12)
  {
    __int16 v30 = [(BRCXPCClient *)self session];
    int v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v31, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v31;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v35;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * v18);
          id v20 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v19];
          id v21 = v20;
          if (!v20)
          {
            __int16 v26 = brc_bread_crumbs();
            __int16 v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v19);
              __int16 v28 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              long long v43 = self;
              __int16 v44 = 2112;
              id v45 = 0;
              __int16 v46 = 2112;
              uint64_t v47 = 0;
              __int16 v48 = 2112;
              long long v49 = v28;
              __int16 v50 = 2112;
              uint64_t v51 = v26;
              _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
            }
            __int16 v29 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v19);
            (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v29);

            goto LABEL_16;
          }
          id v22 = [v20 mangledIDString];
          [v14 addObject:v22];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v23 = [v30 applyScheduler];
    uint64_t v24 = [v23 hasActiveWorkGroup];
    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v24, v25);

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke_410;
    uint64_t v32[3] = &unk_265085CC8;
    v32[4] = self;
    id v33 = v13;
    +[BRCSyncConsistencyReport generateReportWithSession:v30 mangledIDs:v14 completion:v32];

LABEL_16:
  }
  __brc_leave_section(v40);
}

void __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke_410(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 telemetryErrorEvents];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = [v3 telemetryWarningEvents];
  __int16 v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v3 telemetryErrorEvents];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = [*(id *)(*((void *)&v32 + 1) + 8 * v14) data];
        [v6 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v47 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v16 = objc_msgSend(v3, "telemetryWarningEvents", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v28 + 1) + 8 * v20) data];
        [v9 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v46 count:16];
    }
    while (v18);
  }

  id v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    dispatch_time_t v25 = [v3 lastError];
    *(_DWORD *)buf = 138413314;
    uint64_t v37 = v24;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    __int16 v41 = v9;
    __int16 v42 = 2112;
    long long v43 = v25;
    __int16 v44 = 2112;
    id v45 = v22;
    _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
  }
  uint64_t v26 = *(void *)(a1 + 40);
  __int16 v27 = [v3 lastError];
  (*(void (**)(uint64_t, void *, void *, void *))(v26 + 16))(v26, v6, v9, v27);
}

- (void)pauseSyncConsistencyWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient pauseSyncConsistencyWithReply:]", 2846, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient pauseSyncConsistencyWithReply:]";
    __int16 v27 = 2112;
    long long v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x263F323E0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__BRCXPCRegularIPCsClient_pauseSyncConsistencyWithReply___block_invoke;
  v16[3] = &unk_265080B38;
  v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    uint64_t v13 = [v12 remoteObjectProxy];
    [v13 pauseTreeConsistencyCheck];

    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __57__BRCXPCRegularIPCsClient_pauseSyncConsistencyWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resumeSyncConsistencyWithReply:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resumeSyncConsistencyWithReply:]", 2858, v21);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v21[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    __int16 v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    __int16 v28 = 2080;
    uint64_t v29 = "-[BRCXPCRegularIPCsClient resumeSyncConsistencyWithReply:]";
    __int16 v30 = 2112;
    long long v31 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x263F323E0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke;
  uint64_t v19[3] = &unk_265080B38;
  void v19[4] = self;
  id v11 = v4;
  id v20 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v19);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_412;
    uint64_t v17[3] = &unk_265080B38;
    void v17[4] = self;
    id v13 = v11;
    id v18 = v13;
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_413;
    v15[3] = &unk_265080B38;
    void v15[4] = self;
    id v16 = v13;
    [v14 resumeTreeConsistencyCheckWithReply:v15];
  }
  __brc_leave_section(v21);
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_412(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_413(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelTreeConsistencyCheckWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient cancelTreeConsistencyCheckWithReply:]", 2872, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    __int16 v25 = 2080;
    __int16 v26 = "-[BRCXPCRegularIPCsClient cancelTreeConsistencyCheckWithReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x263F323E0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__BRCXPCRegularIPCsClient_cancelTreeConsistencyCheckWithReply___block_invoke;
  v16[3] = &unk_265080B38;
  v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    uint64_t v13 = [v12 remoteObjectProxy];
    [v13 cancelTreeConsistencyCheck];

    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __63__BRCXPCRegularIPCsClient_cancelTreeConsistencyCheckWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)waitForAccountToLoadWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[BRCAccountsManager sharedManager];
  uint64_t v6 = [v5 accountsLoadingBarrier];
  [v6 waitForBarrier];

  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitForAccountToLoadWithReply:]", 2904, v18);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v18[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 2080;
    __int16 v26 = "-[BRCXPCRegularIPCsClient waitForAccountToLoadWithReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__BRCXPCRegularIPCsClient_waitForAccountToLoadWithReply___block_invoke;
  v16[3] = &unk_265080B38;
  v16[4] = self;
  id v12 = v4;
  id v17 = v12;
  int v13 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v13)
  {
    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
  __brc_leave_section(v18);
}

void __57__BRCXPCRegularIPCsClient_waitForAccountToLoadWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)validateCloudDocsSupported:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient validateCloudDocsSupported:withReply:]", 2911, v26);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v26[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v28 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v29 = 2112;
    __int16 v30 = self;
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    __int16 v33 = 2080;
    long long v34 = "-[BRCXPCRegularIPCsClient validateCloudDocsSupported:withReply:]";
    __int16 v35 = 2112;
    long long v36 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v25 = 0;
  BOOL v12 = +[BRCSystemSupportAnalyzer isCloudDocsSupportedWithError:&v25];
  uint64_t v13 = (BRCXPCRegularIPCsClient *)v25;
  uint64_t v14 = v13;
  if (!v12
    && v4
    && [(BRCXPCRegularIPCsClient *)v13 br_isCloudDocsErrorCode:121])
  {
    __int16 v15 = [(BRCXPCRegularIPCsClient *)v14 userInfo];
    id v16 = [v15 objectForKeyedSubscript:@"unsupportedReason"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      __int16 v23 = brc_bread_crumbs();
      __int16 v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCXPCRegularIPCsClient validateCloudDocsSupported:withReply:]();
      }
    }
    id v18 = [(BRCXPCRegularIPCsClient *)v14 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"unsupportedReason"];

    id v20 = +[BRCUserNotification defaultInstance];
    objc_msgSend(v20, "showErrorVolumeNotSupportedWithReason:", (int)objc_msgSend(v19, "intValue"));
  }
  __int16 v21 = brc_bread_crumbs();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v14;
    __int16 v31 = 2112;
    uint64_t v32 = v21;
    _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  v6[2](v6, v14);
  __brc_leave_section(v26);
}

- (void)createAccountWithACAccountID:(id)a3 dsid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]", 2952, v32);
  __int16 v11 = brc_bread_crumbs();
  BOOL v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v32[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v34 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v35 = 2112;
    long long v36 = self;
    __int16 v37 = 2112;
    __int16 v38 = v15;
    __int16 v39 = 2080;
    __int16 v40 = "-[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]";
    __int16 v41 = 2112;
    __int16 v42 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke;
  void v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v16 = v10;
  id v31 = v16;
  int v17 = _brc_ipc_check_account_access(self, -1, v30);

  if (v17)
  {
    id v18 = +[BRCAccountsManager sharedManager];
    if ([v18 waitForInitialAccountLoadingSynchronouslyIfPossible])
    {
      uint64_t v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]();
      }

      if ((int)BRGetMigrationStatusForDSID() > 1)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_421;
        uint64_t v28[3] = &unk_265085CF0;
        v28[4] = self;
        id v29 = v16;
        [v18 createSessionWithACAccountID:v8 dsid:v9 completionHandler:v28];
      }
      else
      {
        __int16 v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]();
        }

        __int16 v23 = brc_bread_crumbs();
        __int16 v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"accountID", v9);
          id v25 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          long long v34 = self;
          __int16 v35 = 2112;
          long long v36 = v25;
          __int16 v37 = 2112;
          __int16 v38 = v23;
          _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        __int16 v26 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"accountID", v9);
        (*((void (**)(id, void *))v16 + 2))(v16, v26);
      }
    }
    else
    {
      __int16 v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorBuddyFlowNeedsToRun");
      (*((void (**)(id, void *))v16 + 2))(v16, v27);
    }
  }
  __brc_leave_section(v32);
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    BOOL v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_421(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_421_cold_1();
    }
  }
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_unregisterPrematurely
{
  id v2 = self;
  objc_sync_enter(v2);
  if (*((unsigned char *)&v2->super + 32)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v2->super.__session;
  }
  session = v2->super.__session;
  v2->super.__session = 0;

  objc_sync_exit(v2);
  [(BRCAccountSessionFPFS *)v4 unregisterClient:v2];
}

- (void)logoutAccountWithACAccountID:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = (BRCXPCRegularIPCsClient *)a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:]", 3003, v27);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v29 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v30 = 2112;
    id v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v12;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __62__BRCXPCRegularIPCsClient_logoutAccountWithACAccountID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v13 = v7;
  id v26 = v13;
  int v14 = _brc_ipc_check_account_access(self, 3, v25);

  if (v14)
  {
    [(BRCXPCRegularIPCsClient *)self _unregisterPrematurely];
    brc_bread_crumbs();
    __int16 v15 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Requested to logout of account %@%@", buf, 0x16u);
    }

    uint64_t v17 = +[BRCAccountsManager sharedManager];
    char v18 = [v17 destroySessionWithACAccountID:v6];

    uint64_t v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:](v18);
    }

    __int16 v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      if (v18)
      {
        __int16 v23 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 15, @"Failed to destroy account");
        __int16 v23 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      id v29 = self;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2112;
      __int16 v33 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      if ((v18 & 1) == 0) {
    }
      }
    if (v18)
    {
      __int16 v24 = 0;
    }
    else
    {
      __int16 v24 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 15, @"Failed to destroy account");
    }
    (*((void (**)(id, void *))v13 + 2))(v13, v24);
    if ((v18 & 1) == 0) {
  }
    }
  __brc_leave_section(v27);
}

void __62__BRCXPCRegularIPCsClient_logoutAccountWithACAccountID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAccountDisplayName:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient updateAccountDisplayName:reply:]", 3025, v22);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v22[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient updateAccountDisplayName:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v13 = v7;
  id v21 = v13;
  int v14 = _brc_ipc_check_account_access(self, 1, v20);

  if (v14)
  {
    brc_bread_crumbs();
    __int16 v15 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = (uint64_t)v6;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Requested to update display name of account %@%@", buf, 0x16u);
    }

    uint64_t v17 = +[BRCAccountsManager sharedManager];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_432;
    uint64_t v18[3] = &unk_265080B38;
    void v18[4] = self;
    id v19 = v13;
    [v17 updateAccountDisplayName:v6 completionHandler:v18];
  }
  __brc_leave_section(v22);
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_432(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_432_cold_1();
    }
  }
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userVerifiedTermsWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient userVerifiedTermsWithReply:]", 3040, v22);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    int v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v9;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient userVerifiedTermsWithReply:]";
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_account_access(self, 1, v20);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 fsUploader];
    [v13 userVerifiedTerms];

    int v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1000 userInfo:0];
    uint64_t v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient userVerifiedTermsWithReply:]();
    }

    uint64_t v17 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    [v17 signalErrorResolved:v14 completionHandler:&__block_literal_global_436];

    char v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = self;
      __int16 v25 = 2112;
      id v26 = 0;
      __int16 v27 = 2112;
      __int16 v28 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v22);
}

void __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke_434(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke_434_cold_1();
  }
}

- (void)invalidateAccountCacheWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient invalidateAccountCacheWithReply:]", 3058, v17);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v17[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v19 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v20 = 2112;
    id v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    __int16 v24 = 2080;
    __int16 v25 = "-[BRCXPCRegularIPCsClient invalidateAccountCacheWithReply:]";
    __int16 v26 = 2112;
    __int16 v27 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__BRCXPCRegularIPCsClient_invalidateAccountCacheWithReply___block_invoke;
  v15[3] = &unk_265080B38;
  void v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  int v11 = _brc_ipc_check_account_access(self, 0, v15);

  if (v11)
  {
    id v12 = [MEMORY[0x263EFB210] defaultStore];
    [v12 invalidateAccountForPersonaCache];

    uint64_t v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = 0;
      __int16 v22 = 2112;
      __int16 v23 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v17);
}

void __59__BRCXPCRegularIPCsClient_invalidateAccountCacheWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)jetsamCloudDocsAppsWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient jetsamCloudDocsAppsWithReply:]", 3069, v22);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient jetsamCloudDocsAppsWithReply:]";
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__BRCXPCRegularIPCsClient_jetsamCloudDocsAppsWithReply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_account_access(self, 0, v20);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    uint64_t v13 = [v12 accountHandler];
    int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = +[BRCAccountsManager sharedManager];
      id v15 = [v16 accountHandlerForCurrentPersona];
    }
    [v15 jetsamCloudDocsApps];
    uint64_t v17 = [MEMORY[0x263EFB210] defaultStore];
    [v17 invalidateAccountForPersonaCache];

    char v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = 0;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v22);
}

void __56__BRCXPCRegularIPCsClient_jetsamCloudDocsAppsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainersNeedingUpload:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainersNeedingUpload:]", 3082, v24);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v24[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient getContainersNeedingUpload:]";
    __int16 v33 = 2112;
    __int16 v34 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v10 = v4;
  id v23 = v10;
  int v11 = _brc_ipc_check_account_access(self, 1, v22);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    int v14 = [v12 clientTruthWorkloop];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_437;
    uint64_t v18[3] = &unk_26507F918;
    id v15 = v12;
    id v19 = v15;
    __int16 v20 = self;
    id v21 = v10;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_438;
    v16[3] = &unk_26507F850;
    v16[4] = self;
    id v17 = v21;
    brc_task_tracker_async_with_logs(tracker, v14, v18, v16);
  }
  __brc_leave_section(v24);
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_437(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = (void *)a1[4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_2;
  v8[3] = &unk_26507F5B8;
  id v4 = v2;
  id v9 = v4;
  [v3 enumerateAppLibraries:v8];
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[5];
    *(_DWORD *)buf = 138413058;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 defaultClientZone];
  char v5 = [v4 isSyncBlockedBecauseAppNotInstalled];

  if ((v5 & 1) == 0 && [v3 hasLocalChanges])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 containerMetadata];
    [v6 addObject:v7];
  }
  return 1;
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_438(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 reply:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a6;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setMigrationStatus:forDSID:shouldUpdateAccount:reply:]", 3105, v32);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v32[0];
    qos_class_t v13 = qos_class_self();
    __int16 v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v35 = 2112;
    __int16 v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    __int16 v39 = 2080;
    __int16 v40 = "-[BRCXPCRegularIPCsClient setMigrationStatus:forDSID:shouldUpdateAccount:reply:]";
    __int16 v41 = 2112;
    __int16 v42 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke;
  void v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v15 = v9;
  id v31 = v15;
  int v16 = _brc_ipc_check_account_access(self, 0, v30);

  if (v16)
  {
    id v17 = +[BRCAccountsManager sharedManager];
    uint64_t v18 = [MEMORY[0x263EFB210] defaultStore];
    id v19 = objc_msgSend(v18, "br_appleAccountWithPersonID:", v8);

    __int16 v20 = [v19 identifier];
    if (v20)
    {
      id v21 = objc_msgSend(v19, "br_personaIdentifier");
      id v29 = v15;
      id v26 = v17;
      id v27 = v19;
      id v28 = v8;
      BRPerformWithPersonaAndError();
    }
    else
    {
      __int16 v22 = brc_bread_crumbs();
      id v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
        __int16 v24 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v34 = self;
        __int16 v35 = 2112;
        __int16 v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = v22;
        _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
      (*((void (**)(id, void *))v15 + 2))(v15, v25);
    }
  }
  __brc_leave_section(v32);
}

void __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_439(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 48)];
    if (v7)
    {
      uint64_t v8 = *(char *)(a1 + 72);
      uint64_t v9 = *(unsigned __int8 *)(a1 + 73);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_440;
      uint64_t v17[3] = &unk_26507F850;
      void v17[4] = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 56);
      id v18 = *(id *)(a1 + 64);
      [v7 setMigrationStatus:v8 forDSID:v10 shouldUpdateAccount:v9 completion:v17];
    }
    else
    {
      __int16 v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v14;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      uint64_t v15 = *(void *)(a1 + 64);
      int v16 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
    }
  }
}

uint64_t __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_440(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSyncState:(unint64_t)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getSyncState:reply:]", 3135, v21);
  uint64_t v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v21[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = self;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2080;
    id v29 = "-[BRCXPCRegularIPCsClient getSyncState:reply:]";
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke;
  uint64_t v19[3] = &unk_265080B38;
  void v19[4] = self;
  id v12 = v6;
  id v20 = v12;
  int v13 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.fileprovider.acl-read", v19);

  if (v13)
  {
    __int16 v14 = [(BRCXPCClient *)self session];
    uint64_t v15 = [v14 readOnlyWorkloop];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke_444;
    v16[3] = &unk_265082968;
    v16[4] = self;
    unint64_t v18 = a3;
    id v17 = v12;
    dispatch_async(v15, v16);
  }
  __brc_leave_section(v21);
}

void __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 1;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke_444(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 readOnlyDB];

  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = v4 & 0xA;
  if ((v4 & 0xA) != 0)
  {
    if (v5 == 10)
    {
      uint64_t v6 = (void *)MEMORY[0x263F8C720];
      int v7 = "(3, 4)";
      uint64_t v8 = 6;
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x263F8C720];
      if ((v4 & 8) != 0) {
        int v7 = "(3)";
      }
      else {
        int v7 = "(4)";
      }
      uint64_t v8 = 3;
    }
    uint64_t v32 = [v6 rawInjection:v7 length:v8];
    __int16 v9 = (void *)[v3 fetch:@"SELECT DISTINCT item_localsyncupstate,zone_rowid FROM client_items WHERE item_localsyncupstate IN %@       AND NOT item_id_is_documents(item_id)       AND item_scope = 2", v32];
    uint64_t v10 = [v3 lastError];

    if (v10)
    {
      __int16 v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = [v3 lastError];
        *(_DWORD *)buf = 138413058;
        uint64_t v35 = v13;
        __int16 v36 = 2048;
        uint64_t v37 = 1;
        __int16 v38 = 2112;
        __int16 v39 = v14;
        __int16 v40 = 2112;
        __int16 v41 = v11;
        _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", buf, 0x2Au);
      }
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = [v3 lastError];
      (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 1, v16);
    }
    __int16 v33 = v3;
    id v17 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = 0;
    if ([v9 next])
    {
      do
      {
        unsigned int v18 = [v9 unsignedIntAtIndex:0];
        id v19 = [v9 objectOfClass:objc_opt_class() atIndex:1];
        id v20 = [v17 objectForKey:v19];
        char v21 = [v20 BOOLValue];

        if ((v21 & 1) == 0)
        {
          id v22 = [*(id *)(a1 + 32) session];
          uint64_t v23 = [v22 serverZoneByRowID:v19];
          __int16 v24 = [v23 clientZone];

          uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "isSyncBlockedBecauseAppNotInstalled"));
          [v17 setObject:v25 forKeyedSubscript:v19];

          char v26 = [v24 isSyncBlockedBecauseAppNotInstalled];
          uint64_t v27 = v5 | 8;
          if ((v18 & 3) == 0) {
            uint64_t v27 = v5;
          }
          uint64_t v28 = v27 | (v18 >> 1) & 2;
          if ((v26 & 1) == 0) {
            uint64_t v5 = v28;
          }
        }
      }
      while (([v9 next] & 1) != 0);
    }

    id v3 = v33;
  }
  id v29 = brc_bread_crumbs();
  __int16 v30 = brc_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v35 = v31;
    __int16 v36 = 2048;
    uint64_t v37 = v5;
    __int16 v38 = 2112;
    __int16 v39 = 0;
    __int16 v40 = 2112;
    __int16 v41 = v29;
    _os_log_impl(&dword_23FA42000, v30, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveFileObjectIDsToContentRecordIDsForThumbnails:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resolveFileObjectIDsToContentRecordIDsForThumbnails:reply:]", 3233, v28);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v28[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v10;
    __int16 v31 = 2112;
    uint64_t v32 = self;
    __int16 v33 = 2112;
    __int16 v34 = v12;
    __int16 v35 = 2080;
    __int16 v36 = "-[BRCXPCRegularIPCsClient resolveFileObjectIDsToContentRecordIDsForThumbnails:reply:]";
    __int16 v37 = 2112;
    __int16 v38 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke;
  uint64_t v26[3] = &unk_265080B38;
  void v26[4] = self;
  id v13 = v7;
  id v27 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v26);

  if (v14)
  {
    uint64_t v15 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    id v17 = [v15 readOnlyWorkloop];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_453;
    uint64_t v21[3] = &unk_26507EEB0;
    id v22 = v6;
    id v18 = v15;
    id v23 = v18;
    __int16 v24 = self;
    id v25 = v13;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_454;
    uint64_t v19[3] = &unk_26507F850;
    void v19[4] = self;
    id v20 = v25;
    brc_task_tracker_async_with_logs(tracker, v17, v21, v19);
  }
  __brc_leave_section(v28);
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138414082;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x52u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_453(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  __int16 v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  __int16 v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  __int16 v34 = (void *)a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v55 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v36;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    id v29 = v3;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", v28) != 2)
        {
          __int16 v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v28;
            __int16 v40 = v17;
            _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asked the content record ID of a non-document%@", buf, 0xCu);
          }
          goto LABEL_12;
        }
        uint64_t v10 = (void *)v34[5];
        __int16 v11 = [v10 readOnlyDB];
        uint64_t v12 = [v10 itemByFileObjectID:v9 db:v11];
        __int16 v13 = [v12 asDocument];

        if (!v13)
        {
          __int16 v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v40 = v9;
            __int16 v41 = 2112;
            uint64_t v42 = v17;
            _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] No document found for %@%@", buf, 0x16u);
          }
LABEL_12:

          [v2 addObject:v9];
          continue;
        }
        uint64_t v14 = [v13 currentVersion];
        uint64_t v15 = [v14 thumbnailSize];

        if (v15 < 1)
        {
          __int16 v19 = [v13 currentVersion];
          int v20 = [v19 isSmallAndMostRecentClientsGenerateThumbnails];

          if (v20)
          {
            __int16 v21 = [v13 currentVersion];
            id v22 = [v21 ckInfo];
            uint64_t v23 = [v22 etag];
            [v31 setObject:v23 forKeyedSubscript:v9];

            id v3 = v29;
            __int16 v24 = v32;
          }
          else
          {
            __int16 v24 = v30;
          }
          [v24 addObject:v9];
        }
        else
        {
          uint64_t v16 = [v13 documentRecordID];
          [v33 setObject:v16 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v35 objects:v55 count:16];
    }
    while (v6);
  }

  id v25 = brc_bread_crumbs();
  char v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = (void *)v34[6];
    *(_DWORD *)buf = 138414082;
    __int16 v40 = v27;
    __int16 v41 = 2112;
    uint64_t v42 = v33;
    __int16 v43 = 2112;
    __int16 v44 = v32;
    __int16 v45 = 2112;
    id v46 = v30;
    __int16 v47 = 2112;
    id v48 = v2;
    __int16 v49 = 2112;
    __int16 v50 = v31;
    __int16 v51 = 2112;
    uint64_t v52 = 0;
    __int16 v53 = 2112;
    __int16 v54 = v25;
    _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", buf, 0x52u);
  }

  (*(void (**)(void))(v34[7] + 16))();
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_454(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    long long v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138414082;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    __int16 v20 = 2112;
    __int16 v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", (uint8_t *)&v8, 0x52u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, 0, v7);
}

- (void)resolveBookmarkDataToURL:(id)a3 reply:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v44, 0, sizeof(v44));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]", 3287, v44);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v44[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v46 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v47 = 2112;
    id v48 = self;
    __int16 v49 = 2112;
    id v50 = v12;
    __int16 v51 = 2080;
    uint64_t v52 = "-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]";
    __int16 v53 = 2112;
    __int16 v54 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke;
  uint64_t v42[3] = &unk_265080B38;
  v42[4] = self;
  id v13 = v7;
  id v43 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 1, v42);

  if (v14)
  {
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]();
    }

    id v40 = 0;
    __int16 v41 = 0;
    long long v38 = 0;
    uint64_t v39 = 0;
    uint64_t v17 = [(BRCXPCClient *)self session];
    id v37 = 0;
    char v18 = [v6 parseBookmarkDataWithAccountSession:v17 docID:&v38 itemID:&v41 mangledID:&v40 unsaltedBookmarkData:&v39 error:&v37];
    id v19 = v37;
    if (v18)
    {
      __int16 v20 = brc_bread_crumbs();
      __int16 v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        id v46 = v38;
        __int16 v47 = 2112;
        id v48 = v41;
        __int16 v49 = 2112;
        id v50 = v40;
        __int16 v51 = 2112;
        uint64_t v52 = v39;
        __int16 v53 = 2112;
        __int16 v54 = v20;
        _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] looking for docID:%@ itemID:%@ mangledID:%@ unsaltedBookmarkData:%@%@", buf, 0x34u);
      }

      tracker = self->super._tracker;
      uint64_t v23 = [v17 clientTruthWorkloop];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_455;
      void v30[3] = &unk_265085D90;
      id v31 = v17;
      id v32 = v40;
      __int16 v33 = self;
      __int16 v34 = v41;
      id v36 = v13;
      long long v35 = v38;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_464;
      uint64_t v28[3] = &unk_26507F850;
      v28[4] = self;
      id v29 = v36;
      brc_task_tracker_async_with_logs(tracker, v23, v30, v28);

      uint64_t v24 = v31;
    }
    else
    {
      id v25 = brc_bread_crumbs();
      char v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = objc_msgSend(v19, "brc_wrappedError");
        *(_DWORD *)buf = 138413826;
        id v46 = self;
        __int16 v47 = 2112;
        id v48 = 0;
        __int16 v49 = 2112;
        id v50 = 0;
        __int16 v51 = 2112;
        uint64_t v52 = 0;
        __int16 v53 = 2112;
        __int16 v54 = 0;
        __int16 v55 = 2112;
        uint64_t v56 = v27;
        __int16 v57 = 2112;
        __int16 v58 = v25;
        _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", buf, 0x48u);
      }
      uint64_t v24 = objc_msgSend(v19, "brc_wrappedError");
      (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v24);
    }
  }
  __brc_leave_section(v44);
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  long long v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    __int16 v20 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_455(id *a1)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v2 = a1 + 5;
  id v3 = [a1[4] clientZoneByMangledID:a1[5]];
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3032000000;
  int v66 = __Block_byref_object_copy__48;
  int v67 = __Block_byref_object_dispose__48;
  if ([*v2 isPrivate])
  {
    uint64_t v4 = [a1[4] appLibraryByMangledID:a1[5]];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v68 = v4;
  uint64_t v57 = 0;
  __int16 v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = __Block_byref_object_copy__48;
  uint64_t v61 = __Block_byref_object_dispose__48;
  id v62 = 0;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2;
  v51[3] = &unk_265085D40;
  __int16 v55 = &v63;
  int8x16_t v44 = *(int8x16_t *)(a1 + 5);
  id v5 = (id)v44.i64[0];
  int8x16_t v52 = vextq_s8(v44, v44, 8uLL);
  uint64_t v56 = &v57;
  id v53 = a1[7];
  id v54 = a1[9];
  uint64_t v6 = (void *)MEMORY[0x2455D9A50](v51);
  uint64_t v7 = [v3 itemByItemID:a1[7]];
  uint64_t v8 = (void *)v58[5];
  v58[5] = v7;

  __int16 v9 = (void *)v58[5];
  if (v9
    || (objc_msgSend(v3, "itemByDocumentID:", objc_msgSend(a1[8], "unsignedIntValue")),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        __int16 v11 = (void *)v58[5],
        v58[5] = v10,
        v11,
        (__int16 v9 = (void *)v58[5]) != 0))
  {
    uint64_t v12 = objc_msgSend(v9, "appLibrary", *(_OWORD *)&v44);
    __int16 v13 = (void *)v64[5];
    v64[5] = v12;
  }
  if (objc_msgSend(a1[6], "_isAppLibraryProxyEntitled", *(_OWORD *)&v44))
  {
    LOBYTE(v14) = 1;
  }
  else if (v64[5])
  {
    __int16 v15 = [a1[6] entitledAppLibraryIDs];
    uint64_t v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v39 = a1[6];
      *(_DWORD *)buf = 138412802;
      id v70 = v39;
      __int16 v71 = 2112;
      uint64_t v72 = v15;
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v16;
      _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has access to %@%@", buf, 0x20u);
    }

    id v18 = [(id)v64[5] appLibraryID];
    int v14 = [v15 containsObject:v18];

    __int16 v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v40 = a1[6];
      uint64_t v41 = [(id)v64[5] logName];
      uint64_t v42 = (void *)v41;
      id v43 = "does not have";
      *(_DWORD *)buf = 138413058;
      id v70 = v40;
      __int16 v71 = 2080;
      if (v14) {
        id v43 = "has";
      }
      uint64_t v72 = v43;
      __int16 v73 = 2112;
      uint64_t v74 = v41;
      __int16 v75 = 2112;
      id v76 = v19;
      _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ %s access to %@%@", buf, 0x2Au);
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  uint64_t v21 = [(id)v58[5] fileObjectID];
  __int16 v22 = [v21 asString];

  if (v22)
  {
    uint64_t v23 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_462;
    uint64_t v45[3] = &unk_265085D68;
    id v24 = v22;
    id v25 = a1[6];
    id v46 = v24;
    id v47 = v25;
    id v48 = a1[9];
    id v49 = v6;
    char v50 = v14;
    [v23 getUserVisibleURLForItemIdentifier:v24 completionHandler:v45];

    char v26 = v46;
  }
  else
  {
    id v27 = brc_bread_crumbs();
    long long v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [a1[7] debugItemIDString];
      __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_455_cold_1(v29, (uint64_t)v27, v83, v28);
    }

    id v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = (void *)MEMORY[0x263F087E8];
      id v33 = a1[6];
      __int16 v34 = [a1[7] itemIDString];
      long long v35 = objc_msgSend(v32, "brc_errorItemNotFound:", v34);
      *(_DWORD *)buf = 138413826;
      id v70 = v33;
      __int16 v71 = 2112;
      uint64_t v72 = 0;
      __int16 v73 = 2112;
      uint64_t v74 = 0;
      __int16 v75 = 2112;
      id v76 = 0;
      __int16 v77 = 2112;
      uint64_t v78 = 0;
      __int16 v79 = 2112;
      long long v80 = v35;
      __int16 v81 = 2112;
      long long v82 = v30;
      _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", buf, 0x48u);
    }
    id v36 = a1[9];
    id v37 = (void *)MEMORY[0x263F087E8];
    char v26 = [a1[7] itemIDString];
    long long v38 = objc_msgSend(v37, "brc_errorItemNotFound:", v26);
    (*((void (**)(id, void, void, void, void, void *))v36 + 2))(v36, 0, 0, 0, 0, v38);
  }
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v5;
    if (!objc_msgSend(v7, "canAccessPath:accessKind:", objc_msgSend(v8, "fileSystemRepresentation"), 0))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        uint64_t v12 = brc_bread_crumbs();
        __int16 v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          int v32 = 138412546;
          uint64_t v33 = v14;
          __int16 v34 = 2112;
          id v35 = v12;
          _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] resolveBookmarkDataToURL denied for %@: not entitled%@", (uint8_t *)&v32, 0x16u);
        }

        __int16 v15 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Not Entitled");
        goto LABEL_17;
      }
LABEL_14:
      uint64_t v16 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v32 = 138412546;
        uint64_t v33 = v18;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find appLibrary for id %@%@", (uint8_t *)&v32, 0x16u);
      }

      __int16 v19 = (void *)MEMORY[0x263F087E8];
      __int16 v20 = [*(id *)(a1 + 40) appLibraryOrZoneName];
      __int16 v15 = objc_msgSend(v19, "brc_errorAppLibraryNotFound:", v20);

LABEL_17:
      __int16 v11 = 0;
      goto LABEL_18;
    }
    __int16 v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      int v32 = 138412802;
      uint64_t v33 = v31;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Client %@ has access to %@%@", (uint8_t *)&v32, 0x20u);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    goto LABEL_14;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    __int16 v11 = objc_msgSend(v6, "brc_issueSandboxExtensionOfClass:error:", *MEMORY[0x263EF8008], 0);
    if (v6) {
      goto LABEL_23;
    }
  }
  else
  {
    __int16 v11 = 0;
    if (v6) {
      goto LABEL_23;
    }
  }
  id v27 = (void *)MEMORY[0x263F087E8];
  long long v28 = [*(id *)(a1 + 48) itemIDString];
  __int16 v15 = objc_msgSend(v27, "brc_errorItemNotFound:", v28);

  if (v15)
  {
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u)) {
      __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2_cold_1((uint64_t)v15, (uint64_t)v29, v30);
    }
  }
LABEL_18:
  if (v15)
  {
    uint64_t v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v32 = 138413826;
      uint64_t v33 = v23;
      __int16 v34 = 2112;
      id v35 = 0;
      __int16 v36 = 2112;
      id v37 = 0;
      __int16 v38 = 2112;
      uint64_t v39 = 0;
      __int16 v40 = 2112;
      uint64_t v41 = 0;
      __int16 v42 = 2112;
      id v43 = v15;
      __int16 v44 = 2112;
      __int16 v45 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v32, 0x48u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_26;
  }
LABEL_23:
  id v24 = brc_bread_crumbs();
  id v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    int v32 = 138413826;
    uint64_t v33 = v26;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    uint64_t v39 = 0;
    __int16 v40 = 2112;
    uint64_t v41 = 0;
    __int16 v42 = 2112;
    id v43 = 0;
    __int16 v44 = 2112;
    __int16 v45 = v24;
    _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v32, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_26:
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_462(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = a1[4];
      int v13 = 138412802;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while computing the user visible url of %@ - %@%@", (uint8_t *)&v13, 0x20u);
    }

    __int16 v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[5];
      int v13 = 138413826;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v13, 0x48u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_464(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413826;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    __int16 v21 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v8, 0x48u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
}

- (void)getApplicationStatus:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationStatus:]", 3489, v17);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v17[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v19 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v20 = 2112;
    *(void *)__int16 v21 = self;
    *(_WORD *)&v21[8] = 2112;
    *(void *)&v21[10] = v9;
    *(_WORD *)&v21[18] = 2080;
    *(void *)&v21[20] = "-[BRCXPCRegularIPCsClient getApplicationStatus:]";
    __int16 v22 = 2112;
    __int16 v23 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__BRCXPCRegularIPCsClient_getApplicationStatus___block_invoke;
  v15[3] = &unk_265080B38;
  void v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v15);

  if (v11)
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [(BRCXPCClient *)self cloudEnabledStatus];
      *(_DWORD *)buf = 138413058;
      __int16 v19 = self;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v14;
      *(_WORD *)&void v21[4] = 2112;
      *(void *)&v21[6] = 0;
      *(_WORD *)&v21[14] = 2112;
      *(void *)&v21[16] = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, [(BRCXPCClient *)self cloudEnabledStatus], 0);
  }
  __brc_leave_section(v17);
}

void __48__BRCXPCRegularIPCsClient_getApplicationStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getApplicationStatusForProcess:(id *)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationStatusForProcess:reply:]", 3498, v23);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v23[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v11;
    *(_WORD *)&unsigned char buf[32] = 2080;
    *(void *)&buf[34] = "-[BRCXPCRegularIPCsClient getApplicationStatusForProcess:reply:]";
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__BRCXPCRegularIPCsClient_getApplicationStatusForProcess_reply___block_invoke;
  uint64_t v21[3] = &unk_265080B38;
  void v21[4] = self;
  id v12 = v6;
  id v22 = v12;
  int v13 = _brc_ipc_check_applibrary_proxy(self, 0, v21);

  if (v13)
  {
    int v14 = [BRCClientPrivilegesDescriptor alloc];
    long long v15 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v15;
    id v16 = [(BRCClientPrivilegesDescriptor *)v14 initWithAuditToken:buf];
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [(BRCClientPrivilegesDescriptor *)v16 cloudEnabledStatusWithHasSession:v17 != 0];

    __int16 v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v18;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = 0;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, v18, 0);
  }
  __brc_leave_section(v23);
}

void __64__BRCXPCRegularIPCsClient_getApplicationStatusForProcess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getLastSyncDateWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLastSyncDateWithReply:]", 3512, v22);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    long long v28 = v9;
    __int16 v29 = 2080;
    id v30 = "-[BRCXPCRegularIPCsClient getLastSyncDateWithReply:]";
    __int16 v31 = 2112;
    int v32 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__BRCXPCRegularIPCsClient_getLastSyncDateWithReply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v20);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [(BRCXPCClient *)self session];
      uint64_t v15 = [v14 serverState];
      id v16 = [v15 lastSyncDownDate];
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      long long v28 = 0;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 serverState];
    __int16 v19 = [v18 lastSyncDownDate];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
  __brc_leave_section(v22);
}

void __52__BRCXPCRegularIPCsClient_getLastSyncDateWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getLocalizedLastSyncWithReply:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v44, 0, sizeof(v44));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLocalizedLastSyncWithReply:]", 3521, v44);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v44[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v46 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v47 = 2112;
    id v48 = self;
    __int16 v49 = 2112;
    char v50 = v9;
    __int16 v51 = 2080;
    int8x16_t v52 = "-[BRCXPCRegularIPCsClient getLocalizedLastSyncWithReply:]";
    __int16 v53 = 2112;
    id v54 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __57__BRCXPCRegularIPCsClient_getLocalizedLastSyncWithReply___block_invoke;
  uint64_t v42[3] = &unk_265080B38;
  v42[4] = self;
  id v10 = v4;
  id v43 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v42);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 serverState];
    int v14 = [v13 lastSyncDownDate];

    if (!v14)
    {
      brc_bread_crumbs();
      __int16 v23 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v46 = self;
        __int16 v47 = 2112;
        id v48 = 0;
        __int16 v49 = 2112;
        char v50 = 0;
        __int16 v51 = 2112;
        int8x16_t v52 = v23;
        _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      goto LABEL_15;
    }
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSinceDate:v14];
    double v17 = v16;
    uint64_t v18 = [MEMORY[0x263EFF8F0] currentCalendar];
    __int16 v19 = [v18 components:16 fromDate:v14 toDate:v15 options:0];
    __int16 v20 = [MEMORY[0x263EFF910] date];
    [v18 rangeOfUnit:16 inUnit:512 forDate:v20];
    uint64_t v22 = v21;

    if (v17 < 60.0 || v17 < 3600.0) {
      goto LABEL_11;
    }
    [v14 timeIntervalSinceReferenceDate];
    double v30 = v29;
    __int16 v31 = [v18 startOfDayForDate:v15];
    [v31 timeIntervalSinceReferenceDate];
    BOOL v33 = v30 > v32;

    if (v33)
    {
      id v25 = objc_alloc_init(MEMORY[0x263F08790]);
      [v25 setTimeStyle:1];
      [v25 setDateStyle:0];
      __int16 v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v35 = [v25 stringFromDate:v14];
      uint64_t v36 = _BRLocalizedStringWithFormat();
    }
    else
    {
      if ([v19 day] <= 1)
      {
LABEL_11:
        id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        _BRLocalizedStringWithFormat();
        uint64_t v26 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        brc_bread_crumbs();
        __int16 v27 = (char *)objc_claimAutoreleasedReturnValue();
        long long v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v46 = self;
          __int16 v47 = 2112;
          id v48 = v26;
          __int16 v49 = 2112;
          char v50 = 0;
          __int16 v51 = 2112;
          int8x16_t v52 = v27;
          _os_log_impl(&dword_23FA42000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v26, 0);
LABEL_15:

        goto LABEL_16;
      }
      if ([v19 day] < v22)
      {
        id v25 = objc_alloc_init(MEMORY[0x263F08790]);
        id v37 = (void *)MEMORY[0x263F08790];
        __int16 v38 = [MEMORY[0x263EFF960] currentLocale];
        __int16 v34 = [v37 dateFormatFromTemplate:@"EEEE" options:0 locale:v38];

        [v25 setDateFormat:v34];
        id v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v39 = [v25 stringFromDate:v14];
        uint64_t v40 = _BRLocalizedStringWithFormat();
        uint64_t v41 = (void *)v39;
        uint64_t v26 = (BRCXPCRegularIPCsClient *)v40;

        goto LABEL_20;
      }
      id v25 = objc_alloc_init(MEMORY[0x263F08790]);
      [v25 setTimeStyle:0];
      [v25 setDateStyle:2];
      __int16 v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v35 = [v25 stringFromDate:v14];
      uint64_t v36 = _BRLocalizedStringWithFormat();
    }
    uint64_t v26 = (BRCXPCRegularIPCsClient *)v36;
LABEL_20:

    goto LABEL_12;
  }
LABEL_16:
  __brc_leave_section(v44);
}

void __57__BRCXPCRegularIPCsClient_getLocalizedLastSyncWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainerStatusWithID:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerStatusWithID:reply:]", 3578, v30);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v30[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    double v32 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v33 = 2112;
    *(void *)__int16 v34 = self;
    *(_WORD *)&v34[8] = 2112;
    *(void *)&v34[10] = v12;
    *(_WORD *)&v34[18] = 2080;
    *(void *)&v34[20] = "-[BRCXPCRegularIPCsClient getContainerStatusWithID:reply:]";
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    __int16 v38 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v6) {
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v6];
  }
  else {
    __int16 v13 = 0;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __58__BRCXPCRegularIPCsClient_getContainerStatusWithID_reply___block_invoke;
  uint64_t v28[3] = &unk_265080B38;
  v28[4] = self;
  id v14 = v7;
  id v29 = v14;
  int v15 = _brc_ipc_check_applibrary_read_access(self, 1, v13, v28);

  if (v15)
  {
    double v16 = [(BRCXPCClient *)self session];
    double v17 = [v16 appLibraryByID:v6];

    if (!v17)
    {
      uint64_t v18 = brc_bread_crumbs();
      __int16 v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v6);
        *(_DWORD *)buf = 138413058;
        double v32 = self;
        __int16 v33 = 1024;
        *(_DWORD *)__int16 v34 = 0;
        *(_WORD *)&void v34[4] = 2112;
        *(void *)&v34[6] = v20;
        *(_WORD *)&v34[14] = 2112;
        *(void *)&v34[16] = v18;
        _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v6);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v21);
    }
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v17 defaultClientZone];
      int v25 = BRContainerStatusFromSyncState([v24 syncState]);
      *(_DWORD *)buf = 138413058;
      double v32 = self;
      __int16 v33 = 1024;
      *(_DWORD *)__int16 v34 = v25;
      *(_WORD *)&void v34[4] = 2112;
      *(void *)&v34[6] = 0;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v26 = [v17 defaultClientZone];
    uint64_t v27 = BRContainerStatusFromSyncState([v26 syncState]);
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, v27, 0);
  }
  __brc_leave_section(v30);
}

void __58__BRCXPCRegularIPCsClient_getContainerStatusWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainerLastServerUpdateWithID:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerLastServerUpdateWithID:reply:]", 3592, v34);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v34[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    id v36 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v37 = 2112;
    *(void *)__int16 v38 = self;
    *(_WORD *)&v38[8] = 2112;
    *(void *)&v38[10] = v12;
    *(_WORD *)&v38[18] = 2080;
    *(void *)&unsigned char v38[20] = "-[BRCXPCRegularIPCsClient getContainerLastServerUpdateWithID:reply:]";
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    __int16 v42 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v6) {
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v6];
  }
  else {
    __int16 v13 = 0;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  void v32[2] = __68__BRCXPCRegularIPCsClient_getContainerLastServerUpdateWithID_reply___block_invoke;
  uint64_t v32[3] = &unk_265080B38;
  v32[4] = self;
  id v14 = v7;
  id v33 = v14;
  int v15 = _brc_ipc_check_applibrary_read_access(self, 1, v13, v32);

  if (v15)
  {
    double v16 = [(BRCXPCClient *)self session];
    __int16 v31 = [v16 appLibraryByID:v6];

    if (!v31)
    {
      double v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v6);
        *(_DWORD *)buf = 138413058;
        id v36 = self;
        __int16 v37 = 1024;
        *(_DWORD *)__int16 v38 = 0;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v19;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v17;
        _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      __int16 v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v6);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v20);
    }
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = [v31 defaultClientZone];
      uint64_t v24 = [v23 serverZone];
      int v25 = [v24 changeState];
      uint64_t v26 = [v25 lastSyncDownDate];
      *(_DWORD *)buf = 138413058;
      id v36 = self;
      __int16 v37 = 2112;
      *(void *)__int16 v38 = v26;
      *(_WORD *)&v38[8] = 2112;
      *(void *)&v38[10] = 0;
      *(_WORD *)&v38[18] = 2112;
      *(void *)&unsigned char v38[20] = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v27 = [v31 defaultClientZone];
    long long v28 = [v27 serverZone];
    id v29 = [v28 changeState];
    double v30 = [v29 lastSyncDownDate];
    (*((void (**)(id, void *, void))v14 + 2))(v14, v30, 0);
  }
  __brc_leave_section(v34);
}

void __68__BRCXPCRegularIPCsClient_getContainerLastServerUpdateWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)currentNotifRankWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient currentNotifRankWithReply:]", 3608, v18);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient currentNotifRankWithReply:]";
    __int16 v27 = 2112;
    long long v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke;
  v16[3] = &unk_265080B38;
  v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_applibrary_proxy(self, 1, v16);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 notificationManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke_493;
    v14[3] = &unk_265085DB8;
    v14[4] = self;
    id v15 = v10;
    [v13 fetchLastFlushedRankWithReply:v14];
  }
  __brc_leave_section(v18);
}

void __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%llu, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke_493(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%llu, %@)%@", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateItemsInFolder:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 completion:(id)a7
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a7;
  memset(v44, 0, sizeof(v44));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateItemsInFolder:sortOrder:offset:limit:completion:]", 3628, v44);
  uint64_t v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t v15 = a5;
    unint64_t v16 = a6;
    uint64_t v17 = v44[0];
    qos_class_t v18 = qos_class_self();
    __int16 v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v46 = v17;
    __int16 v47 = 2112;
    unint64_t v48 = (unint64_t)self;
    __int16 v49 = 2112;
    unint64_t v50 = (unint64_t)v19;
    __int16 v51 = 2080;
    int8x16_t v52 = "-[BRCXPCRegularIPCsClient enumerateItemsInFolder:sortOrder:offset:limit:completion:]";
    __int16 v53 = 2112;
    id v54 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a6 = v16;
    a5 = v15;
  }

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke;
  uint64_t v42[3] = &unk_265080B38;
  v42[4] = self;
  id v20 = v12;
  id v43 = v20;
  int v21 = _brc_ipc_check_applibrary_proxy(self, 1, v42);

  if (v21)
  {
    brc_bread_crumbs();
    uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v46 = (uint64_t)v11;
      __int16 v47 = 2048;
      unint64_t v48 = a5;
      __int16 v49 = 2048;
      unint64_t v50 = a6;
      __int16 v51 = 2112;
      int8x16_t v52 = v22;
      _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerating items in %@ offset:%lld limit:%lld%@", buf, 0x2Au);
    }

    uint64_t v24 = [(BRCXPCClient *)self session];
    __int16 v25 = [v24 readOnlyDB];
    tracker = self->super._tracker;
    __int16 v27 = [v24 readOnlyWorkloop];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495;
    uint64_t v33[3] = &unk_265085E08;
    id v34 = v11;
    unint64_t v39 = a5;
    id v28 = v24;
    id v35 = v28;
    id v29 = v25;
    id v36 = v29;
    __int16 v37 = self;
    unsigned __int8 v41 = a4;
    id v38 = v20;
    unint64_t v40 = a6;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_509;
    uint64_t v31[3] = &unk_26507F850;
    v31[4] = self;
    id v32 = v38;
    brc_task_tracker_async_with_logs(tracker, v27, v33, v31);
  }
  __brc_leave_section(v44);
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 1024;
    int v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    qos_class_t v18 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %ull, %d, %@)%@", (uint8_t *)&v7, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  if ([*(id *)(a1 + 32) isRootContainerItem])
  {
    id v3 = [*(id *)(a1 + 40) clientState];
    id v4 = [v3 objectForKeyedSubscript:@"lastQuotaFetchDate"];

    if (!v4) {
      goto LABEL_4;
    }
    id v5 = [MEMORY[0x263EFF910] date];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;
    uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
    [v8 minFetchQuotaInterval];
    double v10 = v9;

    if (v7 > v10)
    {
LABEL_4:
      __int16 v11 = brc_bread_crumbs();
      int v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_1();
      }

      __int16 v13 = [*(id *)(a1 + 40) fsUploader];
      [v13 forceScheduleQuotaFetchForOwner:*MEMORY[0x263EFD488]];
    }
    int v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_499;
    uint64_t v54[3] = &unk_265085DE0;
    id v16 = v2;
    id v55 = v16;
    [v14 enumerateContainersWithDB:v15 handler:v54];
    __int16 v17 = brc_bread_crumbs();
    qos_class_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138413570;
      uint64_t v58 = v19;
      __int16 v59 = 2112;
      id v60 = v16;
      __int16 v61 = 2048;
      uint64_t v62 = v20;
      __int16 v63 = 1024;
      BOOL v64 = 0;
      __int16 v65 = 2112;
      uint64_t v66 = 0;
      __int16 v67 = 2112;
      id v68 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", buf, 0x3Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_43;
  }
  int v21 = [*(id *)(a1 + 32) isCloudDocsRoot];
  uint64_t v22 = *(void **)(a1 + 40);
  if (v21)
  {
    __int16 v23 = [v22 appLibraryByID:*MEMORY[0x263F324E8]];
    uint64_t v24 = brc_bread_crumbs();
    __int16 v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_3();
    }

    uint64_t v26 = [v23 fetchRootItemInDB:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v26 = [v22 itemByFileObjectID:*(void *)(a1 + 32) db:*(void *)(a1 + 48)];
  }
  __int16 v27 = [v26 itemID];
  if ([v27 isDocumentsFolder]) {
    goto LABEL_20;
  }
  int v28 = [v26 isMigratingToFPFS];

  if (v28)
  {
    id v29 = brc_bread_crumbs();
    double v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_2();
    }

    __int16 v27 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v27 captureLogsForOperationType:@"FPFSMigration" ofSubtype:@"MigratingItem" forError:0];
LABEL_20:
  }
  uint64_t v31 = *(void *)(a1 + 72);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v32 = [v26 appLibrary];
  __int16 v49 = v26;
  id v33 = [v26 itemGlobalID];
  id v34 = [v32 enumerateChildrenOfItemGlobalID:v33 sortOrder:*(unsigned __int8 *)(a1 + 88) offset:*(void *)(a1 + 72) limit:*(void *)(a1 + 80) db:*(void *)(a1 + 48)];

  uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        unint64_t v39 = +[BRCNotification notificationFromItem:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        unint64_t v40 = [v39 asFileProviderItem];

        if (v40) {
          [v2 addObject:v40];
        }
      }
      v31 += v36;
      uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v36);
  }

  if (v31 - *(void *)(a1 + 72) == *(void *)(a1 + 80))
  {
    BOOL v41 = 1;
    id v4 = v49;
  }
  else
  {
    id v4 = v49;
    if ([v49 isShareAcceptationFault])
    {
      uint64_t v31 = 0;
      BOOL v41 = 1;
    }
    else
    {
      __int16 v42 = [v49 clientZone];
      id v43 = [v49 itemID];
      int v44 = [v42 serverItemTypeByItemID:v43 db:*(void *)(a1 + 48)];

      uint64_t v31 = 0;
      BOOL v41 = v44 == 9 || v44 == -1;
    }
  }
  uint64_t v46 = brc_bread_crumbs();
  __int16 v47 = brc_default_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413570;
    uint64_t v58 = v48;
    __int16 v59 = 2112;
    id v60 = v2;
    __int16 v61 = 2048;
    uint64_t v62 = v31;
    __int16 v63 = 1024;
    BOOL v64 = v41;
    __int16 v65 = 2112;
    uint64_t v66 = 0;
    __int16 v67 = 2112;
    id v68 = v46;
    _os_log_impl(&dword_23FA42000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", buf, 0x3Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_43:
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_499(uint64_t a1, void *a2)
{
  id v3 = [a2 asFileProviderItem];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_509(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413570;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    __int16 v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", (uint8_t *)&v8, 0x3Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, v7);
}

- (void)enumerateWorkingSetChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]", 3763, v37);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v37[0];
    qos_class_t v13 = qos_class_self();
    __int16 v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    BOOL v41 = self;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2080;
    __int16 v45 = "-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]";
    __int16 v46 = 2112;
    __int16 v47 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  void v35[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke;
  uint64_t v35[3] = &unk_265080B38;
  void v35[4] = self;
  id v15 = v9;
  id v36 = v15;
  int v16 = _brc_ipc_check_applibrary_proxy(self, 1, v35);

  if (v16)
  {
    memset(v34, 0, sizeof(v34));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]", 3765, v34);
    __int16 v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = v34[0];
      qos_class_t v20 = qos_class_self();
      int v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      BOOL v41 = self;
      __int16 v42 = 2112;
      id v43 = v21;
      __int16 v44 = 2080;
      __int16 v45 = "-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]";
      __int16 v46 = 2112;
      __int16 v47 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s enumerating working set changes%@", buf, 0x34u);
    }
    uint64_t v22 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    uint64_t v24 = [v22 clientTruthWorkloop];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_510;
    uint64_t v28[3] = &unk_265080F08;
    id v25 = v22;
    id v29 = v25;
    unint64_t v33 = a4;
    id v30 = v8;
    uint64_t v31 = self;
    id v32 = v15;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_512;
    uint64_t v26[3] = &unk_26507F850;
    void v26[4] = self;
    id v27 = v32;
    brc_task_tracker_async_with_logs(tracker, v24, v28, v26);

    __brc_leave_section(v34);
  }
  __brc_leave_section(v37);
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v7, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_510(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentsEnumerator];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_2;
  v6[3] = &unk_265085E30;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[4] = *(void *)(a1 + 48);
  id v7 = v4;
  [v2 enumerateChangesFromChangeToken:v3 limit:v5 completion:v6];
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138413570;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v16, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_512(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413570;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v8, 0x3Eu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, v7);
}

- (void)_getPublishedURLForLocalItem:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  v52[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (([v10 isDocument] & 1) == 0)
  {
    __int16 v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 2;
LABEL_6:
    uint64_t v20 = objc_msgSend(v18, "brc_errorNoDocument:underlyingPOSIXError:", 0, v19);
    goto LABEL_8;
  }
  __int16 v12 = [v10 asDocument];
  uint64_t v13 = [v12 currentVersion];
  __int16 v14 = [v13 ckInfo];

  if (v14)
  {
    uint64_t v15 = [v10 asDocument];
    __int16 v16 = [v15 currentVersion];
    int v17 = [v16 isPackage];

    if (!v17)
    {
      uint64_t v39 = [v10 serverZone];
      __int16 v22 = [v39 mangledID];
      id v21 = +[BRCUserDefaults defaultsForMangledID:v22];

      id v23 = [v10 asDocument];
      uint64_t v24 = [v23 documentRecordID];

      id v25 = objc_alloc(MEMORY[0x263EFD7A8]);
      __int16 v40 = (void *)v24;
      v52[0] = v24;
      __int16 v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
      id v27 = (void *)[v25 initWithRecordIDs:v26];

      uint64_t v28 = objc_msgSend(MEMORY[0x263EFD780], "br_publishingRequest");
      [v27 setGroup:v28];

      long long v50 = @"fileContent";
      id v29 = [v10 st];
      id v30 = [v29 logicalName];
      long long v51 = v30;
      uint64_t v31 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      [v27 setFileNamesByAssetFieldNames:v31];

      if (!a5) {
        a5 = [v21 publishURLTimeout];
      }
      [v27 setRequestedTTL:a5];
      id v32 = [v27 configuration];
      [v32 setDiscretionaryNetworkBehavior:0];

      unint64_t v33 = [v27 configuration];
      [v33 setAutomaticallyRetryNetworkFailures:0];

      if (v8) {
        [v27 setURLOptions:1];
      }
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke;
      uint64_t v47[3] = &unk_265085E58;
      id v34 = v11;
      id v48 = v34;
      __int16 v49 = v27;
      [v27 setAssetPublishedBlock:v47];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_2;
      uint64_t v44[3] = &unk_265085E80;
      id v45 = v34;
      __int16 v46 = v27;
      [v27 setPublishAssetCompletionBlock:v44];
      tracker = self->super._tracker;
      queue = self->super._queue;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_3;
      v41[3] = &unk_26507ED98;
      id v42 = v39;
      id v43 = v27;
      id v37 = v27;
      id v38 = v39;
      brc_task_tracker_async_with_logs(tracker, queue, v41, 0);

      goto LABEL_15;
    }
    __int16 v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 21;
    goto LABEL_6;
  }
  uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
LABEL_8:
  id v21 = (void *)v20;
  if (v20)
  {
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v20);
LABEL_15:
  }
}

uint64_t __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 downloadURL];
  id v11 = [v9 downloadURLExpiration];

  (*(void (**)(uint64_t, void *, void *, id))(v7 + 16))(v7, v10, v11, v8);
  [*(id *)(a1 + 40) setPublishAssetCompletionBlock:0];
  __int16 v12 = *(void **)(a1 + 40);
  return [v12 setAssetPublishedBlock:0];
}

uint64_t __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(a1 + 40) setPublishAssetCompletionBlock:0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAssetPublishedBlock:0];
}

void __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) metadataSyncContext];
  [v2 addOperation:*(void *)(a1 + 40)];
}

- (void)_getiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    __int16 v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v20;
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
    goto LABEL_18;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    __int16 v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v24;
      __int16 v47 = 2112;
      id v48 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_18;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    id v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v27;
      __int16 v47 = 2112;
      id v48 = v25;
      _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
    goto LABEL_18;
  }
  id v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    uint64_t v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v30;
      __int16 v47 = 2112;
      id v48 = v28;
      _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_18:
    __int16 v16 = (BRCFetchiWorkSharingInfoOperation *)v21;
    (*((void (**)(id, void, void, void, uint64_t))v10 + 2))(v10, 0, 0, 0, v21);
    goto LABEL_19;
  }
  uint64_t v13 = [BRCFetchiWorkSharingInfoOperation alloc];
  __int16 v14 = [v8 asDocument];
  uint64_t v15 = [(BRCXPCClient *)self session];
  __int16 v16 = [(BRCFetchiWorkSharingInfoOperation *)v13 initWithDocumentItem:v14 sessionContext:v15];

  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  unint64_t v33 = __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke;
  id v34 = &unk_265085EA8;
  uint64_t v35 = self;
  id v36 = v10;
  [(_BRCOperation *)v16 setFinishBlock:&v31];
  int v17 = [(BRCXPCClient *)self session];
  [v17 addMiscOperation:v16];

  [(_BRCOperation *)v16 schedule];
LABEL_19:
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263EFD5A8];
  id v7 = a2;
  id v8 = [v7 objectForKeyedSubscript:v6];
  char v9 = [v8 BOOLValue];

  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFD5A0]];
  int v11 = [v10 BOOLValue];

  char v12 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFD598]];
  uint64_t v13 = [v7 encryptedValues];

  __int16 v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFD5B0]];

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_3();
      }

      uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: base token of unexpected class");

      id v5 = (id)v17;
    }
  }
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_2();
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: sharing key of unexpected class");

      id v5 = (id)v20;
    }
  }
  if (v5)
  {
    uint64_t v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = objc_msgSend(v5, "brc_wrappedError");
      int v41 = 138413570;
      uint64_t v42 = v23;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      long long v50 = v24;
      __int16 v51 = 2112;
      long long v52 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }
    uint64_t v25 = *(void *)(a1 + 40);
    __int16 v26 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void, void *))(v25 + 16))(v25, 0, 0, 0, v26);

LABEL_15:
    goto LABEL_26;
  }
  if (v9)
  {
    if ((v12 != 0) == (v14 != 0))
    {
      id v36 = [v14 base64EncodedStringWithOptions:0];
      id v5 = (id)[v36 mutableCopy];

      objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v5, "length"));
      objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v5, "length"));
      id v37 = [v12 stringByAppendingString:v5];
      id v38 = brc_bread_crumbs();
      __int16 v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        int v41 = 138413570;
        uint64_t v42 = v40;
        __int16 v43 = 1024;
        int v44 = 1;
        __int16 v45 = 1024;
        int v46 = v11;
        __int16 v47 = 2112;
        id v48 = v37;
        __int16 v49 = 2112;
        long long v50 = 0;
        __int16 v51 = 2112;
        long long v52 = v38;
        _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_15;
    }
    id v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_1();
    }

    id v29 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: only got sharing key or base token, didn't get both");
    id v30 = brc_bread_crumbs();
    uint64_t v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      int v41 = 138413570;
      uint64_t v42 = v32;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      long long v50 = v29;
      __int16 v51 = 2112;
      long long v52 = v30;
      _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    unint64_t v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      int v41 = 138413570;
      uint64_t v42 = v35;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      long long v50 = 0;
      __int16 v51 = 2112;
      long long v52 = v33;
      _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_26:
}

- (void)_setiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 publish:(BOOL)a5 readonly:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = (void (**)(id, uint64_t))a7;
  if (!v12)
  {
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v24;
      __int16 v45 = 2112;
      int v46 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v13);
    goto LABEL_18;
  }
  if (([v12 isDocument] & 1) == 0)
  {
    __int16 v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v13, 21);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v28;
      __int16 v45 = 2112;
      int v46 = v26;
      _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v13, 21);
    goto LABEL_18;
  }
  if (([v12 isKnownByServer] & 1) == 0)
  {
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v31;
      __int16 v45 = 2112;
      int v46 = v29;
      _os_log_impl(&dword_23FA42000, v30, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v13);
    goto LABEL_18;
  }
  uint64_t v15 = [v12 st];
  char v16 = [v15 iWorkShareable];

  if ((v16 & 1) == 0)
  {
    uint64_t v32 = brc_bread_crumbs();
    unint64_t v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v34;
      __int16 v45 = 2112;
      int v46 = v32;
      _os_log_impl(&dword_23FA42000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v13);
LABEL_18:
    uint64_t v20 = (BRCiWorkPublishingOperation *)v25;
    v14[2](v14, v25);
    goto LABEL_19;
  }
  uint64_t v17 = [BRCiWorkPublishingOperation alloc];
  __int16 v18 = [v12 asDocument];
  uint64_t v19 = [(BRCXPCClient *)self session];
  uint64_t v20 = [(BRCiWorkPublishingOperation *)v17 initWithDocumentItem:v18 sessionContext:v19 forPublish:v9 readonly:v8];

  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  id v37 = __101__BRCXPCRegularIPCsClient__setiWorkPublishingInfoForLocalItem_itemIdentifier_publish_readonly_reply___block_invoke;
  id v38 = &unk_265081958;
  __int16 v39 = self;
  uint64_t v40 = v14;
  [(_BRCOperation *)v20 setFinishBlock:&v35];
  uint64_t v21 = [(BRCXPCClient *)self session];
  [v21 addMiscOperation:v20];

  [(_BRCOperation *)v20 schedule];
LABEL_19:
}

void __101__BRCXPCRegularIPCsClient__setiWorkPublishingInfoForLocalItem_itemIdentifier_publish_readonly_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    char v16 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)_getiWorkPublishingBadgingStatusForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    __int16 v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
    goto LABEL_20;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_20;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
    goto LABEL_20;
  }
  int v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    uint64_t v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_20:
    uint64_t v28 = (void *)v18;
    v10[2](v10, 0, v18);

    goto LABEL_21;
  }
  __int16 v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v29 = 138413058;
    id v30 = self;
    __int16 v31 = 1024;
    LOBYTE(v32) = [v8 sharingOptions] & 3;
    int v32 = v32;
    __int16 v33 = 2112;
    id v34 = 0;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
  }

  v10[2](v10, [v8 sharingOptions] & 3, 0);
LABEL_21:
}

- (void)_getiWorkNeedsShareMigrateForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    char v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v18;
      __int16 v36 = 2112;
      uint64_t v37 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
    goto LABEL_20;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v22;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_20;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      __int16 v36 = 2112;
      uint64_t v37 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", v9);
    goto LABEL_20;
  }
  int v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    __int16 v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v28;
      __int16 v36 = 2112;
      uint64_t v37 = v26;
      _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_20:
    int v29 = (void *)v19;
    v10[2](v10, 0, v19);

    goto LABEL_21;
  }
  uint64_t v13 = [v8 sharingOptions] & 0x4D;
  __int16 v14 = brc_bread_crumbs();
  __int16 v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v30 = 138413058;
    __int16 v31 = self;
    __int16 v32 = 1024;
    BOOL v33 = v13 == 1;
    __int16 v34 = 2112;
    __int16 v35 = 0;
    __int16 v36 = 2112;
    uint64_t v37 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
  }

  ((void (**)(id, BOOL, uint64_t))v10)[2](v10, v13 == 1, 0);
LABEL_21:
}

- (void)_launchItemCountMismatchChecksForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    char v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
      *(_DWORD *)buf = 138413058;
      id v27 = self;
      __int16 v28 = 1024;
      int v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v18;
      __int16 v32 = 2112;
      BOOL v33 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v9);
    goto LABEL_10;
  }
  if (([v8 isDirectory] & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 20);
      *(_DWORD *)buf = 138413058;
      id v27 = self;
      __int16 v28 = 1024;
      int v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      BOOL v33 = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", v9, 20);
LABEL_10:
    uint64_t v23 = (void *)v19;
    v10[2](v10, 0, v19);

    goto LABEL_11;
  }
  int v11 = [(BRCXPCClient *)self session];
  char v12 = [v11 applyScheduler];
  uint64_t v13 = [v12 hasActiveWorkGroup];
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v13, v14);

  __int16 v15 = [v8 asDirectory];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__BRCXPCRegularIPCsClient__launchItemCountMismatchChecksForLocalItem_itemIdentifier_reply___block_invoke;
  uint64_t v24[3] = &unk_265085ED0;
  void v24[4] = self;
  uint64_t v25 = v10;
  +[BRCItemCountMismatchReport generateReportForSharedFolder:v15 qualityOfService:25 completionHandler:v24];

LABEL_11:
}

void __91__BRCXPCRegularIPCsClient__launchItemCountMismatchChecksForLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = [v3 itemCountDifference] == 0;
      id v8 = [v3 lastError];
      int v19 = 138413058;
      uint64_t v20 = v6;
      __int16 v21 = 1024;
      BOOL v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v19, 0x26u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = [v3 itemCountDifference] == 0;
    int v11 = [v3 lastError];
    (*(void (**)(uint64_t, BOOL, void *))(v9 + 16))(v9, v10, v11);
  }
  else
  {
    char v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    uint64_t v15 = *MEMORY[0x263F32360];
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 9999, @"Failed generating mismatch report");
      int v19 = 138413058;
      uint64_t v20 = v16;
      __int16 v21 = 1024;
      BOOL v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v19, 0x26u);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    int v11 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", v15, 9999, @"Failed generating mismatch report");
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v11);
  }
}

- (void)_startOperation:(id)a3 toCopySharingAccessTokenWithLocalItem:(id)a4 itemIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  BOOL v14 = [BRCSharingCopyAccessTokenOperation alloc];
  uint64_t v15 = [v10 asDocument];
  uint64_t v16 = [(BRCXPCClient *)self session];
  uint64_t v17 = [(BRCSharingCopyAccessTokenOperation *)v14 initWithItem:v15 sessionContext:v16];

  [(_BRCFrameworkOperation *)v17 setRemoteClientProxy:v13];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke;
  __int16 v25 = &unk_265085EF8;
  id v26 = v10;
  id v27 = v11;
  __int16 v28 = self;
  id v29 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(_BRCOperation *)v17 setFinishBlock:&v22];
  __int16 v21 = [(BRCXPCClient *)self session];
  [v21 addMiscOperation:v17];

  [(_BRCOperation *)v17 schedule];
}

void __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  if (objc_msgSend(v5, "br_isCloudDocsErrorCode:", 24))
  {
    BOOL v7 = [*(id *)(a1 + 32) clientZone];
    int v8 = [v7 isSharedZone];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNoLongerSharedAtIdentifier:", v9);

      id v11 = [*(id *)(a1 + 48) session];
      id v12 = [v11 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke_2;
      block[3] = &unk_26507ED70;
      id v22 = *(id *)(a1 + 32);
      dispatch_async(v12, block);
    }
    else
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotSharedAtIdentifier:", v9);
    }
    id v5 = (id)v10;
  }
  id v13 = [v6 objectForKeyedSubscript:@"token"];
  BOOL v14 = [v6 objectForKeyedSubscript:@"ref_id"];

  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = objc_msgSend(v5, "brc_wrappedError");
    *(_DWORD *)buf = 138413314;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v14;
    __int16 v29 = 2112;
    __int16 v30 = v18;
    __int16 v31 = 2112;
    __int16 v32 = v15;
    _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
  }
  uint64_t v19 = *(void *)(a1 + 56);
  id v20 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v19 + 16))(v19, v13, v14, v20);
}

void __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientZone];
  [v1 scheduleSyncDown];
}

- (void)_startOperation:(id)a3 toCopySharingInfoWithLocalItem:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toCopySharingInfoWithLocalItem:reply:]();
  }

  id v13 = [BRCSharingCopyShareOperation alloc];
  BOOL v14 = [(BRCXPCClient *)self session];
  uint64_t v15 = [(BRCSharingCopyShareOperation *)v13 initWithItem:v8 sessionContext:v14];

  [(_BRCFrameworkOperation *)v15 setRemoteClientProxy:v10];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke;
  uint64_t v18[3] = &unk_265083E18;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  [(_BRCOperation *)v15 setFinishBlock:v18];
  [(_BRCOperation *)v15 schedule];
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_2();
      }
    }
  }
  if ((objc_msgSend(v6, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v6, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    BOOL v7 = [*(id *)(a1 + 32) clientZone];
    int v8 = [v7 isSharedZone];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNoLongerSharedAtIdentifier:", 0);

      id v10 = [*(id *)(a1 + 40) session];
      id v11 = [v10 clientTruthWorkloop];
      uint64_t v38 = MEMORY[0x263EF8330];
      uint64_t v39 = 3221225472;
      uint64_t v40 = __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_558;
      int v41 = &unk_26507ED70;
      id v42 = *(id *)(a1 + 32);
      id v12 = v11;
      id v13 = &v38;
      id v17 = (void *)MEMORY[0x2455D97F0](v13, v14, v15, v16);
      long long v43 = 0uLL;
      uint64_t v44 = 0;
      __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v43);
      id v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = v43;
        label = dispatch_queue_get_label(v12);
        *(_DWORD *)block = 134218498;
        *(void *)&void block[4] = v34;
        *(_WORD *)&block[12] = 2080;
        *(void *)&block[14] = label;
        *(_WORD *)&block[22] = 2112;
        int v46 = v18;
        _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
      }

      *(_OWORD *)&v47[16] = v43;
      uint64_t v48 = v44;
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_19;
      int v46 = &unk_26507EE60;
      id v20 = v12;
      *(void *)uint64_t v47 = v20;
      id v21 = v13;
      *(void *)&v47[8] = v21;
      dispatch_async(v20, block);

      id v6 = v42;
    }
    else
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    }

    id v6 = (id)v9;
  }
  id v22 = objc_msgSend(v5, "objectForKeyedSubscript:", @"share", v38, v39, v40, v41);
  uint64_t v23 = [v5 objectForKeyedSubscript:@"rootURL"];
  uint64_t v24 = [v22 participants];
  unint64_t v25 = [v24 count];

  if (v25 >= 3)
  {
    id v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_1(v22, (uint64_t)v26, v27);
    }
  }
  __int16 v28 = brc_bread_crumbs();
  __int16 v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = *(void *)(a1 + 40);
    __int16 v31 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)block = 138413314;
    *(void *)&void block[4] = v30;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v22;
    *(_WORD *)&block[22] = 2112;
    int v46 = v23;
    *(_WORD *)uint64_t v47 = 2112;
    *(void *)&v47[2] = v31;
    *(_WORD *)&v47[10] = 2112;
    *(void *)&v47[12] = v28;
    _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", block, 0x34u);
  }
  uint64_t v32 = *(void *)(a1 + 48);
  uint64_t v33 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v32 + 16))(v32, v22, v23, v33);
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_558(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientZone];
  [v1 scheduleSyncDown];
}

- (void)startOperation:(id)a3 toCopySharingInfoWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingInfoWithItemID:reply:]", 4045, v27);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingInfoWithItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    id v20 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke_567;
    block[3] = &unk_26507FBE0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke_567(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopySharingInfoWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)startOperation:(id)a3 toCopySharingAccessTokenOfItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingAccessTokenOfItemID:reply:]", 4061, v27);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingAccessTokenOfItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    id v20 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke_569;
    block[3] = &unk_26507FBE0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke_569(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4 && ([v4 isDocument] & 1) != 0)
  {
    if ([v4 isKnownByServer] & 1) != 0 || (objc_msgSend(v4, "isShareAcceptationFault")) {
      goto LABEL_11;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", *(void *)(a1 + 40), 2);
  }
  uint64_t v6 = (void *)v5;
  if (!v5)
  {
LABEL_11:
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopySharingAccessTokenWithLocalItem:v4 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 56)];
    goto LABEL_12;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413314;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    char v19 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v10, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_12:
}

- (void)startOperation:(id)a3 toCopyShortTokenOfItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyShortTokenOfItemID:reply:]", 4085, v27);
  uint64_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopyShortTokenOfItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_570;
    block[3] = &unk_26507FBE0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_570(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4 && ([v4 isDocument] & 1) != 0)
  {
    if ([v4 isKnownByServer] & 1) != 0 || (objc_msgSend(v4, "isShareAcceptationFault")) {
      goto LABEL_11;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", *(void *)(a1 + 40), 2);
  }
  uint64_t v6 = (BRCSharingCopyShortTokenOperation *)v5;
  if (!v5)
  {
LABEL_11:
    uint64_t v10 = [BRCSharingCopyShortTokenOperation alloc];
    __int16 v11 = [v4 asDocument];
    id v12 = [*(id *)(a1 + 32) session];
    uint64_t v6 = [(BRCSharingCopyShortTokenOperation *)v10 initWithItem:v11 sessionContext:v12];

    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_572;
    __int16 v16 = &unk_265081958;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    [(_BRCOperation *)v6 setFinishBlock:&v13];
    objc_msgSend(*(id *)(a1 + 32), "_startSharingOperationAfterAcceptation:client:item:", v6, *(void *)(a1 + 48), v4, v13, v14, v15, v16, v17);

    goto LABEL_12;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = 0;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_12:
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_572(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)startOperation:(id)a3 toCopySharingWebAuthTokenForContainerID:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingWebAuthTokenForContainerID:reply:]", 4113, v29);
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v29[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v13;
    __int16 v32 = 2112;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v15;
    __int16 v36 = 2080;
    uint64_t v37 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingWebAuthTokenForContainerID:reply:]";
    __int16 v38 = 2112;
    uint64_t v39 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke;
  uint64_t v27[3] = &unk_265080B38;
  void v27[4] = self;
  id v18 = v10;
  id v28 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v27);

  if (v19)
  {
    uint64_t v20 = [(BRCXPCClient *)self session];
    uint64_t v21 = [BRCSharingCopyWebAuthTokenOperation alloc];
    uint64_t v22 = [v20 syncContextProvider];
    __int16 v23 = [v22 defaultSyncContext];
    id v24 = [(BRCSharingCopyWebAuthTokenOperation *)v21 initWithSyncContext:v23 ckContainerID:v9 sessionContext:v20];

    [(_BRCFrameworkOperation *)v24 setRemoteClientProxy:v8];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke_574;
    uint64_t v25[3] = &unk_265081958;
    void v25[4] = self;
    id v26 = v18;
    [(_BRCOperation *)v24 setFinishBlock:v25];
    [v20 addMiscOperation:v24];
    [(_BRCOperation *)v24 schedule];
  }
  __brc_leave_section(v29);
}

void __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke_574(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6
{
  BOOL v35 = a5;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]", 4132, v46);
  id v12 = brc_bread_crumbs();
  int v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v46[0];
    qos_class_t v15 = qos_class_self();
    id v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v48 = v14;
    __int16 v49 = 2112;
    long long v50 = self;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v16;
    __int16 v53 = 2080;
    id v54 = "-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
    __int16 v55 = 2112;
    id v56 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v17 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v18 = [v17 isSharingPrivateInterfaceEntitled];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke;
  uint64_t v44[3] = &unk_265080B38;
  void v44[4] = self;
  id v19 = v11;
  id v45 = v19;
  char v20 = _brc_ipc_check_client_privilege(self, 1, v18, (uint64_t)"isSharingPrivateInterfaceEntitled", v44);

  if (v20)
  {
    memset(v43, 0, sizeof(v43));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]", 4134, v43);
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v43[0];
      qos_class_t v24 = qos_class_self();
      uint64_t v25 = BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      id v26 = (void *)v25;
      uint64_t v27 = "No";
      *(_DWORD *)buf = 134219522;
      uint64_t v48 = v23;
      __int16 v49 = 2112;
      if (v35) {
        uint64_t v27 = "Yes";
      }
      long long v50 = self;
      __int16 v51 = 2112;
      uint64_t v52 = v25;
      __int16 v53 = 2080;
      id v54 = "-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2080;
      uint64_t v58 = v27;
      __int16 v59 = 2112;
      id v60 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s looking up url for recordID %@ fetching from server:%s%@", buf, 0x48u);
    }
    id v28 = [(BRCXPCClient *)self session];
    uint64_t v29 = self->super._tracker;
    __int16 v30 = [(BRCXPCClient *)self session];
    uint64_t v31 = [v30 clientTruthWorkloop];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_577;
    uint64_t v36[3] = &unk_265086010;
    v36[4] = self;
    id v41 = v19;
    __int16 v32 = v29;
    uint64_t v37 = v32;
    id v33 = v31;
    id v38 = v33;
    id v39 = v10;
    id v34 = v28;
    id v40 = v34;
    BOOL v42 = v35;
    [v34 fetchUserRecordIDWithCompletionHandler:v36];

    __brc_leave_section(v43);
  }
  __brc_leave_section(v46);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_577(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_578;
    v16[3] = &unk_265085FE8;
    id v17 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    id v18 = v9;
    uint64_t v19 = v10;
    id v23 = *(id *)(a1 + 72);
    id v20 = v5;
    id v21 = *(id *)(a1 + 40);
    char v24 = *(unsigned char *)(a1 + 80);
    id v22 = *(id *)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_591;
    v14[3] = &unk_26507F850;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 72);
    brc_task_tracker_async_with_logs(v7, v8, v16, v14);
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      __int16 v32 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_578(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  __int16 v32 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "brc_itemIDWithSession:error:", *(void *)(a1 + 40), &v32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) zoneID];
    id v4 = [v3 ownerName];
    id v5 = [*(id *)(a1 + 56) recordName];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263EFD808]);
      uint64_t v8 = [v3 zoneName];
      uint64_t v9 = [v7 initWithZoneName:v8 ownerName:*MEMORY[0x263EFD488]];

      id v3 = (void *)v9;
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithRecordZoneID:v3];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v34 = __Block_byref_object_copy__48;
    *(void *)&long long v35 = __Block_byref_object_dispose__48;
    *((void *)&v35 + 1) = [*(id *)(a1 + 40) clientZoneByMangledID:v10];
    __int16 v11 = *(void **)(a1 + 64);
    id v12 = *(void **)(*(void *)(a1 + 48) + 16);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_579;
    uint64_t v21[3] = &unk_265085FC0;
    id v30 = buf;
    char v31 = *(unsigned char *)(a1 + 88);
    id v13 = v10;
    id v22 = v13;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 48);
    id v25 = v14;
    uint64_t v26 = v15;
    id v29 = *(id *)(a1 + 80);
    id v27 = *(id *)(a1 + 32);
    id v28 = v2;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_590;
    uint64_t v19[3] = &unk_26507F850;
    void v19[4] = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 80);
    brc_task_tracker_async_with_logs(v11, v12, v21, v19);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      id v34 = v32;
      LOWORD(v35) = 2112;
      *(void *)((char *)&v35 + 2) = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_579(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) && *(unsigned char *)(a1 + 104))
  {
    int v2 = [*(id *)(a1 + 32) isShared];
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    if (v2)
    {
      uint64_t v5 = [v3 getOrCreateSharedZones:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 96) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    else
    {
      id v7 = [v3 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v4];
      uint64_t v8 = [v7 defaultClientZone];
      uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
  __int16 v11 = *(void **)(a1 + 48);
  id v12 = *(void **)(a1 + 56);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2;
  uint64_t v17[3] = &unk_265085F98;
  uint64_t v25 = *(void *)(a1 + 96);
  id v18 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 64);
  id v19 = v13;
  uint64_t v20 = v14;
  id v24 = *(id *)(a1 + 88);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  char v26 = *(unsigned char *)(a1 + 104);
  id v23 = *(id *)(a1 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_589;
  v15[3] = &unk_26507F850;
  void v15[4] = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 88);
  brc_task_tracker_async_with_logs(v11, v12, v17, v15);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) clientZoneByMangledID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_580;
    uint64_t v36[3] = &unk_265082CD0;
    uint64_t v5 = *(void **)(a1 + 56);
    v36[4] = *(void *)(a1 + 48);
    id v37 = v5;
    id v38 = *(id *)(a1 + 80);
    uint64_t v6 = (void (**)(void, void))MEMORY[0x2455D9A50](v36);
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) itemByItemID:*(void *)(a1 + 64)];
    uint64_t v8 = v7;
    if (*(unsigned char *)(a1 + 96) && ([v7 isOnDisk] & 1) == 0)
    {
      id v19 = *(void **)(a1 + 64);
      uint64_t v20 = objc_msgSend(*(id *)(a1 + 56), "brc_itemType");
      id v21 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) serverZone];
      id v22 = [v19 structureRecordIDForItemType:v20 zone:v21 aliasTargetZoneIsShared:1];

      id v23 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_586;
      uint64_t v28[3] = &unk_265085F70;
      uint64_t v33 = v6;
      id v29 = *(id *)(a1 + 72);
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 88);
      id v30 = v24;
      uint64_t v35 = v25;
      id v26 = *(id *)(a1 + 64);
      uint64_t v27 = *(void *)(a1 + 48);
      id v31 = v26;
      uint64_t v32 = v27;
      id v34 = *(id *)(a1 + 80);
      [v23 performBlock:v28 whenItemWithRecordIDIsOnDisk:v22];
    }
    else
    {
      ((void (**)(void, void *))v6)[2](v6, v8);
    }
  }
  else
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = [*(id *)(a1 + 40) appLibraryOrZoneName];
      uint64_t v14 = objc_msgSend(v11, "brc_errorAppLibraryNotFound:", v13);
      *(_DWORD *)buf = 138413058;
      uint64_t v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = v14;
      __int16 v45 = 2112;
      int v46 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v15 = *(void *)(a1 + 80);
    id v16 = (void *)MEMORY[0x263F087E8];
    id v17 = [*(id *)(a1 + 40) appLibraryOrZoneName];
    id v18 = objc_msgSend(v16, "brc_errorAppLibraryNotFound:", v17);
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v18);
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_580(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isOnDisk])
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_581;
    uint64_t v25[3] = &unk_265085F20;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v26 = v4;
    uint64_t v27 = v5;
    id v28 = *(id *)(a1 + 48);
    uint64_t v6 = (void *)MEMORY[0x2455D9A50](v25);
    id v7 = [v4 db];
    [v7 flushToMakeEditsVisibleToIPCReaders];

    uint64_t v8 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    uint64_t v9 = [v4 fileObjectID];
    uint64_t v10 = [v9 asString];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_584;
    uint64_t v22[3] = &unk_265082F80;
    id v23 = v4;
    id v24 = v6;
    id v11 = v6;
    [v8 getUserVisibleURLForItemIdentifier:v10 completionHandler:v22];

    uint64_t v12 = v26;
  }
  else
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = [*(id *)(a1 + 40) description];
      id v18 = objc_msgSend(v15, "brc_errorItemNotFound:", v17);
      *(_DWORD *)buf = 138413058;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = 0;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      uint64_t v36 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 40) description];
    id v21 = objc_msgSend(v19, "brc_errorItemNotFound:", v12);
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_581(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v12 = 0;
    id v4 = [MEMORY[0x263F054E0] wrapperWithURL:v3 readonly:0 error:&v12];
    id v5 = v12;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    id v7 = [*(id *)(a1 + 32) itemID];
    uint64_t v8 = [v7 description];
    objc_msgSend(v6, "brc_errorItemNotFound:", v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = 0;
  }
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_584(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while computing the URL of %@ - %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_586(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) clientTruthWorkloop];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2_587;
    v8[3] = &unk_265085F48;
    uint64_t v11 = *(void *)(a1 + 80);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 64);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_3;
    v6[3] = &unk_26507F850;
    v6[4] = *(void *)(a1 + 56);
    id v7 = *(id *)(a1 + 72);
    brc_task_tracker_async_with_logs(v3, v4, v8, v6);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2_587(void *a1)
{
  id v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) itemByItemID:a1[4]];
  (*(void (**)(void))(a1[5] + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_589(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_590(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_591(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)startOperation:(id)a3 toCopyAvailableQuotaWithReply:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyAvailableQuotaWithReply:]", 4248, v24);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2080;
    uint64_t v32 = "-[BRCXPCRegularIPCsClient startOperation:toCopyAvailableQuotaWithReply:]";
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 canFetchUserQuota];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"canFetchUserQuota", v22);

  if (v16)
  {
    __int16 v17 = [(BRCXPCClient *)self session];
    id v18 = [[BRCFetchQuotaOperation alloc] initWithSession:v17];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke_595;
    uint64_t v20[3] = &unk_265086038;
    v20[4] = self;
    id v21 = v15;
    [(_BRCOperation *)v18 setFinishBlock:v20];
    __int16 v19 = objc_msgSend(MEMORY[0x263EFD780], "br_quotaUpdateXPC");
    [(_BRCOperation *)v18 setGroup:v19];

    [v17 addMiscOperation:v18];
    [(_BRCOperation *)v18 schedule];
  }
  __brc_leave_section(v24);
}

void __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke_595(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v10, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startOperation:(id)a3 toUploadAllFilesInContainer:(id)a4 reply:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUploadAllFilesInContainer:reply:]", 4266, v38);
  uint64_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v38[0];
    qos_class_t v14 = qos_class_self();
    id v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v41 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v42 = 2112;
    __int16 v43 = self;
    __int16 v44 = 2112;
    __int16 v45 = v15;
    __int16 v46 = 2080;
    uint64_t v47 = "-[BRCXPCRegularIPCsClient startOperation:toUploadAllFilesInContainer:reply:]";
    __int16 v48 = 2112;
    __int16 v49 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke;
  uint64_t v36[3] = &unk_265080B38;
  v36[4] = self;
  id v16 = v10;
  id v37 = v16;
  int v17 = _brc_ipc_check_applibraries_access(self, 1, v36);

  if (v17)
  {
    uint64_t v18 = [(BRCXPCClient *)self session];
    if (v9)
    {
      __int16 v19 = [(BRCXPCClient *)self session];
      id v20 = [v19 appLibraryByID:v9];

      if (!v20)
      {
        uint64_t v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v9);
          __int16 v27 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          __int16 v41 = self;
          __int16 v42 = 2112;
          __int16 v43 = v27;
          __int16 v44 = 2112;
          __int16 v45 = v25;
          _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v9);
        id v23 = (BRCUploadAllFilesTrackerOperation *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, BRCUploadAllFilesTrackerOperation *))v16 + 2))(v16, v23);
        goto LABEL_12;
      }
      [(BRCXPCClient *)self addAppLibrary:v20];
      id v21 = [BRCUploadAllFilesTrackerOperation alloc];
      id v39 = v20;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      id v23 = [(BRCUploadAllFilesTrackerOperation *)v21 initWithSession:v18 appLibraries:v22];
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_598;
      uint64_t v34[3] = &unk_26507F0B0;
      void v34[4] = self;
      id v20 = v24;
      id v35 = v20;
      [v18 enumerateAppLibraries:v34];
      id v23 = [[BRCUploadAllFilesTrackerOperation alloc] initWithSession:v18 appLibraries:v20];
    }
    [(_BRCFrameworkOperation *)v23 setRemoteClientProxy:v8];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_2;
    __int16 v31 = &unk_265081958;
    uint64_t v32 = self;
    id v33 = v16;
    [(_BRCOperation *)v23 setFinishBlock:&v28];
    objc_msgSend(v18, "addMiscOperation:", v23, v28, v29, v30, v31, v32);
    [(_BRCOperation *)v23 schedule];

LABEL_12:
  }
  __brc_leave_section(v38);
}

void __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_598(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addAppLibrary:v4];
  [*(id *)(a1 + 40) addObject:v4];

  return 1;
}

void __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)copyCurrentUserIdentifierWithReply:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BRCXPCClient *)self session];
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCurrentUserIdentifierWithReply:]", 4304, v24);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v24[0];
    qos_class_t v9 = qos_class_self();
    __int16 v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    __int16 v31 = 2080;
    uint64_t v32 = "-[BRCXPCRegularIPCsClient copyCurrentUserIdentifierWithReply:]";
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v11 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v12 = [v11 isSharingPrivateInterfaceEntitled];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v13 = v4;
  id v23 = v13;
  char v14 = _brc_ipc_check_client_privilege(self, 1, v12, (uint64_t)"isSharingPrivateInterfaceEntitled", v22);

  if (v14)
  {
    id v15 = [BRCSharingFetchUserRecordIDOperation alloc];
    id v16 = [v5 syncContextProvider];
    int v17 = [v16 defaultSyncContext];
    uint64_t v18 = [(BRCSharingFetchUserRecordIDOperation *)v15 initWithSyncContext:v17 sessionContext:v5];

    __int16 v19 = objc_msgSend(MEMORY[0x263EFD780], "br_fetchIdentityXPC");
    [(_BRCOperation *)v18 setGroup:v19];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke_600;
    uint64_t v20[3] = &unk_265086060;
    v20[4] = self;
    id v21 = v13;
    [(_BRCOperation *)v18 setFinishBlock:v20];
    [v5 addMiscOperation:v18];
    [(_BRCOperation *)v18 schedule];
  }
  __brc_leave_section(v24);
}

void __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke_600(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 recordName];
    __int16 v11 = objc_msgSend(v6, "brc_wrappedError");
    int v15 = 138413058;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v15, 0x2Au);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  __int16 v13 = [v5 recordName];
  char v14 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14);
}

- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCurrentUserNameAndDisplayHandleWithReply:]", 4323, v27);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v27[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v9;
    __int16 v34 = 2080;
    uint64_t v35 = "-[BRCXPCRegularIPCsClient copyCurrentUserNameAndDisplayHandleWithReply:]";
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v11 = [v10 isSharingProxyEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v12 = v4;
  id v26 = v12;
  char v13 = _brc_ipc_check_client_privilege(self, 1, v11, (uint64_t)"isSharingProxyEntitled", v25);

  if (v13)
  {
    char v14 = [MEMORY[0x263F841B0] sharedManager];
    int v15 = [v14 currentPersona];
    uint64_t v16 = objc_msgSend(v15, "br_personaID");

    __int16 v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 syncContextProvider];
    __int16 v19 = [v18 defaultSyncContext];
    id v20 = [v19 ckContainer];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_601;
    uint64_t v22[3] = &unk_2650860B0;
    void v22[4] = self;
    id v21 = v16;
    id v23 = v21;
    id v24 = v12;
    [v20 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v22];
  }
  __brc_leave_section(v27);
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_601(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) session];
  uint64_t v8 = [v7 syncContextProvider];
  __int16 v9 = [v8 defaultSyncContext];
  uint64_t v10 = [v9 ckContainer];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_2;
  v14[3] = &unk_265086088;
  __int16 v11 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v5;
  id v16 = v6;
  id v17 = v11;
  id v18 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  [v10 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v14];
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    uint64_t v14 = objc_msgSend(v7, "brc_wrappedError");
    int v21 = 138413826;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    __int16 v32 = v14;
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v21, 0x48u);
  }
  uint64_t v15 = a1[5];
  uint64_t v16 = a1[6];
  __int16 v19 = a1 + 7;
  uint64_t v17 = a1[7];
  uint64_t v18 = v19[1];
  id v20 = objc_msgSend(v7, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, uint64_t, void *))(v18 + 16))(v18, v15, v16, v6, v17, v20);
}

- (void)copyCollaborationIdentifierForFileObjectID:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCollaborationIdentifierForFileObjectID:reply:]", 4338, v24);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient copyCollaborationIdentifierForFileObjectID:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingProxyEntitled];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingProxyEntitled", v22);

  if (v16)
  {
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 clientTruthWorkloop];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_603;
    uint64_t v19[3] = &unk_26507F918;
    void v19[4] = self;
    id v20 = v6;
    id v21 = v15;
    dispatch_async_and_wait(v18, v19);
  }
  __brc_leave_section(v24);
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_603(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 itemByFileObjectID:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_603_cold_1();
    }

    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) description];
      __int16 v11 = objc_msgSend(v8, "brc_errorItemNotFound:", v10);
      int v22 = 138413058;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      __int16 v25 = 0;
      __int16 v26 = 2112;
      __int16 v27 = v11;
      __int16 v28 = 2112;
      __int16 v29 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
    }
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *(void *)(a1 + 48);
    char v14 = [*(id *)(a1 + 40) description];
    uint64_t v15 = objc_msgSend(v12, "brc_errorItemNotFound:", v14);
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v15);
  }
  char v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    __int16 v19 = [v3 collaborationIdentifierIfComputable];
    int v22 = 138413058;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = 0;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = [v3 collaborationIdentifierIfComputable];
  (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0);
}

- (void)_createSharingInfoForLocalItem:(id)a3 reply:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _createSharingInfoForLocalItem:reply:]();
  }

  if ([v6 isKnownByServer])
  {
    if (![v6 isDirectory]) {
      goto LABEL_29;
    }
    uint64_t v10 = [v6 appLibrary];
    __int16 v11 = [v10 mangledID];
    id v12 = +[BRCUserDefaults defaultsForMangledID:v11];
    char v13 = [v12 isBlacklistedFromFolderSharing];

    if ((v13 & 1) == 0)
    {
      id v25 = objc_alloc(MEMORY[0x263EFD7E8]);
      __int16 v26 = [v6 asShareableItem];
      __int16 v19 = (void *)[v25 initShareIDWithShareableItem:v26];

      __int16 v27 = [v6 asDirectory];
      __int16 v28 = [v27 folderRootStructureRecord];

      __int16 v29 = (void *)[objc_alloc(MEMORY[0x263EFD840]) initWithRootRecord:v28 shareID:v19];
      uint64_t v30 = [v6 st];
      __int16 v31 = [v30 logicalName];
      objc_msgSend(v29, "brc_updateWithLogicalName:isFolder:", v31, 1);

      __int16 v32 = [v6 serverZone];
      __int16 v33 = [v32 metadataSyncContext];
      __int16 v34 = [v33 ckContainerID];
      [v29 CKAssignToContainerWithID:v34];

      uint64_t v35 = brc_bread_crumbs();
      __int16 v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
LABEL_24:
        int v45 = 138413058;
        __int16 v46 = self;
        __int16 v47 = 2112;
        __int16 v48 = v29;
        __int16 v49 = 2112;
        uint64_t v50 = 0;
        __int16 v51 = 2112;
        uint64_t v52 = v35;
        _os_log_impl(&dword_23FA42000, v36, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
      }
    }
    else
    {
LABEL_29:
      if (![v6 isDocument] || objc_msgSend(v6, "isFinderBookmark"))
      {
        char v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          char v16 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", 0, 21);
          int v45 = 138413058;
          __int16 v46 = self;
          __int16 v47 = 2112;
          __int16 v48 = 0;
          __int16 v49 = 2112;
          uint64_t v50 = v16;
          __int16 v51 = 2112;
          uint64_t v52 = v14;
          _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
        }
        uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", 0, 21);
        goto LABEL_19;
      }
      id v37 = objc_alloc(MEMORY[0x263EFD7E8]);
      uint64_t v38 = [v6 asShareableItem];
      __int16 v19 = (void *)[v37 initShareIDWithShareableItem:v38];

      id v39 = [v6 asDocument];
      __int16 v28 = [v39 baseRecord];

      __int16 v29 = (void *)[objc_alloc(MEMORY[0x263EFD840]) initWithRootRecord:v28 shareID:v19];
      uint64_t v40 = [v6 st];
      __int16 v41 = [v40 logicalName];
      objc_msgSend(v29, "brc_updateWithLogicalName:isFolder:", v41, 0);

      __int16 v42 = [v6 serverZone];
      __int16 v43 = [v42 metadataSyncContext];
      __int16 v44 = [v43 ckContainerID];
      [v29 CKAssignToContainerWithID:v44];

      uint64_t v35 = brc_bread_crumbs();
      __int16 v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
    }

    v7[2](v7, v29, 0);
    goto LABEL_26;
  }
  if ([v6 isDocument])
  {
    uint64_t v18 = [v6 asDocument];
    __int16 v19 = [v18 uploadError];

    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v45 = 138413058;
        __int16 v46 = self;
        __int16 v47 = 2112;
        __int16 v48 = 0;
        __int16 v49 = 2112;
        uint64_t v50 = v19;
        __int16 v51 = 2112;
        uint64_t v52 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
      }

      goto LABEL_20;
    }
  }
  int v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
    int v45 = 138413058;
    __int16 v46 = self;
    __int16 v47 = 2112;
    __int16 v48 = 0;
    __int16 v49 = 2112;
    uint64_t v50 = v24;
    __int16 v51 = 2112;
    uint64_t v52 = v22;
    _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
LABEL_19:
  __int16 v19 = (void *)v17;
LABEL_20:
  ((void (**)(id, void *, void *))v7)[2](v7, 0, v19);
LABEL_26:
}

- (void)createSharingInfoForItemID:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createSharingInfoForItemID:reply:]", 4390, v23);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v23[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    __int16 v27 = self;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2080;
    __int16 v31 = "-[BRCXPCRegularIPCsClient createSharingInfoForItemID:reply:]";
    __int16 v32 = 2112;
    __int16 v33 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  char v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingProxyEntitled];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke;
  uint64_t v21[3] = &unk_265080B38;
  void v21[4] = self;
  id v15 = v7;
  id v22 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingProxyEntitled", v21);

  if (v16)
  {
    uint64_t v17 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_605;
    uint64_t v18[3] = &unk_26507F918;
    void v18[4] = self;
    id v19 = v6;
    id v20 = v15;
    dispatch_async_and_wait(v17, v18);
  }
  __brc_leave_section(v23);
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_605(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_605_cold_1();
  }

  if (v4)
  {
    [*(id *)(a1 + 32) _createSharingInfoForLocalItem:v4 reply:*(void *)(a1 + 48)];
  }
  else
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v13 = 138413058;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v73 = a3;
  uint64_t v8 = (BRCXPCRegularIPCsClient *)a4;
  id v9 = a5;
  memset(v87, 0, sizeof(v87));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]", 4434, v87);
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v87[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v89 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v90 = 2112;
    id v91 = self;
    __int16 v92 = 2112;
    uint64_t v93 = v14;
    __int16 v94 = 2080;
    uint64_t v95 = "-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]";
    __int16 v96 = 2112;
    v97 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v15 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v16 = [v15 isSharingProxyEntitled];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke;
  v85[3] = &unk_265080B38;
  v85[4] = self;
  id v17 = v9;
  id v86 = v17;
  char v18 = _brc_ipc_check_client_privilege(self, 1, v16, (uint64_t)"isSharingProxyEntitled", v85);

  if ((v18 & 1) == 0) {
    goto LABEL_47;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"share", 0);
      *(_DWORD *)buf = 138413058;
      id v89 = self;
      __int16 v90 = 2112;
      id v91 = 0;
      __int16 v92 = 2112;
      uint64_t v93 = v37;
      __int16 v94 = 2112;
      uint64_t v95 = v35;
      _os_log_impl(&dword_23FA42000, v36, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v38 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"share", 0);
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v38);
    goto LABEL_46;
  }
  __int16 v19 = [(BRCXPCRegularIPCsClient *)v8 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
  int v20 = [v19 isEqual:*MEMORY[0x263F32480]];

  if (v20)
  {
    memset(v84, 0, sizeof(v84));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]", 4445, v84);
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v84[0];
      qos_class_t v24 = qos_class_self();
      uint64_t v25 = BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      id v89 = (BRCXPCRegularIPCsClient *)v23;
      __int16 v90 = 2112;
      id v91 = self;
      __int16 v92 = 2112;
      uint64_t v93 = v25;
      __int16 v94 = 2080;
      uint64_t v95 = "-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]";
      __int16 v96 = 2112;
      v97 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    __int16 v26 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v27 = [v26 isFolderSharingProxyEntitled];
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_607;
    v82[3] = &unk_265080B38;
    v82[4] = self;
    id v83 = v17;
    char v28 = _brc_ipc_check_client_privilege(self, 1, v27, (uint64_t)"isFolderSharingProxyEntitled", v82);

    __brc_leave_section(v84);
    if ((v28 & 1) == 0) {
      goto LABEL_47;
    }
  }
  if ([(BRCXPCRegularIPCsClient *)v8 publicPermission] != 1)
  {
LABEL_32:
    __int16 v46 = brc_bread_crumbs();
    __int16 v47 = brc_default_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
    }

    id v48 = objc_alloc(MEMORY[0x263F325E0]);
    __int16 v49 = [(BRCXPCRegularIPCsClient *)v8 recordID];
    uint64_t v50 = [v49 zoneID];
    uint64_t v38 = (void *)[v48 initWithRecordZoneID:v50];

    __int16 v51 = [(BRCXPCClient *)self session];
    uint64_t v52 = [v51 clientZoneByMangledID:v38];
    if (v52)
    {
      uint64_t v53 = [BRCSharingSaveShareOperation alloc];
      id v54 = [v52 serverZone];
      __int16 v55 = [(BRCSharingSaveShareOperation *)v53 initWithShare:v8 zone:v54 sessionContext:v51];

      [(_BRCFrameworkOperation *)v55 setRemoteClientProxy:v73];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_610;
      v74[3] = &unk_2650860D8;
      v74[4] = self;
      id v77 = v17;
      id v56 = v8;
      __int16 v75 = v56;
      id v57 = v52;
      id v76 = v57;
      [(_BRCOperation *)v55 setFinishBlock:v74];
      if (v20)
      {
        uint64_t v58 = [v57 asPrivateClientZone];
        __int16 v59 = [(BRCXPCRegularIPCsClient *)v56 recordID];
        id v60 = objc_msgSend(v59, "brc_shareItemID");
        uint64_t v61 = [v58 pcsChainOperationForItemID:v60];

        if (v61)
        {
          uint64_t v62 = brc_bread_crumbs();
          __int16 v63 = brc_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
          }

          [(_BRCOperation *)v55 addDependency:v61];
        }
      }
      [v51 addMiscOperation:v55];
      [(_BRCOperation *)v55 schedule];
    }
    else
    {
      brc_bread_crumbs();
      BOOL v64 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v65 = brc_default_log();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        uint64_t v66 = (void *)MEMORY[0x263F087E8];
        __int16 v67 = [v38 appLibraryOrZoneName];
        id v68 = objc_msgSend(v66, "brc_errorAppLibraryNotFound:", v67);
        *(_DWORD *)buf = 138413058;
        id v89 = self;
        __int16 v90 = 2112;
        id v91 = 0;
        __int16 v92 = 2112;
        uint64_t v93 = v68;
        __int16 v94 = 2112;
        uint64_t v95 = v64;
        _os_log_impl(&dword_23FA42000, v65, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v69 = (void *)MEMORY[0x263F087E8];
      __int16 v55 = [v38 appLibraryOrZoneName];
      id v70 = objc_msgSend(v69, "brc_errorAppLibraryNotFound:", v55);
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v70);
    }
LABEL_46:

    goto LABEL_47;
  }
  __int16 v29 = +[BRCUserDefaults defaultsForMangledID:0];
  if (![v29 deleteShareOnEmptySave])
  {
LABEL_31:

    goto LABEL_32;
  }
  __int16 v30 = [(BRCXPCRegularIPCsClient *)v8 participants];
  if ([v30 count])
  {
    __int16 v31 = [(BRCXPCRegularIPCsClient *)v8 participants];
    if ([v31 count] == 1)
    {
      __int16 v32 = [(BRCXPCRegularIPCsClient *)v8 participants];
      __int16 v33 = [v32 firstObject];
      if ([v33 isCurrentUser])
      {
        uint64_t v72 = [(BRCXPCRegularIPCsClient *)v8 participants];
        uint64_t v34 = [v72 firstObject];
        BOOL v71 = [v34 role] == 1;

        if (!v71) {
          goto LABEL_32;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_31;
  }

LABEL_20:
  id v39 = [(BRCXPCRegularIPCsClient *)v8 etag];

  if (v39)
  {
    brc_bread_crumbs();
    uint64_t v40 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v89 = v8;
      __int16 v90 = 2112;
      id v91 = v40;
      _os_log_impl(&dword_23FA42000, v41, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleting share %@ because we're being asked to save a share with no participants%@", buf, 0x16u);
    }

    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_608;
    uint64_t v78[3] = &unk_265080DE0;
    __int16 v79 = v8;
    long long v80 = self;
    id v81 = v17;
    [(BRCXPCRegularIPCsClient *)self startOperation:v73 toUnshareShare:v79 forceDelete:1 reply:v78];

    uint64_t v38 = v79;
    goto LABEL_46;
  }
  __int16 v42 = brc_bread_crumbs();
  __int16 v43 = brc_default_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
  }

  brc_bread_crumbs();
  __int16 v44 = (char *)objc_claimAutoreleasedReturnValue();
  int v45 = brc_default_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v89 = self;
    __int16 v90 = 2112;
    id v91 = v8;
    __int16 v92 = 2112;
    uint64_t v93 = 0;
    __int16 v94 = 2112;
    uint64_t v95 = v44;
    _os_log_impl(&dword_23FA42000, v45, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v17 + 2))(v17, v8, 0);
LABEL_47:
  __brc_leave_section(v87);
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_607(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_608(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    [*(id *)(a1 + 32) setEtag:0];
    [*(id *)(a1 + 32) setKnownToServer:0];
  }
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_610(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = objc_msgSend(v6, "brc_wrappedError");
      int v17 = 138413058;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      qos_class_t v24 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    __int16 v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 40) recordID];
    __int16 v12 = objc_msgSend(v13, "brc_shareItemID");

    [*(id *)(a1 + 32) _bumpLastUsedTimeOfSharedItem:v12 clientZone:*(void *)(a1 + 48)];
    __int16 v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138413058;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      qos_class_t v24 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v17, 0x2Au);
    }

    (*(void (**)(void, id, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v5, 0);
  }
}

- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v10 = a4;
  id v11 = a6;
  memset(v67, 0, sizeof(v67));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]", 4508, v67);
  __int16 v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v67[0];
    qos_class_t v15 = qos_class_self();
    uint64_t v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v69 = v16;
    __int16 v70 = 2080;
    BOOL v71 = "-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]";
    __int16 v72 = 2112;
    id v73 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  int v17 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v18 = [v17 isSharingProxyEntitled];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke;
  v65[3] = &unk_265080B38;
  void v65[4] = self;
  id v19 = v11;
  id v66 = v19;
  char v20 = _brc_ipc_check_client_privilege(self, 1, v18, (uint64_t)"isSharingProxyEntitled", v65);

  if (v20)
  {
    __int16 v21 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
    int v22 = [v21 isEqual:*MEMORY[0x263F32480]];

    if (!v22) {
      goto LABEL_8;
    }
    memset(v64, 0, sizeof(v64));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]", 4513, v64);
    __int16 v23 = brc_bread_crumbs();
    qos_class_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = v64[0];
      qos_class_t v26 = qos_class_self();
      char v27 = BRCPrettyPrintEnumWithContext(v26, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v69 = v27;
      __int16 v70 = 2080;
      BOOL v71 = "-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]";
      __int16 v72 = 2112;
      id v73 = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    char v28 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v29 = [v28 isFolderSharingProxyEntitled];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_611;
    v62[3] = &unk_265080B38;
    v62[4] = self;
    id v63 = v19;
    char v30 = _brc_ipc_check_client_privilege(self, 1, v29, (uint64_t)"isFolderSharingProxyEntitled", v62);

    __brc_leave_section(v64);
    if (v30)
    {
LABEL_8:
      __int16 v31 = brc_bread_crumbs();
      __int16 v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]();
      }

      __int16 v33 = [(BRCXPCClient *)self session];
      id v34 = objc_alloc(MEMORY[0x263F325E0]);
      uint64_t v35 = [v10 recordID];
      __int16 v36 = [v35 zoneID];
      id v37 = (void *)[v34 initWithRecordZoneID:v36];

      id v54 = [v33 clientZoneByMangledID:v37];
      uint64_t v38 = [v54 serverZone];
      if (v38)
      {
        id v39 = +[BRCUserDefaults defaultsForMangledID:v37];
        int v40 = [v39 destroyiWorkShares];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v69) = 1;
        if (!a5 && (([v38 isSharedZone] | v40) & 1) == 0)
        {
          __int16 v41 = [v10 recordID];
          __int16 v42 = objc_msgSend(v41, "brc_shareItemID");

          __int16 v43 = [v33 clientTruthWorkloop];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_612;
          block[3] = &unk_265081E88;
          id v59 = v54;
          id v60 = v42;
          uint64_t v61 = buf;
          id v44 = v42;
          dispatch_async_and_wait(v43, block);
        }
        int v45 = [[BRCSharingDestroyShareOperation alloc] initWithShare:v10 zone:v38 sessionContext:v33];
        [(_BRCFrameworkOperation *)v45 setRemoteClientProxy:v55];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_2;
        uint64_t v56[3] = &unk_265081958;
        v56[4] = self;
        id v57 = v19;
        [(_BRCOperation *)v45 setFinishBlock:v56];
        [v33 addMiscOperation:v45];
        [(_BRCOperation *)v45 schedule];

        _Block_object_dispose(buf, 8);
      }
      else
      {
        __int16 v46 = brc_bread_crumbs();
        __int16 v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          id v48 = (void *)MEMORY[0x263F087E8];
          __int16 v49 = [v37 appLibraryOrZoneName];
          uint64_t v50 = objc_msgSend(v48, "brc_errorAppLibraryNotFound:", v49);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v69 = v46;
          _os_log_impl(&dword_23FA42000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        __int16 v51 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = [v37 appLibraryOrZoneName];
        uint64_t v53 = objc_msgSend(v51, "brc_errorAppLibraryNotFound:", v52);
        (*((void (**)(id, void *))v19 + 2))(v19, v53);
      }
    }
  }
  __brc_leave_section(v67);
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_611(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_612(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v2 = [v4 st];
  int v3 = [v2 iWorkShareable];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]", 4554, v28);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v28[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2080;
    __int16 v36 = "-[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]";
    __int16 v37 = 2112;
    uint64_t v38 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke;
  uint64_t v26[3] = &unk_265080B38;
  void v26[4] = self;
  id v18 = v10;
  id v27 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 0, v17, (uint64_t)"isSharingProxyEntitled", v26);

  if (v19)
  {
    char v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]();
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_614;
    uint64_t v22[3] = &unk_265086100;
    void v22[4] = self;
    id v25 = v18;
    id v23 = v9;
    id v24 = v8;
    [(BRCXPCClient *)self performBlockWithAnySession:v22];
  }
  __brc_leave_section(v28);
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_614(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[BRCSharingLookupParticipantsOperation alloc] initWithUserIdentities:*(void *)(a1 + 40) session:v3];
    [(_BRCFrameworkOperation *)v4 setRemoteClientProxy:*(void *)(a1 + 48)];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_616;
    __int16 v13 = &unk_265081958;
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    [(_BRCOperation *)v4 setFinishBlock:&v10];
    objc_msgSend(v3, "addMiscOperation:", v4, v10, v11, v12, v13, v14);
    [(_BRCOperation *)v4 schedule];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
      *(_DWORD *)buf = 138413058;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorLoggedOut");
    id v4 = (BRCSharingLookupParticipantsOperation *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, BRCSharingLookupParticipantsOperation *))(v9 + 16))(v9, 0, v4);
  }
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_616(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)_startOperation:(id)a3 toModifyRecordAccessWithLocalItem:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toModifyRecordAccessWithLocalItem:allowAccess:reply:]();
  }

  if ([v11 isDocument])
  {
    __int16 v15 = [BRCSharingModifyAccessOperation alloc];
    id v16 = [v11 asDocument];
    __int16 v17 = [(BRCXPCClient *)self session];
    __int16 v18 = [(BRCSharingModifyAccessOperation *)v15 initWithItem:v16 allowAccess:v7 sessionContext:v17];

    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __95__BRCXPCRegularIPCsClient__startOperation_toModifyRecordAccessWithLocalItem_allowAccess_reply___block_invoke;
    id v25 = &unk_2650831A0;
    qos_class_t v26 = self;
    id v27 = v12;
    [(_BRCOperation *)v18 setFinishBlock:&v22];
    -[BRCXPCClient _startSharingOperationAfterAcceptation:client:item:](self, "_startSharingOperationAfterAcceptation:client:item:", v18, v10, v11, v22, v23, v24, v25, v26);
  }
  else
  {
    __int16 v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotShareable");
      *(_DWORD *)buf = 138413314;
      char v29 = self;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v21;
      __int16 v36 = 2112;
      __int16 v37 = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotShareable");
    __int16 v18 = (BRCSharingModifyAccessOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, BRCSharingModifyAccessOperation *))v12 + 2))(v12, 0, 0, v18);
  }
}

void __95__BRCXPCRegularIPCsClient__startOperation_toModifyRecordAccessWithLocalItem_allowAccess_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v5 objectForKeyedSubscript:@"accessToken"];
    id v11 = [v5 objectForKeyedSubscript:@"referenceIdentifier"];
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    int v17 = 138413314;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    qos_class_t v26 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = [v5 objectForKeyedSubscript:@"accessToken"];
  __int16 v15 = [v5 objectForKeyedSubscript:@"referenceIdentifier"];
  id v16 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v16);
}

- (void)startOperation:(id)a3 toModifyRecordAccessWithItemID:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toModifyRecordAccessWithItemID:allowAccess:reply:]", 4590, v30);
  uint64_t v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v30[0];
    qos_class_t v16 = qos_class_self();
    int v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v15;
    __int16 v33 = 2112;
    __int16 v34 = self;
    __int16 v35 = 2112;
    __int16 v36 = v17;
    __int16 v37 = 2080;
    uint64_t v38 = "-[BRCXPCRegularIPCsClient startOperation:toModifyRecordAccessWithItemID:allowAccess:reply:]";
    __int16 v39 = 2112;
    int v40 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v18 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v19 = [v18 isSharingProxyEntitled];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke;
  uint64_t v28[3] = &unk_265080B38;
  void v28[4] = self;
  id v20 = v12;
  id v29 = v20;
  char v21 = _brc_ipc_check_client_privilege(self, 1, v19, (uint64_t)"isSharingProxyEntitled", v28);

  if (v21)
  {
    uint64_t v22 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke_625;
    uint64_t v23[3] = &unk_265086128;
    v23[4] = self;
    id v24 = v11;
    id v26 = v20;
    id v25 = v10;
    BOOL v27 = a5;
    dispatch_async_and_wait(v22, v23);
  }
  __brc_leave_section(v30);
}

void __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    qos_class_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke_625(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toModifyRecordAccessWithLocalItem:v4 allowAccess:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)_startOperation:(id)a3 toCopyParticipantTokenWithLocalItem:(id)a4 reply:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toCopyParticipantTokenWithLocalItem:reply:]();
  }

  if (([v9 sharingOptions] & 0x48) != 0)
  {
    __int16 v13 = [BRCSharingCopyParticipantTokenOperation alloc];
    uint64_t v14 = [v9 asDocument];
    __int16 v15 = [(BRCXPCClient *)self session];
    uint64_t v16 = [(BRCSharingCopyParticipantTokenOperation *)v13 initWithItem:v14 sessionContext:v15];

    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __85__BRCXPCRegularIPCsClient__startOperation_toCopyParticipantTokenWithLocalItem_reply___block_invoke;
    __int16 v23 = &unk_265081958;
    id v24 = self;
    id v25 = v10;
    [(_BRCOperation *)v16 setFinishBlock:&v20];
    -[BRCXPCClient _startSharingOperationAfterAcceptation:client:item:](self, "_startSharingOperationAfterAcceptation:client:item:", v16, v8, v9, v20, v21, v22, v23, v24);
  }
  else
  {
    __int16 v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
      *(_DWORD *)buf = 138413314;
      BOOL v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      __int16 v33 = v19;
      __int16 v34 = 2112;
      __int16 v35 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    uint64_t v16 = (BRCSharingCopyParticipantTokenOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, BRCSharingCopyParticipantTokenOperation *))v10 + 2))(v10, 0, 0, v16);
  }
}

void __85__BRCXPCRegularIPCsClient__startOperation_toCopyParticipantTokenWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"participantKey"];
  id v8 = [v6 objectForKeyedSubscript:@"baseToken"];

  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend(v5, "brc_wrappedError");
    int v15 = 138413314;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v7, v8, v14);
}

- (void)startOperation:(id)a3 toCopyParticipantTokenWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyParticipantTokenWithItemID:reply:]", 4626, v27);
  uint64_t v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    int v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopyParticipantTokenWithItemID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke_633;
    block[3] = &unk_26507FBE0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke_633(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopyParticipantTokenWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)_startOperation:(id)a3 toPrepFolderForSharingWithLocalItem:(id)a4 reply:(id)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v7 = a4;
  uint64_t v58 = (void (**)(id, void *))a5;
  uint64_t v65 = 0;
  id v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;

  uint64_t v68 = v10;
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toPrepFolderForSharingWithLocalItem:reply:]();
  }

  id v57 = +[BRCEventsAnalytics sharedAnalytics];
  if (([v7 isDirectory] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
    id v18 = (BRCSharingPCSChainFolderOperation *)objc_claimAutoreleasedReturnValue();
    id v23 = +[BRCUserDefaults defaultsForMangledID:0];
    int v24 = [v23 reportXPCErrorOnPCSChain];

    if (v24)
    {
      uint64_t v25 = [MEMORY[0x263EFF910] date];
      [v25 timeIntervalSinceReferenceDate];
      double v27 = v26;
      double v28 = v66[3];

      uint64_t v29 = [v7 clientZone];
      __int16 v30 = [v29 mangledID];
      uint64_t v31 = [v7 clientZone];
      uint64_t v32 = [v31 enhancedDrivePrivacyEnabled];
      __int16 v33 = [v7 itemID];
      __int16 v34 = [v33 itemIDString];
      __int16 v35 = [(BRCXPCClient *)self session];
      __int16 v36 = [v35 analyticsReporter];
      [v57 registerAndSendNewFolderSharePCSChainingTime:MEMORY[0x263EFFA80] chainedRecordsCount:v30 zoneMangledID:v32 enhancedDrivePrivacyEnabled:v34 itemIDString:v18 error:v36 analyticsReporter:v27 - v28];
    }
    __int16 v37 = brc_bread_crumbs();
    uint64_t v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v70 = self;
      __int16 v71 = 2112;
      __int16 v72 = v18;
      __int16 v73 = 2112;
      uint64_t v74 = v37;
      _os_log_impl(&dword_23FA42000, v38, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if (([v7 isKnownByServer] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
    id v18 = (BRCSharingPCSChainFolderOperation *)objc_claimAutoreleasedReturnValue();
    __int16 v39 = +[BRCUserDefaults defaultsForMangledID:0];
    int v40 = [v39 reportXPCErrorOnPCSChain];

    if (v40)
    {
      uint64_t v41 = [MEMORY[0x263EFF910] date];
      [v41 timeIntervalSinceReferenceDate];
      double v43 = v42;
      double v44 = v66[3];

      int v45 = [v7 clientZone];
      __int16 v46 = [v45 mangledID];
      __int16 v47 = [v7 clientZone];
      uint64_t v48 = [v47 enhancedDrivePrivacyEnabled];
      __int16 v49 = [v7 itemID];
      uint64_t v50 = [v49 itemIDString];
      __int16 v51 = [(BRCXPCClient *)self session];
      uint64_t v52 = [v51 analyticsReporter];
      [v57 registerAndSendNewFolderSharePCSChainingTime:MEMORY[0x263EFFA80] chainedRecordsCount:v46 zoneMangledID:v48 enhancedDrivePrivacyEnabled:v50 itemIDString:v18 error:v52 analyticsReporter:v43 - v44];
    }
    __int16 v37 = brc_bread_crumbs();
    uint64_t v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v70 = self;
      __int16 v71 = 2112;
      __int16 v72 = v18;
      __int16 v73 = 2112;
      uint64_t v74 = v37;
      _os_log_impl(&dword_23FA42000, v38, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
LABEL_16:

    v58[2](v58, v18);
    goto LABEL_17;
  }
  __int16 v13 = [BRCSharingPCSChainFolderOperation alloc];
  uint64_t v14 = [v7 asDirectory];
  __int16 v15 = [(BRCXPCClient *)self session];
  uint64_t v16 = [(BRCXPCClient *)self session];
  uint64_t v17 = [v16 syncUpScheduler];
  id v18 = [(BRCSharingPCSChainFolderOperation *)v13 initWithItem:v14 sessionContext:v15 syncUpCallback:v17];

  [(_BRCFrameworkOperation *)v18 setRemoteClientProxy:v55];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __85__BRCXPCRegularIPCsClient__startOperation_toPrepFolderForSharingWithLocalItem_reply___block_invoke;
  uint64_t v59[3] = &unk_265086150;
  BOOL v64 = &v65;
  id v60 = v57;
  id v19 = v7;
  id v61 = v19;
  uint64_t v62 = self;
  id v63 = v58;
  [(_BRCOperation *)v18 setFinishBlock:v59];
  uint64_t v20 = [v19 clientZone];
  LOBYTE(v17) = [v20 isPrivateZone];

  if ((v17 & 1) == 0)
  {
    uint64_t v53 = brc_bread_crumbs();
    id v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCRegularIPCsClient _startOperation:toPrepFolderForSharingWithLocalItem:reply:]();
    }
  }
  uint64_t v21 = [v19 clientZone];
  id v22 = [v21 asPrivateClientZone];
  [v22 registerPCSChainingOperation:v18];

  [(_BRCOperation *)v18 schedule];
LABEL_17:

  _Block_object_dispose(&v65, 8);
}

void __85__BRCXPCRegularIPCsClient__startOperation_toPrepFolderForSharingWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a2;
  id v7 = [v5 date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8 - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

  int v24 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) clientZone];
  int v11 = [v10 mangledID];
  uint64_t v12 = [*(id *)(a1 + 40) clientZone];
  uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];
  uint64_t v14 = [*(id *)(a1 + 40) itemID];
  __int16 v15 = [v14 itemIDString];
  uint64_t v16 = [*(id *)(a1 + 48) session];
  uint64_t v17 = [v16 analyticsReporter];
  [v24 registerAndSendNewFolderSharePCSChainingTime:v6 chainedRecordsCount:v11 zoneMangledID:v13 enhancedDrivePrivacyEnabled:v15 itemIDString:v25 error:v17 analyticsReporter:v9];

  id v18 = brc_bread_crumbs();
  id v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = objc_msgSend(v25, "brc_wrappedError");
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v22 = *(void *)(a1 + 56);
  id v23 = objc_msgSend(v25, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
}

- (void)startOperation:(id)a3 toPrepFolderForSharingWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toPrepFolderForSharingWithItemID:reply:]", 4695, v27);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toPrepFolderForSharingWithItemID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_265080B38;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke_635;
    block[3] = &unk_26507FBE0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke_635(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toPrepFolderForSharingWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      qos_class_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)_startOperation:(id)a3 toProcessSubitemsWithLocalItem:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toProcessSubitemsWithLocalItem:maxSubsharesFailures:processType:reply:]();
  }

  if ([v13 isDirectory])
  {
    uint64_t v17 = [BRCSharingProcessFolderSubitemsOperation alloc];
    id v18 = [v13 asDirectory];
    char v19 = [(BRCXPCClient *)self session];
    uint64_t v20 = [(BRCSharingProcessFolderSubitemsOperation *)v17 initWithItem:v18 sessionContext:v19 processType:a6 maxSubitemsToFail:a5];

    [(_BRCFrameworkOperation *)v20 setRemoteClientProxy:v12];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __113__BRCXPCRegularIPCsClient__startOperation_toProcessSubitemsWithLocalItem_maxSubsharesFailures_processType_reply___block_invoke;
    __int16 v28 = &unk_265081958;
    uint64_t v29 = self;
    id v30 = v14;
    [(_BRCOperation *)v20 setFinishBlock:&v25];
    uint64_t v21 = [(BRCXPCClient *)self session];
    [v21 addMiscOperation:v20];

    [(_BRCOperation *)v20 schedule];
  }
  else
  {
    id v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
      *(_DWORD *)buf = 138412802;
      __int16 v32 = self;
      __int16 v33 = 2112;
      __int16 v34 = v24;
      __int16 v35 = 2112;
      __int16 v36 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
    uint64_t v20 = (BRCSharingProcessFolderSubitemsOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, BRCSharingProcessFolderSubitemsOperation *))v14 + 2))(v14, v20);
  }
}

void __113__BRCXPCRegularIPCsClient__startOperation_toProcessSubitemsWithLocalItem_maxSubsharesFailures_processType_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)startOperation:(id)a3 toProcessSubitemsWithItemID:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toProcessSubitemsWithItemID:maxSubsharesFailures:processType:reply:]", 4732, v38);
  __int16 v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v29 = v14;
    id v17 = v13;
    id v18 = v12;
    unint64_t v19 = a5;
    unint64_t v20 = a6;
    uint64_t v21 = v38[0];
    qos_class_t v22 = qos_class_self();
    id v23 = BRCPrettyPrintEnumWithContext(v22, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v21;
    __int16 v41 = 2112;
    double v42 = self;
    __int16 v43 = 2112;
    double v44 = v23;
    __int16 v45 = 2080;
    __int16 v46 = "-[BRCXPCRegularIPCsClient startOperation:toProcessSubitemsWithItemID:maxSubsharesFailures:processType:reply:]";
    __int16 v47 = 2112;
    uint64_t v48 = v15;
    _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a6 = v20;
    a5 = v19;
    id v12 = v18;
    id v13 = v17;
    id v14 = v29;
  }

  id v24 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v25 = [v24 isFolderSharingProxyEntitled];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke;
  uint64_t v36[3] = &unk_265080B38;
  v36[4] = self;
  id v26 = v14;
  id v37 = v26;
  char v27 = _brc_ipc_check_client_privilege(self, 1, v25, (uint64_t)"isFolderSharingProxyEntitled", v36);

  if (v27)
  {
    __int16 v28 = [(BRCAccountSessionFPFS *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke_637;
    block[3] = &unk_265086178;
    void block[4] = self;
    id v31 = v13;
    id v33 = v26;
    id v32 = v12;
    unint64_t v34 = a5;
    unint64_t v35 = a6;
    dispatch_async_and_wait(v28, block);
  }
  __brc_leave_section(v38);
}

void __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke_637(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toProcessSubitemsWithLocalItem:v4 maxSubsharesFailures:*(void *)(a1 + 64) processType:*(void *)(a1 + 72) reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)startOperation:(id)a3 toAcceptShareLink:(id)a4 skipAcceptDialogs:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]", 4749, v45);
  __int16 v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v45[0];
    qos_class_t v16 = qos_class_self();
    uint64_t v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v47 = (BRCXPCRegularIPCsClient *)v15;
    __int16 v48 = 2112;
    uint64_t v49 = self;
    __int16 v50 = 2112;
    __int16 v51 = v17;
    __int16 v52 = 2080;
    uint64_t v53 = "-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]";
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v18 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v19 = [v18 isSharingPrivateInterfaceEntitled];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke;
  uint64_t v43[3] = &unk_265080B38;
  v43[4] = self;
  id v20 = v12;
  id v44 = v20;
  char v21 = _brc_ipc_check_client_privilege(self, 1, v19, (uint64_t)"isSharingPrivateInterfaceEntitled", v43);

  if (v21)
  {
    if (!v7) {
      goto LABEL_8;
    }
    memset(v42, 0, sizeof(v42));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]", 4754, v42);
    qos_class_t v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = v42[0];
      qos_class_t v25 = qos_class_self();
      id v26 = BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      __int16 v47 = (BRCXPCRegularIPCsClient *)v24;
      __int16 v48 = 2112;
      uint64_t v49 = self;
      __int16 v50 = 2112;
      __int16 v51 = v26;
      __int16 v52 = 2080;
      uint64_t v53 = "-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]";
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    char v27 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v28 = [v27 isAutomationEntitled];
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    uint64_t v38 = __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke_639;
    __int16 v39 = &unk_265080B38;
    uint64_t v40 = self;
    id v41 = v20;
    char v29 = _brc_ipc_check_client_privilege(self, 1, v28, (uint64_t)"isAutomationEntitled", &v36);

    __brc_leave_section(v42);
    if (v29)
    {
LABEL_8:
      id v30 = +[BRCDaemonFPFS daemon];
      [v30 registerWaiterBlock:v20 forShareURL:v11];

      id v31 = [MEMORY[0x263F01880] defaultWorkspace];
      if (([v31 openURL:v11 withOptions:0] & 1) == 0)
      {
        brc_bread_crumbs();
        id v32 = (char *)objc_claimAutoreleasedReturnValue();
        id v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          unint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
          *(_DWORD *)buf = 138413058;
          __int16 v47 = self;
          __int16 v48 = 2112;
          uint64_t v49 = 0;
          __int16 v50 = 2112;
          __int16 v51 = v34;
          __int16 v52 = 2112;
          uint64_t v53 = v32;
          _os_log_impl(&dword_23FA42000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        unint64_t v35 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
        (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v35);
      }
    }
  }
  __brc_leave_section(v45);
}

void __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke_639(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v35, 0, sizeof(v35));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]", 4792, v35);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v35[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    __int16 v39 = self;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2080;
    __int16 v43 = "-[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]";
    __int16 v44 = 2112;
    __int16 v45 = v11;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  qos_class_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke;
  uint64_t v33[3] = &unk_265080B38;
  void v33[4] = self;
  id v18 = v10;
  id v34 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v33);

  if (v19)
  {
    id v20 = brc_bread_crumbs();
    char v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]();
    }

    qos_class_t v22 = [(BRCXPCClient *)self session];
    id v23 = objc_alloc(MEMORY[0x263F325E0]);
    uint64_t v24 = [v9 recordID];
    qos_class_t v25 = [v24 zoneID];
    id v26 = (void *)[v23 initWithRecordZoneID:v25];

    char v27 = [v22 clientZoneByMangledID:v26];
    char v28 = [BRCSharingCopyShareURLOperation alloc];
    char v29 = [v27 serverZone];
    id v30 = [(BRCSharingCopyShareURLOperation *)v28 initWithShare:v9 zone:v29 sessionContext:v22];

    [(_BRCFrameworkOperation *)v30 setRemoteClientProxy:v8];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke_642;
    uint64_t v31[3] = &unk_265081958;
    v31[4] = self;
    id v32 = v18;
    [(_BRCOperation *)v30 setFinishBlock:v31];
    [v22 addMiscOperation:v30];
    [(_BRCOperation *)v30 schedule];
  }
  __brc_leave_section(v35);
}

void __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    qos_class_t v16 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke_642(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 objectForKeyedSubscript:@"share"];
    __int16 v11 = [v5 objectForKeyedSubscript:@"url"];
    uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
    int v17 = 138413314;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    qos_class_t v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [v5 objectForKeyedSubscript:@"share"];
  __int16 v15 = [v5 objectForKeyedSubscript:@"url"];
  qos_class_t v16 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v16);
}

- (void)getShareOptionsOfItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]", 4813, v34);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v34[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    __int16 v38 = self;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2080;
    __int16 v42 = "-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]";
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  void v32[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke;
  uint64_t v32[3] = &unk_265080B38;
  v32[4] = self;
  id v13 = v7;
  id v33 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v32);

  if (v14)
  {
    memset(v31, 0, sizeof(v31));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]", 4815, v31);
    __int16 v15 = brc_bread_crumbs();
    qos_class_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v31[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v6 UTF8String];
      *(_DWORD *)buf = 134219266;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      __int16 v38 = self;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2080;
      __int16 v42 = "-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]";
      __int16 v43 = 2080;
      uint64_t v44 = v20;
      __int16 v45 = 2112;
      uint64_t v46 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Getting sharing options for %s%@", buf, 0x3Eu);
    }
    __int16 v21 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    __int16 v23 = [v21 clientDB];
    uint64_t v24 = [v23 serialQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646;
    uint64_t v27[3] = &unk_26507F918;
    id v28 = v6;
    char v29 = self;
    id v30 = v13;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_647;
    uint64_t v25[3] = &unk_26507F850;
    void v25[4] = self;
    id v26 = v30;
    brc_task_tracker_async_with_logs(tracker, v24, v27, v25);

    __brc_leave_section(v31);
  }
  __brc_leave_section(v34);
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 1024;
    int v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", (uint8_t *)&v7, 0x3Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F325B8] fileObjectIDWithString:*(void *)(a1 + 32)];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646_cold_2();
  }

  id v5 = [*(id *)(v1 + 40) session];
  uint64_t v6 = [v5 itemByFileObjectID:v2];

  if (v6)
  {
    char v7 = [v6 sharingOptions];
    uint64_t v8 = v7 & 0x48;
    __int16 v9 = [v6 clientZone];
    int v10 = [v9 isPrivateZone];

    __int16 v11 = 0;
    unint64_t v12 = v7 & 4;
    if ((v7 & 0x48) != 0 && (v7 & 4) == 0)
    {
      uint64_t v36 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v6);
      unint64_t v35 = objc_msgSend(v36, "brc_shareItemID");
      __int16 v13 = [v6 clientZone];
      int v14 = [v13 itemByItemID:v35];

      [v14 st];
      v16 = uint64_t v15 = v7 & 0x48;
      [v16 logicalName];
      int v17 = v10;
      uint64_t v18 = v1;
      uint64_t v20 = v19 = v2;
      __int16 v11 = objc_msgSend(v20, "br_displayFilenameWithExtensionHidden:", 0);

      id v2 = v19;
      uint64_t v1 = v18;
      int v10 = v17;

      uint64_t v8 = v15;
      unint64_t v12 = 0;
    }
    uint64_t v21 = brc_bread_crumbs();
    qos_class_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(v1 + 40);
      *(_DWORD *)buf = 138413826;
      uint64_t v38 = v23;
      __int16 v39 = 1024;
      BOOL v40 = v8 != 0;
      __int16 v41 = 1024;
      int v42 = v10;
      __int16 v43 = 1024;
      int v44 = v12 >> 2;
      __int16 v45 = 2112;
      uint64_t v46 = v11;
      __int16 v47 = 2112;
      __int16 v48 = 0;
      __int16 v49 = 2112;
      __int16 v50 = v21;
      _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", buf, 0x3Cu);
    }

    (*(void (**)(void))(*(void *)(v1 + 48) + 16))();
  }
  else
  {
    uint64_t v24 = brc_bread_crumbs();
    __int16 v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646_cold_1();
    }

    id v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = *(void *)(v1 + 40);
      char v29 = (void *)MEMORY[0x263F087E8];
      id v30 = [v2 description];
      id v31 = objc_msgSend(v29, "brc_errorItemNotFound:", v30);
      *(_DWORD *)buf = 138413826;
      uint64_t v38 = v28;
      __int16 v39 = 1024;
      BOOL v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      __int16 v47 = 2112;
      __int16 v48 = v31;
      __int16 v49 = 2112;
      __int16 v50 = v26;
      _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", buf, 0x3Cu);
    }
    uint64_t v32 = *(void *)(v1 + 48);
    id v33 = (void *)MEMORY[0x263F087E8];
    __int16 v11 = [v2 description];
    id v34 = objc_msgSend(v33, "brc_errorItemNotFound:", v11);
    (*(void (**)(uint64_t, void, void, void, void, void *))(v32 + 16))(v32, 0, 0, 0, 0, v34);
  }
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_647(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    int v8 = 138413826;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", (uint8_t *)&v8, 0x3Cu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
}

- (void)_presentAcceptDialogsWithMetadata:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = [(BRCXPCClient *)self session];
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]", 4872, v32);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v32[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v34 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    __int16 v39 = 2080;
    BOOL v40 = "-[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]";
    __int16 v41 = 2112;
    int v42 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke;
  uint64_t v30[3] = &unk_265080B38;
  void v30[4] = self;
  id v13 = v7;
  id v31 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 0, v30);

  if (v14)
  {
    int v15 = [v6 share];
    __int16 v16 = [v15 URL];

    id v26 = objc_alloc_init(BRCUserNotification);
    uint64_t v17 = +[BRCUserActionsNavigator defaultNavigator];
    __int16 v18 = [[BRCSharingAcceptFlowOperation alloc] initWithShareMetadata:v6 client:self session:v27 userNotifier:v26 userActionsNavigator:v17];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke_650;
    uint64_t v28[3] = &unk_265081958;
    void v28[4] = self;
    id v19 = v13;
    id v29 = v19;
    [(_BRCOperation *)v18 setFinishBlock:v28];
    __int16 v20 = +[BRCDaemonFPFS daemon];
    uint64_t v21 = [v20 registerShareAcceptOperation:v18 forURL:v16];

    if (v21 != v18)
    {
      uint64_t v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        -[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]();
      }

      [(BRCSharingAcceptFlowOperation *)v21 moveDialogToFront];
      uint64_t v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }

      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
  __brc_leave_section(v32);
}

void __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke_650(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]", 4929, v28);
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v28[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v10;
    __int16 v31 = 2112;
    uint64_t v32 = self;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2080;
    uint64_t v36 = "-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]";
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke;
  uint64_t v24[3] = &unk_265080DE0;
  id v13 = v6;
  id v25 = v13;
  id v26 = self;
  id v14 = v7;
  id v27 = v14;
  int v15 = _brc_ipc_check_logged_status(self, 0, v24);

  if (v15)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]", 4931, v23);
    __int16 v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = v23[0];
      id v19 = [v13 share];
      __int16 v20 = [v19 URL];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling share at %@%@", buf, 0x20u);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke_651;
    uint64_t v21[3] = &unk_265080B38;
    void v21[4] = self;
    id v22 = v14;
    [(BRCXPCRegularIPCsClient *)self presentAcceptDialogsForShareMetadata:v13 reply:v21];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v28);
}

void __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v12 = a1[4];
    int v13 = 138412802;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] can't handle share %@: %@%@", (uint8_t *)&v13, 0x20u);
  }

  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = a1[6];
  qos_class_t v11 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke_651(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      __int16 v15 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] can't accept the share: %@%@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  qos_class_t v11 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

- (void)keepDataLocalOnSignOut:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient keepDataLocalOnSignOut:reply:]", 4944, v24);
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v24[0];
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v26 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    __int16 v31 = 2080;
    uint64_t v32 = "-[BRCXPCRegularIPCsClient keepDataLocalOnSignOut:reply:]";
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke;
  uint64_t v22[3] = &unk_265080B38;
  void v22[4] = self;
  id v12 = v6;
  id v23 = v12;
  int v13 = _brc_ipc_check_applibraries_access(self, 3, v22);

  if (v13)
  {
    __int16 v14 = +[BRCAccountsManager sharedManager];
    [v14 keepDataLocalOnSignOutForCurrentPersona:v4];
    __int16 v15 = [(BRCXPCClient *)self session];

    if (v15)
    {
      __int16 v16 = [(BRCXPCClient *)self session];
      __int16 v17 = [v16 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_652;
      block[3] = &unk_2650806E8;
      BOOL v21 = v4;
      void block[4] = self;
      dispatch_async_and_wait(v17, block);
    }
    uint64_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
  __brc_leave_section(v24);
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_652(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_652_cold_1(a1);
  }

  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) session];
  uint64_t v6 = [v5 clientState];
  [v6 setObject:v4 forKeyedSubscript:@"kBRCKeepDataLocalOnSignOutStatKey"];

  int v7 = [*(id *)(a1 + 32) session];
  uint64_t v8 = [v7 clientDB];
  [v8 forceBatchStart];
}

- (BOOL)_saveOrDeleteContainerMetadataRecordName:(id)a3 saveRecord:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__48;
  uint64_t v28 = __Block_byref_object_dispose__48;
  id v29 = 0;
  id v9 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v10 = objc_msgSend(MEMORY[0x263EFD808], "brc_containerMetadataZoneID");
  __int16 v11 = (void *)[v9 initWithRecordName:v8 zoneID:v10];

  if (v6)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"AppContainer" recordID:v11];
    id v13 = objc_alloc(MEMORY[0x263EFD748]);
    v31[0] = v12;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    __int16 v15 = (void *)[v13 initWithRecordsToSave:v14 recordIDsToDelete:0];
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263EFD748]);
    uint64_t v30 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    __int16 v15 = (void *)[v16 initWithRecordsToSave:0 recordIDsToDelete:v12];
  }

  __int16 v17 = objc_msgSend(MEMORY[0x263EFD780], "br_testTrigger");
  [v15 setGroup:v17];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __85__BRCXPCRegularIPCsClient__saveOrDeleteContainerMetadataRecordName_saveRecord_error___block_invoke;
  uint64_t v23[3] = &unk_2650861A0;
  v23[4] = &v24;
  [v15 setModifyRecordsCompletionBlock:v23];
  uint64_t v18 = [(BRCXPCClient *)self session];
  uint64_t v19 = [v18 syncContextProvider];
  __int16 v20 = [v19 defaultSyncContext];
  [v20 addOperation:v15];

  [v15 waitUntilFinished];
  if (a5) {
    *a5 = (id) v25[5];
  }
  BOOL v21 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v21;
}

void __85__BRCXPCRegularIPCsClient__saveOrDeleteContainerMetadataRecordName_saveRecord_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
}

- (void)setEnhancedDrivePrivacyEnabled:(BOOL)a3 forContainer:(id)a4 onServer:(BOOL)a5 onClient:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  memset(v64, 0, sizeof(v64));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setEnhancedDrivePrivacyEnabled:forContainer:onServer:onClient:reply:]", 5000, v64);
  __int16 v14 = brc_bread_crumbs();
  __int16 v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v46 = v13;
    BOOL v16 = v9;
    BOOL v17 = a3;
    id v18 = v12;
    BOOL v19 = v8;
    uint64_t v20 = v64[0];
    qos_class_t v21 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    id v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v72 = v22;
    *(_WORD *)__int16 v73 = 2080;
    *(void *)&v73[2] = "-[BRCXPCRegularIPCsClient setEnhancedDrivePrivacyEnabled:forContainer:onServer:onClient:reply:]";
    *(_WORD *)&v73[10] = 2112;
    *(void *)&v73[12] = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    BOOL v8 = v19;
    id v12 = v18;
    a3 = v17;
    BOOL v9 = v16;
    id v13 = v46;
  }

  id v23 = (void *)*MEMORY[0x263F323E0];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke;
  v62[3] = &unk_265080B38;
  v62[4] = self;
  id v24 = v13;
  id v63 = v24;
  LODWORD(v23) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v23, v62);

  if (v23)
  {
    id v25 = +[BRCUserDefaults defaultsForMangledID:0];
    char v26 = [v25 supportsEnhancedDrivePrivacy];

    if ((v26 & 1) == 0)
    {
      brc_bread_crumbs();
      id v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      uint64_t v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2112;
        __int16 v72 = v34;
        _os_log_impl(&dword_23FA42000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
      (*((void (**)(id, void *))v24 + 2))(v24, v27);
      goto LABEL_29;
    }
    __int16 v27 = [(BRCXPCClient *)self session];
    char v28 = [v12 isEqualToString:@"all"];
    int v29 = [v12 isEqualToString:@"all-private"];
    if (v9)
    {
      char v45 = v28;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v72 = __Block_byref_object_copy__48;
      *(void *)__int16 v73 = __Block_byref_object_dispose__48;
      *(void *)&v73[8] = 0;
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_668;
      v60[3] = &unk_2650861C8;
      BOOL v61 = a3;
      v60[4] = self;
      v60[5] = buf;
      __int16 v47 = (uint64_t (**)(void, void, void))MEMORY[0x2455D9A50](v60);
      if (v29)
      {
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2;
        v57[3] = &unk_2650861F0;
        BOOL v59 = a3;
        uint64_t v58 = v47;
        [v27 enumeratePrivateClientZones:v57];
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          uint64_t v30 = brc_bread_crumbs();
          __int16 v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v65 = 138412802;
            id v66 = self;
            __int16 v67 = 2112;
            uint64_t v68 = v32;
            __int16 v69 = 2112;
            __int16 v70 = v30;
            _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v65, 0x20u);
          }

          (*((void (**)(id, void))v24 + 2))(v24, *(void *)(*(void *)&buf[8] + 40));
          __int16 v33 = v58;
LABEL_21:

          _Block_object_dispose(buf, 8);
LABEL_29:

          goto LABEL_30;
        }
        __int16 v33 = v58;
      }
      else
      {
        if (v28)
        {
          __int16 v33 = @"com.apple.lobodon.forced";
        }
        else
        {
          __int16 v33 = [v12 stringByAppendingString:@".lobodon.enabled"];
        }
        uint64_t v37 = *(void *)&buf[8];
        obuint64_t j = *(id *)(*(void *)&buf[8] + 40);
        char v38 = ((uint64_t (**)(void, __CFString *, id *))v47)[2](v47, v33, &obj);
        objc_storeStrong((id *)(v37 + 40), obj);
        if ((v38 & 1) == 0)
        {
          uint64_t v39 = brc_bread_crumbs();
          BOOL v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v65 = 138412802;
            id v66 = self;
            __int16 v67 = 2112;
            uint64_t v68 = v41;
            __int16 v69 = 2112;
            __int16 v70 = v39;
            _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v65, 0x20u);
          }

          (*((void (**)(id, void))v24 + 2))(v24, *(void *)(*(void *)&buf[8] + 40));
          goto LABEL_21;
        }
      }

      _Block_object_dispose(buf, 8);
      char v28 = v45;
    }
    if (v8)
    {
      int v42 = [v27 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_677;
      block[3] = &unk_265086260;
      BOOL v53 = a3;
      char v54 = v28;
      id v49 = v27;
      char v55 = v29;
      id v50 = v12;
      uint64_t v51 = self;
      id v52 = v24;
      dispatch_async_and_wait(v42, block);
    }
    brc_bread_crumbs();
    uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    int v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      __int16 v72 = v43;
      _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v24 + 2))(v24, 0);
    goto LABEL_29;
  }
LABEL_30:
  __brc_leave_section(v64);
}

void __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_668(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _saveOrDeleteContainerMetadataRecordName:a2 saveRecord:*(unsigned __int8 *)(a1 + 48) error:a3];
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *a3);
  }
  return v5;
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == [v3 enhancedDrivePrivacyEnabled])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 mangledID];
    int v7 = [v6 appLibraryOrZoneName];
    uint64_t v8 = [v7 stringByAppendingString:@".lobodon.enabled"];
    id v11 = 0;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void *, id *))(v5 + 16))(v5, v8, &v11);
    id v9 = v11;
  }
  return v4;
}

void __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_677(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2_678;
  uint64_t v18[3] = &__block_descriptor_33_e23_v16__0__BRCClientZone_8l;
  char v19 = *(unsigned char *)(a1 + 64);
  id v2 = (void (**)(void, void))MEMORY[0x2455D9A50](v18);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_3;
    v16[3] = &unk_265086238;
    BOOL v17 = v2;
    [v4 enumerateClientZones:v16];
    uint64_t v5 = v17;
LABEL_7:

    uint64_t v8 = [*(id *)(a1 + 32) clientDB];
    [v8 forceBatchStart];
    goto LABEL_8;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 66))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_4;
    v14[3] = &unk_265086238;
    __int16 v15 = v2;
    [v6 enumeratePrivateClientZones:v14];
    uint64_t v5 = v15;
    goto LABEL_7;
  }
  int v7 = [*(id *)(a1 + 32) appLibraryByID:*(void *)(a1 + 40)];
  uint64_t v5 = [v7 defaultClientZone];

  if (v5)
  {
    ((void (**)(void, void *))v3)[2](v3, v5);
    goto LABEL_7;
  }
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);
LABEL_8:
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2_678(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 setStateBits:0x400000];
  }
  else {
    return [a2 clearStateBits:0x400000];
  }
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_3(uint64_t a1)
{
  return 1;
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_4(uint64_t a1)
{
  return 1;
}

- (void)verifyAccountLoaded:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient verifyAccountLoaded:]", 5080, v16);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v16[0];
    qos_class_t v8 = qos_class_self();
    id v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v18 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2080;
    __int16 v24 = "-[BRCXPCRegularIPCsClient verifyAccountLoaded:]";
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__BRCXPCRegularIPCsClient_verifyAccountLoaded___block_invoke;
  v14[3] = &unk_265080B38;
  void v14[4] = self;
  id v10 = v4;
  id v15 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v14);

  if (v11)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v16);
}

void __47__BRCXPCRegularIPCsClient_verifyAccountLoaded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_t_getEntitlementsForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  v5[2](v5, 0);
}

- (void)_t_getEntitledContainerIDsForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  v5[2](v5, 0);
}

- (void)_t_extractMetadataForAllContainersWithReply:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient _t_extractMetadataForAllContainersWithReply:]", 5989, v48);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v48[0];
    qos_class_t v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    __int16 v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v57 = v9;
    *(_WORD *)uint64_t v58 = 2080;
    *(void *)&v58[2] = "-[BRCXPCRegularIPCsClient _t_extractMetadataForAllContainersWithReply:]";
    *(_WORD *)&v58[10] = 2112;
    *(void *)&v58[12] = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v10 = (void *)*MEMORY[0x263F323E0];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke;
  uint64_t v46[3] = &unk_265080B38;
  v46[4] = self;
  id v33 = v4;
  id v47 = v33;
  int v11 = _brc_ipc_check_entitlement_and_logged_status(self, 0, v10, v46);

  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v57 = __Block_byref_object_copy__48;
    *(void *)uint64_t v58 = __Block_byref_object_dispose__48;
    *(void *)&v58[8] = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    __int16 v12 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v13)
    {
      uint64_t v35 = *(void *)v43;
      obuint64_t j = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          BOOL v16 = [(BRCXPCClient *)self bundleID];
          BOOL v17 = [(BRCXPCClient *)self session];
          id v18 = [v17 appLibraryByID:v15];

          if (!v18)
          {
            char v28 = brc_bread_crumbs();
            int v29 = brc_default_log();
            if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
              -[BRCXPCRegularIPCsClient updateContainerMetadataForID:]();
            }

LABEL_17:
            __int16 v12 = obj;
            goto LABEL_18;
          }
          __int16 v19 = BRCBundleServiceConnection();
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_682;
          uint64_t v40[3] = &unk_26507EBD8;
          id v20 = v19;
          id v41 = v20;
          __int16 v21 = [v20 remoteObjectProxyWithErrorHandler:v40];
          __int16 v22 = [v18 containerMetadata];
          __int16 v23 = [v22 versionNumberForBundleIdentifier:v16];

          dispatch_group_t v24 = dispatch_group_create();
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_2;
          uint64_t v36[3] = &unk_265086288;
          v36[4] = v15;
          uint64_t v39 = buf;
          id v25 = v20;
          id v37 = v25;
          uint64_t v26 = v24;
          char v38 = v26;
          [v21 extractMetadataForContainerID:v15 bundleID:v16 minimumBundleVersion:v23 reply:v36];
          dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
          BOOL v27 = *(void *)(*(void *)&buf[8] + 40) == 0;

          if (!v27) {
            goto LABEL_17;
          }
        }
        __int16 v12 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    uint64_t v30 = brc_bread_crumbs();
    __int16 v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v49 = 138412802;
      id v50 = self;
      __int16 v51 = 2112;
      uint64_t v52 = v32;
      __int16 v53 = 2112;
      char v54 = v30;
      _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v49, 0x20u);
    }

    (*((void (**)(id, void))v33 + 2))(v33, *(void *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
  }
  __brc_leave_section(v48);
}

void __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_682(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] can't extract metadata for %@: %@%@", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = v7;
    __int16 v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] extracted metadata for %@: %@%@", (uint8_t *)&v16, 0x20u);
    }
  }
  [*(id *)(a1 + 40) invalidate];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)lookupExcludedFilenamesForLogoutWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupExcludedFilenamesForLogoutWithReply:]", 6037, v18);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient lookupExcludedFilenamesForLogoutWithReply:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__BRCXPCRegularIPCsClient_lookupExcludedFilenamesForLogoutWithReply___block_invoke;
  uint64_t v16[3] = &unk_265080B38;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v11)
  {
    __int16 v12 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v13 = [v12 excludedFilenamesWorthWarningAtLogout];

    brc_bread_crumbs();
    uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      dispatch_group_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v13, 0);
  }
  __brc_leave_section(v18);
}

void __69__BRCXPCRegularIPCsClient_lookupExcludedFilenamesForLogoutWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lookupExcludedExtensionsForLogoutWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupExcludedExtensionsForLogoutWithReply:]", 6047, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient lookupExcludedExtensionsForLogoutWithReply:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__BRCXPCRegularIPCsClient_lookupExcludedExtensionsForLogoutWithReply___block_invoke;
  uint64_t v16[3] = &unk_265080B38;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v11)
  {
    id v12 = +[BRCUserDefaults defaultsForMangledID:0];
    __int16 v13 = [v12 excludedExtensionsWorthPreserving];

    brc_bread_crumbs();
    uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      dispatch_group_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v13, 0);
  }
  __brc_leave_section(v18);
}

void __70__BRCXPCRegularIPCsClient_lookupExcludedExtensionsForLogoutWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lookupMinFileSizeForThumbnailTransferWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupMinFileSizeForThumbnailTransferWithReply:]", 6057, v22);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    dispatch_group_t v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    char v28 = v9;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRCXPCRegularIPCsClient lookupMinFileSizeForThumbnailTransferWithReply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__BRCXPCRegularIPCsClient_lookupMinFileSizeForThumbnailTransferWithReply___block_invoke;
  uint64_t v20[3] = &unk_265080B38;
  v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v20);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSNumber;
      uint64_t v15 = +[BRCUserDefaults defaultsForMangledID:0];
      objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "minFileSizeForThumbnailTransfer"));
      int v16 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      dispatch_group_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      char v28 = 0;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v17 = NSNumber;
    __int16 v18 = +[BRCUserDefaults defaultsForMangledID:0];
    id v19 = objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v18, "minFileSizeForThumbnailTransfer"));
    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
  __brc_leave_section(v22);
}

void __74__BRCXPCRegularIPCsClient_lookupMinFileSizeForThumbnailTransferWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updatePrivilegesDescriptor
{
}

- (void)queryTelemetryEnablementWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient queryTelemetryEnablementWithReply:]", 6073, v18);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v18[0];
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v21 = 2112;
    *(void *)uint64_t v22 = self;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v10;
    *(_WORD *)&v22[18] = 2080;
    *(void *)&v22[20] = "-[BRCXPCRegularIPCsClient queryTelemetryEnablementWithReply:]";
    __int16 v23 = 2112;
    dispatch_group_t v24 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__BRCXPCRegularIPCsClient_queryTelemetryEnablementWithReply___block_invoke;
  uint64_t v16[3] = &unk_265080B38;
  void v16[4] = self;
  id v11 = v5;
  id v17 = v11;
  int v12 = _brc_ipc_spi(self, 1, (uint64_t)a2, v16);

  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = +[BRCAnalyticsReporter isTelemetryReportingEnabled];
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 1024;
      *(_DWORD *)uint64_t v22 = v15;
      *(_WORD *)&void v22[4] = 2112;
      *(void *)&v22[6] = 0;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, BOOL, void))v11 + 2))(v11, +[BRCAnalyticsReporter isTelemetryReportingEnabled], 0);
  }
  __brc_leave_section(v18);
}

void __61__BRCXPCRegularIPCsClient_queryTelemetryEnablementWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)corruptDatabase:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient corruptDatabase:]", 6082, v18);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient corruptDatabase:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  int v10 = (void *)*MEMORY[0x263F323E0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__BRCXPCRegularIPCsClient_corruptDatabase___block_invoke;
  uint64_t v16[3] = &unk_265080B38;
  void v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32360] code:10000 userInfo:0];
    __int16 v13 = [(BRCXPCClient *)self session];
    [v13 dbBecameCorruptedWithDescription:@"Testing brctl reset corrupt-db" error:v12];

    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      __int16 v23 = 2112;
      dispatch_group_t v24 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __43__BRCXPCRegularIPCsClient_corruptDatabase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)waitUntilIdle:(id)a3 timeout:(id)a4 reply:(id)a5
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v48 = a4;
  id v7 = a5;
  memset(v77, 0, sizeof(v77));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6095, v77);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v77[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v89 = v12;
    *(_WORD *)__int16 v90 = 2080;
    *(void *)&v90[2] = "-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]";
    *(_WORD *)&v90[10] = 2112;
    *(void *)&v90[12] = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x263F323E0];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  void v75[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke;
  uint64_t v75[3] = &unk_265080B38;
  v75[4] = self;
  id v50 = v7;
  id v76 = v50;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v75);

  if (v13)
  {
    memset(v74, 0, sizeof(v74));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6099, v74);
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v74[0];
      qos_class_t v17 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
      __int16 v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v89 = v18;
      *(_WORD *)__int16 v90 = 2080;
      *(void *)&v90[2] = "-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]";
      *(_WORD *)&v90[10] = 2112;
      *(void *)&v90[12] = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_687;
    uint64_t v72[3] = &unk_265080B38;
    v72[4] = self;
    id v47 = v50;
    id v73 = v47;
    int v19 = _brc_ipc_check_applibraries_access(self, 1, v72);

    if (v19)
    {
      __int16 v20 = [(BRCXPCClient *)self session];
      id v71 = 0;
      id v46 = [v20 appLibrariesMatchingSearchString:v49 error:&v71];
      long long v45 = (uint64_t (*)(uint64_t, uint64_t))v71;

      uint64_t v52 = objc_opt_new();
      if (v46)
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v21 = v46;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v87 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v68 != v23) {
                objc_enumerationMutation(v21);
              }
              __int16 v25 = [*(id *)(*((void *)&v67 + 1) + 8 * i) defaultClientZone];
              [v52 addObject:v25];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v87 count:16];
          }
          while (v22);
        }

        uint64_t v26 = dispatch_group_create();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v89 = __Block_byref_object_copy__48;
        *(void *)__int16 v90 = __Block_byref_object_dispose__48;
        *(void *)&v90[8] = 0;
        long long v63 = 0uLL;
        uint64_t v64 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6115, &v63);
        __int16 v27 = brc_bread_crumbs();
        char v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v78 = 134218498;
          __int16 v79 = (BRCXPCRegularIPCsClient *)v63;
          __int16 v80 = 2112;
          id v81 = v52;
          __int16 v82 = 2112;
          id v83 = v27;
          _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for %@ to be idle%@", v78, 0x20u);
        }

        long long v65 = v63;
        uint64_t v66 = v64;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        obuint64_t j = v52;
        uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v86 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v60 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              uint64_t v33 = [v32 defaultAppLibrary];
              [(BRCXPCClient *)self addAppLibrary:v33];

              dispatch_group_enter(v26);
              id v34 = [(BRCXPCClient *)self description];
              v54[0] = MEMORY[0x263EF8330];
              v54[1] = 3221225472;
              v54[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_688;
              uint64_t v54[3] = &unk_2650862B0;
              long long v57 = v65;
              uint64_t v58 = v66;
              uint64_t v56 = buf;
              void v54[4] = v32;
              char v55 = v26;
              [v32 notifyClient:v34 whenIdle:v54];
            }
            uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v86 count:16];
          }
          while (v29);
        }

        if (v48) {
          dispatch_time_t v35 = dispatch_time(0, 1000000000 * [v48 unsignedLongLongValue]);
        }
        else {
          dispatch_time_t v35 = -1;
        }
        if (dispatch_group_wait(v26, v35))
        {
          char v38 = brc_bread_crumbs();
          uint64_t v39 = brc_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            BOOL v40 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"Timed out while waiting for %@ to be idle.", obj);
            *(_DWORD *)uint64_t v78 = 138413058;
            __int16 v79 = self;
            __int16 v80 = 2112;
            id v81 = (void *)MEMORY[0x263EFFA80];
            __int16 v82 = 2112;
            id v83 = v40;
            __int16 v84 = 2112;
            long long v85 = v38;
            _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", v78, 0x2Au);
          }
          id v41 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"Timed out while waiting for %@ to be idle.", obj);
          (*((void (**)(id, void, void *))v47 + 2))(v47, MEMORY[0x263EFFA80], v41);
        }
        else
        {
          long long v42 = brc_bread_crumbs();
          long long v43 = brc_default_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            long long v44 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v78 = 138413058;
            __int16 v79 = self;
            __int16 v80 = 2112;
            id v81 = v44;
            __int16 v82 = 2112;
            id v83 = 0;
            __int16 v84 = 2112;
            long long v85 = v42;
            _os_log_impl(&dword_23FA42000, v43, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", v78, 0x2Au);
          }

          (*((void (**)(id, void, void))v47 + 2))(v47, *(void *)(*(void *)&buf[8] + 40), 0);
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v36 = brc_bread_crumbs();
        id v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2112;
          id v89 = v45;
          *(_WORD *)__int16 v90 = 2112;
          *(void *)&v90[2] = v36;
          _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, void, uint64_t (*)(uint64_t, uint64_t)))v47 + 2))(v47, 0, v45);
      }
    }
    __brc_leave_section(v74);
  }
  __brc_leave_section(v77);
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_687(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_688(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  long long v13 = *(_OWORD *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue];
    __int16 v11 = @"now";
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    if (v10) {
      __int16 v11 = @"already";
    }
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ is %@ idle%@", buf, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v13);
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Parent item remotely deleted: %@%@", (void)v3, DWORD2(v3));
}

void __135__BRCXPCRegularIPCsClient_FPFSAdditions__createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler___block_invoke_51_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Parent Item of trashed item is %@%@");
}

void __87__BRCXPCRegularIPCsClient_FPFSAdditions__listNonLocalVersionsWithItemIdentifier_reply___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: localItem && localItem.isDocument%@", v2, v3, v4, v5, v6);
}

void __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Scheduling download of %@ again due to a more recent version%@", (void)v3, DWORD2(v3));
}

void __151__BRCXPCRegularIPCsClient_FPFSAdditions___createFileProvidingRequestOperationOfFileObject_localItem_etagIfLoser_etagToDownload_progress_options_reply___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 80);
  uint8_t v6 = BRCPrettyPrintBitmap();
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleanup download job and progress for %@ - options %@%@", (uint8_t *)&v7, 0x20u);
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Waiting for sync down of the item to complete before download for %@%@", (void)v3, DWORD2(v3));
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_99_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Download for thumbnail only was asked, but the file is not small.%@", v1, 0xCu);
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_103_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Waiting for sync down of the item to complete before download for %@%@", (void)v3, DWORD2(v3));
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_104_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) itemID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] item with id [%@] still don't exist after sync down --> return with failure%@", v4, v5, v6, v7, v8);
}

void __92__BRCXPCRegularIPCsClient_FPFSAdditions__startDownloadFileObject_options_etagIfLoser_reply___block_invoke_106_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] The accept share op [%@] failed --> return with failure%@", v4, v5, v6, v7, v8);
}

void __105__BRCXPCRegularIPCsClient_FPFSAdditions__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Rejecting deletion of app library root, or root container%@", v2, v3, v4, v5, v6);
}

void __107__BRCXPCRegularIPCsClient_FPFSAdditions__getPublishedURLForItemIdentifier_forStreaming_requestedTTL_reply___block_invoke_134_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] no local item for %@%@", (void)v3, DWORD2(v3));
}

void __91__BRCXPCRegularIPCsClient_FPFSAdditions__calculateSignatureForItemIdentifier_forURL_reply___block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !boundaryKey || doc.clientZone.enhancedDrivePrivacyEnabled%@", v2, v3, v4, v5, v6);
}

void __116__BRCXPCRegularIPCsClient_FPFSAdditions__validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply___block_invoke_163_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to reimport root container: %@%@");
}

- (void)updateContainerMetadataForID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] nonexistant container %@%@");
}

- (void)getItemUpdateSenderWithReceiver:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] receiver: %@%@");
}

- (void)getTotalApplicationDocumentUsageWithReply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Delegating the call to FP to get the accumulated sizes in %@%@");
}

void __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_330_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] no metadata for %@%@");
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:reply:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┳%llx timed-out: zone health sync%@", (void)v3, DWORD2(v3));
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:reply:.cold.2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┣%llx waiting for zone health sync down%@", (void)v3, DWORD2(v3));
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] received an error while syncing down zone health: %@%@");
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_392_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┳%llx finished sync down zone health%@", (void)v3, DWORD2(v3));
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_393_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┳%llx finished syncing zone health%@", (void)v3, DWORD2(v3));
}

- (void)forceSyncWithBarrierContainerID:timeout:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Requesting force sync on the special container %@ that doesn't have an app library.%@");
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_397_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] received an error while syncing container: %@%@");
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_398_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] received an error while trigger sync for container: %@%@");
}

- (void)validateCloudDocsSupported:withReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [error.userInfo[@ICD_VOLUME_NOT_SUPPORTED_FOR_FPFS_REASON_KEY] isKindOfClass:NSNumber.class]%@", v2, v3, v4, v5, v6);
}

- (void)createAccountWithACAccountID:dsid:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: asked to login to a non migrated account%@", v2, v3, v4, v5, v6);
}

- (void)createAccountWithACAccountID:dsid:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] accountID: %@%@");
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_421_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] can't create account: %@%@");
}

- (void)logoutAccountWithACAccountID:(char)a1 reply:.cold.1(char a1)
{
  os_log_t v1 = @"was successful";
  if ((a1 & 1) == 0) {
    os_log_t v1 = @"failed";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] Logout of account %@%@", (void)v4, DWORD2(v4));
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_432_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] can't update account: %@%@");
}

- (void)userVerifiedTermsWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] User verified terms --> signalling FP to resolve the error%@", v2, v3, v4, v5, v6);
}

void __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke_434_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Signalling FP complete with error %@%@");
}

- (void)resolveBookmarkDataToURL:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] data: %@%@");
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_455_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Unable to locate item with id %@%@", buf, 0x16u);
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = "-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]_block_invoke";
  __int16 v5 = 2080;
  uint8_t v6 = "(passed to caller)";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] refetching quota%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Asked to enumerate migrating item %@%@");
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_495_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] enumerating children of %@%@");
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: only got sharing key or base token, didn't get both%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: sharing key of unexpected class%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: base token of unexpected class%@", v2, v3, v4, v5, v6);
}

- (void)_startOperation:toCopySharingInfoWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] starting operation to copy sharing info at %@%@");
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint8_t v6 = [a1 values];
  __int16 v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
  uint64_t v8 = [a1 participants];
  int v9 = 138412802;
  uint64_t v10 = v7;
  __int16 v11 = 2048;
  uint64_t v12 = [v8 count];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Share %@ has %lu participants%@", (uint8_t *)&v9, 0x20u);
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: result == nil || [result isKindOfClass:[NSDictionary class]]%@", v2, v3, v4, v5, v6);
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_603_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] no local item for %@%@", (void)v3, DWORD2(v3));
}

- (void)_createSharingInfoForLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] creating sharing info for item %@%@");
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_605_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Creating share for item %@%@");
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Ignoring share save on empty share with no etag %@%@");
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Adding %@ as a dependency on share save%@");
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Saving share %@%@");
}

- (void)startOperation:toUnshareShare:forceDelete:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Destroying share info for share %@%@");
}

- (void)startOperation:toLookupShareParticipants:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Copying share participants for identities %@%@");
}

- (void)_startOperation:toModifyRecordAccessWithLocalItem:allowAccess:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] modifying record access at item %@%@");
}

- (void)_startOperation:toCopyParticipantTokenWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] copying participant token on item %@%@");
}

- (void)_startOperation:toPrepFolderForSharingWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: item.clientZone.isPrivateZone%@", v2, v3, v4, v5, v6);
}

- (void)_startOperation:toPrepFolderForSharingWithLocalItem:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] preparing folder for sharing at item %@%@");
}

- (void)_startOperation:toProcessSubitemsWithLocalItem:maxSubsharesFailures:processType:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] processing subitems at item %@%@");
}

- (void)startOperation:toCopyShareURLForShare:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] copying url for share %@%@");
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] couldn't find an item for fileObjectID=%@%@");
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_646_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] fileObjectID: %@%@");
}

- (void)_presentAcceptDialogsWithMetadata:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] An accept operation is already running for %@%@");
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_652_cold_1(uint64_t a1)
{
  os_log_t v1 = "YES";
  if (!*(unsigned char *)(a1 + 40)) {
    os_log_t v1 = "NO";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] Should keep data local on sign out [%s]%@", (void)v4, DWORD2(v4));
}

@end