@interface WBSSafariBookmarksSyncAgentProxy
+ (id)sharedProxy;
- (NSXPCConnection)_safariBookmarksSyncAgentConnection;
- (WBSSafariBookmarksSyncAgentProxy)init;
- (void)beginMigrationFromDAV;
- (void)clearLocalDataIncludingMigrationState:(BOOL)a3 completionHandler:(id)a4;
- (void)collectDiagnosticsDataWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteBackgroundImageDirectory;
- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3;
- (void)deleteCloudExtensionDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4;
- (void)deleteCloudExtensionStatesDatabaseWithCompletionHandler:(id)a3;
- (void)deleteCloudTabCloseRequestsWithUUIDStrings:(id)a3 completionHandler:(id)a4;
- (void)deleteDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4;
- (void)deletePerSiteSettingsSyncData;
- (void)dumpCloudKitDataPrintByDates:(BOOL)a3 liveOnly:(BOOL)a4 printTree:(BOOL)a5 printPlist:(BOOL)a6 writeToFile:(BOOL)a7 atFileURL:(id)a8 completionHandler:(id)a9;
- (void)fetchCloudSettingsChangesImmediately;
- (void)fetchCloudTabDevicesAndCloseRequests;
- (void)fetchProfileEntitiesWithCompletion:(id)a3;
- (void)fetchRemoteMigrationStateWithCompletionHandler:(id)a3;
- (void)fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:(id)a3;
- (void)fetchTabGroupEntitiesWithCompletion:(id)a3;
- (void)generateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3;
- (void)getCloudExtensionStatesWithCompletionHandler:(id)a3;
- (void)getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3;
- (void)getCloudTabContainerManateeStateWithCompletionHandler:(id)a3;
- (void)getCloudTabDevicesWithCompletionHandler:(id)a3;
- (void)migrateToCloudKitWithCompletionHandler:(id)a3;
- (void)observeRemoteMigrationStateForSecondaryMigration;
- (void)registerForPushNotificationsIfNeeded;
- (void)resetToDAVDatabaseWithCompletionHandler:(id)a3;
- (void)saveCloudPerSiteSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4;
- (void)saveCloudSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4;
- (void)saveCloudTabCloseRequestWithDictionaryRepresentation:(id)a3 closeRequestUUIDString:(id)a4 completionHandler:(id)a5;
- (void)saveExtensionDeviceWithDictionaryRepresentation:(id)a3 completionHandler:(id)a4;
- (void)saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5;
- (void)saveTabsForCurrentDeviceWithDictionaryRepresentation:(id)a3 deviceUUIDString:(id)a4 completionHandler:(id)a5;
- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5;
- (void)setUsesOpportunisticPushTopic:(BOOL)a3;
- (void)set_safariBookmarksSyncAgentConnection:(id)a3;
- (void)syncDownSafariPerSiteSettingsSyncWithCompletion:(id)a3;
- (void)syncDownSafariSettingsSyncWithCompletion:(id)a3;
- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4;
- (void)syncUpSafariPerSiteSettingsSyncWithCompletion:(id)a3;
- (void)syncUpSafariSettingsSyncWithCompletion:(id)a3;
- (void)triggerImmediateBackgroundImageSaveIfApplicable;
- (void)triggerSafariTabGroupSync;
- (void)userAccountDidChange:(int64_t)a3;
- (void)userDidUpdateBookmarkDatabase;
@end

@implementation WBSSafariBookmarksSyncAgentProxy

- (void)getCloudTabDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v5 = [v6 remoteObjectProxy];
  [v5 getCloudTabDevicesWithCompletionHandler:v4];
}

- (void)fetchCloudSettingsChangesImmediately
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 fetchCloudSettingsChangesImmediately];
}

- (void)fetchRemoteMigrationStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v5 = [v6 remoteObjectProxy];
  [v5 fetchRemoteMigrationStateWithCompletionHandler:v4];
}

- (void)observeRemoteMigrationStateForSecondaryMigration
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 observeRemoteMigrationStateForSecondaryMigration];
}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v5 = [v6 remoteObjectProxy];
  [v5 fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:v4];
}

- (void)setUsesOpportunisticPushTopic:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v4 = [v5 remoteObjectProxy];
  [v4 setUsesOpportunisticPushTopic:v3];
}

- (NSXPCConnection)_safariBookmarksSyncAgentConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedProxy
{
  if (sharedProxy_onceToken != -1) {
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)sharedProxy_sharedProxy;
  return v2;
}

void __47__WBSSafariBookmarksSyncAgentProxy_sharedProxy__block_invoke()
{
  v0 = objc_alloc_init(WBSSafariBookmarksSyncAgentProxy);
  v1 = (void *)sharedProxy_sharedProxy;
  sharedProxy_sharedProxy = (uint64_t)v0;
}

- (WBSSafariBookmarksSyncAgentProxy)init
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)WBSSafariBookmarksSyncAgentProxy;
  v2 = [(WBSSafariBookmarksSyncAgentProxy *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SafariBookmarksSyncAgent" options:0];
    safariBookmarksSyncAgentConnection = v2->_safariBookmarksSyncAgentConnection;
    v2->_safariBookmarksSyncAgentConnection = (NSXPCConnection *)v3;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1097E58];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v8 = [v6 setWithArray:v7];

    [v5 setClasses:v8 forSelector:sel_fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [v5 setClasses:v8 forSelector:sel_fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [v5 setClasses:v8 forSelector:sel_getCloudTabDevicesWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_safariBookmarksSyncAgentConnection setRemoteObjectInterface:v5];
    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__WBSSafariBookmarksSyncAgentProxy_init__block_invoke;
    v11[3] = &unk_1E615A5D8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v2->_safariBookmarksSyncAgentConnection setInvalidationHandler:v11];
    [(NSXPCConnection *)v2->_safariBookmarksSyncAgentConnection resume];
    v9 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__WBSSafariBookmarksSyncAgentProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "set_safariBookmarksSyncAgentConnection:", 0);
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"WBSSafariBookmarksSyncAgentProxyConnectionWasInvalidatedNotification" object:v3 userInfo:0];

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)WBSSafariBookmarksSyncAgentProxy;
  [(WBSSafariBookmarksSyncAgentProxy *)&v4 dealloc];
}

- (void)registerForPushNotificationsIfNeeded
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 registerForPushNotificationsIfNeeded];
}

- (void)userAccountDidChange:(int64_t)a3
{
  id v5 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  objc_super v4 = [v5 remoteObjectProxy];
  [v4 userAccountDidChange:a3];
}

- (void)getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 getCloudSettingsContainerManateeStateWithCompletionHandler:v4];
}

- (void)userDidUpdateBookmarkDatabase
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 userDidUpdateBookmarkDatabase];
}

- (void)beginMigrationFromDAV
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 beginMigrationFromDAV];
}

- (void)collectDiagnosticsDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 collectDiagnosticsDataWithCompletionHandler:v4];
}

- (void)saveTabsForCurrentDeviceWithDictionaryRepresentation:(id)a3 deviceUUIDString:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__WBSSafariBookmarksSyncAgentProxy_saveTabsForCurrentDeviceWithDictionaryRepresentation_deviceUUIDString_completionHandler___block_invoke;
  v14[3] = &unk_1E615BAF0;
  id v15 = v8;
  id v13 = v8;
  [v12 saveTabsForCurrentDeviceWithDictionaryRepresentation:v10 deviceUUIDString:v9 completionHandler:v14];
}

uint64_t __124__WBSSafariBookmarksSyncAgentProxy_saveTabsForCurrentDeviceWithDictionaryRepresentation_deviceUUIDString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)saveCloudTabCloseRequestWithDictionaryRepresentation:(id)a3 closeRequestUUIDString:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v11 = [v12 remoteObjectProxy];
  [v11 saveCloudTabCloseRequestWithDictionaryRepresentation:v10 closeRequestUUIDString:v9 completionHandler:v8];
}

- (void)deleteDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 deleteDevicesWithUUIDStrings:v7 completionHandler:v6];
}

- (void)deleteCloudTabCloseRequestsWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 deleteCloudTabCloseRequestsWithUUIDStrings:v7 completionHandler:v6];
}

- (void)triggerSafariTabGroupSync
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 triggerSafariTabGroupSync];
}

- (void)getCloudTabContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 getCloudTabContainerManateeStateWithCompletionHandler:v4];
}

- (void)fetchCloudTabDevicesAndCloseRequests
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 fetchCloudTabDevicesAndCloseRequests];
}

- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 syncScribbleFeedbackUp:v7 withCompletion:v6];
}

- (void)saveCloudSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 saveCloudSettingWithDictionaryRepresentation:v7 successCompletionHandler:v6];
}

- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 deleteBackgroundImageFromCloudKitWithCompletionHandler:v4];
}

- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v10 = [v11 remoteObjectProxy];
  [v10 scheduleCloudBackgroundImageSaveWithURL:v9 isLightAppearance:v5 successCompletionHandler:v8];
}

- (void)triggerImmediateBackgroundImageSaveIfApplicable
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 triggerImmediateBackgroundImageSaveIfApplicable];
}

- (void)syncDownSafariSettingsSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 syncDownSafariSettingsSyncWithCompletion:v4];
}

- (void)syncUpSafariSettingsSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 syncUpSafariSettingsSyncWithCompletion:v4];
}

- (void)deleteBackgroundImageDirectory
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 deleteBackgroundImageDirectory];
}

- (void)fetchProfileEntitiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 fetchProfileEntitiesWithCompletion:v4];
}

- (void)fetchTabGroupEntitiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 fetchTabGroupEntitiesWithCompletion:v4];
}

- (void)syncDownSafariPerSiteSettingsSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 syncDownSafariPerSiteSettingsSyncWithCompletion:v4];
}

- (void)syncUpSafariPerSiteSettingsSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 syncUpSafariPerSiteSettingsSyncWithCompletion:v4];
}

- (void)saveCloudPerSiteSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 saveCloudPerSiteSettingWithDictionaryRepresentation:v7 successCompletionHandler:v6];
}

- (void)deletePerSiteSettingsSyncData
{
  id v3 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 deletePerSiteSettingsSyncData];
}

- (void)saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v11 = [v12 remoteObjectProxy];
  [v11 saveExtensionStatesWithDictionaryRepresentation:v10 forDevice:v9 completionHandler:v8];
}

- (void)saveExtensionDeviceWithDictionaryRepresentation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 saveExtensionDeviceWithDictionaryRepresentation:v7 completionHandler:v6];
}

- (void)getCloudExtensionStatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 getCloudExtensionStatesWithCompletionHandler:v4];
}

- (void)deleteCloudExtensionDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 deleteCloudExtensionDevicesWithUUIDStrings:v7 completionHandler:v6];
}

- (void)deleteCloudExtensionStatesDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 deleteCloudExtensionStatesDatabaseWithCompletionHandler:v4];
}

- (void)dumpCloudKitDataPrintByDates:(BOOL)a3 liveOnly:(BOOL)a4 printTree:(BOOL)a5 printPlist:(BOOL)a6 writeToFile:(BOOL)a7 atFileURL:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v15 = a9;
  id v16 = a8;
  id v18 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  v17 = [v18 remoteObjectProxy];
  [v17 dumpCloudKitDataPrintByDates:v12 liveOnly:v13 printTree:v12 printPlist:v11 writeToFile:v10 atFileURL:v16 completionHandler:v15];
}

- (void)resetToDAVDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 resetToDAVDatabaseWithCompletionHandler:v4];
}

- (void)clearLocalDataIncludingMigrationState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  id v7 = [v8 remoteObjectProxy];
  [v7 clearLocalDataIncludingMigrationState:v4 completionHandler:v6];
}

- (void)generateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 generateDAVServerIDsForExistingBookmarksWithCompletionHandler:v4];
}

- (void)migrateToCloudKitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(WBSSafariBookmarksSyncAgentProxy *)self _safariBookmarksSyncAgentConnection];
  BOOL v5 = [v6 remoteObjectProxy];
  [v5 migrateToCloudKitWithCompletionHandler:v4];
}

- (void)set_safariBookmarksSyncAgentConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end