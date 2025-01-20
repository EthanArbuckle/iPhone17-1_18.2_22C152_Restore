@interface BAASupport
+ (int)getCertificateExpirationDate:(double *)a3;
+ (int)getCertificates:(id *)a3;
+ (int)issueNewCertificate;
+ (int)prepare;
+ (void)initialize;
+ (void)prepare;
+ (void)setDelegate:(id)a3;
@end

@implementation BAASupport

+ (void)initialize
{
  id v3 = self;

  if (v3 == a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08958]);
    v5 = (void *)_baaCertPrepareLock;
    _baaCertPrepareLock = (uint64_t)v4;

    id v6 = objc_alloc_init(MEMORY[0x263F08958]);
    v7 = (void *)_baaCertIssueLock;
    _baaCertIssueLock = (uint64_t)v6;

    v8 = objc_alloc_init(Timer);
    v9 = (void *)_baaRenewalTimer;
    _baaRenewalTimer = (uint64_t)v8;

    v10 = objc_alloc_init(Timer);
    v11 = (void *)_baaNetworkRetryTimer;
    _baaNetworkRetryTimer = (uint64_t)v10;
  }
}

+ (void)setDelegate:(id)a3
{
}

+ (int)prepare
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  unint64_t v53 = 0;
  if (prepare_onceToken != -1) {
    dispatch_once(&prepare_onceToken, &__block_literal_global);
  }
  unint64_t v2 = 0x26ABD8000uLL;
  [(id)_baaCertPrepareLock lock];
  if (!_delegate)
  {
    v8 = 0;
    id v7 = 0;
    id v6 = 0;
    int v20 = -6;
    goto LABEL_52;
  }
  int v3 = [(id)_delegate getSigKeyExpDate:3 expirationDate:&v53];
  if (v3)
  {
    int v20 = v3;
    v8 = 0;
    id v7 = 0;
    id v6 = 0;
    goto LABEL_52;
  }
  if (!v53)
  {
    v9 = (void *)_baaCertExpDate;
    _baaCertExpDate = 0;

    id v10 = getBAAQueryDictionary();
    CFTypeRef result = 0;
    [v10 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F17520]];
    OSStatus v11 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
    id v12 = 0;
    if (v11 == -25300)
    {
      id v13 = 0;
      id v14 = 0;
      id v15 = 0;
      id v16 = 0;
      id v17 = 0;
      id v18 = 0;
      v19 = 0;
    }
    else
    {
      int v20 = v11;
      id v13 = 0;
      v19 = 0;
      id v18 = 0;
      id v17 = 0;
      id v16 = 0;
      id v15 = 0;
      id v14 = 0;
      if (v11) {
        goto LABEL_16;
      }
      v21 = (void *)MEMORY[0x263EFFA08];
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      id v30 = (id)[v21 setWithObjects:v22, v23, v24, v25, v26, v27, v28, v29, objc_opt_class(), 0];
      id v58 = 0;
      id v14 = (id)[MEMORY[0x263F08928] _strictlyUnarchivedObjectOfClasses:v30 fromData:result error:&v58];
      id v31 = v58;
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          +[BAASupport prepare]((uint64_t)v31);
        }
        id v15 = 0;
        id v16 = 0;
        id v17 = 0;
        id v18 = 0;
      }
      else
      {
        id v15 = (id)[v14 objectForKeyedSubscript:@"BAAVersion"];
        id v18 = (id)[v14 objectForKeyedSubscript:@"BAAKey"];
        id v17 = (id)[v14 objectForKeyedSubscript:@"BAACertificates"];
        id v16 = (id)[v14 objectForKeyedSubscript:@"BAAExpDate"];
        if (v15 && [v15 unsignedIntValue] >= 2 && v18 && v17 && v16)
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v17 = v17;
          unint64_t v39 = 0x263EFF000uLL;
          uint64_t v52 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
          if (v52)
          {
            uint64_t v51 = *(void *)v55;
            id v50 = v30;
            while (2)
            {
              for (uint64_t i = 0; i != v52; ++i)
              {
                if (*(void *)v55 != v51) {
                  objc_enumerationMutation(v17);
                }
                id v41 = *(id *)(*((void *)&v54 + 1) + 8 * i);
                [v41 bytes];
                [v41 length];
                uint64_t v42 = SecCertificateCreateWithBytes();
                if (!v42
                  || (v43 = (const void *)v42,
                      id v44 = (id)[*(id *)(v39 + 2320) date],
                      [v44 timeIntervalSinceReferenceDate],
                      int IsValid = SecCertificateIsValid(),
                      v44,
                      CFRelease(v43),
                      !IsValid))
                {

                  id v30 = v50;
                  id v31 = 0;
                  goto LABEL_14;
                }
                unint64_t v39 = 0x263EFF000;
              }
              id v30 = v50;
              uint64_t v52 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
              if (v52) {
                continue;
              }
              break;
            }
          }

          id v12 = v18;
          id v13 = v17;
          id v16 = v16;
          id v17 = v13;
          id v18 = v12;
          v19 = v16;
          goto LABEL_15;
        }
      }
LABEL_14:
      CFDictionaryRef BAAQueryDictionary = (const __CFDictionary *)getBAAQueryDictionary();
      SecItemDelete(BAAQueryDictionary);

      id v12 = 0;
      id v13 = 0;
      v19 = 0;
    }
LABEL_15:
    int v20 = 0;
LABEL_16:
    if (result) {
      CFRelease(result);
    }

    id v6 = v12;
    id v7 = v13;
    id v33 = v19;
    v8 = v33;
    if (!v20)
    {
      if (!v6) {
        goto LABEL_43;
      }
      if (!v7) {
        goto LABEL_43;
      }
      if (!v33) {
        goto LABEL_43;
      }
      [v33 timeIntervalSinceNow];
      if (v34 <= 0.0) {
        goto LABEL_43;
      }
      v35 = (void *)_delegate;
      if (_delegate)
      {
        [v8 timeIntervalSinceReferenceDate];
        int v37 = [v35 setSigKey:3 expirationDate:(unint64_t)v36 keyData:v6 certificates:v7];
        if (v37 == -13)
        {
          CFDictionaryRef v38 = (const __CFDictionary *)getBAAQueryDictionary();
          SecItemDelete(v38);
LABEL_43:
          unint64_t v2 = 0x26ABD8000uLL;
          goto LABEL_44;
        }
        int v20 = v37;
        if (!v37)
        {
          objc_storeStrong((id *)&_baaCertExpDate, v19);
          [(id)_delegate confirmSigKey:3 status:0];
          goto LABEL_43;
        }
      }
      else
      {
        int v20 = -6;
      }
    }
    unint64_t v2 = 0x26ABD8000;
    goto LABEL_52;
  }
  id v4 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v53];
  v5 = (void *)_baaCertExpDate;
  _baaCertExpDate = (uint64_t)v4;

  id v6 = 0;
  id v7 = 0;
  v8 = 0;
LABEL_44:
  if (_baaCertExpDate && ([(id)_baaCertExpDate timeIntervalSinceNow], v46 > 0.0))
  {
    v47 = dispatch_get_global_queue(21, 0);
    dispatch_async(v47, &__block_literal_global_13);

    int v20 = 0;
  }
  else
  {
    [(id)_baaCertIssueLock lock];
    if (_baaCertExpDate && ([(id)_baaCertExpDate timeIntervalSinceNow], v48 > 0.0)
      || (int v20 = issueNewBAACertificate()) == 0)
    {
      int v20 = 0;
    }
    [(id)_baaCertIssueLock unlock];
  }
LABEL_52:
  [*(id *)(v2 + 1912) unlock];

  return v20;
}

uint64_t __21__BAASupport_prepare__block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)activationStateHandler, (CFStringRef)*MEMORY[0x263F55860], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (getNetworkReachability_onceToken != -1) {
    dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_33);
  }
  uint64_t result = SCNetworkReachabilitySetCallback((SCNetworkReachabilityRef)getNetworkReachability_networkReachability, (SCNetworkReachabilityCallBack)networkReachabilityHandler, 0);
  if (result)
  {
    if (getNetworkReachability_onceToken != -1) {
      dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_33);
    }
    unint64_t v2 = (const __SCNetworkReachability *)getNetworkReachability_networkReachability;
    int v3 = MEMORY[0x263EF83A0];
    return SCNetworkReachabilitySetDispatchQueue(v2, v3);
  }
  return result;
}

+ (int)getCertificateExpirationDate:(double *)a3
{
  if (!a3) {
    return -4;
  }
  int result = +[BAASupport prepare];
  if (!result)
  {
    if (_baaCertExpDate) {
      [(id)_baaCertExpDate timeIntervalSinceReferenceDate];
    }
    else {
      uint64_t v5 = 0;
    }
    int result = 0;
    *(void *)a3 = v5;
  }
  return result;
}

+ (int)getCertificates:(id *)a3
{
  if (!a3) {
    return -4;
  }
  int result = +[BAASupport prepare];
  if (!result)
  {
    uint64_t v5 = (void *)_delegate;
    return [v5 getSigKeyCertificates:3 certificates:a3];
  }
  return result;
}

+ (int)issueNewCertificate
{
  [(id)_baaCertIssueLock lock];
  LODWORD(_MergedGlobals) = 0;
  int v2 = issueNewBAACertificate();
  [(id)_baaCertIssueLock unlock];
  return v2;
}

+ (void)prepare
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "unarchivedObjectOfClasses() -> %@", (uint8_t *)&v1, 0xCu);
}

@end