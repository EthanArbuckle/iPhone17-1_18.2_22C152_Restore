@interface VCVoiceShortcutClient
+ (VCVoiceShortcutClient)standardClient;
- (BOOL)requestDataMigration:(id *)a3;
- (BOOL)resetAutomationConfirmationStatusWithError:(id *)a3;
- (BOOL)userHasAutomationsWithError:(id *)a3;
- (NSHashTable)errorHandlers;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalStateQueue;
- (OS_dispatch_queue)xpcQueue;
- (VCVoiceShortcutClient)initWithListenerEndpoint:(id)a3;
- (VCVoiceShortcutClient)initWithMachServiceName:(id)a3 options:(unint64_t)a4 interfaceSetupBlock:(id)a5;
- (VCVoiceShortcutClient)initWithXPCConnection:(id)a3 XPCConnectionCreationBlock:(id)a4 XPCInterfaceSetupBlock:(id)a5;
- (VCVoiceShortcutClient)initWithXPCConnectionCreationBlock:(id)a3 XPCInterfaceSetupBlock:(id)a4;
- (WFSystemSurfaceWorkflowStatusRegistry)systemSurfaceStatus;
- (WFVoiceShortcutCache)voiceShortcutCache;
- (id)accessibilityWatchWorkflowsWithError:(id *)a3;
- (id)accessibilityWorkflowForIdentifier:(id)a3 error:(id *)a4;
- (id)accessibilityWorkflowWithIdentifier:(id)a3 error:(id *)a4;
- (id)accessibilityWorkflowsForSurface:(unint64_t)a3 error:(id *)a4;
- (id)accessibilityWorkflowsWithError:(id *)a3;
- (id)archiveAction:(id)a3 withActionMetadata:(id)a4 error:(id *)a5;
- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3;
- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3 synchronous:(BOOL)a4;
- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)contextualActionsForContext:(id)a3 error:(id *)a4;
- (id)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 error:(id *)a6;
- (id)createBookmarkWithURL:(id)a3 workflowID:(id)a4 error:(id *)a5;
- (id)creationBlock;
- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 error:(id *)a6;
- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 padding:(double)a6 error:(id *)a7;
- (id)fetchURLForFPItem:(id)a3 error:(id *)a4;
- (id)filteredContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 error:(id *)a6;
- (id)firstUnsortedWorkflowWithBackgroundColorValue:(id *)a3 error:(id *)a4;
- (id)foldersWithError:(id *)a3;
- (id)getResultsForQuery:(id)a3 resultClass:(Class)a4 resultState:(id *)a5 error:(id *)a6;
- (id)getValueForDescriptor:(id)a3 resultClass:(Class)a4 error:(id *)a5;
- (id)getVaultItemsAccessForBackgroundRunner;
- (id)interfaceSetupBlock;
- (id)linkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 error:(id *)a6;
- (id)menuBarWorkflowsWithGlyphSize:(CGSize)a3 error:(id *)a4;
- (id)migratedAppIntentWithINIntent:(id)a3 error:(id *)a4;
- (id)observableStingWorkflowWithIdentifier:(id)a3 error:(id *)a4;
- (id)observableStingWorkflowsWithError:(id *)a3;
- (id)resolveBookmarkData:(id)a3 updatedData:(id *)a4 error:(id *)a5;
- (id)resolveCrossDeviceItemID:(id)a3 error:(id *)a4;
- (id)resolveFilePath:(id)a3 workflowID:(id)a4 error:(id *)a5;
- (id)serializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 error:(id *)a5;
- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleIdentifier:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8;
- (id)shortcutWithIdentifier:(id)a3 error:(id *)a4;
- (id)shortcutWithIdentifier:(id)a3 glyphSize:(CGSize)a4 error:(id *)a5;
- (id)shortcutsInCollectionWithIdentifier:(id)a3 error:(id *)a4;
- (id)stingWorkflowWithIdentifier:(id)a3 error:(id *)a4;
- (id)stingWorkflowsWithError:(id *)a3;
- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3;
- (id)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 error:(id *)a5;
- (id)unsafePopConnectionErrorHandlers;
- (id)visibleShortcutsWithError:(id *)a3;
- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)callErrorHandlerIfNeeded:(id)a3 withError:(id)a4;
- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4;
- (void)computeRepresentativeSizesForFinderResizingImages:(id)a3 toSizes:(id)a4 completion:(id)a5;
- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5;
- (void)createVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)defaultStaccatoActionWithCompletion:(id)a3;
- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteVoiceShortcutWithName:(id)a3 completion:(id)a4;
- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4;
- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4;
- (void)fetchAllValuesForStaccatoParameter:(id)a3 completion:(id)a4;
- (void)fetchAvailableStaccatoActions:(id)a3;
- (void)filterContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 completion:(id)a6;
- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4;
- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3;
- (void)getContextualActionsForContext:(id)a3 completion:(id)a4;
- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3;
- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4;
- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5;
- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4;
- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3;
- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 phraseSignature:(id)a4 completion:(id)a5;
- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5;
- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutsWithCompletion:(id)a3;
- (void)getWidgetWorkflowWithIdentifier:(id)a3 completion:(id)a4;
- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)handleXPCConnectionInterruption;
- (void)handleXPCConnectionInvalidation;
- (void)importSharedShortcutFromURL:(id)a3 completion:(id)a4;
- (void)importSharedShortcutFromURL:(id)a3 withName:(id)a4 shortcutSource:(id)a5 completion:(id)a6;
- (void)importShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6;
- (void)importTopLevelShortcutFromURL:(id)a3 withName:(id)a4 completion:(id)a5;
- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5;
- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6;
- (void)logRunOfContextualAction:(id)a3;
- (void)obliterateShortcuts:(id)a3;
- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6;
- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5;
- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4;
- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4;
- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6;
- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6;
- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4;
- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 phraseSignature:(id)a5 completion:(id)a6;
- (void)setXpcConnection:(id)a3;
- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4;
- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7;
- (void)subscribeToVoiceShortcutDataUpdateNotifications;
- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5;
- (void)triggerFullContextualActionReindexWithCompletion:(id)a3;
- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5;
- (void)unsafeSetupXPCConnection;
- (void)unsubscribeFromVoiceShortcutDataUpdateNotifications;
- (void)updateAppShortcutsWithCompletion:(id)a3;
- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6;
@end

@implementation VCVoiceShortcutClient

+ (VCVoiceShortcutClient)standardClient
{
  if (standardClient_onceToken != -1) {
    dispatch_once(&standardClient_onceToken, &__block_literal_global_20635);
  }
  v2 = (void *)standardClient_standardClient;
  return (VCVoiceShortcutClient *)v2;
}

- (void)fetchAvailableStaccatoActions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VCVoiceShortcutClient(Staccato) fetchAvailableStaccatoActions:]";
    _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_DEFAULT, "%s Client requesting all available staccato actions.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__VCVoiceShortcutClient_Staccato__fetchAvailableStaccatoActions___block_invoke;
  v8[3] = &unk_1E6079C90;
  id v9 = v4;
  id v6 = v4;
  v7 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v8];
  [v7 fetchAvailableStaccatoActions:v6];
}

- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[VCVoiceShortcutClient(Staccato) fetchAllValueSectionsForStaccatoParameter:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEFAULT, "%s Client requesting all values for parameter: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__VCVoiceShortcutClient_Staccato__fetchAllValueSectionsForStaccatoParameter_completion___block_invoke;
  v11[3] = &unk_1E6079C90;
  id v12 = v7;
  id v9 = v7;
  v10 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v11];
  [v10 fetchAllValueSectionsForStaccatoParameter:v6 completion:v9];
}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20495;
  v19 = __Block_byref_object_dispose__20496;
  id v20 = 0;
  internalStateQueue = self->_internalStateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke;
  v11[3] = &unk_1E6079AF0;
  void v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(internalStateQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  return [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:a3 synchronous:0];
}

uint64_t __39__VCVoiceShortcutClient_standardClient__block_invoke()
{
  standardClient_standardClient = [[VCVoiceShortcutClient alloc] initWithMachServiceName:@"com.apple.siri.VoiceShortcuts.xpc" options:0 interfaceSetupBlock:0];
  return MEMORY[0x1F41817F8]();
}

- (VCVoiceShortcutClient)initWithMachServiceName:(id)a3 options:(unint64_t)a4 interfaceSetupBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 116, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__VCVoiceShortcutClient_initWithMachServiceName_options_interfaceSetupBlock___block_invoke;
  v15[3] = &unk_1E6079840;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = [(VCVoiceShortcutClient *)self initWithXPCConnectionCreationBlock:v15 XPCInterfaceSetupBlock:v10];

  return v12;
}

- (VCVoiceShortcutClient)initWithXPCConnectionCreationBlock:(id)a3 XPCInterfaceSetupBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 111, @"Invalid parameter not satisfying: %@", @"creationBlock" object file lineNumber description];
  }
  id v9 = [(VCVoiceShortcutClient *)self initWithXPCConnection:0 XPCConnectionCreationBlock:v7 XPCInterfaceSetupBlock:v8];

  return v9;
}

void __97__VCVoiceShortcutClient_initWithXPCConnection_XPCConnectionCreationBlock_XPCInterfaceSetupBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained xpcConnection];

  if (v1) {
    [WeakRetained unsafeSetupXPCConnection];
  }
}

void __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 40) copy];
  v3 = [*(id *)(a1 + 32) errorHandlers];
  id v4 = _Block_copy(v2);
  [v3 addObject:v4];

  v5 = [*(id *)(a1 + 32) xpcConnection];
  if (v5)
  {
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) creationBlock];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) creationBlock];
      id v8 = v7[2]();
      [*(id *)(a1 + 32) setXpcConnection:v8];

      [*(id *)(a1 + 32) unsafeSetupXPCConnection];
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_2;
  aBlock[3] = &unk_1E6079AC8;
  aBlock[4] = *(void *)(a1 + 32);
  id v9 = v2;
  id v24 = v9;
  id v10 = _Block_copy(aBlock);
  int v11 = *(unsigned __int8 *)(a1 + 56);
  id v12 = [*(id *)(a1 + 32) xpcConnection];
  v13 = v12;
  if (v11) {
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v10];
  }
  else {
  BOOL v14 = [v12 remoteObjectProxyWithErrorHandler:v10];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v14);

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [*(id *)(a1 + 32) setXpcConnection:0];
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__20495;
    v21[4] = __Block_byref_object_dispose__20496;
    id v22 = [*(id *)(a1 + 32) unsafePopConnectionErrorHandlers];
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    id v16 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_3;
    v18[3] = &unk_1E6079B40;
    id v19 = v15;
    id v20 = v21;
    id v17 = v15;
    dispatch_async(v16, v18);

    _Block_object_dispose(v21, 8);
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSHashTable)errorHandlers
{
  return self->_errorHandlers;
}

- (id)creationBlock
{
  return self->_creationBlock;
}

id __77__VCVoiceShortcutClient_initWithMachServiceName_options_interfaceSetupBlock___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  return v1;
}

- (void)unsafeSetupXPCConnection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  id v4 = [(VCVoiceShortcutClient *)self xpcQueue];
  [(NSXPCConnection *)xpcConnection _setQueue:v4];

  v5 = VCVoiceShortcutManagerXPCInterface();
  id v6 = [(VCVoiceShortcutClient *)self interfaceSetupBlock];

  if (v6)
  {
    id v7 = [(VCVoiceShortcutClient *)self interfaceSetupBlock];
    ((void (**)(void, void *))v7)[2](v7, v5);
  }
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke;
  v12[3] = &unk_1E6079818;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke_178;
  v10[3] = &unk_1E6079818;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v10];
  [(NSXPCConnection *)self->_xpcConnection resume];
  id v8 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_xpcConnection;
    *(_DWORD *)buf = 136315906;
    id v16 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]";
    __int16 v17 = 2112;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = @"com.apple.siri.VoiceShortcuts.xpc";
    _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ XPCConnection=%@ resumed to machServiceName=%{public}@", buf, 0x2Au);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcConnection:(id)a3
{
}

- (id)interfaceSetupBlock
{
  return self->_interfaceSetupBlock;
}

- (VCVoiceShortcutClient)initWithXPCConnection:(id)a3 XPCConnectionCreationBlock:(id)a4 XPCInterfaceSetupBlock:(id)a5
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 81, @"Invalid parameter not satisfying: %@", @"connection || creationBlock" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)VCVoiceShortcutClient;
  id v13 = [(VCVoiceShortcutClient *)&v37 init];
  if (v13)
  {
    BOOL v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.shortcuts.VCVoiceShortcutClient.XPC", v14);
    xpcQueue = v13->_xpcQueue;
    v13->_xpcQueue = (OS_dispatch_queue *)v15;

    __int16 v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.shortcuts.VCVoiceShortcutClient.InternalState", v17);
    internalStateQueue = v13->_internalStateQueue;
    v13->_internalStateQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    errorHandlers = v13->_errorHandlers;
    v13->_errorHandlers = (NSHashTable *)v20;

    objc_storeStrong((id *)&v13->_xpcConnection, a3);
    uint64_t v22 = [(id)v11 copy];
    id creationBlock = v13->_creationBlock;
    v13->_id creationBlock = (id)v22;

    uint64_t v24 = [v12 copy];
    id interfaceSetupBlock = v13->_interfaceSetupBlock;
    v13->_id interfaceSetupBlock = (id)v24;

    v26 = objc_alloc_init(WFSystemSurfaceWorkflowStatusRegistry);
    systemSurfaceStatus = v13->_systemSurfaceStatus;
    v13->_systemSurfaceStatus = v26;

    v28 = objc_alloc_init(WFVoiceShortcutCache);
    voiceShortcutCache = v13->_voiceShortcutCache;
    v13->_voiceShortcutCache = v28;

    [(VCVoiceShortcutClient *)v13 subscribeToVoiceShortcutDataUpdateNotifications];
    objc_initWeak(&location, v13);
    v30 = v13->_internalStateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__VCVoiceShortcutClient_initWithXPCConnection_XPCConnectionCreationBlock_XPCInterfaceSetupBlock___block_invoke;
    block[3] = &unk_1E6079818;
    objc_copyWeak(&v35, &location);
    dispatch_async(v30, block);
    v31 = v13;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)subscribeToVoiceShortcutDataUpdateNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)VCVoiceShortcutDataDidUpdateNotificationHandler, @"com.apple.siri.VoiceShortcuts.DataDidUpdateNotification", 0, (CFNotificationSuspensionBehavior)0);
  id v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[VCVoiceShortcutClient subscribeToVoiceShortcutDataUpdateNotifications]";
    __int16 v7 = 2112;
    id v8 = @"com.apple.siri.VoiceShortcuts.DataDidUpdateNotification";
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_DEBUG, "%s Subscribed to notification: (%@)", (uint8_t *)&v5, 0x16u);
  }
}

- (id)menuBarWorkflowsWithGlyphSize:(CGSize)a3 error:(id *)a4
{
  double height = a3.height;
  double width = a3.width;
  __int16 v7 = [[WFWorkflowQuery alloc] initWithWorkflowType:@"MenuBar"];
  id v8 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v7, objc_opt_class(), a4, width, height);

  return v8;
}

- (id)stingWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(VCVoiceShortcutClient *)self observableStingWorkflowWithIdentifier:a3 error:a4];
  int v5 = [v4 value];

  return v5;
}

- (id)stingWorkflowsWithError:(id *)a3
{
  v3 = [(VCVoiceShortcutClient *)self observableStingWorkflowsWithError:a3];
  id v4 = [v3 values];

  return v4;
}

- (id)observableStingWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [[WFDatabaseObjectDescriptor alloc] initWithIdentifier:v5 objectType:0];
    __int16 v7 = +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v6, objc_opt_class(), a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    id v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      unint64_t v11 = "-[VCVoiceShortcutClient(Sting) observableStingWorkflowWithIdentifier:error:]";
    }

    __int16 v7 = 0;
  }

  return v7;
}

- (id)observableStingWorkflowsWithError:(id *)a3
{
  id v4 = [[WFWorkflowQuery alloc] initWithWorkflowType:@"Watch"];
  id v5 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v5;
}

- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke_2;
  v14[3] = &unk_1E6078688;
  id v15 = v9;
  id v13 = v9;
  [v12 loadDataWithItemProviderRequestMetadata:v11 type:v10 completion:v14];
}

uint64_t __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke;
  v18[3] = &unk_1E6079C90;
  id v11 = v10;
  id v19 = v11;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke_2;
  v16[3] = &unk_1E6079960;
  id v17 = v11;
  id v15 = v11;
  [v14 loadFileURLWithItemProviderRequestMetadata:v13 type:v12 openInPlace:v6 completion:v16];
}

uint64_t __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)serializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1742;
  v26 = __Block_byref_object_dispose__1743;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1742;
  uint64_t v20 = __Block_byref_object_dispose__1743;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke;
  v15[3] = &unk_1E6079890;
  void v15[4] = &v22;
  id v10 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke_2;
  v14[3] = &unk_1E6077208;
  void v14[4] = &v16;
  v14[5] = &v22;
  [v10 getSerializedParametersForLinkAction:v8 actionMetadata:v9 completion:v14];

  id v11 = (void *)v17[5];
  if (a5 && !v11)
  {
    *a5 = (id) v23[5];
    id v11 = (void *)v17[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
}

void __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)migratedAppIntentWithINIntent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1742;
  uint64_t v23 = __Block_byref_object_dispose__1743;
  id v24 = 0;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1742;
  id v17 = __Block_byref_object_dispose__1743;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke;
  v12[3] = &unk_1E6079890;
  void v12[4] = &v19;
  uint64_t v7 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke_2;
  v11[3] = &unk_1E60771E0;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 getMigratedAppIntentWithINIntent:v6 completion:v11];

  id v8 = (void *)v14[5];
  if (a4 && !v8)
  {
    *a4 = (id) v20[5];
    id v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)linkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1742;
  v29 = __Block_byref_object_dispose__1743;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1742;
  uint64_t v23 = __Block_byref_object_dispose__1743;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke;
  v18[3] = &unk_1E6079890;
  void v18[4] = &v25;
  uint64_t v13 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke_2;
  v17[3] = &unk_1E60771B8;
  v17[4] = &v19;
  v17[5] = &v25;
  [v13 getLinkActionWithAppBundleIdentifier:v10 appIntentIdentifier:v11 serializedParameterStates:v12 completion:v17];

  BOOL v14 = (void *)v20[5];
  if (a6 && !v14)
  {
    *a6 = (id) v26[5];
    BOOL v14 = (void *)v20[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke(uint64_t a1, void *a2)
{
}

void __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  [v12 unarchiveActionFromData:v11 withActionMetadata:v10 completion:v9];
}

uint64_t __91__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  [v12 archiveAction:v11 withActionMetadata:v10 completion:v9];
}

uint64_t __81__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1742;
  v26 = __Block_byref_object_dispose__1743;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1742;
  uint64_t v20 = __Block_byref_object_dispose__1743;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke;
  v15[3] = &unk_1E6077190;
  void v15[4] = &v22;
  void v15[5] = &v16;
  id v10 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke_2;
  v14[3] = &unk_1E60771B8;
  void v14[4] = &v22;
  v14[5] = &v16;
  [v10 unarchiveActionFromData:v8 withActionMetadata:v9 completion:v14];

  id v11 = (void *)v23[5];
  if (a5 && !v11)
  {
    *a5 = (id) v17[5];
    id v11 = (void *)v23[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)archiveAction:(id)a3 withActionMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1742;
  v26 = __Block_byref_object_dispose__1743;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1742;
  uint64_t v20 = __Block_byref_object_dispose__1743;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke;
  v15[3] = &unk_1E6077190;
  void v15[4] = &v22;
  void v15[5] = &v16;
  id v10 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke_2;
  v14[3] = &unk_1E6079BE0;
  void v14[4] = &v22;
  v14[5] = &v16;
  [v10 archiveAction:v8 withActionMetadata:v9 completion:v14];

  id v11 = (void *)v23[5];
  if (a5 && !v11)
  {
    *a5 = (id) v17[5];
    id v11 = (void *)v23[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(WFAppShortcutColorFetcher);
  uint64_t v7 = [(WFAppShortcutColorFetcher *)v6 colorsForBundleIdentifier:v5 error:a4];

  return v7;
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __140__VCVoiceShortcutClient_TopHitContextual__getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke;
  v18[3] = &unk_1E6079C90;
  id v19 = v12;
  id v13 = v12;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v18];
  [v17 getLinkActionWithAppBundleIdentifier:v16 appIntentIdentifier:v15 expandingParameterName:v14 limit:a6 completion:v13];
}

uint64_t __140__VCVoiceShortcutClient_TopHitContextual__getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__VCVoiceShortcutClient_TopHitContextual__getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke;
  v12[3] = &unk_1E6079C90;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v12];
  [v11 getUpcomingMediaForBundleIdentifier:v10 limit:a4 completion:v9];
}

uint64_t __96__VCVoiceShortcutClient_TopHitContextual__getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__VCVoiceShortcutClient_TopHitContextual__getFavoriteContactsWithLimit_completion___block_invoke;
  v9[3] = &unk_1E6079C90;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v9];
  [v8 getFavoriteContactsWithLimit:a3 completion:v7];
}

uint64_t __83__VCVoiceShortcutClient_TopHitContextual__getFavoriteContactsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__VCVoiceShortcutClient_TopHitContextual__getRecentsCallWithTelephony_limit_completion___block_invoke;
  v11[3] = &unk_1E6079C90;
  id v12 = v8;
  id v9 = v8;
  id v10 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v11];
  [v10 getRecentsCallWithTelephony:v6 limit:a4 completion:v9];
}

uint64_t __88__VCVoiceShortcutClient_TopHitContextual__getRecentsCallWithTelephony_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__VCVoiceShortcutClient_TopHitContextual__getSuggestedShortcutsWithLimit_completion___block_invoke;
  v9[3] = &unk_1E6079C90;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v9];
  [v8 getSuggestedShortcutsWithLimit:a3 completion:v7];
}

uint64_t __85__VCVoiceShortcutClient_TopHitContextual__getSuggestedShortcutsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importTopLevelShortcutFromURL:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__VCVoiceShortcutClient_VoiceShortcuts__importTopLevelShortcutFromURL_withName_completion___block_invoke;
  v10[3] = &unk_1E6078220;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(VCVoiceShortcutClient *)self importSharedShortcutFromURL:a3 withName:a4 shortcutSource:@"ShortcutSourceSiriTopLevelShortcut" completion:v10];
}

void __91__VCVoiceShortcutClient_VoiceShortcuts__importTopLevelShortcutFromURL_withName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = [*(id *)(a1 + 32) voiceShortcutCache];
    [v6 clear];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteVoiceShortcutWithName:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 98, @"Invalid parameter not satisfying: %@", @"voiceShortcutName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 99, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[VCVoiceShortcutClient(VoiceShortcuts) deleteVoiceShortcutWithName:completion:]";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with name=%@", buf, 0x16u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke;
  v18[3] = &unk_1E6079C90;
  id v11 = v9;
  id v19 = v11;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke_2;
  v16[3] = &unk_1E60781F8;
  void v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  [v12 deleteVoiceShortcutWithIdentifier:0 name:v7 completion:v16];
}

uint64_t __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) voiceShortcutCache];
    [v5 clear];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 82, @"Invalid parameter not satisfying: %@", @"voiceShortcutIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 83, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[VCVoiceShortcutClient(VoiceShortcuts) deleteVoiceShortcutWithIdentifier:completion:]";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with id=%@", buf, 0x16u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E6079C90;
  id v11 = v9;
  id v19 = v11;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E60781F8;
  void v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  [v12 deleteVoiceShortcutWithIdentifier:v7 name:0 completion:v16];
}

uint64_t __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) voiceShortcutCache];
    [v5 clear];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 73, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 74, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsForAppWithBundleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E6079C90;
  id v15 = v9;
  id v10 = v9;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v14];
  [v11 getVoiceShortcutsForAppWithBundleIdentifier:v7 completion:v10];
}

uint64_t __96__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsForAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getVoiceShortcutsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 46, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = [(VCVoiceShortcutClient *)self voiceShortcutCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke;
  v9[3] = &unk_1E60781D0;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 getCachedVoiceShortcuts:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[VCVoiceShortcutClient(VoiceShortcuts) getVoiceShortcutsWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_INFO, "%s Returning cached voice shortcuts.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = [WeakRetained voiceShortcutCache];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_62;
    v8[3] = &unk_1E60781A8;
    void v8[4] = v5;
    id v9 = *(id *)(a1 + 32);
    [v7 setCachedVoiceShortcuts:v8];
  }
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E6079C90;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v5 = [v4 asynchronousRemoteDataStoreWithErrorHandler:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_3;
  v7[3] = &unk_1E6078180;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  [v5 getVoiceShortcutsWithCompletion:v7];
}

uint64_t __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 37, @"Invalid parameter not satisfying: %@", @"phrase" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 38, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithPhrase_completion___block_invoke;
  v14[3] = &unk_1E6079C90;
  id v15 = v9;
  id v10 = v9;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v14];
  [v11 getVoiceShortcutWithPhrase:v7 completion:v10];
}

uint64_t __79__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithPhrase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 28, @"Invalid parameter not satisfying: %@", @"voiceShortcutIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 29, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E6079C90;
  id v15 = v9;
  id v10 = v9;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v14];
  [v11 getVoiceShortcutWithIdentifier:v7 completion:v10];
}

uint64_t __83__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_VoiceShortcuts.m", 20, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__VCVoiceShortcutClient_VoiceShortcuts__getNumberOfVoiceShortcutsWithCompletion___block_invoke;
  v9[3] = &unk_1E6079C90;
  id v10 = v5;
  id v6 = v5;
  id v7 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v9];
  [v7 getNumberOfVoiceShortcutsWithCompletion:v6];
}

uint64_t __81__VCVoiceShortcutClient_VoiceShortcuts__getNumberOfVoiceShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke;
  v10[3] = &unk_1E6079C90;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6079C90;
  id v9 = v5;
  id v7 = v5;
  [v6 updateAppShortcutsWithCompletion:v8];
}

uint64_t __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke_2;
  v11[3] = &unk_1E6079C90;
  id v12 = v7;
  id v10 = v7;
  [v9 removeAllSerializedParametersForQueryName:v8 completion:v11];
}

uint64_t __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke;
  v21[3] = &unk_1E6079C90;
  id v13 = v12;
  id v22 = v13;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke_2;
  v19[3] = &unk_1E6079C90;
  id v20 = v13;
  id v18 = v13;
  [v17 storeSerializedParameters:v16 forAppEntityIdentifier:v15 queryName:v14 badgeType:a6 completion:v19];
}

uint64_t __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E6078688;
  id v12 = v7;
  id v10 = v7;
  [v9 serializedParametersForAppEntityIdentifier:v8 completion:v11];
}

uint64_t __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 phraseSignature:(id)a5 completion:(id)a6
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = (void (**)(id, id))a6;
  objc_msgSend(v6, "vc_voiceShortcutErrorWithCode:reason:", 1014, @"Individual App Shortcuts can no longer be hidden from Spotlight.");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);
}

- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 phraseSignature:(id)a4 completion:(id)a5
{
}

- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = (void (**)(id, id))a5;
  objc_msgSend(v5, "vc_voiceShortcutErrorWithCode:reason:", 1014, @"This setting is now managed by the global Show Content in Search setting.");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);
}

- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v9 = v8;
  id v16 = v9;
  id v10 = a4;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E6079C90;
  id v14 = v9;
  id v12 = v9;
  [v11 setSiriAutoShortcutsEnablement:v6 forBundleIdentifier:v10 completion:v13];
}

uint64_t __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E6078660;
  id v12 = v7;
  id v10 = v7;
  [v9 getSiriAutoShortcutsEnablementForBundleIdentifier:v8 completion:v11];
}

uint64_t __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accessibilityWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(VCVoiceShortcutClient *)self accessibilityWorkflowForIdentifier:a3 error:a4];
  id v5 = [v4 value];

  return v5;
}

- (id)accessibilityWatchWorkflowsWithError:(id *)a3
{
  id v3 = [(VCVoiceShortcutClient *)self accessibilityWorkflowsForSurface:1 error:a3];
  id v4 = [v3 values];

  return v4;
}

- (id)accessibilityWorkflowsWithError:(id *)a3
{
  id v3 = [(VCVoiceShortcutClient *)self accessibilityWorkflowsForSurface:0 error:a3];
  id v4 = [v3 values];

  return v4;
}

- (id)accessibilityWorkflowForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [[WFDatabaseObjectDescriptor alloc] initWithIdentifier:v5 objectType:0];
    id v7 = +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v6, objc_opt_class(), a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    id v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      id v11 = "-[VCVoiceShortcutClient(Accessibility) accessibilityWorkflowForIdentifier:error:]";
    }

    id v7 = 0;
  }

  return v7;
}

- (id)accessibilityWorkflowsForSurface:(unint64_t)a3 error:(id *)a4
{
  id v6 = [WFWorkflowQuery alloc];
  if (a3 == 1) {
    uint64_t v7 = [(WFWorkflowQuery *)v6 initWithWorkflowType:@"Watch"];
  }
  else {
    uint64_t v7 = [(WFWorkflowQuery *)v6 initWithLocation:0];
  }
  id v8 = (void *)v7;
  id v9 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v7, objc_opt_class(), a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v9;
}

- (void)defaultStaccatoActionWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[VCVoiceShortcutClient(Staccato) defaultStaccatoActionWithCompletion:]";
    _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_DEFAULT, "%s Client requesting default system action.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__VCVoiceShortcutClient_Staccato__defaultStaccatoActionWithCompletion___block_invoke;
  v8[3] = &unk_1E6079C90;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v8];
  [v7 defaultStaccatoActionWithCompletion:v6];
}

uint64_t __71__VCVoiceShortcutClient_Staccato__defaultStaccatoActionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[VCVoiceShortcutClient(Staccato) configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s Client requesting configured system action from template: %@ with parameters by key: %@.", buf, 0x20u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__VCVoiceShortcutClient_Staccato__configuredStaccatoActionFromTemplate_valuesByParameterKey_completion___block_invoke;
  v14[3] = &unk_1E6079C90;
  id v15 = v10;
  id v12 = v10;
  id v13 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v14];
  [v13 configuredStaccatoActionFromTemplate:v8 valuesByParameterKey:v9 completion:v12];
}

uint64_t __104__VCVoiceShortcutClient_Staccato__configuredStaccatoActionFromTemplate_valuesByParameterKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllValuesForStaccatoParameter:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke;
  v8[3] = &unk_1E6079698;
  id v9 = v6;
  id v7 = v6;
  [(VCVoiceShortcutClient *)self fetchAllValueSectionsForStaccatoParameter:a3 completion:v8];
}

void __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    objc_msgSend(a2, "if_flatMap:", &__block_literal_global_11350);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 values];
}

uint64_t __88__VCVoiceShortcutClient_Staccato__fetchAllValueSectionsForStaccatoParameter_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VCVoiceShortcutClient_Staccato__fetchAvailableStaccatoActions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)resetAutomationConfirmationStatusWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__12788;
  id v14 = __Block_byref_object_dispose__12789;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke;
  v9[3] = &unk_1E6079890;
  void v9[4] = &v10;
  id v4 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke_2;
  v8[3] = &unk_1E6079890;
  void v8[4] = &v10;
  [v4 resetAutomationConfirmationStatusWithCompletion:v8];

  id v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = v5;
    id v5 = (void *)v11[5];
  }
  BOOL v6 = v5 == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)userHasAutomationsWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__12788;
  __int16 v18 = __Block_byref_object_dispose__12789;
  id v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke;
  v9[3] = &unk_1E6079890;
  void v9[4] = &v14;
  id v4 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke_2;
  v8[3] = &unk_1E60798B8;
  void v8[4] = &v10;
  void v8[5] = &v14;
  [v4 userHasAutomationsWithCompletion:v8];

  if (a3)
  {
    id v5 = (void *)v15[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)computeRepresentativeSizesForFinderResizingImages:(id)a3 toSizes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = v8;
    if (!v11)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray * _Nonnull WFDrawRandomly(NSArray * _Nonnull __strong, NSUInteger)");
      [v21 handleFailureInFunction:v22, @"VCVoiceShortcutClient_ContextualActions.m", 169, @"Invalid parameter not satisfying: %@", @"array" file lineNumber description];
    }
    unint64_t v12 = [v11 count];
    if (v12 >= 3) {
      unint64_t v13 = 3;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v14 = objc_opt_new();
    id v15 = (void *)[v11 mutableCopy];
    while ([v14 count] < v13)
    {
      uint64_t v16 = arc4random_uniform([v15 count]);
      id v17 = [v15 objectAtIndexedSubscript:v16];
      [v14 addObject:v17];

      [v15 removeObjectAtIndex:v16];
    }
    __int16 v18 = (void *)[v14 copy];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke;
    v25[3] = &unk_1E6079C90;
    id v19 = v10;
    id v26 = v19;
    __int16 v20 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_2;
    v23[3] = &unk_1E6078EC0;
    id v24 = v19;
    [v20 computeFinderResizedSizesForImages:v18 inSizes:v9 completion:v23];
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

uint64_t __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__14678;
    void v8[4] = __Block_byref_object_dispose__14679;
    id v9 = (id)objc_opt_new();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_79;
    v7[3] = &unk_1E6078E98;
    void v7[4] = v10;
    v7[5] = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    _Block_object_dispose(v8, 8);

    _Block_object_dispose(v10, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v17 = a3;
  id v5 = a2;
  if ((unint64_t)[v17 count] < 2)
  {
    id v15 = [v17 firstObject];
    unint64_t v14 = [v15 unsignedIntValue];
  }
  else
  {
    id v6 = WFEvaluateMathematicalFunction(@"average:", v17);
    [v6 doubleValue];
    double v8 = v7;

    id v9 = WFEvaluateMathematicalFunction(@"stddev:", v17);
    [v9 doubleValue];
    long double v11 = v10;

    if (v11 > 0.0)
    {
      double v12 = log10(v11);
      double v13 = __exp10(floor(v12));
      double v8 = ceil(v8 / (double)(unint64_t)v13) * (double)(unint64_t)v13;
    }
    unint64_t v14 = (unint64_t)v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:v5];
}

- (void)logRunOfContextualAction:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_ContextualActions.m", 128, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  id v6 = [v5 action];
  unint64_t v7 = [v5 surface];
  if (v7 > 0x12) {
    double v8 = 0;
  }
  else {
    double v8 = off_1E6078518[v7];
  }
  id v9 = v8;
  if (v9) {
    double v10 = v9;
  }
  else {
    double v10 = @"Unknown";
  }
  long double v11 = [v5 contentTypes];
  double v12 = objc_msgSend(v11, "if_map:", &__block_literal_global_14701);

  uint64_t v13 = [v6 correspondingSystemActionType];
  if (v13 == 2)
  {
    unint64_t v14 = (void *)[objc_alloc((Class)getBMContextualActionParameterClass()) initWithType:@"WFNumberContentItem" metadata:&unk_1F0CB1F58];
    objc_super v37 = v14;
    id v15 = &v37;
    goto LABEL_13;
  }
  if (v13 == 1)
  {
    unint64_t v14 = (void *)[objc_alloc((Class)getBMContextualActionParameterClass()) initWithType:@"WFNumberContentItem" metadata:&unk_1F0CB1F30];
    v38[0] = v14;
    id v15 = (void **)v38;
LABEL_13:
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    goto LABEL_15;
  }
  uint64_t v16 = 0;
LABEL_15:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  id v17 = (void *)getBMContextualActionEventClass_softClass;
  uint64_t v36 = getBMContextualActionEventClass_softClass;
  if (!getBMContextualActionEventClass_softClass)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __getBMContextualActionEventClass_block_invoke;
    v31 = &unk_1E6079C28;
    v32 = &v33;
    __getBMContextualActionEventClass_block_invoke((uint64_t)&v28);
    id v17 = (void *)v34[3];
  }
  __int16 v18 = v17;
  _Block_object_dispose(&v33, 8);
  id v19 = [v18 alloc];
  __int16 v20 = [v6 identifier];
  id v21 = [v6 displayString];
  uint64_t v22 = (void *)[v19 initWithIdentifier:v20 appName:v10 actionName:v21 contents:v12 parameters:v16];

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  id v23 = (void *)getBMStreamsClass_softClass;
  uint64_t v36 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __getBMStreamsClass_block_invoke;
    v31 = &unk_1E6079C28;
    v32 = &v33;
    __getBMStreamsClass_block_invoke((uint64_t)&v28);
    id v23 = (void *)v34[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v33, 8);
  uint64_t v25 = [v24 contextualActions];
  id v26 = [v25 source];
  [v26 sendEvent:v22];
}

id __69__VCVoiceShortcutClient_ContextualActions__logRunOfContextualAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v10 = 0;
  long double v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v3 = (void *)getBMContextualActionContentClass_softClass;
  uint64_t v13 = getBMContextualActionContentClass_softClass;
  if (!getBMContextualActionContentClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getBMContextualActionContentClass_block_invoke;
    v9[3] = &unk_1E6079C28;
    void v9[4] = &v10;
    __getBMContextualActionContentClass_block_invoke((uint64_t)v9);
    id v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 alloc];
  id v6 = [v2 identifier];
  unint64_t v7 = (void *)[v5 initWithType:v6 metadata:MEMORY[0x1E4F1CC08]];

  return v7;
}

- (id)filteredContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 error:(id *)a6
{
  id v6 = WFLocallyFilterActions(a4, a3);
  return v6;
}

- (void)filterContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 completion:(id)a6
{
  double v8 = (void (**)(id, id, void))a6;
  WFLocallyFilterActions(a4, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9, 0);
}

- (id)contextualActionsForContext:(id)a3 error:(id *)a4
{
  unint64_t v4 = [a3 surface];
  return WFStaticContextualActionDefinitionsForSurface(v4);
}

- (void)getContextualActionsForContext:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  WFStaticContextualActionDefinitionsForSurface([a3 surface]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);
}

- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_ShareSheet.m", 102, @"Invalid parameter not satisfying: %@", @"workflowIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_ShareSheet.m", 103, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[VCVoiceShortcutClient(ShareSheet) generateSingleUseTokenForWorkflowIdentifier:completion:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s Generating a single-use token for workflow identifier %{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__VCVoiceShortcutClient_ShareSheet__generateSingleUseTokenForWorkflowIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v9;
  id v11 = v9;
  uint64_t v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v12 generateSingleUseTokenForWorkflowIdentifier:v7 completion:v11];
}

uint64_t __92__VCVoiceShortcutClient_ShareSheet__generateSingleUseTokenForWorkflowIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleIdentifier:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v15 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v16 = a4;
  id v17 = a5;
  __int16 v18 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolve"
                         "dActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2114;
    v60 = v15;
    _os_log_impl(&dword_1B3C5C000, v18, OS_LOG_TYPE_DEBUG, "%s Loading share sheet shortcuts for %{public}@ with extension matching dictionaries %{public}@", buf, 0x20u);
  }

  __int16 v19 = [(VCVoiceShortcutClient *)self systemSurfaceStatus];
  uint64_t v20 = [v19 statusForSystemSurface:0];

  if (v20 == 2)
  {
    uint64_t v21 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resol"
                           "vedActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
      uint64_t v22 = "%s User has share sheet shortcuts. Proceeding with an XPC query to siriactionsd.";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v20 != 1)
  {
    if (v20)
    {
LABEL_12:
      id v23 = [(VCVoiceShortcutClient *)self xpcQueue];
      id v24 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v23);

      dispatch_time_t v25 = dispatch_time(0, 4000000000);
      dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke;
      handler[3] = &unk_1E6079130;
      id v26 = v24;
      v53 = v26;
      v54 = self;
      dispatch_source_set_event_handler(v26, handler);
      dispatch_resume(v26);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v60 = __Block_byref_object_copy__15836;
      v61 = __Block_byref_object_dispose__15837;
      id v62 = 0;
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__15836;
      v50 = __Block_byref_object_dispose__15837;
      id v51 = 0;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_50;
      v45[3] = &unk_1E6079890;
      v45[4] = buf;
      id v27 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v45];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_2;
      v44[3] = &unk_1E6079158;
      v44[4] = &v46;
      v44[5] = buf;
      [v27 getShareSheetWorkflowsForExtensionMatchingDictionaries:v15 hostBundleIdentifier:v17 completion:v44];
      if (v47[5])
      {
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_53;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = DeviceRGB;
        uint64_t v29 = (void (**)(void))_Block_copy(aBlock);
        id v30 = [WFRemoteImageDrawingContext alloc];
        v31 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:](v30, "initWithImageCount:singleImageSize:scale:colorSpace:", [(id)v47[5] count], DeviceRGB, width, height, a7);
        if (v31)
        {
          v32 = objc_msgSend((id)v47[5], "if_map:", &__block_literal_global_15840);
          [v27 drawGlyphs:v32 withBackgroundColorValues:0 padding:v31 intoContext:&__block_literal_global_59_15841 completion:0.0];
          uint64_t v33 = (void *)v47[5];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_3;
          v41[3] = &unk_1E60791A0;
          v42 = v31;
          [v33 enumerateObjectsUsingBlock:v41];
          v34 = getWFVoiceShortcutClientLogObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v35 = [(id)v47[5] count];
            *(_DWORD *)v55 = 136315394;
            v56 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivi"
                  "tyItems:hostBundleIdentifier:iconSize:iconScale:error:]";
            __int16 v57 = 2050;
            uint64_t v58 = v35;
            _os_log_impl(&dword_1B3C5C000, v34, OS_LOG_TYPE_DEBUG, "%s Loading share sheet shortcuts completed with %{public}lu shortcuts", v55, 0x16u);
          }

          dispatch_source_cancel(v26);
          id v36 = (id)v47[5];
        }
        else
        {
          v39 = getWFVoiceShortcutClientLogObject();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v55 = 136315138;
            v56 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivi"
                  "tyItems:hostBundleIdentifier:iconSize:iconScale:error:]";
            _os_log_impl(&dword_1B3C5C000, v39, OS_LOG_TYPE_ERROR, "%s Could not create remote image drawing context for widget workflow glyphs", v55, 0xCu);
          }

          id v36 = (id)v47[5];
        }

        v29[2](v29);
      }
      else
      {
        objc_super v37 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v55 = 136315394;
          v56 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivity"
                "Items:hostBundleIdentifier:iconSize:iconScale:error:]";
          __int16 v57 = 2114;
          uint64_t v58 = v38;
          _os_log_impl(&dword_1B3C5C000, v37, OS_LOG_TYPE_ERROR, "%s Could not fetch share sheet shortcuts: %{public}@", v55, 0x16u);
        }

        id v36 = 0;
        if (a8) {
          *a8 = *(id *)(*(void *)&buf[8] + 40);
        }
      }

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    uint64_t v21 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resol"
                           "vedActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
      uint64_t v22 = "%s Unable to determine in-client whether or not there are share sheet shortcuts to show. Proceeding with an "
            "XPC query to siriactionsd";
LABEL_10:
      _os_log_impl(&dword_1B3C5C000, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v26 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolve"
                         "dActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
    _os_log_impl(&dword_1B3C5C000, v26, OS_LOG_TYPE_INFO, "%s User has no share sheet shortcuts present, returning early in share sheet shortcuts request", buf, 0xCu);
  }
  id v36 = (id)MEMORY[0x1E4F1CBF0];
LABEL_29:

  return v36;
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivityItems:h"
         "ostBundleIdentifier:iconSize:iconScale:error:]_block_invoke";
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_FAULT, "%s Loading share sheet shortcuts timed out", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [*(id *)(a1 + 40) xpcConnection];
  [v3 invalidate];
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_50(uint64_t a1, void *a2)
{
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_53(uint64_t a1)
{
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = (void *)MEMORY[0x1B3EC58F0]();
  uint64_t v6 = [*(id *)(a1 + 32) imageAtIndex:a3];
  [*(id *)(a1 + 32) scale];
  objc_msgSend(v7, "setIconImage:scale:", v6);
}

uint64_t __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_54(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 glyphCharacter];
  return [v2 numberWithUnsignedShort:v3];
}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_Suggestions.m", 49, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v8 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[VCVoiceShortcutClient(Suggestions) getShortcutSuggestionsForAllAppsWithLimit:completion:]";
    _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEBUG, "%s Getting shortcut suggestions for all apps", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAllAppsWithLimit_completion___block_invoke;
  v12[3] = &unk_1E6079C90;
  id v13 = v7;
  id v9 = v7;
  uint64_t v10 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v12];
  [v10 getShortcutSuggestionsForAllAppsWithLimit:a3 completion:v9];
}

uint64_t __91__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAllAppsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_Suggestions.m", 38, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_Suggestions.m", 39, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[VCVoiceShortcutClient(Suggestions) getShortcutSuggestionsForAppWithBundleIdentifier:completion:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s Getting shortcut suggestions for app with bundleID: %{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAppWithBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v9;
  id v11 = v9;
  uint64_t v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v12 getShortcutSuggestionsForAppWithBundleIdentifier:v7 completion:v11];
}

uint64_t __98__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient_Suggestions.m", 18, @"Invalid parameter not satisfying: %@", @"shortcutSuggestions" object file lineNumber description];
  }
  id v9 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[VCVoiceShortcutClient(Suggestions) setShortcutSuggestions:forAppWithBundleIdentifier:]";
    __int16 v16 = 2112;
    uint64_t v17 = (uint64_t)v7;
    _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEBUG, "%s Setting shortcut suggestions: %@", buf, 0x16u);
  }

  if ((unint64_t)[v7 count] >= 0x65)
  {
    uint64_t v10 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[VCVoiceShortcutClient(Suggestions) setShortcutSuggestions:forAppWithBundleIdentifier:]";
      __int16 v16 = 2050;
      uint64_t v17 = 100;
      _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEFAULT, "%s Limiting to the first %{public}lu suggestions", buf, 0x16u);
    }

    uint64_t v11 = objc_msgSend(v7, "subarrayWithRange:", 0, 100);

    id v7 = (id)v11;
  }
  if (v8)
  {
    uint64_t v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:&__block_literal_global_19645];
    [v12 setShortcutSuggestions:v7 forAppWithBundleIdentifier:v8];
  }
  else
  {
    uint64_t v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[VCVoiceShortcutClient(Suggestions) setShortcutSuggestions:forAppWithBundleIdentifier:]";
      _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_ERROR, "%s Failed to set shortcut suggestions because of invalid bundle identifier", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceShortcutCache, 0);
  objc_storeStrong((id *)&self->_systemSurfaceStatus, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong(&self->_interfaceSetupBlock, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_internalStateQueue, 0);
}

- (WFVoiceShortcutCache)voiceShortcutCache
{
  return self->_voiceShortcutCache;
}

- (WFSystemSurfaceWorkflowStatusRegistry)systemSurfaceStatus
{
  return self->_systemSurfaceStatus;
}

- (OS_dispatch_queue)internalStateQueue
{
  return self->_internalStateQueue;
}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__VCVoiceShortcutClient_dismissToastedSessionKitSessionsWithReason_completion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v9 dismissToastedSessionKitSessionsWithReason:v8 completion:v7];
}

uint64_t __79__VCVoiceShortcutClient_dismissToastedSessionKitSessionsWithReason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__VCVoiceShortcutClient_toastSessionKitSessionWithIdentifier_forDuration_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  [v12 toastSessionKitSessionWithIdentifier:v11 forDuration:v10 completion:v9];
}

uint64_t __85__VCVoiceShortcutClient_toastSessionKitSessionWithIdentifier_forDuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:&__block_literal_global_191_20491];
  id v14 = WFEncodableError(v13);

  [v15 postNotificationAboutFailure:v14 inWorkflow:v12 dialogAttribution:v11 runningContext:v10];
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:&__block_literal_global_189_20493];
  [v10 postNotificationWithRequest:v9 presentationMode:a4 runningContext:v8];
}

- (id)fetchURLForFPItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20495;
  uint64_t v22 = __Block_byref_object_dispose__20496;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__20495;
  __int16 v16 = __Block_byref_object_dispose__20496;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke;
  v11[3] = &unk_1E6079890;
  void v11[4] = &v18;
  id v7 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke_2;
  void v10[3] = &unk_1E6079BB8;
  void v10[4] = &v18;
  void v10[5] = &v12;
  [v7 fetchURLForFPItem:v6 completion:v10];

  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke(uint64_t a1, void *a2)
{
}

void __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  dispatch_time_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__20495;
  uint64_t v28 = __Block_byref_object_dispose__20496;
  id v29 = 0;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20495;
  uint64_t v22 = __Block_byref_object_dispose__20496;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke;
  v17[3] = &unk_1E6079890;
  v17[4] = &v24;
  id v13 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke_2;
  v16[3] = &unk_1E6079BE0;
  void v16[4] = &v18;
  void v16[5] = &v24;
  [v13 createBookmarkWithBookmarkableString:v10 path:v11 workflowID:v12 completion:v16];

  if (a6) {
    *a6 = (id) v25[5];
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)createBookmarkWithURL:(id)a3 workflowID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__20495;
  dispatch_time_t v25 = __Block_byref_object_dispose__20496;
  id v26 = 0;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__20495;
  __int16 v19 = __Block_byref_object_dispose__20496;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke;
  v14[3] = &unk_1E6079890;
  void v14[4] = &v21;
  id v10 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke_2;
  v13[3] = &unk_1E6079BE0;
  void v13[4] = &v15;
  v13[5] = &v21;
  [v10 createBookmarkWithURL:v8 workflowID:v9 completion:v13];

  if (a5) {
    *a5 = (id) v22[5];
  }
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)resolveCrossDeviceItemID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20495;
  uint64_t v22 = __Block_byref_object_dispose__20496;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__20495;
  __int16 v16 = __Block_byref_object_dispose__20496;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke;
  v11[3] = &unk_1E6079890;
  void v11[4] = &v18;
  uint64_t v7 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke_2;
  void v10[3] = &unk_1E6079BB8;
  void v10[4] = &v12;
  void v10[5] = &v18;
  [v7 resolveCrossDeviceItemID:v6 completion:v10];

  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)resolveBookmarkData:(id)a3 updatedData:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__20495;
  id v30 = __Block_byref_object_dispose__20496;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__20495;
  uint64_t v24 = __Block_byref_object_dispose__20496;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__20495;
  uint64_t v18 = __Block_byref_object_dispose__20496;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke;
  v13[3] = &unk_1E6079890;
  void v13[4] = &v26;
  uint64_t v9 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke_2;
  v12[3] = &unk_1E6079B90;
  void v12[4] = &v26;
  void v12[5] = &v14;
  v12[6] = &v20;
  [v9 resolveBookmarkData:v8 completion:v12];

  if (a5) {
    *a5 = (id) v27[5];
  }
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  id v14 = a4;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
}

- (id)resolveFilePath:(id)a3 workflowID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__20495;
  id v25 = __Block_byref_object_dispose__20496;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__20495;
  id v19 = __Block_byref_object_dispose__20496;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke;
  v14[3] = &unk_1E6079890;
  void v14[4] = &v21;
  id v10 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke_2;
  v13[3] = &unk_1E6079B68;
  void v13[4] = &v21;
  void v13[5] = &v15;
  [v10 resolveFilePath:v8 workflowID:v9 completion:v13];

  if (a5) {
    *a5 = (id) v22[5];
  }
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__VCVoiceShortcutClient_showSingleStepCompletionForWebClip_completion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v9 showSingleStepCompletionForWebClip:v8 completion:v7];
}

uint64_t __71__VCVoiceShortcutClient_showSingleStepCompletionForWebClip_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 padding:(double)a6 error:(id *)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__20495;
  id v29 = __Block_byref_object_dispose__20496;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__VCVoiceShortcutClient_drawGlyphs_atSize_withBackgroundColorValues_padding_error___block_invoke;
  v24[3] = &unk_1E6079890;
  v24[4] = &v25;
  uint64_t v15 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v24];
  if (v26[5])
  {
    uint64_t v16 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v26[5];
      *(_DWORD *)buf = 136315394;
      v32 = "-[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:]";
      __int16 v33 = 2114;
      uint64_t v34 = v17;
      _os_log_impl(&dword_1B3C5C000, v16, OS_LOG_TYPE_ERROR, "%s Could not fetch first unsorted shortcut: %{public}@", buf, 0x16u);
    }

    if (a7)
    {
      id v18 = 0;
      *a7 = (id) v26[5];
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (![v13 count])
  {
LABEL_11:
    id v18 = 0;
    goto LABEL_16;
  }
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v20 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:]([WFRemoteImageDrawingContext alloc], "initWithImageCount:singleImageSize:scale:colorSpace:", [v13 count], DeviceRGB, width, height, 0.0);
  CGColorSpaceRelease(DeviceRGB);
  if (v20)
  {
    [v15 drawGlyphs:v13 withBackgroundColorValues:v14 padding:v20 intoContext:&__block_literal_global_182 completion:a6];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; i < [v13 count]; ++i)
      objc_msgSend(v18, "addObject:", -[WFRemoteImageDrawingContext imageAtIndex:](v20, "imageAtIndex:", i));
  }
  else
  {
    uint64_t v22 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:]";
      _os_log_impl(&dword_1B3C5C000, v22, OS_LOG_TYPE_FAULT, "%s Couldn't create image drawing context on the client side. Not drawing glyphs. See logs from WFRemoteImageDrawingContext", buf, 0xCu);
    }

    id v18 = 0;
  }

LABEL_16:
  _Block_object_dispose(&v25, 8);

  return v18;
}

void __83__VCVoiceShortcutClient_drawGlyphs_atSize_withBackgroundColorValues_padding_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 error:(id *)a6
{
  return -[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:](self, "drawGlyphs:atSize:withBackgroundColorValues:padding:error:", a3, a5, a6, a4.width, a4.height, 0.0);
}

void __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    int v4 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]_block_invoke";
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_ERROR, "%s Client connection to VCVoiceShortcut XPC server interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained handleXPCConnectionInterruption];
}

void __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke_178(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    int v4 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]_block_invoke";
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_ERROR, "%s Client connection invalidated to VoiceShortcut server XPC interface", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained handleXPCConnectionInvalidation];
}

- (void)handleXPCConnectionInvalidation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__20495;
  uint64_t v17 = __Block_byref_object_dispose__20496;
  id v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCVoiceShortcutClient_handleXPCConnectionInvalidation__block_invoke;
  block[3] = &unk_1E6079B40;
  void block[4] = self;
  block[5] = &v13;
  dispatch_sync(internalStateQueue, block);
  int v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __56__VCVoiceShortcutClient_handleXPCConnectionInvalidation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setXpcConnection:0];
  uint64_t v2 = [*(id *)(a1 + 32) unsafePopConnectionErrorHandlers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)handleXPCConnectionInterruption
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__20495;
  uint64_t v17 = __Block_byref_object_dispose__20496;
  id v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCVoiceShortcutClient_handleXPCConnectionInterruption__block_invoke;
  block[3] = &unk_1E6079B40;
  void block[4] = self;
  block[5] = &v13;
  dispatch_sync(internalStateQueue, block);
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __56__VCVoiceShortcutClient_handleXPCConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) unsafePopConnectionErrorHandlers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)unsafePopConnectionErrorHandlers
{
  uint64_t v3 = [(VCVoiceShortcutClient *)self errorHandlers];
  uint64_t v4 = [v3 allObjects];

  uint64_t v5 = [(VCVoiceShortcutClient *)self errorHandlers];
  [v5 removeAllObjects];

  return v4;
}

- (void)callErrorHandlerIfNeeded:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__VCVoiceShortcutClient_callErrorHandlerIfNeeded_withError___block_invoke;
  v11[3] = &unk_1E6079B18;
  void v11[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v12 = v10;
  id v14 = &v15;
  dispatch_sync(internalStateQueue, v11);
  if (*((unsigned char *)v16 + 24)) {
    (*((void (**)(id, id))v9 + 2))(v9, v10);
  }

  _Block_object_dispose(&v15, 8);
}

void __60__VCVoiceShortcutClient_callErrorHandlerIfNeeded_withError___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) errorHandlers];
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 48));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) errorHandlers];
    id v6 = _Block_copy(*(const void **)(a1 + 48));
    [v5 removeObject:v6];

    id v7 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = *(void **)(a1 + 32);
      id v9 = [v8 xpcConnection];
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 136315906;
      id v12 = "-[VCVoiceShortcutClient callErrorHandlerIfNeeded:withError:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@ received error from connection %{public}@ during remote call: %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

uint64_t __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorHandlerIfNeeded:*(void *)(a1 + 40) withError:a2];
}

void __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  return [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:a3 synchronous:1];
}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__VCVoiceShortcutClient_setPerWorkflowStateData_forSmartPromptWithActionUUID_reference_completion___block_invoke;
  v16[3] = &unk_1E6079C90;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  __int16 v15 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v16];
  [v15 setPerWorkflowStateData:v14 forSmartPromptWithActionUUID:v13 reference:v12 completion:v11];
}

void __99__VCVoiceShortcutClient_setPerWorkflowStateData_forSmartPromptWithActionUUID_reference_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    long long v6 = "-[VCVoiceShortcutClient setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:completion:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_ERROR, "%s Error occured with remote connection: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getValueForDescriptor:(id)a3 resultClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__20495;
  id v26 = __Block_byref_object_dispose__20496;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__20495;
  uint64_t v20 = __Block_byref_object_dispose__20496;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke;
  v15[3] = &unk_1E6079890;
  void v15[4] = &v22;
  uint64_t v9 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v15];
  id v10 = NSStringFromClass(a4);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke_2;
  v14[3] = &unk_1E6079AA0;
  void v14[4] = &v16;
  void v14[5] = &v22;
  [v9 getValueForDescriptor:v8 resultClassName:v10 completion:v14];

  id v11 = (void *)v23[5];
  if (v11)
  {
    id v12 = 0;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    id v12 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__VCVoiceShortcutClient_getValueForDescriptor_resultClass_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  id v12 = NSStringFromClass(a4);
  [v11 getValueForDescriptor:v10 resultClassName:v12 completion:v9];
}

uint64_t __70__VCVoiceShortcutClient_getValueForDescriptor_resultClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getResultsForQuery:(id)a3 resultClass:(Class)a4 resultState:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__20495;
  uint64_t v35 = __Block_byref_object_dispose__20496;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__20495;
  id v29 = __Block_byref_object_dispose__20496;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__20495;
  uint64_t v23 = __Block_byref_object_dispose__20496;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke;
  v18[3] = &unk_1E6079890;
  void v18[4] = &v31;
  id v11 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v18];
  id v12 = NSStringFromClass(a4);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke_2;
  v17[3] = &unk_1E6079A78;
  v17[4] = &v19;
  void v17[5] = &v25;
  void v17[6] = &v31;
  [v11 getResultsForQuery:v10 resultClassName:v12 completion:v17];

  id v13 = (void *)v32[5];
  if (v13)
  {
    id v14 = 0;
    if (a6) {
      *a6 = v13;
    }
  }
  else
  {
    if (a5)
    {
      __int16 v15 = (void *)v26[5];
      if (v15) {
        *a5 = v15;
      }
    }
    id v14 = (id)v20[5];
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v14;
}

void __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__VCVoiceShortcutClient_getResultsForQuery_resultClass_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  uint64_t v12 = NSStringFromClass(a4);
  [v11 getResultsForQuery:v10 resultClassName:v12 completion:v9];
}

uint64_t __67__VCVoiceShortcutClient_getResultsForQuery_resultClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)firstUnsortedWorkflowWithBackgroundColorValue:(id *)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__20495;
  id v30 = __Block_byref_object_dispose__20496;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__20495;
  id v24 = __Block_byref_object_dispose__20496;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__20495;
  uint64_t v18 = __Block_byref_object_dispose__20496;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke;
  v13[3] = &unk_1E6079890;
  void v13[4] = &v14;
  id v6 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke_2;
  v12[3] = &unk_1E6079A50;
  void v12[4] = &v26;
  void v12[5] = &v20;
  v12[6] = &v14;
  [v6 getFirstUnsortedWorkflowWithCompletion:v12];
  id v7 = (void *)v21[5];
  if (v7) {
    *a3 = v7;
  }
  if (v15[5])
  {
    id v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v15[5];
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "-[VCVoiceShortcutClient firstUnsortedWorkflowWithBackgroundColorValue:error:]";
      __int16 v34 = 2114;
      uint64_t v35 = v9;
      _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_ERROR, "%s Could not fetch first unsorted shortcut: %{public}@", buf, 0x16u);
    }

    id v10 = 0;
    if (a4) {
      *a4 = (id) v15[5];
    }
  }
  else
  {
    id v10 = (id)v27[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke(uint64_t a1, void *a2)
{
}

void __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v13 = a3;
  id v7 = a5;
  uint64_t v8 = [v13 length];
  id v9 = [WFWorkflowQuery alloc];
  if (v8) {
    uint64_t v10 = [(WFWorkflowQuery *)v9 initWithFolderIdentifier:v13];
  }
  else {
    uint64_t v10 = [(WFWorkflowQuery *)v9 initWithLocation:0];
  }
  id v11 = v10;
  [(WFWorkflowQuery *)v10 setResultsLimit:a4];
  uint64_t v12 = objc_opt_class();
  +[VCWidgetWorkflow smallGlyphSize];
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:completionHandler:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:completionHandler:", v11, v12, v7);
}

- (void)getWidgetWorkflowWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v8 = [[WFDatabaseObjectDescriptor alloc] initWithIdentifier:v6 objectType:0];

  uint64_t v7 = objc_opt_class();
  +[VCWidgetWorkflow largeGlyphSize];
  +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:completionHandler:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:completionHandler:", v8, v7, v5);
}

- (id)visibleShortcutsWithError:(id *)a3
{
  uint64_t v4 = [[WFWorkflowQuery alloc] initWithLocation:0];
  id v5 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v5;
}

- (id)shortcutsInCollectionWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  uint64_t v7 = [WFWorkflowQuery alloc];
  if (v6) {
    uint64_t v8 = [(WFWorkflowQuery *)v7 initWithFolderIdentifier:v5];
  }
  else {
    uint64_t v8 = [(WFWorkflowQuery *)v7 initWithLocation:1];
  }
  id v9 = (void *)v8;
  uint64_t v10 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v8, objc_opt_class(), a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v10;
}

- (id)shortcutWithIdentifier:(id)a3 error:(id *)a4
{
  return -[VCVoiceShortcutClient shortcutWithIdentifier:glyphSize:error:](self, "shortcutWithIdentifier:glyphSize:error:", a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (id)shortcutWithIdentifier:(id)a3 glyphSize:(CGSize)a4 error:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = [[WFDatabaseObjectDescriptor alloc] initWithIdentifier:v8 objectType:0];

  uint64_t v10 = +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v9, objc_opt_class(), a5, width, height);

  return v10;
}

- (id)foldersWithError:(id *)a3
{
  uint64_t v4 = objc_opt_new();
  id v5 = +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v5;
}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__VCVoiceShortcutClient_sendAceCommandDictionary_completion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v9 sendAceCommandDictionary:v8 completion:v7];
}

uint64_t __61__VCVoiceShortcutClient_sendAceCommandDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 404, @"Invalid parameter not satisfying: %@", @"workflowRecordData" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 405, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__VCVoiceShortcutClient_importShortcutWithRecordData_name_shortcutSource_completion___block_invoke;
  v20[3] = &unk_1E6079C90;
  id v21 = v15;
  id v16 = v15;
  id v17 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v20];
  [v17 createShortcutWithRecordData:v11 name:v12 shortcutSource:v13 completion:v16];
}

uint64_t __85__VCVoiceShortcutClient_importShortcutWithRecordData_name_shortcutSource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importSharedShortcutFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__VCVoiceShortcutClient_importSharedShortcutFromURL_completion___block_invoke;
  v8[3] = &unk_1E6079A28;
  id v9 = v6;
  id v7 = v6;
  [(VCVoiceShortcutClient *)self importSharedShortcutFromURL:a3 withName:0 shortcutSource:0 completion:v8];
}

uint64_t __64__VCVoiceShortcutClient_importSharedShortcutFromURL_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)importSharedShortcutFromURL:(id)a3 withName:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 351, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  id v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 352, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v16 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1B3C5C000, v16, OS_LOG_TYPE_DEBUG, "%s Importing shared shortcut at URL %@", buf, 0x16u);
  }

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  id v17 = (void *)getWFGallerySessionManagerClass_softClass;
  uint64_t v42 = getWFGallerySessionManagerClass_softClass;
  if (!getWFGallerySessionManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getWFGallerySessionManagerClass_block_invoke;
    v44 = &unk_1E6079C28;
    v45 = &v39;
    __getWFGallerySessionManagerClass_block_invoke((uint64_t)buf);
    id v17 = (void *)v40[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v39, 8);
  id v19 = [v18 performSelector:sel_sharedManager];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  uint64_t v20 = (void *)get_ICURLRequestClass_softClass;
  uint64_t v42 = get_ICURLRequestClass_softClass;
  if (!get_ICURLRequestClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_ICURLRequestClass_block_invoke;
    v44 = &unk_1E6079C28;
    v45 = &v39;
    __get_ICURLRequestClass_block_invoke((uint64_t)buf);
    uint64_t v20 = (void *)v40[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v39, 8);
  uint64_t v22 = [v21 performSelector:sel_requestWithURL_ withObject:v11];
  uint64_t v23 = [v22 performSelector:sel_subAction];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke;
  aBlock[3] = &unk_1E6079A00;
  id v33 = v11;
  id v34 = v19;
  id v35 = v12;
  uint64_t v36 = self;
  id v37 = v13;
  id v38 = v15;
  id v24 = v13;
  id v25 = v12;
  id v26 = v19;
  id v27 = v15;
  id v28 = v11;
  id v29 = _Block_copy(aBlock);
  [v26 performSelector:sel_getWorkflowForIdentifier_completionHandler_ withObject:v23 withObject:v29];
}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_144;
    aBlock[3] = &unk_1E60799B0;
    id v22 = *(id *)(a1 + 40);
    id v7 = (void (**)(void *, id, void *))_Block_copy(aBlock);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_2;
    v15[3] = &unk_1E60799D8;
    id v16 = v5;
    id v20 = *(id *)(a1 + 72);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void **)(a1 + 64);
    id v17 = v8;
    uint64_t v18 = v9;
    id v19 = v10;
    v7[2](v7, v16, v15);

    id v11 = v22;
  }
  else
  {
    id v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v24 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_ERROR, "%s Error downloading CloudKit record from URL %{public}@: %{public}@", buf, 0x20u);
    }

    uint64_t v14 = *(void *)(a1 + 72);
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 8001, @"Error downloading CloudKit record");
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v11);
  }
}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v7 = (void *)getWFSharedShortcutClass_softClass;
  uint64_t v21 = getWFSharedShortcutClass_softClass;
  if (!getWFSharedShortcutClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __getWFSharedShortcutClass_block_invoke;
    id v16 = &unk_1E6079C28;
    id v17 = &v18;
    __getWFSharedShortcutClass_block_invoke((uint64_t)&v13);
    id v7 = (void *)v19[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v18, 8);
  if (objc_opt_isKindOfClass())
  {
    v6[2](v6, [v5 performSelector:sel_workflowRecord], 0);
  }
  else
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v9 = (void *)getWFGalleryWorkflowClass_softClass;
    uint64_t v21 = getWFGalleryWorkflowClass_softClass;
    if (!getWFGalleryWorkflowClass_softClass)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __getWFGalleryWorkflowClass_block_invoke;
      id v16 = &unk_1E6079C28;
      id v17 = &v18;
      __getWFGalleryWorkflowClass_block_invoke((uint64_t)&v13);
      uint64_t v9 = (void *)v19[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v18, 8);
    if (objc_opt_isKindOfClass())
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = _Block_copy(v6);
      [v11 performSelector:sel_loadWorkflowInGalleryWorkflow_completionHandler_ withObject:v5 withObject:v12];
    }
    else
    {
      v6[2](v6, 0, 0);
    }
  }
}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v14 = 0;
    id v5 = objc_msgSend((id)objc_msgSend(v3, "performSelector:", sel_fileRepresentation), sel_fileDataWithError_, &v14);
    id v6 = v14;
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (!v7) {
        uint64_t v7 = [v4 performSelector:sel_name];
      }
      [*(id *)(a1 + 48) importShortcutWithRecordData:v5 name:v7 shortcutSource:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
    }
    else
    {
      id v11 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v16 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke";
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize workflow record %{public}@", buf, 0x16u);
      }

      uint64_t v12 = *(void *)(a1 + 64);
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 8001, @"Failed to serialize workflow record");
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
  else
  {
    id v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v16 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke_2";
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_ERROR, "%s Failed to extract workflow record from downloaded CloudKit record %{public}@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 8001, @"Failed to extract workflow record from downloaded CloudKit record");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
  }
}

- (void)obliterateShortcuts:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__VCVoiceShortcutClient_obliterateShortcuts___block_invoke;
  v7[3] = &unk_1E6079C90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v7];
  [v6 obliterateShortcuts:v5];
}

uint64_t __45__VCVoiceShortcutClient_obliterateShortcuts___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__VCVoiceShortcutClient_getOnScreenContentWithOptions_completionHandler___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v9 getOnScreenContentWithOptions:v8 completionHandler:v7];
}

uint64_t __73__VCVoiceShortcutClient_getOnScreenContentWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__VCVoiceShortcutClient_getOnScreenContentWithOptions_completion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v9 getOnScreenContentWithOptions:v8 completion:v7];
}

uint64_t __66__VCVoiceShortcutClient_getOnScreenContentWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getVaultItemsAccessForBackgroundRunner
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__20495;
  id v11 = __Block_byref_object_dispose__20496;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke;
  v6[3] = &unk_1E6079890;
  v6[4] = &v7;
  uint64_t v2 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke_2;
  v5[3] = &unk_1E6079988;
  v5[4] = &v7;
  [v2 getVaultItemsAccessForBackgroundRunner:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

uint64_t __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 304, @"Invalid parameter not satisfying: %@", @"triggerIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 305, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[VCVoiceShortcutClient deleteTriggerWithIdentifier:completion:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Deleting trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__VCVoiceShortcutClient_deleteTriggerWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v9;
  id v11 = v9;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v12 deleteTriggerWithIdentifier:v7 completion:v11];
}

uint64_t __64__VCVoiceShortcutClient_deleteTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 295, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 296, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[VCVoiceShortcutClient checkTriggerStateWithKeyPath:completion:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Checking state for keyPath: %@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__VCVoiceShortcutClient_checkTriggerStateWithKeyPath_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v9;
  id v11 = v9;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v12 checkTriggerStateWithKeyPath:v7 completion:v11];
}

uint64_t __65__VCVoiceShortcutClient_checkTriggerStateWithKeyPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 286, @"Invalid parameter not satisfying: %@", @"triggerIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 287, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[VCVoiceShortcutClient checkTriggerStateWithIdentifier:completion:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Checking state for trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__VCVoiceShortcutClient_checkTriggerStateWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v9;
  id v11 = v9;
  id v12 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v12 checkTriggerStateWithIdentifier:v7 completion:v11];
}

uint64_t __68__VCVoiceShortcutClient_checkTriggerStateWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 277, @"Invalid parameter not satisfying: %@", @"triggerIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 278, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v12 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[VCVoiceShortcutClient fireTriggerWithIdentifier:force:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_DEBUG, "%s [Triggers] Running trigger (id: %@)", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__VCVoiceShortcutClient_fireTriggerWithIdentifier_force_completion___block_invoke;
  v17[3] = &unk_1E6079C90;
  id v18 = v11;
  id v13 = v11;
  id v14 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v17];
  [v14 fireTriggerWithIdentifier:v9 force:v6 completion:v13];
}

uint64_t __68__VCVoiceShortcutClient_fireTriggerWithIdentifier_force_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 269, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  BOOL v6 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[VCVoiceShortcutClient getConfiguredTriggerDescriptionsWithCompletion:]";
    _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_DEBUG, "%s [Triggers] Getting trigger IDs", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__VCVoiceShortcutClient_getConfiguredTriggerDescriptionsWithCompletion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v11 = v5;
  id v7 = v5;
  id v8 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  [v8 getConfiguredTriggerDescriptionsWithCompletion:v7];
}

uint64_t __72__VCVoiceShortcutClient_getConfiguredTriggerDescriptionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 261, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v11 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[VCVoiceShortcutClient unregisterTriggerWithIdentifier:triggerBacking:completion:]";
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEBUG, "%s [Triggers] Unregistering trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__VCVoiceShortcutClient_unregisterTriggerWithIdentifier_triggerBacking_completion___block_invoke;
  v15[3] = &unk_1E6079C90;
  id v16 = v10;
  id v12 = v10;
  id v13 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v15];
  [v13 unregisterTriggerWithIdentifier:v9 triggerBacking:a4 completion:v12];
}

uint64_t __83__VCVoiceShortcutClient_unregisterTriggerWithIdentifier_triggerBacking_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 253, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[VCVoiceShortcutClient refreshTriggerWithIdentifier:completion:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEBUG, "%s [Triggers] Refreshing trigger (id: %@)", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__VCVoiceShortcutClient_refreshTriggerWithIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6079C90;
  id v14 = v8;
  id v10 = v8;
  id v11 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v13];
  [v11 refreshTriggerWithIdentifier:v7 completion:v10];
}

uint64_t __65__VCVoiceShortcutClient_refreshTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke;
  void v10[3] = &unk_1E6079C90;
  id v5 = v4;
  id v11 = v5;
  BOOL v6 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke_118;
  v8[3] = &unk_1E6079960;
  id v9 = v5;
  id v7 = v5;
  [v6 getSiriPodcastsDatabaseURLWithCompletion:v8];
}

void __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    BOOL v6 = "-[VCVoiceShortcutClient getSiriPodcastsDatabaseURLWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_DEBUG, "%s Error getting async proxy %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [v5 url];
  char v8 = [v7 startAccessingSecurityScopedResource];

  if (v5 && (v8 & 1) != 0)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v10 = [v5 url];
    id v15 = v6;
    id v11 = (void *)[v9 initWithContentsOfURL:v10 error:&v15];
    id v12 = v15;

    id v13 = [v5 url];
    [v13 stopAccessingSecurityScopedResource];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v12;
  }
  else
  {
    id v14 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[VCVoiceShortcutClient getSiriPodcastsDatabaseURLWithCompletion:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_DEBUG, "%s Error getting sirir db %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 222, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 221, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 223, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  id v14 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[VCVoiceShortcutClient setInteger:forKey:inDomain:completionHandler:]";
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_DEBUG, "%s Setting preference object for key=%@ in doamin=%@", buf, 0x20u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__VCVoiceShortcutClient_setInteger_forKey_inDomain_completionHandler___block_invoke;
  v20[3] = &unk_1E6079C90;
  id v21 = v13;
  id v15 = v13;
  id v16 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v20];
  [v16 setInteger:a3 forKey:v11 inDomain:v12 completionHandler:v15];
}

uint64_t __70__VCVoiceShortcutClient_setInteger_forKey_inDomain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsubscribeFromVoiceShortcutDataUpdateNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.siri.VoiceShortcuts.DataDidUpdateNotification", 0);
  id v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[VCVoiceShortcutClient unsubscribeFromVoiceShortcutDataUpdateNotifications]";
    __int16 v7 = 2112;
    char v8 = @"com.apple.siri.VoiceShortcuts.DataDidUpdateNotification";
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_DEBUG, "%s Unsubscribed from notification: (%@)", (uint8_t *)&v5, 0x16u);
  }
}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  id v14 = a6;
  id v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 176, @"Invalid parameter not satisfying: %@", @"voiceShortcutIdentifier" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 177, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  if (!(v12 | v13))
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"VCVoiceShortcutClient.m" lineNumber:178 description:@"Pass at least one parameter to update"];
  }
  id v16 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[VCVoiceShortcutClient updateVoiceShortcutWithIdentifier:phrase:shortcut:completion:]";
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1B3C5C000, v16, OS_LOG_TYPE_DEBUG, "%s Updating VoiceShortcut with id=%@", buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__VCVoiceShortcutClient_updateVoiceShortcutWithIdentifier_phrase_shortcut_completion___block_invoke;
  v22[3] = &unk_1E6079C90;
  id v23 = v15;
  id v17 = v15;
  __int16 v18 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v22];
  [v18 updateVoiceShortcutWithIdentifier:v11 phrase:v12 shortcut:v13 completion:v17];
}

uint64_t __86__VCVoiceShortcutClient_updateVoiceShortcutWithIdentifier_phrase_shortcut_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 151, @"Invalid parameter not satisfying: %@", @"phrase" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 150, @"Invalid parameter not satisfying: %@", @"shortcut" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 152, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  unint64_t v12 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    __int16 v26 = "-[VCVoiceShortcutClient createVoiceShortcut:phrase:completion:]";
    __int16 v27 = 2113;
    id v28 = v10;
    _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_DEBUG, "%s Creating VoiceShortcut for %{private}@", buf, 0x16u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke;
  v23[3] = &unk_1E6079908;
  id v24 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_100;
  v19[3] = &unk_1E6079930;
  void v19[4] = self;
  id v20 = v24;
  id v21 = v10;
  id v22 = v11;
  id v13 = v10;
  id v14 = v24;
  id v15 = v11;
  [v14 _injectProxiesForImages:v23 completion:v19];
}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [*(id *)(a1 + 32) _keyImage];
  char v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2;
    v9[3] = &unk_1E60798E0;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    [v10 _retrieveImageDataWithReply:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2_101;
  v4[3] = &unk_1E6079C90;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 asynchronousRemoteDataStoreWithErrorHandler:v4];
  [v3 addVoiceShortcut:*(void *)(a1 + 40) phrase:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v10 = 136315906;
      id v11 = "-[VCVoiceShortcutClient createVoiceShortcut:phrase:completion:]_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_ERROR, "%s Failed to retrieve key image data from proxy %@ for shortcut %@ due to error: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)requestDataMigration:(id *)a3
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__20495;
  uint64_t v13 = __Block_byref_object_dispose__20496;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__VCVoiceShortcutClient_requestDataMigration___block_invoke;
  v8[3] = &unk_1E6079890;
  void v8[4] = &v9;
  id v4 = [(VCVoiceShortcutClient *)self synchronousRemoteDataStoreWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VCVoiceShortcutClient_requestDataMigration___block_invoke_2;
  v7[3] = &unk_1E60798B8;
  void v7[4] = &v15;
  v7[5] = &v9;
  [v4 requestDataMigration:v7];

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v5 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v5;
}

void __46__VCVoiceShortcutClient_requestDataMigration___block_invoke(uint64_t a1, void *a2)
{
}

void __46__VCVoiceShortcutClient_requestDataMigration___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)dealloc
{
  [(VCVoiceShortcutClient *)self unsubscribeFromVoiceShortcutDataUpdateNotifications];
  v3.receiver = self;
  v3.super_class = (Class)VCVoiceShortcutClient;
  [(VCVoiceShortcutClient *)&v3 dealloc];
}

- (VCVoiceShortcutClient)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"VCVoiceShortcutClient.m", 123, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__VCVoiceShortcutClient_initWithListenerEndpoint___block_invoke;
  void v10[3] = &unk_1E6079868;
  id v11 = v5;
  id v6 = v5;
  __int16 v7 = [(VCVoiceShortcutClient *)self initWithXPCConnectionCreationBlock:v10 XPCInterfaceSetupBlock:0];

  return v7;
}

id __50__VCVoiceShortcutClient_initWithListenerEndpoint___block_invoke(uint64_t a1)
{
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:*(void *)(a1 + 32)];
  return v1;
}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__VCVoiceShortcutClient_Spotlight__triggerFullContextualActionReindexWithCompletion___block_invoke;
  v7[3] = &unk_1E6079C90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(VCVoiceShortcutClient *)self asynchronousRemoteDataStoreWithErrorHandler:v7];
  [v6 triggerFullContextualActionReindexWithCompletion:v5];
}

uint64_t __85__VCVoiceShortcutClient_Spotlight__triggerFullContextualActionReindexWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

@end