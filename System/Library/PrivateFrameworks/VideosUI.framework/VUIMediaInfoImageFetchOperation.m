@interface VUIMediaInfoImageFetchOperation
- (BOOL)imageLoadFinished;
- (NSError)error;
- (NSMutableArray)completionBlocks;
- (VUIImage)image;
- (VUIMediaInfo)mediaInfo;
- (VUIMediaInfoImageFetchOperation)initWithMediaInfo:(id)a3;
- (id)imageProxy;
- (void)addCompletion:(id)a3;
- (void)cancel;
- (void)executionDidBegin;
- (void)fetchImageWithCompletion:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setError:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageLoadFinished:(BOOL)a3;
- (void)setMediaInfo:(id)a3;
@end

@implementation VUIMediaInfoImageFetchOperation

- (VUIMediaInfoImageFetchOperation)initWithMediaInfo:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIMediaInfoImageFetchOperation;
  v5 = [(VUIMediaInfoImageFetchOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (VUIMediaInfo *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = (NSMutableArray *)v8;

    image = v5->_image;
    v5->_image = 0;

    error = v5->_error;
    v5->_error = 0;

    v5->_imageLoadFinished = 0;
  }

  return v5;
}

- (void)fetchImageWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void *, BOOL))a3;
  VUIRequireMainThread();
  if ([(VUIAsynchronousOperation *)self isFinished])
  {
    id v4 = [(VUIMediaInfoImageFetchOperation *)self image];
    v5 = [(VUIMediaInfoImageFetchOperation *)self error];
    v6[2](v6, v4, v5, [(VUIMediaInfoImageFetchOperation *)self imageLoadFinished]);
  }
  else
  {
    [(VUIMediaInfoImageFetchOperation *)self addCompletion:v6];
  }
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(VUIMediaInfoImageFetchOperation *)self completionBlocks];
    v5 = _Block_copy(v4);

    [v6 addObject:v5];
  }
}

- (id)imageProxy
{
  v2 = [(VUIMediaInfoImageFetchOperation *)self mediaInfo];
  v3 = [v2 imageProxies];
  id v4 = [v3 firstObject];

  return v4;
}

- (void)executionDidBegin
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke;
  aBlock[3] = &unk_1E6DFC7B8;
  objc_copyWeak(&v11, &location);
  v3 = _Block_copy(aBlock);
  id v4 = [(VUIMediaInfoImageFetchOperation *)self imageProxy];

  if (v4)
  {
    v5 = [(VUIMediaInfoImageFetchOperation *)self imageProxy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_3;
    v8[3] = &unk_1E6DF8498;
    id v9 = v3;
    [v5 setCompletionHandler:v8];

    id v6 = [(VUIMediaInfoImageFetchOperation *)self imageProxy];
    [v6 load];

    v7 = v9;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIMediaInfoImageFetchOperationErrorDomain" code:0 userInfo:0];
    (*((void (**)(void *, void, void *, void))v3 + 2))(v3, 0, v7, 0);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_2;
  v15 = &unk_1E6DF4A58;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  char v19 = a4;
  id v11 = &v12;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v12, v13)) {
    v14((uint64_t)v11);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }

  objc_destroyWeak(&v18);
}

void __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained imageProxy];
  [v3 setCompletionHandler:0];

  [WeakRetained setImage:*(void *)(a1 + 32)];
  [WeakRetained setError:*(void *)(a1 + 40)];
  [WeakRetained setImageLoadFinished:*(unsigned __int8 *)(a1 + 56)];
  [WeakRetained finishExecutionIfPossible];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(WeakRetained, "completionBlocks", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [WeakRetained image];
        id v11 = [WeakRetained error];
        (*(void (**)(uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v10, v11, [WeakRetained imageLoadFinished]);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [WeakRetained completionBlocks];
  [v12 removeAllObjects];
}

uint64_t __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaInfoImageFetchOperation;
  [(VUIMediaInfoImageFetchOperation *)&v4 cancel];
  v3 = [(VUIMediaInfoImageFetchOperation *)self imageProxy];
  [v3 cancel];
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (void)setMediaInfo:(id)a3
{
}

- (VUIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)imageLoadFinished
{
  return self->_imageLoadFinished;
}

- (void)setImageLoadFinished:(BOOL)a3
{
  self->_imageLoadFinished = a3;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

@end