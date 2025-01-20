@interface PLAssetsdCloudInternalClient
- (BOOL)isReadyForAnalysis;
- (BOOL)isReadyForAnalysisCPLInitialDownloadCompleted;
- (BOOL)isReadyForAnalysisQuickCheck;
- (BOOL)isReadyForCloudPhotoLibrary;
- (BOOL)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 error:(id *)a6;
- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldAutoEnableiCPLOnOSXWithError:(id *)a3;
- (id)activateLibraryScope:(id)a3 completionHandler:(id)a4;
- (id)emailAddressForKey:(int64_t)a3 error:(id *)a4;
- (id)getCPLSettings;
- (id)markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:(id)a3 excludePersonUUIDs:(id)a4 completionHandler:(id)a5;
- (id)personInfoDictionaryForPersonID:(id)a3 error:(id *)a4;
- (int64_t)keyForEmailAddress:(id)a3 error:(id *)a4;
- (unint64_t)cloudSharingSpaceManagementRequestWithType:(unint64_t)a3 optionalBytesToPurge:(unint64_t)a4 error:(id *)a5;
- (unint64_t)getResetSyncStatusWithError:(id *)a3;
- (void)acceptShare:(id)a3 completionHandler:(id)a4;
- (void)confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope:(id)a3 completionHandler:(id)a4;
- (void)createPhotostreamAlbumWithStreamID:(id)a3;
- (void)deactivateLibraryScope:(id)a3 completionHandler:(id)a4;
- (void)enablePhotostreamsWithStreamID:(id)a3;
- (void)fetchShareFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 completionHandler:(id)a5;
- (void)forceParticipantAssetTrashNotificationCompletionHandler:(id)a3;
- (void)forceSyncMomentShare:(id)a3 completionHandler:(id)a4;
- (void)getCPLConfigrationValueForKey:(id)a3 completionHandler:(id)a4;
- (void)getCurrentTransferProgress:(id)a3;
- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getNotUploadedCount:(id)a3;
- (void)getSystemBudgetsWithReply:(id)a3;
- (void)isComputeSyncEnabledForDirection:(int64_t)a3 reply:(id)a4;
- (void)markResourcesPurgeableWithUrgency:(int64_t)a3 assetUuids:(id)a4 completionHandler:(id)a5;
- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 completionHandler:(id)a6;
- (void)publishShare:(id)a3 completionHandler:(id)a4;
- (void)queryParticipantsWithEmails:(id)a3 phoneNumbers:(id)a4 completionHandler:(id)a5;
- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 reply:(id)a5;
- (void)refreshLibraryScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 completionHandler:(id)a4;
- (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:(id)a3;
- (void)runComputeSyncBackfillMigrationSynchronously;
- (void)setCloudPhotoLibraryEnabledState:(BOOL)a3;
- (void)setCloudPhotoLibraryEnabledStateSync:(BOOL)a3;
- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4;
- (void)setPersonInfoDictionary:(id)a3 forPersonID:(id)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)syncCloudPhotoLibrary;
- (void)synchronouslySetCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4;
- (void)unsharePendingAssetsSharedToScopeWithIdentifier:(id)a3;
- (void)updateSharedAlbumsCachedServerConfigurationLimits;
- (void)userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler:(id)a3;
@end

@implementation PLAssetsdCloudInternalClient

void __46__PLAssetsdCloudInternalClient_getCPLSettings__block_invoke_139(uint64_t a1, void *a2)
{
}

- (id)getCPLSettings
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getCPLSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6042;
  v27 = __Block_byref_object_dispose__6043;
  id v28 = 0;
  v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_138_6045];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__PLAssetsdCloudInternalClient_getCPLSettings__block_invoke_139;
  v20[3] = &unk_1E58A02B0;
  v20[4] = &buf;
  [v13 getCPLSettingsWithReply:v20];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    v15 = PLRequestGetLog();
    v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

- (void)isComputeSyncEnabledForDirection:(int64_t)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isComputeSyncEnabledForDirection:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v26 = v12;
  v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    uint64_t v29 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__PLAssetsdCloudInternalClient_isComputeSyncEnabledForDirection_reply___block_invoke_148;
  v22[3] = &unk_1E58A02D8;
  int64_t v24 = a3;
  id v17 = v7;
  id v23 = v17;
  [v16 remoteObjectProxyWithErrorHandler:&__block_literal_global_147_6036 handler:v22];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    v18 = PLRequestGetLog();
    v19 = v18;
    os_signpost_id_t v20 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      long long v21 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = v21;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __71__PLAssetsdCloudInternalClient_isComputeSyncEnabledForDirection_reply___block_invoke_148(uint64_t a1, void *a2)
{
  return [a2 isComputeSyncEnabledForDirection:*(void *)(a1 + 40) reply:*(void *)(a1 + 32)];
}

void __71__PLAssetsdCloudInternalClient_isComputeSyncEnabledForDirection_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdCloudInternalClient isComputeSyncEnabledForDirection:reply:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)runComputeSyncBackfillMigrationSynchronously
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: runComputeSyncBackfillMigrationSynchronously", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_145];
  [v11 runComputeSyncBackfillMigrationSynchronously];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __76__PLAssetsdCloudInternalClient_runComputeSyncBackfillMigrationSynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdCloudInternalClient runComputeSyncBackfillMigrationSynchronously]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v7;
  if (v7)
  {
    uint64_t v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setPrefetchMode:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__6042;
  v31 = __Block_byref_object_dispose__6043;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_142];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__PLAssetsdCloudInternalClient_setPrefetchMode_error___block_invoke_143;
  v20[3] = &unk_1E58A17E0;
  v20[4] = &v21;
  void v20[5] = &buf;
  [v11 setPrefetchMode:a3 reply:v20];

  LODWORD(v10) = *((unsigned __int8 *)v22 + 24);
  id v12 = *(id *)(*((void *)&buf + 1) + 40);
  v13 = v12;
  if (v10 && a4) {
    *a4 = v12;
  }

  int v14 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

void __54__PLAssetsdCloudInternalClient_setPrefetchMode_error___block_invoke_143(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __54__PLAssetsdCloudInternalClient_setPrefetchMode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdCloudInternalClient setPrefetchMode:error:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __46__PLAssetsdCloudInternalClient_getCPLSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdCloudInternalClient getCPLSettings]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getCPLConfigrationValueForKey:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getCPLConfigrationValueForKey:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__PLAssetsdCloudInternalClient_getCPLConfigrationValueForKey_completionHandler___block_invoke;
  v21[3] = &unk_1E58A1BC8;
  id v22 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLAssetsdCloudInternalClient_getCPLConfigrationValueForKey_completionHandler___block_invoke_136;
  v18[3] = &unk_1E58A0288;
  id v12 = v6;
  id v19 = v12;
  id v13 = v22;
  id v20 = v13;
  [v11 remoteObjectProxyWithErrorHandler:v21 handler:v18];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    int v14 = PLRequestGetLog();
    long long v15 = v14;
    os_signpost_id_t v16 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __80__PLAssetsdCloudInternalClient_getCPLConfigrationValueForKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to get CPLConfiguration value, XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PLAssetsdCloudInternalClient_getCPLConfigrationValueForKey_completionHandler___block_invoke_136(uint64_t a1, void *a2)
{
  return [a2 getCPLConfigrationValueForKey:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (void)markResourcesPurgeableWithUrgency:(int64_t)a3 assetUuids:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: markResourcesPurgeableWithUrgency:assetUuids:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  int v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __95__PLAssetsdCloudInternalClient_markResourcesPurgeableWithUrgency_assetUuids_completionHandler___block_invoke;
  v30[3] = &unk_1E58A1BC8;
  id v31 = v10;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __95__PLAssetsdCloudInternalClient_markResourcesPurgeableWithUrgency_assetUuids_completionHandler___block_invoke_132;
  v21[3] = &unk_1EEBF5180;
  char v24 = v32;
  id v25 = *((id *)&v32 + 1);
  long long v26 = v33;
  long long v27 = v34;
  SEL v28 = a2;
  int64_t v29 = a3;
  id v15 = v9;
  id v22 = v15;
  id v16 = v31;
  id v23 = v16;
  [v14 remoteObjectProxyWithErrorHandler:v30 handler:v21];

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    os_signpost_id_t v17 = PLRequestGetLog();
    v18 = v17;
    os_signpost_id_t v19 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(*((SEL *)&v34 + 1));
      *(_DWORD *)long long buf = 136446210;
      v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __95__PLAssetsdCloudInternalClient_markResourcesPurgeableWithUrgency_assetUuids_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to change purgeability because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__PLAssetsdCloudInternalClient_markResourcesPurgeableWithUrgency_assetUuids_completionHandler___block_invoke_132(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 markResourcesPurgeableWithUrgency:*(void *)(a1 + 104) assetUuids:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: requestDeviceLibraryConfigurationChange:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  int v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke;
  v25[3] = &unk_1E58A1BC8;
  id v26 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3254779904;
  v17[2] = __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_126;
  v17[3] = &unk_1EEBF4D58;
  char v19 = v27;
  id v20 = *((id *)&v27 + 1);
  long long v21 = v28;
  long long v22 = v29;
  SEL v23 = a2;
  int64_t v24 = a3;
  id v12 = v26;
  id v18 = v12;
  [v11 remoteObjectProxyWithErrorHandler:v25 handler:v17];

  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    id v13 = PLRequestGetLog();
    int v14 = v13;
    os_signpost_id_t v15 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v31 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdCloudInternalClient requestDeviceLibraryConfigurationChange:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_126(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 96);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_127;
  v12[3] = &unk_1E58A0260;
  uint64_t v14 = v11;
  id v13 = *(id *)(a1 + 32);
  [v3 requestDeviceLibraryConfigurationChange:v11 reply:v12];
}

void __90__PLAssetsdCloudInternalClient_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((a2 & 1) == 0)
  {
    id v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Unable to change device library configuration to: %ld. (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v10 + 16))(v10, a2, a3, v7);
  }
}

- (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke_124;
  v15[3] = &unk_1EEBF5708;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    int v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke_124(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    uint64_t v15 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke_125;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:v11];
}

void __110__PLAssetsdCloudInternalClient_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler___block_invoke_125(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to reset local only library scopes and reset asset states: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke_122;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    uint64_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke_122(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  int v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke_123;
  v12[3] = &unk_1E58A0170;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:v13 reply:v12];
}

void __107__PLAssetsdCloudInternalClient_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScope_completionHandler___block_invoke_123(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to confirm all remaining onboarding preview assets on library scope with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:(id)a3 excludePersonUUIDs:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:excludePersonUUIDs:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __128__PLAssetsdCloudInternalClient_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope_excludePersonUUIDs_completionHandler___block_invoke;
  v28[3] = &unk_1E58A1BC8;
  id v15 = v10;
  id v29 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v28];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __128__PLAssetsdCloudInternalClient_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope_excludePersonUUIDs_completionHandler___block_invoke_121;
  v25[3] = &unk_1E58A0170;
  id v17 = v8;
  id v26 = v17;
  id v18 = v15;
  id v27 = v18;
  long long v19 = [v16 markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:v17 excludePersonUUIDs:v9 reply:v25];

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v19;
}

void __128__PLAssetsdCloudInternalClient_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope_excludePersonUUIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:excludePersonUUIDs:co"
         "mpletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __128__PLAssetsdCloudInternalClient_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope_excludePersonUUIDs_completionHandler___block_invoke_121(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to mark onboarding preview assets on library scope with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)unsharePendingAssetsSharedToScopeWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: unsharePendingAssetsSharedToScopeWithIdentifier:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  BOOL v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_120_6065];
  [v7 unsharePendingAssetsSharedToScopeWithIdentifier:v4];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    int v8 = PLRequestGetLog();
    uint64_t v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __80__PLAssetsdCloudInternalClient_unsharePendingAssetsSharedToScopeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdCloudInternalClient unsharePendingAssetsSharedToScopeWithIdentifier:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    __int16 v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  char v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_116;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    __int16 v6 = "-[PLAssetsdCloudInternalClient getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_116(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  long long v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_117;
  v12[3] = &unk_1E58A0238;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 getLibraryScopeStatusCountsForScopeWithIdentifier:v13 reply:v12];
}

void __100__PLAssetsdCloudInternalClient_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Unable to get library scope status counts for scope identifier %@. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshLibraryScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: refreshLibraryScopeWithIdentifier:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_113;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdCloudInternalClient refreshLibraryScopeWithIdentifier:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_113(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  __int16 v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_114;
  v12[3] = &unk_1E58A0210;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 refreshLibraryScopeWithIdentifier:v13 reply:v12];
}

void __84__PLAssetsdCloudInternalClient_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Unable to refresh library scope for scope identifier %@. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)forceParticipantAssetTrashNotificationCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: forceParticipantAssetTrashNotificationCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  int v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke_110;
  v15[3] = &unk_1EEBF5708;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    __int16 v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient forceParticipantAssetTrashNotificationCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v15 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke_111;
  v11[3] = &unk_1E58A01E8;
  id v12 = *(id *)(a1 + 32);
  [v3 forceParticipantAssetTrashNotificationWithReply:v11];
}

uint64_t __88__PLAssetsdCloudInternalClient_forceParticipantAssetTrashNotificationCompletionHandler___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke_108;
  v15[3] = &unk_1EEBF5708;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    __int16 v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke_108(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v15 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke_109;
  v11[3] = &unk_1E58A1BC8;
  id v12 = *(id *)(a1 + 32);
  [v3 userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:v11];
}

void __110__PLAssetsdCloudInternalClient_userViewedSharedLibraryParticipantAssetTrashNotificationWithCompletionHandler___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to mark user viewed shared library participant asset trash notification (%@)", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    uint64_t v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sharedLibraryRampCheckWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke_106;
  v15[3] = &unk_1EEBF5708;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    __int16 v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to check shared library ramp (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke_106(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v15 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke_107;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 sharedLibraryRampCheckWithReply:v11];
}

void __76__PLAssetsdCloudInternalClient_sharedLibraryRampCheckWithCompletionHandler___block_invoke_107(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_signpost_id_t v5 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Unable to check shared library ramp (%@)", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  BOOL v16 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v16;
  if (v16)
  {
    char v17 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v18 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v17;

    os_activity_scope_enter(v17, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  long long v19 = [(PLAssetsdBaseClient *)self proxyFactory];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v38[3] = &unk_1E58A1BC8;
  id v39 = v15;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3254779904;
  v27[2] = __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_101;
  v27[3] = &unk_1EEBF5538;
  char v31 = v40;
  id v32 = *((id *)&v40 + 1);
  long long v33 = v41;
  long long v34 = v42;
  SEL v35 = a2;
  id v20 = v13;
  id v28 = v20;
  id v21 = v14;
  id v29 = v21;
  int64_t v36 = a5;
  int64_t v37 = a6;
  id v22 = v39;
  id v30 = v22;
  [v19 remoteObjectProxyWithErrorHandler:v38 handler:v27];

  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    id v23 = PLRequestGetLog();
    long long v24 = v23;
    os_signpost_id_t v25 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(*((SEL *)&v42 + 1));
      *(_DWORD *)long long buf = 136446210;
      v44 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to remove participants (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_101(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v20 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v21[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      long long v19 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v11 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(a1 + 120);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_102;
  v15[3] = &unk_1E58A1E00;
  id v16 = v11;
  id v17 = *(id *)(a1 + 48);
  [v3 removeParticipantsWithParticipantUUIDs:v12 fromLibraryScopeWithIdentifier:v16 retentionPolicy:v13 exitSource:v14 reply:v15];
}

void __147__PLAssetsdCloudInternalClient_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to remove participants from library scope with identifier: %@. (%@)", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  BOOL v13 = +[PLXPCMessageLogger enabled];
  LOBYTE(v35) = v13;
  if (v13)
  {
    uint64_t v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v15 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v33[3] = &unk_1E58A1BC8;
  id v34 = v12;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_96;
  v23[3] = &unk_1EEBF5458;
  char v26 = v35;
  id v27 = *((id *)&v35 + 1);
  long long v28 = v36;
  long long v29 = v37;
  SEL v30 = a2;
  id v17 = v11;
  id v24 = v17;
  int64_t v31 = a4;
  int64_t v32 = a5;
  id v18 = v34;
  id v25 = v18;
  [v16 remoteObjectProxyWithErrorHandler:v33 handler:v23];

  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    long long v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v37 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v39 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to exit shared scope with scope identifier (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_96(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    long long v19 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v20[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    __int16 v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v18 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 112);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_97;
  v14[3] = &unk_1E58A1E00;
  id v15 = v11;
  id v16 = *(id *)(a1 + 40);
  [v3 startExitFromLibraryScopeWithIdentifier:v15 retentionPolicy:v12 exitSource:v13 reply:v14];
}

void __117__PLAssetsdCloudInternalClient_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to start exit from library scope with identifier: %@. (%@)", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deactivateLibraryScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: deactivateLibraryScope:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke_94;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to deactivate library scope because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke_95;
  v12[3] = &unk_1E58A0170;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 deactivateLibraryScopeWithUUID:v13 reply:v12];
}

void __73__PLAssetsdCloudInternalClient_deactivateLibraryScope_completionHandler___block_invoke_95(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to deactivate library scope with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)activateLibraryScope:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v35) = v9;
  if (v9)
  {
    __int16 v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: activateLibraryScope:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke;
  v33[3] = &unk_1E58A1BC8;
  id v13 = v8;
  id v34 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v33];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3254779904;
  v24[2] = __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke_89;
  v24[3] = &unk_1EEBF51B8;
  char v28 = v35;
  id v29 = *((id *)&v35 + 1);
  long long v30 = v36;
  long long v31 = v37;
  id v15 = v14;
  id v25 = v15;
  SEL v32 = a2;
  id v16 = v7;
  id v26 = v16;
  id v17 = v13;
  id v27 = v17;
  id v18 = [v15 activateLibraryScopeWithUUID:v16 reply:v24];

  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    long long v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v37 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v39 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v18;
}

void __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to activate library scope because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke_89(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = PLRequestGetLog();
    os_signpost_id_t v3 = os_signpost_id_generate(v2);
    id v17 = @"SignpostId";
    id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v3];
    v18[0] = v4;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(*(id *)(a1 + 32), "set_userInfo:", v5);

    id v6 = v2;
    uint64_t v7 = v6;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v8;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  __int16 v10 = *(void **)(a1 + 32);
  BOOL v9 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke_90;
  v12[3] = &unk_1E58A0170;
  id v13 = v9;
  id v14 = *(id *)(a1 + 48);
  id v11 = (id)[v10 activateLibraryScopeWithUUID:v13 reply:v12];
}

void __71__PLAssetsdCloudInternalClient_activateLibraryScope_completionHandler___block_invoke_90(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to activate library scope with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)getResetSyncStatusWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getResetSyncStatusWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  char v28 = __Block_byref_object_copy__6042;
  id v29 = __Block_byref_object_dispose__6043;
  id v30 = 0;
  int v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __60__PLAssetsdCloudInternalClient_getResetSyncStatusWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  void v18[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__PLAssetsdCloudInternalClient_getResetSyncStatusWithError___block_invoke_87;
  v17[3] = &unk_1E58A01C0;
  void v17[4] = &v19;
  [v9 getResetSyncStatusWithReply:v17];

  if (a3)
  {
    __int16 v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  unint64_t v11 = v20[3];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v12 = PLRequestGetLog();
    id v13 = v12;
    os_signpost_id_t v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __60__PLAssetsdCloudInternalClient_getResetSyncStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdCloudInternalClient getResetSyncStatusWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __60__PLAssetsdCloudInternalClient_getResetSyncStatusWithError___block_invoke_87(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)queryParticipantsWithEmails:(id)a3 phoneNumbers:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v12;
  if (v12)
  {
    id v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: queryParticipantsWithEmails:phoneNumbers:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v14 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  id v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v11;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke_83;
  v23[3] = &unk_1EEBF5298;
  char v27 = v34;
  id v28 = *((id *)&v34 + 1);
  long long v29 = v35;
  long long v30 = v36;
  SEL v31 = a2;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  id v18 = v33;
  id v26 = v18;
  [v15 remoteObjectProxyWithErrorHandler:v32 handler:v23];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    uint64_t v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v36 + 1));
      *(_DWORD *)long long buf = 136446210;
      v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to query participants because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    int v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 32) allObjects];
  BOOL v12 = [*(id *)(a1 + 40) allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke_84;
  v13[3] = &unk_1E58A0198;
  id v14 = *(id *)(a1 + 48);
  [v3 queryUserIdentitiesWithEmails:v11 phoneNumbers:v12 reply:v13];
}

void __91__PLAssetsdCloudInternalClient_queryParticipantsWithEmails_phoneNumbers_completionHandler___block_invoke_84(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Query participants returned error. (%@)", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (void)forceSyncMomentShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: forceSyncMomentShare:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  BOOL v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke_81;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to force sync moment share because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke_82;
  v12[3] = &unk_1E58A0170;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 forceSyncMomentShareWithUUID:v13 reply:v12];
}

void __71__PLAssetsdCloudInternalClient_forceSyncMomentShare_completionHandler___block_invoke_82(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to force sync moment share with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)acceptShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    __int16 v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: acceptShare:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke_79;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to accept moment share because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke_79(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      __int16 v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke_80;
  v12[3] = &unk_1E58A0170;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 acceptShareWithUUID:v13 reply:v12];
}

void __62__PLAssetsdCloudInternalClient_acceptShare_completionHandler___block_invoke_80(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to accept moment share with uuid: %@. (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchShareFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: fetchShareFromShareURL:ignoreExistingShare:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke;
  v30[3] = &unk_1E58A1BC8;
  id v31 = v10;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  void v21[2] = __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke_73;
  v21[3] = &unk_1EEBF4FF8;
  char v24 = v32;
  id v25 = *((id *)&v32 + 1);
  long long v26 = v33;
  long long v27 = v34;
  SEL v28 = a2;
  id v15 = v9;
  id v22 = v15;
  BOOL v29 = a4;
  id v16 = v31;
  id v23 = v16;
  [v14 remoteObjectProxyWithErrorHandler:v30 handler:v21];

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    os_signpost_id_t v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(*((SEL *)&v34 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to fetch moment share because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke_73(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v18 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v19[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    int v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  BOOL v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 104);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke_74;
  v13[3] = &unk_1E58A0148;
  id v14 = v11;
  id v15 = *(id *)(a1 + 40);
  [v3 fetchShareWithURL:v14 ignoreExistingShare:v12 reply:v13];
}

void __93__PLAssetsdCloudInternalClient_fetchShareFromShareURL_ignoreExistingShare_completionHandler___block_invoke_74(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    id v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Unable to fetch moment share from share url: %@. (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)publishShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: publishShare:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  void v19[2] = __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke_67;
  v19[3] = &unk_1EEBF4E70;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    uint64_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Unable to publish share because XPC service returned an error. (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  int v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke_68;
  v12[3] = &unk_1E58A0120;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 publishShareWithUUID:v13 reply:v12];
}

void __63__PLAssetsdCloudInternalClient_publishShare_completionHandler___block_invoke_68(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    BOOL v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Unable to publish share with uuid: %{public}@ (%{public}@)", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  long long v41 = 0u;
  *(_OWORD *)sel = 0u;
  long long v40 = 0u;
  BOOL v13 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v13;
  if (v13)
  {
    id v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v15 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  id v16 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  *(void *)&long long v41 = v17;
  id v18 = v16;
  os_signpost_id_t v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    v44 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke;
  v38[3] = &unk_1E58A1BC8;
  id v39 = v12;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3254779904;
  v28[2] = __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke_62;
  v28[3] = &unk_1EEBF3AE8;
  char v31 = v40;
  id v32 = *((id *)&v40 + 1);
  long long v33 = v41;
  long long v34 = *(_OWORD *)sel;
  SEL v35 = a2;
  BOOL v37 = a3;
  id v22 = v11;
  id v29 = v22;
  unint64_t v36 = a5;
  id v23 = v39;
  id v30 = v23;
  [v21 remoteObjectProxyWithErrorHandler:v38 handler:v28];

  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    long long v24 = PLRequestGetLog();
    long long v25 = v24;
    os_signpost_id_t v26 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      long long v27 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v44 = v27;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdCloudInternalClient overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v18 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v19[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v12 = *(void *)(a1 + 104);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke_63;
  v14[3] = &unk_1E58A1C18;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  [v3 overrideSystemBudgetsForSyncSession:v11 pauseReason:v13 systemBudgets:v12 reply:v14];
}

uint64_t __112__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_completionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  long long v38 = 0u;
  *(_OWORD *)sel = 0u;
  long long v37 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v37) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  id v15 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  *(void *)&long long v38 = v16;
  os_signpost_id_t v17 = v15;
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__6042;
  v43 = __Block_byref_object_dispose__6043;
  id v44 = 0;
  id v20 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __100__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_error___block_invoke;
  v32[3] = &unk_1E58A17B8;
  void v32[4] = &v33;
  v32[5] = &buf;
  id v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __100__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_error___block_invoke_61;
  v31[3] = &unk_1E58A17E0;
  v31[4] = &v33;
  v31[5] = &buf;
  [v21 overrideSystemBudgetsForSyncSession:v8 pauseReason:v11 systemBudgets:a5 reply:v31];

  int v22 = *((unsigned __int8 *)v34 + 24);
  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  long long v24 = v23;
  if (!v22 && a6) {
    *a6 = v23;
  }

  int v25 = *((unsigned __int8 *)v34 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v33, 8);
  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    os_signpost_id_t v26 = PLRequestGetLog();
    long long v27 = v26;
    os_signpost_id_t v28 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      id v29 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v25 != 0;
}

void __100__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdCloudInternalClient overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __100__PLAssetsdCloudInternalClient_overrideSystemBudgetsForSyncSession_pauseReason_systemBudgets_error___block_invoke_61(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)getSystemBudgetsWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getSystemBudgetsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v24 = v10;
  uint64_t v11 = v9;
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v27 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __58__PLAssetsdCloudInternalClient_getSystemBudgetsWithReply___block_invoke;
  v21[3] = &unk_1E58A1BC8;
  id v15 = v5;
  id v22 = v15;
  os_signpost_id_t v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
  [v16 getSystemBudgetsWithReply:v15];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    os_signpost_id_t v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __58__PLAssetsdCloudInternalClient_getSystemBudgetsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient getSystemBudgetsWithReply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getNotUploadedCount:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getNotUploadedCount:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__PLAssetsdCloudInternalClient_getNotUploadedCount___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __52__PLAssetsdCloudInternalClient_getNotUploadedCount___block_invoke_57;
  v15[3] = &unk_1EEBF5708;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    uint64_t v11 = PLRequestGetLog();
    BOOL v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __52__PLAssetsdCloudInternalClient_getNotUploadedCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient getNotUploadedCount:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__PLAssetsdCloudInternalClient_getNotUploadedCount___block_invoke_57(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 getNotUploadedCount:*(void *)(a1 + 32)];
}

- (void)getCurrentTransferProgress:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getCurrentTransferProgress:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v24 = v10;
  int v11 = v9;
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v27 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __59__PLAssetsdCloudInternalClient_getCurrentTransferProgress___block_invoke;
  v21[3] = &unk_1E58A1BC8;
  id v15 = v5;
  id v22 = v15;
  id v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
  [v16 getCurrentTransferProgress:v15];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    char v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      long long v20 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __59__PLAssetsdCloudInternalClient_getCurrentTransferProgress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudInternalClient getCurrentTransferProgress:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 reply:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v10) = v6;
  if (v6)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rampingRequestForResourceType:numRequested:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  (*((void (**)(id, uint64_t, void, void))v5 + 2))(v5, 1, 0, 0);
  if ((_BYTE)v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    __int16 v7 = PLRequestGetLog();
    id v8 = v7;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)synchronouslySetCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslySetCloudPhotoLibraryPauseState:reason:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  uint64_t v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  long long v11 = v9;
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v23 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_56];
  [v15 setCloudPhotoLibraryPauseState:v5 reason:v4];

  if ((_BYTE)v19) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  }
  if (v10)
  {
    id v16 = PLRequestGetLog();
    char v17 = v16;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      id v18 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v23 = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __83__PLAssetsdCloudInternalClient_synchronouslySetCloudPhotoLibraryPauseState_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdCloudInternalClient synchronouslySetCloudPhotoLibraryPauseState:reason:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setCloudPhotoLibraryPauseState:reason:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  long long v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v30 = v12;
  os_signpost_id_t v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    uint64_t v33 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  void v21[2] = __70__PLAssetsdCloudInternalClient_setCloudPhotoLibraryPauseState_reason___block_invoke_51;
  v21[3] = &__block_descriptor_91_e8_32n18_8_8_t0w1_s8_t16w32_e49_v16__0___PLAssetsdCloudInternalServiceProtocol__8l;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = *(_OWORD *)sel;
  SEL v26 = a2;
  BOOL v28 = a3;
  signed __int16 v27 = a4;
  [v16 remoteObjectProxyWithErrorHandler:&__block_literal_global_50_6153 handler:v21];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    char v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      long long v20 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v33 = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __70__PLAssetsdCloudInternalClient_setCloudPhotoLibraryPauseState_reason___block_invoke_51(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      os_signpost_id_t v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 setCloudPhotoLibraryPauseState:*(unsigned __int8 *)(a1 + 90) reason:*(__int16 *)(a1 + 88)];
}

void __70__PLAssetsdCloudInternalClient_setCloudPhotoLibraryPauseState_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient setCloudPhotoLibraryPauseState:reason:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setCloudPhotoLibraryEnabledStateSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setCloudPhotoLibraryEnabledStateSync:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint64_t v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    SEL v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_48_6162];
  [v13 setCloudPhotoLibraryEnabledState:v3];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    uint64_t v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      SEL v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __69__PLAssetsdCloudInternalClient_setCloudPhotoLibraryEnabledStateSync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient setCloudPhotoLibraryEnabledStateSync:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setCloudPhotoLibraryEnabledState:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setCloudPhotoLibraryEnabledState:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  void v14[2] = __65__PLAssetsdCloudInternalClient_setCloudPhotoLibraryEnabledState___block_invoke_43;
  v14[3] = &__block_descriptor_89_e8_32n18_8_8_t0w1_s8_t16w32_e49_v16__0___PLAssetsdCloudInternalServiceProtocol__8l;
  char v15 = v21;
  id v16 = *((id *)&v21 + 1);
  long long v17 = v22;
  long long v18 = *(_OWORD *)sel;
  SEL v19 = a2;
  BOOL v20 = a3;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_42_6165 handler:v14];

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    os_signpost_id_t v10 = PLRequestGetLog();
    int v11 = v10;
    os_signpost_id_t v12 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __65__PLAssetsdCloudInternalClient_setCloudPhotoLibraryEnabledState___block_invoke_43(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      os_signpost_id_t v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 setCloudPhotoLibraryEnabledState:*(unsigned __int8 *)(a1 + 88)];
}

void __65__PLAssetsdCloudInternalClient_setCloudPhotoLibraryEnabledState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient setCloudPhotoLibraryEnabledState:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)syncCloudPhotoLibrary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: syncCloudPhotoLibrary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  os_signpost_id_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    SEL v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  int v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_40];
  [v11 syncCloudPhotoLibrary];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      SEL v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __53__PLAssetsdCloudInternalClient_syncCloudPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient syncCloudPhotoLibrary]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)shouldAutoEnableiCPLOnOSXWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  __int16 v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PLAssetsdCloudInternalClient.m" lineNumber:188 description:@"shouldAutoEnableiCPLOnOSXWithError is only available on OSX"];

  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v7;
  if (v7)
  {
    uint64_t v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: shouldAutoEnableiCPLOnOSXWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v9 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  os_signpost_id_t v10 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  *(void *)&long long v31 = v11;
  os_signpost_id_t v12 = v10;
  os_signpost_id_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__6042;
  char v36 = __Block_byref_object_dispose__6043;
  id v37 = 0;
  uint64_t v26 = 0;
  signed __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  long long v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__PLAssetsdCloudInternalClient_shouldAutoEnableiCPLOnOSXWithError___block_invoke;
  v25[3] = &unk_1E58A17B8;
  void v25[4] = &v26;
  v25[5] = &buf;
  long long v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__PLAssetsdCloudInternalClient_shouldAutoEnableiCPLOnOSXWithError___block_invoke_37;
  v24[3] = &unk_1E58A17E0;
  void v24[4] = &v26;
  v24[5] = &buf;
  [v16 shouldAutoEnableiCPLOnOSXWithReply:v24];

  if (a3)
  {
    long long v17 = *(void **)(*((void *)&buf + 1) + 40);
    if (v17) {
      *a3 = v17;
    }
  }
  int v18 = *((unsigned __int8 *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    SEL v19 = PLRequestGetLog();
    uint64_t v20 = v19;
    os_signpost_id_t v21 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      long long v22 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v22;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v18 != 0;
}

void __67__PLAssetsdCloudInternalClient_shouldAutoEnableiCPLOnOSXWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdCloudInternalClient shouldAutoEnableiCPLOnOSXWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __67__PLAssetsdCloudInternalClient_shouldAutoEnableiCPLOnOSXWithError___block_invoke_37(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isReadyForAnalysis
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isReadyForAnalysis", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  int v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30_6187];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __50__PLAssetsdCloudInternalClient_isReadyForAnalysis__block_invoke_31;
  v20[3] = &unk_1E58A00F8;
  v20[4] = &buf;
  [v13 isReadyForAnalysisWithReply:v20];

  int v14 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

uint64_t __50__PLAssetsdCloudInternalClient_isReadyForAnalysis__block_invoke_31(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __50__PLAssetsdCloudInternalClient_isReadyForAnalysis__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdCloudInternalClient isReadyForAnalysis]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)isReadyForAnalysisCPLInitialDownloadCompleted
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isReadyForAnalysisCPLInitialDownloadCompleted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27_6193];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __77__PLAssetsdCloudInternalClient_isReadyForAnalysisCPLInitialDownloadCompleted__block_invoke_28;
  v20[3] = &unk_1E58A00F8;
  v20[4] = &buf;
  [v13 isReadyForAnalysisCPLInitialDownloadCompletedWithReply:v20];

  int v14 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

uint64_t __77__PLAssetsdCloudInternalClient_isReadyForAnalysisCPLInitialDownloadCompleted__block_invoke_28(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __77__PLAssetsdCloudInternalClient_isReadyForAnalysisCPLInitialDownloadCompleted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdCloudInternalClient isReadyForAnalysisCPLInitialDownloadCompleted]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)isReadyForAnalysisQuickCheck
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isReadyForAnalysisQuickCheck", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24_6199];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __60__PLAssetsdCloudInternalClient_isReadyForAnalysisQuickCheck__block_invoke_25;
  v20[3] = &unk_1E58A00F8;
  v20[4] = &buf;
  [v13 isReadyForAnalysisQuickCheckWithReply:v20];

  int v14 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

uint64_t __60__PLAssetsdCloudInternalClient_isReadyForAnalysisQuickCheck__block_invoke_25(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __60__PLAssetsdCloudInternalClient_isReadyForAnalysisQuickCheck__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdCloudInternalClient isReadyForAnalysisQuickCheck]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)isReadyForCloudPhotoLibrary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isReadyForCloudPhotoLibrary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20_6205];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __59__PLAssetsdCloudInternalClient_isReadyForCloudPhotoLibrary__block_invoke_21;
  v20[3] = &unk_1E58A00F8;
  v20[4] = &buf;
  [v13 isReadyForCloudPhotoLibraryWithReply:v20];

  int v14 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

uint64_t __59__PLAssetsdCloudInternalClient_isReadyForCloudPhotoLibrary__block_invoke_21(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __59__PLAssetsdCloudInternalClient_isReadyForCloudPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdCloudInternalClient isReadyForCloudPhotoLibrary]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setPersonInfoDictionary:(id)a3 forPersonID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v29 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setPersonInfoDictionary:forPersonID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  void v19[2] = __68__PLAssetsdCloudInternalClient_setPersonInfoDictionary_forPersonID___block_invoke_17;
  v19[3] = &unk_1EEBF4F50;
  char v22 = v27;
  id v23 = *((id *)&v27 + 1);
  long long v24 = v28;
  long long v25 = v29;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v8;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_16_6209 handler:v19];

  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v31 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __68__PLAssetsdCloudInternalClient_setPersonInfoDictionary_forPersonID___block_invoke_17(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 setPersonInfoDictionary:*(void *)(a1 + 32) forPersonID:*(void *)(a1 + 40)];
}

void __68__PLAssetsdCloudInternalClient_setPersonInfoDictionary_forPersonID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient setPersonInfoDictionary:forPersonID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)personInfoDictionaryForPersonID:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v8;
  if (v8)
  {
    BOOL v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: personInfoDictionaryForPersonID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  int v11 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v34 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__6042;
  id v39 = __Block_byref_object_dispose__6043;
  id v40 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__6042;
  long long v31 = __Block_byref_object_dispose__6043;
  id v32 = 0;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__PLAssetsdCloudInternalClient_personInfoDictionaryForPersonID_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &v27;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__PLAssetsdCloudInternalClient_personInfoDictionaryForPersonID_error___block_invoke_2;
  v25[3] = &unk_1E58A00D0;
  void v25[4] = &buf;
  v25[5] = &v27;
  [v17 personInfoDictionaryForPersonID:v7 reply:v25];

  if (a4)
  {
    int v18 = (void *)v28[5];
    if (v18) {
      *a4 = v18;
    }
  }
  id v19 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19;
}

void __70__PLAssetsdCloudInternalClient_personInfoDictionaryForPersonID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__PLAssetsdCloudInternalClient_personInfoDictionaryForPersonID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 32;
  if (v11)
  {
    id v7 = v11;
  }
  else
  {
    uint64_t v6 = 40;
    id v7 = v5;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8);
  id v9 = v7;
  id v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

- (id)emailAddressForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: emailAddressForKey:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  id v11 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v34 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__6042;
  id v39 = __Block_byref_object_dispose__6043;
  id v40 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__6042;
  long long v31 = __Block_byref_object_dispose__6043;
  id v32 = 0;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__PLAssetsdCloudInternalClient_emailAddressForKey_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &v27;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PLAssetsdCloudInternalClient_emailAddressForKey_error___block_invoke_2;
  v25[3] = &unk_1E58A00A8;
  void v25[4] = &buf;
  v25[5] = &v27;
  [v17 emailAddressForKey:a3 reply:v25];

  if (a4)
  {
    int v18 = (void *)v28[5];
    if (v18) {
      *a4 = v18;
    }
  }
  id v19 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19;
}

void __57__PLAssetsdCloudInternalClient_emailAddressForKey_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__PLAssetsdCloudInternalClient_emailAddressForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 32;
  if (v11)
  {
    id v7 = v11;
  }
  else
  {
    uint64_t v6 = 40;
    id v7 = v5;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8);
  id v9 = v7;
  id v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

- (int64_t)keyForEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: keyForEmailAddress:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  id v11 = PLRequestGetLog();
  *((void *)&v33 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v32 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v33 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = -1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__6042;
  uint64_t v37 = __Block_byref_object_dispose__6043;
  id v38 = 0;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__PLAssetsdCloudInternalClient_keyForEmailAddress_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PLAssetsdCloudInternalClient_keyForEmailAddress_error___block_invoke_2;
  v25[3] = &unk_1E58A0080;
  void v25[4] = &v27;
  v25[5] = &buf;
  [v17 keyForEmailAddress:v7 reply:v25];

  if (a4)
  {
    int v18 = *(void **)(*((void *)&buf + 1) + 40);
    if (v18) {
      *a4 = v18;
    }
  }
  int64_t v19 = v28[3];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v27, 8);
  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(*((SEL *)&v33 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19;
}

void __57__PLAssetsdCloudInternalClient_keyForEmailAddress_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__PLAssetsdCloudInternalClient_keyForEmailAddress_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (unint64_t)cloudSharingSpaceManagementRequestWithType:(unint64_t)a3 optionalBytesToPurge:(unint64_t)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v12 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  id v13 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v34 = v14;
  long long v15 = v13;
  long long v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__6042;
  uint64_t v39 = __Block_byref_object_dispose__6043;
  id v40 = 0;
  int v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__PLAssetsdCloudInternalClient_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  void v28[4] = &buf;
  int64_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__PLAssetsdCloudInternalClient_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_error___block_invoke_2;
  v27[3] = &unk_1E58A0058;
  void v27[4] = &buf;
  v27[5] = &v29;
  [v19 cloudSharingSpaceManagementRequestWithType:a3 optionalBytesToPurge:a4 reply:v27];

  if (a5)
  {
    id v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20) {
      *a5 = v20;
    }
  }
  unint64_t v21 = v30[3];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v29, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    os_signpost_id_t v22 = PLRequestGetLog();
    id v23 = v22;
    os_signpost_id_t v24 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      long long v25 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21;
}

void __102__PLAssetsdCloudInternalClient_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_error___block_invoke(uint64_t a1, void *a2)
{
}

void __102__PLAssetsdCloudInternalClient_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)updateSharedAlbumsCachedServerConfigurationLimits
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v18) = v4;
  if (v4)
  {
    id v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateSharedAlbumsCachedServerConfigurationLimits", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v6 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __81__PLAssetsdCloudInternalClient_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke_9;
  v12[3] = &__block_descriptor_88_e8_32n18_8_8_t0w1_s8_t16w32_e49_v16__0___PLAssetsdCloudInternalServiceProtocol__8l;
  char v13 = v18;
  id v14 = *((id *)&v18 + 1);
  long long v15 = v19;
  long long v16 = *(_OWORD *)sel;
  SEL v17 = a2;
  [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_8 handler:v12];

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    BOOL v8 = PLRequestGetLog();
    id v9 = v8;
    os_signpost_id_t v10 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __81__PLAssetsdCloudInternalClient_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke_9(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    char v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      os_signpost_id_t v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 updateSharedAlbumsCachedServerConfigurationLimits];
}

void __81__PLAssetsdCloudInternalClient_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient updateSharedAlbumsCachedServerConfigurationLimits]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)enablePhotostreamsWithStreamID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: enablePhotostreamsWithStreamID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  id v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __63__PLAssetsdCloudInternalClient_enablePhotostreamsWithStreamID___block_invoke_3;
  v15[3] = &unk_1EEBF57B0;
  char v17 = v22;
  id v18 = *((id *)&v22 + 1);
  long long v19 = v23;
  long long v20 = *(_OWORD *)sel;
  SEL v21 = a2;
  id v10 = v5;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_2_6237 handler:v15];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    int v11 = PLRequestGetLog();
    os_signpost_id_t v12 = v11;
    os_signpost_id_t v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      SEL v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __63__PLAssetsdCloudInternalClient_enablePhotostreamsWithStreamID___block_invoke_3(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 enablePhotostreamsWithStreamID:*(void *)(a1 + 32)];
}

void __63__PLAssetsdCloudInternalClient_enablePhotostreamsWithStreamID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdCloudInternalClient enablePhotostreamsWithStreamID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)createPhotostreamAlbumWithStreamID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: createPhotostreamAlbumWithStreamID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    SEL v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6248];
  [v13 createPhotostreamAlbumWithStreamID:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    long long v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      SEL v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __67__PLAssetsdCloudInternalClient_createPhotostreamAlbumWithStreamID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdCloudInternalClient createPhotostreamAlbumWithStreamID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end