@interface RadioAvailabilityController
- (BOOL)_calculateRadioRestricted;
- (BOOL)hasLoadedRadioAvailability;
- (BOOL)isRadioAvailable;
- (RadioAvailabilityController)init;
- (id)_currentStoreFrontIdentifier;
- (id)_userDefaultsDomain;
- (void)_currentStoreFrontIdentifierWithCompletion:(id)a3;
- (void)_reloadRadioBagAvailabilityWithCompletionHandler:(id)a3;
- (void)_reloadRadioRestriction;
- (void)_updateRadioAvailabilityAllowingNotifications:(BOOL)a3;
- (void)_updateRadioAvailabilityWithStoreURLBag:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)getRadioAvailabilityWithCompletionHandler:(id)a3;
@end

@implementation RadioAvailabilityController

uint64_t __47__RadioAvailabilityController_isRadioAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 33);
  return result;
}

uint64_t __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateRadioAvailabilityWithStoreURLBag:a2 error:a3 completionHandler:*(void *)(a1 + 40)];
}

void __77__RadioAvailabilityController__updateRadioAvailabilityAllowingNotifications___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RadioAvailabilityControllerRadioAvailableDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 40) BOOLValue];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 != v2)
  {
    uint64_t v4 = [NSNumber numberWithBool:v3 != 0];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    [*(id *)(a1 + 32) _updateRadioAvailabilityAllowingNotifications:1];
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_3;
    block[3] = &unk_2643AA498;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    id v14 = v9;
    block[4] = v10;
    id v13 = v11;
    dispatch_async(v8, block);
  }
}

- (RadioAvailabilityController)init
{
  v19.receiver = self;
  v19.super_class = (Class)RadioAvailabilityController;
  int v2 = [(RadioAvailabilityController *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.calloutSerialQueue", 0);
    calloutSerialQueue = v2->_calloutSerialQueue;
    v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Radio.RadioAvailabilityController.restrictionLoadQueue", 0);
    restrictionLoadQueue = v2->_restrictionLoadQueue;
    v2->_restrictionLoadQueue = (OS_dispatch_queue *)v7;

    id v9 = [(RadioAvailabilityController *)v2 _currentStoreFrontIdentifier];
    uint64_t v10 = (void *)CFPreferencesCopyAppValue(@"RadioLastKnownAvailableStoreFrontIdentifier", (CFStringRef)[(RadioAvailabilityController *)v2 _userDefaultsDomain]);
    if ([v10 isNSString] && objc_msgSend(v10, "isEqualToString:", v9))
    {
      isRadioAvailableFromBag = v2->_isRadioAvailableFromBag;
      v2->_isRadioAvailableFromBag = (NSNumber *)MEMORY[0x263EFFA88];
    }
    else
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IsRadioAvailable", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
LABEL_8:
        v15 = [MEMORY[0x263F53C50] sharedConnection];
        [v15 registerObserver:v2];
        v16 = [MEMORY[0x263F89110] sharedMonitor];
        [v16 registerObserver:v2];

        v2->_isRadioRestricted = [(RadioAvailabilityController *)v2 _calculateRadioRestricted];
        [(RadioAvailabilityController *)v2 _updateRadioAvailabilityAllowingNotifications:0];
        [(RadioAvailabilityController *)v2 _reloadRadioBagAvailabilityWithCompletionHandler:0];

        return v2;
      }
      BOOL v13 = AppBooleanValue != 0;
      CFPreferencesSetAppValue(@"IsRadioAvailable", 0, @"com.apple.mobileipod");
      uint64_t v14 = [NSNumber numberWithBool:v13];
      isRadioAvailableFromBag = v2->_isRadioAvailableFromBag;
      v2->_isRadioAvailableFromBag = (NSNumber *)v14;
    }

    goto LABEL_8;
  }
  return v2;
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 56)) {
    dispatch_queue_t v3 = a2;
  }
  else {
    dispatch_queue_t v3 = 0;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  CFPreferencesSetAppValue(@"RadioLastKnownAvailableStoreFrontIdentifier", v3, (CFStringRef)[v4 _userDefaultsDomain]);

  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_queue_t v7 = *(NSObject **)(v6 + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_2;
  v8[3] = &unk_2643AA4C0;
  v8[4] = v6;
  char v11 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  dispatch_barrier_async(v7, v8);
}

- (id)_userDefaultsDomain
{
  int v2 = [MEMORY[0x263F086E0] mainBundle];
  dispatch_queue_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)_updateRadioAvailabilityAllowingNotifications:(BOOL)a3
{
  if ([(NSNumber *)self->_isRadioAvailableFromBag BOOLValue]) {
    BOOL v4 = !self->_isRadioRestricted;
  }
  else {
    BOOL v4 = 0;
  }
  if (self->_isRadioAvailable != v4)
  {
    self->_isRadioAvailable = v4;
    calloutSerialQueue = self->_calloutSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__RadioAvailabilityController__updateRadioAvailabilityAllowingNotifications___block_invoke;
    block[3] = &unk_2643AA648;
    block[4] = self;
    dispatch_async(calloutSerialQueue, block);
  }
}

- (void)_reloadRadioBagAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F89360]) initWithBlock:&__block_literal_global_1057];
  uint64_t v6 = [MEMORY[0x263F893A0] sharedBagProvider];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_2643AA448;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getBagForRequestContext:v5 withCompletionHandler:v8];
}

- (id)_currentStoreFrontIdentifier
{
  int v2 = [MEMORY[0x263F893C8] defaultIdentityStore];
  dispatch_queue_t v3 = [MEMORY[0x263F893C0] activeAccount];
  id v4 = [v2 getPropertiesForUserIdentity:v3 error:0];

  id v5 = [v4 storefrontIdentifier];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F893C8] defaultIdentityStore];
    id v7 = [v6 localStoreAccountProperties];
    id v5 = [v7 storefrontIdentifier];
  }
  return v5;
}

void __74__RadioAvailabilityController__currentStoreFrontIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 storefrontIdentifier];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F893C8] defaultIdentityStore];
    id v7 = [v6 localStoreAccountProperties];
    id v5 = [v7 storefrontIdentifier];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_calculateRadioRestricted
{
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53A10]] == 2;

  return v3;
}

- (void)_updateRadioAvailabilityWithStoreURLBag:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = [v11 radioConfigurationDictionary];
    BOOL v16 = v15 != 0;

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke;
    v21[3] = &unk_2643AA4E8;
    BOOL v24 = v16;
    id v22 = 0;
    id v23 = v10;
    v21[4] = self;
    id v17 = v10;
    [(RadioAvailabilityController *)self _currentStoreFrontIdentifierWithCompletion:v21];

    uint64_t v14 = v23;
    goto LABEL_6;
  }
  id v11 = [[RadioStoreBag alloc] _initWithURLBag:v8];
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  calloutSerialQueue = self->_calloutSerialQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_4;
  v18[3] = &unk_2643AA510;
  id v20 = v10;
  id v19 = v9;
  id v13 = v10;
  dispatch_async(calloutSerialQueue, v18);

  uint64_t v14 = v20;
LABEL_6:
}

void __80__RadioAvailabilityController__reloadRadioBagAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAllowsExpiredBags:1];
  id v3 = [MEMORY[0x263F893C0] activeAccount];
  [v2 setIdentity:v3];
}

- (void)_currentStoreFrontIdentifierWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F893C8] defaultIdentityStore];
  id v5 = [MEMORY[0x263F893C0] activeAccount];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__RadioAvailabilityController__currentStoreFrontIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_2643AA400;
  id v8 = v3;
  id v6 = v3;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v7];
}

- (BOOL)isRadioAvailable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__RadioAvailabilityController_isRadioAvailable__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveAccountUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_isRadioAvailableFromBag, 0);
  objc_storeStrong((id *)&self->_restrictionLoadQueue, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "msv_errorByRemovingUnsafeUserInfo");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __95__RadioAvailabilityController__updateRadioAvailabilityWithStoreURLBag_error_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 33);
  objc_msgSend(*(id *)(a1 + 40), "msv_errorByRemovingUnsafeUserInfo");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
}

- (void)_reloadRadioRestriction
{
  restrictionLoadQueue = self->_restrictionLoadQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(restrictionLoadQueue, block);
}

void __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _calculateRadioRestricted];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke_2;
  v5[3] = &unk_2643AA470;
  v5[4] = v3;
  char v6 = v2;
  dispatch_barrier_async(v4, v5);
}

uint64_t __54__RadioAvailabilityController__reloadRadioRestriction__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 48) != v2)
  {
    *(unsigned char *)(v1 + 48) = v2;
    return [*(id *)(result + 32) _updateRadioAvailabilityAllowingNotifications:1];
  }
  return result;
}

- (void)getRadioAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_2643AA510;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(unsigned char *)(v2 + 32))
  {
    if (v3)
    {
      char v4 = *(unsigned char *)(v2 + 33);
      id v5 = *(NSObject **)(v2 + 16);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke_2;
      v6[3] = &unk_2643AA3D8;
      id v7 = v3;
      char v8 = v4;
      dispatch_async(v5, v6);
    }
  }
  else
  {
    [(id)v2 _reloadRadioBagAvailabilityWithCompletionHandler:v3];
  }
}

uint64_t __73__RadioAvailabilityController_getRadioAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (BOOL)hasLoadedRadioAvailability
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__RadioAvailabilityController_hasLoadedRadioAvailability__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__RadioAvailabilityController_hasLoadedRadioAvailability__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40) != 0;
  return result;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if ([a3 isRemoteServerLikelyReachable])
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__RadioAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
    block[3] = &unk_2643AA648;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

unsigned char *__78__RadioAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[32]) {
    return (unsigned char *)[result _reloadRadioBagAvailabilityWithCompletionHandler:0];
  }
  return result;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];
  char v4 = [MEMORY[0x263F89110] sharedMonitor];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RadioAvailabilityController;
  [(RadioAvailabilityController *)&v5 dealloc];
}

@end