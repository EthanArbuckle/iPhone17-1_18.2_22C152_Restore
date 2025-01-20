@interface PXNavigationListDataSourceBasedDataSectionManager
- (BOOL)allowsEmptyDataSection;
- (BOOL)isDataSectionVisible;
- (BOOL)isDataSourceEmpty;
- (BOOL)isEnabled;
- (BOOL)isHiddenWhenEmpty;
- (PXDataSectionEnablementForwarder)enablementForwarder;
- (PXNavigationListDataSourceBasedDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (PXNavigationListDataSourceBasedDataSectionManager)initWithDataSourceManager:(id)a3;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSourceManager)dataSourceManager;
- (id)createDataSection;
- (id)dataSectionFromDataSource:(id)a3;
- (void)_handleDataSourceChange;
- (void)_updateVisibilityViaDataSectionIfNecessary;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnablementForwarder:(id)a3;
- (void)setHiddenWhenEmpty:(BOOL)a3;
@end

@implementation PXNavigationListDataSourceBasedDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_enablementForwarder, 0);
}

- (void)setDataSource:(id)a3
{
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isHiddenWhenEmpty
{
  return self->_hiddenWhenEmpty;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setEnablementForwarder:(id)a3
{
}

- (PXDataSectionEnablementForwarder)enablementForwarder
{
  return self->_enablementForwarder;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)DataSourceManagerObservableContext == a5) {
    [(PXNavigationListDataSourceBasedDataSectionManager *)self _handleDataSourceChange];
  }
}

- (id)dataSectionFromDataSource:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXNavigationListDataSourceBasedDataSectionManager.m", 131, @"Method %s is a responsibility of subclass %@", "-[PXNavigationListDataSourceBasedDataSectionManager dataSectionFromDataSource:]", v8 object file lineNumber description];

  abort();
}

- (id)createDataSection
{
  v3 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSourceManager];
  v4 = [v3 dataSource];
  dataSource = self->_dataSource;
  self->_dataSource = v4;

  v6 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSource];
  if ([(PXNavigationListDataSourceBasedDataSectionManager *)self isDataSectionVisible]
    && [v6 containsAnyItems])
  {
    v7 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSectionFromDataSource:v6];
  }
  else
  {
    v8 = objc_alloc_init(PXCollectionsDataSection);
    v7 = [[PXNavigationListDataSection alloc] initWithCollectionsDataSection:v8];
  }
  return v7;
}

- (void)_handleDataSourceChange
{
  v3 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSourceManager];
  id v8 = [v3 dataSource];

  v4 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSourceManager];
  id v5 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSource];
  v6 = [v4 changeDetailsFromDataSource:v5 toDataSource:v8];

  v7 = [v6 sectionChanges];
  [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v7];
}

- (void)_updateVisibilityViaDataSectionIfNecessary
{
  v3 = [(PXDataSectionManager *)self dataSectionIfCreated];
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    if ([v3 count]
      || ![(PXNavigationListDataSourceBasedDataSectionManager *)self isDataSectionVisible])
    {
      uint64_t v6 = [v9 count];
      v4 = v9;
      if (v6 < 1) {
        goto LABEL_10;
      }
      BOOL v7 = [(PXNavigationListDataSourceBasedDataSectionManager *)self isDataSectionVisible];
      v4 = v9;
      if (v7) {
        goto LABEL_10;
      }
      uint64_t v5 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, 1);
    }
    else
    {
      uint64_t v5 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, 1);
    }
    id v8 = (void *)v5;
    v4 = v9;
    if (v5)
    {
      [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v5];

      v4 = v9;
    }
  }
LABEL_10:
}

- (BOOL)isDataSectionVisible
{
  BOOL v3 = [(PXNavigationListDataSourceBasedDataSectionManager *)self isEnabled];
  if (v3)
  {
    if ([(PXNavigationListDataSourceBasedDataSectionManager *)self isHiddenWhenEmpty]) {
      LOBYTE(v3) = ![(PXNavigationListDataSourceBasedDataSectionManager *)self isDataSourceEmpty];
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)isDataSourceEmpty
{
  v2 = [(PXNavigationListDataSourceBasedDataSectionManager *)self dataSource];
  char v3 = [v2 containsAnyItems] ^ 1;

  return v3;
}

- (void)setHiddenWhenEmpty:(BOOL)a3
{
  if (self->_hiddenWhenEmpty != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __72__PXNavigationListDataSourceBasedDataSectionManager_setHiddenWhenEmpty___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXNavigationListDataSourceBasedDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __72__PXNavigationListDataSourceBasedDataSectionManager_setHiddenWhenEmpty___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) signalChange:2];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibilityViaDataSectionIfNecessary];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__PXNavigationListDataSourceBasedDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXNavigationListDataSourceBasedDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __64__PXNavigationListDataSourceBasedDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) signalChange:4];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibilityViaDataSectionIfNecessary];
}

- (BOOL)allowsEmptyDataSection
{
  if ([(PXNavigationListDataSourceBasedDataSectionManager *)self isHiddenWhenEmpty]) {
    return 0;
  }
  return [(PXNavigationListDataSourceBasedDataSectionManager *)self isEnabled];
}

- (PXNavigationListDataSourceBasedDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXNavigationListDataSourceBasedDataSectionManager.m", 43, @"%s is not available as initializer", "-[PXNavigationListDataSourceBasedDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (PXNavigationListDataSourceBasedDataSectionManager)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSourceBasedDataSectionManager;
  uint64_t v6 = [(PXDataSectionManager *)&v9 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
  }

  return v7;
}

@end