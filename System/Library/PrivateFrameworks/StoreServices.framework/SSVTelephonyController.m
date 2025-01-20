@interface SSVTelephonyController
+ (BOOL)_hasRequiredTelephonyEntitlement;
+ (SSVTelephonyController)sharedController;
- (BOOL)_ensureTelephonyHandlesAreReady;
- (BOOL)isPhoneNumberAccessRestricted;
- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 countryCode:(id)a5 error:(id *)a6;
- (NSString)IMEI;
- (NSString)mobileSubscriberCountryCode;
- (NSString)mobileSubscriberNetworkCode;
- (NSString)operatorName;
- (NSString)phoneNumber;
- (NSString)providerName;
- (NSString)registrationStatus;
- (id)_init;
- (id)_operatorName;
- (id)_phoneNumber;
- (id)_registrationStatus;
- (id)_telephonyClient;
- (id)_telephonySubscriptionContext;
- (void)_updateOperatorName;
- (void)_updatePhoneNumber;
- (void)_updateRegistrationStatus;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)phoneNumberAvailable:(id)a3;
- (void)phoneNumberChanged:(id)a3;
@end

@implementation SSVTelephonyController

uint64_t __31__SSVTelephonyController__init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady];
}

- (BOOL)_ensureTelephonyHandlesAreReady
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = [(SSVTelephonyController *)self _telephonyClient];
  if (v3)
  {
    v4 = [(SSVTelephonyController *)self _telephonySubscriptionContext];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_telephonySubscriptionContext
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  p_telephonySubscriptionContext = &self->_telephonySubscriptionContext;
  telephonySubscriptionContext = self->_telephonySubscriptionContext;
  if (!telephonySubscriptionContext)
  {
    BOOL v5 = [(SSVTelephonyController *)self _telephonyClient];
    v6 = v5;
    if (!v5)
    {
LABEL_29:

      telephonySubscriptionContext = *p_telephonySubscriptionContext;
      goto LABEL_30;
    }
    id v44 = 0;
    v7 = [v5 getUserDefaultVoiceSubscriptionContext:&v44];
    id v8 = v44;
    v9 = v8;
    if (v7 || !v8)
    {
      if (!v7)
      {
        id v43 = v8;
        v10 = [v6 getActiveContexts:&v43];
        id v27 = v43;

        v13 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v13)
        {
          v13 = +[SSLogConfig sharedConfig];
        }
        int v29 = [v13 shouldLog];
        if ([v13 shouldLogToDisk]) {
          int v30 = v29 | 2;
        }
        else {
          int v30 = v29;
        }
        v31 = [v13 OSLogObject];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          v30 &= 2u;
        }
        if (v30)
        {
          v32 = objc_opt_class();
          id v42 = v32;
          v33 = [v10 subscriptions];
          int v45 = 138543618;
          v46 = v32;
          __int16 v47 = 2114;
          v48 = v33;
          LODWORD(v41) = 22;
          v34 = (void *)_os_log_send_and_compose_impl();

          if (!v34) {
            goto LABEL_27;
          }
          v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v45, v41);
          free(v34);
          SSFileLog(v13, @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v31);
        }

        goto LABEL_27;
      }
      objc_storeStrong((id *)&self->_telephonySubscriptionContext, v7);
      v10 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v10)
      {
        v10 = +[SSLogConfig sharedConfig];
      }
      int v16 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v17 &= 2u;
      }
      if (v17)
      {
        v18 = objc_opt_class();
        id v15 = v18;
        uint64_t v19 = [v7 slotID];
        int v45 = 138543874;
        v46 = v18;
        __int16 v47 = 2114;
        v48 = v7;
        __int16 v49 = 2048;
        uint64_t v50 = v19;
        LODWORD(v41) = 32;
        goto LABEL_24;
      }
    }
    else
    {
      v10 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v10)
      {
        v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        v12 &= 2u;
      }
      if (v12)
      {
        v14 = objc_opt_class();
        int v45 = 138543618;
        v46 = v14;
        __int16 v47 = 2114;
        v48 = v9;
        id v15 = v14;
        LODWORD(v41) = 22;
LABEL_24:
        v20 = (void *)_os_log_send_and_compose_impl();

        if (!v20)
        {
LABEL_28:

          goto LABEL_29;
        }
        v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v45, v41);
        free(v20);
        SSFileLog(v10, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v13);
      }
    }
    id v27 = v9;
LABEL_27:

    v9 = v27;
    goto LABEL_28;
  }
LABEL_30:
  return telephonySubscriptionContext;
}

- (id)_telephonyClient
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_telephonyClient)
  {
    if (self->_hasTelephonyCapability)
    {
      if (![(id)objc_opt_class() _hasRequiredTelephonyEntitlement])
      {
        BOOL v5 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v5)
        {
          BOOL v5 = +[SSLogConfig sharedConfig];
        }
        int v13 = [v5 shouldLog];
        if ([v5 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        id v8 = [v5 OSLogObject];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          v14 &= 2u;
        }
        if (!v14) {
          goto LABEL_34;
        }
        id v15 = objc_opt_class();
        int v16 = (void *)MEMORY[0x1E4F28F80];
        id v17 = v15;
        v18 = [v16 processInfo];
        [v18 processName];
        int v28 = 138543618;
        id v29 = v15;
        __int16 v30 = 2114;
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = 22;
        int v12 = (void *)_os_log_send_and_compose_impl();

LABEL_32:
        if (!v12)
        {
LABEL_35:

          goto LABEL_36;
        }
        id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v28, v27);
        free(v12);
        SSFileLog(v5, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v8);
LABEL_34:

        goto LABEL_35;
      }
      v3 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:self->_telephonyCallbackQueue];
      telephonyClient = self->_telephonyClient;
      self->_telephonyClient = v3;

      [(CoreTelephonyClient *)self->_telephonyClient setDelegate:self];
      if (self->_telephonyClient) {
        goto LABEL_36;
      }
      BOOL v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5)
      {
        BOOL v5 = +[SSLogConfig sharedConfig];
      }
      int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      id v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        v7 &= 2u;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      BOOL v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5)
      {
        BOOL v5 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      id v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        v10 &= 2u;
      }
      if (!v10) {
        goto LABEL_34;
      }
    }
    int v28 = 138543362;
    id v29 = (id)objc_opt_class();
    id v11 = v29;
    LODWORD(v27) = 12;
    int v12 = (void *)_os_log_send_and_compose_impl();

    goto LABEL_32;
  }
LABEL_36:
  uint64_t v25 = self->_telephonyClient;
  return v25;
}

+ (BOOL)_hasRequiredTelephonyEntitlement
{
  if (_hasRequiredTelephonyEntitlement_sOnceToken != -1) {
    dispatch_once(&_hasRequiredTelephonyEntitlement_sOnceToken, &__block_literal_global_57_0);
  }
  return _hasRequiredTelephonyEntitlement_sHasRequiredTelephonyEntitlement;
}

void __42__SSVTelephonyController_sharedController__block_invoke()
{
  id v0 = [[SSVTelephonyController alloc] _init];
  v1 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v0;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)SSVTelephonyController;
  v2 = [(SSVTelephonyController *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.StoreServices.SSVTelephonyController.telephonyCallbackQueue", 0);
    telephonyCallbackQueue = v2->_telephonyCallbackQueue;
    v2->_telephonyCallbackQueue = (OS_dispatch_queue *)v7;

    v2->_hasTelephonyCapability = MGGetBoolAnswer();
    v2->_isPhoneNumberAccessRestricted = MGGetBoolAnswer();
    int v9 = v2->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__SSVTelephonyController__init__block_invoke;
    block[3] = &unk_1E5BA7040;
    int v12 = v2;
    dispatch_sync(v9, block);
  }
  return v2;
}

+ (SSVTelephonyController)sharedController
{
  if (sharedController_sOnceToken != -1) {
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_17);
  }
  v2 = (void *)sharedController_sSharedController;
  return (SSVTelephonyController *)v2;
}

void __58__SSVTelephonyController__hasRequiredTelephonyEntitlement__block_invoke()
{
  id v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFErrorRef error = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.CommCenter.fine-grained", &error);
    if (v2)
    {
      dispatch_queue_t v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFArrayGetTypeID()) {
        _hasRequiredTelephonyEntitlement_sHasRequiredTelephonyEntitlement = [v3 containsObject:@"spi"];
      }
      CFRelease(v3);
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v1);
  }
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSVTelephonyController_dealloc__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)SSVTelephonyController;
  [(SSVTelephonyController *)&v4 dealloc];
}

uint64_t __33__SSVTelephonyController_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setDelegate:0];
}

- (BOOL)isPhoneNumberAccessRestricted
{
  return self->_isPhoneNumberAccessRestricted;
}

- (NSString)phoneNumber
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SSVTelephonyController_phoneNumber__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __37__SSVTelephonyController_phoneNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _phoneNumber];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)operatorName
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SSVTelephonyController_operatorName__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__SSVTelephonyController_operatorName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _operatorName];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)providerName
{
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__31;
  int v16 = __Block_byref_object_dispose__31;
  id v17 = 0;
  if (MGGetBoolAnswer())
  {
    CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"ISCellularOperatorName", @"com.apple.itunesstored");
    objc_super v4 = v3;
    if (v3)
    {
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID())
      {
        uint64_t v6 = (void *)v13[5];
        v13[5] = (uint64_t)v4;
      }
      else
      {
        CFRelease(v4);
      }
    }
  }
  dispatch_queue_t v7 = (void *)v13[5];
  if (!v7)
  {
    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__SSVTelephonyController_providerName__block_invoke;
    v11[3] = &unk_1E5BA6FC8;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(accessQueue, v11);
    dispatch_queue_t v7 = (void *)v13[5];
  }
  id v9 = v7;
  _Block_object_dispose(&v12, 8);

  return (NSString *)v9;
}

void __38__SSVTelephonyController_providerName__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    uint64_t v3 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(v3 + 64);
    uint64_t v5 = *(void *)(v3 + 72);
    id v8 = 0;
    uint64_t v6 = (void *)[v4 copyCarrierBundleValue:v5 key:@"CarrierName" bundleType:v2 error:&v8];
    id v7 = v8;
    if ([v6 isNSString]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }
  }
}

- (NSString)mobileSubscriberCountryCode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSVTelephonyController_mobileSubscriberCountryCode__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSVTelephonyController_mobileSubscriberCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    id v24 = 0;
    uint64_t v5 = [v3 copyMobileSubscriberCountryCode:v4 error:&v24];
    id v6 = v24;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    if (v9) {
      goto LABEL_18;
    }
    int v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    objc_super v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v14 = objc_opt_class();
      int v25 = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v6;
      id v15 = v14;
      LODWORD(v23) = 22;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_super v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v25, v23);
      free(v16);
      SSFileLog(v10, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_17;
  }
}

- (NSString)mobileSubscriberNetworkCode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSVTelephonyController_mobileSubscriberNetworkCode__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSVTelephonyController_mobileSubscriberNetworkCode__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    id v24 = 0;
    uint64_t v5 = [v3 copyMobileSubscriberNetworkCode:v4 error:&v24];
    id v6 = v24;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    if (v9) {
      goto LABEL_18;
    }
    int v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    objc_super v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v14 = objc_opt_class();
      int v25 = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v6;
      id v15 = v14;
      LODWORD(v23) = 22;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_super v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v25, v23);
      free(v16);
      SSFileLog(v10, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_17;
  }
}

- (NSString)registrationStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSVTelephonyController_registrationStatus__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __44__SSVTelephonyController_registrationStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _registrationStatus];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)IMEI
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__31;
  int v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSVTelephonyController_IMEI__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __30__SSVTelephonyController_IMEI__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    id v25 = 0;
    uint64_t v5 = [v3 getMobileEquipmentInfoFor:v4 error:&v25];
    id v6 = v25;
    uint64_t v7 = [v5 IMEI];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (v5) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v6 == 0;
    }
    if (v10) {
      goto LABEL_18;
    }
    id v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (v13)
    {
      id v15 = objc_opt_class();
      int v26 = 138543618;
      __int16 v27 = v15;
      __int16 v28 = 2114;
      id v29 = v6;
      id v16 = v15;
      LODWORD(v24) = 22;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_17:

LABEL_18:
        return;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v26, v24);
      free(v17);
      SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }

    goto LABEL_17;
  }
}

- (BOOL)sendSMSWithText:(id)a3 toPhoneNumber:(id)a4 countryCode:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__31;
  id v29 = __Block_byref_object_dispose__31;
  id v30 = 0;
  accessQueue = self->_accessQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__SSVTelephonyController_sendSMSWithText_toPhoneNumber_countryCode_error___block_invoke;
  v19[3] = &unk_1E5BAB6A0;
  v19[4] = self;
  id v14 = v11;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  uint64_t v23 = &v31;
  id v16 = v10;
  id v22 = v16;
  uint64_t v24 = &v25;
  dispatch_sync(accessQueue, v19);
  if (a6) {
    *a6 = (id) v26[5];
  }
  char v17 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __74__SSVTelephonyController_sendSMSWithText_toPhoneNumber_countryCode_error___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _ensureTelephonyHandlesAreReady])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F23A08], "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "slotID"), *(void *)(a1 + 40), *(void *)(a1 + 48));
    id v3 = [MEMORY[0x1E4F239E8] sharedMessageCenter];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [v2 canonicalFormat];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 sendSMSWithText:v4 text:v5 serviceCenter:0 toAddress:v6];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 72);
      int v33 = 138543874;
      char v34 = v11;
      __int16 v35 = 2112;
      uint64_t v36 = v12;
      __int16 v37 = 2114;
      uint64_t v38 = v13;
      id v14 = v11;
      LODWORD(v30) = 32;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        unint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 72) slotID];
        if (v22 > 2) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = off_1E5BAB6C0[v22];
        }
        uint64_t v24 = [NSString stringWithFormat:@"Failed to send SMS using telephony slot: %@.", v23];
        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        uint64_t v32 = v24;
        int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        uint64_t v27 = [v25 errorWithDomain:@"SSErrorDomain" code:720 userInfo:v26];
        uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
        id v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = v27;

        return;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v30);
      free(v15);
      SSFileLog(v7, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v10);
    }

    goto LABEL_15;
  }
}

- (void)activeSubscriptionsDidChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v18 = 138543362;
  id v19 = (id)objc_opt_class();
  id v7 = v19;
  LODWORD(v16) = 12;
  int v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v16);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVTelephonyController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__SSVTelephonyController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _ensureTelephonyHandlesAreReady];
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVTelephonyController_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__SSVTelephonyController_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRegistrationStatus];
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSVTelephonyController_operatorNameChanged_name___block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __51__SSVTelephonyController_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOperatorName];
}

- (void)phoneNumberAvailable:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SSVTelephonyController_phoneNumberAvailable___block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __47__SSVTelephonyController_phoneNumberAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumber];
}

- (void)phoneNumberChanged:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSVTelephonyController_phoneNumberChanged___block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __45__SSVTelephonyController_phoneNumberChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumber];
}

- (id)_phoneNumber
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_hasTelephonyCapability && !self->_phoneNumber)
  {
    if (MGGetBoolAnswer())
    {
      id v3 = (NSString *)CFPreferencesCopyAppValue(@"ISPhoneNumber", @"com.apple.itunesstored");
      if (v3)
      {
        int v4 = v3;
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == CFStringGetTypeID())
        {
          phoneNumber = self->_phoneNumber;
          self->_phoneNumber = v4;
        }
        else
        {
          CFRelease(v4);
        }
      }
    }
    if (!self->_phoneNumber
      && [(SSVTelephonyController *)self _ensureTelephonyHandlesAreReady])
    {
      telephonyClient = self->_telephonyClient;
      telephonySubscriptionContext = self->_telephonySubscriptionContext;
      id v29 = 0;
      uint64_t v9 = [(CoreTelephonyClient *)telephonyClient getPhoneNumber:telephonySubscriptionContext error:&v29];
      id v10 = v29;
      uint64_t v11 = v10;
      if (v9 || !v10)
      {
        uint64_t v25 = [v9 number];
        uint64_t v12 = self->_phoneNumber;
        self->_phoneNumber = v25;
        goto LABEL_24;
      }
      uint64_t v12 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v12)
      {
        uint64_t v12 = +[SSLogConfig sharedConfig];
      }
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      id v15 = [v12 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        v14 &= 2u;
      }
      if (v14)
      {
        uint64_t v16 = objc_opt_class();
        int v30 = 138543618;
        uint64_t v31 = v16;
        __int16 v32 = 2114;
        int v33 = v11;
        id v17 = v16;
        LODWORD(v28) = 22;
        int v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_24:

          goto LABEL_25;
        }
        id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v30, v28);
        free(v18);
        SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
      }

      goto LABEL_24;
    }
  }
LABEL_25:
  int v26 = self->_phoneNumber;
  return v26;
}

- (void)_updatePhoneNumber
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_isPhoneNumberAccessRestricted) {
    goto LABEL_2;
  }
  id v7 = self->_phoneNumber;
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = 0;

  CFTypeID v5 = [(SSVTelephonyController *)self _phoneNumber];
  if (v7 == v5)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v7 isEqualToString:v5];

    if (!v6)
    {
LABEL_2:
      notificationQueue = self->_notificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__SSVTelephonyController__updatePhoneNumber__block_invoke;
      block[3] = &unk_1E5BA7040;
      void block[4] = self;
      dispatch_async(notificationQueue, block);
    }
  }
}

void __44__SSVTelephonyController__updatePhoneNumber__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVTelephonyPhoneNumberDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)_operatorName
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_operatorName)
  {
    if (MGGetBoolAnswer())
    {
      id v3 = (NSString *)CFPreferencesCopyAppValue(@"ISCellularOperatorName", @"com.apple.itunesstored");
      if (v3)
      {
        int v4 = v3;
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == CFStringGetTypeID())
        {
          operatorName = self->_operatorName;
          self->_operatorName = v4;
        }
        else
        {
          CFRelease(v4);
        }
      }
    }
    if (!self->_operatorName
      && [(SSVTelephonyController *)self _ensureTelephonyHandlesAreReady])
    {
      telephonyClient = self->_telephonyClient;
      telephonySubscriptionContext = self->_telephonySubscriptionContext;
      id v29 = 0;
      uint64_t v9 = [(CoreTelephonyClient *)telephonyClient getLocalizedOperatorName:telephonySubscriptionContext error:&v29];
      id v10 = v29;
      uint64_t v11 = (NSString *)[v9 copy];
      uint64_t v12 = self->_operatorName;
      self->_operatorName = v11;

      if (self->_operatorName || !v10) {
        goto LABEL_23;
      }
      int v13 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v13)
      {
        int v13 = +[SSLogConfig sharedConfig];
      }
      int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v15 = v14 | 2;
      }
      else {
        int v15 = v14;
      }
      uint64_t v16 = [v13 OSLogObject];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        v15 &= 2u;
      }
      if (v15)
      {
        id v17 = objc_opt_class();
        int v30 = 138543618;
        uint64_t v31 = v17;
        __int16 v32 = 2114;
        id v33 = v10;
        id v18 = v17;
        LODWORD(v28) = 22;
        uint64_t v19 = (void *)_os_log_send_and_compose_impl();

        if (!v19)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v30, v28);
        free(v19);
        SSFileLog(v13, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      }

      goto LABEL_22;
    }
  }
LABEL_24:
  int v26 = self->_operatorName;
  return v26;
}

- (void)_updateOperatorName
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v3 = self->_operatorName;
  operatorName = self->_operatorName;
  self->_operatorName = 0;

  CFTypeID v5 = [(SSVTelephonyController *)self _operatorName];
  if (v3 != v5 && ![(NSString *)v3 isEqualToString:v5])
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SSVTelephonyController__updateOperatorName__block_invoke;
    block[3] = &unk_1E5BA7040;
    void block[4] = self;
    dispatch_async(notificationQueue, block);
  }
}

void __45__SSVTelephonyController__updateOperatorName__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVTelephonyOperatorNameDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)_registrationStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_registrationStatus
    && [(SSVTelephonyController *)self _ensureTelephonyHandlesAreReady])
  {
    telephonyClient = self->_telephonyClient;
    telephonySubscriptionContext = self->_telephonySubscriptionContext;
    id v24 = 0;
    CFTypeID v5 = (NSString *)[(CoreTelephonyClient *)telephonyClient copyRegistrationStatus:telephonySubscriptionContext error:&v24];
    id v6 = v24;
    registrationStatus = self->_registrationStatus;
    self->_registrationStatus = v5;

    if (self->_registrationStatus || !v6) {
      goto LABEL_17;
    }
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v12 = objc_opt_class();
      int v25 = 138543618;
      int v26 = v12;
      __int16 v27 = 2114;
      id v28 = v6;
      id v13 = v12;
      LODWORD(v23) = 22;
      int v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v25, v23);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_16;
  }
LABEL_18:
  uint64_t v21 = self->_registrationStatus;
  return v21;
}

- (void)_updateRegistrationStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v3 = self->_registrationStatus;
  registrationStatus = self->_registrationStatus;
  self->_registrationStatus = 0;

  CFTypeID v5 = [(SSVTelephonyController *)self _registrationStatus];
  if (v3 != v5 && ![(NSString *)v3 isEqualToString:v5])
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SSVTelephonyController__updateRegistrationStatus__block_invoke;
    block[3] = &unk_1E5BA7040;
    void block[4] = self;
    dispatch_async(notificationQueue, block);
  }
}

void __51__SSVTelephonyController__updateRegistrationStatus__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSVTelephonyRegistrationDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonySubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_telephonyCallbackQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end