@interface ICQPreferencesRemoteUIDelegate
+ (id)afuiSettingsSpecifier;
+ (id)healthSettingsSpecifier;
+ (id)messagesSettingsSpecifier;
+ (void)_loadCKStoragePluginSettingsBundleIfNeeded;
- (BOOL)_loadNativeURL:(id)a3;
- (BOOL)isManageStorage;
- (BOOL)isNativeManageStorage;
- (BOOL)objectModel:(id)a3 page:(id)a4 deletedTableRow:(id)a5 atIndexPath:(id)a6 withURL:(id)a7 httpMethod:(id)a8;
- (DelayedPushDelegate)delegate;
- (ICQPreferencesFreshmintManager)freshmintManager;
- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3;
- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 buyStorageFlow:(BOOL)a4;
- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4;
- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4 account:(id)a5;
- (ICQUIPreferencesLiftUIDelegate)liftUIDelegate;
- (NSArray)dataclassSubstitutions;
- (NSString)initialAction;
- (NSString)nextSignpostId;
- (RUILoader)lastDocumentDeleteLoader;
- (id)parentViewControllerForObjectModel:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateBackupsElementForObjectModel:(id)a3 completion:(id)a4;
- (void)_activatePhotosElementForObjectModel:(id)a3 completion:(id)a4;
- (void)_freshmintStorageUpgradeWithCompletion:(id)a3 withURL:(id)a4;
- (void)_freshmintStorageUpgradeWithICQLink:(id)a3 completion:(id)a4;
- (void)_popObjectModelAnimated:(BOOL)a3;
- (void)_postQuotaDidChangeNotification;
- (void)_presentCloudStorageOffersFlowWithAction:(id)a3 completion:(id)a4;
- (void)_processObjectModel:(id)a3;
- (void)_processTableRow:(id)a3;
- (void)_reloadQuotaInfo;
- (void)beginLegacyFlow;
- (void)buyFlowCompletionDidSucceed:(BOOL)a3 error:(id)a4;
- (void)cancelRemoteUI;
- (void)cleanupLoader;
- (void)confirmDeleteAll;
- (void)confirmDeleteWithTitle:(id)a3 prompt:(id)a4 explanation:(id)a5 confirmationAction:(id)a6;
- (void)dealloc;
- (void)deleteAllDocuments;
- (void)loadURL:(id)a3 postBody:(id)a4;
- (void)loadURL:(id)a3 postBody:(id)a4 additionalHeaders:(id)a5;
- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5;
- (void)objectModel:(id)a3 page:(id)a4 toggledEditing:(BOOL)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6;
- (void)objectModelDidChange:(id)a3;
- (void)objectModelPressedBack:(id)a3;
- (void)popAndReloadFromRemoteUI:(BOOL)a3 additionalHeaders:(id)a4;
- (void)reloadTopControllerWithAdditionalHeaders:(id)a3;
- (void)setDataclassSubstitutions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFreshmintManager:(id)a3;
- (void)setInitialAction:(id)a3;
- (void)setIsManageStorage:(BOOL)a3;
- (void)setIsNativeManageStorage:(BOOL)a3;
- (void)setLastDocumentDeleteLoader:(id)a3;
- (void)setLiftUIDelegate:(id)a3;
- (void)setNextSignpostId:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)willShowController:(id)a3;
@end

@implementation ICQPreferencesRemoteUIDelegate

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3
{
  v4 = (void *)MEMORY[0x263EFB210];
  id v5 = a3;
  v6 = [v4 defaultStore];
  v7 = objc_msgSend(v6, "aa_primaryAppleAccount");
  v8 = [(ICQPreferencesRemoteUIDelegate *)self initWithNavigationController:v5 initialAction:0 account:v7];

  return v8;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4
{
  v6 = (void *)MEMORY[0x263EFB210];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultStore];
  v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
  v11 = [(ICQPreferencesRemoteUIDelegate *)self initWithNavigationController:v8 initialAction:v7 account:v10];

  return v11;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 buyStorageFlow:(BOOL)a4
{
  if (a4) {
    id v6 = (id)*MEMORY[0x263F5FEC0];
  }
  else {
    id v6 = 0;
  }
  id v7 = (void *)MEMORY[0x263EFB210];
  id v8 = a3;
  v9 = [v7 defaultStore];
  v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
  v11 = [(ICQPreferencesRemoteUIDelegate *)self initWithNavigationController:v8 initialAction:v6 account:v10];

  return v11;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4 account:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICQPreferencesRemoteUIDelegate;
  v12 = [(ICQPreferencesRemoteUIDelegate *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_navigationController, a3);
    objc_storeStrong((id *)&v13->_initialAction, a4);
    objc_storeStrong((id *)&v13->_account, a5);
    v14 = objc_alloc_init(ICQPreferencesFreshmintManager);
    freshmintManager = v13->_freshmintManager;
    v13->_freshmintManager = v14;

    [(ICQPreferencesFreshmintManager *)v13->_freshmintManager setDelegate:v13];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v13 selector:sel_willShowController_ name:*MEMORY[0x263F601C0] object:v13->_navigationController];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v13 selector:sel__reloadQuotaInfo name:@"QuotaInformationChanged" object:0];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(UINavigationController *)self->_navigationController presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(UINavigationController *)self->_navigationController dismissViewControllerAnimated:0 completion:0];
  }
  [(NSMutableArray *)self->_deleteLoaders enumerateObjectsUsingBlock:&__block_literal_global_15];
  [(RUILoader *)self->_loader setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)ICQPreferencesRemoteUIDelegate;
  [(ICQPreferencesRemoteUIDelegate *)&v6 dealloc];
}

uint64_t __41__ICQPreferencesRemoteUIDelegate_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (void)willShowController:(id)a3
{
  id v12 = a3;
  v4 = [v12 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263F601C8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = [v12 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x263F601D0]];
    int v8 = [v7 intValue];

    if (v8 == 2)
    {
      id v9 = [(NSMutableArray *)self->_objectModels lastObject];
      id v10 = [v9 defaultPages];
      int v11 = [v10 containsObject:v5];

      if (v11)
      {
        [(ICQPreferencesRemoteUIDelegate *)self cleanupLoader];
        [(NSMutableArray *)self->_objectModels removeLastObject];
      }
    }
  }
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_navigationController;
}

- (void)cancelRemoteUI
{
  self->_cancelled = 1;
}

- (void)cleanupLoader
{
  if ([(RUILoader *)self->_loader isLoading])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained loadFailed:self withError:0];
  }
  [(RUILoader *)self->_loader cancel];
  [(RUILoader *)self->_loader setDelegate:0];
  loader = self->_loader;
  self->_loader = 0;

  if (!self->_modalNavigationController)
  {
    storageOffersManager = self->_storageOffersManager;
    self->_storageOffersManager = 0;
  }
}

- (void)loadURL:(id)a3 postBody:(id)a4 additionalHeaders:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];
  int v12 = [v11 isEqualToString:@"MANAGE"];

  if (v12)
  {
    v13 = _ICQSignpostLogSystem();
    v14 = objc_opt_new();
    uint64_t v15 = _ICQSignpostCreateWithObject();
    unint64_t v17 = v16;

    v18 = _ICQSignpostLogSystem();
    objc_super v19 = v18;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "iOSManageStorageLoad", " enableTelemetry=YES ", buf, 2u);
    }

    v20 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](v15, v20);
    }
LABEL_13:

    self->_signpost.identifier = v15;
    self->_signpost.timestamp = v17;
    goto LABEL_14;
  }
  v21 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];
  int v22 = [v21 isEqualToString:@"MANAGE_DRILLDOWN"];

  if (v22)
  {
    v23 = _ICQSignpostLogSystem();
    v24 = objc_opt_new();
    uint64_t v15 = _ICQSignpostCreateWithObject();
    unint64_t v17 = v25;

    v26 = _ICQSignpostLogSystem();
    v27 = v26;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v15, "iOSManageStorageDrilldownLoad", " enableTelemetry=YES ", buf, 2u);
    }

    v20 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](v15, v20);
    }
    goto LABEL_13;
  }
  v42 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];

  if (v42)
  {
    v43 = _ICQGetLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];
      *(_DWORD *)buf = 138412290;
      id v51 = v44;
      _os_log_impl(&dword_22C821000, v43, OS_LOG_TYPE_DEFAULT, "Unknown signpost id %@", buf, 0xCu);
    }
  }
LABEL_14:
  [(ICQPreferencesRemoteUIDelegate *)self cleanupLoader];
  self->_cancelled = 0;
  v28 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v10;
    _os_log_impl(&dword_22C821000, v28, OS_LOG_TYPE_DEFAULT, "additional headers: %@", buf, 0xCu);
  }

  v29 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v8 cachePolicy:1 timeoutInterval:30.0];
  objc_msgSend(v29, "ak_addAnisetteHeaders");
  objc_msgSend(v29, "ak_addDeviceUDIDHeader");
  if (v9)
  {
    [v29 setHTTPBody:v9];
    [v29 setHTTPMethod:@"POST"];
    if (self->_requestContentType) {
      requestContentType = (__CFString *)self->_requestContentType;
    }
    else {
      requestContentType = @"text/html";
    }
    [v29 addValue:requestContentType forHTTPHeaderField:@"Content-Type"];
  }
  objc_msgSend(v29, "aa_addMultiUserDeviceHeaderIfEnabled");
  +[ICQUsageQuotaRequest addHeadersToRequest:v29 forAccount:self->_account];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v10;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v37 = objc_msgSend(v31, "objectForKey:", v36, (void)v45);
        [v29 addValue:v37 forHTTPHeaderField:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v33);
  }

  if (!self->_loader)
  {
    v38 = (RUILoader *)objc_alloc_init(MEMORY[0x263F63790]);
    loader = self->_loader;
    self->_loader = v38;

    [(RUILoader *)self->_loader setDelegate:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v41 = objc_loadWeakRetained((id *)&self->_delegate);
    [v41 loadStarted:self];
  }
  -[RUILoader loadXMLUIWithRequest:](self->_loader, "loadXMLUIWithRequest:", v29, (void)v45);
}

- (void)loadURL:(id)a3 postBody:(id)a4
{
}

- (void)reloadTopControllerWithAdditionalHeaders:(id)a3
{
  objectModels = self->_objectModels;
  id v5 = a3;
  id v7 = [(NSMutableArray *)objectModels lastObject];
  self->_forceActionSignal = 3;
  objc_super v6 = [v7 sourceURL];
  [(ICQPreferencesRemoteUIDelegate *)self loadURL:v6 postBody:0 additionalHeaders:v5];
}

- (void)popAndReloadFromRemoteUI:(BOOL)a3 additionalHeaders:(id)a4
{
  id v14 = a4;
  if (a3)
  {
    uint64_t v6 = -1;
  }
  else
  {
    objectModels = self->_objectModels;
    id v8 = objc_alloc_init(MEMORY[0x263F637A8]);
    [(NSMutableArray *)objectModels addObject:v8];

    uint64_t v6 = -2;
  }
  id v9 = [(NSMutableArray *)self->_objectModels objectAtIndex:[(NSMutableArray *)self->_objectModels count] + v6];
  id v10 = [v9 identifier];
  int v11 = [v10 isEqualToString:@"manageStorageBackup"];

  unint64_t v12 = 4;
  if (v11) {
    unint64_t v12 = 8;
  }
  self->_forceActionSignal = v12;
  v13 = [v9 sourceURL];
  [(ICQPreferencesRemoteUIDelegate *)self loadURL:v13 postBody:0 additionalHeaders:v14];
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  [(ICQPreferencesRemoteUIDelegate *)self cleanupLoader];
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Action taken at PrefRUIDelegate: %@", buf, 0xCu);
  }

  if ([v7 isEqualToString:@"localBackup"])
  {
    id v10 = ICQLocalBackupController;
LABEL_7:
    int v11 = [(__objc2_class *)v10 specifierForAccount:self->_account];
LABEL_8:
    unint64_t v12 = v11;
    [v11 setProperty:v8 forKey:@"attributes"];
    [v12 setProperty:self forKey:@"remoteDelegate"];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"remoteBackup"])
  {
    id v10 = ICQRemoteBackupController;
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"buyStorage"])
  {
    uint64_t v15 = *MEMORY[0x263F5FEC0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __71__ICQPreferencesRemoteUIDelegate_objectModel_pressedButton_attributes___block_invoke;
    v21[3] = &unk_264921C58;
    v21[4] = self;
    [(ICQPreferencesRemoteUIDelegate *)self _presentCloudStorageOffersFlowWithAction:v15 completion:v21];
  }
  else
  {
    if ([v7 isEqualToString:@"afuiSettings"])
    {
      int v11 = +[ICQPreferencesRemoteUIDelegate afuiSettingsSpecifier];
      goto LABEL_8;
    }
    if ([v7 isEqualToString:@"messagesSettings"])
    {
      int v11 = +[ICQPreferencesRemoteUIDelegate messagesSettingsSpecifier];
      goto LABEL_8;
    }
    if ([v7 isEqualToString:@"healthSettings"])
    {
      int v11 = +[ICQPreferencesRemoteUIDelegate healthSettingsSpecifier];
      goto LABEL_8;
    }
  }
  unint64_t v12 = 0;
LABEL_9:
  v13 = [v8 objectForKeyedSubscript:@"action"];
  if (([v13 isEqualToString:@"launchPlanManagement"] & 1) == 0)
  {
    id v14 = _ICQStringForAction();
    if ([v13 isEqualToString:v14])
    {
    }
    else
    {
      unint64_t v16 = _ICQStringForAction();
      int v17 = [v13 isEqualToString:v16];

      if (!v17) {
        goto LABEL_17;
      }
    }
  }
  v18 = [(ICQPreferencesRemoteUIDelegate *)self freshmintManager];
  [v18 setShouldShowFreshmint:1];

  self->_icqAction = _ICQActionForString();
LABEL_17:
  if (v12)
  {
    objc_super v19 = self->_navigationController;
    v20 = CreateDetailControllerInstanceWithClass();
    [v20 setParentController:0];
    [v20 setRootController:v19];
    [v20 setSpecifier:v12];
    [(UINavigationController *)v19 showViewController:v20 sender:self];
  }
}

uint64_t __71__ICQPreferencesRemoteUIDelegate_objectModel_pressedButton_attributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) buyFlowCompletionDidSucceed:a2 error:a3];
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v11;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "linkURL: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  v42 = __80__ICQPreferencesRemoteUIDelegate_objectModel_pressedLink_httpMethod_completion___block_invoke;
  v43 = &unk_264922EB8;
  id v15 = v11;
  id v44 = v15;
  objc_copyWeak(&v47, (id *)buf);
  id v16 = v13;
  long long v45 = self;
  id v46 = v16;
  int v17 = (void (**)(void *, uint64_t, void))_Block_copy(&v40);
  if (([(RUILoader *)self->_loader isLoading] & 1) == 0
    && ![(ICQPreferencesRemoteUIDelegate *)self _loadNativeURL:v15])
  {
    v18 = [v12 lowercaseString];
    int v19 = [v18 isEqualToString:@"liftui"];

    if (v19)
    {
      v20 = [(ICQPreferencesRemoteUIDelegate *)self liftUIDelegate];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        int v22 = [[ICQUIPreferencesLiftUIDelegate alloc] initWithNavigationController:self->_navigationController account:self->_account];
        [(ICQPreferencesRemoteUIDelegate *)self setLiftUIDelegate:v22];

        id v23 = [(ICQPreferencesRemoteUIDelegate *)self liftUIDelegate];
        [v23 setDelegate:self];
      }
      uint64_t v24 = [(ICQPreferencesRemoteUIDelegate *)self liftUIDelegate];
      [v24 loadURL:v15];

      v17[2](v17, 1, 0);
    }
    else
    {
      unint64_t v25 = [v12 lowercaseString];
      int v26 = [v25 isEqualToString:@"post"];

      if (v26)
      {
        v27 = [MEMORY[0x263EFF9A0] dictionary];
        v28 = [v10 defaultPages];
        v29 = [v28 lastObject];
        [v29 populatePostbackDictionary:v27];

        if (v27)
        {
          v30 = [MEMORY[0x263F08AC0] dataWithPropertyList:v27 format:100 options:0 error:0];
          requestContentType = self->_requestContentType;
          self->_requestContentType = (NSString *)@"application/x-plist";
        }
        else
        {
          v30 = [v10 postbackData];
        }
        v38 = _Block_copy(v17);
        id linkCompletionBlock = self->_linkCompletionBlock;
        self->_id linkCompletionBlock = v38;

        [(ICQPreferencesRemoteUIDelegate *)self loadURL:v15 postBody:v30];
      }
      else
      {
        uint64_t v32 = [(ICQPreferencesRemoteUIDelegate *)self freshmintManager];
        int v33 = [v32 shouldShowFreshmint];

        if (v33)
        {
          [(ICQPreferencesRemoteUIDelegate *)self _freshmintStorageUpgradeWithCompletion:v17 withURL:v15];
        }
        else
        {
          if ([(ICQPreferencesRemoteUIDelegate *)self isManageStorage])
          {
            uint64_t v34 = [v10 identifier];
            int v35 = [v34 isEqualToString:@"iCloudManageStorage"];

            if (v35) {
              [(ICQPreferencesRemoteUIDelegate *)self setNextSignpostId:@"MANAGE_DRILLDOWN"];
            }
          }
          uint64_t v36 = _Block_copy(v17);
          id v37 = self->_linkCompletionBlock;
          self->_id linkCompletionBlock = v36;

          [(ICQPreferencesRemoteUIDelegate *)self loadURL:v15 postBody:0];
        }
      }
    }
  }

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);
}

void __80__ICQPreferencesRemoteUIDelegate_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "icqui_isStopFamilySharingURL"))
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    if (!WeakRetained) {
      goto LABEL_11;
    }
    id v5 = WeakRetained;
    uint64_t v6 = [WeakRetained[1] topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [*(id *)(a1 + 40) isNativeManageStorage];

      if ((v7 & 1) == 0) {
        id v8 = (id)[v5[1] popViewControllerAnimated:1];
      }
    }
    else
    {
    }
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "icqui_isJoinOrLeaveFamilySharingURL"))
  {
LABEL_10:
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    [v9 _postQuotaDidChangeNotification];
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteAllDocuments
{
  ++self->_deleteAllDocumentsAttemptCount;
  v3 = [(NSMutableArray *)self->_objectModels lastObject];
  v4 = [v3 defaultPages];
  id v5 = [v4 lastObject];
  uint64_t v6 = [v5 tableViewOM];
  char v7 = [v6 attributes];
  id v9 = [v7 objectForKey:@"deleteAllURL"];

  id v8 = [NSURL URLWithString:v9];
  [(ICQPreferencesRemoteUIDelegate *)self loadURL:v8 postBody:0];
}

- (void)confirmDeleteAll
{
  v3 = [(NSMutableArray *)self->_objectModels lastObject];
  v4 = [v3 defaultPages];
  id v5 = [v4 lastObject];
  uint64_t v6 = [v5 tableViewOM];
  char v7 = [v6 sections];
  id v8 = [v7 objectAtIndex:0];
  id v9 = [v8 attributes];
  v18 = [v9 objectForKey:@"header"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"DELETE_ALL" value:&stru_26DFF2C90 table:@"CloudGroup"];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"DELETE_ALL_PROMPT" value:&stru_26DFF2C90 table:@"CloudGroup"];
  id v14 = NSString;
  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"DELETE_ALL_EXPLAINATION" value:&stru_26DFF2C90 table:@"CloudGroup"];
  int v17 = objc_msgSend(v14, "stringWithFormat:", v16, v18);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __50__ICQPreferencesRemoteUIDelegate_confirmDeleteAll__block_invoke;
  v19[3] = &unk_264921C80;
  v19[4] = self;
  [(ICQPreferencesRemoteUIDelegate *)self confirmDeleteWithTitle:v11 prompt:v13 explanation:v17 confirmationAction:v19];
}

uint64_t __50__ICQPreferencesRemoteUIDelegate_confirmDeleteAll__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = 0;
  return [*(id *)(a1 + 32) deleteAllDocuments];
}

- (void)confirmDeleteWithTitle:(id)a3 prompt:(id)a4 explanation:(id)a5 confirmationAction:(id)a6
{
  id v10 = a6;
  id v11 = (void *)MEMORY[0x263F82670];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v11 currentDevice];
  unsigned int v16 = objc_msgSend(v15, "sf_isiPad");

  if (v16) {
    id v17 = v13;
  }
  else {
    id v17 = v12;
  }
  if (v16) {
    id v18 = v12;
  }
  else {
    id v18 = 0;
  }
  int v19 = [MEMORY[0x263F82418] alertControllerWithTitle:v17 message:v18 preferredStyle:v16];

  v20 = (void *)MEMORY[0x263F82400];
  BOOL v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
  id v23 = [v20 actionWithTitle:v22 style:1 handler:0];
  [v19 addAction:v23];

  uint64_t v24 = (void *)MEMORY[0x263F82400];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __95__ICQPreferencesRemoteUIDelegate_confirmDeleteWithTitle_prompt_explanation_confirmationAction___block_invoke;
  v27[3] = &unk_264922EE0;
  id v28 = v10;
  id v25 = v10;
  int v26 = [v24 actionWithTitle:v14 style:2 handler:v27];

  [v19 addAction:v26];
  [(UINavigationController *)self->_navigationController presentViewController:v19 animated:1 completion:0];
}

uint64_t __95__ICQPreferencesRemoteUIDelegate_confirmDeleteWithTitle_prompt_explanation_confirmationAction___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)objectModel:(id)a3 page:(id)a4 toggledEditing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    button = self->_button;
    if (!button)
    {
      id v12 = [ICQPreferencesRemoteUIDelegateTableCellButton alloc];
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"DELETE_ALL" value:&stru_26DFF2C90 table:@"CloudGroup"];
      id v15 = [(ICQPreferencesRemoteUIDelegateTableCellButton *)v12 initWithName:v14 target:self action:sel_confirmDeleteAll];
      unsigned int v16 = self->_button;
      self->_button = v15;

      button = self->_button;
    }
    [(ICQPreferencesRemoteUIDelegateTableCellButton *)button setAlpha:0.0];
    id v17 = [v10 tableViewOM];
    id v18 = [v17 tableView];
    [v18 setTableFooterView:self->_button];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke;
    v23[3] = &unk_264921C80;
    v23[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v23 animations:0.3];
  }
  else
  {
    int v19 = (void *)MEMORY[0x263F82E00];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_2;
    v22[3] = &unk_264921C80;
    v22[4] = self;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_3;
    v20[3] = &unk_264921BB0;
    id v21 = v9;
    [v19 animateWithDuration:v22 animations:v20 completion:0.3];
  }
}

uint64_t __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setAlpha:1.0];
}

uint64_t __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setAlpha:0.0];
}

void __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableViewOM];
  v1 = [v2 tableView];
  [v1 setTableFooterView:0];
}

- (BOOL)objectModel:(id)a3 page:(id)a4 deletedTableRow:(id)a5 atIndexPath:(id)a6 withURL:(id)a7 httpMethod:(id)a8
{
  id v13 = NSDictionary;
  id v14 = a5;
  id v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", a3, @"objectModel", a4, @"page", v14, @"row", a6, @"indexPath", a7, @"url", a8, @"httpMethod", 0);
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unsigned int v16 = [v27 localizedStringForKey:@"DELETE_ITEM" value:&stru_26DFF2C90 table:@"CloudGroup"];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"DELETE_ITEM_PROMPT" value:&stru_26DFF2C90 table:@"CloudGroup"];
  int v19 = NSString;
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v21 = [v20 localizedStringForKey:@"DELETE_ITEM_EXPLAINATION" value:&stru_26DFF2C90 table:@"CloudGroup"];
  int v22 = [v14 attributes];

  id v23 = [v22 objectForKey:@"label"];
  uint64_t v24 = objc_msgSend(v19, "stringWithFormat:", v21, v23);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __98__ICQPreferencesRemoteUIDelegate_objectModel_page_deletedTableRow_atIndexPath_withURL_httpMethod___block_invoke;
  v29[3] = &unk_264921B68;
  id v30 = v15;
  id v31 = self;
  id v25 = v15;
  [(ICQPreferencesRemoteUIDelegate *)self confirmDeleteWithTitle:v16 prompt:v18 explanation:v24 confirmationAction:v29];

  return 0;
}

void __98__ICQPreferencesRemoteUIDelegate_objectModel_page_deletedTableRow_atIndexPath_withURL_httpMethod___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:@"httpMethod"];
  v3 = [v2 lowercaseString];
  int v4 = [v3 isEqualToString:@"post"];

  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) objectForKey:@"objectModel"];
    id v23 = [v5 postbackData];
  }
  else
  {
    id v23 = 0;
  }
  id v6 = objc_alloc(MEMORY[0x263F089E0]);
  char v7 = [*(id *)(a1 + 32) objectForKey:@"url"];
  id v8 = (void *)[v6 initWithURL:v7 cachePolicy:1 timeoutInterval:30.0];

  [v8 setHTTPBody:v23];
  [v8 setHTTPMethod:@"POST"];
  [v8 addValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
  +[ICQUsageQuotaRequest addHeadersToRequest:v8 forAccount:*(void *)(*(void *)(a1 + 40) + 112)];
  id v9 = objc_alloc_init(MEMORY[0x263F63790]);
  [v9 setDelegate:*(void *)(a1 + 40)];
  id v10 = *(void **)(*(void *)(a1 + 40) + 56);
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 56);
    *(void *)(v12 + 56) = v11;

    id v10 = *(void **)(*(void *)(a1 + 40) + 56);
  }
  [v10 addObject:v9];
  [v9 loadXMLUIWithRequest:v8];
  id v14 = [*(id *)(a1 + 32) objectForKey:@"page"];
  id v15 = [v14 tableViewOM];

  unsigned int v16 = [*(id *)(a1 + 32) objectForKey:@"indexPath"];
  id v17 = [v15 tableView];
  id v18 = [v15 sections];
  int v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "section"));

  objc_msgSend(v19, "removeRowAtIndex:", objc_msgSend(v16, "row"));
  v20 = [v19 rows];
  uint64_t v21 = [v20 count];

  if (!v21) {
    [*(id *)(a1 + 40) setLastDocumentDeleteLoader:v9];
  }
  int v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v16];
  [v17 deleteRowsAtIndexPaths:v22 withRowAnimation:100];
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_objectModels count]) {
    -[ICQPreferencesRemoteUIDelegate _popObjectModelAnimated:]();
  }
  id v12 = [(NSMutableArray *)self->_objectModels lastObject];
  [(NSMutableArray *)self->_objectModels removeLastObject];
  BOOL v5 = [v12 defaultPages];
  uint64_t v6 = [v5 count] - 1;
  if (v6 >= 0)
  {
    do
    {
      char v7 = [v5 objectAtIndex:v6];
      id v8 = [(UINavigationController *)self->_navigationController topViewController];

      if (v8 == v7)
      {
        if (v6) {
          BOOL v9 = 0;
        }
        else {
          BOOL v9 = v3;
        }
        id v10 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:v9];
      }
    }
    while (v6-- > 0);
  }
}

- (void)objectModelPressedBack:(id)a3
{
  id v9 = a3;
  [(ICQPreferencesRemoteUIDelegate *)self cleanupLoader];
  int v4 = [(UINavigationController *)self->_navigationController topViewController];
  id v5 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    if (v6)
    {
      char v7 = [v9 defaultPages];
      int v8 = [v7 containsObject:v6];

      if (v8) {
        [(NSMutableArray *)self->_objectModels removeLastObject];
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  uint64_t v166 = *MEMORY[0x263EF8340];
  id v120 = a3;
  id v126 = a4;
  id v117 = a5;
  v127 = self;
  int v8 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];
  LODWORD(a4) = [v8 isEqualToString:@"MANAGE"];

  if (a4)
  {
    _ICQSignpostGetNanoseconds();
    id v9 = _ICQSignpostLogSystem();
    id v10 = v9;
    os_signpost_id_t identifier = v127->_signpost.identifier;
    if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "iOSManageStorageLoad", "", (uint8_t *)&buf, 2u);
    }

    id v12 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICQPreferencesRemoteUIDelegate loader:receivedObjectModel:topActionSignal:]();
    }
  }
  else
  {
    id v13 = [(ICQPreferencesRemoteUIDelegate *)self nextSignpostId];
    int v14 = [v13 isEqualToString:@"MANAGE_DRILLDOWN"];

    if (!v14) {
      goto LABEL_14;
    }
    _ICQSignpostGetNanoseconds();
    id v15 = _ICQSignpostLogSystem();
    unsigned int v16 = v15;
    os_signpost_id_t v17 = v127->_signpost.identifier;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v16, OS_SIGNPOST_INTERVAL_END, v17, "iOSManageStorageDrilldownLoad", "", (uint8_t *)&buf, 2u);
    }

    id v12 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICQPreferencesRemoteUIDelegate loader:receivedObjectModel:topActionSignal:]();
    }
  }

LABEL_14:
  nextSignpostId = v127->_nextSignpostId;
  v127->_nextSignpostId = 0;

  int v19 = [(ICQPreferencesRemoteUIDelegate *)v127 lastDocumentDeleteLoader];
  int v115 = [v19 isEqual:v120];

  location = (id *)&v127->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&v127->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    int v22 = [v126 allPages];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v149 objects:v161 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v150;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v150 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v149 + 1) + 8 * i);
          id v27 = objc_loadWeakRetained(location);
          [v27 remoteUIDelegate:v127 didCreatePage:v26 forAccount:v127->_account inObjectModel:v126];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v149 objects:v161 count:16];
      }
      while (v23);
    }
  }
  else
  {
    id v28 = objc_loadWeakRetained(location);
    char v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) == 0) {
      goto LABEL_32;
    }
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    int v22 = [v126 allPages];
    uint64_t v30 = [v22 countByEnumeratingWithState:&v145 objects:v160 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v146 != v31) {
            objc_enumerationMutation(v22);
          }
          uint64_t v33 = *(void *)(*((void *)&v145 + 1) + 8 * j);
          id v34 = objc_loadWeakRetained(location);
          [v34 remoteUIDelegate:v127 didCreatePage:v33 inObjectModel:v126];
        }
        uint64_t v30 = [v22 countByEnumeratingWithState:&v145 objects:v160 count:16];
      }
      while (v30);
    }
  }

LABEL_32:
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obuint64_t j = [v126 allPages];
  uint64_t v118 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v118)
  {
    uint64_t v35 = *(void *)v142;
    uint64_t v114 = *(void *)v142;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v142 != v35)
        {
          uint64_t v37 = v36;
          objc_enumerationMutation(obj);
          uint64_t v36 = v37;
        }
        uint64_t v116 = v36;
        v38 = *(void **)(*((void *)&v141 + 1) + 8 * v36);
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        v39 = [v38 tableViewOM];
        id v121 = [v39 sections];

        uint64_t v123 = [v121 countByEnumeratingWithState:&v137 objects:v158 count:16];
        if (v123)
        {
          uint64_t v122 = *(void *)v138;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v138 != v122)
              {
                uint64_t v41 = v40;
                objc_enumerationMutation(v121);
                uint64_t v40 = v41;
              }
              uint64_t v124 = v40;
              v42 = *(void **)(*((void *)&v137 + 1) + 8 * v40);
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              v43 = [v42 rows];
              uint64_t v44 = [v43 countByEnumeratingWithState:&v133 objects:v157 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v134;
                do
                {
                  for (uint64_t k = 0; k != v44; ++k)
                  {
                    if (*(void *)v134 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    id v47 = *(void **)(*((void *)&v133 + 1) + 8 * k);
                    long long v48 = [v47 attributes];
                    id v49 = [v48 objectForKeyedSubscript:@"encryptedFile"];

                    if (v49)
                    {
                      id v132 = 0;
                      id v50 = v49;
                      uint64_t v153 = 0;
                      v154 = &v153;
                      uint64_t v155 = 0x2020000000;
                      id v51 = (void (*)(id, id *))getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr;
                      v156 = getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr;
                      if (!getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr)
                      {
                        *(void *)&long long buf = MEMORY[0x263EF8330];
                        *((void *)&buf + 1) = 3221225472;
                        v163 = __getBRGetFileNameFromServerInfoBlobSymbolLoc_block_invoke;
                        v164 = &unk_264921E58;
                        v165 = &v153;
                        __getBRGetFileNameFromServerInfoBlobSymbolLoc_block_invoke((uint64_t)&buf);
                        id v51 = (void (*)(id, id *))v154[3];
                      }
                      _Block_object_dispose(&v153, 8);
                      if (!v51) {
                        -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:]();
                      }
                      uint64_t v52 = v51(v50, &v132);

                      id v53 = v132;
                      if (v52)
                      {
                        v54 = [v47 attributes];
                        v55 = [v54 mutableCopy];

                        [v55 setObject:v52 forKeyedSubscript:@"label"];
                        [v47 setAttributes:v55];
                      }
                      else
                      {
                        v55 = _ICQGetLogSystem();
                        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(buf) = 138412290;
                          *(void *)((char *)&buf + 4) = v53;
                          _os_log_error_impl(&dword_22C821000, v55, OS_LOG_TYPE_ERROR, "Error decrypting data blob: %@", (uint8_t *)&buf, 0xCu);
                        }
                      }
                    }
                  }
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v133 objects:v157 count:16];
                }
                while (v44);
              }

              uint64_t v40 = v124 + 1;
            }
            while (v124 + 1 != v123);
            uint64_t v123 = [v121 countByEnumeratingWithState:&v137 objects:v158 count:16];
          }
          while (v123);
        }

        uint64_t v36 = v116 + 1;
        uint64_t v35 = v114;
      }
      while (v116 + 1 != v118);
      uint64_t v118 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
      uint64_t v35 = v114;
    }
    while (v118);
  }

  if (![(NSMutableArray *)v127->_deleteLoaders containsObject:v120]
    || ([(NSMutableArray *)v127->_deleteLoaders removeObject:v120], v115))
  {
    [(ICQPreferencesRemoteUIDelegate *)v127 setLastDocumentDeleteLoader:0];
    [v126 setDelegate:v127];
    v56 = v127;
    id linkCompletionBlock = (void (**)(id, uint64_t, void))v127->_linkCompletionBlock;
    if (linkCompletionBlock)
    {
      linkCompletionBlock[2](linkCompletionBlock, 1, 0);
      id v58 = v127->_linkCompletionBlock;
      v127->_id linkCompletionBlock = 0;

      v56 = v127;
    }
    if (!v56->_cancelled)
    {
      uint64_t v59 = [v117 topSignal];
      unint64_t forceActionSignal = v127->_forceActionSignal;
      if (forceActionSignal)
      {
        v127->_unint64_t forceActionSignal = 0;
        uint64_t v61 = forceActionSignal;
      }
      else
      {
        uint64_t v61 = v59;
      }
      id v62 = objc_loadWeakRetained(location);

      if (v62)
      {
        id v63 = objc_loadWeakRetained(location);
        [v63 loadFinished:v127];
      }
      objectModels = v127->_objectModels;
      if (!objectModels)
      {
        v65 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v66 = v127->_objectModels;
        v127->_objectModels = v65;

        objectModels = v127->_objectModels;
      }
      if (![(NSMutableArray *)objectModels count])
      {
        if (v61 == 3)
        {
          if ([(ICQPreferencesRemoteUIDelegate *)v127 isNativeManageStorage]) {
            uint64_t v61 = 0;
          }
          else {
            uint64_t v61 = 2;
          }
        }
        else if (v61 == 4)
        {
          uint64_t v61 = 0;
        }
      }
      v67 = [v126 defaultPages];
      v68 = [v67 lastObject];

      if (v61 == 2 && v68)
      {
        [(NSMutableArray *)v127->_objectModels addObject:v126];
        -[UINavigationController showViewController:sender:](v127->_navigationController, "showViewController:sender:", v68);
        [(UINavigationController *)v127->_navigationController setToolbarHidden:1 animated:0];
      }
      else if (v61 == 3 && v68)
      {
        v69 = [(UINavigationController *)v127->_navigationController viewControllers];
        v70 = (void *)[v69 mutableCopy];

        [(NSMutableArray *)v127->_objectModels removeLastObject];
        [v70 removeLastObject];
        [v70 addObject:v68];
        [(NSMutableArray *)v127->_objectModels addObject:v126];
        [(UINavigationController *)v127->_navigationController setViewControllers:v70 animated:0];
      }
      else if (v61 == 4)
      {
        if (v68)
        {
          v71 = [v126 clientInfo];
          v72 = [v71 objectForKeyedSubscript:@"shouldRefreshStorageGraph"];

          if ([(ICQPreferencesRemoteUIDelegate *)v127 isNativeManageStorage]
            && [v72 isEqualToString:@"true"])
          {
            id v73 = [(UINavigationController *)v127->_navigationController popViewControllerAnimated:1];
            v74 = [MEMORY[0x263F08A00] defaultCenter];
            [v74 postNotificationName:@"QuotaDidChange" object:0];
          }
          else if ((unint64_t)[(NSMutableArray *)v127->_objectModels count] > 1)
          {
            v75 = +[ICQQuotaRequestManager sharedManager];
            [v75 noteQuotaInfoChanged];

            v74 = [(UINavigationController *)v127->_navigationController topViewController];
            [(NSMutableArray *)v127->_objectModels removeLastObject];
            [(NSMutableArray *)v127->_objectModels removeLastObject];
            v76 = [(UINavigationController *)v127->_navigationController viewControllers];
            v77 = (void *)[v76 mutableCopy];

            [v77 removeLastObject];
            [v77 removeLastObject];
            [(NSMutableArray *)v127->_objectModels addObject:v126];
            [v77 addObject:v68];
            [v77 addObject:v74];
            [(UINavigationController *)v127->_navigationController setViewControllers:v77 animated:0];
            id v78 = [(UINavigationController *)v127->_navigationController popViewControllerAnimated:1];
          }
          else
          {
            v74 = ICQUSLogForCategory(0);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_22C821000, v74, OS_LOG_TYPE_DEFAULT, "Pop + Replace requires at least 2 existing object models.", (uint8_t *)&buf, 2u);
            }
          }
        }
        else
        {
          [(ICQPreferencesRemoteUIDelegate *)v127 _popObjectModelAnimated:1];
        }
      }

      v56 = v127;
    }
    [(ICQPreferencesRemoteUIDelegate *)v56 cleanupLoader];
  }
  v79 = [v126 clientInfo];
  v80 = [v79 objectForKeyedSubscript:@"action"];

  if ([v80 isEqualToString:@"remoteAction:launchApp"])
  {
    v81 = NSURL;
    v82 = [v126 clientInfo];
    v83 = [v82 objectForKeyedSubscript:@"remoteLaunchUrl"];
    v84 = [v81 URLWithString:v83];

    [(ICQPreferencesRemoteUIDelegate *)v127 _loadNativeURL:v84];
  }
  uint64_t v85 = [v80 isEqualToString:@"buyStorage"];
  v86 = (id *)MEMORY[0x263F5FEC0];
  if (v85)
  {
    __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v85, v126);
    id v87 = *v86;
    v131[0] = MEMORY[0x263EF8330];
    v131[1] = 3221225472;
    v131[2] = __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_2;
    v131[3] = &unk_264921C58;
    v131[4] = v127;
    [(ICQPreferencesRemoteUIDelegate *)v127 _presentCloudStorageOffersFlowWithAction:v87 completion:v131];
    goto LABEL_111;
  }
  uint64_t v88 = [v80 isEqualToString:@"launchPlanManagement"];
  if (v88) {
    goto LABEL_109;
  }
  v89 = _ICQStringForAction();
  if ([v80 isEqualToString:v89])
  {

    goto LABEL_109;
  }
  v90 = _ICQStringForAction();
  int v91 = [v80 isEqualToString:v90];

  if (v91)
  {
LABEL_109:
    __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v88, v126);
    v92 = [v126 clientInfo];
    v93 = [v92 objectForKeyedSubscript:@"planManagementUrl"];

    if (v93)
    {
      v127->_icqAction = _ICQActionForString();
      v94 = NSURL;
      v95 = [v126 clientInfo];
      v96 = [v95 objectForKeyedSubscript:@"planManagementUrl"];
      v97 = [v94 URLWithString:v96];

      [(ICQPreferencesRemoteUIDelegate *)v127 _freshmintStorageUpgradeWithCompletion:0 withURL:v97];
    }
    goto LABEL_111;
  }
  if ([v80 isEqualToString:@"UNIFIED_MESSAGING"])
  {
    v109 = [v126 clientInfo];
    v110 = [v109 objectForKeyedSubscript:@"storageChangeNotice"];

    if (v110) {
      [MEMORY[0x263F888E8] sendEventFor:2 withBundleID:@"com.apple.mobileslideshow" link:0];
    }
  }
  else
  {
    v111 = [v126 identifier];
    int v112 = [v111 isEqualToString:@"manageStorageBackup"];

    if (v112) {
      __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v113, v126);
    }
  }
LABEL_111:
  v98 = v127;
  initialAction = v127->_initialAction;
  if (initialAction)
  {
    v100 = initialAction;
    v101 = v127->_initialAction;
    v102 = (NSString *)*MEMORY[0x263F5FED8];
    if (v101 != (NSString *)*MEMORY[0x263F5FED8])
    {
      v127->_initialAction = 0;

      v98 = v127;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_3;
    aBlock[3] = &unk_264922F08;
    id v103 = v126;
    id v129 = v103;
    v130 = v98;
    v104 = _Block_copy(aBlock);
    if (v100 == *v86 || v100 == (NSString *)*MEMORY[0x263F5FEC8])
    {
      [(ICQPreferencesRemoteUIDelegate *)v127 _presentCloudStorageOffersFlowWithAction:v100 completion:v104];
    }
    else if (v100 == (NSString *)*MEMORY[0x263F5FED0])
    {
      v105 = NSURL;
      v106 = [v103 clientInfo];
      v107 = [v106 objectForKeyedSubscript:@"refreshUrl"];
      v108 = [v105 URLWithString:v107];

      [(ICQPreferencesRemoteUIDelegate *)v127 _freshmintStorageUpgradeWithCompletion:v104 withURL:v108];
    }
    else if (v100 == (NSString *)*MEMORY[0x263F5FEE0])
    {
      [(ICQPreferencesRemoteUIDelegate *)v127 _activatePhotosElementForObjectModel:v103 completion:v104];
    }
    else if (v100 == v102)
    {
      [(ICQPreferencesRemoteUIDelegate *)v127 _activateBackupsElementForObjectModel:v103 completion:v104];
    }
  }
}

void __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v2 = [v8 clientInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"refreshUrl"];

  if (v3)
  {
    int v4 = NSURL;
    id v5 = [v8 clientInfo];
    id v6 = [v5 objectForKeyedSubscript:@"refreshUrl"];
    char v7 = [v4 URLWithString:v6];

    [v8 setSourceURL:v7];
  }
}

uint64_t __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) buyFlowCompletionDidSucceed:a2 error:a3];
}

void __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) identifier];
    if (v6)
    {
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 168);
      if (v9 == (void *)*MEMORY[0x263F5FED8])
      {
        *(void *)(v8 + 168) = 0;

        goto LABEL_11;
      }
    }
    id v10 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Initial action successful; refreshing manage storage pane",
        (uint8_t *)&v11,
        2u);
    }

    [*(id *)(a1 + 40) _reloadQuotaInfo];
  }
  else
  {
    char v7 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Initial action failed with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_11:
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  *(void *)&v34[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id linkCompletionBlock = (void (**)(id, BOOL, id))self->_linkCompletionBlock;
  if (linkCompletionBlock)
  {
    linkCompletionBlock[2](linkCompletionBlock, v9 == 0, v9);
    id v12 = self->_linkCompletionBlock;
    self->_id linkCompletionBlock = 0;
  }
  if (!v9) {
    goto LABEL_18;
  }
  if (![(NSMutableArray *)self->_deleteLoaders containsObject:v8])
  {
    char v21 = [(NSMutableArray *)self->_objectModels lastObject];
    int v22 = [v21 defaultPages];
    uint64_t v23 = [v22 lastObject];
    uint64_t v24 = [v23 tableViewOM];
    id v25 = [v24 attributes];
    unsigned int v16 = [v25 objectForKey:@"deleteAllURL"];

    uint64_t v26 = [v8 URL];
    [(ICQPreferencesRemoteUIDelegate *)self cleanupLoader];
    id v27 = [NSURL URLWithString:v16];
    if ([v26 isEqual:v27])
    {
      int deleteAllDocumentsAttemptCount = self->_deleteAllDocumentsAttemptCount;

      if (deleteAllDocumentsAttemptCount <= 2)
      {
        char v29 = ICQUSLogForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = self->_deleteAllDocumentsAttemptCount;
          int v33 = 67109378;
          v34[0] = v30;
          LOWORD(v34[1]) = 2112;
          *(void *)((char *)&v34[1] + 2) = v9;
          _os_log_impl(&dword_22C821000, v29, OS_LOG_TYPE_DEFAULT, "Failed to delete all documents on attempt #%i: %@", (uint8_t *)&v33, 0x12u);
        }

        [(ICQPreferencesRemoteUIDelegate *)self deleteAllDocuments];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
    uint64_t v31 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      *(void *)id v34 = v9;
      _os_log_impl(&dword_22C821000, v31, OS_LOG_TYPE_DEFAULT, "RUILoader failed: %@", (uint8_t *)&v33, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained loadFailed:self withError:v9];

    goto LABEL_16;
  }
  [(NSMutableArray *)self->_deleteLoaders removeObject:v8];
  if ((unint64_t)[(NSMutableArray *)self->_objectModels count] >= 2)
  {
    [(ICQPreferencesRemoteUIDelegate *)self _popObjectModelAnimated:1];
    uint64_t v13 = (void *)MEMORY[0x263F82418];
    int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"DELETE_ERROR" value:&stru_26DFF2C90 table:@"CloudGroup"];
    unsigned int v16 = [v13 alertControllerWithTitle:v15 message:0 preferredStyle:1];

    os_signpost_id_t v17 = (void *)MEMORY[0x263F82400];
    id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v19 = [v18 localizedStringForKey:@"OK" value:&stru_26DFF2C90 table:@"CloudGroup"];
    v20 = [v17 actionWithTitle:v19 style:0 handler:0];
    [v16 addAction:v20];

    [(UINavigationController *)self->_navigationController presentViewController:v16 animated:1 completion:0];
LABEL_17:
  }
LABEL_18:
}

- (void)objectModelDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 delegate];
    int v7 = 136315394;
    id v8 = "-[ICQPreferencesRemoteUIDelegate objectModelDidChange:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s, current delegate %@", (uint8_t *)&v7, 0x16u);
  }
  [(ICQPreferencesRemoteUIDelegate *)self _processObjectModel:v4];
}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    __int16 v9 = "-[ICQPreferencesRemoteUIDelegate objectModel:configureTableRow:page:]";
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(ICQPreferencesRemoteUIDelegate *)self _processTableRow:v6];
}

- (void)_processObjectModel:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 subElementWithID:@"substituteRowSection"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(v4, "rows", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICQPreferencesRemoteUIDelegate *)self _processTableRow:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_processTableRow:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 attributes];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"hasSubstitutions"];
  if (([v6 BOOLValue] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v4 attributes];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"index"];
  int v9 = [v8 intValue];
  long long v10 = [(ICQPreferencesRemoteUIDelegate *)self dataclassSubstitutions];
  unint64_t v11 = [v10 count];

  if (v11 > v9)
  {
    long long v12 = [v4 attributes];
    id v5 = (void *)[v12 mutableCopy];

    long long v13 = [(ICQPreferencesRemoteUIDelegate *)self dataclassSubstitutions];
    int v14 = [v4 attributes];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"index"];
    unsigned int v16 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v15, "intValue"));

    os_signpost_id_t v17 = (void *)MEMORY[0x263F23150];
    v21[0] = v16;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    int v19 = [v17 localizedTextForDataclasses:v18 usedAtBeginningOfSentence:1 forAccount:0];
    [v5 setObject:v19 forKeyedSubscript:@"label"];

    v20 = objc_msgSend(MEMORY[0x263F5FC40], "acui_iconForDataclass:", v16);
    [v4 setImage:v20];

    [v4 setAttributes:v5];
LABEL_5:
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return MEMORY[0x270F55308](self, a2);
}

- (void)_reloadQuotaInfo
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) lastObject];
  BOOL v3 = [v2 defaultPages];
  id v4 = [v3 lastObject];

  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke_cold_1((uint64_t)v1, v5);
  }

  uint64_t v6 = [*((id *)*v1 + 1) topViewController];

  uint64_t v7 = ICQUSLogForCategory(0);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4 == v6)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "reloading manage storage pane", buf, 2u);
    }

    uint64_t v7 = +[ICQCloudStorageInfo backupInfoHeadersForAccount:*((void *)*v1 + 14)];
    [*v1 reloadTopControllerWithAdditionalHeaders:v7];
  }
  else if (v8)
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "not reloading manage storage pane since it's not on top", v9, 2u);
  }
}

- (void)buyFlowCompletionDidSucceed:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = ICQUSLogForCategory(0);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "buy storage successful; refreshing manage storage pane",
        (uint8_t *)&v9,
        2u);
    }

    [(ICQPreferencesRemoteUIDelegate *)self _reloadQuotaInfo];
    [(ICQPreferencesRemoteUIDelegate *)self _postQuotaDidChangeNotification];
  }
  else
  {
    if (v8)
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "buy storage failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 scheme];
  if ([v4 containsString:@"prefs"])
  {
  }
  else
  {
    id v5 = [v3 scheme];
    int v6 = [v5 isEqualToString:@"ams-ui"];

    if (!v6)
    {
      BOOL v8 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v7 = [MEMORY[0x263F01880] defaultWorkspace];
  [v7 openSensitiveURL:v3 withOptions:0];

  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (void)_presentCloudStorageOffersFlowWithAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v17 = 0;
  }

  id v9 = objc_alloc_init(MEMORY[0x263F25D70]);
  id v10 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
  modalNavigationController = self->_modalNavigationController;
  self->_modalNavigationController = v10;

  [(UINavigationController *)self->_modalNavigationController setModalPresentationStyle:2];
  [(UINavigationController *)self->_modalNavigationController setModalTransitionStyle:0];
  [(UINavigationController *)self->_navigationController presentViewController:self->_modalNavigationController animated:1 completion:0];
  long long v12 = (void *)[v7 copy];

  id storageOffersFlowCompletion = self->_storageOffersFlowCompletion;
  self->_id storageOffersFlowCompletion = v12;

  storageOffersManager = self->_storageOffersManager;
  if (!storageOffersManager)
  {
    uint64_t v15 = objc_alloc_init(ICQUICloudStorageOffersManager);
    unsigned int v16 = self->_storageOffersManager;
    self->_storageOffersManager = v15;

    [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setDelegate:self];
    storageOffersManager = self->_storageOffersManager;
  }
  [(ICQUICloudStorageOffersManager *)storageOffersManager setShouldOfferDeviceOffers:*MEMORY[0x263F5FEC8] == (void)v6];
  [(ICQUICloudStorageOffersManager *)self->_storageOffersManager beginFlowWithNavigationController:self->_modalNavigationController modally:0];
}

- (void)_activateBackupsElementForObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch backup page", (uint8_t *)&v13, 2u);
  }

  BOOL v8 = [v5 identifier];

  if (v8) {
    id v9 = @"backups";
  }
  else {
    id v9 = @"currentDeviceBackUp";
  }
  id v10 = [v5 subElementWithID:v9];
  uint64_t v11 = ICQUSLogForCategory(0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v13 = 138412290;
      int v14 = v10;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "found element - activating %@", (uint8_t *)&v13, 0xCu);
    }

    [v5 activateElement:v10 completion:v6];
  }
  else
  {
    if (v12)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Unable to launch backup page - element is nil", (uint8_t *)&v13, 2u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_activatePhotosElementForObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch photos page", (uint8_t *)&v11, 2u);
  }

  BOOL v8 = [v5 subElementWithID:@"photos"];
  id v9 = ICQUSLogForCategory(0);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v11 = 138412290;
      BOOL v12 = v8;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "found element - activating %@", (uint8_t *)&v11, 0xCu);
    }

    [v5 activateElement:v8 completion:v6];
  }
  else
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Unable to launch photos page - element is nil", (uint8_t *)&v11, 2u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_freshmintStorageUpgradeWithCompletion:(id)a3 withURL:(id)a4
{
  if (self->_icqAction == 121)
  {
    self->_icqAction = 0;
    uint64_t v6 = 121;
  }
  else
  {
    uint64_t v6 = 120;
  }
  id v7 = (objc_class *)MEMORY[0x263F88908];
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)[[v7 alloc] initWithAction:v6 url:v8];

  [(ICQPreferencesRemoteUIDelegate *)self _freshmintStorageUpgradeWithICQLink:v10 completion:v9];
}

- (void)_freshmintStorageUpgradeWithICQLink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v8 = [(UINavigationController *)self->_navigationController topViewController];
  id v9 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Request for Freshmint storage offer", buf, 2u);
  }

  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke;
  block[3] = &unk_264922F30;
  id v25 = &v27;
  block[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v7;
  id v24 = v12;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
  v28[3] = 1;
  uint64_t v13 = [MEMORY[0x263F88928] sharedOfferManager];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_284;
  v17[3] = &unk_264922F80;
  char v21 = &v27;
  v17[4] = self;
  id v14 = v11;
  id v18 = v14;
  id v15 = v6;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  [v13 getOfferWithCompletion:v17];

  _Block_object_dispose(&v27, 8);
}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(void *)(v1 + 24) != 2)
  {
    *(void *)(v1 + 24) = 3;
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) topViewController];
    BOOL v4 = *(void **)(a1 + 40);

    id v5 = ICQUSLogForCategory(0);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3 == v4)
    {
      if (v6)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Timeout fetching Freshmint offer; presenting legacy offer",
          buf,
          2u);
      }

      [*(id *)(a1 + 32) _presentCloudStorageOffersFlowWithAction:*MEMORY[0x263F5FEC0] completion:*(void *)(a1 + 48)];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Timeout fetching Freshmint offer, but not presenting legacy offer since user navigated away", v7, 2u);
      }
    }
  }
}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_284(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_2;
  v7[3] = &unk_264922F58;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 64);
  v7[4] = v4;
  id v8 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = *(void *)(a1[9] + 8);
  if (*(void *)(v1 + 24) != 3)
  {
    *(void *)(v1 + 24) = 2;
    id v3 = [*(id *)(a1[4] + 8) topViewController];
    uint64_t v4 = (void *)a1[5];

    if (v3 == v4)
    {
      [*(id *)(a1[4] + 200) setOffer:a1[6]];
      objc_msgSend(*(id *)(a1[4] + 200), "setDelegate:");
      uint64_t v6 = a1[5];
      id v7 = *(void **)(a1[4] + 200);
      uint64_t v8 = a1[7];
      uint64_t v9 = a1[8];
      [v7 beginFlowWithICQLink:v8 presenter:v6 completion:v9];
    }
    else
    {
      id v5 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Freshmint storage offer not presented since user navigated away", v10, 2u);
      }
    }
  }
}

+ (id)afuiSettingsSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SIRI_LABEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v6 = (void *)getAFUICloudStorageViewControllerClass_softClass;
  uint64_t v14 = getAFUICloudStorageViewControllerClass_softClass;
  if (!getAFUICloudStorageViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getAFUICloudStorageViewControllerClass_block_invoke;
    v10[3] = &unk_264921E58;
    v10[4] = &v11;
    __getAFUICloudStorageViewControllerClass_block_invoke((uint64_t)v10);
    uint64_t v6 = (void *)v12[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);
  uint64_t v8 = [v3 preferenceSpecifierNamed:v5 target:a1 set:0 get:0 detail:v7 cell:1 edit:0];

  return v8;
}

+ (id)healthSettingsSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"HEALTH_LABEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v6 = (void *)getHKHealthManageStorageViewControllerClass_softClass;
  uint64_t v14 = getHKHealthManageStorageViewControllerClass_softClass;
  if (!getHKHealthManageStorageViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getHKHealthManageStorageViewControllerClass_block_invoke;
    v10[3] = &unk_264921E58;
    v10[4] = &v11;
    __getHKHealthManageStorageViewControllerClass_block_invoke((uint64_t)v10);
    uint64_t v6 = (void *)v12[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);
  uint64_t v8 = [v3 preferenceSpecifierNamed:v5 target:a1 set:0 get:0 detail:v7 cell:1 edit:0];

  return v8;
}

+ (id)messagesSettingsSpecifier
{
  [a1 _loadCKStoragePluginSettingsBundleIfNeeded];
  Class v2 = NSClassFromString(&cfstr_Ckcloudmessage.isa);
  return (id)[(objc_class *)v2 specifier];
}

- (void)_postQuotaDidChangeNotification
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Class v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = @"QuotaDidChange";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "ICQPreferencesRemoteUIDelegate posting %@ notification.", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"QuotaDidChange" object:0];
}

- (void)managerDidCancel:(id)a3
{
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did cancel.", v7, 2u);
  }

  if (self->_storageOffersFlowCompletion)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Preferences.cloud-storage-offers" code:1 userInfo:0];
    (*((void (**)(void))self->_storageOffersFlowCompletion + 2))();
    id storageOffersFlowCompletion = self->_storageOffersFlowCompletion;
    self->_id storageOffersFlowCompletion = 0;
  }
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did complete with error: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  id storageOffersFlowCompletion = (void (**)(id, BOOL, id))self->_storageOffersFlowCompletion;
  if (storageOffersFlowCompletion)
  {
    if (v5)
    {
      uint64_t v8 = [v5 domain];
      if ([v8 isEqualToString:@"com.apple.Preferences.cloud-storage-offers"]) {
        BOOL v9 = [v5 code] == 2;
      }
      else {
        BOOL v9 = 0;
      }

      id storageOffersFlowCompletion = (void (**)(id, BOOL, id))self->_storageOffersFlowCompletion;
    }
    else
    {
      BOOL v9 = 1;
    }
    storageOffersFlowCompletion[2](storageOffersFlowCompletion, v9, v5);
    id v10 = self->_storageOffersFlowCompletion;
    self->_id storageOffersFlowCompletion = 0;
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v3 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Freshmint upgradeFlowManagerDidCancel:", v4, 2u);
  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  int v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint upgradeFlowManagerDidComplete:", v5, 2u);
  }

  [(ICQPreferencesRemoteUIDelegate *)self _reloadQuotaInfo];
  [(ICQPreferencesRemoteUIDelegate *)self _postQuotaDidChangeNotification];
}

+ (void)_loadCKStoragePluginSettingsBundleIfNeeded
{
  Class v2 = MEMORY[0x230F70320](a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/StoragePlugins"];

  int v4 = [v3 stringByAppendingPathComponent:@"CKStoragePlugin.bundle"];
  id v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    uint64_t v6 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "CKStoragePlugin settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (void)beginLegacyFlow
{
  uint64_t v2 = *MEMORY[0x263F5FEC0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__ICQPreferencesRemoteUIDelegate_beginLegacyFlow__block_invoke;
  v3[3] = &unk_264921C58;
  v3[4] = self;
  [(ICQPreferencesRemoteUIDelegate *)self _presentCloudStorageOffersFlowWithAction:v2 completion:v3];
}

uint64_t __49__ICQPreferencesRemoteUIDelegate_beginLegacyFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) buyFlowCompletionDidSucceed:a2 error:a3];
}

- (DelayedPushDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DelayedPushDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)initialAction
{
  return self->_initialAction;
}

- (void)setInitialAction:(id)a3
{
}

- (NSArray)dataclassSubstitutions
{
  return self->_dataclassSubstitutions;
}

- (void)setDataclassSubstitutions:(id)a3
{
}

- (BOOL)isManageStorage
{
  return self->_isManageStorage;
}

- (void)setIsManageStorage:(BOOL)a3
{
  self->_isManageStorage = a3;
}

- (BOOL)isNativeManageStorage
{
  return self->_isNativeManageStorage;
}

- (void)setIsNativeManageStorage:(BOOL)a3
{
  self->_isNativeManageStorage = a3;
}

- (NSString)nextSignpostId
{
  return self->_nextSignpostId;
}

- (void)setNextSignpostId:(id)a3
{
}

- (RUILoader)lastDocumentDeleteLoader
{
  return (RUILoader *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastDocumentDeleteLoader:(id)a3
{
}

- (ICQPreferencesFreshmintManager)freshmintManager
{
  return self->_freshmintManager;
}

- (void)setFreshmintManager:(id)a3
{
}

- (ICQUIPreferencesLiftUIDelegate)liftUIDelegate
{
  return self->_liftUIDelegate;
}

- (void)setLiftUIDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIDelegate, 0);
  objc_storeStrong((id *)&self->_freshmintManager, 0);
  objc_storeStrong((id *)&self->_lastDocumentDeleteLoader, 0);
  objc_storeStrong((id *)&self->_nextSignpostId, 0);
  objc_storeStrong((id *)&self->_dataclassSubstitutions, 0);
  objc_storeStrong((id *)&self->_initialAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_linkCompletionBlock, 0);
  objc_storeStrong((id *)&self->_requestContentType, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_deleteLoaders, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong(&self->_storageOffersFlowCompletion, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)loadURL:(unsigned __int16)a1 postBody:(NSObject *)a2 additionalHeaders:.cold.1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: iOSManageStorageLoad  enableTelemetry=YES ", (uint8_t *)v2, 8u);
}

- (void)loadURL:(unsigned __int16)a1 postBody:(NSObject *)a2 additionalHeaders:.cold.2(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: iOSManageStorageDrilldownLoad  enableTelemetry=YES ", (uint8_t *)v2, 8u);
}

- (void)_popObjectModelAnimated:.cold.1()
{
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) iOSManageStorageLoad ", v1, 0x12u);
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) iOSManageStorageDrilldownLoad ", v1, 0x12u);
}

void __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(*(void *)a1 + 8) topViewController];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "[_navigationController topViewController]: %@", (uint8_t *)&v4, 0xCu);
}

@end