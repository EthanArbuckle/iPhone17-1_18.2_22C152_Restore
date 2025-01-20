@interface PXSharedLibraryPhotoKitDataSourceManager
+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3;
- (PXSharedLibraryPhotoKitDataSourceManager)init;
- (PXSharedLibraryPhotoKitDataSourceManager)initWithType:(int64_t)a3 fetchResult:(id)a4;
- (id)createInitialDataSource;
- (id)fetchExiting;
- (id)fetchPreview;
- (id)fetchSharedLibrary;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
@end

@implementation PXSharedLibraryPhotoKitDataSourceManager

- (id)createInitialDataSource
{
  [(PHPhotoLibrary *)self->_photoLibrary px_registerChangeObserver:self];
  v3 = [[PXSharedLibraryPhotoKitDataSource alloc] initWithFetchResult:self->_fetchResult];
  return v3;
}

+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXSharedLibraryPhotoKitDataSource.m", 153, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1E4F39110];
  v7 = [v5 librarySpecificFetchOptions];
  v8 = [v6 fetchActiveLibraryScopeWithOptions:v7];

  v9 = [[PXSharedLibraryPhotoKitDataSourceManager alloc] initWithType:2 fetchResult:v8];
  return v9;
}

+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXSharedLibraryPhotoKitDataSource.m", 161, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v6 = [v5 librarySpecificFetchOptions];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"exitState", 0);
  [v6 setPredicate:v7];

  [v6 setIncludeExitingShares:1];
  v8 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v6];
  v9 = [[PXSharedLibraryPhotoKitDataSourceManager alloc] initWithType:3 fetchResult:v8];

  return v9;
}

+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXSharedLibraryPhotoKitDataSource.m", 135, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v6 = [v5 librarySpecificFetchOptions];
  v7 = [MEMORY[0x1E4F39110] fetchPendingLibraryScopeInvitationWithOptions:v6];
  v8 = [[PXSharedLibraryPhotoKitDataSourceManager alloc] initWithType:0 fetchResult:v7];

  return v8;
}

+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXSharedLibraryPhotoKitDataSource.m", 144, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v6 = [v5 librarySpecificFetchOptions];
  v7 = [MEMORY[0x1E4F39110] fetchPreviewLibraryScopeWithOptions:v6];
  v8 = [[PXSharedLibraryPhotoKitDataSourceManager alloc] initWithType:1 fetchResult:v7];

  return v8;
}

- (PXSharedLibraryPhotoKitDataSourceManager)initWithType:(int64_t)a3 fetchResult:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 176, @"Invalid parameter not satisfying: %@", @"fetchResult" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryPhotoKitDataSourceManager;
  v9 = [(PXSectionedDataSourceManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_fetchResult, a4);
    uint64_t v11 = [(PHFetchResult *)v10->_fetchResult photoLibrary];
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    goto LABEL_19;
  }
  v9 = [(PXSectionedDataSourceManager *)self dataSource];
  if (!v9)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    [v31 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 272, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v33 object file lineNumber description];
LABEL_22:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v34);
    v35 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v31 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 272, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v33, v35 object file lineNumber description];

    goto LABEL_22;
  }
LABEL_4:
  v10 = [v8 objectForKeyedSubscript:@"currentDataSource"];

  if (v10 == v9)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"preparedDataSource"];
    id v12 = [v8 objectForKeyedSubscript:@"preparedChangeDetails"];
  }
  else
  {
    id v39 = 0;
    uint64_t v11 = [v9 dataSourceUpdatedWithChange:v7 changeDetails:&v39];
    id v12 = v39;
  }
  id v13 = v12;
  uint64_t v14 = [v11 numberOfItemsInSection:0];
  id v37 = v7;
  if (v14)
  {
    if (v11) {
      [v11 firstItemIndexPath];
    }
    else {
      memset(v38, 0, sizeof(v38));
    }
    v16 = [v11 sharedLibraryAtItemIndexPath:v38];
    v17 = [v16 libraryScope];
    v18 = NSString;
    v19 = [v17 uuid];
    objc_super v15 = [v18 stringWithFormat:@", first: <%p:%@>", v17, v19];
  }
  else
  {
    objc_super v15 = &stru_1F00B0030;
  }
  id v36 = v8;
  v20 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    unint64_t type = self->_type;
    if (type > 3) {
      v23 = @"Unknown";
    }
    else {
      v23 = off_1E5DCDEE8[type];
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v43 = v21;
    __int16 v44 = 2048;
    v45 = self;
    __int16 v46 = 2114;
    v47 = v23;
    __int16 v48 = 2048;
    uint64_t v49 = v14;
    __int16 v50 = 2114;
    v51 = v15;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Changed: %{public}@, count: %lu%{public}@", buf, 0x34u);
  }

  id v24 = objc_alloc((Class)off_1E5DA8488);
  uint64_t v25 = [v9 identifier];
  uint64_t v26 = [v11 identifier];
  v27 = [off_1E5DA5568 changeDetailsWithNoChanges];
  v40 = &unk_1F02D9E50;
  id v41 = v13;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  v29 = v28 = v13;
  v30 = (void *)[v24 initWithFromDataSourceIdentifier:v25 toDataSourceIdentifier:v26 sectionChanges:v27 itemChangeDetailsBySection:v29 subitemChangeDetailsByItemBySection:0];

  [(PXSectionedDataSourceManager *)self setDataSource:v11 changeDetails:v30];
  id v8 = v36;
  id v7 = v37;
LABEL_19:
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__265665;
  v19 = __Block_byref_object_dispose__265666;
  id v20 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXSharedLibraryPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  block[4] = self;
  block[5] = &v15;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v6 = (void *)v16[5];
  id v13 = 0;
  id v7 = [v6 dataSourceUpdatedWithChange:v5 changeDetails:&v13];
  id v8 = v13;
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = v16[5];
    v21[0] = @"currentDataSource";
    v21[1] = @"preparedDataSource";
    v22[0] = v10;
    v22[1] = v7;
    v21[2] = @"preparedChangeDetails";
    v22[2] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  }
  else
  {
    uint64_t v11 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __73__PXSharedLibraryPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v12);
    id v13 = objc_msgSend(v2, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:v10, v11, @"PXSharedLibraryPhotoKitDataSource.m", 251, @"%@ should be an instance inheriting from %@, but it is %@", @"self.dataSource", v9, v13 object file lineNumber description];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v5 handleFailureInMethod:v6, v7, @"PXSharedLibraryPhotoKitDataSource.m", 251, @"%@ should be an instance inheriting from %@, but it is nil", @"self.dataSource", v9 object file lineNumber description];
  }

LABEL_3:
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fetchExiting
{
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"exitState", 0);
  [v2 setPredicate:v3];

  [v2 setIncludeExitingShares:1];
  v4 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v2];
  id v5 = [v4 firstObject];
  if (v5) {
    uint64_t v6 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)fetchSharedLibrary
{
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v3 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v2];
  v4 = [v3 firstObject];
  if (v4) {
    id v5 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)fetchPreview
{
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v3 = [MEMORY[0x1E4F39110] fetchPreviewLibraryScopeWithOptions:v2];
  v4 = [v3 firstObject];
  if (v4) {
    id v5 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 190, @"Invalid parameter not satisfying: %@", @"shareURL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 191, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  photoLibrary = self->_photoLibrary;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PXSharedLibraryPhotoKitDataSourceManager_fetchSharedLibraryForURL_completionHandler___block_invoke;
  v14[3] = &unk_1E5DCDEA0;
  id v15 = v9;
  id v11 = v9;
  PXSharedLibraryFetchLibraryScopeForURL(photoLibrary, v7, v14);
}

void __87__PXSharedLibraryPhotoKitDataSourceManager_fetchSharedLibraryForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (PXSharedLibraryPhotoKitDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryPhotoKitDataSource.m", 172, @"%s is not available as initializer", "-[PXSharedLibraryPhotoKitDataSourceManager init]");

  abort();
}

@end