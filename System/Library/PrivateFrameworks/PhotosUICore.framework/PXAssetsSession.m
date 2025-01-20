@interface PXAssetsSession
- (PXAssetsSession)init;
- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4;
- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSourceManager)dataSourceManager;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXUIMediaProvider)mediaProvider;
- (void)_updateDataSourceDependentProperties;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3;
- (void)setSelectionManager:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
@end

@implementation PXAssetsSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)DataSourceManagerObservationContext_215440 != a5
    && SelectionManagerObservationContext_215441 != (void)a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXAssetsSession.m" lineNumber:128 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v12 = v9;
    [(PXAssetsSession *)self _updateDataSourceDependentProperties];
    id v9 = v12;
  }
}

- (void)_updateDataSourceDependentProperties
{
  v3 = [(PXAssetsSession *)self dataSourceManager];
  v4 = [v3 dataSource];

  v5 = [(PXAssetsSession *)self selectionManager];
  char v6 = [v5 selectionSnapshot];

  if (!v6
    || ([v6 dataSource],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v4 isEqual:v7],
        v7,
        v8))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__PXAssetsSession__updateDataSourceDependentProperties__block_invoke;
    v9[3] = &unk_1E5DC5ED0;
    id v10 = v4;
    id v11 = v6;
    [(PXAssetsSession *)self performChanges:v9];
  }
}

void __55__PXAssetsSession__updateDataSourceDependentProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDataSource:v3];
  [v4 setSelectionSnapshot:*(void *)(a1 + 40)];
}

- (void)setSelectionSnapshot:(id)a3
{
  int v8 = (PXSelectionSnapshot *)a3;
  v5 = self->_selectionSnapshot;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(PXSelectionSnapshot *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      [(PXAssetsSession *)self signalChange:2];
    }
  }
}

- (void)setDataSource:(id)a3
{
  int v8 = (PXSectionedDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(PXSectionedDataSource *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      [(PXAssetsSession *)self signalChange:1];
    }
  }
}

- (void)setSelectionManager:(id)a3
{
  char v6 = (PXSectionedSelectionManager *)a3;
  char v7 = v6;
  p_selectionManager = &self->_selectionManager;
  if (self->_selectionManager != v6)
  {
    if (v6)
    {
      id v9 = [(PXSectionedSelectionManager *)v6 dataSourceManager];
      id v10 = [(PXAssetsSession *)self dataSourceManager];
      char v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"PXAssetsSession.m", 64, @"Invalid parameter not satisfying: %@", @"!selectionManager || [selectionManager.dataSourceManager isEqual:self.dataSourceManager]" object file lineNumber description];
      }
    }
    [(PXSectionedSelectionManager *)*p_selectionManager unregisterChangeObserver:self context:SelectionManagerObservationContext_215441];
    objc_storeStrong((id *)&self->_selectionManager, a3);
    [(PXSectionedSelectionManager *)*p_selectionManager registerChangeObserver:self context:SelectionManagerObservationContext_215441];
    v13 = [(PXSectionedSelectionManager *)v7 selectionSnapshot];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 dataSource];
      char v16 = [v15 isEqual:self->_dataSource];

      if ((v16 & 1) == 0)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"PXAssetsSession.m" lineNumber:71 description:@"Initial selection snapshot are out of sync"];
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__PXAssetsSession_setSelectionManager___block_invoke;
    v19[3] = &unk_1E5DC5EA8;
    id v20 = v14;
    id v18 = v14;
    [(PXAssetsSession *)self performChanges:v19];
  }
}

uint64_t __39__PXAssetsSession_setSelectionManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectionSnapshot:*(void *)(a1 + 32)];
}

- (PXAssetsSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsSession.m", 53, @"%s is not available as initializer", "-[PXAssetsSession init]");

  abort();
}

- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v12)
  {
    v14 = [v12 dataSourceManager];
    char v15 = [v14 isEqual:v10];

    if ((v15 & 1) == 0)
    {
      char v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXAssetsSession.m", 33, @"Invalid parameter not satisfying: %@", @"!selectionManager || [selectionManager.dataSourceManager isEqual:dataSourceManager]" object file lineNumber description];
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)PXAssetsSession;
  v17 = [(PXAssetsSession *)&v28 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataSourceManager, a3);
    objc_storeStrong((id *)&v18->_mediaProvider, a4);
    objc_storeStrong((id *)&v18->_selectionManager, a5);
    uint64_t v19 = [v10 dataSource];
    dataSource = v18->_dataSource;
    v18->_dataSource = (PXSectionedDataSource *)v19;

    uint64_t v21 = [v13 selectionSnapshot];
    selectionSnapshot = v18->_selectionSnapshot;
    v18->_selectionSnapshot = (PXSelectionSnapshot *)v21;

    v23 = v18->_selectionSnapshot;
    if (v23)
    {
      v24 = [(PXSelectionSnapshot *)v23 dataSource];
      char v25 = [v24 isEqual:v18->_dataSource];

      if ((v25 & 1) == 0)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2 object:v18 file:@"PXAssetsSession.m" lineNumber:44 description:@"Initial data source and selection snapshot are out of sync"];
      }
    }
    [(PXSectionedDataSourceManager *)v18->_dataSourceManager registerChangeObserver:v18 context:DataSourceManagerObservationContext_215440];
    [(PXSectionedSelectionManager *)v18->_selectionManager registerChangeObserver:v18 context:SelectionManagerObservationContext_215441];
  }

  return v18;
}

- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  return [(PXAssetsSession *)self initWithDataSourceManager:a3 mediaProvider:a4 selectionManager:0];
}

@end