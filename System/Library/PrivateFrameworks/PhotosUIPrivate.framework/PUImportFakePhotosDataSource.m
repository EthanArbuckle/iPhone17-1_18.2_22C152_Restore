@interface PUImportFakePhotosDataSource
- (PUImportFakePhotosDataSource)initWithImportDataSource:(id)a3 photoLibrary:(id)a4;
- (PXImportAssetsDataSource)importDataSource;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4;
- (void)setImportDataSource:(id)a3;
@end

@implementation PUImportFakePhotosDataSource

- (void).cxx_destruct
{
}

- (void)setImportDataSource:(id)a3
{
}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[PUImportFakePhotosDataSource photoLibraryDidChangeOnMainQueue:]";
    _os_log_debug_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v4, 0xCu);
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[PUImportFakePhotosDataSource prepareForPhotoLibraryChange:]";
    _os_log_debug_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = _importDataLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[PUImportFakePhotosDataSource prefetchApproximateAssetsAtIndexPaths:reverseOrder:]";
    _os_log_debug_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v5, 0xCu);
  }
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int v4 = [(PUImportFakePhotosDataSource *)self importDataSource];
  int64_t v5 = [v4 numberOfItemsInSection:a3];

  return v5;
}

- (int64_t)numberOfSections
{
  v2 = [(PUImportFakePhotosDataSource *)self importDataSource];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (PUImportFakePhotosDataSource)initWithImportDataSource:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUImportFakePhotosDataSource.m", 18, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  uint64_t v7 = [MEMORY[0x1E4F39150] emptyFetchResultWithPhotoLibrary:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithCollectionListFetchResult:v7 options:0];
  v12.receiver = self;
  v12.super_class = (Class)PUImportFakePhotosDataSource;
  v9 = [(PXPhotosDataSource *)&v12 initWithPhotosDataSourceConfiguration:v8];

  return v9;
}

@end