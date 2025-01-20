@interface SSNetworkQualityInquiry
+ (BOOL)isEntitled;
+ (id)sharedInstance;
- (BOOL)areKnownNetworksReady;
- (NSMutableArray)knownNetworksReadyHandlers;
- (NSMutableSet)knownNetworks;
- (NWNetworkOfInterestManager)manager;
- (OS_dispatch_queue)queue;
- (SSNetworkQualityInquiry)init;
- (id)investigateNetworks;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)drainKnownNetworksReadyHandlers;
- (void)performWhenKnownNetworksReady:(id)a3;
- (void)setKnownNetworksReadyHandlers:(id)a3;
@end

@implementation SSNetworkQualityInquiry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSNetworkQualityInquiry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedSelf;
  return v2;
}

void __41__SSNetworkQualityInquiry_sharedInstance__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(SSNetworkQualityInquiry);
  v1 = (void *)sharedInstance_sharedSelf;
  sharedInstance_sharedSelf = (uint64_t)v0;

  if (!sharedInstance_sharedSelf)
  {
    v2 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v2)
    {
      v2 = +[SSLogConfig sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      v4 &= 2u;
    }
    if (v4)
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = objc_opt_class();
      id v6 = *(id *)((char *)&v15 + 4);
      LODWORD(v14) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        return;
      }
      v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
      free(v7);
      SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    }

    goto LABEL_13;
  }
}

- (SSNetworkQualityInquiry)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() isEntitled] & 1) == 0)
  {
    uint64_t v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      uint64_t v11 = +[SSLogConfig sharedConfig];
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
      int v27 = 138412290;
      id v28 = (id)objc_opt_class();
      id v15 = v28;
      LODWORD(v25) = 12;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

        int v3 = 0;
        goto LABEL_17;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v27, v25);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_16;
  }
  v26.receiver = self;
  v26.super_class = (Class)SSNetworkQualityInquiry;
  int v3 = [(SSNetworkQualityInquiry *)&v26 init];
  if (v3)
  {
    uint64_t v4 = SSVSymptomPresentationFeed();
    v5 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Nwnetworkofint.isa, v4));
    manager = v3->_manager;
    v3->_manager = v5;

    if (!v3->_manager)
    {
      v23 = 0;
      goto LABEL_18;
    }
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.StoreServices.NetworkQualityInquiry.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    [(NWNetworkOfInterestManager *)v3->_manager setQueue:v3->_queue];
    [(NWNetworkOfInterestManager *)v3->_manager setDelegate:v3];
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownNetworks = v3->_knownNetworks;
    v3->_knownNetworks = v9;

    [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:2 options:0];
    [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:1 options:0];
    [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:3 options:0];
  }
LABEL_17:
  int v3 = v3;
  v23 = v3;
LABEL_18:

  return v23;
}

- (void)dealloc
{
  [(NWNetworkOfInterestManager *)self->_manager setDelegate:0];
  [(NWNetworkOfInterestManager *)self->_manager destroy];
  v3.receiver = self;
  v3.super_class = (Class)SSNetworkQualityInquiry;
  [(SSNetworkQualityInquiry *)&v3 dealloc];
}

- (BOOL)areKnownNetworksReady
{
  objc_super v3 = [(SSNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SSNetworkQualityInquiry *)self knownNetworks];
  LOBYTE(v3) = [v4 count] == 3;

  return (char)v3;
}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4 = a3;
  v5 = [(SSNetworkQualityInquiry *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__SSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) areKnownNetworksReady])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    objc_super v3 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];

    if (!v3)
    {
      id v4 = *(void **)(a1 + 32);
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [v4 setKnownNetworksReadyHandlers:v5];
    }
    id v8 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];
    id v6 = (void *)[*(id *)(a1 + 40) copy];
    dispatch_queue_t v7 = (void *)MEMORY[0x1A6268200]();
    [v8 addObject:v7];
  }
}

- (void)drainKnownNetworksReadyHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SSNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(SSNetworkQualityInquiry *)self knownNetworksReadyHandlers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(SSNetworkQualityInquiry *)self setKnownNetworksReadyHandlers:0];
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSNetworkQualityInquiry *)self knownNetworks];
  [v5 addObject:v4];

  if ([(SSNetworkQualityInquiry *)self areKnownNetworksReady])
  {
    [(SSNetworkQualityInquiry *)self drainKnownNetworksReadyHandlers];
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SSNetworkQualityInquiry *)self knownNetworks];
  [v5 removeObject:v4];

  uint64_t v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    uint64_t v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  long long v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (!v10) {
    goto LABEL_12;
  }
  int v20 = 138412546;
  uint64_t v21 = self;
  __int16 v22 = 2112;
  id v23 = v4;
  LODWORD(v19) = 22;
  long long v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    long long v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v20, v19);
    free(v11);
    SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v9);
LABEL_12:
  }
  uint64_t v18 = [(SSNetworkQualityInquiry *)self manager];
  objc_msgSend(v18, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SSNetworkQualityInquiry *)self didStopTrackingNOI:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)investigateNetworks
{
  objc_super v3 = objc_alloc_init(SSPromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke;
  v8[3] = &unk_1E5BAABD0;
  v8[4] = self;
  id v4 = v3;
  long long v9 = v4;
  [(SSNetworkQualityInquiry *)self performWhenKnownNetworksReady:v8];
  uint64_t v5 = v9;
  uint64_t v6 = v4;

  return v6;
}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_2;
    v34[3] = &unk_1E5BAAB58;
    id v35 = *(id *)(a1 + 40);
    [v3 addFinishBlock:v34];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    [v4 timeIntervalSince1970];
    double v6 = v5;

    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(v7 + 8) && (uint64_t)(v6 * 1000.0) - *(void *)(v7 + 16) <= 999)
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");
    }
    else
    {
      uint64_t v22 = a1;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v9 = [v24 knownNetworks];
      uint64_t v10 = [v9 count];

      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = [v24 knownNetworks];
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
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
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
            uint64_t v17 = objc_alloc_init(SSPromise);
            [v8 addObject:v17];
            uint64_t v18 = [v24 manager];
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_3;
            v27[3] = &unk_1E5BAAB80;
            v27[4] = v16;
            id v28 = v11;
            uint64_t v29 = v17;
            uint64_t v19 = v17;
            [v18 auditableLinkQualityForNOI:v16 reply:v27];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v13);
      }

      int v20 = +[SSPromise promiseWithAll:v8];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_55;
      v25[3] = &unk_1E5BAABA8;
      v25[4] = *(void *)(v22 + 32);
      id v26 = v11;
      id v21 = v11;
      [v20 addFinishBlock:v25];
      objc_storeStrong((id *)(*(void *)(v22 + 32) + 24), *(id *)(v22 + 40));
    }
  }
}

uint64_t __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = v5;
  if (v8 && (uint64_t v9 = [v7 interface], (unint64_t)(v9 - 1) <= 2))
  {
    uint64_t v10 = off_1E5BAABF0[v9 - 1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)uint64_t v29 = MEMORY[0x1E4F143A8];
    *(void *)&v29[8] = 3221225472;
    *(void *)&v29[16] = __SSNetworkQualityInquiryReportMake_block_invoke;
    long long v30 = &unk_1E5BA9610;
    id v12 = v11;
    id v31 = v12;
    [v8 enumerateKeysAndObjectsUsingBlock:v29];
    if ([v12 count])
    {
      [v12 setObject:v10 forKeyedSubscript:@"interface"];
      uint64_t v13 = (void *)[v12 copy];
    }
    else
    {
      uint64_t v13 = 0;
    }

    if (v13)
    {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
  else
  {
  }
  if (v6)
  {
    uint64_t v14 = +[SSLogConfig sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    uint64_t v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v29 = 138412546;
      *(void *)&v29[4] = v19;
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = v6;
      LODWORD(v28) = 22;
      int v27 = v29;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, v29, v28);
      free(v20);
      SSFileLog(v14, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E4F1CC38], v27);
}

void __46__SSNetworkQualityInquiry_investigateNetworks__block_invoke_55(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v2 timeIntervalSince1970];
  *(void *)(*(void *)(a1 + 32) + 16) = (uint64_t)(v3 * 1000.0);

  [*(id *)(*(void *)(a1 + 32) + 24) finishWithResult:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

+ (BOOL)isEntitled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [&unk_1EF9A99A8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v15;
  char v5 = 1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v15 != v4) {
        objc_enumerationMutation(&unk_1EF9A99A8);
      }
      CFStringRef v7 = *(const __CFString **)(*((void *)&v14 + 1) + 8 * i);
      id v8 = SecTaskCreateFromSelf(0);
      if (v8)
      {
        uint64_t v9 = v8;
        CFErrorRef error = 0;
        CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v7, &error);
        if (error) {
          CFRelease(error);
        }
        BOOL v11 = v10 != 0;
        if (v10) {
          CFRelease(v10);
        }
        CFRelease(v9);
      }
      else
      {
        BOOL v11 = 0;
      }
      v5 &= v11;
    }
    uint64_t v3 = [&unk_1EF9A99A8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v3);
  return v5;
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_currentInvestigation, 0);
  objc_storeStrong((id *)&self->_lastKnownReports, 0);
}

@end