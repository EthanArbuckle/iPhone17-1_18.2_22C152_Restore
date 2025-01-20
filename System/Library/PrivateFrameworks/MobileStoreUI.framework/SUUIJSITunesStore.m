@interface SUUIJSITunesStore
- (BOOL)areVideosCloudPurchasesEnabled;
- (BOOL)isAppPreview;
- (BOOL)resourceExists:(id)a3;
- (BOOL)sendAppPreviewStateChanged:(BOOL)a3;
- (BOOL)sendOnShowPageEventType:(id)a3 data:(id)a4;
- (BOOL)sendOnXEventWithDictionary:(id)a3;
- (NSString)hostApp;
- (SUUIJSAppleAccount)primaryAppleAccount;
- (SUUIJSITunesStore)initWithAppContext:(id)a3 clientContext:(id)a4;
- (SUUIJSRestrictions)restrictions;
- (id)_millisecondsFromTimeInterval:(double)a3;
- (id)_rentalInfoFromMediaItems:(id)a3;
- (id)documentSizeForNavigationDocument:(id)a3;
- (int64_t)applicationIconBadgeNumber;
- (void)_displayWifiConnectionRequiredAlert;
- (void)_finishPurchaseForOptions:(id)a3 purchaseResponse:(id)a4;
- (void)_finishSoftwarePurchaseForOptions:(id)a3 purchaseResponse:(id)a4;
- (void)_purchaseRequestDidSucceedNotification:(id)a3;
- (void)approveInPerson:(id)a3 :(id)a4;
- (void)attemptLocalAskToBuyApproval:(id)a3;
- (void)buy:(id)a3;
- (void)clearToggleStateItems;
- (void)dealloc;
- (void)download:(id)a3;
- (void)downloadExistsFor:(id)a3 :(id)a4;
- (void)exit:(id)a3;
- (void)fetchMSOProviderStatus:(id)a3;
- (void)fetchTemplates:(id)a3 :(id)a4;
- (void)findApps:(id)a3 :(id)a4 :(id)a5;
- (void)findLibraryItems:(id)a3 :(id)a4 :(id)a5;
- (void)findOwnedItems:(id)a3 :(id)a4;
- (void)findToggleStateForItem:(id)a3 :(id)a4;
- (void)getAdminStatus:(id)a3 :(id)a4;
- (void)getBookSample:(id)a3;
- (void)getProfilePermissions:(id)a3 :(id)a4;
- (void)headsUp:(id)a3 :(id)a4;
- (void)isInstalledApp:(id)a3 :(id)a4;
- (void)isRemovedSystemApp:(id)a3 :(id)a4;
- (void)itemStateCenterMediaLibrariesDidChange:(id)a3;
- (void)launchICloudFamilySettings;
- (void)loadGratisContent:(id)a3;
- (void)loadRental:(id)a3 :(id)a4;
- (void)loadRentals:(id)a3;
- (void)log:(id)a3;
- (void)resetStateForActiveDocument;
- (void)restoreRemovedSystemApp:(id)a3 :(id)a4;
- (void)sendApplicationDidEnterBackground;
- (void)sendApplicationWillEnterForeground;
- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3;
- (void)sendOnNavigationStackWillPop:(BOOL)a3;
- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6;
- (void)setApplicationIconBadgeNumber:(int64_t)a3;
- (void)setPreviewOverlay:(id)a3 :(id)a4;
- (void)updateToggleStateForItem:(id)a3 toggled:(BOOL)a4 :(id)a5;
@end

@implementation SUUIJSITunesStore

- (SUUIJSITunesStore)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIJSITunesStore;
  v8 = [(IKJSITunesStore *)&v14 initWithAppContext:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = +[SUUIItemStateCenter defaultCenter];
    [v10 addObserver:v9];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v9 selector:sel__purchaseRequestDidSucceedNotification_ name:0x2704FB610 object:0];

    uint64_t v12 = SUUIMediaPlayerFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, v12), "setFilteringDisabled:", 1);
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[SUUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:0x2704FB610 object:0];

  v5.receiver = self;
  v5.super_class = (Class)SUUIJSITunesStore;
  [(IKJSITunesStore *)&v5 dealloc];
}

- (void)sendApplicationDidEnterBackground
{
  id v2 = [(IKJSObject *)self invokeMethod:@"applicationDidEnterBackground" withArguments:0];
}

- (void)sendApplicationWillEnterForeground
{
  id v2 = [(IKJSObject *)self invokeMethod:@"applicationWillEnterForeground" withArguments:0];
}

- (void)sendOnNavigationStackWillPop:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"isInteractive";
  v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  objc_super v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v8 = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  id v7 = [(IKJSObject *)self invokeMethod:@"onNavigationStackWillPop" withArguments:v6];
}

- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  v20[2] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_super v14 = [SUUIJSFakeXMLHTTPRequest alloc];
  v15 = [(IKJSObject *)self appContext];
  v16 = [(SUUIJSFakeXMLHTTPRequest *)v14 initWithAppContext:v15 data:v12 URLResponse:v11 performanceMetrics:v10];

  v17 = [v13 valueForKey:@"jsDocument"];

  if (!v17)
  {
    v17 = [MEMORY[0x263EFF9D0] null];
  }
  v20[0] = v17;
  v20[1] = v16;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v19 = [(IKJSObject *)self invokeMethod:@"onPageResponse" withArguments:v18];
}

- (BOOL)sendOnXEventWithDictionary:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F10390];
  id v5 = a3;
  v6 = [(IKJSObject *)self appContext];
  id v7 = [v6 jsContext];
  v8 = [v4 valueWithObject:self inContext:v7];

  LOBYTE(v4) = [v8 hasProperty:@"onXEvent"];
  v12[0] = v5;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  id v10 = [(IKJSObject *)self invokeMethod:@"onXEvent" withArguments:v9];
  return (char)v4;
}

- (BOOL)sendAppPreviewStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v16[1] = *MEMORY[0x263EF8340];
  self->_isAppPreview = a3;
  id v5 = (void *)MEMORY[0x263F10390];
  v6 = [(IKJSObject *)self appContext];
  id v7 = [v6 jsContext];
  v8 = [v5 valueWithObject:self inContext:v7];

  LOBYTE(v6) = [v8 hasProperty:@"onAppPreviewStateChanged"];
  v15 = @"isPreview";
  v9 = [NSNumber numberWithBool:v3];
  v16[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  objc_super v14 = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v12 = [(IKJSObject *)self invokeMethod:@"onAppPreviewStateChanged" withArguments:v11];

  return (char)v6;
}

- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(NSDictionary, "su_dictionaryWithSize:", a3.width, a3.height);
  v7[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v6 = [(IKJSObject *)self invokeMethod:@"onWindowSizeDidUpdate" withArguments:v5];
}

- (BOOL)sendOnShowPageEventType:(id)a3 data:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F10390];
  v9 = [(IKJSObject *)self appContext];
  id v10 = [v9 jsContext];
  id v11 = [v8 valueWithObject:self inContext:v10];

  char v12 = [v11 hasProperty:@"onShowPage"];
  id v19 = @"type";
  v20[0] = v6;
  id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  objc_super v14 = (void *)[v13 mutableCopy];

  if (v7) {
    [v14 setObject:v7 forKeyedSubscript:@"data"];
  }
  v18 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  id v16 = [(IKJSObject *)self invokeMethod:@"onShowPage" withArguments:v15];

  return v12;
}

- (int64_t)applicationIconBadgeNumber
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUUIJSITunesStore_applicationIconBadgeNumber__block_invoke;
  block[3] = &unk_265405DA0;
  block[4] = &v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __47__SUUIJSITunesStore_applicationIconBadgeNumber__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 applicationIconBadgeNumber];
}

- (BOOL)areVideosCloudPurchasesEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"VideosShowCloudMediaEnabledSetting", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)attemptLocalAskToBuyApproval:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SUUIAskPermissionFramework();
  id v5 = SUUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v4);
  id v6 = (void *)SUUIAskPermissionFramework();
  objc_msgSend(v5, "_requestQueueForIdentifier:", *(void *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v3 longLongValue];

  [v8 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v7 completionHandler:0];
}

- (void)buy:(id)a3
{
  id v4 = a3;
  id v5 = [[SUUIItem alloc] initWithLookupDictionary:v4];
  id v6 = [(SUUIItem *)v5 primaryItemOffer];
  uint64_t v7 = [v6 actionParameters];
  if (v7)
  {
    objc_initWeak(&location, self);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    if (SUUIItemKindIsToneKind([(SUUIItem *)v5 itemKind]))
    {
      id v8 = [(IKJSObject *)self appContext];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __25__SUUIJSITunesStore_buy___block_invoke;
      v18[3] = &unk_265406520;
      id v19 = v5;
      v20 = self;
      objc_copyWeak(&v23, &location);
      id v21 = v4;
      v22 = &v24;
      [v8 evaluateDelegateBlockSync:v18];

      objc_destroyWeak(&v23);
    }
    if (*((unsigned char *)v25 + 24))
    {
      if (SUUIItemStateCenterUseAppstoredPurchases(v5))
      {
        v9 = +[SUUIItemStateCenter defaultCenter];
        clientContext = self->_clientContext;
        id v11 = v16;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        void v16[2] = __25__SUUIJSITunesStore_buy___block_invoke_3;
        v16[3] = &unk_265406548;
        char v12 = &v17;
        objc_copyWeak(&v17, &location);
        v16[4] = v4;
        [v9 purchaseSoftwareItem:v5 offer:v6 clientContext:clientContext completionBlock:v16];
      }
      else
      {
        v9 = +[SUUIItemStateCenter defaultCenter];
        id v13 = self->_clientContext;
        id v11 = v14;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __25__SUUIJSITunesStore_buy___block_invoke_4;
        v14[3] = &unk_2654064F8;
        char v12 = &v15;
        objc_copyWeak(&v15, &location);
        v14[4] = v4;
        [v9 purchaseItem:v5 offer:v6 clientContext:v13 completionBlock:v14];
      }

      objc_destroyWeak(v12);
    }
    _Block_object_dispose(&v24, 8);
    objc_destroyWeak(&location);
  }
}

void __25__SUUIJSITunesStore_buy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 presentationViewControllerForAppContext:v3];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [[SUUITonePurchaseController alloc] initWithItem:*(void *)(a1 + 32)];
      [(SUUITonePurchaseController *)v7 setClientContext:*(void *)(*(void *)(a1 + 40) + 96)];
      [(SUUITonePurchaseController *)v7 setParentViewController:v6];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __25__SUUIJSITunesStore_buy___block_invoke_2;
      v8[3] = &unk_2654064F8;
      objc_copyWeak(&v10, (id *)(a1 + 64));
      id v9 = *(id *)(a1 + 48);
      [(SUUITonePurchaseController *)v7 showPurchaseFlowWithCompletionBlock:v8];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;

      objc_destroyWeak(&v10);
    }
  }
}

void __25__SUUIJSITunesStore_buy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _finishPurchaseForOptions:*(void *)(a1 + 32) purchaseResponse:v4];
}

void __25__SUUIJSITunesStore_buy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _finishSoftwarePurchaseForOptions:*(void *)(a1 + 32) purchaseResponse:v4];
}

void __25__SUUIJSITunesStore_buy___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _finishPurchaseForOptions:*(void *)(a1 + 32) purchaseResponse:v4];
}

- (void)approveInPerson:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  id v9 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v10 = [v7 context];

  id v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  uint64_t v12 = SUUIAskPermissionFramework();
  id v13 = SUUIWeakLinkedClassForString(&cfstr_Prrequestqueue.isa, v12);
  objc_super v14 = (void *)SUUIAskPermissionFramework();
  id v15 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v14);
  id v16 = [v13 _requestQueueForIdentifier:v15];
  uint64_t v17 = [v6 longLongValue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __38__SUUIJSITunesStore_approveInPerson::__block_invoke;
  v22[3] = &unk_265406598;
  id v23 = v8;
  id v24 = v9;
  id v25 = v6;
  id v26 = v11;
  char v27 = self;
  id v18 = v11;
  id v19 = v6;
  id v20 = v9;
  id v21 = v8;
  [v16 _attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:v17 completionHandler:v22];
}

void __38__SUUIJSITunesStore_approveInPerson::__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SUUIJSITunesStore_approveInPerson::__block_invoke_2;
  v8[3] = &unk_265406570;
  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v13 = a3;
  id v10 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  [v5 evaluate:v8 completionBlock:0];
}

void __38__SUUIJSITunesStore_approveInPerson::__block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64), @"status");
  v7[1] = @"adamId";
  v8[0] = v3;
  v8[1] = *(void *)(a1 + 40);
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v6 = (id)[v2 callWithArguments:v5];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)clearToggleStateItems
{
  id v2 = +[SUUIToggleStateCenter defaultCenter];
  [v2 clearAll];
}

- (void)download:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F7B190];
  id v4 = a3;
  id v8 = (id)[[v3 alloc] initWithDictionary:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F7B168]) initWithDownloadMetadata:v8];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v5, 0);
  if ([v6 count])
  {
    uint64_t v7 = +[SUUIItemStateCenter defaultCenter];
    [v7 addDownloads:v6];
  }
}

- (void)downloadExistsFor:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  id v9 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v10 = [v7 context];
  id v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  uint64_t v12 = (void *)[v6 longLongValue];
  objc_initWeak(&location, self);
  char v13 = [MEMORY[0x263F7B178] IPodDownloadManager];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke;
  v17[3] = &unk_2654065E8;
  objc_copyWeak(v21, &location);
  v21[1] = v12;
  id v14 = v8;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  [v13 getDownloadsUsingBlock:v17];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_2;
  v16[3] = &unk_2654065C0;
  uint64_t v5 = *(void *)(a1 + 64);
  v16[4] = &v17;
  void v16[5] = v5;
  [v3 enumerateObjectsUsingBlock:v16];
  id v21 = @"exists";
  id v6 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
  v22[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_3;
  v11[3] = &unk_265405580;
  id v8 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v9 = v7;
  id v13 = v9;
  id v14 = *(id *)(a1 + 48);
  id v10 = WeakRetained;
  id v15 = v10;
  [v8 evaluate:v11 completionBlock:0];

  _Block_object_dispose(&v17, 8);
}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v8 valueForProperty:*MEMORY[0x263F7B6D8]];
    uint64_t v7 = [v6 longLongValue];

    if (*(void *)(a1 + 40) == v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __40__SUUIJSITunesStore_downloadExistsFor::__block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)exit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __26__SUUIJSITunesStore_exit___block_invoke;
  v7[3] = &unk_265405558;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluateDelegateBlockSync:v7];
}

void __26__SUUIJSITunesStore_exit___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 appContext:v4 didExitWithOptions:*(void *)(a1 + 32)];
  }
}

- (void)findApps:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IKJSObject *)self appContext];
  id v10 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v11 = [v7 context];

  id v12 = [v11 virtualMachine];

  [v12 addManagedReference:v10 withOwner:self];
  id v13 = objc_alloc_init(MEMORY[0x263F7B330]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __32__SUUIJSITunesStore_findApps_::__block_invoke;
  v17[3] = &unk_265406610;
  id v18 = v9;
  id v19 = v10;
  id v20 = v12;
  id v21 = self;
  id v14 = v12;
  id v15 = v10;
  id v16 = v9;
  [v13 getLibraryItemForBundleIdentifiers:v8 completionBlock:v17];
}

void __32__SUUIJSITunesStore_findApps_::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v25 = a3;
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    uint64_t v9 = *MEMORY[0x263F7BC80];
    uint64_t v26 = *(void *)v35;
    uint64_t v27 = *MEMORY[0x263F7BCA0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x25A2A9B80]();
        id v13 = [v11 valueForProperty:v9];
        if (v13 && ([v11 isPlaceholder] & 1) == 0 && (objc_msgSend(v11, "isBeta") & 1) == 0)
        {
          id v14 = [[SUUILibraryItemState alloc] initWithApplication:v11];
          id v15 = [(SUUILibraryItemState *)v14 newJavaScriptRepresentation];
          id v16 = [v11 valueForProperty:v27];
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 stringValue];
            id v19 = v18 = v5;
            [v15 setObject:v19 forKey:0x2704FC590];

            id v5 = v18;
            uint64_t v8 = v26;
          }
          objc_msgSend(v28, "setObject:forKey:", v15, v13, v24, v25);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __32__SUUIJSITunesStore_findApps_::__block_invoke_2;
  v29[3] = &unk_265405580;
  id v20 = *(void **)(v24 + 32);
  id v30 = *(id *)(v24 + 40);
  id v31 = v28;
  id v21 = *(id *)(v24 + 48);
  uint64_t v22 = *(void *)(v24 + 56);
  id v32 = v21;
  uint64_t v33 = v22;
  id v23 = v28;
  [v20 evaluate:v29 completionBlock:0];
}

void __32__SUUIJSITunesStore_findApps_::__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)findLibraryItems:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IKJSObject *)self appContext];
  id v12 = [MEMORY[0x263F10388] managedValueWithValue:v9];
  id v13 = [v9 context];

  id v14 = [v13 virtualMachine];

  [v14 addManagedReference:v12 withOwner:self];
  id v15 = +[SUUIItemStateCenter defaultCenter];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke;
  v19[3] = &unk_265406638;
  id v20 = v11;
  id v21 = v12;
  id v22 = v14;
  id v23 = self;
  id v16 = v14;
  id v17 = v12;
  id v18 = v11;
  [v15 findLibraryItemsForContentIdentifiers:v10 options:v8 completionBlock:v19];
}

void __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke_2;
  v8[3] = &unk_265405580;
  id v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  [v4 evaluate:v8 completionBlock:0];
}

void __40__SUUIJSITunesStore_findLibraryItems_::__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)findOwnedItems:(id)a3 :(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = [(IKJSObject *)self appContext];
  uint64_t v8 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v28 = v7;
  id v9 = [v7 context];
  id v10 = [v9 virtualMachine];

  uint64_t v24 = v10;
  id v25 = (void *)v8;
  uint64_t v26 = self;
  [v10 addManagedReference:v8 withOwner:self];
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v15, "longLongValue"));
        }
        id v17 = v16;
        id v18 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", [v16 longLongValue]);
        if (v18)
        {
          id v19 = +[SUUIItemStateCenter defaultCenter];
          id v20 = [v19 stateForItemWithStoreIdentifier:v18];

          if (([v20 state] & 8) != 0) {
            [v29 addObject:v15];
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __37__SUUIJSITunesStore_findOwnedItems::__block_invoke;
  v31[3] = &unk_265405580;
  id v32 = v25;
  id v33 = v29;
  id v34 = v24;
  long long v35 = v26;
  id v21 = v24;
  id v22 = v29;
  id v23 = v25;
  [v27 evaluate:v31 completionBlock:0];
}

void __37__SUUIJSITunesStore_findOwnedItems::__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)findToggleStateForItem:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [(IKJSObject *)self appContext];
    id v9 = [MEMORY[0x263F10388] managedValueWithValue:v7];
    id v10 = [v7 context];
    uint64_t v11 = [v10 virtualMachine];

    [v11 addManagedReference:v9 withOwner:self];
    uint64_t v12 = +[SUUIToggleStateCenter defaultCenter];
    uint64_t v13 = [v12 itemForIdentifier:v6];

    LODWORD(v12) = [v13 toggled];
    uint64_t v14 = objc_opt_new();
    [v14 setValue:v6 forKey:@"itemID"];
    if (v12 == 1) {
      uint64_t v15 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v15 = MEMORY[0x263EFFA80];
    }
    [v14 setValue:v15 forKey:@"toggled"];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__SUUIJSITunesStore_findToggleStateForItem::__block_invoke;
    v19[3] = &unk_265405580;
    id v20 = v9;
    id v21 = v14;
    id v22 = v11;
    id v23 = self;
    id v16 = v11;
    id v17 = v14;
    id v18 = v9;
    [v8 evaluate:v19 completionBlock:0];
  }
}

void __45__SUUIJSITunesStore_findToggleStateForItem::__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)getBookSample:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F7B190];
  id v4 = a3;
  id v7 = (id)[[v3 alloc] initWithDictionary:v4];

  id v5 = [v7 primaryAssetURL];
  if (v5)
  {
    id v6 = +[SUUIItemStateCenter defaultCenter];
    [v6 addManifestDownloadWithURL:v5 placeholderMetadata:v7];
  }
}

- (void)getAdminStatus:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F10388];
  id v8 = a4;
  id v9 = [v7 managedValueWithValue:v8];
  id v10 = [v8 context];

  uint64_t v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v13 = [v6 objectForKey:@"ignoreCache"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 BOOLValue]) {
    [v12 setObject:MEMORY[0x263EFFA88] forKey:@"SUUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  }
  uint64_t v14 = [(IKJSObject *)self appContext];
  uint64_t v15 = +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __37__SUUIJSITunesStore_getAdminStatus::__block_invoke;
  v19[3] = &unk_265403438;
  id v20 = v14;
  id v21 = v9;
  id v22 = v11;
  id v23 = self;
  id v16 = v11;
  id v17 = v9;
  id v18 = v14;
  [v15 getAdminStatusWithOptions:v6 resultBlock:v19];
}

void __37__SUUIJSITunesStore_getAdminStatus::__block_invoke(uint64_t a1, char a2, void *a3)
{
  if (a3)
  {
    id v5 = [a3 userInfo];
    id v6 = [v5 objectForKey:*MEMORY[0x263F7B760]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)([v6 integerValue] - 500) <= 0x62)
    {
      id v7 = +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
      id v8 = [v7 lastKnownAdminStatus];

      if (v8) {
        a2 = [v8 BOOLValue];
      }
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __37__SUUIJSITunesStore_getAdminStatus::__block_invoke_2;
  v12[3] = &unk_265403410;
  id v9 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  char v16 = a2;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v14 = v10;
  uint64_t v15 = v11;
  [v9 evaluate:v12 completionBlock:0];
}

uint64_t __37__SUUIJSITunesStore_getAdminStatus::__block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  uint64_t v3 = MEMORY[0x263EFFA88];
  if (!*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = MEMORY[0x263EFFA80];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  return [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (NSString)hostApp
{
  if ([(SUUIClientContext *)self->_clientContext conformsToProtocol:&unk_2706A78C0])
  {
    uint64_t v3 = [(SUUIClientContext *)self->_clientContext hostApplicationIdentifier];
    id v4 = (void *)[v3 copy];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isAppPreview
{
  return self->_isAppPreview;
}

- (id)documentSizeForNavigationDocument:(id)a3
{
  clientContext = self->_clientContext;
  id v4 = a3;
  id v5 = [(SUUIClientContext *)clientContext applicationController];
  [v5 sizeForNavigationDocument:v4];
  double v7 = v6;
  double v9 = v8;

  id v10 = NSDictionary;
  return (id)objc_msgSend(v10, "su_dictionaryWithSize:", v7, v9);
}

- (void)getProfilePermissions:(id)a3 :(id)a4
{
  double v6 = (void *)MEMORY[0x263F10388];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 managedValueWithValue:v7];
  id v10 = [v7 context];

  uint64_t v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = [v8 objectForKey:@"ignoreCache"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 BOOLValue]) {
    [v12 setObject:MEMORY[0x263EFFA88] forKey:@"SUUIMediaSocialAdminPermissionsOptionIgnoreCache"];
  }
  id v14 = [(IKJSObject *)self appContext];
  uint64_t v15 = +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke;
  v19[3] = &unk_265406610;
  id v20 = v14;
  id v21 = v9;
  id v22 = v11;
  id v23 = self;
  id v16 = v11;
  id v17 = v9;
  id v18 = v14;
  [v15 getAuthorsWithOptions:v12 authorsBlock:v19];
}

void __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 userInfo];
    double v9 = [v8 objectForKey:*MEMORY[0x263F7B760]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)([v9 integerValue] - 500) <= 0x62)
    {
      id v10 = +[SUUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
      uint64_t v11 = [v10 lastKnownAuthors];

      id v5 = (id)v11;
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [[SUUIJSMediaSocialAuthor alloc] initWithSUUIMediaSocialAuthor:*(void *)(*((void *)&v28 + 1) + 8 * v17)];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke_2;
  v23[3] = &unk_265405580;
  id v19 = *(void **)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  id v25 = v12;
  id v20 = *(id *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  id v26 = v20;
  uint64_t v27 = v21;
  id v22 = v12;
  [v19 evaluate:v23 completionBlock:0];
}

uint64_t __44__SUUIJSITunesStore_getProfilePermissions::__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v6[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  return [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)isInstalledApp:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IKJSObject *)self appContext];
  double v9 = [MEMORY[0x263F10388] managedValueWithValue:v6];
  id v10 = [v6 context];

  uint64_t v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  uint64_t v12 = [v7 unsignedIntegerValue];

  id v13 = +[SUUIItemStateCenter defaultCenter];
  uint64_t v14 = [v13 stateForItemWithIdentifier:v12];

  if (v14) {
    unint64_t v15 = ((unint64_t)[v14 state] >> 2) & 1;
  }
  else {
    LOBYTE(v15) = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __37__SUUIJSITunesStore_isInstalledApp::__block_invoke;
  v18[3] = &unk_265403410;
  char v22 = v15;
  id v19 = v9;
  id v20 = v11;
  uint64_t v21 = self;
  id v16 = v11;
  id v17 = v9;
  [v8 evaluate:v18 completionBlock:0];
}

void __37__SUUIJSITunesStore_isInstalledApp::__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)isRemovedSystemApp:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  double v9 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v10 = [v7 context];

  uint64_t v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = objc_alloc_init(MEMORY[0x263F7B330]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke;
  v17[3] = &unk_265406660;
  void v17[4] = self;
  id v18 = v6;
  id v19 = v8;
  id v20 = v9;
  id v21 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  id v16 = v6;
  [v12 isRemovedSystemApplicationWithBundleIdentifier:v16 completionBlock:v17];
}

void __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    double v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      int v23 = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v5;
      id v12 = v10;
      LODWORD(v17) = 32;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      double v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v23, v17);
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke_205;
  v18[3] = &unk_265403410;
  id v14 = *(void **)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  char v22 = a2;
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 32);
  id v20 = v15;
  uint64_t v21 = v16;
  [v14 evaluate:v18 completionBlock:0];
}

void __41__SUUIJSITunesStore_isRemovedSystemApp::__block_invoke_205(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)launchICloudFamilySettings
{
  id v2 = [(IKJSObject *)self appContext];
  [v2 evaluateDelegateBlockSync:&__block_literal_global_39];
}

void __47__SUUIJSITunesStore_launchICloudFamilySettings__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v2 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 presentationViewControllerForAppContext:v7];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = SUUIFamilyCircleFramework();
      id v6 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Fafamilysettin.isa, v5));
      if (objc_opt_respondsToSelector())
      {
        [v6 setPresentingViewController:v4];
        [v6 launchiCloudFamilySettings];
      }
    }
  }
}

- (void)loadGratisContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = [MEMORY[0x263F10388] managedValueWithValue:v4];
  id v7 = [v4 context];

  int v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  double v9 = +[SUUIItemStateCenter defaultCenter];
  [v9 reloadGratisEligibilityWithBundleIdentifiers:0 clientContext:self->_clientContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__SUUIJSITunesStore_loadGratisContent___block_invoke;
  v14[3] = &unk_2654066A8;
  id v15 = v9;
  id v16 = v5;
  id v17 = v6;
  id v18 = v8;
  id v19 = self;
  id v10 = v8;
  id v11 = v6;
  id v12 = v5;
  id v13 = v9;
  [v13 finishLoadingWithCompletionBlock:v14];
}

void __39__SUUIJSITunesStore_loadGratisContent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gratisEligibleItemIdentifiers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __39__SUUIJSITunesStore_loadGratisContent___block_invoke_2;
  v7[3] = &unk_265405580;
  uint64_t v3 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v2;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v2;
  [v3 evaluate:v7 completionBlock:0];
}

void __39__SUUIJSITunesStore_loadGratisContent___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)log:(id)a3
{
}

- (void)headsUp:(id)a3 :(id)a4
{
}

- (SUUIJSAppleAccount)primaryAppleAccount
{
  uint64_t v2 = SUUIAccountsFramework();
  id v3 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Acaccountstore.isa, v2));
  id v4 = [SUUIJSAppleAccount alloc];
  uint64_t v5 = objc_msgSend(v3, "aa_primaryAppleAccount");
  id v6 = [(SUUIJSAppleAccount *)v4 initWithACAccount:v5];

  return v6;
}

- (SUUIJSRestrictions)restrictions
{
  id v3 = [SUUIJSRestrictions alloc];
  id v4 = [(IKJSObject *)self appContext];
  uint64_t v5 = [(SUUIJSRestrictions *)v3 initWithAppContext:v4 clientContext:self->_clientContext];

  return v5;
}

- (void)resetStateForActiveDocument
{
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v3 = [(IKJSObject *)self appContext];
  id v4 = [v3 app];
  uint64_t v5 = [v4 activeDocument];
  [v6 postNotificationName:@"SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification" object:v5];
}

- (BOOL)resourceExists:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = (void *)[objc_alloc(NSURL) initWithString:v3];
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = [v4 scheme];
  if ([v5 isEqualToString:@"resource"])
  {
    id v6 = [v4 host];
    BOOL v7 = SUUIImageExistsWithResourceName(v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)restoreRemovedSystemApp:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  id v9 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  id v10 = [v7 context];

  uint64_t v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = objc_alloc_init(MEMORY[0x263F7B330]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke;
  v17[3] = &unk_265406660;
  void v17[4] = self;
  id v18 = v6;
  id v19 = v8;
  id v20 = v9;
  id v21 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  id v16 = v6;
  [v12 restoreRemovedSystemApplicationWithBundleIdentifier:v16 completionBlock:v17];
}

void __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      int v23 = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v5;
      id v12 = v10;
      LODWORD(v17) = 32;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v23, v17);
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_226;
  v18[3] = &unk_265403410;
  id v14 = *(void **)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  char v22 = a2;
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 32);
  id v20 = v15;
  uint64_t v21 = v16;
  [v14 evaluate:v18 completionBlock:0];
}

void __46__SUUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_226(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) value];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)setApplicationIconBadgeNumber:(int64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__SUUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 setApplicationIconBadgeNumber:*(void *)(a1 + 32)];
}

- (void)setPreviewOverlay:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(IKJSObject *)self appContext];
  if (v6
    && [MEMORY[0x263F4B3D8] instancesRespondToSelector:sel_initWithAppContext_document_owner_])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:v8 document:v6 owner:self];
  }
  else
  {
    id v9 = 0;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __40__SUUIJSITunesStore_setPreviewOverlay::__block_invoke;
  v12[3] = &unk_265406430;
  id v13 = v9;
  id v14 = v7;
  id v10 = v7;
  id v11 = v9;
  [v8 evaluateDelegateBlockSync:v12];
}

void __40__SUUIJSITunesStore_setPreviewOverlay::__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 appContext:v4 setPreviewOverlayDocument:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];
  }
}

- (void)updateToggleStateForItem:(id)a3 toggled:(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[SUUIToggleStateCenter defaultCenter];
  id v11 = [v10 itemForIdentifier:v9];
  [v11 setToggled:v5];
  [v10 updateItem:v11];
  id v12 = [(IKJSObject *)self appContext];
  id v13 = [MEMORY[0x263F10388] managedValueWithValue:v8];
  id v14 = [v8 context];

  id v15 = [v14 virtualMachine];

  [v15 addManagedReference:v13 withOwner:self];
  uint64_t v16 = objc_opt_new();
  [v16 setValue:v9 forKey:@"itemID"];

  if (v5) {
    uint64_t v17 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v17 = MEMORY[0x263EFFA80];
  }
  [v16 setValue:v17 forKey:@"toggled"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  id v21[2] = __55__SUUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke;
  v21[3] = &unk_265405580;
  id v22 = v13;
  id v23 = v16;
  id v24 = v15;
  __int16 v25 = self;
  id v18 = v15;
  id v19 = v16;
  id v20 = v13;
  [v12 evaluate:v21 completionBlock:0];
}

void __55__SUUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)loadRentals:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];

  if (v4) {
    [(IKJSObject *)self setJSValue:v4 forProperty:v6];
  }
  id v7 = [(IKJSObject *)self appContext];
  objc_initWeak(&location, v7);

  objc_initWeak(&from, self);
  id v8 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __33__SUUIJSITunesStore_loadRentals___block_invoke;
  v10[3] = &unk_2654066F8;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  id v9 = v6;
  id v11 = v9;
  [v8 addOperationWithBlock:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__SUUIJSITunesStore_loadRentals___block_invoke(id *a1)
{
  uint64_t v2 = SUUIMediaPlayerFramework();
  id v3 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, v2), "movieRentalsQuery");
  id v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalExpirationDate", v4);
  uint64_t v6 = SUUIMediaPlayerFramework();
  id v7 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, v6);
  id v8 = NSNumber;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  id v10 = [v7 predicateWithValue:v9 forProperty:v5 comparisonType:101];
  [v3 addFilterPredicate:v10];

  id v11 = [v3 items];
  if ([v11 count])
  {
    id v12 = [a1[4] _rentalInfoFromMediaItems:v11];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __33__SUUIJSITunesStore_loadRentals___block_invoke_2;
  v15[3] = &unk_2654066D0;
  objc_copyWeak(&v18, a1 + 7);
  id v16 = a1[5];
  id v14 = v12;
  id v17 = v14;
  [WeakRetained evaluate:v15 completionBlock:0];

  objc_destroyWeak(&v18);
}

void __33__SUUIJSITunesStore_loadRentals___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
  v6[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[v3 callWithArguments:v4];

  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
}

- (void)loadRental:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  if (v7) {
    [(IKJSObject *)self setJSValue:v7 forProperty:v9];
  }
  id v10 = [(IKJSObject *)self appContext];
  objc_initWeak(&location, v10);

  objc_initWeak(&from, self);
  id v11 = [MEMORY[0x263F08A48] mainQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __33__SUUIJSITunesStore_loadRental::__block_invoke;
  v14[3] = &unk_265406720;
  id v12 = v6;
  id v15 = v12;
  id v16 = self;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v13 = v9;
  id v17 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__SUUIJSITunesStore_loadRental::__block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = SUUIMediaPlayerFramework();
  id v3 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpmediaquery.isa, v2), "movieRentalsQuery");
  uint64_t v4 = SUUIMediaPlayerFramework();
  id v5 = SUUIWeakLinkedClassForString(&cfstr_Mpmediapropert.isa, v4);
  id v6 = (void *)SUUIMediaPlayerFramework();
  id v7 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v6);
  id v8 = [v5 predicateWithValue:*(void *)(a1 + 32) forProperty:v7];
  [v3 addFilterPredicate:v8];

  id v9 = [v3 items];
  id v10 = [v9 firstObject];
  if (v10)
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = [v9 firstObject];
    v21[0] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    id v14 = [v11 _rentalInfoFromMediaItems:v13];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263EFFA68];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __33__SUUIJSITunesStore_loadRental::__block_invoke_2;
  v17[3] = &unk_2654066D0;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  id v18 = *(id *)(a1 + 48);
  id v16 = v14;
  id v19 = v16;
  [WeakRetained evaluate:v17 completionBlock:0];

  objc_destroyWeak(&v20);
}

void __33__SUUIJSITunesStore_loadRental::__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
  v6[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[v3 callWithArguments:v4];

  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
}

- (id)_rentalInfoFromMediaItems:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v67 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v86;
    uint64_t v68 = *(void *)v86;
    do
    {
      uint64_t v7 = 0;
      uint64_t v69 = v5;
      do
      {
        if (*(void *)v86 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v85 + 1) + 8 * v7);
        if ([v8 isRental])
        {
          id v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
          id v10 = (void *)SUUIMediaPlayerFramework();
          id v11 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalStartDate", v10);
          id v12 = (void *)SUUIMediaPlayerFramework();
          id v13 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPeriod", v12);
          id v14 = (void *)SUUIMediaPlayerFramework();
          id v84 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackStartDate", v14);
          id v15 = (void *)SUUIMediaPlayerFramework();
          id v16 = *(id *)SUUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackPeriod", v15);
          id v17 = (void *)SUUIMediaPlayerFramework();
          id v79 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v17);
          id v18 = objc_msgSend(v8, "valueForProperty:");
          uint64_t v19 = [v18 stringValue];

          if (v19) {
            [v9 setObject:v19 forKey:@"item-id"];
          }
          id v20 = (void *)SUUIMediaPlayerFramework();
          id v77 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v20);
          uint64_t v21 = objc_msgSend(v8, "valueForProperty:");
          uint64_t v22 = SUUIMediaPlayerFramework();
          id v23 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Mpstoredownloa.isa, v22), "sharedManager");
          id v24 = [v23 downloadForMediaItem:v8];

          v75 = v24;
          v76 = v21;
          v82 = v16;
          v83 = v9;
          v81 = v11;
          v78 = (void *)v19;
          if ([v21 length])
          {
            uint64_t v25 = SUUICelestialFramework();
            uint64_t v26 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Avfileprocesso_3.isa, v25), "fileProcessor");
            __int16 v27 = [v26 rentalInfo:v21];
          }
          else if (v24)
          {
            __int16 v27 = [v24 rentalInformation];
          }
          else
          {
            id v28 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v29 = (void *)SUUIMediaPlayerFramework();
            id v30 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackStartTime", v29);
            long long v31 = (void *)SUUIMediaPlayerFramework();
            id v73 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackDuration", v31);
            id v32 = (void *)SUUIMediaPlayerFramework();
            id v71 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalStartTime", v32);
            uint64_t v33 = (void *)SUUIMediaPlayerFramework();
            id v34 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalDuration", v33);
            v66 = v30;
            long long v35 = [v8 valueForProperty:v30];
            if (([v35 isEqualToNumber:&unk_2705D0C28] & 1) == 0)
            {
              long long v36 = (void *)MEMORY[0x263EFF910];
              [v35 doubleValue];
              uint64_t v37 = objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:");
              if (v37)
              {
                long long v38 = (void *)v37;
                [v28 setObject:v37 forKeyedSubscript:v84];
              }
            }
            id v39 = v13;
            v40 = [v8 valueForProperty:v73];
            if (v40) {
              [v28 setObject:v40 forKeyedSubscript:v82];
            }
            uint64_t v41 = [v8 valueForProperty:v71];
            if (([v41 isEqualToNumber:&unk_2705D0C28] & 1) == 0)
            {
              v42 = (void *)MEMORY[0x263EFF910];
              [v41 doubleValue];
              uint64_t v43 = objc_msgSend(v42, "dateWithTimeIntervalSinceReferenceDate:");
              if (v43)
              {
                v44 = (void *)v43;
                [v28 setObject:v43 forKeyedSubscript:v81];
              }
            }
            v45 = [v8 valueForProperty:v34];
            if (v45) {
              [v28 setObject:v45 forKeyedSubscript:v39];
            }
            v46 = v28;
            __int16 v27 = (void *)[v28 copy];

            id v11 = v81;
            id v16 = v82;
            id v13 = v39;
          }
          uint64_t v47 = [v27 objectForKey:v11];
          uint64_t v48 = [v27 objectForKey:v13];
          v49 = (void *)v48;
          uint64_t v50 = 0;
          v80 = v13;
          if (v47 && v48)
          {
            id v51 = objc_alloc(MEMORY[0x263EFF910]);
            [v49 doubleValue];
            uint64_t v50 = objc_msgSend(v51, "initWithTimeInterval:sinceDate:", v47);
          }
          v52 = [v27 objectForKey:v84];
          uint64_t v53 = [v27 objectForKey:v16];
          v54 = (void *)v53;
          uint64_t v55 = 0;
          if (v52 && v53)
          {
            id v56 = objc_alloc(MEMORY[0x263EFF910]);
            [v54 doubleValue];
            uint64_t v55 = objc_msgSend(v56, "initWithTimeInterval:sinceDate:", v52);
          }
          uint64_t v57 = [v27 objectForKey:@"expiration-date"];
          v58 = (void *)v57;
          v72 = v54;
          v74 = (void *)v47;
          if (v50 && v55)
          {
            id v59 = [(id)v50 earlierDate:v55];
            if (!v59)
            {
              v60 = v49;
LABEL_41:
              v62 = [v8 title];
              if (v62) {
                [v83 setObject:v62 forKey:@"title"];
              }
              if ([v83 count]) {
                [v67 addObject:v83];
              }

              uint64_t v6 = v68;
              uint64_t v5 = v69;
              goto LABEL_46;
            }
          }
          else
          {
            if (v55) {
              v61 = (void *)v55;
            }
            else {
              v61 = (void *)v50;
            }
            if (!(v55 | v50))
            {
              v61 = (void *)v57;
              if (!v57)
              {
                v60 = v49;
                id v59 = 0;
                goto LABEL_41;
              }
            }
            id v59 = v61;
          }
          v60 = v49;
          [v83 setObject:v59 forKey:@"expiration-date"];
          goto LABEL_41;
        }
LABEL_46:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v63 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
      uint64_t v5 = v63;
    }
    while (v63);
  }

  v64 = (void *)[v67 copy];
  return v64;
}

- (void)fetchTemplates:(id)a3 :(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [NSURL URLWithString:*(void *)(*((void *)&v35 + 1) + 8 * v13)];
          if (!v14)
          {
            id v25 = (id)[v7 callWithArguments:&unk_2705D0A18];
            goto LABEL_12;
          }
          id v15 = (void *)v14;
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v16 = [(IKJSObject *)self appContext];
    id v17 = [MEMORY[0x263F10388] managedValueWithValue:v7];
    id v18 = [v7 context];
    uint64_t v19 = [v18 virtualMachine];

    [v19 addManagedReference:v17 withOwner:self];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __37__SUUIJSITunesStore_fetchTemplates::__block_invoke;
    id v30 = &unk_265406770;
    id v31 = v16;
    id v32 = v17;
    id v33 = v19;
    id v34 = self;
    id v20 = v19;
    id v21 = v17;
    id v9 = v16;
    uint64_t v22 = _Block_copy(&v27);
    id v23 = [SUUITemplateLoader alloc];
    id v24 = -[SUUITemplateLoader initWithURLs:completionBlock:](v23, "initWithURLs:completionBlock:", v8, v22, v27, v28, v29, v30);
    [(SUUITemplateLoader *)v24 load];

LABEL_12:
  }
  else
  {
    id v26 = (id)[v7 callWithArguments:&unk_2705D0A00];
  }
}

void __37__SUUIJSITunesStore_fetchTemplates::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __37__SUUIJSITunesStore_fetchTemplates::__block_invoke_2;
  v12[3] = &unk_265406748;
  id v13 = v6;
  id v7 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = v5;
  id v11 = v6;
  [v7 evaluate:v12 completionBlock:0];
}

uint64_t __37__SUUIJSITunesStore_fetchTemplates::__block_invoke_2(uint64_t a1)
{
  void v9[2] = *MEMORY[0x263EF8340];
  BOOL v2 = *(void *)(a1 + 32) == 0;
  id v3 = [*(id *)(a1 + 40) value];
  uint64_t v4 = [NSNumber numberWithBool:v2];
  uint64_t v5 = *(void *)(a1 + 48);
  v9[0] = v4;
  v9[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v7 = (id)[v3 callWithArguments:v6];

  return [*(id *)(a1 + 56) removeManagedReference:*(void *)(a1 + 40) withOwner:*(void *)(a1 + 64)];
}

- (void)fetchMSOProviderStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = [MEMORY[0x263F10388] managedValueWithValue:v4];
  id v7 = [v4 context];

  id v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  uint64_t v9 = SUUIVideoSubscriberAccountFramework();
  id v10 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Vsaccountchann.isa, v9), "sharedCenter");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke;
  v14[3] = &unk_265406798;
  id v15 = v5;
  id v16 = v6;
  id v17 = v8;
  id v18 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v5;
  [v10 fetchAccountChannelsWithCompletionHandler:v14];
}

void __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = [v3 adamID];
  if (v5) {
    [v4 setObject:v5 forKey:@"providerId"];
  }
  id v6 = [v3 channelIDs];
  id v7 = [v6 allObjects];

  if (v7) {
    [v4 setObject:v7 forKey:@"providedAppTitles"];
  }
  id v8 = [v3 providerInfo];
  if (v8) {
    [v4 setObject:v8 forKey:@"providerInfo"];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2;
  v13[3] = &unk_265405580;
  uint64_t v9 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v4;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = v10;
  uint64_t v17 = v11;
  id v12 = v4;
  [v9 evaluate:v13 completionBlock:0];
}

void __44__SUUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) value];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 callWithArguments:v3];

  [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 56)];
}

- (void)itemStateCenterMediaLibrariesDidChange:(id)a3
{
  id v4 = [(IKJSObject *)self appContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __60__SUUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke;
  v5[3] = &unk_2654022D0;
  v5[4] = self;
  [v4 evaluate:v5 completionBlock:0];
}

id __60__SUUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) invokeMethod:@"onLibraryChange" withArguments:0];
}

- (void)_finishPurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKJSObject *)self appContext];
  uint64_t v9 = [v7 purchase];
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke;
    v17[3] = &unk_265405558;
    id v18 = v9;
    [v8 evaluateDelegateBlockSync:v17];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2;
  v13[3] = &unk_265403460;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  [v8 evaluate:v13 completionBlock:0];
}

void __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 appContext:v4 didCompletePurchase:*(void *)(a1 + 32)];
  }
}

void __64__SUUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  v26[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"options"];
  }
  uint64_t v5 = [*(id *)(a1 + 40) error];
  id v6 = [NSNumber numberWithBool:v5 == 0];
  [v3 setObject:v6 forKey:@"result"];

  id v7 = [v5 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F7B758]])
  {
    BOOL v8 = [v5 code] == 134;
  }
  else
  {

    BOOL v8 = 0;
  }
  uint64_t v9 = [NSNumber numberWithInteger:v8];
  [v3 setObject:v9 forKey:@"error"];

  id v10 = [*(id *)(a1 + 40) responseMetrics];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = (id)[v10 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v12 = v11;
  v25[0] = @"requestStartTime";
  id v13 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) requestStartTime];
  id v14 = objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v26[0] = v14;
  v25[1] = @"responseStartTime";
  id v15 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) responseStartTime];
  id v16 = objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v26[1] = v16;
  v25[2] = @"responseEndTime";
  uint64_t v17 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) responseEndTime];
  id v18 = objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v26[2] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  [v12 setObject:v19 forKey:@"performanceMetrics"];
  id v20 = (void *)[v12 copy];
  [v3 setObject:v20 forKey:@"metrics"];

  id v21 = *(void **)(a1 + 48);
  id v24 = v3;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  id v23 = (id)[v21 invokeMethod:@"onBuy" withArguments:v22];
}

- (void)_finishSoftwarePurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IKJSObject *)self appContext];
  uint64_t v9 = [v7 purchase];
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke;
    v17[3] = &unk_265405558;
    id v18 = v9;
    [v8 evaluateDelegateBlockSync:v17];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2;
  v13[3] = &unk_265403460;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  [v8 evaluate:v13 completionBlock:0];
}

void __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 appContext:v4 didCompleteSoftwarePurchase:*(void *)(a1 + 32)];
  }
}

void __72__SUUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  v26[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"options"];
  }
  uint64_t v5 = [*(id *)(a1 + 40) error];
  id v6 = [NSNumber numberWithBool:v5 == 0];
  [v3 setObject:v6 forKey:@"result"];

  id v7 = [v5 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F7B758]])
  {
    BOOL v8 = [v5 code] == 134;
  }
  else
  {

    BOOL v8 = 0;
  }
  uint64_t v9 = [NSNumber numberWithInteger:v8];
  [v3 setObject:v9 forKey:@"error"];

  id v10 = [*(id *)(a1 + 40) responseMetrics];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = (id)[v10 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v12 = v11;
  v25[0] = @"requestStartTime";
  id v13 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) requestStartTime];
  id v14 = objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v26[0] = v14;
  v25[1] = @"responseStartTime";
  id v15 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) responseStartTime];
  id v16 = objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v26[1] = v16;
  v25[2] = @"responseEndTime";
  uint64_t v17 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) responseEndTime];
  id v18 = objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v26[2] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  [v12 setObject:v19 forKey:@"performanceMetrics"];
  id v20 = (void *)[v12 copy];
  [v3 setObject:v20 forKey:@"metrics"];

  id v21 = *(void **)(a1 + 48);
  id v24 = v3;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  id v23 = (id)[v21 invokeMethod:@"onBuy" withArguments:v22];
}

- (void)_displayWifiConnectionRequiredAlert
{
}

void __56__SUUIJSITunesStore__displayWifiConnectionRequiredAlert__block_invoke()
{
  id v11 = objc_alloc_init(MEMORY[0x263F82420]);
  int v0 = MGGetBoolAnswer();
  v1 = SUUIBundle();
  id v2 = v1;
  if (v0)
  {
    id v3 = [v1 localizedStringForKey:@"PENDING_RENTAL_NETWORK_ERROR_MESSAGE_WLAN_ONLY" value:&stru_2704F8130 table:0];
    [v11 setMessage:v3];

    uint64_t v4 = SUUIBundle();
    uint64_t v5 = v4;
    id v6 = @"PENDING_RENTAL_NETWORK_ERROR_TITLE_WLAN_ONLY";
  }
  else
  {
    id v7 = [v1 localizedStringForKey:@"PENDING_RENTAL_NETWORK_ERROR_MESSAGE_WIFI_ONLY" value:&stru_2704F8130 table:0];
    [v11 setMessage:v7];

    uint64_t v4 = SUUIBundle();
    uint64_t v5 = v4;
    id v6 = @"PENDING_RENTAL_NETWORK_ERROR_TITLE_WIFI_ONLY";
  }
  BOOL v8 = [v4 localizedStringForKey:v6 value:&stru_2704F8130 table:0];
  [v11 setTitle:v8];

  uint64_t v9 = SUUIBundle();
  id v10 = [v9 localizedStringForKey:@"OK" value:&stru_2704F8130 table:0];
  [v11 addButtonWithTitle:v10];

  [v11 show];
}

- (id)_millisecondsFromTimeInterval:(double)a3
{
  return (id)[NSNumber numberWithLongLong:(uint64_t)(a3 * 1000.0)];
}

- (void)_purchaseRequestDidSucceedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:0x2704FB630];

  uint64_t v5 = v6;
  if (v6)
  {
    [(SUUIJSITunesStore *)self _finishPurchaseForOptions:0 purchaseResponse:v6];
    uint64_t v5 = v6;
  }
}

- (void).cxx_destruct
{
}

@end