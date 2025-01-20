@interface PXFlexMusicCueProvider
- (PXFlexMusicCueProvider)init;
- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4;
- (void)_deliverCuesIfNeeded;
- (void)_fetchCuesForAudioAsset:(id)a3 resultHandler:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXFlexMusicCueProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_deliverCuesIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  requests = self->_requests;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXFlexMusicCueProvider__deliverCuesIfNeeded__block_invoke;
  v6[3] = &unk_1E5DC3DE8;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableArray *)requests enumerateObjectsUsingBlock:v6];
  [(NSMutableArray *)self->_requests removeObjectsAtIndexes:v5];
}

void __46__PXFlexMusicCueProvider__deliverCuesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = +[PXFlexMusicLibrary sharedLibrary];
  v6 = [v9 asset];
  id v7 = [v5 cuesForAsset:v6];

  if (([v7 isEmpty] & 1) == 0)
  {
    v8 = [v9 resultHandler];
    ((void (**)(void, void *, void))v8)[2](v8, v7, 0);

    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)_fetchCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v12 = a3;
  queue = self->_queue;
  id v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2(queue);
  if ([(PXFlexMusicLibrary *)self->_library hasLocalResourceForAsset:v12 resourceType:2])
  {
    v8 = +[PXFlexMusicLibrary sharedLibrary];
    id v9 = [v8 cuesForAsset:v12];

    v7[2](v7, v9, 0);
  }
  else
  {
    requests = self->_requests;
    v11 = [[_PXFlexMusicCueRequest alloc] initWithAsset:v12 resultHandler:v7];

    [(NSMutableArray *)requests addObject:v11];
    [(PXFlexMusicLibrary *)self->_library requestDownloadForAsset:v12 resourceType:2];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 2) != 0 && (void *)LibraryContext_196773 == a5)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PXFlexMusicCueProvider_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __55__PXFlexMusicCueProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverCuesIfNeeded];
}

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXFlexMusicCueProvider requestCuesForAudioAsset:resultHandler:]"];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v13 handleFailureInFunction:v14, @"PXFlexMusicCueProvider.m", 52, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"asset", v16, v17 file lineNumber description];
    }
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXFlexMusicCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke;
  block[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v21, &location);
  id v19 = v8;
  id v20 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return 0;
}

void __65__PXFlexMusicCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _fetchCuesForAudioAsset:*(void *)(a1 + 32) resultHandler:*(void *)(a1 + 40)];
}

- (PXFlexMusicCueProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXFlexMusicCueProvider;
  if ([(PXFlexMusicCueProvider *)&v3 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

uint64_t __30__PXFlexMusicCueProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PXFlexMusicLibrary sharedLibrary];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  return objc_msgSend(v5, "registerChangeObserver:context:");
}

@end