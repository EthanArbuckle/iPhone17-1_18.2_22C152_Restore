@interface PXFetchResultDataSourceManager
- (PHPhotoLibrary)photoLibrary;
- (PXFetchResultDataSourceManager)initWithInitialFetchResult:(id)a3;
- (id)createInitialDataSource;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setFetchResult:(id)a3 changeDetails:(id)a4;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXFetchResultDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentFetchResult, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  p_currentFetchResult = &self->_currentFetchResult;
  v5 = [a3 changeDetailsForFetchResult:self->_currentFetchResult];
  v6 = [v5 fetchResultAfterChanges];
  if (v6)
  {
    v16 = [(PXSectionedDataSourceManager *)self dataSource];
    v7 = [[PXFetchResultDataSource alloc] initWithFetchResult:v6];
    location = (id *)p_currentFetchResult;
    v8 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v9 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v5];
    id v10 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v11 = [v16 identifier];
    uint64_t v12 = [(PXFetchResultDataSource *)v7 identifier];
    v17 = &unk_1F02DA018;
    v18[0] = v9;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v14 = (void *)[v10 initWithFromDataSourceIdentifier:v11 toDataSourceIdentifier:v12 sectionChanges:v8 itemChangeDetailsBySection:v13 subitemChangeDetailsByItemBySection:0];

    objc_storeStrong(location, v6);
    [(PXSectionedDataSourceManager *)self setDataSource:v7 changeDetails:v14];
  }
}

- (void)setFetchResult:(id)a3 changeDetails:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 fetchResultBeforeChanges];
    uint64_t v11 = v10;
    if (v10 != self->_currentFetchResult)
    {

      goto LABEL_5;
    }
    id v4 = [v9 fetchResultAfterChanges];

    if (v4 != v7) {
LABEL_5:
    }
      PXAssertGetLog();
  }
  uint64_t v12 = v7;
  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E4F39150];
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v13 emptyFetchResultWithPhotoLibrary:v4];
  }
  p_currentFetchResult = &self->_currentFetchResult;
  objc_storeStrong((id *)&self->_currentFetchResult, v12);
  if (!v7)
  {
  }
  v15 = [(PHFetchResult *)*p_currentFetchResult photoLibrary];
  [(PXFetchResultDataSourceManager *)self setPhotoLibrary:v15];

  v16 = [[PXFetchResultDataSource alloc] initWithFetchResult:*p_currentFetchResult];
  if (v9)
  {
    v17 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v9];
    id v27 = objc_alloc((Class)off_1E5DA8488);
    v18 = [(PXSectionedDataSourceManager *)self dataSource];
    v19 = self;
    id v20 = v7;
    uint64_t v21 = [v18 identifier];
    uint64_t v22 = [(PXFetchResultDataSource *)v16 identifier];
    v23 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v28 = &unk_1F02DA018;
    v29 = v17;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v25 = v21;
    id v7 = v20;
    self = v19;
    v26 = (void *)[v27 initWithFromDataSourceIdentifier:v25 toDataSourceIdentifier:v22 sectionChanges:v23 itemChangeDetailsBySection:v24 subitemChangeDetailsByItemBySection:0];
  }
  else
  {
    v17 = [(PXSectionedDataSourceManager *)self dataSource];
    v26 = objc_msgSend(off_1E5DA8488, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v17, "identifier"), -[PXFetchResultDataSource identifier](v16, "identifier"));
  }

  [(PXSectionedDataSourceManager *)self setDataSource:v16 changeDetails:v26];
}

- (void)setPhotoLibrary:(id)a3
{
  v5 = (PHPhotoLibrary *)a3;
  photoLibrary = self->_photoLibrary;
  if (photoLibrary != v5)
  {
    id v7 = v5;
    [(PHPhotoLibrary *)photoLibrary px_unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photoLibrary, a3);
    [(PHPhotoLibrary *)self->_photoLibrary px_registerChangeObserver:self];
    v5 = v7;
  }
}

- (id)createInitialDataSource
{
  v2 = [[PXFetchResultDataSource alloc] initWithFetchResult:self->_currentFetchResult];
  return v2;
}

- (PXFetchResultDataSourceManager)initWithInitialFetchResult:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFetchResultDataSourceManager;
  v6 = [(PXSectionedDataSourceManager *)&v11 init];
  if (v6)
  {
    id v7 = v5;
    if (!v5)
    {
      id v8 = (void *)MEMORY[0x1E4F39150];
      v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v7 = [v8 emptyFetchResultWithPhotoLibrary:v3];
    }
    objc_storeStrong((id *)&v6->_currentFetchResult, v7);
    if (!v5)
    {
    }
    v9 = [v5 photoLibrary];
    [(PXFetchResultDataSourceManager *)v6 setPhotoLibrary:v9];
  }
  return v6;
}

@end