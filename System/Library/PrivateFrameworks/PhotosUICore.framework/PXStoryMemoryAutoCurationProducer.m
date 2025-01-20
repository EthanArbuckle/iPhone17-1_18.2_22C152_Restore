@interface PXStoryMemoryAutoCurationProducer
+ (id)_optionsForAssets:(id)a3;
- (OS_dispatch_queue)workQueue;
- (PHMemory)memory;
- (PXStoryMemoryAutoCurationProducer)init;
- (PXStoryMemoryAutoCurationProducer)initWithMemory:(id)a3;
- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5;
- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6;
@end

@implementation PXStoryMemoryAutoCurationProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_curationCache, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  v7 = (void (**)(id, PXStoryProducerResult *))a5;
  v8 = [(PXStoryMemoryAutoCurationProducer *)self memory];
  v9 = [MEMORY[0x1E4F29238] valueWithBytes:a4 objCType:"{?=q{?={?=qiIq}{?=qiIq}{?=qiIq}}}"];
  v10 = [(NSCache *)self->_curationCache objectForKey:v9];
  if (v10)
  {
    v11 = [[PXStoryProducerResult alloc] initWithObject:v10];
    v7[2](v7, v11);

    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__PXStoryMemoryAutoCurationProducer_requestCuratedAssetsWithOptions_targetOverallDurationInfo_resultHandler___block_invoke;
    v17[3] = &unk_1E5DBABF8;
    long long v13 = *(_OWORD *)&a4->var1.var1.var3;
    long long v24 = *(_OWORD *)&a4->var1.var1.var0;
    long long v25 = v13;
    long long v26 = *(_OWORD *)&a4->var1.var2.var1;
    long long v14 = *(_OWORD *)&a4->var1.var0.var1;
    long long v22 = *(_OWORD *)&a4->var0;
    long long v23 = v14;
    id v18 = v8;
    v19 = self;
    id v20 = v9;
    v21 = v7;
    v15 = _Block_copy(v17);
    dispatch_async((dispatch_queue_t)self->_workQueue, v15);
  }
  return v12;
}

void __109__PXStoryMemoryAutoCurationProducer_requestCuratedAssetsWithOptions_targetOverallDurationInfo_resultHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 64) == 2)
  {
    CMTime time1 = *(CMTime *)(a1 + 96);
    CMTime time2 = *(CMTime *)(MEMORY[0x1E4F8D280] + 24);
    if (CMTimeCompare(&time1, &time2))
    {
      uint64_t v29 = *MEMORY[0x1E4F39790];
      CMTime time1 = *(CMTime *)(a1 + 96);
      v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time1)];
      v30[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    }
    else
    {
      uint64_t v18 = PXStoryErrorCreateWithCodeDebugFormat(16, @"Must specify a valid preferredDuration with PFStoryOverallDurationKindCustom", v2, v3, v4, v5, v6, v7, v24);
      v9 = (void *)MEMORY[0x1E4F1CC08];
      if (v18)
      {
        v15 = (void *)v18;
        v12 = 0;
        goto LABEL_22;
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v10 = PHMemoryCurationLengthFromPFStoryOverallDurationKind(*(void *)(a1 + 64));
  v11 = *(void **)(a1 + 32);
  id v25 = 0;
  v12 = [v11 fetchAssetsWithCurationOfLength:v10 options:v9 error:&v25];
  id v13 = v25;
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  if (v14)
  {
    v15 = v13;
    v16 = PLStoryGetLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v10;
        LOWORD(time1.flags) = 2112;
        *(void *)((char *)&time1.flags + 2) = v15;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Received error response when attempting to fetch assets with a curation length of: %lu. %@", (uint8_t *)&time1, 0x16u);
      }

      goto LABEL_22;
    }
    if (v17)
    {
      LODWORD(time1.value) = 134217984;
      *(CMTimeValue *)((char *)&time1.value + 4) = v10;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Received nil response when attempting to fetch assets with a curation of length of: %lu", (uint8_t *)&time1, 0xCu);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v12 forKey:*(void *)(a1 + 48)];
  }
  if ([v12 count])
  {
    v19 = [[PXStoryProducerResult alloc] initWithObject:v12];
    v15 = 0;
    goto LABEL_25;
  }
  v15 = 0;
LABEL_22:
  id v20 = PLStoryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    CMTimeValue v21 = *(void *)(a1 + 40);
    LODWORD(time1.value) = 138412802;
    *(CMTimeValue *)((char *)&time1.value + 4) = v21;
    LOWORD(time1.flags) = 2112;
    *(void *)((char *)&time1.flags + 2) = v15;
    HIWORD(time1.epoch) = 2112;
    uint64_t v28 = v22;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%@: curationOfLength returned error: %@ memory:%@", (uint8_t *)&time1, 0x20u);
  }

  long long v23 = [[PXStoryProducerResult alloc] initWithObject:0];
  v19 = [(PXStoryProducerResult *)v23 error:v15];

LABEL_25:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(PXStoryMemoryAutoCurationProducer *)self memory];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DD2BB8;
  id v29 = v12;
  id v30 = v9;
  id v31 = v10;
  id v32 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v12;
  BOOL v17 = _Block_copy(aBlock);
  uint64_t v18 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  v19 = [(PXStoryMemoryAutoCurationProducer *)self workQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke_2;
  v25[3] = &unk_1E5DD3280;
  id v20 = v18;
  id v26 = v20;
  v27 = v17;
  id v21 = v17;
  dispatch_async(v19, v25);

  uint64_t v22 = v27;
  id v23 = v20;

  return v23;
}

void __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) photosGraphVersion];
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() > 0x300)
  {
    uint64_t v2 = +[PXStoryMemoryAutoCurationProducer _optionsForAssets:*(void *)(a1 + 40)];
    uint64_t v3 = +[PXStoryMemoryAutoCurationProducer _optionsForAssets:*(void *)(a1 + 48)];
    v8 = -[PXStoryCurationLengthInfo initWithAvailableLengths:defaultLength:]([PXStoryCurationLengthInfo alloc], "initWithAvailableLengths:defaultLength:", [*(id *)(a1 + 32) availableCurationLengthsWithOptions:v2], objc_msgSend(*(id *)(a1 + 32), "currentCurationLengthWithOptions:", v3));
  }
  else
  {
    v8 = [[PXStoryCurationLengthInfo alloc] initWithAvailableLengths:0 defaultLength:0];
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [[PXStoryProducerResult alloc] initWithObject:v8];
  uint64_t v6 = [(PXStoryProducerResult *)v5 flags:0];
  uint64_t v7 = [v6 error:0];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
}

uint64_t __109__PXStoryMemoryAutoCurationProducer_requestCurationLengthsWithOptions_allAssets_curatedAssets_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PXStoryMemoryAutoCurationProducer)initWithMemory:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryMemoryAutoCurationProducer;
  uint64_t v6 = [(PXStoryMemoryAutoCurationProducer *)&v18 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memory, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

    id v15 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    curationCache = v7->_curationCache;
    v7->_curationCache = v15;
  }
  return v7;
}

- (PXStoryMemoryAutoCurationProducer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryAutoCurationProducer.m", 31, @"%s is not available as initializer", "-[PXStoryMemoryAutoCurationProducer init]");

  abort();
}

+ (id)_optionsForAssets:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 countOfAssetsWithMediaType:1];
  uint64_t v5 = [v3 countOfAssetsWithMediaType:2];

  v10[0] = *MEMORY[0x1E4F39780];
  uint64_t v6 = [NSNumber numberWithInteger:v4];
  v11[0] = v6;
  v10[1] = *MEMORY[0x1E4F39788];
  uint64_t v7 = [NSNumber numberWithInteger:v5];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

@end