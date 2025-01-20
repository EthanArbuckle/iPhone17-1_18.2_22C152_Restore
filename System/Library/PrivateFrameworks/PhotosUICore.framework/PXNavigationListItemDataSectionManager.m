@interface PXNavigationListItemDataSectionManager
+ (unint64_t)lockStateFromPrivacyController:(id)a3;
- (BOOL)allowsEmptyDataSection;
- (BOOL)isCollectionEmpty;
- (BOOL)isCollectionVisible;
- (BOOL)isEnabled;
- (BOOL)isHiddenWhenEmpty;
- (BOOL)isInitialDuplicateDetectorProcessingCompleted;
- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4;
- (NSString)description;
- (PHCollection)collection;
- (PHFetchResult)fetchResult;
- (PXContentPrivacyController)privacyController;
- (PXDataSectionEnablementForwarder)enablementForwarder;
- (PXLibraryFilterState)libraryFilterState;
- (PXNavigationListItem)listItem;
- (PXNavigationListItemDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (PXNavigationListItemDataSectionManager)initWithCollection:(id)a3 context:(id)a4;
- (PXNavigationListItemDataSectionManager)initWithItem:(id)a3;
- (PXSidebarDataContext)context;
- (id)createDataSection;
- (unint64_t)lockState;
- (void)collectionFetchOperationDidComplete:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnablementForwarder:(id)a3;
- (void)setFetchResult:(id)a3;
- (void)setHiddenWhenEmpty:(BOOL)a3;
- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3;
- (void)setLockState:(unint64_t)a3;
- (void)updateDataSectionIfNecessary;
@end

@implementation PXNavigationListItemDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_enablementForwarder, 0);
  objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, 0);
}

- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3
{
  self->_isInitialDuplicateDetectorProcessingCompleted = a3;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSidebarDataContext)context
{
  return self->_context;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (BOOL)isHiddenWhenEmpty
{
  return self->_hiddenWhenEmpty;
}

- (PXNavigationListItem)listItem
{
  return self->_listItem;
}

- (PHCollection)collection
{
  return self->_collection;
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
  char v6 = a4;
  id v9 = a3;
  if ((void *)PrivacyControllerObservationContext_271359 == a5)
  {
    if ((v6 & 3) == 0) {
      goto LABEL_8;
    }
    id v11 = v9;
    -[PXNavigationListItemDataSectionManager setLockState:](self, "setLockState:", [(id)objc_opt_class() lockStateFromPrivacyController:self->_privacyController]);
    goto LABEL_7;
  }
  if ((void *)PXLibraryFilterStateObservationContext_271360 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXNavigationListItemDataSectionManager.m" lineNumber:256 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXNavigationListItemDataSectionManager *)self setFetchResult:0];
LABEL_7:
    id v9 = v11;
  }
LABEL_8:
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  v5 = [(PXNavigationListItemDataSectionManager *)self fetchResult];
  id v8 = [v4 changeDetailsForFetchResult:v5];

  char v6 = v8;
  if (v8)
  {
    v7 = [v8 fetchResultAfterChanges];
    [(PXNavigationListItemDataSectionManager *)self setFetchResult:v7];

    char v6 = v8;
  }
}

- (void)collectionFetchOperationDidComplete:(id)a3
{
  id v4 = [a3 outputFetchResult];
  [(PXNavigationListItemDataSectionManager *)self setFetchResult:v4];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; collection = %@>",
                       objc_opt_class(),
                       self,
                       self->_collection);
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  return (a4 & 9) != 0;
}

- (id)createDataSection
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_listItem && [(PXNavigationListItemDataSectionManager *)self isEnabled])
  {
    v3 = [PXArrayDataSection alloc];
    v14[0] = self->_listItem;
    uint64_t v4 = v14[0];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    char v6 = [(PXArrayDataSection *)v3 initWithOutlineObject:v4 sectionContent:v5];
  }
  else
  {
    if ([(PXNavigationListItemDataSectionManager *)self isCollectionVisible]
      && ([(PXNavigationListItemDataSectionManager *)self collection],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = [PXCollectionsDataSection alloc];
      id v9 = [(PXNavigationListItemDataSectionManager *)self collection];
      unint64_t v10 = [(PXNavigationListItemDataSectionManager *)self lockState];
      id v11 = [(PXDataSectionManager *)self outlineObject];
      v5 = [(PXCollectionsDataSection *)v8 initWithDisplayCollection:v9 lockState:v10 outlineObject:v11];
    }
    else
    {
      v5 = objc_alloc_init(PXCollectionsDataSection);
    }
    char v6 = [[PXNavigationListDataSection alloc] initWithCollectionsDataSection:v5];
  }
  v12 = v6;

  return v12;
}

- (void)updateDataSectionIfNecessary
{
  id v5 = [(PXDataSectionManager *)self dataSectionIfCreated];
  if (v5)
  {
    if ([v5 count]
      || ![(PXNavigationListItemDataSectionManager *)self isCollectionVisible])
    {
      if ([v5 count] < 1
        || [(PXNavigationListItemDataSectionManager *)self isCollectionVisible])
      {
        if (![(PXNavigationListItemDataSectionManager *)self isCollectionVisible]
          || ([(PXNavigationListItemDataSectionManager *)self currentChanges] & 8) == 0)
        {
          goto LABEL_13;
        }
        uint64_t v3 = objc_msgSend(off_1E5DA5568, "changeDetailsWithChangedIndexRange:", 0, 1);
      }
      else
      {
        uint64_t v3 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, 1);
      }
    }
    else
    {
      uint64_t v3 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, 1);
    }
    uint64_t v4 = (void *)v3;
    if (v3)
    {
      [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v3];
    }
  }
LABEL_13:
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v4 = v3;
  if (!self->_lastDuplicatesProcessingCheckDate || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 300.0))
  {
    char v6 = [(PXNavigationListItemDataSectionManager *)self collection];
    v7 = [v6 photoLibrary];
    self->_BOOL isInitialDuplicateDetectorProcessingCompleted = [v7 isInitialDuplicateDetectorProcessingCompleted];

    objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, v4);
  }
  BOOL isInitialDuplicateDetectorProcessingCompleted = self->_isInitialDuplicateDetectorProcessingCompleted;

  return isInitialDuplicateDetectorProcessingCompleted;
}

- (BOOL)isCollectionVisible
{
  if ([(PXNavigationListItemDataSectionManager *)self isCollectionEmpty])
  {
    uint64_t v3 = [(PXNavigationListItemDataSectionManager *)self collection];
    if (objc_msgSend(v3, "px_isAllLibraryDuplicatesSmartAlbum")) {
      int v4 = ![(PXNavigationListItemDataSectionManager *)self isInitialDuplicateDetectorProcessingCompleted];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  int v5 = [(PXNavigationListItemDataSectionManager *)self isEnabled];
  if (v5)
  {
    if ([(PXNavigationListItemDataSectionManager *)self isHiddenWhenEmpty]) {
      LOBYTE(v5) = ![(PXNavigationListItemDataSectionManager *)self isCollectionEmpty] | v4;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)isCollectionEmpty
{
  uint64_t v3 = [(PXNavigationListItemDataSectionManager *)self collection];
  int v4 = [(PXNavigationListItemDataSectionManager *)self fetchResult];
  int v5 = [(PXNavigationListItemDataSectionManager *)self context];
  char v6 = [v5 assetsFilterPredicate];
  if (v4)
  {
    char v7 = [v4 count] == 0;
  }
  else if (v3)
  {
    id v8 = [v3 photoLibrary];
    id v9 = [v8 librarySpecificFetchOptions];

    [v9 setInternalPredicate:v6];
    if ((objc_msgSend(v3, "px_isSharedAlbum") & 1) == 0 && (objc_msgSend(v3, "px_isUnableToUploadSmartAlbum") & 1) == 0)
    {
      unint64_t v10 = [(PXNavigationListItemDataSectionManager *)self libraryFilterState];
      objc_msgSend(v9, "setSharingFilter:", objc_msgSend(v10, "sharingFilter"));
    }
    char v7 = objc_msgSend(v3, "px_fetchIsEmptyWithOptions:", v9);
    id v11 = +[PXCollectionFetchOperation fetchOperationWithCollection:v3 delegate:self];
    [v11 setFetchOptions:v9];
    v12 = [v5 workQueue];
    [v12 addOperation:v11];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)setLockState:(unint64_t)a3
{
  if (self->_lockState != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PXNavigationListItemDataSectionManager_setLockState___block_invoke;
    v3[3] = &unk_1E5DD09C8;
    v3[4] = self;
    v3[5] = a3;
    [(PXNavigationListItemDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __55__PXNavigationListItemDataSectionManager_setLockState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) signalChange:8];
  v2 = *(void **)(a1 + 32);
  return [v2 updateDataSectionIfNecessary];
}

- (void)setFetchResult:(id)a3
{
  id v11 = (PHFetchResult *)a3;
  int v5 = self->_fetchResult;
  if (v5 != v11)
  {
    char v6 = v5;
    char v7 = [(PHFetchResult *)v5 isEqual:v11];

    id v8 = v11;
    if (v7) {
      goto LABEL_13;
    }
    fetchResult = self->_fetchResult;
    if (!v11 || fetchResult)
    {
      if (v11 || !fetchResult) {
        goto LABEL_11;
      }
      unint64_t v10 = [(PHCollection *)self->_collection photoLibrary];
      objc_msgSend(v10, "px_unregisterChangeObserver:", self);
    }
    else
    {
      unint64_t v10 = [(PHCollection *)self->_collection photoLibrary];
      objc_msgSend(v10, "px_registerChangeObserver:", self);
    }

LABEL_11:
    objc_storeStrong((id *)&self->_fetchResult, a3);
    [(PXNavigationListItemDataSectionManager *)self updateDataSectionIfNecessary];
    goto LABEL_12;
  }

LABEL_12:
  id v8 = v11;
LABEL_13:
}

- (void)setHiddenWhenEmpty:(BOOL)a3
{
  if (self->_hiddenWhenEmpty != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __61__PXNavigationListItemDataSectionManager_setHiddenWhenEmpty___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXNavigationListItemDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __61__PXNavigationListItemDataSectionManager_setHiddenWhenEmpty___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 153) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) signalChange:2];
  v2 = *(void **)(a1 + 32);
  return [v2 updateDataSectionIfNecessary];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__PXNavigationListItemDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXNavigationListItemDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __53__PXNavigationListItemDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) signalChange:4];
  v2 = *(void **)(a1 + 32);
  return [v2 updateDataSectionIfNecessary];
}

- (BOOL)allowsEmptyDataSection
{
  if ([(PXNavigationListItemDataSectionManager *)self isHiddenWhenEmpty]) {
    return 0;
  }
  return [(PXNavigationListItemDataSectionManager *)self isEnabled];
}

- (PXNavigationListItemDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXNavigationListItemDataSectionManager.m", 71, @"%s is not available as initializer", "-[PXNavigationListItemDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (PXNavigationListItemDataSectionManager)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListItemDataSectionManager;
  char v6 = [(PXDataSectionManager *)&v9 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listItem, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (PXNavigationListItemDataSectionManager)initWithCollection:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXNavigationListItemDataSectionManager;
  objc_super v9 = [(PXDataSectionManager *)&v16 initWithChildDataSectionManagers:MEMORY[0x1E4F1CBF0]];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v10->_enabled = 1;
    uint64_t v11 = +[PXContentPrivacyController privacyControllerForCollection:v10->_collection];
    privacyController = v10->_privacyController;
    v10->_privacyController = (PXContentPrivacyController *)v11;

    [(PXContentPrivacyController *)v10->_privacyController registerChangeObserver:v10 context:PrivacyControllerObservationContext_271359];
    v10->_lockState = [(id)objc_opt_class() lockStateFromPrivacyController:v10->_privacyController];
    uint64_t v13 = [v8 libraryFilterState];
    libraryFilterState = v10->_libraryFilterState;
    v10->_libraryFilterState = (PXLibraryFilterState *)v13;

    [(PXLibraryFilterState *)v10->_libraryFilterState registerChangeObserver:v10 context:PXLibraryFilterStateObservationContext_271360];
  }

  return v10;
}

+ (unint64_t)lockStateFromPrivacyController:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && [v3 isContentPrivacyEnabled])
  {
    if ([v4 isLocked]) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = 2;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end