@interface PXStackedDataSourceManager
- (BOOL)initialDataSourceCreated;
- (NSArray)dataSectionManagers;
- (PXStackedDataSourceManager)initWithDataSectionManagers:(id)a3;
- (id)_newDataSource;
- (id)createInitialDataSource;
- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3;
- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3;
- (void)_updateDataSourceWithSectionChanges:(id)a3 itemChanges:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSectionManagers:(id)a3;
- (void)setInitialDataSourceCreated:(BOOL)a3;
@end

@implementation PXStackedDataSourceManager

- (void).cxx_destruct
{
}

- (void)setInitialDataSourceCreated:(BOOL)a3
{
  self->_initialDataSourceCreated = a3;
}

- (BOOL)initialDataSourceCreated
{
  return self->_initialDataSourceCreated;
}

- (NSArray)dataSectionManagers
{
  return self->_dataSectionManagers;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((void *)PXDataSectionManagerObserverContext == a5
    && [(PXStackedDataSourceManager *)self initialDataSourceCreated])
  {
    id v8 = v7;
    v9 = [v8 changeDetailsFromPreviousDataSection];
    v10 = [(PXStackedDataSourceManager *)self dataSectionManagers];
    uint64_t v11 = [v10 indexOfObject:v8];

    v12 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      v13 = [NSNumber numberWithUnsignedInteger:v11];
      v15 = v13;
      v16[0] = v9;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    v14 = [off_1E5DA5568 changeDetailsWithNoChanges];
    [(PXStackedDataSourceManager *)self _updateDataSourceWithSectionChanges:v14 itemChanges:v12];
  }
}

- (id)createInitialDataSource
{
  [(PXStackedDataSourceManager *)self setInitialDataSourceCreated:1];
  id v3 = [(PXStackedDataSourceManager *)self _newDataSource];
  return v3;
}

- (void)setDataSectionManagers:(id)a3
{
  v19 = (NSArray *)a3;
  v4 = self->_dataSectionManagers;
  v5 = v19;
  if (v4 != v19)
  {
    v6 = v4;
    char v7 = [(NSArray *)v4 isEqual:v19];

    if (v7) {
      goto LABEL_9;
    }
    v5 = [off_1E5DA5568 changeDetailsFromArray:self->_dataSectionManagers toArray:v19 changedObjects:MEMORY[0x1E4F1CBF0]];
    int v8 = [v5 hasIncrementalChanges];
    dataSectionManagers = self->_dataSectionManagers;
    if (v8)
    {
      v10 = [v5 removedIndexes];
      uint64_t v11 = [(NSArray *)dataSectionManagers objectsAtIndexes:v10];
      [(PXStackedDataSourceManager *)self _unregisterAsChangeObserverForDataSectionManagers:v11];

      v12 = (NSArray *)[(NSArray *)v19 copy];
      v13 = self->_dataSectionManagers;
      self->_dataSectionManagers = v12;

      v14 = self->_dataSectionManagers;
      v15 = [v5 insertedIndexes];
      v16 = [(NSArray *)v14 objectsAtIndexes:v15];
      [(PXStackedDataSourceManager *)self _registerAsChangeObserverForDataSectionManagers:v16];
    }
    else
    {
      [(PXStackedDataSourceManager *)self _unregisterAsChangeObserverForDataSectionManagers:self->_dataSectionManagers];
      v17 = (NSArray *)[(NSArray *)v19 copy];
      v18 = self->_dataSectionManagers;
      self->_dataSectionManagers = v17;

      [(PXStackedDataSourceManager *)self _registerAsChangeObserverForDataSectionManagers:self->_dataSectionManagers];
    }
    if ([(PXStackedDataSourceManager *)self initialDataSourceCreated]) {
      [(PXStackedDataSourceManager *)self _updateDataSourceWithSectionChanges:v5 itemChanges:0];
    }
  }

LABEL_9:
}

- (void)_updateDataSourceWithSectionChanges:(id)a3 itemChanges:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PXStackedDataSourceManager *)self _newDataSource];
  int v8 = [(PXSectionedDataSourceManager *)self dataSource];
  v9 = [v8 changeDetailsToDataSource:v10 sectionChanges:v7 itemChanges:v6];

  [(PXSectionedDataSourceManager *)self setDataSource:v10 changeDetails:v9];
}

- (id)_newDataSource
{
}

uint64_t __44__PXStackedDataSourceManager__newDataSource__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataSection];
}

- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) registerChangeObserver:self context:PXDataSectionManagerObserverContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) registerChangeObserver:self context:PXDataSectionManagerObserverContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (PXStackedDataSourceManager)initWithDataSectionManagers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStackedDataSourceManager;
  uint64_t v5 = [(PXSectionedDataSourceManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataSectionManagers = v5->_dataSectionManagers;
    v5->_dataSectionManagers = (NSArray *)v6;

    [(PXStackedDataSourceManager *)v5 _registerAsChangeObserverForDataSectionManagers:v5->_dataSectionManagers];
  }

  return v5;
}

@end