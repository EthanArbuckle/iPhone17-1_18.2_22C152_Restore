@interface PXCollectionFetchOperation
+ (id)fetchOperationWithCollection:(id)a3 delegate:(id)a4;
- (PHCollection)collection;
- (PHFetchOptions)fetchOptions;
- (PHFetchResult)outputFetchResult;
- (PXCollectionFetchOperation)init;
- (PXCollectionFetchOperation)initWithCollection:(id)a3;
- (PXCollectionFetchOperationDelegate)delegate;
- (void)handleBegin;
- (void)handleFinish;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setFetchOptions:(id)a3;
- (void)setOutputFetchResult:(id)a3;
@end

@implementation PXCollectionFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFetchResult, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setOutputFetchResult:(id)a3
{
}

- (PHFetchResult)outputFetchResult
{
  return self->_outputFetchResult;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (void)setFetchOptions:(id)a3
{
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (PXCollectionFetchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCollectionFetchOperationDelegate *)WeakRetained;
}

- (void)handleFinish
{
  if ([(PXCollectionFetchOperation *)self isCancelled])
  {
    v3 = v6;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v4 = __42__PXCollectionFetchOperation_handleFinish__block_invoke;
  }
  else
  {
    v3 = v5;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v4 = __42__PXCollectionFetchOperation_handleFinish__block_invoke_2;
  }
  v3[2] = v4;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __42__PXCollectionFetchOperation_handleFinish__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 collectionFetchOperationDidCancel:*(void *)(a1 + 32)];
  }
}

void __42__PXCollectionFetchOperation_handleFinish__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 collectionFetchOperationDidComplete:*(void *)(a1 + 32)];
  }
}

- (void)handleBegin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXCollectionFetchOperation_handleBegin__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__PXCollectionFetchOperation_handleBegin__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 collectionFetchOperationDidBegin:*(void *)(a1 + 32)];
  }
}

- (void)main
{
  [(PXCollectionFetchOperation *)self handleBegin];
  fetchOptions = self->_fetchOptions;
  if (fetchOptions)
  {
    v9 = fetchOptions;
  }
  else
  {
    v4 = [(PXCollectionFetchOperation *)self collection];
    v5 = [v4 photoLibrary];
    objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
    v9 = (PHFetchOptions *)objc_claimAutoreleasedReturnValue();
  }
  if (([(PXCollectionFetchOperation *)self isCancelled] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (([(PXCollectionFetchOperation *)self isCancelled] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v8 = 0;
    }
    else
    {
      v8 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:self->_collection options:0];
    }
  }
  else
  {
    v6 = self->_collection;
    if ([(PHCollection *)v6 assetCollectionType] == 2
      && [(PHCollection *)v6 assetCollectionSubtype] == 1000000205)
    {
      v7 = [NSString stringWithFormat:@"PXCollectionFetchOperation PHAssetCollection All Photos"];
      [(PHFetchOptions *)v9 setImportantFetchName:v7];
    }
    v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v9];
  }
  [(PXCollectionFetchOperation *)self setOutputFetchResult:v8];
  [(PXCollectionFetchOperation *)self handleFinish];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (PXCollectionFetchOperation)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCollectionFetchOperation.m", 39, @"%s is not available as initializer", "-[PXCollectionFetchOperation init]");

  abort();
}

- (PXCollectionFetchOperation)initWithCollection:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXCollectionFetchOperation;
  v7 = [(PXCollectionFetchOperation *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PXCollectionFetchOperation.m", 31, @"Invalid parameter not satisfying: %@", @"collection" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_collection, a3);
  }

  return v7;
}

+ (id)fetchOperationWithCollection:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithCollection:v7];

  [v8 setDelegate:v6];
  return v8;
}

@end