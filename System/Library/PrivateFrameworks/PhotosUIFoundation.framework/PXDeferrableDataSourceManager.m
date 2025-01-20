@interface PXDeferrableDataSourceManager
- (BOOL)_canAttemptDataSourceChanges;
- (PXDeferrableDataSourceManager)init;
- (PXDeferrableDataSourceManager)initWithDataSourceManager:(id)a3;
- (PXDeferrableDataSourceManagerDelegate)delegate;
- (PXSectionedDataSourceManager)underlyingDataSourceManager;
- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4;
- (id)createInitialDataSource;
- (void)_finishTransitionToDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)_internal_setDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)_setPendingDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)resumeDataSourceChanges;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUnderlyingDataSourceManager:(id)a3;
@end

@implementation PXDeferrableDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingDataSourceChangeDetails, 0);

  objc_storeStrong((id *)&self->_pendingDataSource, 0);
}

- (PXSectionedDataSourceManager)underlyingDataSourceManager
{
  return self->_underlyingDataSourceManager;
}

- (void)setDelegate:(id)a3
{
}

- (PXDeferrableDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PXDeferrableDataSourceManagerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)UnderlyingDataSourceManagerObservationContext != a5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXDeferrableDataSourceManager.m" lineNumber:154 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 1) != 0 && self->_hasInitialDataSource)
  {
    id v15 = v9;
    v10 = [(PXSectionedDataSourceManager *)self dataSource];
    v11 = [(PXSectionedDataSourceManager *)self->_underlyingDataSourceManager dataSource];
    v12 = [(PXSectionedDataSourceManager *)self->_underlyingDataSourceManager changeHistory];
    v13 = objc_msgSend(v12, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v11, "identifier"));

    [(PXDeferrableDataSourceManager *)self _internal_setDataSource:v11 changeDetailsArray:v13];
    id v9 = v15;
  }
}

- (void)resumeDataSourceChanges
{
  if (self->_clientIsHandlingDataSourceTransition)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXDeferrableDataSourceManager.m" lineNumber:124 description:@"Cannot call -[PXDeferrableDataSourceManager resumeDataSourceChanges] while an outstanding change is being made. This means we're not calling the completion block for accepting a change."];
  }
  pendingDataSource = self->_pendingDataSource;
  if (pendingDataSource)
  {
    pendingDataSourceChangeDetails = self->_pendingDataSourceChangeDetails;
    self->_pendingDataSource = 0;
    v5 = pendingDataSourceChangeDetails;
    id v9 = pendingDataSource;

    char v6 = self->_pendingDataSourceChangeDetails;
    self->_pendingDataSourceChangeDetails = 0;

    [(PXDeferrableDataSourceManager *)self _internal_setDataSource:v9 changeDetailsArray:v5];
  }
}

- (void)_setPendingDataSource:(id)a3 changeDetailsArray:(id)a4
{
  char v6 = (PXSectionedDataSource *)a3;
  v7 = (NSArray *)a4;
  pendingDataSource = self->_pendingDataSource;
  self->_pendingDataSource = v6;
  v10 = v6;

  pendingDataSourceChangeDetails = self->_pendingDataSourceChangeDetails;
  self->_pendingDataSourceChangeDetails = v7;
}

- (BOOL)_canAttemptDataSourceChanges
{
  return !self->_clientIsHandlingDataSourceTransition && self->_pendingDataSource == 0;
}

- (id)createInitialDataSource
{
  self->_hasInitialDataSource = 1;
  return [(PXSectionedDataSourceManager *)self->_underlyingDataSourceManager dataSource];
}

- (void)_internal_setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXDeferrableDataSourceManager *)self _canAttemptDataSourceChanges]
    && ([(PXDeferrableDataSourceManager *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 shouldSuspendDataSourceChangesForDataSourceManager:self],
        v8,
        !v9))
  {
    self->_clientIsHandlingDataSourceTransition = 1;
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __76__PXDeferrableDataSourceManager__internal_setDataSource_changeDetailsArray___block_invoke;
    v18 = &unk_26545A180;
    objc_copyWeak(&v21, &location);
    id v10 = v6;
    id v19 = v10;
    id v20 = v7;
    v11 = (void (**)(void))_Block_copy(&v15);
    v12 = [(PXDeferrableDataSourceManager *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(PXDeferrableDataSourceManager *)self delegate];
      [v14 dataSourceManager:self willSetDataSource:v10 completion:v11];
    }
    else
    {
      v11[2](v11);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXDeferrableDataSourceManager *)self _setPendingDataSource:v6 changeDetailsArray:v7];
  }
}

void __76__PXDeferrableDataSourceManager__internal_setDataSource_changeDetailsArray___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishTransitionToDataSource:*(void *)(a1 + 32) changeDetailsArray:*(void *)(a1 + 40)];
}

- (void)_finishTransitionToDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeferrableDataSourceManager.m", 70, @"%s must be called on the main thread", "-[PXDeferrableDataSourceManager _finishTransitionToDataSource:changeDetailsArray:]");
  }
  self->_clientIsHandlingDataSourceTransition = 0;
  v10.receiver = self;
  v10.super_class = (Class)PXDeferrableDataSourceManager;
  [(PXSectionedDataSourceManager *)&v10 setDataSource:v7 changeDetailsArray:v8];
  [(PXDeferrableDataSourceManager *)self resumeDataSourceChanges];
}

- (void)setUnderlyingDataSourceManager:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = (PXSectionedDataSourceManager *)a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    char v13 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeferrableDataSourceManager.m", 53, @"%s must be called on the main thread", "-[PXDeferrableDataSourceManager setUnderlyingDataSourceManager:]");
  }
  p_underlyingDataSourceManager = &self->_underlyingDataSourceManager;
  underlyingDataSourceManager = self->_underlyingDataSourceManager;
  if (underlyingDataSourceManager != v6)
  {
    [(PXSectionedDataSourceManager *)underlyingDataSourceManager unregisterChangeObserver:self context:UnderlyingDataSourceManagerObservationContext];
    objc_storeStrong((id *)&self->_underlyingDataSourceManager, a3);
    [(PXSectionedDataSourceManager *)*p_underlyingDataSourceManager registerChangeObserver:self context:UnderlyingDataSourceManagerObservationContext];
    int v9 = [(PXSectionedDataSourceManager *)self dataSource];
    objc_super v10 = [(PXSectionedDataSourceManager *)*p_underlyingDataSourceManager dataSource];
    v11 = +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", [v9 identifier], objc_msgSend(v10, "identifier"));
    v14[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(PXDeferrableDataSourceManager *)self _internal_setDataSource:v10 changeDetailsArray:v12];
  }
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeferrableDataSourceManager.m", 49, @"%s should not be called directly", "-[PXDeferrableDataSourceManager setDataSource:changeDetailsArray:]");

  abort();
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeferrableDataSourceManager.m", 45, @"%s should not be called directly", "-[PXDeferrableDataSourceManager setDataSource:changeDetails:]");

  abort();
}

- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  return [(PXSectionedDataSourceManager *)self->_underlyingDataSourceManager changeDetailsFromDataSource:a3 toDataSource:a4];
}

- (PXDeferrableDataSourceManager)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDeferrableDataSourceManager.m", 37, @"%s is not available as initializer", "-[PXDeferrableDataSourceManager init]");

  abort();
}

- (PXDeferrableDataSourceManager)initWithDataSourceManager:(id)a3
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDeferrableDataSourceManager;
  id v7 = [(PXSectionedDataSourceManager *)&v11 init];
  id v8 = v7;
  if (!v6)
  {
    objc_super v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, v8, @"PXDeferrableDataSourceManager.m", 28, @"Invalid parameter not satisfying: %@", @"underlyingDataSourceManager" object file lineNumber description];

    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    objc_storeStrong((id *)&v8->_underlyingDataSourceManager, a3);
    [(PXSectionedDataSourceManager *)v8->_underlyingDataSourceManager registerChangeObserver:v8 context:UnderlyingDataSourceManagerObservationContext];
  }
LABEL_4:

  return v8;
}

@end