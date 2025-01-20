@interface SSVSubscriptionStatusCoordinator
+ (id)_changeNotificationSuspensionAccessQueue;
+ (id)_existingSharedCoordinator;
+ (id)copyStatusFromUserDefaults;
+ (id)sharedCoordinator;
+ (void)_sendChangeNotification;
+ (void)beginSuspendingSubscriptionStatusChangeNotifications;
+ (void)endSuspendingSubscriptionStatusChangeNotifications;
+ (void)removeUserDefaultsForAccountIdentifier:(id)a3;
+ (void)sendChangeNotification;
+ (void)updateUserDefaultsWithStatus:(id)a3;
+ (void)updateWithResponseDictionary:(id)a3 accountIdentifier:(id)a4;
- (SSVSubscriptionStatus)lastKnownStatus;
- (SSVSubscriptionStatusCoordinator)init;
- (id)_copyStatusDateFromUserDefaults;
- (id)_copyStatusFromUserDefaults;
- (id)_copyValidStatusForStatus:(id)a3;
- (void)_accountStoreChangedNotification;
- (void)_deviceStoreFrontChangedNotification;
- (void)_externalChangeNotification;
- (void)_fireStatusBlocksWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5;
- (void)_handleRequestResponseWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5;
- (void)_invalidateLastKnownStatus;
- (void)_updateSubscriptionStatusAccessPolicyAllowingNotification:(BOOL)a3;
- (void)_validateLastKnownStatus;
- (void)dealloc;
- (void)getStatusWithOptions:(id)a3 statusBlock:(id)a4;
- (void)modifyLastKnownStatusUsingBlock:(id)a3;
- (void)reset;
@end

@implementation SSVSubscriptionStatusCoordinator

- (SSVSubscriptionStatusCoordinator)init
{
  v17.receiver = self;
  v17.super_class = (Class)SSVSubscriptionStatusCoordinator;
  v2 = [(SSVSubscriptionStatusCoordinator *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionStatusCoordinator.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionStatusCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__SSVSubscriptionStatusCoordinator_init__block_invoke;
    handler[3] = &unk_1E5BA7F98;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.itunesstored.ssvsubscriptionstatuscoordinator.changed", &v2->_notificationToken, v7, handler);
    v8 = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SSVSubscriptionStatusCoordinator_init__block_invoke_2;
    block[3] = &unk_1E5BA7040;
    v9 = v2;
    v13 = v9;
    dispatch_sync(v8, block);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__accountStoreChangedNotification name:0x1EF971EB0 object:0];
    [v10 addObserver:v9 selector:sel__deviceStoreFrontChangedNotification name:@"SSDeviceStoreFrontChangedNotification" object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__SSVSubscriptionStatusCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _externalChangeNotification];
}

uint64_t __40__SSVSubscriptionStatusCoordinator_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSubscriptionStatusAccessPolicyAllowingNotification:0];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1EF971EB0 object:0];
  [v3 removeObserver:self name:@"SSDeviceStoreFrontChangedNotification" object:0];
  notify_cancel(self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)SSVSubscriptionStatusCoordinator;
  [(SSVSubscriptionStatusCoordinator *)&v4 dealloc];
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSVSubscriptionStatusCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sOnce != -1) {
    dispatch_once(&sOnce, block);
  }
  v2 = (void *)sCoordinator;
  return v2;
}

void __53__SSVSubscriptionStatusCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sCoordinator;
  sCoordinator = (uint64_t)v1;
}

+ (id)copyStatusFromUserDefaults
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"FuseSubscriptionStatus", @"com.apple.itunesstored");
  if (!v2) {
    return 0;
  }
  dispatch_queue_t v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFDictionaryGetTypeID()) {
    dispatch_queue_t v5 = [[SSVSubscriptionStatus alloc] initWithUserDefaultsRepresentation:v3];
  }
  else {
    dispatch_queue_t v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

- (void)getStatusWithOptions:(id)a3 statusBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke(id *a1)
{
  CFPropertyListRef v2 = [a1[4] objectForKey:@"SSVSubscriptionStatusOptionIgnoreCache"];
  char v3 = [v2 BOOLValue];

  if (v3) {
    goto LABEL_2;
  }
  if (*((void *)a1[5] + 5))
  {
    dispatch_queue_t v5 = [a1[4] objectForKey:@"SSVSubscriptionStatusOptionAllowsExpiredStatuses"];
    char v6 = [v5 BOOLValue];

    if ((v6 & 1) != 0
      || *((void *)a1[5] + 6)
      && ([MEMORY[0x1E4F1C9C8] date],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 timeIntervalSinceDate:*((void *)a1[5] + 6)],
          double v9 = v8,
          v7,
          v9 <= 3600.0))
    {
      CFTypeID v4 = (void *)[a1[5] _copyValidStatusForStatus:*((void *)a1[5] + 5)];
      goto LABEL_15;
    }
  }
  id v10 = [a1[4] objectForKey:@"SSVSubscriptionStatusOptionAllowsExpiredStatuses"];
  char v11 = [v10 BOOLValue];

  if (v11) {
    goto LABEL_10;
  }
  CFTypeID v4 = (void *)[a1[5] _copyStatusDateFromUserDefaults];
  if (!v4) {
    goto LABEL_15;
  }
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceDate:v4];
  double v14 = v13;

  if (v14 > 3600.0)
  {
LABEL_2:
    CFTypeID v4 = 0;
  }
  else
  {
LABEL_10:
    id v15 = (void *)[a1[5] _copyStatusFromUserDefaults];
    if (v15) {
      CFTypeID v4 = (void *)[a1[5] _copyValidStatusForStatus:v15];
    }
    else {
      CFTypeID v4 = 0;
    }
  }
LABEL_15:
  if (![v4 carrierBundlingStatus] || objc_msgSend(v4, "carrierBundlingStatus") == 3) {
    goto LABEL_17;
  }
  if ([v4 accountStatus])
  {
    if (!v4) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v33 = [v4 carrierBundlingStatus];
    if (!v4 || v33 != 4) {
      goto LABEL_17;
    }
  }
  v34 = [v4 subscriptionExpirationDate];
  if (!v34
    || (v35 = v34, [v34 timeIntervalSinceNow], double v37 = v36, v35, v37 > 2.22044605e-16))
  {
    v38 = *((void *)a1[5] + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_2;
    block[3] = &unk_1E5BA7328;
    id v44 = a1[6];
    id v43 = v4;
    dispatch_async(v38, block);

    goto LABEL_31;
  }
LABEL_17:
  id v16 = a1[6];
  if (v16)
  {
    objc_super v17 = (void *)[v16 copy];
    v18 = (void *)*((void *)a1[5] + 9);
    if (!v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20 = a1[5];
      v21 = (void *)v20[9];
      v20[9] = v19;

      v18 = (void *)*((void *)a1[5] + 9);
    }
    v22 = (void *)MEMORY[0x1A6268200](v17);
    [v18 addObject:v22];
  }
  if (!*((void *)a1[5] + 1))
  {
    v23 = objc_alloc_init(SSVSubscriptionStatusRequest);
    v24 = a1[5];
    v25 = (void *)v24[1];
    v24[1] = v23;

    v26 = (void *)*((void *)a1[5] + 1);
    v27 = [a1[4] objectForKey:@"SSVSubscriptionStatusOptionAuthenticatesIfNecessary"];
    objc_msgSend(v26, "setAuthenticatesIfNecessary:", objc_msgSend(v27, "BOOLValue"));

    [*((id *)a1[5] + 1) setCarrierBundleProvisioningStyle:1];
    v28 = (void *)*((void *)a1[5] + 1);
    v29 = [a1[4] objectForKey:@"SSVSubscriptionStatusOptionLocalizedAuthenticationReason"];
    [v28 setLocalizedAuthenticationReason:v29];

    v30 = (void *)*((void *)a1[5] + 1);
    v31 = [a1[4] objectForKey:@"reason"];
    [v30 setReason:v31];

    objc_initWeak(&location, a1[5]);
    v32 = (void *)*((void *)a1[5] + 1);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_3;
    v39[3] = &unk_1E5BA7FC0;
    objc_copyWeak(&v40, &location);
    [v32 startWithStatusResponseBlock:v39];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
LABEL_31:
}

uint64_t __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, *(void *)(a1 + 32), 1, 0);
  }
  return result;
}

void __69__SSVSubscriptionStatusCoordinator_getStatusWithOptions_statusBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  char v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleRequestResponseWithStatus:v8 isFinal:a3 error:v7];
}

- (void)_deviceStoreFrontChangedNotification
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SSVSubscriptionStatusCoordinator__deviceStoreFrontChangedNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __72__SSVSubscriptionStatusCoordinator__deviceStoreFrontChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _externalChangeNotification];
}

- (SSVSubscriptionStatus)lastKnownStatus
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SSVSubscriptionStatusCoordinator_lastKnownStatus__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVSubscriptionStatus *)v3;
}

void __51__SSVSubscriptionStatusCoordinator_lastKnownStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    uint64_t v3 = objc_msgSend((id)v2, "_copyValidStatusForStatus:");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_queue_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    if (*(unsigned char *)(v2 + 24)) {
      return;
    }
    dispatch_queue_t v5 = (void *)[(id)v2 _copyStatusFromUserDefaults];
    if (v5)
    {
      double v9 = v5;
      uint64_t v6 = [*(id *)(a1 + 32) _copyValidStatusForStatus:v5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      dispatch_queue_t v5 = v9;
    }
  }
}

- (void)modifyLastKnownStatusUsingBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SSVSubscriptionStatusCoordinator_modifyLastKnownStatusUsingBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__SSVSubscriptionStatusCoordinator_modifyLastKnownStatusUsingBlock___block_invoke(uint64_t a1)
{
  id v6 = *(id *)(*(void *)(a1 + 32) + 40);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = v6;
  if (v6)
  {
    uint64_t v3 = [v6 copy];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_queue_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v6;
  }
}

- (void)reset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSVSubscriptionStatusCoordinator_reset__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __41__SSVSubscriptionStatusCoordinator_reset__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_queue_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

+ (void)updateUserDefaultsWithStatus:(id)a3
{
  uint64_t v3 = (void *)[a3 copyUserDefaultsRepresentation];
  if (v3)
  {
    id v6 = v3;
    id v4 = v3;
    CFPreferencesSetAppValue(@"FuseSubscriptionStatus", v4, @"com.apple.itunesstored");
    CFRelease(v4);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    CFPreferencesSetAppValue(@"FuseSubscriptionStatusDate", v5, @"com.apple.itunesstored");
    CFRelease(v5);
    CFPreferencesAppSynchronize(@"com.apple.itunesstored");
    uint64_t v3 = v6;
  }
}

+ (id)_existingSharedCoordinator
{
  return (id)sCoordinator;
}

- (void)_invalidateLastKnownStatus
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSVSubscriptionStatusCoordinator__invalidateLastKnownStatus__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __62__SSVSubscriptionStatusCoordinator__invalidateLastKnownStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

- (void)_accountStoreChangedNotification
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SSVSubscriptionStatusCoordinator__accountStoreChangedNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __68__SSVSubscriptionStatusCoordinator__accountStoreChangedNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateLastKnownStatus];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateSubscriptionStatusAccessPolicyAllowingNotification:1];
}

- (id)_copyStatusFromUserDefaults
{
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"FuseSubscriptionStatus", @"com.apple.itunesstored");
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFDictionaryGetTypeID()) {
    id v5 = [[SSVSubscriptionStatus alloc] initWithUserDefaultsRepresentation:v3];
  }
  else {
    id v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

- (id)_copyStatusDateFromUserDefaults
{
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"FuseSubscriptionStatusDate", @"com.apple.itunesstored");
  uint64_t v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFDateGetTypeID())
    {
      CFRelease(v3);
      return 0;
    }
  }
  return (id)v3;
}

- (id)_copyValidStatusForStatus:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    CFTypeID v4 = +[SSAccountStore defaultStore];
    id v5 = [v4 activeAccount];
    id v6 = [v5 uniqueIdentifier];

    uint64_t v7 = [v3 accountIdentifier];
    id v8 = (void *)v7;
    if (v6 == (void *)v7)
    {
      int v9 = 1;
    }
    else if (v7)
    {
      int v9 = [v6 isEqualToNumber:v7];
    }
    else
    {
      int v9 = 0;
    }
    id v11 = +[SSVTelephonyController sharedController];
    if (([v11 isPhoneNumberAccessRestricted] & 1) == 0)
    {
      id v12 = [v11 phoneNumber];
      uint64_t v13 = [v3 phoneNumber];
      if (v12 != (void *)v13)
      {
        double v14 = (void *)v13;
        if (v13) {
          int v15 = [v12 isEqualToString:v13];
        }
        else {
          int v15 = 0;
        }

        if ((v9 | v15) != 1)
        {
          id v10 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_14:
        id v16 = (void *)[v3 copy];
        id v10 = v16;
        if ((v9 & 1) == 0) {
          [v16 resetAccountBasedProperties];
        }
        if ((v15 & 1) == 0) {
          [v10 resetCarrierBundlingProperties];
        }
        goto LABEL_21;
      }
    }
    LOBYTE(v15) = 1;
    goto LABEL_14;
  }
  id v10 = 0;
LABEL_22:

  return v10;
}

- (void)_externalChangeNotification
{
  lastKnownStatus = self->_lastKnownStatus;
  if (lastKnownStatus)
  {
    self->_didReset = 0;
    self->_lastKnownStatus = 0;

    lastStatusDate = self->_lastStatusDate;
    self->_lastStatusDate = 0;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SSVSubscriptionStatusCoordinator__externalChangeNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __63__SSVSubscriptionStatusCoordinator__externalChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVSubscriptionStatusDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_fireStatusBlocksWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[(NSMutableArray *)self->_statusBlocks copy];
  if (v6) {
    [(NSMutableArray *)self->_statusBlocks removeAllObjects];
  }
  if ([v10 count])
  {
    callbackQueue = self->_callbackQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SSVSubscriptionStatusCoordinator__fireStatusBlocksWithStatus_isFinal_error___block_invoke;
    v12[3] = &unk_1E5BA7FE8;
    id v13 = v10;
    id v14 = v8;
    BOOL v16 = v6;
    id v15 = v9;
    dispatch_async(callbackQueue, v12);
  }
}

void __78__SSVSubscriptionStatusCoordinator__fireStatusBlocksWithStatus_isFinal_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
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

- (void)_handleRequestResponseWithStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__SSVSubscriptionStatusCoordinator__handleRequestResponseWithStatus_isFinal_error___block_invoke;
  v13[3] = &unk_1E5BA7FE8;
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __83__SSVSubscriptionStatusCoordinator__handleRequestResponseWithStatus_isFinal_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 32))
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 24) = 0;
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void **)(v3 + 48);
      *(void *)(v3 + 48) = v2;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    long long v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;

    BOOL v7 = *(unsigned char *)(a1 + 56) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  return [v8 _fireStatusBlocksWithStatus:v9 isFinal:v7 error:v10];
}

- (void)_updateSubscriptionStatusAccessPolicyAllowingNotification:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v5 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:@"com.apple.onboarding.applemusic"];
  if (self->_subscriptionStatusAccessPolicy != v5)
  {
    self->_subscriptionStatusAccessPolicy = v5;
    if (v3)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__SSVSubscriptionStatusCoordinator__updateSubscriptionStatusAccessPolicyAllowingNotification___block_invoke;
      block[3] = &unk_1E5BA7040;
      void block[4] = self;
      dispatch_async(callbackQueue, block);
    }
  }
}

void __94__SSVSubscriptionStatusCoordinator__updateSubscriptionStatusAccessPolicyAllowingNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVSubscriptionStatusAccessPolicyDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_validateLastKnownStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_lastKnownStatus)
  {
    BOOL v3 = -[SSVSubscriptionStatusCoordinator _copyValidStatusForStatus:](self, "_copyValidStatusForStatus:");
    lastKnownStatus = self->_lastKnownStatus;
    self->_lastKnownStatus = v3;

    if (!self->_lastKnownStatus)
    {
      lastStatusDate = self->_lastStatusDate;
      self->_lastStatusDate = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBlocks, 0);
  objc_storeStrong((id *)&self->_lastStatusDate, 0);
  objc_storeStrong((id *)&self->_lastKnownStatus, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
}

+ (void)beginSuspendingSubscriptionStatusChangeNotifications
{
  id v2 = [a1 _changeNotificationSuspensionAccessQueue];
  dispatch_sync(v2, &__block_literal_global_36);
}

void __97__SSVSubscriptionStatusCoordinator_Private__beginSuspendingSubscriptionStatusChangeNotifications__block_invoke()
{
}

+ (void)endSuspendingSubscriptionStatusChangeNotifications
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  BOOL v3 = [a1 _changeNotificationSuspensionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SSVSubscriptionStatusCoordinator_Private__endSuspendingSubscriptionStatusChangeNotifications__block_invoke;
  block[3] = &unk_1E5BA7298;
  void block[4] = &v5;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v6 + 24)) {
    [a1 _sendChangeNotification];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __95__SSVSubscriptionStatusCoordinator_Private__endSuspendingSubscriptionStatusChangeNotifications__block_invoke(uint64_t result)
{
  if (!--_SSVSubscriptionStatusChangeNotificationSuspensionCount)
  {
    char v1 = _SSVSubscriptionStatusChangeNotificationWasDeferred;
    if (_SSVSubscriptionStatusChangeNotificationWasDeferred == 1)
    {
      _SSVSubscriptionStatusChangeNotificationWasDeferred = 0;
      *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v1;
    }
  }
  return result;
}

+ (void)removeUserDefaultsForAccountIdentifier:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)[a1 copyStatusFromUserDefaults];
  uint64_t v5 = [v4 accountIdentifier];
  if (v6 && v5 && [v6 isEqual:v5])
  {
    [v4 resetAccountBasedProperties];
    [a1 updateUserDefaultsWithStatus:v4];
  }
}

+ (void)sendChangeNotification
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  BOOL v3 = [a1 _changeNotificationSuspensionAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SSVSubscriptionStatusCoordinator_Private__sendChangeNotification__block_invoke;
  block[3] = &unk_1E5BA7298;
  void block[4] = &v5;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v6 + 24)) {
    [a1 _sendChangeNotification];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __67__SSVSubscriptionStatusCoordinator_Private__sendChangeNotification__block_invoke(uint64_t result)
{
  if (_SSVSubscriptionStatusChangeNotificationSuspensionCount) {
    _SSVSubscriptionStatusChangeNotificationWasDeferred = 1;
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

+ (void)updateWithResponseDictionary:(id)a3 accountIdentifier:(id)a4
{
  id v26 = a4;
  id v6 = [a3 objectForKey:@"subscriptionStatus"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SSAccountStore defaultStore];
    char v8 = [v7 activeAccount];
    id v9 = [v8 uniqueIdentifier];

    if (v9) {
      BOOL v10 = v9 == v26;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10 && (!v26 || ![v26 isEqualToNumber:v9])) {
      goto LABEL_31;
    }
    id v11 = objc_alloc_init(SSVSubscriptionStatus);
    [(SSVSubscriptionStatus *)v11 setAccountIdentifier:v26];
    [(SSVSubscriptionStatus *)v11 setValuesUsingStatusDictionary:v6];
    id v12 = (SSVSubscriptionStatus *)[a1 copyStatusFromUserDefaults];
    if (!v12)
    {
      id v22 = a1;
      v23 = v11;
      goto LABEL_29;
    }
    uint64_t v13 = [(SSVSubscriptionStatus *)v11 accountStatus];
    uint64_t v14 = [(SSVSubscriptionStatus *)v12 accountStatus];
    BOOL v15 = v13 != v14;
    if (v13 != v14) {
      [(SSVSubscriptionStatus *)v12 setAccountStatus:v13];
    }
    uint64_t v16 = [(SSVSubscriptionStatus *)v11 carrierBundlingStatus];
    if (v16 != [(SSVSubscriptionStatus *)v12 carrierBundlingStatus])
    {
      [(SSVSubscriptionStatus *)v12 setCarrierBundlingStatus:v16];
      BOOL v15 = 1;
    }
    id v17 = [(SSVSubscriptionStatus *)v12 accountIdentifier];
    if (v17 == v26)
    {
    }
    else
    {
      if (v26
        && ([(SSVSubscriptionStatus *)v12 accountIdentifier],
            (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v19 = (void *)v18;
        v20 = [(SSVSubscriptionStatus *)v12 accountIdentifier];
        char v21 = [v26 isEqualToNumber:v20];

        if (v21) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      [(SSVSubscriptionStatus *)v12 setAccountIdentifier:v26];
      BOOL v15 = 1;
    }
LABEL_22:
    uint64_t v24 = [(SSVSubscriptionStatus *)v11 acceptedStoreTermsVersion];
    if (v24 != [(SSVSubscriptionStatus *)v12 acceptedStoreTermsVersion])
    {
      [(SSVSubscriptionStatus *)v12 setAcceptedStoreTermsVersion:v24];
      BOOL v15 = 1;
    }
    uint64_t v25 = [(SSVSubscriptionStatus *)v11 latestStoreTermsVersion];
    if (v25 == [(SSVSubscriptionStatus *)v12 latestStoreTermsVersion])
    {
      if (!v15) {
        goto LABEL_30;
      }
    }
    else
    {
      [(SSVSubscriptionStatus *)v12 setLatestStoreTermsVersion:v25];
    }
    id v22 = a1;
    v23 = v12;
LABEL_29:
    [v22 updateUserDefaultsWithStatus:v23];
    [a1 sendChangeNotification];
LABEL_30:

LABEL_31:
  }
}

+ (id)_changeNotificationSuspensionAccessQueue
{
  if (_changeNotificationSuspensionAccessQueue_sOnceToken != -1) {
    dispatch_once(&_changeNotificationSuspensionAccessQueue_sOnceToken, &__block_literal_global_5);
  }
  id v2 = (void *)_changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue;
  return v2;
}

void __85__SSVSubscriptionStatusCoordinator_Private___changeNotificationSuspensionAccessQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.itunesstored.SSVSubscriptionStatusCoordinator.changeNotificationSuspensionAccessQueue", 0);
  char v1 = (void *)_changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue;
  _changeNotificationSuspensionAccessQueue_sChangeNotificationSuspensionAccessQueue = (uint64_t)v0;
}

+ (void)_sendChangeNotification
{
}

@end