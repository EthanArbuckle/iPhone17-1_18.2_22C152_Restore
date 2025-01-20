@interface SMEligibilityChecker
+ (id)convertEligibilityTypeToString:(int64_t)a3;
+ (id)convertToPushTokenMap:(id)a3;
- (BOOL)checkRecipientAccountIsUnique:(id)a3;
- (IDSIDQueryController)idsIDQueryController;
- (IDSService)iCloudIDSService;
- (IDSService)iMessageIDSService;
- (OS_dispatch_queue)queue;
- (SMEligibilityChecker)initWithQueue:(id)a3;
- (SMEligibilityChecker)initWithQueue:(id)a3 IDSIDQueryController:(id)a4 iMessageIDSService:(id)a5 iCloudIDSService:(id)a6;
- (int64_t)reportedEligibilityWithiMessageEligibility:(int64_t)a3 iCloudEligibility:(int64_t)a4;
- (void)addDelegateForService:(id)a3;
- (void)checkConversationEligibility:(id)a3 handler:(id)a4;
- (void)checkReceiverEligibility:(id)a3 handler:(id)a4;
- (void)resolveEndpointsForDestinations:(id)a3 service:(id)a4 requiredCapabilities:(id)a5 completionBlock:(id)a6;
- (void)setICloudIDSService:(id)a3;
- (void)setIMessageIDSService:(id)a3;
- (void)setIdsIDQueryController:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SMEligibilityChecker

- (SMEligibilityChecker)initWithQueue:(id)a3
{
  v4 = (void *)MEMORY[0x263F4A058];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  v7 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.safetymonitor"];
  v8 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.safetymonitor.multiplex"];
  v9 = [(SMEligibilityChecker *)self initWithQueue:v5 IDSIDQueryController:v6 iMessageIDSService:v7 iCloudIDSService:v8];

  return v9;
}

- (SMEligibilityChecker)initWithQueue:(id)a3 IDSIDQueryController:(id)a4 iMessageIDSService:(id)a5 iCloudIDSService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SMEligibilityChecker;
  v15 = [(SMEligibilityChecker *)&v19 init];
  p_isa = (id *)&v15->super.isa;
  if (!v15) {
    goto LABEL_5;
  }
  v17 = 0;
  if (v12 && v13)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    [p_isa addDelegateForService:@"com.apple.private.alloy.safetymonitor"];
    [p_isa addDelegateForService:@"com.apple.private.alloy.safetymonitor.multiplex"];
LABEL_5:
    v17 = p_isa;
  }

  return v17;
}

- (void)addDelegateForService:(id)a3
{
  id v4 = a3;
  id v6 = [(SMEligibilityChecker *)self idsIDQueryController];
  id v5 = [(SMEligibilityChecker *)self queue];
  [v6 addDelegate:self forService:v4 listenerID:@"__kSMServiceForEligibilityCheckListenerID" queue:v5];
}

+ (id)convertToPushTokenMap:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__SMEligibilityChecker_convertToPushTokenMap___block_invoke;
    v9[3] = &unk_265499028;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v9];

    v7 = (void *)[v6 copy];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA78];
  }
  return v7;
}

void __46__SMEligibilityChecker_convertToPushTokenMap___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 pushToken];
  [v2 setObject:v3 forKey:v4];
}

- (void)checkReceiverEligibility:(id)a3 handler:(id)a4
{
  v72[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7 && ([v7 primaryHandle], v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    os_signpost_id_t v60 = 0;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    os_signpost_id_t v60 = v11;
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    id v13 = v12;
    os_signpost_id_t v14 = v58[3];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_25B6E0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SMCheckReceiverEligibility", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    v15 = [v7 primaryHandle];
    BOOL v16 = [(SMEligibilityChecker *)self checkRecipientAccountIsUnique:v15];

    if (v16)
    {
      v17 = dispatch_group_create();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v65 = 0x3032000000;
      v66 = __Block_byref_object_copy_;
      v67 = __Block_byref_object_dispose_;
      id v68 = (id)MEMORY[0x263EFFA78];
      v56[0] = 0;
      v56[1] = v56;
      v56[2] = 0x2020000000;
      v56[3] = 0;
      dispatch_group_enter(v17);
      v18 = [v7 primaryHandle];
      v63 = v18;
      objc_super v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
      uint64_t v62 = *MEMORY[0x263F4A1C8];
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke;
      v51[3] = &unk_265499050;
      id v21 = v7;
      id v52 = v21;
      v54 = v56;
      p_long long buf = &buf;
      v22 = v17;
      v53 = v22;
      [(SMEligibilityChecker *)self resolveEndpointsForDestinations:v19 service:@"com.apple.private.alloy.safetymonitor" requiredCapabilities:v20 completionBlock:v51];

      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = __Block_byref_object_copy_;
      v49[4] = __Block_byref_object_dispose_;
      id v50 = (id)MEMORY[0x263EFFA78];
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v48[3] = 0;
      dispatch_group_enter(v22);
      v23 = [v21 primaryHandle];
      v61 = v23;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_21;
      v43[3] = &unk_265499050;
      id v25 = v21;
      id v44 = v25;
      v46 = v48;
      v47 = v49;
      v26 = v22;
      v45 = v26;
      [(SMEligibilityChecker *)self resolveEndpointsForDestinations:v24 service:@"com.apple.private.alloy.safetymonitor.multiplex" requiredCapabilities:MEMORY[0x263EFFA68] completionBlock:v43];

      v27 = [(SMEligibilityChecker *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_22;
      block[3] = &unk_265499078;
      block[4] = self;
      v37 = v56;
      v38 = v48;
      v39 = &buf;
      v40 = v49;
      SEL v42 = a2;
      id v35 = v25;
      v41 = &v57;
      id v36 = v8;
      dispatch_group_notify(v26, v27, block);

      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v49, 8);

      _Block_object_dispose(v56, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v69 = *MEMORY[0x263F08320];
      v70 = @"Receiver handle overlaps with initiator iMessage or iCloud account";
      v26 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v30 = [MEMORY[0x263F087E8] errorWithDomain:@"SMErrorDomain" code:1 userInfo:v26];
      v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v32 = v31;
      os_signpost_id_t v33 = v58[3];
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LODWORD(buf) = 134349056;
        *(void *)((char *)&buf + 4) = 2;
        _os_signpost_emit_with_name_impl(&dword_25B6E0000, v32, OS_SIGNPOST_INTERVAL_END, v33, "SMCheckReceiverEligibility", " enableTelemetry=YES {receiverEligibility:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, void, void *))v8 + 2))(v8, 2, MEMORY[0x263EFFA68], v30);
    }

    _Block_object_dispose(&v57, 8);
  }
  else
  {
    uint64_t v71 = *MEMORY[0x263F08320];
    v72[0] = @"No handles in the query";
    v28 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
    v29 = [MEMORY[0x263F087E8] errorWithDomain:@"SMErrorDomain" code:7 userInfo:v28];
    (*((void (**)(id, uint64_t, void, void *))v8 + 2))(v8, 2, MEMORY[0x263EFFA68], v29);
  }
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    v9 = [*(id *)(a1 + 32) primaryHandle];
    v18 = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "Got %lu zelkova endpoints for %@, error, %@", buf, 0x20u);
  }
  if (v6)
  {
    os_signpost_id_t v11 = [v6 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F49E88]];

    if (v12)
    {
      uint64_t v13 = [v6 code];
      uint64_t v14 = 6;
      if (v13 != 5) {
        uint64_t v14 = 7;
      }
      if (v13 == 3) {
        uint64_t v14 = 3;
      }
      goto LABEL_12;
    }
  }
  if (![v5 count])
  {
    uint64_t v14 = 4;
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
  }
  uint64_t v15 = +[SMEligibilityChecker convertToPushTokenMap:v5];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    v9 = [*(id *)(a1 + 32) primaryHandle];
    v18 = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "Got %lu nice endpoints for %@, error, %@", buf, 0x20u);
  }
  if (v6)
  {
    os_signpost_id_t v11 = [v6 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F49E88]];

    if (v12)
    {
      uint64_t v13 = [v6 code];
      uint64_t v14 = 6;
      if (v13 != 5) {
        uint64_t v14 = 7;
      }
      if (v13 == 3) {
        uint64_t v14 = 5;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
    }
  }
  uint64_t v15 = +[SMEligibilityChecker convertToPushTokenMap:v5];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_22(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) reportedEligibilityWithiMessageEligibility:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) iCloudEligibility:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allKeys];
  id v5 = [v3 setWithArray:v4];

  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) allKeys];
  uint64_t v8 = [v6 setWithArray:v7];

  v9 = (void *)[v5 mutableCopy];
  [v9 intersectSet:v8];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * v15), (void)v30);
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v48 count:16];
    }
    while (v13);
  }

  v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v26 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)long long buf = 138413826;
    uint64_t v35 = (uint64_t)v26;
    __int16 v36 = 2112;
    uint64_t v37 = v27;
    __int16 v38 = 2048;
    uint64_t v39 = v28;
    __int16 v40 = 2048;
    uint64_t v41 = v29;
    __int16 v42 = 2112;
    v43 = v5;
    __int16 v44 = 2112;
    v45 = v8;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_debug_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_DEBUG, "%@, handle, %@, iMessageEligibilityError, %ld, iCloudEligibilityError, %ld, pushTokenSetForZelkova, %@, pushTokenSetForNice, %@, pushTokenSetIntersection, %@", buf, 0x48u);
  }
  if (!v2)
  {
    if ([v10 count]) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  objc_super v19 = v18;
  os_signpost_id_t v20 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)long long buf = 134349056;
    uint64_t v35 = v2;
    _os_signpost_emit_with_name_impl(&dword_25B6E0000, v19, OS_SIGNPOST_INTERVAL_END, v20, "SMCheckReceiverEligibility", " enableTelemetry=YES {receiverEligibility:%{public,signpost.telemetry:number1}ld}", buf, 0xCu);
  }

  __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v35 = (uint64_t)v22;
    __int16 v36 = 2112;
    uint64_t v37 = v23;
    __int16 v38 = 2048;
    uint64_t v39 = v2;
    _os_log_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_INFO, "%@, handle, %@, eligibility, %ld", buf, 0x20u);
  }
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v25 = (void *)[v10 copy];
  (*(void (**)(uint64_t, uint64_t, void *, void))(v24 + 16))(v24, v2, v25, 0);
}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  v43[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v17 = a4;
  if (v5
    && ([v5 receiverHandles], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "%@, checking eligibility for %@", buf, 0x16u);
    }
    v9 = dispatch_group_create();
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy_;
    __int16 v40 = __Block_byref_object_dispose_;
    id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy_;
    v35[4] = __Block_byref_object_dispose_;
    id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = [v5 receiverHandles];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "setObject:forKey:", &unk_270919760, v14, v17);
          dispatch_group_enter(v9);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke;
          v26[3] = &unk_2654990A0;
          v26[4] = v14;
          uint64_t v28 = buf;
          uint64_t v29 = v35;
          SEL v30 = a2;
          uint64_t v27 = v9;
          [(SMEligibilityChecker *)self checkReceiverEligibility:v14 handler:v26];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(SMEligibilityChecker *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke_32;
    block[3] = &unk_2654990C8;
    uint64_t v23 = buf;
    uint64_t v24 = v35;
    SEL v25 = a2;
    id v21 = v5;
    id v22 = v17;
    dispatch_group_notify(v9, v15, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v42 = *MEMORY[0x263F08320];
    v43[0] = @"No conversation or missing conversation data in the query";
    v9 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, v17);
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SMErrorDomain" code:7 userInfo:v9];
    (*((void (**)(id, uint64_t, void *))v17 + 2))(v17, 2, v16);
  }
}

void __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138413058;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_debug_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_DEBUG, "%@, handle, %@, eligibility, %ld, error, %@", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v9 = [NSNumber numberWithInteger:a2];
  [v8 setObject:v9 forKey:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v6 forKey:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke_32(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKey:", v8, (void)v16);
        uint64_t v10 = (int)[v9 intValue];

        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKey:v8];
        if (v11)
        {
          int v12 = (void *)v11;
          uint64_t v5 = v10;
          goto LABEL_15;
        }
        if (v5 == 1) {
          uint64_t v5 = 1;
        }
        else {
          uint64_t v5 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    int v12 = 0;
  }
  else
  {
    int v12 = 0;
    uint64_t v5 = 0;
  }
LABEL_15:

  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138413058;
    id v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2048;
    uint64_t v25 = v5;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_INFO, "%@, conversation, %@, eligibility, %ld, error, %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveEndpointsForDestinations:(id)a3 service:(id)a4 requiredCapabilities:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(SMEligibilityChecker *)self idsIDQueryController];
  long long v16 = [(SMEligibilityChecker *)self queue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke;
  v21[3] = &unk_265499140;
  id v25 = v14;
  SEL v26 = a2;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  [v15 currentRemoteDevicesForDestinations:v19 service:v18 listenerID:@"__kSMServiceForEligibilityCheckListenerID" queue:v16 completionBlockWithError:v21];
}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v10 = [*(id *)(a1 + 32) description];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v12 = [v5 count];
      id v13 = [0 description];
      *(_DWORD *)long long buf = 138413570;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_debug_impl(&dword_25B6E0000, v8, OS_LOG_TYPE_DEBUG, "%@, destinations, %@, service, %@, capabilities, %@, numResults, %ld, error, %@", buf, 0x3Eu);
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_33;
    v15[3] = &unk_265499118;
    id v16 = *(id *)(a1 + 48);
    id v17 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_2;
  v5[3] = &unk_2654990F0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [a3 enumerateObjectsUsingBlock:v5];
}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 capabilities];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v6)
  {

LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (void)v11);
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v12;
  int v9 = 1;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      v9 &= objc_msgSend(v4, "valueForCapability:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v7);

  if (v9) {
    goto LABEL_11;
  }
LABEL_12:
}

+ (id)convertEligibilityTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"Valid";
  }
  else {
    return *(&off_265499160 + a3);
  }
}

- (int64_t)reportedEligibilityWithiMessageEligibility:(int64_t)a3 iCloudEligibility:(int64_t)a4
{
  if (a3 && a4)
  {
    int64_t v4 = 7;
    BOOL v5 = a4 == 5 && a3 == 3;
    int64_t v6 = 2;
    if (!v5) {
      int64_t v6 = a3;
    }
    if (a4 == 7) {
      int64_t v6 = 7;
    }
    if (a3 != 7) {
      int64_t v4 = v6;
    }
    if (a4 == 6) {
      int64_t v4 = 6;
    }
    if (a3 == 6) {
      return 6;
    }
    else {
      return v4;
    }
  }
  else if (a3)
  {
    return a3;
  }
  else
  {
    return a4;
  }
}

- (BOOL)checkRecipientAccountIsUnique:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v7 = [(SMEligibilityChecker *)self iMessageIDSService];
  uint64_t v8 = [v7 aliases];
  [v6 unionSet:v8];

  int v9 = [(SMEligibilityChecker *)self iCloudIDSService];
  uint64_t v10 = [v9 aliases];
  [v6 unionSet:v10];

  long long v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_DEBUG, "%@, checking recipient handle, recipientHandle, %@, self aliases, %@", (uint8_t *)&v15, 0x20u);
  }
  char v12 = [v6 containsObject:v5];

  return v12 ^ 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSIDQueryController)idsIDQueryController
{
  return self->_idsIDQueryController;
}

- (void)setIdsIDQueryController:(id)a3
{
}

- (IDSService)iMessageIDSService
{
  return self->_iMessageIDSService;
}

- (void)setIMessageIDSService:(id)a3
{
}

- (IDSService)iCloudIDSService
{
  return self->_iCloudIDSService;
}

- (void)setICloudIDSService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIDSService, 0);
  objc_storeStrong((id *)&self->_iMessageIDSService, 0);
  objc_storeStrong((id *)&self->_idsIDQueryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end