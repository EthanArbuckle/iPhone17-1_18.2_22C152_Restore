@interface PUPXAssetsDataSourceManager
- (PUPXAssetsDataSourceManager)init;
- (PUPXAssetsDataSourceManager)initWithUnderlyingDataSourceManager:(id)a3;
- (PXAssetsDataSourceManager)underlyingDataSourceManager;
- (id)photosDataSource;
- (int64_t)_currentUpdateID;
- (void)_handleScheduledUpdateWithID:(int64_t)a3;
- (void)_scheduleUpdate;
- (void)_setCurrentUpdateId:(int64_t)a3;
- (void)_update;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PUPXAssetsDataSourceManager

- (void).cxx_destruct
{
}

- (void)_setCurrentUpdateId:(int64_t)a3
{
  self->__currentUpdateID = a3;
}

- (int64_t)_currentUpdateID
{
  return self->__currentUpdateID;
}

- (PXAssetsDataSourceManager)underlyingDataSourceManager
{
  return self->_underlyingDataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUPXAssetsDataSourceManagerObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUPXAssetsDataSourceManager.m" lineNumber:80 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PUPXAssetsDataSourceManager *)self _scheduleUpdate];
    id v9 = v11;
  }
}

- (void)_update
{
  v3 = [(PUPXAssetsDataSourceManager *)self underlyingDataSourceManager];
  id v5 = [v3 dataSource];

  v4 = [[PUPXAssetsDataSource alloc] initWithUnderlyingDataSource:v5];
  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v4];
}

- (void)_handleScheduledUpdateWithID:(int64_t)a3
{
  if ([(PUPXAssetsDataSourceManager *)self _currentUpdateID] == a3)
  {
    [(PUPXAssetsDataSourceManager *)self _update];
  }
}

- (void)_scheduleUpdate
{
  v3 = (void *)([(PUPXAssetsDataSourceManager *)self _currentUpdateID] + 1);
  [(PUPXAssetsDataSourceManager *)self _setCurrentUpdateId:v3];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUPXAssetsDataSourceManager__scheduleUpdate__block_invoke;
  block[3] = &unk_1E5F2B980;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __46__PUPXAssetsDataSourceManager__scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleScheduledUpdateWithID:*(void *)(a1 + 40)];
}

- (id)photosDataSource
{
  v3 = [(PUPXAssetsDataSourceManager *)self underlyingDataSourceManager];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PUPXAssetsDataSourceManager *)self underlyingDataSourceManager];
    char v6 = [v5 photosDataSource];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (PUPXAssetsDataSourceManager)initWithUnderlyingDataSourceManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetsDataSourceManager;
  char v6 = [(PUPXAssetsDataSourceManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingDataSourceManager, a3);
    [(PXAssetsDataSourceManager *)v7->_underlyingDataSourceManager registerChangeObserver:v7 context:PUPXAssetsDataSourceManagerObservationContext];
    [(PUPXAssetsDataSourceManager *)v7 _update];
  }

  return v7;
}

- (PUPXAssetsDataSourceManager)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXAssetsDataSourceManager.m", 24, @"%s is not available as initializer", "-[PUPXAssetsDataSourceManager init]");

  abort();
}

@end