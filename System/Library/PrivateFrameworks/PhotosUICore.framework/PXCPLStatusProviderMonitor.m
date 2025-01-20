@interface PXCPLStatusProviderMonitor
- (PHPhotoLibrary)photoLibrary;
- (PXCPLStatusProvider)statusProvider;
- (PXCPLStatusProviderMonitor)init;
- (PXCPLStatusProviderMonitor)initWithPhotoLibrary:(id)a3;
- (void)_updateStatusProvider;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatusProvider:(id)a3;
@end

@implementation PXCPLStatusProviderMonitor

- (PXCPLStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (PXCPLStatusProviderMonitor)initWithPhotoLibrary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXCPLStatusProviderMonitor.m", 39, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXCPLStatusProviderMonitor;
  v7 = [(PXCPLStatusProviderMonitor *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v9 = [[PXCPLPhotoLibrarySource alloc] initWithPhotoLibrary:v6];
    photoLibrarySource = v8->_photoLibrarySource;
    v8->_photoLibrarySource = v9;

    [(PXCPLPhotoLibrarySource *)v8->_photoLibrarySource registerChangeObserver:v8 context:PXCPLPhotoLibrarySourceObservationContext_167020];
    uint64_t v11 = _CreateStatusProviderIfNecessary(v8->_photoLibrarySource, 0);
    statusProvider = v8->_statusProvider;
    v8->_statusProvider = (PXCPLStatusProvider *)v11;

    v13 = PLUserStatusGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v8->_statusProvider;
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Initial status provider: %{public}@", buf, 0x16u);
    }

    v15 = PXSharedUserDefaults();
    [v15 addObserver:v8 forKeyPath:@"CPLStatusProviderMock" options:0 context:&PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXCPLPhotoLibrarySourceObservationContext_167020 == a5) {
    [(PXCPLStatusProviderMonitor *)self _updateStatusProvider];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXCPLStatusProviderMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLStatusProviderMonitor;
    -[PXCPLStatusProviderMonitor observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __77__PXCPLStatusProviderMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusProvider];
}

- (void)_updateStatusProvider
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXCPLStatusProviderMonitor__updateStatusProvider__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXCPLStatusProviderMonitor *)self performChanges:v3];
}

void __51__PXCPLStatusProviderMonitor__updateStatusProvider__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _CreateStatusProviderIfNecessary(*(void **)(*(void *)(a1 + 32) + 96), *(void **)(*(void *)(a1 + 32) + 112));
  [*(id *)(a1 + 32) setStatusProvider:v2];
  if ([*(id *)(a1 + 32) currentChanges])
  {
    v3 = PLUserStatusGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543618;
      uint64_t v6 = v4;
      __int16 v7 = 2114;
      v8 = v2;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ New status provider: %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)setStatusProvider:(id)a3
{
  v8 = (PXCPLStatusProvider *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v5 = self->_statusProvider;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PXCPLStatusProvider *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_statusProvider, a3);
      [(PXCPLStatusProviderMonitor *)self signalChange:1];
    }
  }
}

- (void)dealloc
{
  v3 = PXSharedUserDefaults();
  [v3 removeObserver:self forKeyPath:@"CPLStatusProviderMock" context:&PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext];

  v4.receiver = self;
  v4.super_class = (Class)PXCPLStatusProviderMonitor;
  [(PXCPLStatusProviderMonitor *)&v4 dealloc];
}

- (PXCPLStatusProviderMonitor)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLStatusProviderMonitor.m", 35, @"%s is not available as initializer", "-[PXCPLStatusProviderMonitor init]");

  abort();
}

@end