@interface ISPlayerItemChef
+ (ISPlayerItemChef)defaultChef;
- (ISPlayerItemChef)init;
- (NSMutableDictionary)_operationsByRequestID;
- (NSOperationQueue)_operationQueue;
- (OS_dispatch_queue)_isolationQueue;
- (int64_t)_currentRequestID;
- (int64_t)prepareIrisPlayerItemWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeVideo:(BOOL)a6 includeAudio:(BOOL)a7 completion:(id)a8;
- (int64_t)prepareIrisVideoWithAsset:(id)a3 photoTime:(id *)a4 trimmedTimeRange:(id *)a5 completion:(id)a6;
- (void)_setCurrentRequestID:(int64_t)a3;
- (void)cancelPreparationOfIrisAssetWithRequestID:(int64_t)a3;
@end

@implementation ISPlayerItemChef

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__operationsByRequestID, 0);
  objc_storeStrong((id *)&self->__isolationQueue, 0);

  objc_storeStrong((id *)&self->__operationQueue, 0);
}

- (void)_setCurrentRequestID:(int64_t)a3
{
  self->__currentRequestID = a3;
}

- (int64_t)_currentRequestID
{
  return self->__currentRequestID;
}

- (NSMutableDictionary)_operationsByRequestID
{
  return self->__operationsByRequestID;
}

- (OS_dispatch_queue)_isolationQueue
{
  return self->__isolationQueue;
}

- (NSOperationQueue)_operationQueue
{
  return self->__operationQueue;
}

- (void)cancelPreparationOfIrisAssetWithRequestID:(int64_t)a3
{
  v5 = [(ISPlayerItemChef *)self _operationsByRequestID];
  v6 = [(ISPlayerItemChef *)self _isolationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ISPlayerItemChef_cancelPreparationOfIrisAssetWithRequestID___block_invoke;
  v8[3] = &unk_1E6BECFC0;
  id v9 = v5;
  int64_t v10 = a3;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __62__ISPlayerItemChef_cancelPreparationOfIrisAssetWithRequestID___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v6 = [v2 objectForKey:v3];

  [v6 cancel];
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v4 removeObjectForKey:v5];
}

- (int64_t)prepareIrisPlayerItemWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeVideo:(BOOL)a6 includeAudio:(BOOL)a7 completion:(id)a8
{
  BOOL v28 = a7;
  BOOL v8 = a6;
  id v13 = a8;
  id v14 = a3;
  int64_t v15 = [(ISPlayerItemChef *)self _currentRequestID] + 1;
  [(ISPlayerItemChef *)self _setCurrentRequestID:v15];
  v16 = [(ISPlayerItemChef *)self _isolationQueue];
  v17 = [(ISPlayerItemChef *)self _operationsByRequestID];
  v18 = [_ISPlayerItemChefOperation alloc];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke;
  v35[3] = &unk_1E6BECAC0;
  id v36 = v16;
  id v19 = v17;
  id v38 = v13;
  int64_t v39 = v15;
  id v37 = v19;
  long long v20 = *(_OWORD *)&a4->var0.var3;
  v34[0] = *(_OWORD *)&a4->var0.var0;
  v34[1] = v20;
  v34[2] = *(_OWORD *)&a4->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v33 = *a5;
  id v21 = v13;
  v22 = v16;
  v23 = [(_ISPlayerItemChefOperation *)v18 initWithAsset:v14 trimmedTimeRange:v34 photoTime:&v33 includeAudio:v28 includeVideo:v8 resultHandler:v35];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_3;
  block[3] = &unk_1E6BECAE8;
  id v30 = v19;
  v31 = v23;
  int64_t v32 = v15;
  v24 = v23;
  id v25 = v19;
  dispatch_async(v22, block);
  v26 = [(ISPlayerItemChef *)self _operationQueue];
  [v26 addOperation:v24];

  return v15;
}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, long long *a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_2;
  block[3] = &unk_1E6BECFC0;
  v11 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v19 = v12;
  uint64_t v20 = v13;
  dispatch_async(v11, block);
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    int64_t v15 = *(void (**)(uint64_t, uint64_t, id, long long *, id))(v14 + 16);
    long long v16 = *a4;
    uint64_t v17 = *((void *)a4 + 2);
    v15(v14, a2, v9, &v16, v10);
  }
}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_3(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  id v3 = [NSNumber numberWithInteger:a1[6]];
  [v1 setObject:v2 forKey:v3];
}

void __115__ISPlayerItemChef_prepareIrisPlayerItemWithAsset_trimmedTimeRange_photoTime_includeVideo_includeAudio_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v1 removeObjectForKey:v2];
}

- (int64_t)prepareIrisVideoWithAsset:(id)a3 photoTime:(id *)a4 trimmedTimeRange:(id *)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = +[ISPlayerSettings sharedInstance];
  uint64_t v13 = [v12 audioEnabled];
  long long v14 = *(_OWORD *)&a5->var0.var3;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  int64_t v15 = [(ISPlayerItemChef *)self prepareIrisPlayerItemWithAsset:v11 trimmedTimeRange:v18 photoTime:&v17 includeVideo:1 includeAudio:v13 completion:v10];

  return v15;
}

- (ISPlayerItemChef)init
{
  v10.receiver = self;
  v10.super_class = (Class)ISPlayerItemChef;
  id v2 = [(ISPlayerItemChef *)&v10 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->__operationQueue;
    v2->__operationQueue = v3;

    [(NSOperationQueue *)v2->__operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->__operationQueue setQualityOfService:25];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.irisassetisolation", 0);
    isolationQueue = v2->__isolationQueue;
    v2->__isolationQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    operationsByRequestID = v2->__operationsByRequestID;
    v2->__operationsByRequestID = v7;
  }
  return v2;
}

+ (ISPlayerItemChef)defaultChef
{
  if (defaultChef_onceToken != -1) {
    dispatch_once(&defaultChef_onceToken, &__block_literal_global_2030);
  }
  id v2 = (void *)defaultChef_defaultChef;

  return (ISPlayerItemChef *)v2;
}

uint64_t __31__ISPlayerItemChef_defaultChef__block_invoke()
{
  v0 = objc_alloc_init(ISPlayerItemChef);
  uint64_t v1 = defaultChef_defaultChef;
  defaultChef_defaultChef = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end