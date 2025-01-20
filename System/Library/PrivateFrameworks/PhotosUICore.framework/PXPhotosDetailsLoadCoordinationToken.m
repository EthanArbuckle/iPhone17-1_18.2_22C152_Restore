@interface PXPhotosDetailsLoadCoordinationToken
- (PXPhotosDetailsLoadCoordinationToken)init;
- (PXPhotosDetailsLoadCoordinator)_loadCoordinator;
- (id)_initWithLoadCoordinator:(id)a3;
- (void)_timeout;
- (void)complete;
- (void)dealloc;
@end

@implementation PXPhotosDetailsLoadCoordinationToken

- (void).cxx_destruct
{
}

- (PXPhotosDetailsLoadCoordinator)_loadCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__loadCoordinator);
  return (PXPhotosDetailsLoadCoordinator *)WeakRetained;
}

- (void)_timeout
{
  if (!self->_didComplete)
  {
    v3 = PLRelatedGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Photos details load coordination token did timeout. Related fetches might be unnecessarily delayed.", v4, 2u);
    }

    [(PXPhotosDetailsLoadCoordinationToken *)self complete];
  }
}

- (void)complete
{
  if (!self->_didComplete)
  {
    self->_didComplete = 1;
    id v3 = [(PXPhotosDetailsLoadCoordinationToken *)self _loadCoordinator];
    [v3 _tokenDidComplete:self];
  }
}

- (void)dealloc
{
  if (!self->_didComplete)
  {
    self->_didComplete = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->__loadCoordinator);
    [WeakRetained _tokenDidComplete:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosDetailsLoadCoordinationToken;
  [(PXPhotosDetailsLoadCoordinationToken *)&v4 dealloc];
}

- (id)_initWithLoadCoordinator:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsLoadCoordinationToken;
  v5 = [(PXPhotosDetailsLoadCoordinationToken *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__loadCoordinator, v4);
    objc_initWeak(&location, v6);
    [v4 timeoutDelay];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PXPhotosDetailsLoadCoordinationToken__initWithLoadCoordinator___block_invoke;
    v10[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v11, &location);
    dispatch_after(v8, MEMORY[0x1E4F14428], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __65__PXPhotosDetailsLoadCoordinationToken__initWithLoadCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timeout];
}

- (PXPhotosDetailsLoadCoordinationToken)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsLoadCoordinator.m", 130, @"%s is not available as initializer", "-[PXPhotosDetailsLoadCoordinationToken init]");

  abort();
}

@end