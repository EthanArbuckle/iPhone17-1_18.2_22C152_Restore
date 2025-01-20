@interface ICTelephonyController
+ (ICTelephonyController)sharedController;
- (BOOL)_ensureTelephonyHandlesAreReady;
- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 error:(id *)a5;
- (NSString)IMEI;
- (NSString)mobileSubscriberCountryCode;
- (NSString)mobileSubscriberNetworkCode;
- (NSString)phoneNumber;
- (NSString)providerName;
- (id)_init;
- (id)_telephonyClient;
- (id)_telephonySubscriptionContext;
- (void)_handleActiveSubscriptionsDidChange;
- (void)_updatePhoneNumberAllowingDidChangeNotification:(BOOL)a3;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)phoneNumberAvailable:(id)a3;
- (void)phoneNumberChanged:(id)a3;
@end

@implementation ICTelephonyController

- (NSString)phoneNumber
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33316;
  v10 = __Block_byref_object_dispose__33317;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ICTelephonyController_phoneNumber__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

+ (ICTelephonyController)sharedController
{
  if (sharedController_sOnceToken != -1) {
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_33353);
  }
  v2 = (void *)sharedController_sSharedController;

  return (ICTelephonyController *)v2;
}

uint64_t __30__ICTelephonyController__init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumberAllowingDidChangeNotification:0];
}

void __36__ICTelephonyController_phoneNumber__block_invoke(uint64_t a1)
{
}

- (void)_updatePhoneNumberAllowingDidChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if ([(ICTelephonyController *)self _ensureTelephonyHandlesAreReady])
  {
    telephonyClient = self->_telephonyClient;
    telephonySubscriptionContext = self->_telephonySubscriptionContext;
    id v23 = 0;
    v7 = [(CoreTelephonyClient *)telephonyClient getPhoneNumber:telephonySubscriptionContext error:&v23];
    uint64_t v8 = (ICTelephonyController *)v23;
    v9 = v8;
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (v10)
    {
      id v11 = [v7 number];
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony phone number with error: %{public}@.", buf, 0xCu);
      }

      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  v14 = self->_phoneNumber;
  if (v14 == v11)
  {
  }
  else
  {
    v15 = v14;
    char v16 = [(NSString *)v14 isEqual:v11];

    if ((v16 & 1) == 0)
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        phoneNumber = self->_phoneNumber;
        *(_DWORD *)buf = 138412802;
        v25 = self;
        __int16 v26 = 2112;
        v27 = phoneNumber;
        __int16 v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%@ phone number changed from %@ to %@.", buf, 0x20u);
      }

      v19 = (NSString *)[(NSString *)v11 copy];
      v20 = self->_phoneNumber;
      self->_phoneNumber = v19;

      if (v3)
      {
        v21 = dispatch_get_global_queue(0, 0);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __73__ICTelephonyController__updatePhoneNumberAllowingDidChangeNotification___block_invoke;
        v22[3] = &unk_1E5ACD750;
        v22[4] = self;
        dispatch_async(v21, v22);
      }
    }
  }
}

- (BOOL)_ensureTelephonyHandlesAreReady
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v3 = [(ICTelephonyController *)self _telephonyClient];
  if (v3)
  {
    v4 = [(ICTelephonyController *)self _telephonySubscriptionContext];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_telephonyClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  telephonyClient = self->_telephonyClient;
  if (!telephonyClient)
  {
    v4 = +[ICDeviceInfo currentDeviceInfo];
    int v5 = [v4 hasTelephonyCapability];

    if (v5)
    {
      uint64_t v6 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:self->_telephonyCallbackQueue];
      v7 = self->_telephonyClient;
      self->_telephonyClient = v6;

      [(CoreTelephonyClient *)self->_telephonyClient setDelegate:self];
      telephonyClient = self->_telephonyClient;
      if (telephonyClient) {
        goto LABEL_10;
      }
      uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      __int16 v15 = 0;
      v9 = "Failed to instantiate CoreTelephonyClient.";
      BOOL v10 = (uint8_t *)&v15;
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        telephonyClient = self->_telephonyClient;
        goto LABEL_10;
      }
      __int16 v14 = 0;
      v9 = "Current device does not have telephony capability. Skipping telephony client initialization.";
      BOOL v10 = (uint8_t *)&v14;
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_1A2D01000, v11, v12, v9, v10, 2u);
    goto LABEL_9;
  }
LABEL_10:

  return telephonyClient;
}

- (id)_telephonySubscriptionContext
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  p_telephonySubscriptionContext = (id *)&self->_telephonySubscriptionContext;
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  if (!telephonySubscriptionContext)
  {
    int v5 = [(ICTelephonyController *)self _telephonyClient];
    uint64_t v6 = v5;
    if (!v5)
    {
LABEL_15:

      telephonySubscriptionContext = (CTXPCServiceSubscriptionContext *)*p_telephonySubscriptionContext;
      goto LABEL_16;
    }
    id v21 = 0;
    v7 = [v5 getUserDefaultVoiceSubscriptionContext:&v21];
    id v8 = v21;
    v9 = v8;
    if (v7 || !v8)
    {
      if (!v7)
      {
        id v20 = v8;
        BOOL v10 = [v6 getActiveContexts:&v20];
        id v16 = v20;

        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = [v10 subscriptions];
          *(_DWORD *)buf = 138543362;
          id v23 = v18;
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "Could not find a valid telephony subscription context. Available telephony subscription contexts: %{public}@.", buf, 0xCu);
        }
        v9 = v16;
        goto LABEL_14;
      }
      objc_storeStrong(p_telephonySubscriptionContext, v7);
      BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v7 slotID];
        *(_DWORD *)buf = 138543618;
        id v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        id v11 = "Found telephony subscription context %{public}@ at slot %ld as the user default voice one.";
        os_log_type_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 22;
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        id v11 = "Failed to get telephony user default voice subscription context with error: %{public}@.";
        os_log_type_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 12;
LABEL_10:
        _os_log_impl(&dword_1A2D01000, v12, v13, v11, buf, v14);
      }
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return telephonySubscriptionContext;
}

uint64_t __41__ICTelephonyController_sharedController__block_invoke()
{
  sharedController_sSharedController = [[ICTelephonyController alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)ICTelephonyController;
  v2 = [(ICTelephonyController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICTelephonyController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICTelephonyController.telephonyCallbackQueue", 0);
    telephonyCallbackQueue = v2->_telephonyCallbackQueue;
    v2->_telephonyCallbackQueue = (OS_dispatch_queue *)v5;

    v7 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__ICTelephonyController__init__block_invoke;
    block[3] = &unk_1E5ACD750;
    BOOL v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonySubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_telephonyCallbackQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__ICTelephonyController__updatePhoneNumberAllowingDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICTelephonyPhoneNumberDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleActiveSubscriptionsDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  self->_telephonySubscriptionContext = 0;

  [(ICTelephonyController *)self _ensureTelephonyHandlesAreReady];

  [(ICTelephonyController *)self _updatePhoneNumberAllowingDidChangeNotification:1];
}

- (void)phoneNumberChanged:(id)a3
{
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Telephony phone number changed.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ICTelephonyController_phoneNumberChanged___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __44__ICTelephonyController_phoneNumberChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumberAllowingDidChangeNotification:1];
}

- (void)phoneNumberAvailable:(id)a3
{
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Telephony phone number available.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ICTelephonyController_phoneNumberAvailable___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __46__ICTelephonyController_phoneNumberAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumberAllowingDidChangeNotification:1];
}

- (void)activeSubscriptionsDidChange
{
  dispatch_queue_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Telephony active subscriptions did change.", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICTelephonyController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __53__ICTelephonyController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleActiveSubscriptionsDidChange];
}

- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__33316;
  __int16 v24 = __Block_byref_object_dispose__33317;
  id v25 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICTelephonyController_sendSMSWithText_toPhoneNumber_error___block_invoke;
  block[3] = &unk_1E5ACBA08;
  void block[4] = self;
  id v11 = v9;
  id v16 = v11;
  v18 = &v26;
  id v12 = v8;
  id v17 = v12;
  v19 = &v20;
  dispatch_sync(accessQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __61__ICTelephonyController_sendSMSWithText_toPhoneNumber_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F23A08], "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "slotID"), *(void *)(a1 + 40), 0);
    dispatch_queue_t v3 = [MEMORY[0x1E4F239E8] sharedMessageCenter];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [v2 canonicalFormat];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 sendSMSWithText:v4 text:v5 serviceCenter:0 toAddress:v6];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Telephony request to send SMS to %@ failed. Telephony context: %{public}@.", buf, 0x16u);
    }

    unint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 40) slotID];
    if (v10 > 2) {
      id v11 = 0;
    }
    else {
      id v11 = off_1E5ACBA28[v10];
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8000, @"Failed to send SMS using telephony slot: %@.", v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint32_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (NSString)IMEI
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__33316;
  unint64_t v10 = __Block_byref_object_dispose__33317;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__ICTelephonyController_IMEI__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__ICTelephonyController_IMEI__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    id v12 = 0;
    uint64_t v5 = [v3 getMobileEquipmentInfoFor:v4 error:&v12];
    id v6 = v12;
    uint64_t v7 = [v5 IMEI];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (v5) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v6 == 0;
    }
    if (!v10)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v6;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile equipment info with error: %{public}@.", buf, 0xCu);
      }
    }
  }
}

- (NSString)mobileSubscriberNetworkCode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__33316;
  BOOL v10 = __Block_byref_object_dispose__33317;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICTelephonyController_mobileSubscriberNetworkCode__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __52__ICTelephonyController_mobileSubscriberNetworkCode__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    id v11 = 0;
    uint64_t v5 = [v3 copyMobileSubscriberNetworkCode:v4 error:&v11];
    id v6 = v11;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    if (!v9)
    {
      BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile subscriber network code with error: %{public}@.", buf, 0xCu);
      }
    }
  }
}

- (NSString)mobileSubscriberCountryCode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__33316;
  BOOL v10 = __Block_byref_object_dispose__33317;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICTelephonyController_mobileSubscriberCountryCode__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __52__ICTelephonyController_mobileSubscriberCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    id v11 = 0;
    uint64_t v5 = [v3 copyMobileSubscriberCountryCode:v4 error:&v11];
    id v6 = v11;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    if (!v9)
    {
      BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve telephony mobile subscriber country code with error: %{public}@.", buf, 0xCu);
      }
    }
  }
}

- (NSString)providerName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__33316;
  BOOL v10 = __Block_byref_object_dispose__33317;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICTelephonyController_providerName__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __37__ICTelephonyController_providerName__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    uint64_t v5 = *(void *)(v3 + 40);
    id v8 = 0;
    uint64_t v6 = (void *)[v4 copyCarrierBundleValue:v5 key:@"CarrierName" bundleType:v2 error:&v8];
    id v7 = v8;
    if (_NSIsNSString()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ICTelephonyController_dealloc__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ICTelephonyController;
  [(ICTelephonyController *)&v4 dealloc];
}

uint64_t __32__ICTelephonyController_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setDelegate:0];
}

@end