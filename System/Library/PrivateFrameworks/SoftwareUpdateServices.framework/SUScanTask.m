@interface SUScanTask
- (BOOL)cancelTask;
- (BOOL)didScanForType:(int)a3;
- (SUCorePolicy)suScanPolicy;
- (SUCoreScan)coreScanner;
- (SUScanTask)initWithOptions:(id)a3;
- (int64_t)_scanPriorityForOptions:(id)a3;
- (int64_t)scanPriority;
- (void)_queue_CollectDocumentation:(id)a3 sessionID:(id)a4 completion:(id)a5;
- (void)_queue_scanForUpdates:(id)a3 sessionID:(id)a4 completion:(id)a5;
- (void)scanForDocumentationAssetWithDescriptor:(id)a3 completion:(id)a4;
- (void)scanForSUAssetWithCompletion:(id)a3;
- (void)setCoreScanner:(id)a3;
@end

@implementation SUScanTask

- (SUScanTask)initWithOptions:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUScanTask;
  v6 = [(SUScanTask *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_scanPriority = [(SUScanTask *)v6 _scanPriorityForOptions:v5];
    objc_storeStrong((id *)&v7->_scanOptions, a3);
    coreScanner = v7->_coreScanner;
    v7->_coreScanner = 0;

    suScanPolicy = v7->_suScanPolicy;
    v7->_suScanPolicy = 0;

    uint64_t v10 = [v5 sessionID];
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v10;

    v7->_cancelRequested = 0;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.softwareupdateservices.SUScanTaskQueue", 0);
    scanQueue = v7->_scanQueue;
    v7->_scanQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    types = v7->_types;
    v7->_types = v14;
  }
  return v7;
}

- (void)scanForSUAssetWithCompletion:(id)a3
{
  id v4 = a3;
  scanQueue = self->_scanQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUScanTask_scanForSUAssetWithCompletion___block_invoke;
  v7[3] = &unk_26447C940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(scanQueue, v7);
}

void __43__SUScanTask_scanForSUAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 48)) {
    SULogInfo(@"cancel requested so not performing scanForSUAssetWithCompletion and not triggering completion", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_queue_scanForUpdates:sessionID:completion:", *(void *)(v9 + 16), *(void *)(v9 + 40), *(void *)(a1 + 40));
  }
}

- (void)scanForDocumentationAssetWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  scanQueue = self->_scanQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUScanTask_scanForDocumentationAssetWithDescriptor_completion___block_invoke;
  block[3] = &unk_26447C968;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(scanQueue, block);
}

void __65__SUScanTask_scanForDocumentationAssetWithDescriptor_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 48)) {
    SULogInfo(@"cancel requested so not performing scanForDocumentationAssetWithDescriptor and not triggering completion", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_queue_CollectDocumentation:sessionID:completion:", *(void *)(a1 + 40), *(void *)(v9 + 40), *(void *)(a1 + 48));
  }
}

- (BOOL)cancelTask
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_scanQueue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  scanQueue = v2->_scanQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__SUScanTask_cancelTask__block_invoke;
  v5[3] = &unk_26447C9B8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(scanQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __24__SUScanTask_cancelTask__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 48) = 1;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __24__SUScanTask_cancelTask__block_invoke_2;
    v7[3] = &unk_26447C990;
    uint64_t v5 = *(void *)(a1 + 40);
    dispatch_semaphore_t v8 = v3;
    uint64_t v9 = v5;
    uint64_t v6 = v3;
    [v4 cancelCurrentScan:v7];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __24__SUScanTask_cancelTask__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    SULogInfo(@"active scan canceled with error:%@", a2, a3, a4, a5, a6, a7, a8, a2);
  }
  else
  {
    SULogInfo(@"active scan canceled successfully", 0, a3, a4, a5, a6, a7, a8, v11);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v9 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v9);
}

- (int64_t)_scanPriorityForOptions:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isSplatOnlyScan];
  int v5 = [v3 isForced];
  if (v4)
  {
    if (v5) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = 1;
    }
  }
  else
  {
    if (v5) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 2;
    }
    dispatch_semaphore_t v8 = [v3 requestedPMV];

    if (v8) {
      int64_t v6 = 5;
    }
    else {
      int64_t v6 = v7;
    }
  }

  return v6;
}

- (int64_t)scanPriority
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_scanQueue);
  uint64_t v7 = 0;
  dispatch_semaphore_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  scanQueue = self->_scanQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__SUScanTask_scanPriority__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(scanQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __26__SUScanTask_scanPriority__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_queue_scanForUpdates:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v36 = a4;
  id v38 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_scanQueue);
  uint64_t v9 = objc_alloc_init(SUPolicyFactory);
  v39 = v8;
  [(SUPolicyFactory *)v9 setScanOptions:v8];
  uint64_t v10 = [(SUPolicyFactory *)v9 corePolicy];
  suScanPolicy = self->_suScanPolicy;
  self->_suScanPolicy = v10;

  id v12 = [(SUPolicyFactory *)v9 globalOptions];
  uint64_t v46 = *MEMORY[0x263F78128];
  v47[0] = v36;
  id v13 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
  [v12 appendUpdateMetricEventFields:v13];

  v40 = v9;
  v37 = v12;
  [(SUPolicyFactory *)v9 setGlobalOptions:v12];
  v44[0] = @"AutomaticDownloadOver3G";
  v35 = [NSNumber numberWithBool:1];
  v45[0] = v35;
  v44[1] = *MEMORY[0x263F77C38];
  v34 = [NSNumber numberWithBool:1];
  v45[1] = v34;
  v44[2] = *MEMORY[0x263F77C30];
  v33 = [NSNumber numberWithBool:1];
  v45[2] = v33;
  v44[3] = *MEMORY[0x263F77C28];
  v32 = [NSNumber numberWithBool:0];
  v45[3] = v32;
  v44[4] = *MEMORY[0x263F77C40];
  v14 = [NSNumber numberWithInt:30];
  v45[4] = v14;
  v44[5] = *MEMORY[0x263F77C48];
  v15 = [NSNumber numberWithInt:80];
  v45[5] = v15;
  v44[6] = *MEMORY[0x263F77C80];
  v16 = NSNumber;
  objc_super v17 = +[SUPreferences sharedInstance];
  v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "overrideRamping"));
  v45[6] = v18;
  v44[7] = *MEMORY[0x263F77C68];
  v19 = NSNumber;
  v20 = +[SUPreferences sharedInstance];
  v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "overrideGranularRamping"));
  v45[7] = v21;
  v44[8] = *MEMORY[0x263F77C60];
  v22 = NSNumber;
  v23 = +[SUPreferences sharedInstance];
  v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "disableSplombo"));
  v45[8] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:9];
  [(SUCorePolicy *)self->_suScanPolicy setDefaultDescriptorValues:v25];

  coreScanner = self->_coreScanner;
  if (!coreScanner)
  {
    v27 = (SUCoreScan *)[objc_alloc(MEMORY[0x263F77BB8]) initWithUUID:v36];
    v28 = self->_coreScanner;
    self->_coreScanner = v27;

    coreScanner = self->_coreScanner;
  }
  v29 = self->_suScanPolicy;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __57__SUScanTask__queue_scanForUpdates_sessionID_completion___block_invoke;
  v41[3] = &unk_26447C9E0;
  v41[4] = self;
  id v42 = v39;
  id v43 = v38;
  id v30 = v38;
  id v31 = v39;
  [(SUCoreScan *)coreScanner checkForAvailableSlowReleaseUpdatesWithPolicy:v29 completion:v41];
}

void __57__SUScanTask__queue_scanForUpdates_sessionID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v25 = a7;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    v26 = [*(id *)(a1 + 40) types];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      id v46 = v13;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v28 = [*(id *)(a1 + 40) types];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v48 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v30);
      }

      id v13 = v46;
    }
    else
    {
      v33 = *(void **)(*(void *)(a1 + 32) + 64);
      v34 = [NSNumber numberWithInt:0];
      [v33 addObject:v34];
    }
  }
  uint64_t v35 = *(void *)(a1 + 48);
  if (!v35)
  {
    id v36 = @"No completion callback so not reporting scan completion";
    goto LABEL_16;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    id v36 = @"scan completed but cancel requested so not triggering completion";
LABEL_16:
    SULogInfo(v36, v18, v19, v20, v21, v22, v23, v24, v45);
    goto LABEL_23;
  }
  if (v25)
  {
    if ([v25 code] == 8403) {
      SULogInfo(@"scan completed with ScanCanceled error but cancel was not requested, triggering completion with error", v37, v38, v39, v40, v41, v42, v43, v45);
    }
    v44 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v44 = *(void (**)(void))(v35 + 16);
  }
  v44();
LABEL_23:
}

- (void)_queue_CollectDocumentation:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_scanQueue);
  if (!self->_coreScanner)
  {
    uint64_t v11 = (SUCoreScan *)[objc_alloc(MEMORY[0x263F77BB8]) initWithUUID:v9];
    coreScanner = self->_coreScanner;
    self->_coreScanner = v11;
  }
  id v13 = objc_alloc_init(SUPolicyFactory);
  id v14 = [(SUPolicyFactory *)v13 globalOptions];
  uint64_t v23 = *MEMORY[0x263F78128];
  v24[0] = v9;
  id v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v14 appendUpdateMetricEventFields:v15];

  [(SUPolicyFactory *)v13 setGlobalOptions:v14];
  [(SUPolicyFactory *)v13 setScanOptions:self->_scanOptions];
  id v16 = self->_coreScanner;
  id v17 = [(SUPolicyFactory *)v13 corePolicy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__SUScanTask__queue_CollectDocumentation_sessionID_completion___block_invoke;
  v20[3] = &unk_26447CA08;
  id v21 = v8;
  id v22 = v10;
  v20[4] = self;
  id v18 = v8;
  id v19 = v10;
  [(SUCoreScan *)v16 collectDocumentationMetadataWithPolicy:v17 descriptor:v18 downloadDocumentation:1 completion:v20];
}

void __63__SUScanTask__queue_CollectDocumentation_sessionID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v26 = a2;
  id v7 = a3;
  id v8 = a4;
  id v16 = v8;
  if (!*(void *)(a1 + 48))
  {
    id v17 = @"No completion callback so not reporting document scan completion";
    goto LABEL_5;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    id v17 = @"document scan completed but cancel requested so not triggering completion";
LABEL_5:
    SULogInfo(v17, v9, v10, v11, v12, v13, v14, v15, v25);
    goto LABEL_10;
  }
  if (v8 && [v8 code] == 8403) {
    SULogInfo(@"document scan completed with ScanCanceled error but cancel was not requested, triggering completion with error", v18, v19, v20, v21, v22, v23, v24, v25);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_10:
}

- (BOOL)didScanForType:(int)a3
{
  types = self->_types;
  int64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  LOBYTE(types) = [(NSMutableSet *)types containsObject:v4];

  return (char)types;
}

- (SUCoreScan)coreScanner
{
  return self->_coreScanner;
}

- (void)setCoreScanner:(id)a3
{
}

- (SUCorePolicy)suScanPolicy
{
  return self->_suScanPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_suScanPolicy, 0);
  objc_storeStrong((id *)&self->_coreScanner, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
}

@end