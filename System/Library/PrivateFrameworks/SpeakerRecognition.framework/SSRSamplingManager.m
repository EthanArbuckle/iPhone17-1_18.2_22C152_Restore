@interface SSRSamplingManager
+ (id)sharedManager;
- (OS_dispatch_queue)queue;
- (SSRSamplingManager)init;
- (id)getDonationDataWithEnrollmentId:(id)a3 error:(id *)a4;
- (id)getDonationIdsWithEnrollmentId:(id)a3 error:(id *)a4;
- (id)getEnrollmentDateWithLocale:(id)a3 error:(id *)a4;
- (id)getEnrollmentIdWithLocale:(id)a3 error:(id *)a4;
- (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4;
- (void)setQueue:(id)a3;
@end

@implementation SSRSamplingManager

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)getDonationDataWithEnrollmentId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7329;
  v25 = __Block_byref_object_dispose__7330;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7329;
  v19 = __Block_byref_object_dispose__7330;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SSRSamplingManager_getDonationDataWithEnrollmentId_error___block_invoke;
  block[3] = &unk_26442A100;
  v13 = &v21;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __60__SSRSamplingManager_getDonationDataWithEnrollmentId_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[SSREnrollmentSamplingMetaDataHelper getDonationDataWithEnrollmentId:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)getDonationIdsWithEnrollmentId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7329;
  v25 = __Block_byref_object_dispose__7330;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7329;
  v19 = __Block_byref_object_dispose__7330;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SSRSamplingManager_getDonationIdsWithEnrollmentId_error___block_invoke;
  block[3] = &unk_26442A100;
  v13 = &v21;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __59__SSRSamplingManager_getDonationIdsWithEnrollmentId_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[SSREnrollmentSamplingMetaDataHelper getDonationIdsWithEnrollmentId:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7329;
  v19 = __Block_byref_object_dispose__7330;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SSRSamplingManager_getEnrollmentSelectionStatusWithLocale_error___block_invoke;
  block[3] = &unk_26442A100;
  v13 = &v21;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  unint64_t v9 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __67__SSRSamplingManager_getEnrollmentSelectionStatusWithLocale_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  unint64_t v4 = +[SSREnrollmentSamplingMetaDataHelper getEnrollmentSelectionStatusWithLocale:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (id)getEnrollmentIdWithLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7329;
  v25 = __Block_byref_object_dispose__7330;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7329;
  v19 = __Block_byref_object_dispose__7330;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SSRSamplingManager_getEnrollmentIdWithLocale_error___block_invoke;
  block[3] = &unk_26442A100;
  v13 = &v21;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __54__SSRSamplingManager_getEnrollmentIdWithLocale_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[SSREnrollmentSamplingMetaDataHelper getEnrollmentIdWithLocale:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)getEnrollmentDateWithLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7329;
  v25 = __Block_byref_object_dispose__7330;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7329;
  v19 = __Block_byref_object_dispose__7330;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SSRSamplingManager_getEnrollmentDateWithLocale_error___block_invoke;
  block[3] = &unk_26442A100;
  v13 = &v21;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __56__SSRSamplingManager_getEnrollmentDateWithLocale_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[SSREnrollmentSamplingMetaDataHelper getEnrollmentDateWithLocale:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (SSRSamplingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSRSamplingManager;
  uint64_t v2 = [(SSRSamplingManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespeech.SSRSamplingManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7339);
  }
  uint64_t v2 = (void *)sharedManager_enrollmentSamplingManager;

  return v2;
}

uint64_t __35__SSRSamplingManager_sharedManager__block_invoke()
{
  sharedManager_enrollmentSamplingManager = objc_alloc_init(SSRSamplingManager);

  return MEMORY[0x270F9A758]();
}

@end