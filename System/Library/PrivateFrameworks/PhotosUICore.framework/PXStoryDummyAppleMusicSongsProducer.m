@interface PXStoryDummyAppleMusicSongsProducer
- (PXStoryDummyAppleMusicSongsProducer)init;
- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)_queue_requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryDummyAppleMusicSongsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_assets, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)_queue_requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  v9 = (void (**)(id, PXStoryProducerResult *))a4;
  queue_assets = self->_queue_assets;
  if (!queue_assets) {
    PXMap();
  }
  v6 = PXAudioAssetFetchResultWithArray(queue_assets);
  v7 = [[PXStorySongsConfiguration alloc] initWithCuratedAudioAssets:v6];
  v8 = [[PXStoryProducerResult alloc] initWithObject:v7];
  v9[2](v9, v8);
}

PXAppleMusicAsset *__84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [PXAppleMusicAsset alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke_2;
  v7[3] = &unk_1E5DC0968;
  id v8 = v2;
  id v4 = v2;
  v5 = [(PXAppleMusicAsset *)v3 initWithConfiguration:v7];

  return v5;
}

uint64_t __84__PXStoryDummyAppleMusicSongsProducer__queue_requestSongsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValuesForKeysWithDictionary:*(void *)(a1 + 32)];
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PXStoryDummyAppleMusicSongsProducer_requestSongsWithOptions_resultHandler___block_invoke;
  v10[3] = &unk_1E5DC0920;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return 0;
}

void __77__PXStoryDummyAppleMusicSongsProducer_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestSongsWithOptions:resultHandler:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (PXStoryDummyAppleMusicSongsProducer)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDummyAppleMusicSongsProducer;
  if ([(PXStoryDummyAppleMusicSongsProducer *)&v3 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

@end