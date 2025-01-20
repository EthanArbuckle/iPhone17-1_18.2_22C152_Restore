void sub_226DAA55C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32b40w(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);

  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_e8_32s40w(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
}

void activationStateHandler()
{
  v0 = dispatch_get_global_queue(21, 0);
  dispatch_async(v0, &__block_literal_global_31);
}

void networkReachabilityHandler(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "networkReachabilityHandler(): flags = 0x%x", (uint8_t *)v4, 8u);
  }
  v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, &__block_literal_global_35);
}

uint64_t issueNewBAACertificate()
{
  v62[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = isDeviceReadyToIssueCertificate();
  id v1 = 0;
  if (v0)
  {
    id v29 = 0;
    v31 = 0;
    goto LABEL_23;
  }
  if (!_delegate)
  {
    id v26 = 0;
    id v27 = 0;
    id v28 = 0;
    id v2 = 0;
    id v3 = 0;
    id v4 = 0;
    id v24 = 0;
    id v25 = 0;
    uint64_t v0 = 4294967290;
    goto LABEL_19;
  }
  id v36 = 0;
  v37[0] = 0;
  id v35 = 0;
  uint64_t v0 = [(id)_delegate generateSigKey:3 keyData:v37 attestation:&v36 pubKey:&v35];
  id v2 = v37[0];
  id v3 = v36;
  id v4 = v35;
  if (v0)
  {
    id v26 = 0;
    id v27 = 0;
    id v28 = 0;
    id v24 = 0;
    id v25 = 0;
    goto LABEL_19;
  }
  id v3 = v3;
  id v4 = v4;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  int v59 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  id v55 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v5 = 0;
  id v43 = dispatch_semaphore_create(0);
  int v6 = -4;
  id v7 = 0;
  id v8 = 0;
  if (!v3 || !v4) {
    goto LABEL_14;
  }
  int v9 = isDeviceReadyToIssueCertificate();
  v10 = v57;
  *((_DWORD *)v57 + 6) = v9;
  if (v9)
  {
    id v5 = 0;
    id v7 = 0;
    id v8 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = *MEMORY[0x263F399E8];
  v61[0] = *MEMORY[0x263F39920];
  v61[1] = v11;
  v62[0] = MEMORY[0x263EFFA88];
  v62[1] = MEMORY[0x263EFFA80];
  uint64_t v12 = *MEMORY[0x263F39918];
  v61[2] = *MEMORY[0x263F39910];
  v61[3] = v12;
  v62[2] = v3;
  v62[3] = v4;
  uint64_t v13 = *MEMORY[0x263F399D0];
  v62[4] = MEMORY[0x263EFFA88];
  uint64_t v14 = *MEMORY[0x263F399E0];
  v61[4] = v13;
  v61[5] = v14;
  id v15 = certificateValidity();
  v62[5] = v15;
  v61[6] = *MEMORY[0x263F399B0];
  uint64_t v16 = *MEMORY[0x263F39980];
  v60[0] = *MEMORY[0x263F39968];
  v60[1] = v16;
  uint64_t v17 = *MEMORY[0x263F39970];
  v60[2] = *MEMORY[0x263F39990];
  v60[3] = v17;
  v60[4] = *MEMORY[0x263F399B8];
  id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:5];
  v62[6] = v18;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:7];

  v19 = dispatch_get_global_queue(0, 0);
  v37[1] = (id)MEMORY[0x263EF8330];
  v37[2] = (id)3254779904;
  v37[3] = __createBAACertificates_block_invoke;
  v37[4] = &__block_descriptor_64_e8_32r40r48r56r_e87_v32__0____SecKey____CFRuntimeBase_QAQ_____SecKeyDescriptor__v_8__NSArray_16__NSError_24l;
  v37[5] = &v56;
  v37[6] = &v44;
  v37[7] = &v50;
  v37[8] = &v38;
  DeviceIdentityIssueClientCertificateWithCompletion();

  v20 = v39[5];
  dispatch_time_t v21 = dispatch_time(0, 90000000000);
  if (!dispatch_semaphore_wait(v20, v21))
  {
    v10 = v57;
    if (!*((_DWORD *)v57 + 6))
    {
      _MergedGlobals = 0;
      id v5 = (id) v51[5];
      id v7 = (id) v45[5];
      int v6 = 0;
LABEL_14:
      v10 = v57;
      *((_DWORD *)v57 + 6) = v6;
      goto LABEL_15;
    }
    id v5 = 0;
    id v7 = 0;
LABEL_15:
    if (!_MergedGlobals) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    issueNewBAACertificate_cold_1();
  }
  id v5 = 0;
  id v7 = 0;
  LODWORD(_MergedGlobals) = _MergedGlobals + 1;
  int v22 = _MergedGlobals;
  v10 = v57;
  *((_DWORD *)v57 + 6) = -15;
  if (!v22) {
    goto LABEL_17;
  }
LABEL_16:
  v23 = dispatch_get_global_queue(21, 0);
  dispatch_async(v23, &__block_literal_global_81);

  v10 = v57;
LABEL_17:
  uint64_t v0 = *((unsigned int *)v10 + 6);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  id v24 = v5;
  id v25 = v7;
  if (v0)
  {
    id v26 = 0;
    id v27 = 0;
    id v28 = 0;
  }
  else
  {
    id v26 = v2;
    id v27 = v24;
    id v28 = v25;
    uint64_t v0 = 0;
    id v2 = v26;
    id v24 = v27;
    id v25 = v28;
  }
LABEL_19:

  id v1 = v26;
  id v29 = v27;
  id v30 = v28;
  v31 = v30;
  if (!v0)
  {
    v32 = (void *)_delegate;
    if (_delegate)
    {
      [v30 timeIntervalSinceReferenceDate];
      uint64_t v0 = [v32 setSigKey:3 expirationDate:(unint64_t)v33 keyData:v1 certificates:v29];
      if (!v0)
      {
        objc_storeStrong((id *)&_baaCertExpDate, v28);
        scheduleBAACertificateRenewalTimer();
        uint64_t v0 = 0;
      }
    }
    else
    {
      uint64_t v0 = 4294967290;
    }
  }
LABEL_23:
  [(id)_delegate confirmSigKey:3 status:v0];

  return v0;
}

void sub_226DAB754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void checkBAACertificateRenewal()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_baaCertExpDate)
  {
    [(id)_baaCertIssueLock lock];
    [(id)_baaCertExpDate timeIntervalSinceNow];
    double v1 = v0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 134218240;
      double v3 = v1;
      __int16 v4 = 2048;
      uint64_t v5 = certificateRenewPeriod();
      _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "checkBAACertificateRenewal(): remaining = %f (renew period = %llu)", (uint8_t *)&v2, 0x16u);
    }
    if (v1 <= (double)(unint64_t)certificateRenewPeriod()) {
      issueNewBAACertificate();
    }
    else {
      scheduleBAACertificateRenewalTimer();
    }
    [(id)_baaCertIssueLock unlock];
  }
}

uint64_t __activationStateHandler_block_invoke()
{
  isDeviceActivated(1);

  return +[BAASupport prepare];
}

uint64_t isDeviceActivated(int a1)
{
  objc_sync_enter(0);
  if (isDeviceActivated_wasRead != 1 || a1 != 0)
  {
    isDeviceActivated_wasRead = 0;
    id v9 = 0;
    double v3 = (void *)MAEGetActivationStateWithError();
    id v4 = 0;
    if (v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        isDeviceActivated_cold_1((uint64_t)v5);
      }

      uint64_t v6 = 4294967290;
      goto LABEL_15;
    }
    isDeviceActivated_activated = [v3 isEqualToString:*MEMORY[0x263F55840]];
    isDeviceActivated_wasRead = 1;
  }
  if (isDeviceActivated_activated)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "isDeviceActivated(): Not activated", v8, 2u);
    }
    uint64_t v6 = 4294967285;
  }
LABEL_15:
  objc_sync_exit(0);
  return v6;
}

void sub_226DABB18(_Unwind_Exception *a1)
{
}

SCNetworkReachabilityRef __getNetworkReachability_block_invoke()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  *(void *)&address.sa_data[6] = 0;
  *(void *)&address.sa_len = 528;
  SCNetworkReachabilityRef result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
  getNetworkReachability_networkReachability = (uint64_t)result;
  return result;
}

uint64_t __networkReachabilityHandler_block_invoke()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!HIDWORD(_MergedGlobals)) {
    goto LABEL_8;
  }
  char v0 = BYTE4(_MergedGlobals) - 1;
  if ((HIDWORD(_MergedGlobals) - 1) >= 6) {
    char v0 = 6;
  }
  id v1 = (id)[(id)_baaCertIssueNetworkFailTime dateByAddingTimeInterval:(double)(60 << v0)];
  [v1 timeIntervalSinceNow];
  double v3 = v2;

  if (v3 > 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v3];
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 1024;
      int v9 = HIDWORD(_MergedGlobals);
      _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "networkReachabilityHandler(): Re-check scheduled to %@ (networkFailCount = %u)", (uint8_t *)&v6, 0x12u);
    }
    return [(id)_baaNetworkRetryTimer resetWithTimeInterval:&__block_literal_global_38 block:v3];
  }
  else
  {
LABEL_8:
    return +[BAASupport prepare];
  }
}

uint64_t __networkReachabilityHandler_block_invoke_36()
{
  return +[BAASupport prepare];
}

id getBAAQueryDictionary()
{
  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F171C8];
  uint64_t v1 = *MEMORY[0x263F16E80];
  v6[0] = *MEMORY[0x263F171B8];
  v6[1] = v1;
  v7[0] = v0;
  v7[1] = @"com.apple.applesse";
  uint64_t v2 = *MEMORY[0x263F17000];
  v6[2] = *MEMORY[0x263F17090];
  v6[3] = v2;
  v7[2] = @"com.apple.applesse";
  v7[3] = @"BAASigKey";
  id v3 = (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  id v4 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];

  return v4;
}

uint64_t isDeviceReadyToIssueCertificate()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  SCNetworkReachabilityFlags flags = 0;
  if (getNetworkReachability_onceToken != -1) {
    dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_33);
  }
  if (!getNetworkReachability_networkReachability
    || !SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)getNetworkReachability_networkReachability, &flags))
  {
    return 4294967290;
  }
  SCNetworkReachabilityFlags v0 = flags;
  if ((flags & 2) != 0)
  {
    SCNetworkReachabilityFlags v1 = (flags >> 4) & 1;
    if ((flags & 0x28) == 0) {
      SCNetworkReachabilityFlags v1 = 1;
    }
    if ((flags & 0x40004) != 4 || !v1) {
      return isDeviceActivated(0);
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    SCNetworkReachabilityFlags v5 = v0;
    _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "isNetworkReachable(): Not reachable (SCNetworkReachabilityFlags flags = 0x%x)", buf, 8u);
  }
  return 4294967284;
}

void scheduleBAACertificateRenewalTimer()
{
  SCNetworkReachabilityFlags v0 = dispatch_get_global_queue(21, 0);
  dispatch_async(v0, &__block_literal_global_86);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id certificateValidity()
{
  if ([(id)_delegate isInternal])
  {
    id v0 = getNumberFromBootArgs(@"sseBAACertValidity");
    SCNetworkReachabilityFlags v1 = v0;
    if (v0) {
      id v2 = v0;
    }
    else {
      id v2 = &unk_26DAEEDB0;
    }
  }
  else
  {
    id v2 = &unk_26DAEEDB0;
  }

  return v2;
}

void __createBAACertificates_block_invoke(void *a1, const void *a2, id a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __createBAACertificates_block_invoke_cold_1((uint64_t)v8);
    }
    LODWORD(_MergedGlobals) = _MergedGlobals + 1;
    if (mobileactivationErrorHasDomainAndErrorCode())
    {
      ++HIDWORD(_MergedGlobals);
      id v9 = (id)[MEMORY[0x263EFF910] date];
      uint64_t v10 = (void *)_baaCertIssueNetworkFailTime;
      _baaCertIssueNetworkFailTime = (uint64_t)v9;
    }
    uint64_t v11 = *(void *)(a1[4] + 8);
    int v12 = -15;
    goto LABEL_7;
  }
  if (![v7 count])
  {
    uint64_t v11 = *(void *)(a1[4] + 8);
    int v12 = -6;
LABEL_7:
    *(_DWORD *)(v11 + 24) = v12;
    goto LABEL_17;
  }
  v32 = a2;
  uint64_t v13 = (void *)MEMORY[0x263EFF910];
  id v14 = certificateValidity();
  id v15 = (id)[v13 dateWithTimeIntervalSinceNow:60*[v14 unsignedIntegerValue]];
  uint64_t v16 = *(void *)(a1[5] + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v33 = v7;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
        id v24 = (void *)MEMORY[0x263EFF8F8];
        uint64_t BytePtr = SecCertificateGetBytePtr();
        id v26 = (id)[v24 dataWithBytes:BytePtr length:SecCertificateGetLength()];
        [v23 addObject:v26];

        id v27 = (void *)MEMORY[0x263EFF910];
        SecCertificateNotValidAfter();
        id v28 = (id)[v27 dateWithTimeIntervalSinceReferenceDate:x0];
        id v29 = (id)[*(id *)(*(void *)(a1[5] + 8) + 40) earlierDate:v28];
        uint64_t v30 = *(void *)(a1[5] + 8);
        v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v20);
  }

  a2 = v32;
  id v7 = v33;
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8) + 40));
  if (a2) {
    CFRelease(a2);
  }
}

void __copy_helper_block_e8_32r40r48r56r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
  id v4 = *(const void **)(a2 + 56);

  _Block_object_assign((void *)(a1 + 56), v4, 8);
}

void __destroy_helper_block_e8_32r40r48r56r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  id v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

id getNumberFromBootArgs(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (getBootArgs_onceToken != -1) {
    dispatch_once(&getBootArgs_onceToken, &__block_literal_global_74);
  }
  id v2 = (id)getBootArgs_bootArgs;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    SCNetworkReachabilityFlags v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = [(id)[*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        id v9 = (id)[v8 objectAtIndexedSubscript:0];
        int v10 = [v9 isEqualToString:v1];

        if (v10 && [v8 count] == 2)
        {
          uint64_t v11 = NSNumber;
          id v12 = (id)[v8 objectAtIndexedSubscript:1];
          id v13 = [v11 numberWithInteger:[v12 integerValue]];

          SCNetworkReachabilityFlags v5 = v13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    SCNetworkReachabilityFlags v5 = 0;
  }

  return v5;
}

void __getBootArgs_block_invoke()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], "IODeviceTree:/options");
  if (!v0) {
    return;
  }
  io_registry_entry_t v1 = v0;
  CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "boot-args", 0x8000100u);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v1, v2, 0, 0);
  CFRelease(v2);
  IOObjectRelease(v1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = CFProperty;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SCNetworkReachabilityFlags v5 = 0;
      goto LABEL_8;
    }
    id v4 = (id)[[NSString alloc] initWithData:CFProperty encoding:1];
  }
  SCNetworkReachabilityFlags v5 = v4;
LABEL_8:
  id v6 = (id)[v5 componentsSeparatedByString:@" "];
  id v7 = (void *)getBootArgs_bootArgs;
  getBootArgs_bootArgs = (uint64_t)v6;
}

void __scheduleBAACertificateIssuanceRetryTimer_block_invoke(double a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if ((_MergedGlobals - 1) <= 3)
  {
    LODWORD(a1) = _baaCertRetryPeriods[(_MergedGlobals - 1)];
    double v1 = (double)*(unint64_t *)&a1;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v1];
      int v3 = 138412290;
      id v4 = v2;
      _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "scheduleBAACertificateIssuanceRetryTimer(): scheduled to %@", (uint8_t *)&v3, 0xCu);
    }
    [(id)_baaRenewalTimer resetWithTimeInterval:&__block_literal_global_84 block:v1];
  }
}

uint64_t __scheduleBAACertificateIssuanceRetryTimer_block_invoke_82()
{
  [(id)_baaCertIssueLock lock];
  if (_MergedGlobals) {
    issueNewBAACertificate();
  }
  io_registry_entry_t v0 = (void *)_baaCertIssueLock;

  return [v0 unlock];
}

uint64_t __scheduleBAACertificateRenewalTimer_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t result = _baaCertExpDate;
  if (_baaCertExpDate)
  {
    [(id)_baaCertExpDate timeIntervalSinceNow];
    double v2 = v1;
    uint64_t v3 = certificateRenewPeriod();
    if (v2 - (double)(unint64_t)v3 >= 0.0) {
      double v4 = v2 - (double)(unint64_t)v3;
    }
    else {
      double v4 = 0.0;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v4];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "scheduleBAACertificateRenewalTimer(): scheduled to %@", (uint8_t *)&v6, 0xCu);
    }
    return [(id)_baaRenewalTimer resetWithTimeInterval:&__block_literal_global_89 block:v4];
  }
  return result;
}

uint64_t certificateRenewPeriod()
{
  uint64_t v0 = 2592000;
  if ([(id)_delegate isInternal])
  {
    id v1 = getNumberFromBootArgs(@"sseBAACertRenewPeriod");
    double v2 = v1;
    if (v1) {
      uint64_t v0 = [v1 unsignedIntegerValue];
    }
  }
  return v0;
}

void issueNewBAACertificate_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 67109120;
  v0[1] = _MergedGlobals;
  _os_log_error_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "DeviceIdentityIssueClientCertificateWithCompletion(attempt = %u) timeout", (uint8_t *)v0, 8u);
}

void isDeviceActivated_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "MAEGetActivationStateWithError() -> %@", (uint8_t *)&v1, 0xCu);
}

void __createBAACertificates_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1[0] = 67109634;
  v1[1] = _MergedGlobals;
  __int16 v2 = 1024;
  int v3 = HIDWORD(_MergedGlobals);
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_226DA9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "DeviceIdentityIssueClientCertificateWithCompletion(attempt = %u, networkFailCount = %u) failed: %@", (uint8_t *)v1, 0x18u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x270F4A8C0]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x270F05638](target, queue);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x270EFD7D8]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x270EFD7F8]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x270EFD808]();
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x270EFD850]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

uint64_t mobileactivationErrorHasDomainAndErrorCode()
{
  return MEMORY[0x270F25E80]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}