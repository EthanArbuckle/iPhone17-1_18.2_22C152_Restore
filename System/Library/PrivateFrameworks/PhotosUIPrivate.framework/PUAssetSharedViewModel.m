@interface PUAssetSharedViewModel
- (BOOL)needsDeferredProcessing;
- (NSProgress)saveProgress;
- (PUAssetSharedViewModel)init;
- (PUAssetSharedViewModel)initWithAsset:(id)a3;
- (PUAssetSharedViewModelChange)currentChange;
- (PUDisplayAsset)asset;
- (PXOperationStatus)loadingStatus;
- (id)newViewModelChange;
- (int64_t)flippingFullSizeRenderState;
- (int64_t)saveState;
- (unsigned)deferredProcessingNeeded;
- (void)registerChangeObserver:(id)a3;
- (void)setAsset:(id)a3;
- (void)setDeferredProcessingNeeded:(unsigned __int16)a3;
- (void)setFlippingFullSizeRenderState:(int64_t)a3;
- (void)setLoadingStatus:(id)a3;
- (void)setNeedsDeferredProcessing:(BOOL)a3;
- (void)setSaveProgress:(id)a3;
- (void)setSaveState:(int64_t)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUAssetSharedViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveProgress, 0);
  objc_storeStrong((id *)&self->_loadingStatus, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (int64_t)flippingFullSizeRenderState
{
  return self->_flippingFullSizeRenderState;
}

- (unsigned)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (BOOL)needsDeferredProcessing
{
  return self->_needsDeferredProcessing;
}

- (int64_t)saveState
{
  return self->_saveState;
}

- (NSProgress)saveProgress
{
  return self->_saveProgress;
}

- (PXOperationStatus)loadingStatus
{
  return self->_loadingStatus;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setDeferredProcessingNeeded:(unsigned __int16)a3
{
  if (self->_deferredProcessingNeeded != a3)
  {
    self->_deferredProcessingNeeded = a3;
    id v3 = [(PUAssetSharedViewModel *)self currentChange];
    [v3 setDeferredProcessingNeededChanged:1];
  }
}

- (void)setNeedsDeferredProcessing:(BOOL)a3
{
  if (self->_needsDeferredProcessing != a3)
  {
    self->_needsDeferredProcessing = a3;
    id v3 = [(PUAssetSharedViewModel *)self currentChange];
    [v3 setNeedsDeferredProcessingChanged:1];
  }
}

- (void)setFlippingFullSizeRenderState:(int64_t)a3
{
  if (self->_flippingFullSizeRenderState != a3)
  {
    self->_flippingFullSizeRenderState = a3;
    id v3 = [(PUAssetSharedViewModel *)self currentChange];
    [v3 setFlippingFullSizeRenderStateChanged:1];
  }
}

- (void)setSaveState:(int64_t)a3
{
  if (self->_saveState != a3)
  {
    self->_saveState = a3;
    id v3 = [(PUAssetSharedViewModel *)self currentChange];
    [v3 setSaveStateChanged:1];
  }
}

- (void)setSaveProgress:(id)a3
{
  v5 = (NSProgress *)a3;
  if (self->_saveProgress != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_saveProgress, a3);
    v6 = [(PUAssetSharedViewModel *)self currentChange];
    [v6 setSaveProgressChanged:1];

    v5 = v7;
  }
}

- (void)setLoadingStatus:(id)a3
{
  v9 = (PXOperationStatus *)a3;
  v4 = self->_loadingStatus;
  v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(PXOperationStatus *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    v7 = (PXOperationStatus *)[(PXOperationStatus *)v9 copy];
    loadingStatus = self->_loadingStatus;
    self->_loadingStatus = v7;

    v5 = [(PUAssetSharedViewModel *)self currentChange];
    [v5 setLoadingStatusChanged:1];
  }

LABEL_5:
}

- (void)setAsset:(id)a3
{
  v5 = (PUDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [(PUDisplayAsset *)v8 needsDeferredProcessing];
    }
    else {
      uint64_t v6 = 0;
    }
    [(PUAssetSharedViewModel *)self setNeedsDeferredProcessing:v6];
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [(PUDisplayAsset *)v8 deferredProcessingNeeded];
    }
    else {
      uint64_t v7 = 0;
    }
    [(PUAssetSharedViewModel *)self setDeferredProcessingNeeded:v7];
    v5 = v8;
  }
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetSharedViewModel;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetSharedViewModel;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (PUAssetSharedViewModelChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetSharedViewModel;
  v2 = [(PUViewModel *)&v4 currentChange];
  return (PUAssetSharedViewModelChange *)v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUAssetSharedViewModelChange);
}

- (PUAssetSharedViewModel)initWithAsset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUAssetSharedViewModel.m", 43, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PUAssetSharedViewModel;
  uint64_t v7 = [(PUViewModel *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_asset, a3);
    if (objc_opt_respondsToSelector()) {
      char v9 = [v6 needsDeferredProcessing];
    }
    else {
      char v9 = 0;
    }
    v8->_needsDeferredProcessing = v9;
    if (objc_opt_respondsToSelector()) {
      unsigned __int16 v10 = [v6 deferredProcessingNeeded];
    }
    else {
      unsigned __int16 v10 = 0;
    }
    v8->_deferredProcessingNeeded = v10;
  }

  return v8;
}

- (PUAssetSharedViewModel)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAssetSharedViewModel.m", 39, @"%s is not available as initializer", "-[PUAssetSharedViewModel init]");

  abort();
}

@end