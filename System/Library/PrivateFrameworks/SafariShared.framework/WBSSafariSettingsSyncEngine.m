@interface WBSSafariSettingsSyncEngine
- (BOOL)syncEnabled;
- (WBSSafariSettingsSyncEngine)init;
- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3;
- (void)registerDiagnosticInfo:(id)a3;
- (void)registerDiagnosticWithPayloadProvider:(id)a3;
- (void)saveSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4;
- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5;
- (void)syncPerSiteSettingsDownWithCompletion:(id)a3;
- (void)syncPerSiteSettingsUpWithCompletion:(id)a3;
- (void)syncSettingsDownWithCompletion:(id)a3;
- (void)syncSettingsUpWithCompletion:(id)a3;
- (void)triggerImmediateBackgroundImageSaveIfApplicable;
@end

@implementation WBSSafariSettingsSyncEngine

- (WBSSafariSettingsSyncEngine)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSSafariSettingsSyncEngine;
  v2 = [(WBSSafariSettingsSyncEngine *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WBSSafariSettingsSyncEngine.internalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F97FB8] sharedProxy];
    [v5 fetchCloudSettingsChangesImmediately];

    v6 = v2;
  }

  return v2;
}

- (void)registerDiagnosticWithPayloadProvider:(id)a3
{
  id v6 = a3;
  objc_msgSend(MEMORY[0x1E4F97E90], "registeredStateCollectorWithLogLabel:payloadProvider:", @"Safari Start Page State");
  v4 = (WBSDiagnosticStateCollector *)objc_claimAutoreleasedReturnValue();
  stateCollector = self->_stateCollector;
  self->_stateCollector = v4;
}

- (void)saveSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__WBSSafariSettingsSyncEngine_saveSettingWithDictionaryRepresentation_successCompletionHandler___block_invoke;
  v11[3] = &unk_1E5C8C9F8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, v11);
}

void __96__WBSSafariSettingsSyncEngine_saveSettingWithDictionaryRepresentation_successCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 saveCloudSettingWithDictionaryRepresentation:*(void *)(a1 + 32) successCompletionHandler:*(void *)(a1 + 40)];
}

- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WBSSafariSettingsSyncEngine_deleteBackgroundImageFromCloudKitWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5C8D5F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __86__WBSSafariSettingsSyncEngine_deleteBackgroundImageFromCloudKitWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 deleteBackgroundImageFromCloudKitWithCompletionHandler:*(void *)(a1 + 32)];
}

- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__WBSSafariSettingsSyncEngine_scheduleCloudBackgroundImageSaveWithURL_isLightAppearance_successCompletionHandler___block_invoke;
  block[3] = &unk_1E5C9FAF0;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, block);
}

void __114__WBSSafariSettingsSyncEngine_scheduleCloudBackgroundImageSaveWithURL_isLightAppearance_successCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 scheduleCloudBackgroundImageSaveWithURL:*(void *)(a1 + 32) isLightAppearance:*(unsigned __int8 *)(a1 + 48) successCompletionHandler:*(void *)(a1 + 40)];
}

- (void)triggerImmediateBackgroundImageSaveIfApplicable
{
}

void __78__WBSSafariSettingsSyncEngine_triggerImmediateBackgroundImageSaveIfApplicable__block_invoke()
{
  id v0 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v0 triggerImmediateBackgroundImageSaveIfApplicable];
}

- (BOOL)syncEnabled
{
  return 0;
}

- (void)syncSettingsDownWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSSafariSettingsSyncEngine_syncSettingsDownWithCompletion___block_invoke;
  block[3] = &unk_1E5C8D5F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __62__WBSSafariSettingsSyncEngine_syncSettingsDownWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 syncDownSafariSettingsSyncWithCompletion:*(void *)(a1 + 32)];
}

- (void)syncSettingsUpWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSSafariSettingsSyncEngine_syncSettingsUpWithCompletion___block_invoke;
  block[3] = &unk_1E5C8D5F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __60__WBSSafariSettingsSyncEngine_syncSettingsUpWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 syncUpSafariSettingsSyncWithCompletion:*(void *)(a1 + 32)];
}

- (void)registerDiagnosticInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__WBSSafariSettingsSyncEngine_registerDiagnosticInfo___block_invoke;
  v6[3] = &unk_1E5C9FB18;
  id v7 = v4;
  id v5 = v4;
  [(WBSSafariSettingsSyncEngine *)self registerDiagnosticWithPayloadProvider:v6];
}

id __54__WBSSafariSettingsSyncEngine_registerDiagnosticInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)syncPerSiteSettingsDownWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WBSSafariSettingsSyncEngine_syncPerSiteSettingsDownWithCompletion___block_invoke;
  block[3] = &unk_1E5C8D5F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __69__WBSSafariSettingsSyncEngine_syncPerSiteSettingsDownWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 syncDownSafariPerSiteSettingsSyncWithCompletion:*(void *)(a1 + 32)];
}

- (void)syncPerSiteSettingsUpWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSSafariSettingsSyncEngine_syncPerSiteSettingsUpWithCompletion___block_invoke;
  block[3] = &unk_1E5C8D5F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __67__WBSSafariSettingsSyncEngine_syncPerSiteSettingsUpWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v2 syncUpSafariPerSiteSettingsSyncWithCompletion:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end