@interface STLockoutPolicyController
- (BOOL)_actionIgnoreLimitForTodayWithCompletionHandler:(id)a3;
- (BOOL)_actionOneMoreMinuteWithCompletionHandler:(id)a3;
- (BOOL)_actionRemindMeInMinutesWithCompletionHandler:(id)a3;
- (BOOL)_actionRemindMeInOneHourWithCompletionHandler:(id)a3;
- (BOOL)_changeInternalStateTo:(unint64_t)a3;
- (BOOL)_isRestrictionsPasscodeSet;
- (BOOL)_requestAdditionalTime:(int64_t)a3 withCompletionHandler:(id)a4;
- (BOOL)_shouldRequestMoreTime;
- (BOOL)contactsEditable;
- (BOOL)handleAction:(int64_t)a3 withCompletionHandler:(id)a4;
- (BOOL)needsToSetRestrictionsPasscode;
- (BOOL)shouldAllowOneMoreMinute;
- (CNContactStore)contactStore;
- (CNContainer)iCloudContainer;
- (NSArray)contactsHandles;
- (NSSet)blockedContactsHandles;
- (NSString)bundleIdentifier;
- (NSString)categoryIdentifier;
- (NSURL)websiteURL;
- (STConversation)conversation;
- (STConversationContext)conversationContext;
- (STLockoutPolicyController)init;
- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 delegate:(id)a5;
- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5 delegate:(id)a6;
- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 delegate:(id)a4;
- (STLockoutPolicyController)initWithCategoryIdentifier:(id)a3 delegate:(id)a4;
- (STLockoutPolicyController)initWithWebsiteURL:(id)a3 delegate:(id)a4;
- (double)_timeIntervalToEndOfDay;
- (id)_makeAskForTimeResource;
- (unint64_t)state;
- (void)_allowedByContactsHandleDidChange:(id)a3 conversationContext:(id)a4;
- (void)_allowedByScreenTimeDidChange:(BOOL)a3 conversationContext:(id)a4;
- (void)_applicationCurrentlyLimitedDidChange:(BOOL)a3 conversationContext:(id)a4;
- (void)_askForTimeResponseWithState:(int64_t)a3 respondingParent:(id)a4 amountGranted:(id)a5 error:(id)a6;
- (void)_authenticatedApproveForAdditionalTime:(double)a3 withCompletionHandler:(id)a4;
- (void)_changePolicyToCurrent;
- (void)_changePolicyToCurrentWithBundleIdentifier:(id)a3;
- (void)_changePolicyToCurrentWithCategoryIdentifier:(id)a3;
- (void)_changePolicyToCurrentWithURL:(id)a3;
- (void)_changeStateToBeforePending;
- (void)_changeStateToInitial;
- (void)_handleChangeToPolicy:(int64_t)a3;
- (void)_setupCategoryPolicyMonitorForIdentifier:(id)a3;
- (void)_setupWebsitePolicyMonitorForURL:(id)a3;
- (void)_updateAllowedByScreenTime:(BOOL)a3 applicationCurrentlyLimited:(BOOL)a4 allowedByContactsHandle:(id)a5;
- (void)dealloc;
- (void)iCloudContainer;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBundleIdentifier:(id)a3;
- (void)setContactsHandles:(id)a3;
- (void)setConversation:(id)a3;
- (void)setConversationContext:(id)a3;
- (void)setWebsiteURL:(id)a3;
- (void)shouldAllowOneMoreMinute;
@end

@implementation STLockoutPolicyController

- (STLockoutPolicyController)init
{
  v3.receiver = self;
  v3.super_class = (Class)STLockoutPolicyController;
  return [(STLockoutPolicyController *)&v3 init];
}

- (STLockoutPolicyController)initWithCategoryIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)STLockoutPolicyController;
  v8 = [(STLockoutPolicyController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [v6 copy];
    categoryIdentifier = v9->_categoryIdentifier;
    v9->_categoryIdentifier = (NSString *)v10;

    v9->_style = 4;
    [(STLockoutPolicyController *)v9 _setupCategoryPolicyMonitorForIdentifier:v9->_categoryIdentifier];
    uint64_t v12 = objc_opt_new();
    managementState = v9->_managementState;
    v9->_managementState = (STManagementState *)v12;
  }
  return v9;
}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLockoutPolicyController;
  v9 = [(STLockoutPolicyController *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_style = 0;
    uint64_t v11 = objc_opt_new();
    managementState = v10->_managementState;
    v10->_managementState = (STManagementState *)v11;

    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
  }

  return v10;
}

- (STLockoutPolicyController)initWithWebsiteURL:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLockoutPolicyController;
  v9 = [(STLockoutPolicyController *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_websiteURL, a3);
    v10->_style = 1;
    [(STLockoutPolicyController *)v10 _setupWebsitePolicyMonitorForURL:v10->_websiteURL];
    uint64_t v11 = objc_opt_new();
    managementState = v10->_managementState;
    v10->_managementState = (STManagementState *)v11;
  }
  return v10;
}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)STLockoutPolicyController;
  id v10 = a5;
  uint64_t v11 = [(STLockoutPolicyController *)&v31 init];
  uint64_t v12 = [v8 copy];
  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v12;

  uint64_t v14 = [v9 copy];
  contactsHandles = v11->_contactsHandles;
  v11->_contactsHandles = (NSArray *)v14;

  objc_storeWeak((id *)&v11->_delegate, v10);
  v11->_style = 3;
  v11->_state = 0;
  uint64_t v16 = objc_opt_new();
  managementState = v11->_managementState;
  v11->_managementState = (STManagementState *)v16;

  uint64_t v18 = objc_opt_new();
  contactStore = v11->_contactStore;
  v11->_contactStore = (CNContactStore *)v18;

  v20 = (void *)MEMORY[0x263F67148];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke;
  v27[3] = &unk_26449B748;
  id v28 = v8;
  v21 = v11;
  v29 = v21;
  id v30 = v9;
  id v22 = v9;
  id v23 = v8;
  [v20 requestConversationWithBundleIdentifier:v23 completionHandler:v27];
  v24 = v30;
  v25 = v21;

  return v25;
}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_10;
    block[3] = &unk_26449B720;
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v7 = v9;
  }
  else
  {
    id v7 = +[STBlockingUILog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_cold_1();
    }
  }
}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setConversation:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 40) allowableByContactsHandles:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setConversationContext:v6];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v6 allowedByScreenTime];
  uint64_t v4 = [v6 applicationCurrentlyLimited];
  id v5 = [v6 allowedByContactsHandle];
  [v2 _updateAllowedByScreenTime:v3 applicationCurrentlyLimited:v4 allowedByContactsHandle:v5];

  [v6 addObserver:*(void *)(a1 + 32) forKeyPath:@"allowedByScreenTime" options:1 context:@"KVOContextLockoutPolicyController"];
  [v6 addObserver:*(void *)(a1 + 32) forKeyPath:@"applicationCurrentlyLimited" options:1 context:@"KVOContextLockoutPolicyController"];
  [v6 addObserver:*(void *)(a1 + 32) forKeyPath:@"allowedByContactsHandle" options:1 context:@"KVOContextLockoutPolicyController"];
}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)STLockoutPolicyController;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [(STLockoutPolicyController *)&v28 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v28.receiver, v28.super_class);

  bundleIdentifier = v14->_bundleIdentifier;
  v14->_bundleIdentifier = (NSString *)v15;

  v17 = [v10 allowedByContactsHandle];
  uint64_t v18 = [v17 allKeys];
  uint64_t v19 = [v18 copy];
  contactsHandles = v14->_contactsHandles;
  v14->_contactsHandles = (NSArray *)v19;

  objc_storeWeak((id *)&v14->_delegate, v12);
  v14->_style = 3;
  v14->_state = 0;
  uint64_t v21 = objc_opt_new();
  managementState = v14->_managementState;
  v14->_managementState = (STManagementState *)v21;

  if (v11) {
    id v23 = (CNContactStore *)v11;
  }
  else {
    id v23 = (CNContactStore *)objc_opt_new();
  }
  contactStore = v14->_contactStore;
  v14->_contactStore = v23;

  conversationContext = v14->_conversationContext;
  v14->_conversationContext = (STConversationContext *)v10;
  id v26 = v10;

  [(STConversationContext *)v14->_conversationContext addObserver:v14 forKeyPath:@"allowedByScreenTime" options:1 context:@"KVOContextLockoutPolicyController"];
  [(STConversationContext *)v14->_conversationContext addObserver:v14 forKeyPath:@"applicationCurrentlyLimited" options:1 context:@"KVOContextLockoutPolicyController"];
  [(STConversationContext *)v14->_conversationContext addObserver:v14 forKeyPath:@"allowedByContactsHandle" options:1 context:@"KVOContextLockoutPolicyController"];

  return v14;
}

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  id v6 = +[STBlockingUILog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    v17 = bundleIdentifier;
    _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "bundle identifier is %@", buf, 0xCu);
  }

  id v8 = (void *)(self->_reuseIdentifier + 1);
  self->_reuseIdentifier = (unint64_t)v8;
  objc_initWeak((id *)buf, self);
  id v9 = objc_alloc(MEMORY[0x263F39CF8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__STLockoutPolicyController_setBundleIdentifier___block_invoke;
  v13[3] = &unk_26449B770;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v8;
  id v10 = v5;
  id v14 = v10;
  id v11 = (DMFApplicationPolicyMonitor *)[v9 initWithPolicyChangeHandler:v13];
  applicationPolicyMonitor = self->_applicationPolicyMonitor;
  self->_applicationPolicyMonitor = v11;

  self->_state = 0;
  [(STLockoutPolicyController *)self _changePolicyToCurrent];

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __49__STLockoutPolicyController_setBundleIdentifier___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__STLockoutPolicyController_setBundleIdentifier___block_invoke_2;
  block[3] = &unk_26449B770;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  id v3 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v4);
}

void __49__STLockoutPolicyController_setBundleIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 48))
  {
    uint64_t v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [NSNumber numberWithUnsignedInteger:v3[1]];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) bundle identifier %@", (uint8_t *)&v7, 0x20u);
    }
    [v3 _changePolicyToCurrentWithBundleIdentifier:*(void *)(a1 + 32)];
  }
}

- (BOOL)handleAction:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  switch(a3)
  {
    case 0:
      if (v6) {
        (*((void (**)(id, void))v6 + 2))(v6, 0);
      }
      goto LABEL_4;
    case 1:
      if (v6) {
        (*((void (**)(id, void))v6 + 2))(v6, 0);
      }
      BOOL v8 = 0;
      break;
    case 2:
      BOOL v9 = [(STLockoutPolicyController *)self _requestAdditionalTime:2 withCompletionHandler:v6];
      goto LABEL_13;
    case 3:
      BOOL v9 = [(STLockoutPolicyController *)self _actionIgnoreLimitForTodayWithCompletionHandler:v6];
      goto LABEL_13;
    case 4:
      BOOL v9 = [(STLockoutPolicyController *)self _actionRemindMeInMinutesWithCompletionHandler:v6];
      goto LABEL_13;
    case 5:
      BOOL v9 = [(STLockoutPolicyController *)self _actionRemindMeInOneHourWithCompletionHandler:v6];
      goto LABEL_13;
    case 6:
      BOOL v9 = [(STLockoutPolicyController *)self _actionOneMoreMinuteWithCompletionHandler:v6];
LABEL_13:
      BOOL v8 = v9;
      break;
    default:
LABEL_4:
      BOOL v8 = 1;
      break;
  }

  return v8;
}

- (void)dealloc
{
  [(STConversationContext *)self->_conversationContext removeObserver:self forKeyPath:@"allowedByScreenTime" context:@"KVOContextLockoutPolicyController"];
  [(STConversationContext *)self->_conversationContext removeObserver:self forKeyPath:@"applicationCurrentlyLimited" context:@"KVOContextLockoutPolicyController"];
  [(STConversationContext *)self->_conversationContext removeObserver:self forKeyPath:@"allowedByContactsHandle" context:@"KVOContextLockoutPolicyController"];
  v3.receiver = self;
  v3.super_class = (Class)STLockoutPolicyController;
  [(STLockoutPolicyController *)&v3 dealloc];
}

- (NSSet)blockedContactsHandles
{
  objc_super v3 = [(STLockoutPolicyController *)self conversationContext];
  uint64_t v4 = [v3 allowedByContactsHandle];
  id v5 = [v4 keysOfEntriesPassingTest:&__block_literal_global_3];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x263EFFA08];
    BOOL v9 = [(STLockoutPolicyController *)self contactsHandles];
    id v7 = [v8 setWithArray:v9];
  }

  return (NSSet *)v7;
}

- (CNContainer)iCloudContainer
{
  managementState = self->_managementState;
  id v15 = 0;
  uint64_t v4 = [(STManagementState *)managementState primaryiCloudCardDAVAccountIdentifierWithError:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = [MEMORY[0x263EFEA80] predicateForContainersInAccountWithExternalIdentifier:v4];
    id v7 = [(STLockoutPolicyController *)self contactStore];
    id v14 = v5;
    BOOL v8 = [v7 containersMatchingPredicate:v6 error:&v14];
    id v9 = v14;

    if (v8)
    {
      if ([v8 count])
      {
        id v10 = [v8 objectAtIndexedSubscript:0];
LABEL_13:

        goto LABEL_14;
      }
      __int16 v11 = +[STBlockingUILog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_21E199000, v11, OS_LOG_TYPE_DEFAULT, "No iCloud container found for user", v13, 2u);
      }
    }
    else
    {
      __int16 v11 = +[STBlockingUILog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[STLockoutPolicyController iCloudContainer]();
      }
    }

    id v10 = 0;
    goto LABEL_13;
  }
  id v6 = +[STBlockingUILog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[STLockoutPolicyController iCloudContainer]();
  }
  id v10 = 0;
  id v9 = v5;
LABEL_14:

  return (CNContainer *)v10;
}

- (void)_setupCategoryPolicyMonitorForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F39D00]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke;
  v10[3] = &unk_26449B770;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  id v7 = v4;
  id v11 = v7;
  BOOL v8 = (DMFCategoryPolicyMonitor *)[v6 initWithPolicyChangeHandler:v10];
  categoryPolicyMonitor = self->_categoryPolicyMonitor;
  self->_categoryPolicyMonitor = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke_2;
  block[3] = &unk_26449B770;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  id v3 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v4);
}

void __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 48))
  {
    id v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [NSNumber numberWithUnsignedInteger:v3[1]];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      BOOL v8 = v3;
      __int16 v9 = 2112;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) category identifier %@", (uint8_t *)&v7, 0x20u);
    }
    [v3 _changePolicyToCurrentWithCategoryIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)_setupWebsitePolicyMonitorForURL:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F39E90]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke;
  v10[3] = &unk_26449B770;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  id v7 = v4;
  id v11 = v7;
  BOOL v8 = (DMFWebsitePolicyMonitor *)[v6 initWithPolicyChangeHandler:v10];
  websitePolicyMonitor = self->_websitePolicyMonitor;
  self->_websitePolicyMonitor = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke_2;
  block[3] = &unk_26449B770;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  id v3 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v4);
}

void __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 48))
  {
    id v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [NSNumber numberWithUnsignedInteger:v3[1]];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      BOOL v8 = v3;
      __int16 v9 = 2112;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) URL %@", (uint8_t *)&v7, 0x20u);
    }
    [v3 _changePolicyToCurrentWithURL:*(void *)(a1 + 32)];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"KVOContextLockoutPolicyController")
  {
    if ([v10 isEqualToString:@"allowedByScreenTime"])
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v14 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v14)
      {

        uint64_t v13 = 0;
      }
      -[STLockoutPolicyController _allowedByScreenTimeDidChange:conversationContext:](self, "_allowedByScreenTimeDidChange:conversationContext:", [v13 BOOLValue], v11);
    }
    else if ([v10 isEqualToString:@"applicationCurrentlyLimited"])
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v15 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v15)
      {

        uint64_t v13 = 0;
      }
      -[STLockoutPolicyController _applicationCurrentlyLimitedDidChange:conversationContext:](self, "_applicationCurrentlyLimitedDidChange:conversationContext:", [v13 BOOLValue], v11);
    }
    else
    {
      if (![v10 isEqualToString:@"allowedByContactsHandle"]) {
        goto LABEL_16;
      }
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v16)
      {

        uint64_t v13 = 0;
      }
      [(STLockoutPolicyController *)self _allowedByContactsHandleDidChange:v13 conversationContext:v11];
    }

    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STLockoutPolicyController;
  [(STLockoutPolicyController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_16:
}

- (void)_allowedByScreenTimeDidChange:(BOOL)a3 conversationContext:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__STLockoutPolicyController__allowedByScreenTimeDidChange_conversationContext___block_invoke;
  block[3] = &unk_26449B798;
  BOOL v10 = a3;
  void block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __79__STLockoutPolicyController__allowedByScreenTimeDidChange_conversationContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) applicationCurrentlyLimited];
  id v5 = [*(id *)(a1 + 40) allowedByContactsHandle];
  [v3 _updateAllowedByScreenTime:v2 applicationCurrentlyLimited:v4 allowedByContactsHandle:v5];
}

- (void)_applicationCurrentlyLimitedDidChange:(BOOL)a3 conversationContext:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__STLockoutPolicyController__applicationCurrentlyLimitedDidChange_conversationContext___block_invoke;
  block[3] = &unk_26449B798;
  void block[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__STLockoutPolicyController__applicationCurrentlyLimitedDidChange_conversationContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allowedByScreenTime];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) allowedByContactsHandle];
  [v2 _updateAllowedByScreenTime:v3 applicationCurrentlyLimited:v4 allowedByContactsHandle:v5];
}

- (void)_allowedByContactsHandleDidChange:(id)a3 conversationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__STLockoutPolicyController__allowedByContactsHandleDidChange_conversationContext___block_invoke;
  block[3] = &unk_26449B720;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__STLockoutPolicyController__allowedByContactsHandleDidChange_conversationContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allowedByScreenTime];
  uint64_t v4 = [*(id *)(a1 + 40) applicationCurrentlyLimited];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 _updateAllowedByScreenTime:v3 applicationCurrentlyLimited:v4 allowedByContactsHandle:v5];
}

- (void)_updateAllowedByScreenTime:(BOOL)a3 applicationCurrentlyLimited:(BOOL)a4 allowedByContactsHandle:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v12 = v8;
  if (a3)
  {
    uint64_t v9 = 9;
  }
  else
  {
    BOOL v10 = [v8 keysOfEntriesPassingTest:&__block_literal_global_3];
    uint64_t v11 = [v10 count];

    if (!v11) {
      goto LABEL_8;
    }
    if (v5) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = 7;
    }
  }
  [(STLockoutPolicyController *)self _changeInternalStateTo:v9];
LABEL_8:
}

- (BOOL)_shouldRequestMoreTime
{
  return [(STManagementState *)self->_managementState shouldRequestMoreTime];
}

- (BOOL)_isRestrictionsPasscodeSet
{
  return [(STManagementState *)self->_managementState isRestrictionsPasscodeSet];
}

- (BOOL)needsToSetRestrictionsPasscode
{
  return [(STManagementState *)self->_managementState needsToSetRestrictionsPasscode];
}

- (BOOL)shouldAllowOneMoreMinute
{
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    managementState = self->_managementState;
    v20 = 0;
    BOOL v5 = [(STManagementState *)managementState shouldAllowOneMoreMinuteForBundleIdentifier:bundleIdentifier error:&v20];
    id v6 = v20;
  }
  else
  {
    p_websiteURL = (uint64_t *)&self->_websiteURL;
    websiteURL = self->_websiteURL;
    if (websiteURL)
    {
      uint64_t v11 = [(NSURL *)websiteURL host];
      if (v11)
      {
        id v12 = self->_managementState;
        id v19 = 0;
        BOOL v5 = [(STManagementState *)v12 shouldAllowOneMoreMinuteForWebDomain:v11 error:&v19];
        id v7 = v19;
      }
      else
      {
        id v15 = +[STBlockingUILog log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          [(STLockoutPolicyController *)p_websiteURL shouldAllowOneMoreMinute];
        }

        id v7 = 0;
        BOOL v5 = 0;
      }

      if (v5) {
        goto LABEL_4;
      }
LABEL_14:
      uint64_t v16 = +[STBlockingUILog log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[STLockoutPolicyController shouldAllowOneMoreMinute]();
      }

      char v8 = 1;
      goto LABEL_17;
    }
    categoryIdentifier = self->_categoryIdentifier;
    if (!categoryIdentifier) {
      return 0;
    }
    id v14 = self->_managementState;
    uint64_t v18 = 0;
    BOOL v5 = [(STManagementState *)v14 shouldAllowOneMoreMinuteForCategoryIdentifier:categoryIdentifier error:&v18];
    id v6 = v18;
  }
  id v7 = v6;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_4:
  char v8 = [v5 BOOLValue];
LABEL_17:

  return v8;
}

- (void)_changePolicyToCurrentWithCategoryIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    categoryPolicyMonitor = self->_categoryPolicyMonitor;
    v13[0] = v4;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke;
    v9[3] = &unk_26449B7E8;
    id v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    [(DMFCategoryPolicyMonitor *)categoryPolicyMonitor requestPoliciesForCategoryIdentifiers:v7 completionHandler:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    char v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STLockoutPolicyController _changePolicyToCurrentWithCategoryIdentifier:]();
    }
  }
}

void __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "request policies for category %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    char v8 = (void *)[v6 integerValue];
    uint64_t v9 = +[STBlockingUILog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = STStringFromPolicy((unint64_t)v8);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_DEFAULT, "request policies for category %@ returned %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke_28;
    block[3] = &unk_26449B7C0;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    void v13[2] = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v13);
  }
}

void __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke_28(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 40))
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _handleChangeToPolicy:*(void *)(a1 + 48)];
    WeakRetained = v3;
  }
}

- (void)_changePolicyToCurrentWithBundleIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    applicationPolicyMonitor = self->_applicationPolicyMonitor;
    v13[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke;
    v9[3] = &unk_26449B7E8;
    id v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    [(DMFApplicationPolicyMonitor *)applicationPolicyMonitor requestPoliciesForBundleIdentifiers:v7 completionHandler:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    char v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STLockoutPolicyController _changePolicyToCurrentWithBundleIdentifier:]();
    }
  }
}

void __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "request policies for bundle identifier %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    char v8 = (void *)[v6 integerValue];
    uint64_t v9 = +[STBlockingUILog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = STStringFromPolicy((unint64_t)v8);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_DEFAULT, "request policies for bundle identifier %@ returned %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke_30;
    block[3] = &unk_26449B7C0;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    void v13[2] = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v13);
  }
}

void __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke_30(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 40))
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _handleChangeToPolicy:*(void *)(a1 + 48)];
    WeakRetained = v3;
  }
}

- (void)_changePolicyToCurrentWithURL:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    websitePolicyMonitor = self->_websitePolicyMonitor;
    v13[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke;
    v9[3] = &unk_26449B7E8;
    id v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    [(DMFWebsitePolicyMonitor *)websitePolicyMonitor requestPoliciesForWebsites:v7 completionHandler:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    char v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STLockoutPolicyController _changePolicyToCurrentWithURL:]();
    }
  }
}

void __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "request policies for website %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    char v8 = (void *)[v6 integerValue];
    uint64_t v9 = +[STBlockingUILog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = STStringFromPolicy((unint64_t)v8);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_DEFAULT, "request policies for website %@ returned %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke_31;
    block[3] = &unk_26449B7C0;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    void v13[2] = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v13);
  }
}

void __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke_31(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 40))
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _handleChangeToPolicy:*(void *)(a1 + 48)];
    WeakRetained = v3;
  }
}

- (void)_changePolicyToCurrent
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Error: unable to change policy to current; defaulting to blocked",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_handleChangeToPolicy:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  switch(a3)
  {
    case 0:
      uint64_t v5 = +[STBlockingUILog log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "change to policy OK", buf, 2u);
      }

      uint8_t v6 = self;
      uint64_t v7 = 9;
      goto LABEL_17;
    case 1:
      char v8 = +[STBlockingUILog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v16 = 0;
        _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "change to policy Warn", v16, 2u);
      }

      uint8_t v6 = self;
      uint64_t v7 = 2;
      goto LABEL_17;
    case 2:
      uint64_t v9 = +[STBlockingUILog log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_DEFAULT, "change to policy Ask", v15, 2u);
      }

      uint8_t v6 = self;
      uint64_t v7 = 3;
      goto LABEL_17;
    case 3:
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_21E199000, v10, OS_LOG_TYPE_DEFAULT, "change to policy Ask Pending", v14, 2u);
      }

      uint8_t v6 = self;
      uint64_t v7 = 4;
      goto LABEL_17;
    case 4:
      uint64_t v11 = +[STBlockingUILog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_21E199000, v11, OS_LOG_TYPE_DEFAULT, "change to policy Blocked", v13, 2u);
      }

      uint8_t v6 = self;
      uint64_t v7 = 6;
LABEL_17:
      [(STLockoutPolicyController *)v6 _changeInternalStateTo:v7];
      break;
    case 5:
      id v12 = +[STBlockingUILog log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[STLockoutPolicyController _handleChangeToPolicy:]();
      }

      break;
    default:
      return;
  }
}

- (void)_changeStateToBeforePending
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_state == 4)
  {
    unint64_t stateBeforePending = self->_stateBeforePending;
    if (stateBeforePending == 2)
    {
      uint64_t v10 = +[STBlockingUILog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_21E199000, v10, OS_LOG_TYPE_DEFAULT, "Reverting state to Warn", (uint8_t *)&v12, 2u);
      }

      uint64_t v5 = self;
      uint64_t v6 = 2;
      goto LABEL_12;
    }
    if (stateBeforePending == 3)
    {
      uint64_t v4 = +[STBlockingUILog log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Reverting state to Ask", (uint8_t *)&v12, 2u);
      }

      uint64_t v5 = self;
      uint64_t v6 = 3;
LABEL_12:
      [(STLockoutPolicyController *)v5 _changeInternalStateTo:v6];
      return;
    }
    uint64_t v7 = +[STBlockingUILog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = STStringFromLockoutState(self->_stateBeforePending);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_21E199000, v7, OS_LOG_TYPE_DEFAULT, "State before request was %{public}@; expected Ask or Warn",
        (uint8_t *)&v12,
        0xCu);
    }
  }
  else
  {
    uint64_t v7 = +[STBlockingUILog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = STStringFromLockoutState(self->_state);
      uint64_t v9 = STStringFromLockoutState(self->_stateBeforePending);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_21E199000, v7, OS_LOG_TYPE_DEFAULT, "Current state (%{public}@) is no longer pending, so skipping revert to state (%{public}@) before pending", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)_changeInternalStateTo:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t state = self->_state;
  if (state == a3)
  {
    uint64_t v16 = +[STBlockingUILog log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = STStringFromLockoutState(a3);
      int v19 = 138412290;
      v20 = v17;
      _os_log_impl(&dword_21E199000, v16, OS_LOG_TYPE_DEFAULT, "skipping change to state: already %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_17;
  }
  if (state == 9)
  {
    uint64_t v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = STStringFromLockoutState(a3);
      int v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: change to state %@: lockout state is Dismissing", (uint8_t *)&v19, 0xCu);
    }
  }
  char v8 = +[STBlockingUILog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = STStringFromLockoutState(a3);
    int v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "changing lockout state to %@", (uint8_t *)&v19, 0xCu);
  }
  if (a3 == 4) {
    self->_unint64_t stateBeforePending = self->_state;
  }
  self->_unint64_t state = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      __int16 v14 = +[STBlockingUILog log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = STStringFromLockoutState(a3);
        int v19 = 138412290;
        v20 = v15;
        _os_log_impl(&dword_21E199000, v14, OS_LOG_TYPE_DEFAULT, "calling delegate  stateDidChange to %@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v16 = objc_loadWeakRetained((id *)p_delegate);
      [v16 stateDidChange:a3];
LABEL_17:
    }
  }
  return state != a3;
}

- (void)_changeStateToInitial
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Initial", v4, 2u);
  }

  if ([(STLockoutPolicyController *)self _changeInternalStateTo:1]) {
    [(STLockoutPolicyController *)self _changePolicyToCurrent];
  }
}

- (double)_timeIntervalToEndOfDay
{
  uint64_t v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [v2 dateByAddingUnit:16 value:1 toDate:v3 options:0];
  uint64_t v5 = [v2 components:252 fromDate:v4];
  [v5 setHour:0];
  [v5 setMinute:0];
  [v5 setSecond:0];
  uint64_t v6 = [v2 dateFromComponents:v5];
  [v6 timeIntervalSinceDate:v3];
  double v8 = v7;

  return v8;
}

- (void)_authenticatedApproveForAdditionalTime:(double)a3 withCompletionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  double v8 = [(STLockoutPolicyController *)self _makeAskForTimeResource];
  askForTimeResource = self->_askForTimeResource;
  self->_askForTimeResource = v8;

  double v10 = a3;
  if (a3 != 60.0)
  {
    double v10 = a3;
    if (a3 == 0.0)
    {
      [(STLockoutPolicyController *)self _timeIntervalToEndOfDay];
      double v10 = v11;
    }
  }
  id v12 = +[STBlockingUILog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = self->_askForTimeResource;
    __int16 v14 = [NSNumber numberWithDouble:v10];
    *(_DWORD *)buf = 138412546;
    v25 = v13;
    __int16 v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "Created Ask For Time Resource %@ to grant additional time %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke;
  uint64_t v21 = &unk_26449B838;
  v23[1] = *(id *)&v10;
  objc_copyWeak(v23, (id *)buf);
  v23[2] = reuseIdentifier;
  id v15 = v6;
  id v22 = v15;
  uint64_t v16 = (void *)MEMORY[0x223C21E30](&v18);
  id v17 = self->_askForTimeResource;
  if (a3 == 60.0) {
    -[STAskForTimeResource approveOneMoreMinuteWithCompletionHandler:](v17, "approveOneMoreMinuteWithCompletionHandler:", v16, v18, v19, v20, v21);
  }
  else {
    -[STAskForTimeResource approveAdditionalTime:completionHandler:](v17, "approveAdditionalTime:completionHandler:", v16, v10, v18, v19, v20, v21);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

void __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[STBlockingUILog log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      *(_DWORD *)buf = 138412546;
      char v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Attempt to grant approval for %@{public}@ seconds failed; error: %{public}@",
        buf,
        0x16u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke_36;
    v8[3] = &unk_26449B810;
    objc_copyWeak(v11, (id *)(a1 + 40));
    v11[1] = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v8);

    objc_destroyWeak(v11);
  }
  else
  {
    if (v5)
    {
      double v7 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      *(_DWORD *)buf = 138543362;
      char v13 = v7;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Request to grant approval for %{public}@ seconds was received with no error; should be granted immediately",
        buf,
        0xCu);
    }
  }
}

uint64_t __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (WeakRetained[1] == *(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3) {
        (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)_requestAdditionalTime:(int64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[STBlockingUILog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "Requesting parent for additional time", buf, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  if (self->_askForTimeResource)
  {
    double v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "warning: ask for time request in progress when another one issued", buf, 2u);
    }
  }
  id v9 = [(STLockoutPolicyController *)self _makeAskForTimeResource];
  askForTimeResource = self->_askForTimeResource;
  self->_askForTimeResource = v9;

  double v11 = +[STBlockingUILog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_askForTimeResource;
    char v13 = [NSNumber numberWithDouble:3600.0];
    categoryIdentifier = self->_categoryIdentifier;
    if (categoryIdentifier || (categoryIdentifier = self->_bundleIdentifier) != 0)
    {
      int v15 = 0;
    }
    else
    {
      categoryIdentifier = [(NSURL *)self->_websiteURL host];
      int v15 = 1;
    }
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = categoryIdentifier;
    _os_log_impl(&dword_21E199000, v11, OS_LOG_TYPE_DEFAULT, "Created Ask For Time Resource %@ for additional time %@ for %@", buf, 0x20u);
    if (v15) {
  }
    }
  objc_initWeak((id *)buf, self);
  uint64_t v16 = self->_askForTimeResource;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke;
  v19[3] = &unk_26449B838;
  v21[1] = (id)0x40AC200000000000;
  objc_copyWeak(v21, (id *)buf);
  v21[2] = reuseIdentifier;
  id v17 = v5;
  id v20 = v17;
  [(STAskForTimeResource *)v16 requestAdditionalTime:v19 completionHandler:3600.0];

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[STBlockingUILog log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Requested %@ seconds; error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      double v7 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Requested %@ seconds; request pending", buf, 0xCu);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke_38;
    v9[3] = &unk_26449B860;
    objc_copyWeak(v10, (id *)(a1 + 40));
    v10[1] = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], v9);
    objc_destroyWeak(v10);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke_38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 40))
  {
    id v3 = WeakRetained;
    [WeakRetained _changeInternalStateTo:4];
    id WeakRetained = v3;
  }
}

- (BOOL)_actionOneMoreMinuteWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutPolicyController *)self _authenticatedApproveForAdditionalTime:v4 withCompletionHandler:60.0];

  return 1;
}

- (BOOL)_actionRemindMeInMinutesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutPolicyController *)self _authenticatedApproveForAdditionalTime:v4 withCompletionHandler:900.0];

  return 1;
}

- (BOOL)_actionRemindMeInOneHourWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutPolicyController *)self _authenticatedApproveForAdditionalTime:v4 withCompletionHandler:3600.0];

  return 1;
}

- (BOOL)_actionIgnoreLimitForTodayWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutPolicyController *)self _authenticatedApproveForAdditionalTime:v4 withCompletionHandler:0.0];

  return 1;
}

- (id)_makeAskForTimeResource
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke;
  v11[3] = &unk_26449B8B0;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  id v4 = (void *)MEMORY[0x223C21E30](v11);
  int64_t style = self->_style;
  if (style == 1)
  {
    if (self->_websiteURL)
    {
      id v7 = objc_alloc(MEMORY[0x263F670F8]);
      uint64_t v8 = [(NSURL *)self->_websiteURL host];
      id v9 = (void *)[v7 initWithWebsiteDomain:v8 changeHandler:v4];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (style != 4 || !self->_categoryIdentifier)
  {
LABEL_7:
    uint64_t v6 = [objc_alloc(MEMORY[0x263F670C0]) initWithBundleIdentifier:self->_bundleIdentifier changeHandler:v4];
    goto LABEL_8;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263F670D0]) initWithCategoryIdentifier:self->_categoryIdentifier changeHandler:v4];
LABEL_8:
  id v9 = (void *)v6;
LABEL_9:

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v9;
}

void __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  id v15[2] = __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke_2;
  v15[3] = &unk_26449B888;
  objc_copyWeak(v19, (id *)(a1 + 32));
  v19[1] = *(id *)(a1 + 40);
  v19[2] = a2;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(v19);
}

void __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 64))
  {
    id v3 = WeakRetained;
    [WeakRetained _askForTimeResponseWithState:*(void *)(a1 + 72) respondingParent:*(void *)(a1 + 32) amountGranted:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_askForTimeResponseWithState:(int64_t)a3 respondingParent:(id)a4 amountGranted:(id)a5 error:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = +[STBlockingUILog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)objc_super v31 = 67109378;
      *(_DWORD *)&v31[4] = a3;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v12;
      id v14 = "ask for time response: request state %d, error: %@";
      uint64_t v15 = v13;
      uint32_t v16 = 18;
LABEL_4:
      _os_log_impl(&dword_21E199000, v15, OS_LOG_TYPE_DEFAULT, v14, v31, v16);
    }
LABEL_5:
  }
  else
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    switch(a3)
    {
      case 0:
        id v13 = +[STBlockingUILog log];
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        *(_WORD *)objc_super v31 = 0;
        id v14 = "ask for time response: unknown";
        uint64_t v15 = v13;
        uint32_t v16 = 2;
        goto LABEL_4;
      case 1:
        id v17 = +[STBlockingUILog log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v31 = 0;
          _os_log_impl(&dword_21E199000, v17, OS_LOG_TYPE_DEFAULT, "ask for time response: request pending", v31, 2u);
        }

        id v18 = self;
        uint64_t v19 = 4;
        goto LABEL_29;
      case 2:
        id v20 = +[STBlockingUILog log];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_WORD *)objc_super v31 = 0;
        uint64_t v21 = "ask for time response: timeout";
        goto LABEL_17;
      case 3:
        id v20 = +[STBlockingUILog log];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_WORD *)objc_super v31 = 0;
        uint64_t v21 = "ask for time response: canceled";
LABEL_17:
        _os_log_impl(&dword_21E199000, v20, OS_LOG_TYPE_DEFAULT, v21, v31, 2u);
LABEL_18:

        askForTimeResource = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        [(STLockoutPolicyController *)self _changeStateToBeforePending];
        break;
      case 4:
        id v23 = +[STBlockingUILog log];
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (!v24) {
            goto LABEL_28;
          }
          *(_DWORD *)objc_super v31 = 138412546;
          *(void *)&v31[4] = v10;
          *(_WORD *)&v31[12] = 2112;
          *(void *)&v31[14] = v11;
          v25 = "ask for time response: parent %@ approved for %@ seconds";
          __int16 v26 = v23;
          uint32_t v27 = 22;
        }
        else
        {
          if (!v24) {
            goto LABEL_28;
          }
          *(_DWORD *)objc_super v31 = 138412290;
          *(void *)&v31[4] = v10;
          v25 = "ask for time response: parent %@ approved for rest of day";
          __int16 v26 = v23;
          uint32_t v27 = 12;
        }
        _os_log_impl(&dword_21E199000, v26, OS_LOG_TYPE_DEFAULT, v25, v31, v27);
LABEL_28:

        id v30 = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        id v18 = self;
        uint64_t v19 = 5;
LABEL_29:
        -[STLockoutPolicyController _changeInternalStateTo:](v18, "_changeInternalStateTo:", v19, *(_OWORD *)v31, *(void *)&v31[16], v32);
        break;
      case 5:
        uint64_t v28 = +[STBlockingUILog log];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v31 = 0;
          _os_log_impl(&dword_21E199000, v28, OS_LOG_TYPE_DEFAULT, "ask for time response: disapproved", v31, 2u);
        }

        v29 = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        id v18 = self;
        uint64_t v19 = 6;
        goto LABEL_29;
      default:
        break;
    }
  }
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (void)setWebsiteURL:(id)a3
{
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (unint64_t)state
{
  return self->_state;
}

- (STConversation)conversation
{
  return (STConversation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setConversation:(id)a3
{
}

- (STConversationContext)conversationContext
{
  return (STConversationContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setConversationContext:(id)a3
{
}

- (NSArray)contactsHandles
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setContactsHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsHandles, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_websitePolicyMonitor, 0);
  objc_storeStrong((id *)&self->_websiteURL, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_categoryPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_askForTimeResource, 0);

  objc_storeStrong((id *)&self->_managementState, 0);
}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_21E199000, v1, OS_LOG_TYPE_FAULT, "Failed to request a conversation: %{public}@ for bundle identifier: %{public}@", v2, 0x16u);
}

- (void)iCloudContainer
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21E199000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch Contact containers: %{public}@", v1, 0xCu);
}

- (void)shouldAllowOneMoreMinute
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_21E199000, a2, OS_LOG_TYPE_FAULT, "Website URL does not have a host: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_changePolicyToCurrentWithCategoryIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "change policy to current error: missing category identifier", v2, v3, v4, v5, v6);
}

- (void)_changePolicyToCurrentWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "change policy to current error: missing application bundle identifier", v2, v3, v4, v5, v6);
}

- (void)_changePolicyToCurrentWithURL:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "change policy to current error: missing website URL", v2, v3, v4, v5, v6);
}

- (void)_handleChangeToPolicy:.cold.1()
{
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_21E199000, v0, OS_LOG_TYPE_FAULT, "unexpected policy Shielded", v1, 2u);
}

@end