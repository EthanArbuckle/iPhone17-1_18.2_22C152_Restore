@interface PXImportSourceDataSectionManager
- (BOOL)limitToSingleImportSource87746235;
- (NSArray)importSources;
- (PHPhotoLibrary)photoLibrary;
- (PXImportSourceDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (PXImportSourceDataSectionManager)initWithPhotoLibrary:(id)a3;
- (PXImportSourcesManager)importSourcesManager;
- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5;
- (id)createDataSection;
- (void)importSourcesManager:(id)a3 didUpdateImportSource:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setImportSources:(id)a3;
- (void)setLimitToSingleImportSource87746235:(BOOL)a3;
@end

@implementation PXImportSourceDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSources, 0);
  objc_storeStrong((id *)&self->_importSourcesManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setLimitToSingleImportSource87746235:(BOOL)a3
{
  self->_limitToSingleImportSource87746235 = a3;
}

- (BOOL)limitToSingleImportSource87746235
{
  return self->_limitToSingleImportSource87746235;
}

- (void)setImportSources:(id)a3
{
}

- (NSArray)importSources
{
  return self->_importSources;
}

- (PXImportSourcesManager)importSourcesManager
{
  return self->_importSourcesManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)importSourcesManager:(id)a3 didUpdateImportSource:(id)a4
{
  id v5 = a4;
  v6 = [(PXImportSourceDataSectionManager *)self importSourcesManager];
  id v10 = [v6 importSources];

  uint64_t v7 = [v10 indexOfObject:v5];
  if (![(PXImportSourceDataSectionManager *)self limitToSingleImportSource87746235]
    || v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
    v9 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v8];
    [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v9];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ((a4 & 1) != 0 && (void *)PXImportSourcesManagerObserverContext == a5)
  {
    v6 = [(PXImportSourceDataSectionManager *)self importSourcesManager];
    uint64_t v7 = [v6 importSources];

    if ([(PXImportSourceDataSectionManager *)self limitToSingleImportSource87746235])
    {
      v8 = [v7 firstObject];

      if (v8)
      {
        v9 = [v7 firstObject];
        v13[0] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

        uint64_t v7 = (void *)v10;
      }
    }
    v11 = [(PXImportSourceDataSectionManager *)self importSources];
    v12 = [off_1E5DA5568 changeDetailsFromArray:v11 toArray:v7 changedObjects:MEMORY[0x1E4F1CBF0]];

    [(PXImportSourceDataSectionManager *)self setImportSources:v7];
    [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v12];
  }
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    v19 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXImportSourceDataSectionManager.m", 74, @"%@ should be an instance inheriting from %@, but it is %@", @"dataSectionObject", v17, v19 object file lineNumber description];
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXImportSourceDataSectionManager.m", 74, @"%@ should be an instance inheriting from %@, but it is nil", @"dataSectionObject", v17 object file lineNumber description];
  }

LABEL_3:
  if ([v9 isEqualToString:@"PXNavigationListItemKeyAsset"])
  {
    v11 = [PXImageAsset alloc];
    v12 = [v10 image];
    v13 = [(PXImageAsset *)v11 initWithImage:v12];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PXImportSourceDataSectionManager;
    v13 = [(PXDataSectionManager *)&v20 auxiliaryObjectForKey:v9 dataSectionObject:v10 hintIndex:a5];
  }

  return v13;
}

- (id)createDataSection
{
}

PXImportSourceNavigationListItem *__53__PXImportSourceDataSectionManager_createDataSection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [PXImportSourceNavigationListItem alloc];
  id v5 = [*(id *)(a1 + 32) photoLibrary];
  v6 = [(PXImportSourceNavigationListItem *)v4 initWithImportSource:v3 photoLibrary:v5];

  return v6;
}

- (PXImportSourceDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportSourceDataSectionManager.m", 57, @"%s is not available as initializer", "-[PXImportSourceDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (PXImportSourceDataSectionManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXImportSourceDataSectionManager;
  v6 = [(PXDataSectionManager *)&v13 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = +[PXImportSourcesManager sharedController];
    importSourcesManager = v7->_importSourcesManager;
    v7->_importSourcesManager = (PXImportSourcesManager *)v8;

    [(PXImportSourcesManager *)v7->_importSourcesManager registerChangeObserver:v7 context:PXImportSourcesManagerObserverContext];
    uint64_t v10 = [(PXImportSourcesManager *)v7->_importSourcesManager importSources];
    importSources = v7->_importSources;
    v7->_importSources = (NSArray *)v10;

    v7->_limitToSingleImportSource87746235 = 1;
  }

  return v7;
}

@end