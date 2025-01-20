@interface NDAnalyticsEnvelopeManager
- (FCAsyncSerialQueue)submissionQueue;
- (FCKeyValueStore)lastUploadDatesByContentType;
- (NDAnalyticsEnvelopeManager)init;
- (NDAnalyticsEnvelopeManager)initWithAppConfigurationManager:(id)a3 telemetryUploader:(id)a4 storeDirectoryFileURL:(id)a5 URLSessionQueue:(id)a6;
- (NDAnalyticsEnvelopeStore)envelopeStore;
- (NDAnalyticsPayloadAssembler)payloadAssembler;
- (NDAnalyticsPayloadUploader)payloadUploader;
- (NDAnalyticsTelemetryUploader)telemetryUploader;
- (NDAnalyticsUploadScheduler)uploadScheduler;
- (NFMutexLock)keyValueStoreLock;
- (OS_dispatch_queue)URLSessionQueue;
- (id)_handleDroppedEnvelopesForLocalReasons:(id)a3;
- (id)_handleOutcomeOfUploadAttemptWithPayload:(id)a3 success:(BOOL)a4 error:(id)a5 willRetry:(BOOL)a6 hitEndpoint:(BOOL)a7;
- (id)_lastUploadDatesByContentType;
- (void)_scheduleUploadIfNeededWithCompletion:(id)a3;
- (void)_uploadTelemetryEnvelopes:(id)a3;
- (void)envelopeStore:(id)a3 didFlushEnvelopesForEntries:(id)a4;
- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4;
- (void)setEnvelopeStore:(id)a3;
- (void)setKeyValueStoreLock:(id)a3;
- (void)setLastUploadDatesByContentType:(id)a3;
- (void)setPayloadAssembler:(id)a3;
- (void)setPayloadUploader:(id)a3;
- (void)setSubmissionQueue:(id)a3;
- (void)setTelemetryUploader:(id)a3;
- (void)setUploadScheduler:(id)a3;
- (void)submitEnvelopes:(id)a3 withCompletion:(id)a4;
- (void)uploadScheduler:(id)a3 performUploadWithCompletion:(id)a4;
- (void)uploadSchedulerDidDropScheduledBackgroundUpload:(id)a3;
@end

@implementation NDAnalyticsEnvelopeManager

- (NDAnalyticsEnvelopeManager)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsEnvelopeManager init]";
    __int16 v9 = 2080;
    v10 = "NDAnalyticsEnvelopeManager.m";
    __int16 v11 = 1024;
    int v12 = 58;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAnalyticsEnvelopeManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAnalyticsEnvelopeManager)initWithAppConfigurationManager:(id)a3 telemetryUploader:(id)a4 storeDirectoryFileURL:(id)a5 URLSessionQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:]();
    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:]();
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:]();
  }
  v35.receiver = self;
  v35.super_class = (Class)NDAnalyticsEnvelopeManager;
  v14 = [(NDAnalyticsEnvelopeManager *)&v35 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x263F59398]) initWithQualityOfService:-1];
    submissionQueue = v14->_submissionQueue;
    v14->_submissionQueue = (FCAsyncSerialQueue *)v15;

    objc_storeStrong((id *)&v14->_URLSessionQueue, a6);
    objc_storeStrong((id *)&v14->_telemetryUploader, a4);
    v17 = [[NDAnalyticsEnvelopeStore alloc] initWithStoreDirectoryFileURL:v12];
    [(NDAnalyticsEnvelopeStore *)v17 setObserver:v14];
    [(NDAnalyticsEnvelopeStore *)v17 enableFlushing];
    envelopeStore = v14->_envelopeStore;
    v14->_envelopeStore = v17;
    v19 = v17;

    v20 = [[NDAppConfigAnalyticsPayloadAssemblerConfigProvider alloc] initWithAppConfigurationManager:v10];
    v21 = [[NDAnalyticsPayloadAssembler alloc] initWithConfigProvider:v20 maxPayloadSize:1000000];
    payloadAssembler = v14->_payloadAssembler;
    v14->_payloadAssembler = v21;

    v23 = [[NDAnalyticsPayloadUploader alloc] initWithAppConfigurationManager:v10];
    payloadUploader = v14->_payloadUploader;
    v14->_payloadUploader = v23;

    v25 = [[NDAnalyticsUploadScheduler alloc] initWithURLSessionQueue:v13];
    [(NDAnalyticsUploadScheduler *)v25 setDelegate:v14];
    uploadScheduler = v14->_uploadScheduler;
    v14->_uploadScheduler = v25;
    v27 = v25;

    id v28 = objc_alloc(MEMORY[0x263F59518]);
    v29 = [v12 path];
    uint64_t v30 = [v28 initWithName:@"last-upload" directory:v29 version:1 options:0 classRegistry:0];
    lastUploadDatesByContentType = v14->_lastUploadDatesByContentType;
    v14->_lastUploadDatesByContentType = (FCKeyValueStore *)v30;

    uint64_t v32 = objc_opt_new();
    keyValueStoreLock = v14->_keyValueStoreLock;
    v14->_keyValueStoreLock = (NFMutexLock *)v32;
  }
  return v14;
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager handleLaunchEventForBackgroundSessionWithIdentifier:completion:]();
  }
  v8 = [(NDAnalyticsEnvelopeManager *)self uploadScheduler];
  [v8 handleLaunchEventForBackgroundSessionWithIdentifier:v6 completion:v7];
}

- (void)submitEnvelopes:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager submitEnvelopes:withCompletion:]();
  }
  v8 = [(NDAnalyticsEnvelopeManager *)self submissionQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke;
  v11[3] = &unk_264538738;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v11];
}

void __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = a2;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_2;
  v10[3] = &unk_264538710;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v4, "fc_splitArrayWithTest:result:", &__block_literal_global_37, v10);
  v5 = (id)*MEMORY[0x263F58EF0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(id)v18[5] count];
    uint64_t v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 134218240;
    uint64_t v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = v7;
    _os_log_impl(&dword_21FDD6000, v5, OS_LOG_TYPE_DEFAULT, "will submit %lu analytics envelopes and %lu telemetry envelopes", buf, 0x16u);
  }

  if ([(id)v18[5] count])
  {
    v8 = [*(id *)(a1 + 40) envelopeStore];
    [v8 copyEnvelopes:*(void *)(a1 + 32)];
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _scheduleUploadIfNeededWithCompletion:0];
  }
  if ([(id)v12[5] count]) {
    [*(id *)(a1 + 40) _uploadTelemetryEnvelopes:v12[5]];
  }
  v3[2](v3);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

BOOL __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_34(uint64_t a1, void *a2)
{
  return [a2 contentType] == 2;
}

void __61__NDAnalyticsEnvelopeManager_submitEnvelopes_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)uploadScheduler:(id)a3 performUploadWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke;
  aBlock[3] = &unk_264538788;
  id v7 = v5;
  id v26 = v7;
  aBlock[4] = self;
  id v8 = v6;
  id v25 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = [(NDAnalyticsEnvelopeManager *)self envelopeStore];
  id v23 = 0;
  id v11 = [v10 allEntriesWithHoldToken:&v23];
  id v12 = v23;
  if ([v11 count])
  {
    uint64_t v13 = [(NDAnalyticsEnvelopeManager *)self payloadAssembler];
    id v14 = [(NDAnalyticsEnvelopeManager *)self _lastUploadDatesByContentType];
    uint64_t v15 = [MEMORY[0x263EFFA08] setWithObject:&unk_26D195D78];
    [v10 sizesOfEnvelopesWithEntries:v11];
    id v19 = v8;
    id v16 = v7;
    v18 = id v17 = v12;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_46;
    v20[3] = &unk_264538828;
    v20[4] = self;
    id v21 = v10;
    id v22 = v9;
    [v13 assemblePayloadsWithEntries:v11 lastUploadDatesByContentType:v14 droppedEnvelopeReasonsToUpload:v15 envelopeSizeByEntry:v18 completion:v20];

    id v12 = v17;
    id v7 = v16;
    id v8 = v19;
  }
  else
  {
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
  }
}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke(uint64_t a1, int a2)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2;
    v5[3] = &unk_264538760;
    uint64_t v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 _scheduleUploadIfNeededWithCompletion:v5];
  }
}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_46(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1[4] _handleDroppedEnvelopesForLocalReasons:v8];
  [a1[5] deleteEnvelopesForEntries:v10];
  if (v9 || ![v7 count])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 1;
    id v11 = [a1[4] payloadUploader];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2_47;
    v16[3] = &unk_2645387B0;
    id v12 = a1[5];
    v16[4] = a1[4];
    id v17 = v12;
    v18 = v19;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_3;
    v13[3] = &unk_264538800;
    v13[4] = a1[4];
    id v14 = a1[6];
    uint64_t v15 = v19;
    [v11 uploadPayloadsForInfos:v7 withEnvelopeStore:v17 perPayloadCompletion:v16 completion:v13];

    _Block_object_dispose(v19, 8);
  }
}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_2_47(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7) {
    uint64_t v9 = objc_msgSend(v7, "fc_shouldRetry");
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [*(id *)(a1 + 32) _handleOutcomeOfUploadAttemptWithPayload:v13 success:v8 == 0 error:v8 willRetry:v9 hitEndpoint:a4];
  [*(id *)(a1 + 40) deleteEnvelopesForEntries:v10];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  *(unsigned char *)(v11 + 24) = v12;
}

void __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastUploadDatesByContentType];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_4;
  v5[3] = &unk_2645387D8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 saveWithCompletionHandler:v5];
}

uint64_t __74__NDAnalyticsEnvelopeManager_uploadScheduler_performUploadWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)uploadSchedulerDidDropScheduledBackgroundUpload:(id)a3
{
}

- (void)envelopeStore:(id)a3 didFlushEnvelopesForEntries:(id)a4
{
  NDAnalyticsEnvelopeSubmissionDatesByContentType(a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:v4 forReason:3 withError:0];
}

- (void)_scheduleUploadIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke;
  aBlock[3] = &unk_264538850;
  id v6 = v4;
  id v17 = v6;
  id v7 = v5;
  id v16 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = [(NDAnalyticsEnvelopeManager *)self envelopeStore];
  id v10 = [v9 allEntriesWithHoldToken:0];

  if ([v10 count])
  {
    uint64_t v11 = [(NDAnalyticsEnvelopeManager *)self payloadAssembler];
    BOOL v12 = [(NDAnalyticsEnvelopeManager *)self _lastUploadDatesByContentType];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke_2;
    v13[3] = &unk_264538878;
    v13[4] = self;
    id v14 = v8;
    [v11 determinePayloadDeliveryWindowForEntries:v10 withLastUploadDatesByContentType:v12 completion:v13];
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__NDAnalyticsEnvelopeManager__scheduleUploadIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) uploadScheduler];
    [v5 scheduleUploadInWindow:v6 withForegroundUploadCompletion:*(void *)(a1 + 40)];
  }
}

- (id)_lastUploadDatesByContentType
{
  id v3 = objc_opt_new();
  id v4 = [(NDAnalyticsEnvelopeManager *)self keyValueStoreLock];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke;
  uint64_t v11 = &unk_2645388A0;
  BOOL v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 performWithLockSync:&v8];

  id v6 = objc_msgSend(v5, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_55, v8, v9, v10, v11, v12);

  return v6;
}

void __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastUploadDatesByContentType];
  [v2 addAllEntriesToDictionary:*(void *)(a1 + 40)];
}

uint64_t __59__NDAnalyticsEnvelopeManager__lastUploadDatesByContentType__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];

  return [v2 numberWithInteger:v3];
}

- (id)_handleDroppedEnvelopesForLocalReasons:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager _handleDroppedEnvelopesForLocalReasons:]();
  }
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_59];
  id v4 = [v3 allValues];
  id v5 = objc_msgSend(v4, "fc_arrayByFlattening");

  return v5;
}

void __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  if (v5 == 2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (v5 == 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke_cold_1();
    }
    uint64_t v6 = 0;
  }
  id v7 = NDAnalyticsEnvelopeSubmissionDatesByContentType(v4);
  +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:v7 forReason:v6 withError:0];
}

- (id)_handleOutcomeOfUploadAttemptWithPayload:(id)a3 success:(BOOL)a4 error:(id)a5 willRetry:(BOOL)a6 hitEndpoint:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeManager _handleOutcomeOfUploadAttemptWithPayload:success:error:willRetry:hitEndpoint:]();
  }
  if (v7)
  {
    id v14 = [MEMORY[0x263EFF910] date];
    uint64_t v15 = [(NDAnalyticsEnvelopeManager *)self keyValueStoreLock];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke;
    v36[3] = &unk_264538930;
    id v37 = v12;
    v38 = self;
    id v39 = v14;
    id v16 = v14;
    [v15 performWithLockSync:v36];
  }
  id v17 = objc_opt_new();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_3;
  aBlock[3] = &unk_264538958;
  BOOL v34 = a4;
  id v18 = v17;
  BOOL v35 = a6;
  id v32 = v18;
  id v33 = v13;
  id v19 = v13;
  char v20 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v21 = [v12 entriesToUpload];
  id v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = MEMORY[0x263EFFA68];
  }
  v20[2](v20, v23);

  uint64_t v24 = [v12 droppedEntriesByReason];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4;
  v29[3] = &unk_264538980;
  uint64_t v30 = v20;
  id v25 = v20;
  [v24 enumerateKeysAndObjectsUsingBlock:v29];

  id v26 = v30;
  id v27 = v18;

  return v27;
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entriesToUpload];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_2;
  v4[3] = &unk_264538908;
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  [v2 enumerateObjectsUsingBlock:v4];
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v9 = [v3 lastUploadDatesByContentType];
  id v5 = NSNumber;
  uint64_t v6 = [v4 envelopeContentType];

  BOOL v7 = [v5 numberWithInt:v6];
  uint64_t v8 = [v7 stringValue];
  [v9 setObject:v2 forKeyedSubscript:v8];
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
    id v4 = NDAnalyticsEnvelopeSubmissionDatesByContentType(v5);
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:v4];
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    id v4 = NDAnalyticsEnvelopeContentTypesFromEntries(v3);
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:v4];
  }
  else
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
    id v4 = NDAnalyticsEnvelopeSubmissionDatesByContentType(v5);
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:v4 forReason:2 withError:*(void *)(a1 + 40)];
  }
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  if (v6 == 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_2();
    }
  }
  else if (v6 == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_1();
  }
}

- (void)_uploadTelemetryEnvelopes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = [(NDAnalyticsEnvelopeManager *)self telemetryUploader];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__NDAnalyticsEnvelopeManager__uploadTelemetryEnvelopes___block_invoke;
  v8[3] = &unk_264538760;
  id v9 = v5;
  id v7 = v5;
  [v6 uploadEnvelopes:v4 completion:v8];
}

- (OS_dispatch_queue)URLSessionQueue
{
  return self->_URLSessionQueue;
}

- (FCAsyncSerialQueue)submissionQueue
{
  return self->_submissionQueue;
}

- (void)setSubmissionQueue:(id)a3
{
}

- (NDAnalyticsEnvelopeStore)envelopeStore
{
  return self->_envelopeStore;
}

- (void)setEnvelopeStore:(id)a3
{
}

- (NDAnalyticsPayloadAssembler)payloadAssembler
{
  return self->_payloadAssembler;
}

- (void)setPayloadAssembler:(id)a3
{
}

- (NDAnalyticsPayloadUploader)payloadUploader
{
  return self->_payloadUploader;
}

- (void)setPayloadUploader:(id)a3
{
}

- (NDAnalyticsUploadScheduler)uploadScheduler
{
  return self->_uploadScheduler;
}

- (void)setUploadScheduler:(id)a3
{
}

- (FCKeyValueStore)lastUploadDatesByContentType
{
  return self->_lastUploadDatesByContentType;
}

- (void)setLastUploadDatesByContentType:(id)a3
{
}

- (NFMutexLock)keyValueStoreLock
{
  return self->_keyValueStoreLock;
}

- (void)setKeyValueStoreLock:(id)a3
{
}

- (NDAnalyticsTelemetryUploader)telemetryUploader
{
  return self->_telemetryUploader;
}

- (void)setTelemetryUploader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryUploader, 0);
  objc_storeStrong((id *)&self->_keyValueStoreLock, 0);
  objc_storeStrong((id *)&self->_lastUploadDatesByContentType, 0);
  objc_storeStrong((id *)&self->_uploadScheduler, 0);
  objc_storeStrong((id *)&self->_payloadUploader, 0);
  objc_storeStrong((id *)&self->_payloadAssembler, 0);
  objc_storeStrong((id *)&self->_envelopeStore, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);

  objc_storeStrong((id *)&self->_URLSessionQueue, 0);
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URLSessionQueue", v6, 2u);
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storeDirectoryFileURL", v6, 2u);
}

- (void)initWithAppConfigurationManager:telemetryUploader:storeDirectoryFileURL:URLSessionQueue:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigurationManager", v6, 2u);
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);
}

- (void)submitEnvelopes:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

- (void)_handleDroppedEnvelopesForLocalReasons:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"droppedEntriesByLocalReason", v6, 2u);
}

void __69__NDAnalyticsEnvelopeManager__handleDroppedEnvelopesForLocalReasons___block_invoke_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"oversized is not a local failure reason!"];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_handleOutcomeOfUploadAttemptWithPayload:success:error:willRetry:hitEndpoint:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"payloadInfo", v6, 2u);
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"missing config is a local failure reason!"];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void __107__NDAnalyticsEnvelopeManager__handleOutcomeOfUploadAttemptWithPayload_success_error_willRetry_hitEndpoint___block_invoke_4_cold_2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"sampled is a local failure reason!"];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end