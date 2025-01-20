@interface PXFetchResultCountObserver
- (PHFetchResult)fetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXFetchResultCountObserver)init;
- (PXFetchResultCountObserver)initWithQOSClass:(unsigned int)a3 photoLibrary:(id)a4 fetchResultBlock:(id)a5;
- (PXFetchResultCountObserverDelegate)delegate;
- (int64_t)fetchResultCount;
- (void)_serialQueue_acquireFetchResultFromBlock:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchResult:(id)a3;
- (void)setFetchResultCount:(int64_t)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXFetchResultCountObserver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PXFetchResultCountObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFetchResultCountObserverDelegate *)WeakRetained;
}

- (void)setFetchResult:(id)a3
{
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (int64_t)fetchResultCount
{
  return self->_fetchResultCount;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__169022;
  v22 = __Block_byref_object_dispose__169023;
  id v23 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(serialQueue, block);
  if (v19[5])
  {
    v6 = objc_msgSend(v4, "changeDetailsForFetchResult:");
    v7 = v6;
    if (v6)
    {
      v8 = [v6 fetchResultAfterChanges];
      v9 = self->_serialQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_2;
      v15[3] = &unk_1E5DD32A8;
      v15[4] = self;
      id v10 = v8;
      id v16 = v10;
      dispatch_sync(v9, v15);
      v11 = (void *)[v10 count];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_3;
      v12[3] = &unk_1E5DD0260;
      objc_copyWeak(v13, &location);
      v13[1] = v11;
      dispatch_async(MEMORY[0x1E4F14428], v12);
      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
  _Block_object_dispose(&v18, 8);
}

void __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchResult];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFetchResult:*(void *)(a1 + 40)];
}

void __52__PXFetchResultCountObserver_photoLibraryDidChange___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFetchResultCount:v1];
}

- (void)setFetchResultCount:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_fetchResultCount != a3)
  {
    self->_fetchResultCount = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained fetchResultCountObserver:self didChangeFetchResultCount:a3];
  }
}

- (void)_serialQueue_acquireFetchResultFromBlock:(id)a3
{
  serialQueue = self->_serialQueue;
  v6 = (void (**)(void))a3;
  dispatch_assert_queue_V2(serialQueue);
  v7 = v6[2](v6);

  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXFetchResultCountObserver.m", 62, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  [(PXFetchResultCountObserver *)self setFetchResult:v7];
  v8 = [v7 photoLibrary];
  v9 = [v8 photoLibraryURL];
  id v10 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXFetchResultCountObserver.m", 66, @"Invalid parameter not satisfying: %@", @"[photoLibrary.photoLibraryURL isEqual:_photoLibrary.photoLibraryURL]" object file lineNumber description];
  }
  v12 = (void *)[v7 count];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PXFetchResultCountObserver__serialQueue_acquireFetchResultFromBlock___block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v16, &location);
  v16[1] = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __71__PXFetchResultCountObserver__serialQueue_acquireFetchResultFromBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFetchResultCount:v1];
}

- (PXFetchResultCountObserver)initWithQOSClass:(unsigned int)a3 photoLibrary:(id)a4 fetchResultBlock:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXFetchResultCountObserver.m", 34, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXFetchResultCountObserver.m", 35, @"Invalid parameter not satisfying: %@", @"fetchResultBlock" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)PXFetchResultCountObserver;
  v13 = [(PXFetchResultCountObserver *)&v27 init];
  v14 = v13;
  if (v13)
  {
    v13->_fetchResultCount = -1;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v16 = dispatch_queue_attr_make_with_qos_class(v15, (dispatch_qos_class_t)a3, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.PXFetchResultCountObserver", v16);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_photoLibrary, a4);
    [(PHPhotoLibrary *)v14->_photoLibrary registerChangeObserver:v14];
    objc_initWeak(&location, v14);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXFetchResultCountObserver_initWithQOSClass_photoLibrary_fetchResultBlock___block_invoke;
    block[3] = &unk_1E5DD1848;
    objc_copyWeak(&v25, &location);
    id v24 = v12;
    dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
    dispatch_async((dispatch_queue_t)v14->_serialQueue, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __77__PXFetchResultCountObserver_initWithQOSClass_photoLibrary_fetchResultBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_serialQueue_acquireFetchResultFromBlock:", *(void *)(a1 + 32));
}

- (PXFetchResultCountObserver)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFetchResultCountObserver.m", 30, @"%s is not available as initializer", "-[PXFetchResultCountObserver init]");

  abort();
}

@end