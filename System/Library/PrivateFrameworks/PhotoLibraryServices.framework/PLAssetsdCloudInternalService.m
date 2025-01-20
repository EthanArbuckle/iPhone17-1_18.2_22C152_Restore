@interface PLAssetsdCloudInternalService
- (PLAssetsdCloudInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4;
- (id)activateLibraryScopeWithUUID:(id)a3 reply:(id)a4;
- (id)markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:(id)a3 excludePersonUUIDs:(id)a4 reply:(id)a5;
- (void)acceptShareWithUUID:(id)a3 reply:(id)a4;
- (void)cloudSharingSpaceManagementRequestWithType:(unint64_t)a3 optionalBytesToPurge:(unint64_t)a4 reply:(id)a5;
- (void)confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:(id)a3 reply:(id)a4;
- (void)createPhotostreamAlbumWithStreamID:(id)a3;
- (void)deactivateLibraryScopeWithUUID:(id)a3 reply:(id)a4;
- (void)emailAddressForKey:(int64_t)a3 reply:(id)a4;
- (void)enablePhotostreamsWithStreamID:(id)a3;
- (void)fetchShareWithURL:(id)a3 ignoreExistingShare:(BOOL)a4 reply:(id)a5;
- (void)forceParticipantAssetTrashNotificationWithReply:(id)a3;
- (void)forceSyncMomentShareWithUUID:(id)a3 reply:(id)a4;
- (void)getCPLConfigrationValueForKey:(id)a3 reply:(id)a4;
- (void)getCPLSettingsWithReply:(id)a3;
- (void)getCurrentTransferProgress:(id)a3;
- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 reply:(id)a4;
- (void)getNotUploadedCount:(id)a3;
- (void)getResetSyncStatusWithReply:(id)a3;
- (void)getSystemBudgetsWithReply:(id)a3;
- (void)isComputeSyncEnabledForDirection:(int64_t)a3 reply:(id)a4;
- (void)isReadyForAnalysisCPLInitialDownloadCompletedWithReply:(id)a3;
- (void)isReadyForAnalysisQuickCheckWithReply:(id)a3;
- (void)isReadyForAnalysisWithReply:(id)a3;
- (void)isReadyForCloudPhotoLibraryWithReply:(id)a3;
- (void)keyForEmailAddress:(id)a3 reply:(id)a4;
- (void)markResourcesPurgeableWithUrgency:(int64_t)a3 assetUuids:(id)a4 reply:(id)a5;
- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 reply:(id)a6;
- (void)personInfoDictionaryForPersonID:(id)a3 reply:(id)a4;
- (void)publishShareWithUUID:(id)a3 reply:(id)a4;
- (void)queryUserIdentitiesWithEmails:(id)a3 phoneNumbers:(id)a4 reply:(id)a5;
- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 reply:(id)a5;
- (void)refreshLibraryScopeWithIdentifier:(id)a3 reply:(id)a4;
- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 reply:(id)a7;
- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 reply:(id)a4;
- (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:(id)a3;
- (void)runComputeSyncBackfillMigrationSynchronously;
- (void)setCloudPhotoLibraryEnabledState:(BOOL)a3;
- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4;
- (void)setPersonInfoDictionary:(id)a3 forPersonID:(id)a4;
- (void)setPrefetchMode:(int64_t)a3 reply:(id)a4;
- (void)sharedLibraryRampCheckWithReply:(id)a3;
- (void)shouldAutoEnableiCPLOnOSXWithReply:(id)a3;
- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 reply:(id)a6;
- (void)syncCloudPhotoLibrary;
- (void)unsharePendingAssetsSharedToScopeWithIdentifier:(id)a3;
- (void)updateSharedAlbumsCachedServerConfigurationLimits;
- (void)userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:(id)a3;
@end

@implementation PLAssetsdCloudInternalService

- (void)getCPLSettingsWithReply:(id)a3
{
  id v5 = a3;
  id v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v6 = [v7 cplSettings];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void).cxx_destruct
{
}

- (void)isComputeSyncEnabledForDirection:(int64_t)a3 reply:(id)a4
{
  v6 = (void (**)(id, BOOL, id))a4;
  id v7 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService isComputeSyncEnabledForDirection:reply:]");
  id v10 = 0;
  BOOL v8 = +[PLManagedAsset isComputeSyncEnabledForDirection:a3 library:v7 debugMode:1 debugLog:&v10];
  id v9 = v10;
  v6[2](v6, v8, v9);
}

- (void)runComputeSyncBackfillMigrationSynchronously
{
  id v2 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService runComputeSyncBackfillMigrationSynchronously]");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PLAssetsdCloudInternalService_runComputeSyncBackfillMigrationSynchronously__block_invoke;
  v4[3] = &unk_1E5875CE0;
  id v5 = v2;
  id v3 = v2;
  [v3 performTransactionAndWait:v4];
}

uint64_t __77__PLAssetsdCloudInternalService_runComputeSyncBackfillMigrationSynchronously__block_invoke(uint64_t a1)
{
  return +[PLManagedAsset runComputeSyncBackfillTaskOnProcessedAssets:*(void *)(a1 + 32)];
}

- (void)setPrefetchMode:(int64_t)a3 reply:(id)a4
{
  v6 = (void (**)(id, BOOL, id))a4;
  id v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v8 = [v7 libraryBundle];
  id v11 = 0;
  BOOL v9 = +[PLCPLSettings setPrefetchMode:a3 withLibraryBundle:v8 error:&v11];
  id v10 = v11;

  v6[2](v6, v9, v10);
}

- (void)getCPLConfigrationValueForKey:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v16 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((void *)&v16 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getCPLConfigrationValueForKey:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  BOOL v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v10 = [v9 directServerConfiguration];

  [v10 check];
  id v11 = [v10 valueForKey:v6];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v6;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "CPL configuration value for key %{public}@ is not a dictionary", buf, 0xCu);
      }

      id v11 = 0;
    }
  }
  v7[2](v7, v11);

  if (v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    v13 = PLRequestGetLog();
    v14 = v13;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)markResourcesPurgeableWithUrgency:(int64_t)a3 assetUuids:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v32) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: markResourcesPurgeableWithUrgency:assetUuids:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService markResourcesPurgeableWithUrgency:assetUuids:reply:]");
  if (v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"localAvailability", 1);
    v15 = [v8 firstObject];
    char v16 = [v15 isEqualToString:@"all"];

    if ((v16 & 1) == 0)
    {
      char v17 = (void *)MEMORY[0x1E4F28BA0];
      v35[0] = v14;
      long long v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset.uuid", v8];
      v35[1] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      uint64_t v20 = [v17 andPredicateWithSubpredicates:v19];

      v14 = (void *)v20;
    }
    v21 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v22 = [v21 cloudPhotoLibraryManager];
    if (v22)
    {
      if (a3 == -1)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke;
        v30[3] = &unk_1E5875198;
        id v31 = v9;
        [v22 clearPurgeableResourcesMatchingPredicate:v14 inLibrary:v13 completionHandler:v30];
        v23 = v31;
      }
      else
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke_2;
        v28[3] = &unk_1E5875198;
        id v29 = v9;
        [v22 markPurgeableResourcesMatchingPredicate:v14 urgency:a3 inLibrary:v13 completionHandler:v28];
        v23 = v29;
      }
    }
    else
    {
      v23 = (void *)PLErrorCreate();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v23);
    }
  }
  else
  {
    v14 = (void *)PLErrorCreate();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
  }

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    v24 = PLRequestGetLog();
    v25 = v24;
    os_signpost_id_t v26 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v37 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsharePendingAssetsSharedToScopeWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: unsharePendingAssetsSharedToScopeWithIdentifier:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v7 = [v6 cloudPhotoLibraryManager];
  [v7 startUnsharingPendingAssetsSharedToScopeWithIdentifier:v4];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    id v8 = PLRequestGetLog();
    id v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      char v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getLibraryScopeStatusCountsForScopeWithIdentifier:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  long long v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  char v12 = [v11 cloudPhotoLibraryManager];

  if (v12)
  {
    long long v13 = [v11 cloudPhotoLibraryManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__PLAssetsdCloudInternalService_getLibraryScopeStatusCountsForScopeWithIdentifier_reply___block_invoke;
    v21[3] = &unk_1E5869570;
    id v22 = v7;
    [v13 getLibraryScopeStatusCountsForScopeWithIdentifier:v6 completionHandler:v21];

    v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @"PLCloudPhotoLibraryManager not available";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    char v16 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v14];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v17 = PLRequestGetLog();
    long long v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __89__PLAssetsdCloudInternalService_getLibraryScopeStatusCountsForScopeWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshLibraryScopeWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: refreshLibraryScopeWithIdentifier:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  long long v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  char v12 = [v11 cloudPhotoLibraryManager];

  if (v12)
  {
    long long v13 = [v11 cloudPhotoLibraryManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PLAssetsdCloudInternalService_refreshLibraryScopeWithIdentifier_reply___block_invoke;
    v21[3] = &unk_1E5869548;
    id v22 = v7;
    [v13 refreshLibraryScopeWithIdentifier:v6 completionHandler:v21];

    v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @"PLCloudPhotoLibraryManager not available";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    char v16 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v14];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v17 = PLRequestGetLog();
    long long v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __73__PLAssetsdCloudInternalService_refreshLibraryScopeWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceParticipantAssetTrashNotificationWithReply:(id)a3
{
  id v4 = a3;
  id v5 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService forceParticipantAssetTrashNotificationWithReply:]");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PLAssetsdCloudInternalService_forceParticipantAssetTrashNotificationWithReply___block_invoke;
  v8[3] = &unk_1E58742F0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 performTransactionAndWait:v8];
}

void __81__PLAssetsdCloudInternalService_forceParticipantAssetTrashNotificationWithReply___block_invoke(uint64_t a1)
{
  id v2 = +[PLLibraryScope fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:*(void *)(a1 + 32) forceNotification:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__37741;
  v12[4] = __Block_byref_object_dispose__37742;
  id v13 = 0;
  id v5 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:]");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__PLAssetsdCloudInternalService_userViewedSharedLibraryParticipantAssetTrashNotificationWithReply___block_invoke;
  v8[3] = &unk_1E58753C0;
  id v6 = v5;
  id v9 = v6;
  long long v11 = v12;
  id v7 = v4;
  id v10 = v7;
  [v6 performTransactionAndWait:v8];

  _Block_object_dispose(v12, 8);
}

void __99__PLAssetsdCloudInternalService_userViewedSharedLibraryParticipantAssetTrashNotificationWithReply___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v2];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) managedObjectContext];
    [v3 userViewedAssetTrashNotificationWithManagedObjectContext:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"No active Library scope found";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)sharedLibraryRampCheckWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: sharedLibraryRampCheckWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v9 = [v8 cloudPhotoLibraryManager];
  uint64_t v10 = [v9 cplConfiguration];
  long long v11 = v10;
  if (!v10) {
    goto LABEL_15;
  }
  char v12 = [v10 valueForKey:@"feature.sharedlibrary.skiprampcheck"];
  id v13 = v12;
  if (v12 && [v12 BOOLValue])
  {
    v14 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "PLShouldShowSharedLibrarySetting: Returning YES because CPLConfiguration says we should skip the ramp check", buf, 2u);
    }

    v4[2](v4, 1, 0);
    goto LABEL_16;
  }
  v15 = [v11 valueForKey:@"feature.sharedlibrary.hidesetting"];
  char v16 = v15;
  if (!v15 || ![v15 BOOLValue])
  {

LABEL_15:
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__PLAssetsdCloudInternalService_sharedLibraryRampCheckWithReply___block_invoke;
    v22[3] = &unk_1E5874DE8;
    long long v23 = v4;
    [v9 sharedLibraryRampCheckWithCompletionHandler:v22];
    id v13 = v23;
    goto LABEL_16;
  }
  uint64_t v17 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "PLShouldShowSharedLibrarySetting: Returning NO because CPLConfiguration says we should hide the setting", buf, 2u);
  }

  v4[2](v4, 0, 0);
LABEL_16:

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    long long v18 = PLRequestGetLog();
    os_signpost_id_t v19 = v18;
    os_signpost_id_t v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __65__PLAssetsdCloudInternalService_sharedLibraryRampCheckWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 reply:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  long long v36 = 0u;
  *(_OWORD *)sel = 0u;
  long long v35 = 0u;
  int v15 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v35) = v15;
  if (v15)
  {
    char v16 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v17 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v16;

    os_activity_scope_enter(v16, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__37741;
  v41 = __Block_byref_object_dispose__37742;
  id v42 = 0;
  id v18 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:]");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __136__PLAssetsdCloudInternalService_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke;
  v27[3] = &unk_1E5869520;
  id v19 = v13;
  id v28 = v19;
  id v20 = v18;
  id v29 = v20;
  id v21 = v12;
  id v30 = v21;
  int64_t v33 = a5;
  int64_t v34 = a6;
  id v22 = v14;
  id v31 = v22;
  p_long long buf = &buf;
  [v20 performTransactionAndWait:v27];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    long long v23 = PLRequestGetLog();
    long long v24 = v23;
    os_signpost_id_t v25 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __136__PLAssetsdCloudInternalService_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithScopeIdentifier:v2 includeTrashed:1 inManagedObjectContext:v3];

  if (v4)
  {
    [v4 removeParticipantsWithParticipantUUIDs:*(void *)(a1 + 48) fromLibraryScopeWithIdentifier:*(void *)(a1 + 32) retentionPolicy:*(void *)(a1 + 72) exitSource:*(unsigned __int16 *)(a1 + 80) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [NSString stringWithFormat:@"Library scope with scopeIdentifier %@ not found", *(void *)(a1 + 32), *MEMORY[0x1E4F28568]];
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v5 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 reply:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  int v12 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v30) = v12;
  if (v12)
  {
    id v13 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__37741;
  long long v36 = __Block_byref_object_dispose__37742;
  id v37 = 0;
  id v15 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:]");
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__PLAssetsdCloudInternalService_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke;
  v23[3] = &unk_1E58694F8;
  id v16 = v10;
  id v24 = v16;
  id v17 = v15;
  id v25 = v17;
  int64_t v28 = a4;
  int64_t v29 = a5;
  id v18 = v11;
  id v26 = v18;
  p_long long buf = &buf;
  [v17 performTransactionAndWait:v23];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    id v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __106__PLAssetsdCloudInternalService_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithScopeIdentifier:v2 includeTrashed:1 inManagedObjectContext:v3];

  if (v4)
  {
    [v4 startExitWithRetentionPolicy:*(void *)(a1 + 64) exitSource:*(unsigned __int16 *)(a1 + 72) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [NSString stringWithFormat:@"Library scope with scopeIdentifier %@ not found", *(void *)(a1 + 32), *MEMORY[0x1E4F28568]];
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v5 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v18) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__37741;
  id v24 = __Block_byref_object_dispose__37742;
  id v25 = 0;
  id v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:]");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PLAssetsdCloudInternalService_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply___block_invoke;
  v15[3] = &unk_1E5875E68;
  p_long long buf = &buf;
  id v9 = v8;
  id v16 = v9;
  [v9 performTransactionAndWait:v15];
  id v10 = (void (*)(void *, uint64_t))v4[2];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v10(v4, 0);
  }
  else {
    v10(v4, 1);
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    uint64_t v11 = PLRequestGetLog();
    int v12 = v11;
    os_signpost_id_t v13 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v13, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __99__PLAssetsdCloudInternalService_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = +[PLLibraryScope resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v20 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v19) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: requestDeviceLibraryConfigurationChange:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v19 + 1);
    *((void *)&v19 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v11 = [v10 cloudPhotoLibraryManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PLAssetsdCloudInternalService_requestDeviceLibraryConfigurationChange_reply___block_invoke;
  v17[3] = &unk_1E58694D0;
  id v12 = v6;
  id v18 = v12;
  [v11 requestDeviceLibraryConfigurationChange:a3 completionHandler:v17];

  if ((_BYTE)v19) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  }
  if ((void)v20)
  {
    os_signpost_id_t v13 = PLRequestGetLog();
    id v14 = v13;
    os_signpost_id_t v15 = v20;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __79__PLAssetsdCloudInternalService_requestDeviceLibraryConfigurationChange_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, BOOL, void))a4;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  int64_t v33 = __Block_byref_object_copy__37741;
  uint64_t v34 = __Block_byref_object_dispose__37742;
  id v35 = 0;
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:reply:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __104__PLAssetsdCloudInternalService_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID_reply___block_invoke;
  v19[3] = &unk_1E5874900;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  uint64_t v22 = &v24;
  p_long long buf = &buf;
  [v13 performTransactionAndWait:v19];
  if (*((unsigned char *)v25 + 24)) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
  }
  v7[2](v7, *((unsigned char *)v25 + 24) != 0, v14);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v24, 8);
  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __104__PLAssetsdCloudInternalService_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID_reply___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) libraryServicesManager];
    id v6 = [v5 databaseContext];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v4 confirmAllRemainingOnboardingPreviewAssetsWithProgress:0 databaseContext:v6 withError:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithFormat:@"Library scope %@ not found", *(void *)(a1 + 32)];
    v15[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v9 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v6];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:(id)a3 excludePersonUUIDs:(id)a4 reply:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v34 = 0u;
  *(_OWORD *)sel = 0u;
  long long v33 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v33) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:excludePersonUUIDs:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__37741;
  uint64_t v39 = __Block_byref_object_dispose__37742;
  id v40 = 0;
  uint64_t v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  os_signpost_id_t v15 = [v14 databaseContext];
  id v16 = (void *)[v15 newShortLivedCplLibraryWithNameSuffix:"-[PLAssetsdCloudInternalService markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:excludePersonUUIDs:reply:]"];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke;
  v27[3] = &unk_1E586D4A8;
  id v17 = v8;
  id v28 = v17;
  id v18 = v16;
  id v29 = v18;
  p_long long buf = &buf;
  id v19 = v9;
  id v30 = v19;
  id v20 = v10;
  id v31 = v20;
  [v18 performTransactionAndWait:v27];
  id v21 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    uint64_t v22 = PLRequestGetLog();
    long long v23 = v22;
    os_signpost_id_t v24 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21;
}

void __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke_2;
    v13[3] = &unk_1E5874D70;
    uint64_t v5 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    uint64_t v6 = [v4 markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:v5 completionHandler:v13];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = v14;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    int v11 = [NSString stringWithFormat:@"Library scope %@ not found", *(void *)(a1 + 32)];
    v16[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v9 = [v10 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v12];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: deactivateLibraryScopeWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService deactivateLibraryScopeWithUUID:reply:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke;
  v19[3] = &unk_1E5874868;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  [v13 performBlock:v19];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      char v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke(id *a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke_2;
    v9[3] = &unk_1E58734E8;
    id v10 = a1[4];
    id v11 = a1[6];
    [v4 deactivateScopeWithCompletionHandler:v9];

    uint64_t v5 = v10;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v7 = [NSString stringWithFormat:@"Library scope %@ not found", a1[4]];
    v13[0] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v5 = [v6 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v8];

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to deactivate library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Deactivated library scope with uuid: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)activateLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: activateLibraryScopeWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v10 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__37741;
  uint64_t v32 = __Block_byref_object_dispose__37742;
  id v33 = 0;
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService activateLibraryScopeWithUUID:reply:]");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke;
  v21[3] = &unk_1E58694A8;
  id v12 = v6;
  id v22 = v12;
  id v13 = v11;
  id v23 = v13;
  p_long long buf = &buf;
  id v14 = v7;
  id v24 = v14;
  [v13 performTransactionAndWait:v21];
  id v15 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v16 = PLRequestGetLog();
    os_signpost_id_t v17 = v16;
    os_signpost_id_t v18 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v15;
}

void __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke_2;
    v12[3] = &unk_1E58734E8;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 activateScopeWithCompletionHandler:v12];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    int v8 = v13;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    __int16 v10 = [NSString stringWithFormat:@"Library scope %@ not found", *(void *)(a1 + 32)];
    v16[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v8 = [v9 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to activate library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Activated library scope with uuid: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getResetSyncStatusWithReply:(id)a3
{
  uint64_t v7 = (void (**)(id, void))a3;
  id v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v5 = [v4 cloudPhotoLibraryManager];

  unint64_t v6 = [v5 currentResetSyncType];
  if (v6 <= 6) {
    v7[2](v7, qword_19BA9A998[v6]);
  }
}

- (void)forceSyncMomentShareWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: forceSyncMomentShareWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService forceSyncMomentShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PLAssetsdCloudInternalService_forceSyncMomentShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E5874868;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  [v13 performBlock:v19];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __68__PLAssetsdCloudInternalService_forceSyncMomentShareWithUUID_reply___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    switch([v4 status])
    {
      case 0u:
      case 2u:
        uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        id v6 = [NSString stringWithFormat:@"Cannot force sync a pending moment share %@", *(void *)(a1 + 32)];
        v18[0] = v6;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        int v8 = [v5 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:102 userInfo:v7];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_4;
      case 1u:
      case 3u:
LABEL_4:
        id v16 = v4;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
        +[PLMomentShare forceSyncMomentShares:v9 photoLibrary:*(void *)(a1 + 40)];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        break;
      default:
        break;
    }
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"Moment share %@ not found", *(void *)(a1 + 32)];
    uint64_t v15 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v13 = [v10 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v12];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)queryUserIdentitiesWithEmails:(id)a3 phoneNumbers:(id)a4 reply:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v44) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: queryUserIdentitiesWithEmails:phoneNumbers:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v8, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v41;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4F59978]) initWithEmail:*(void *)(*((void *)&v40 + 1) + 8 * v18)];
        [v14 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v16);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v9;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F59978]) initWithPhoneNumber:*(void *)(*((void *)&v36 + 1) + 8 * v23)];
        [v14 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v21);
  }

  id v25 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v26 = [v25 cloudPhotoLibraryManager];

  if (v26)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke;
    v34[3] = &unk_1E5869480;
    id v35 = v10;
    [v26 queryUserIdentitiesWithParticipants:v14 completionHandler:v34];
    long long v27 = v35;
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48 = @"PLCloudPhotoLibraryManager not available";
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v29 = [v28 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v27];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v29);
  }
  if ((_BYTE)v44) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  }
  if ((void)v45)
  {
    uint64_t v30 = PLRequestGetLog();
    id v31 = v30;
    os_signpost_id_t v32 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      Name = sel_getName(*((SEL *)&v46 + 1));
      *(_DWORD *)long long buf = 136446210;
      v52 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v31, OS_SIGNPOST_INTERVAL_END, v32, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke_2;
    v8[3] = &unk_1E5869458;
    id v9 = v6;
    id v7 = v6;
    [v5 enumerateObjectsUsingBlock:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 email];
  if (v4 || ([v3 phoneNumber], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasiCloudAccount"));
    [v5 setObject:v6 forKey:v4];
  }
  else
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Invalid fetched participant %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)acceptShareWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: acceptShareWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService acceptShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E5874868;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  [v13 performBlock:v19];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    id v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v4)
  {
    switch([v4 status])
    {
      case 0u:
      case 2u:
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_2;
        v12[3] = &unk_1E5875B30;
        id v15 = *(id *)(a1 + 48);
        id v13 = *(id *)(a1 + 40);
        id v14 = v4;
        [v14 acceptWithCompletionHandler:v12];

        break;
      case 1u:
        id v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28568];
        id v6 = [NSString stringWithFormat:@"Cannot accept an owned share %@", *(void *)(a1 + 32)];
        v19[0] = v6;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        int v8 = v10;
        uint64_t v9 = 102;
        goto LABEL_6;
      case 3u:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        break;
      default:
        break;
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithFormat:@"Share %@ not found", *(void *)(a1 + 32)];
    os_signpost_id_t v17 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    int v8 = v5;
    uint64_t v9 = 100;
LABEL_6:
    id v11 = [v8 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:v9 userInfo:v7];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to accept share: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_96;
    v6[3] = &unk_1E5875CE0;
    id v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 performBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_96(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) compactDescription];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Accepted share %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchShareWithURL:(id)a3 ignoreExistingShare:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F8B958];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  os_signpost_id_t v17 = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke;
  uint64_t v18 = &unk_1E5873CA8;
  id v19 = self;
  id v20 = v8;
  BOOL v22 = a4;
  id v21 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 operationWithName:@"Fetch Share URL" requiredState:7 parentProgress:0 execution:&v15];
  id v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  [v14 enqueueOperation:v13 error:0];
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  *(_OWORD *)sel = 0u;
  long long v16 = 0u;
  int v2 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v16) = v2;
  if (v2)
  {
    id v3 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: fetchShareWithURL:ignoreExistingShare:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v4 = (void *)*((void *)&v16 + 1);
    *((void *)&v16 + 1) = v3;

    os_activity_scope_enter(v3, (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  id v5 = (void *)[*(id *)(a1 + 32) newShortLivedLibraryWithName:"-[PLAssetsdCloudInternalService fetchShareWithURL:ignoreExistingShare:reply:]_block_invoke"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_2;
  v11[3] = &unk_1E5873CA8;
  id v12 = *(id *)(a1 + 40);
  id v6 = v5;
  id v13 = v6;
  char v15 = *(unsigned char *)(a1 + 56);
  id v14 = *(id *)(a1 + 48);
  [v6 performBlockAndWait:v11];

  if ((_BYTE)v16) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if ((void)v17)
  {
    id v7 = PLRequestGetLog();
    id v8 = v7;
    os_signpost_id_t v9 = v17;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_2(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  int v4 = +[PLShare shareWithShareURL:v2 includeTrashed:1 inManagedObjectContext:v3];

  id v5 = [v4 uuid];
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_3;
    v16[3] = &unk_1E5869430;
    id v17 = v7;
    id v18 = v5;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    +[PLShare fetchShareFromShareURL:v8 inPhotoLibrary:v17 completionHandler:v16];

    os_signpost_id_t v9 = v17;
  }
  else
  {
    os_signpost_id_t v9 = [v4 uuid];
    if ([v4 trashedState] == 1)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v11 = NSString;
      id v12 = [v4 uuid];
      id v13 = [v11 stringWithFormat:@"Share %@ found but it's trashed", v12];
      v22[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      char v15 = [v10 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:101 userInfo:v14];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_4;
    v8[3] = &unk_1E58751C0;
    id v7 = a1[4];
    id v9 = a1[5];
    id v10 = a1[4];
    id v11 = v6;
    id v12 = v5;
    id v13 = a1[6];
    id v14 = a1[7];
    [v7 performTransactionAndWait:v8];
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  int v4 = +[PLShare shareWithUUID:v2 includeTrashed:1 inManagedObjectContext:v3];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([*(id *)(a1 + 48) isCPLErrorWithCode:23] & 1) != 0
     || ([*(id *)(a1 + 48) isCPLErrorWithCode:26] & 1) != 0
     || [*(id *)(a1 + 48) isCPLErrorWithCode:25]))
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = objc_msgSend(*(id *)(a1 + 64), "pl_redactedShareURL");
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Locally existing share has been deleted on server, marking as trashed locally: %{public}@, shareURL: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [v4 trash];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)publishShareWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: publishShareWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService publishShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E5874868;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  [v13 performBlock:v19];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    char v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke(id *a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] managedObjectContext];
  int v4 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_2;
    v12[3] = &unk_1E5869408;
    id v13 = a1[4];
    id v14 = a1[6];
    [v4 publishWithCompletionHandler:v12];

    id v5 = v13;
  }
  else if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_81;
    v9[3] = &unk_1E5869408;
    id v10 = a1[4];
    id v11 = a1[6];
    [v4 publishWithCompletionHandler:v9];

    id v5 = v10;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v7 = [NSString stringWithFormat:@"Share %@ not found", a1[4]];
    v16[0] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v5 = [v6 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:100 userInfo:v8];

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  int v8 = PLBackendGetLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to publish moment share uuid: %{public}@ (%{public}@)", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = objc_msgSend(v6, "pl_redactedShareURL");
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Published moment share with uuid: %{public}@, shareURL: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_81(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  int v8 = PLBackendGetLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to publish library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = objc_msgSend(v6, "pl_redactedShareURL");
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Published library scope with uuid: %{public}@, shareURL: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = (void (**)(id, uint64_t, void *))a6;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v12 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v24) = v12;
  if (v12)
  {
    *((void *)&v24 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v24 + 1), (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  int v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v14 = [v13 isCloudPhotoLibraryEnabled];

  if (!v14)
  {
    uint64_t v17 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
    uint64_t v18 = 0;
    goto LABEL_12;
  }
  if (v8)
  {
    __int16 v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v16 = "Starting override cellular and battery budget";
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else
  {
    __int16 v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v16 = "Stopping override cellular and battery budget";
      goto LABEL_10;
    }
  }

  id v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v20 = [v19 cloudPhotoLibraryManager];

  uint64_t v18 = [v20 overrideSystemBudgetsForSyncSession:v8 pauseReason:v10 forSystemBudgets:a5];
  uint64_t v17 = 0;
LABEL_12:
  v11[2](v11, v18, v17);

  if (v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    id v21 = PLRequestGetLog();
    id v22 = v21;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v26, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getSystemBudgetsWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getSystemBudgetsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  BOOL v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isCloudPhotoLibraryEnabled];

  if (v9)
  {
    id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v11 = [v10 cloudPhotoLibraryManager];

    if (v11)
    {
      int v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Getting cellular and battery budget", buf, 2u);
      }

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __59__PLAssetsdCloudInternalService_getSystemBudgetsWithReply___block_invoke;
      v18[3] = &unk_1E5874D98;
      id v19 = v4;
      [v11 getSystemBudgetsWithCompletionHandler:v18];
      int v13 = v19;
    }
    else
    {
      int v13 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v13);
    }
  }
  else
  {
    uint64_t v11 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v11);
  }

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    int v14 = PLRequestGetLog();
    __int16 v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

void __59__PLAssetsdCloudInternalService_getSystemBudgetsWithReply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (!a3)
  {
    id v6 = [v5 objectForKey:*MEMORY[0x1E4F59828]];
    [v6 BOOLValue];

    id v7 = [v8 objectForKey:*MEMORY[0x1E4F59820]];
    [v7 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getNotUploadedCount:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, unint64_t, unint64_t, unint64_t, id))a3;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getNotUploadedCount:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isCloudPhotoLibraryEnabled];

  if (v9)
  {
    id v10 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService getNotUploadedCount:]");
    id v30 = 0;
    unint64_t v11 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:v10 forAssetType:0 error:&v30];
    id v12 = v30;
    id v29 = v12;
    unint64_t v13 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:v10 forAssetType:1 error:&v29];
    id v14 = v29;

    id v28 = v14;
    unint64_t v15 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:v10 forAssetType:2 error:&v28];
    id v16 = v28;

    id v27 = v16;
    unint64_t v17 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:v10 forAssetType:3 error:&v27];
    id v18 = v27;

    unint64_t v19 = 0;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      id v22 = v18;
    }
    else
    {
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      id v22 = v18;
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v22 = 0;
        unint64_t v21 = v17 + v15;
        unint64_t v19 = v11;
        unint64_t v20 = v13;
      }
    }
    v4[2](v4, v19, v20, v21, v22);
  }
  else
  {
    id v10 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
    v4[2](v4, 0, 0, 0, v10);
  }

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    long long v23 = PLRequestGetLog();
    long long v24 = v23;
    os_signpost_id_t v25 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getCurrentTransferProgress:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getCurrentTransferProgress:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 isCloudPhotoLibraryEnabled];

  if (v7)
  {
    id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    int v9 = [v8 cloudPhotoLibraryManager];

    *(_OWORD *)long long buf = 0u;
    long long v22 = 0u;
    if (v9)
    {
      [v9 currentTransferProgress];
      uint64_t v11 = *(void *)buf;
      uint64_t v10 = *(void *)&buf[8];
      uint64_t v12 = *((void *)&v22 + 1);
      uint64_t v13 = v22;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }
  v4[2](v4, v11, v10, v13, v12);
  if (v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    id v14 = PLRequestGetLog();
    unint64_t v15 = v14;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      *(void *)&uint8_t buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v7;
  if (v7)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rampingRequestForResourceType:numRequested:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isCloudPhotoLibraryEnabled];

  if (v9)
  {
    (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1, 0, 0);
  }
  else
  {
    uint64_t v10 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
  }
  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    uint64_t v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v17) = v7;
  if (v7)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setCloudPhotoLibraryPauseState:reason:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v4 >= 4) {
    __int16 v8 = 4;
  }
  else {
    __int16 v8 = v4;
  }
  uint64_t v9 = v8;
  if (v5)
  {
    uint64_t v10 = PLGatekeeperXPCGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v21) = v9;
    uint64_t v11 = "########## Pausing (%hd) cloud photo";
  }
  else
  {
    uint64_t v10 = PLGatekeeperXPCGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v21) = v9;
    uint64_t v11 = "########## Resuming (%hd) cloud photo";
  }
  _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 8u);
LABEL_12:

  uint64_t v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v13 = [v12 cplReadiness];
  [v13 pauseCloudPhotos:v5 reason:v9];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    long long v14 = PLRequestGetLog();
    char v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      unint64_t v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setCloudPhotoLibraryEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setCloudPhotoLibraryEnabledState:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 libraryBundle];
  [v7 setCloudPhotoLibraryEnabled:v3];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    __int16 v8 = PLRequestGetLog();
    uint64_t v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)syncCloudPhotoLibrary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v3;
  if (v3)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: syncCloudPhotoLibrary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  int v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 isCloudPhotoLibraryEnabled];

  if (v5)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "########## Syncing with Cloud Photo Library!", buf, 2u);
    }

    int v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    __int16 v8 = [v7 cloudPhotoLibraryManager];
    [v8 sync];
  }
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    uint64_t v9 = PLRequestGetLog();
    uint64_t v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)shouldAutoEnableiCPLOnOSXWithReply:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PLAssetsdCloudInternalService.m" lineNumber:222 description:@"shouldAutoEnableiCPLOnOSXWithReply is only available on OSX"];
}

- (void)isReadyForAnalysisWithReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v15) = v5;
  if (v5)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: isReadyForAnalysisWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (!MEMORY[0x19F38BDA0]()) {
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"PLInhibitReadyForAnalysis"];

  if ((v7 & 1) != 0
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        __int16 v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLForKey:@"PLOverrideReadyForAnalysis"],
        v8,
        v9))
  {
    v4[2](v4, v7 ^ 1u);
  }
  else
  {
LABEL_7:
    uint64_t v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v11 = [v10 readyForAnalysis];
    v4[2](v4, [v11 isReadyForAnalysis]);
  }
  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    long long v12 = PLRequestGetLog();
    char v13 = v12;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)isReadyForAnalysisCPLInitialDownloadCompletedWithReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v15) = v5;
  if (v5)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: isReadyForAnalysisCPLInitialDownloadCompletedWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (!MEMORY[0x19F38BDA0]()) {
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"PLInhibitReadyForAnalysis"];

  if ((v7 & 1) != 0
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        __int16 v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLForKey:@"PLOverrideReadyForAnalysis"],
        v8,
        v9))
  {
    v4[2](v4, v7 ^ 1u);
  }
  else
  {
LABEL_7:
    uint64_t v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v11 = [v10 readyForAnalysis];
    v4[2](v4, [v11 isReadyForAnalysisInitialDownloadCompleted]);
  }
  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    long long v12 = PLRequestGetLog();
    char v13 = v12;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)isReadyForAnalysisQuickCheckWithReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  connectionAuthorization = self->_connectionAuthorization;
  int v5 = (void (**)(id, uint64_t))a3;
  if ([(PLAssetsdConnectionAuthorization *)connectionAuthorization isQuickCheckReadyForAnalysisClient])
  {
    id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v6 = [v9 readyForAnalysis];
    v5[2](v5, [v6 isReadyForAnalysisQuickCheck]);
  }
  else
  {
    int v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __int16 v8 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      *(_DWORD *)long long buf = 138543362;
      long long v11 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Invalid client for isReadyForAnalysisQuickCheck. Falling back to isReadyForAnalysis for bundle ID: %{public}@", buf, 0xCu);
    }
    [(PLAssetsdCloudInternalService *)self isReadyForAnalysisWithReply:v5];
  }
}

- (void)isReadyForCloudPhotoLibraryWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t))a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: isReadyForCloudPhotoLibraryWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 cplReadiness];
  uint64_t v8 = [v7 isReadyForCloudPhotoLibraryWithStatus:0];

  v4[2](v4, v8);
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    uint64_t v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setPersonInfoDictionary:(id)a3 forPersonID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v15) = v8;
  if (v8)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setPersonInfoDictionary:forPersonID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v10 = [v9 libraryBundle];
  long long v11 = [v10 personInfoManager];
  [v11 setPersonInfo:v6 forPersonID:v7];

  if (v16) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if ((void)v17)
  {
    long long v12 = PLRequestGetLog();
    char v13 = v12;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)personInfoDictionaryForPersonID:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v8;
  if (v8)
  {
    *((void *)&v20 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: personInfoDictionaryForPersonID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v10 = [v9 libraryBundle];
  long long v11 = [v10 personInfoManager];
  long long v12 = [v11 personInfoForPersonID:v6];

  if (v12)
  {
    char v13 = 0;
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    long long v15 = [NSString stringWithFormat:@"person info not found with personID %@", v6];
    long long v24 = v15;
    char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    char v13 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v16];
  }
  v7[2](v7, v12, v13);

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    long long v17 = PLRequestGetLog();
    uint64_t v18 = v17;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)emailAddressForKey:(int64_t)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, void *))a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v7;
  if (v7)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: emailAddressForKey:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v9 = [v8 libraryBundle];
  uint64_t v10 = [v9 emailAddressManager];
  long long v11 = [NSNumber numberWithLongLong:a3];
  long long v12 = [v10 emailAddressForKey:v11];

  if (v12)
  {
    char v13 = 0;
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    long long v24 = @"Email address not found for key";
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    char v13 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v15];
  }
  v6[2](v6, v12, v13);

  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    char v16 = PLRequestGetLog();
    long long v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)keyForEmailAddress:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void *))a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: keyForEmailAddress:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v10 = [v9 libraryBundle];
  long long v11 = [v10 emailAddressManager];
  long long v12 = [v11 keyForEmailAddress:v6];

  if (v12)
  {
    char v13 = 0;
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    long long v24 = @"Key not found for email address";
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    char v13 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v15];
  }
  v7[2](v7, [v12 longLongValue], v13);

  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    char v16 = PLRequestGetLog();
    long long v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)cloudSharingSpaceManagementRequestWithType:(unint64_t)a3 optionalBytesToPurge:(unint64_t)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v35 = 0u;
  *(_OWORD *)sel = 0u;
  long long v34 = 0u;
  int v9 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v34) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v11 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if (a3 == 2)
  {
    long long v14 = @"PurgeNonRecentlyViewedAssets";
    int v12 = 1;
LABEL_9:
    int v13 = 1;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    int v12 = 0;
    long long v14 = @"PurgeSpace";
    goto LABEL_9;
  }
  int v12 = 0;
  int v13 = 0;
  if (a3) {
    long long v14 = 0;
  }
  else {
    long long v14 = @"GetSpaceAvailable";
  }
LABEL_11:
  long long v15 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134219010;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v38 = a4;
    __int16 v39 = 1024;
    int v40 = v13;
    __int16 v41 = 1024;
    int v42 = v12;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "cloudSharingSpaceManagementRequest jobType %lu %@ bytesToPurge %lld shouldFreeSpace %d shouldKeepRecentlyViewed %d", buf, 0x2Cu);
  }

  char v16 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v17 = [v16 databaseContext];
  uint64_t v18 = (void *)[v17 newShortLivedLibraryWithName:"-[PLAssetsdCloudInternalService cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:reply:]"];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  unint64_t v38 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke;
  v28[3] = &unk_1E586AFC0;
  id v30 = buf;
  unint64_t v31 = a4;
  char v32 = v13;
  char v33 = v12;
  id v19 = v18;
  id v29 = v19;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke_2;
  v25[3] = &unk_1E5870D98;
  id v20 = v8;
  id v26 = v20;
  uint64_t v27 = buf;
  [v19 performTransaction:v28 completionHandler:v25];

  _Block_object_dispose(buf, 8);
  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    long long v21 = PLRequestGetLog();
    uint64_t v22 = v21;
    os_signpost_id_t v23 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      *(void *)&uint8_t buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

unint64_t __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke(uint64_t a1)
{
  unint64_t result = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:*(void *)(a1 + 48) shouldFreeSpace:*(unsigned __int8 *)(a1 + 56) shouldKeepRecentlyViewedAssets:*(unsigned __int8 *)(a1 + 57) fromPhotoLibrary:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
}

- (void)updateSharedAlbumsCachedServerConfigurationLimits
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  *(_OWORD *)sel = 0u;
  long long v6 = 0u;
  int v2 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v6) = v2;
  if (v2)
  {
    *((void *)&v6 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateSharedAlbumsCachedServerConfigurationLimits", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v6 + 1), (os_activity_scope_state_t)((char *)&v8 + 8));
  }
  +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits];
  if (v7) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v8 + 8));
  }
  if ((void)v8)
  {
    int v3 = PLRequestGetLog();
    int v4 = v3;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v11 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v4, OS_SIGNPOST_INTERVAL_END, v8, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)enablePhotostreamsWithStreamID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = (char *)a3;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: enablePhotostreamsWithStreamID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  long long v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", (void)v13);
  [v6 setObject:*MEMORY[0x1E4F8C9B0] forKey:*MEMORY[0x1E4F8C970]];
  char v7 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "enqueing job with streamID %@", buf, 0xCu);
  }

  long long v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 imageWriter];
  [v9 enqueueJob:v6];

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    uint64_t v10 = PLRequestGetLog();
    long long v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)createPhotostreamAlbumWithStreamID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v5;
  if (v5)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: createPhotostreamAlbumWithStreamID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  id v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService createPhotostreamAlbumWithStreamID:]", (void)v10);
  [v6 createPhotoStreamAlbumWithStreamID:v4];

  if (v11) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  }
  if ((void)v12)
  {
    char v7 = PLRequestGetLog();
    long long v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v12, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdCloudInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdCloudInternalService;
  long long v8 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:a3];
  int v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
  }

  return v9;
}

@end