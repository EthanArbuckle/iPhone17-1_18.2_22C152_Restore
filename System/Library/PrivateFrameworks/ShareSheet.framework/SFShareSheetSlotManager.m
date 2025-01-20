@interface SFShareSheetSlotManager
- (BOOL)shouldEscapeXpcTryCatch;
- (NSXPCConnection)connection;
- (SFShareSheetSlotManager)init;
- (SFShareSheetSlotManagerDelegate)delegate;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxy;
- (void)activate;
- (void)activityViewControllerDidAppearWithSessionID:(id)a3;
- (void)activityViewControllerDidDisappearWithSessionID:(id)a3;
- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3;
- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3;
- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7;
- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3;
- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6;
- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5;
- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5;
- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4;
- (void)connectUIServiceToDaemonWithSessionID:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionEstablished;
- (void)connectionInterrupted;
- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4;
- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3;
- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6;
- (void)didUpdateAirDropTransferWithChange:(id)a3;
- (void)ensureConnectionEstablished;
- (void)ensureXPCStarted;
- (void)invalidate;
- (void)invalidated;
- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4;
- (void)performActivityInHostWithUUID:(id)a3;
- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3;
- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4;
- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4;
- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6;
- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5;
- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4;
- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4;
- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4;
- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4;
- (void)sendConfiguration:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4;
- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SFShareSheetSlotManager

- (SFShareSheetSlotManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFShareSheetSlotManager;
  return [(SFShareSheetSlotManager *)&v3 init];
}

- (void)ensureXPCStarted
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_DEBUG, "connection created", v1, 2u);
}

void __43__SFShareSheetSlotManager_ensureXPCStarted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interrupted];
}

void __43__SFShareSheetSlotManager_ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidated];
}

- (void)ensureConnectionEstablished
{
  objc_super v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Establishing connection", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v4 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SFShareSheetSlotManager_ensureConnectionEstablished__block_invoke;
  v5[3] = &unk_1E5A21998;
  objc_copyWeak(&v6, (id *)buf);
  [v4 establishConnectionWithCompletionHandler:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak((id *)buf);
}

void __54__SFShareSheetSlotManager_ensureConnectionEstablished__block_invoke(uint64_t a1)
{
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionEstablished];
}

- (void)invalidated
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A0AD8000, v0, v1, "XPC connection unexpectedly invalidated", v2, v3, v4, v5, v6);
}

- (void)connectionEstablished
{
  uint64_t v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v3, 2u);
  }
}

- (void)connectionInterrupted
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A0AD8000, v0, v1, "connection interrupted", v2, v3, v4, v5, v6);
}

- (id)synchronousRemoteObjectProxy
{
  return [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22];
}

void __55__SFShareSheetSlotManager_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get synchronous remote object proxy with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)remoteObjectProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_121];
}

void __44__SFShareSheetSlotManager_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get asynchronous remote object proxy with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)activate
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A0AD8000, v0, v1, "Activate already called", v2, v3, v4, v5, v6);
}

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    connection = self->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection invalidate];
      uint64_t v4 = self->_connection;
      self->_connection = 0;
    }
    else
    {
      [(SFShareSheetSlotManager *)self invalidated];
    }
  }
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
}

- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/connectToDaemonWithSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 connectToDaemonWithContext:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)connectUIServiceToDaemonWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/connectUIServiceToDaemonWithSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v6 connectUIServiceToDaemonWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)sendConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/sendConfiguration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 sendConfiguration:v6 completion:v7];

  os_activity_scope_leave(&v10);
}

- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/requestConfigurationWithSessionID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 requestConfigurationWithSessionID:v6 completion:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedActivityWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 selectedActivityWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedActionWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 selectedActionWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedPersonWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 selectedPersonWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerRemovedPersonWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 removedPersonWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerProvideFeedbackForPeopleSuggestionWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 provideFeedbackForPeopleSuggestionWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidLongPressShareActivityWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 didLongPressShareActivityWithIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  os_activity_scope_state_s v10 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerToggledActivityWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  v11 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v11 activityViewControllerWithSessionID:v8 toggledActivityWithIdentifier:v9 activityCategory:a5];

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  os_activity_scope_state_s v12 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerFavoritedActivityWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v12, &v14);
  v13 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v13 activityViewControllerWithSessionID:v10 favoritedActivity:v8 withIdentifier:v11 activityCategory:a6];

  os_activity_scope_leave(&v14);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedDefaultActivityWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  id v11 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v11 activityViewControllerWithSessionID:v8 selectedDefaultActivityWithIdentifier:v9 activityCategory:a5];

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerUpdatedFavoritesProxies", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  id v11 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v11 activityViewControllerWithSessionID:v8 updatedFavoritesProxies:v9 activityCategory:a5];

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  os_activity_scope_state_s v14 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerPerformedActivityWithSessionIDPresentationMsTotalShareTimeMsActivityTypeSuccess", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v14, &v16);
  v15 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v15 activityViewControllerPerformedActivityWithSessionID:v12 presentationMs:a4 totalShareTimeMs:a5 activityType:v13 success:v7];

  os_activity_scope_leave(&v16);
}

- (void)activityViewControllerDidAppearWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidAppear", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v6 activityViewControllerDidAppearWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerDidDisappearWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidDisappear", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v6 activityViewControllerDidDisappearWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidEnterBackground", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v6 activityViewControllerDidEnterBackgroundWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerWillEnterForeground", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v6 activityViewControllerWillEnterForegroundWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerPerformEditActions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  id v6 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v6 activityViewControllerPerformEditActionsWithSessionID:v4];

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerWithSessionIDPerformActivityWithType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  id v12 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v12 activityViewControllerWithSessionID:v8 performActivityWithType:v9 completionHandler:v10];

  os_activity_scope_leave(&v13);
}

- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/activityViewControllerWithSessionIDFindSupportedActivities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v9 activityViewControllerWithSessionID:v6 findSupportedActivitiesWithCompletionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SFShareSheetSlotManager *)self delegate];
  [v5 dataSourceUpdatedWithSessionConfiguration:v4];
}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SFShareSheetSlotManager *)self delegate];
  [v13 performUserDefaultsWithFavoritesProxies:v12 suggestionProxies:v11 orderedUUIDs:v10 activityCategory:a6];
}

- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFShareSheetSlotManager *)self delegate];
  [v8 performExtensionActivityInHostWithBundleID:v7 request:v6];
}

- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFShareSheetSlotManager *)self delegate];
  [v8 performShortcutActivityInHostWithBundleID:v7 singleUseToken:v6];
}

- (void)performActivityInHostWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(SFShareSheetSlotManager *)self delegate];
  [v5 performActivityInHostWithUUID:v4];
}

- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SFShareSheetSlotManager *)self delegate];
  [v4 performAirDropActivityInHostWithNoContentView:v3];
}

- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFShareSheetSlotManager *)self delegate];
  [v8 willPerformInServiceActivityWithRequest:v7 completion:v6];
}

- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(SFShareSheetSlotManager *)self delegate];
  [v13 didPerformInServiceActivityWithIdentifier:v12 completed:v7 items:v11 error:v10];
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4 = a3;
  id v5 = [(SFShareSheetSlotManager *)self delegate];
  [v5 didUpdateAirDropTransferWithChange:v4];
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/createSharingURLForCollaborationRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v9 createSharingURLForCollaborationRequest:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/requestDefaultShareModeCollaborationForURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 requestDefaultShareModeCollaborationForURL:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/requestSharedURLForFileOrFolderURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v9 requestSharedURLForFileOrFolderURL:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/requestCollaborativeModeForContentIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 requestCollaborativeModeForContentIdentifier:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/requestAddParticipantsAllowedForURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  id v12 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v12 requestAddParticipantsAllowedForURL:v8 share:v9 completionHandler:v10];

  os_activity_scope_leave(&v13);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/saveCollaborativeMode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self synchronousRemoteObjectProxy];
  [v9 saveCollaborativeMode:v6 forContentIdentifier:v7];

  os_activity_scope_leave(&v10);
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/removeSharingURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  id v12 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v12 deleteSharingURL:v8 containerSetupInfo:v9 completionHandler:v10];

  os_activity_scope_leave(&v13);
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/isShareOwnerOrAdminForFileURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v9 isShareOwnerOrAdminForFileURL:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A0AD8000, "Sharing/SFShareSheetSlotManager/shareStatusForFileURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = [(SFShareSheetSlotManager *)self remoteObjectProxy];
  [v9 shareStatusForFileURL:v6 completionHandler:v7];

  os_activity_scope_leave(&v10);
}

- (id)machServiceName
{
  return @"com.apple.sharing.sharesheet";
}

- (id)exportedInterface
{
  v47 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF370C58];
  v50 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v48, v45, v43, v41, v39, v37, v36, v35, v2, v3, v4, v5, v6, v7, v8, v9, v10,
    objc_opt_class(),
  id v11 = 0);
  [v47 setClasses:v11 forSelector:sel_willPerformInServiceActivityWithRequest_completion_ argumentIndex:0 ofReply:1];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v49, v46, v44, v42, v40, v38, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(),
  v22 = 0);
  [v47 setClasses:v22 forSelector:sel_didPerformInServiceActivityWithIdentifier_completed_items_error_ argumentIndex:1 ofReply:0];

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  [v47 setClasses:v26 forSelector:sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_ argumentIndex:0 ofReply:0];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  [v47 setClasses:v30 forSelector:sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_ argumentIndex:1 ofReply:0];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  [v47 setClasses:v33 forSelector:sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_ argumentIndex:2 ofReply:0];

  [v47 setClass:objc_opt_class() forSelector:sel_didUpdateAirDropTransferWithChange_ argumentIndex:0 ofReply:0];
  [v47 setClass:objc_opt_class() forSelector:sel_dataSourceUpdatedWithSessionConfiguration_ argumentIndex:0 ofReply:0];
  return v47;
}

- (id)remoteObjectInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3A51F8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_connectToDaemonWithContext_completionHandler_ argumentIndex:0 ofReply:0];

  [v2 setClass:objc_opt_class() forSelector:sel_connectUIServiceToDaemonWithSessionID_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_sendConfiguration_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_requestConfigurationWithSessionID_completion_ argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_selectedPersonWithIdentifier_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_selectedPersonWithIdentifier_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_removedPersonWithIdentifier_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_removedPersonWithIdentifier_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_didLongPressShareActivityWithIdentifier_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_didLongPressShareActivityWithIdentifier_ argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_provideFeedbackForPeopleSuggestionWithIdentifier_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_activityViewControllerWithSessionID_provideFeedbackForPeopleSuggestionWithIdentifier_ argumentIndex:1 ofReply:0];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_activityViewControllerWithSessionID_updatedFavoritesProxies_activityCategory_ argumentIndex:1 ofReply:0];

  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:sel_activityViewControllerWithSessionID_findSupportedActivitiesWithCompletionHandler_ argumentIndex:0 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_createSharingURLForCollaborationRequest_completionHandler_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_createSharingURLForCollaborationRequest_completionHandler_ argumentIndex:0 ofReply:1];
  [v2 setClass:getCKContainerSetupInfoClass() forSelector:sel_deleteSharingURL_containerSetupInfo_completionHandler_ argumentIndex:1 ofReply:0];
  [v2 setClass:getCKShareClass() forSelector:sel_requestAddParticipantsAllowedForURL_share_completionHandler_ argumentIndex:1 ofReply:0];
  return v2;
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFShareSheetSlotManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFShareSheetSlotManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end