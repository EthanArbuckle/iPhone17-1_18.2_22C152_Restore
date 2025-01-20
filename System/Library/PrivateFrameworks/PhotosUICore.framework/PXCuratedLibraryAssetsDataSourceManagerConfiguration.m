@interface PXCuratedLibraryAssetsDataSourceManagerConfiguration
+ (id)configurationWithPhotoLibrary:(id)a3 enableDays:(BOOL)a4;
+ (id)configurationWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7;
- (BOOL)enableDays;
- (PHPhotoLibrary)photoLibrary;
- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3;
- (id)configurationForZoomLevel:(int64_t)a3;
- (id)keyAssetCollectionReferenceInDataSource:(id)a3 zoomLevel:(int64_t)a4 matchingAssetCollectionReference:(id)a5 fromDataSource:(id)a6 zoomLevel:(int64_t)a7;
- (void)setEnableDays:(BOOL)a3;
@end

@implementation PXCuratedLibraryAssetsDataSourceManagerConfiguration

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

+ (id)configurationWithPhotoLibrary:(id)a3 enableDays:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(PXCuratedLibraryAssetsDataSourceManagerConfiguration *)[_PXPhotoLibraryCuratedLibraryAssetsDataSourceManagerConfiguration alloc] initWithPhotoLibrary:v5];

  [(PXCuratedLibraryAssetsDataSourceManagerConfiguration *)v6 setEnableDays:v4];
  return v6;
}

- (void)setEnableDays:(BOOL)a3
{
  self->_enableDays = a3;
}

- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m", 57, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetsDataSourceManagerConfiguration;
  v7 = [(PXCuratedLibraryAssetsDataSourceManagerConfiguration *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v8->_enableDays = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (id)keyAssetCollectionReferenceInDataSource:(id)a3 zoomLevel:(int64_t)a4 matchingAssetCollectionReference:(id)a5 fromDataSource:(id)a6 zoomLevel:(int64_t)a7
{
  v9 = objc_msgSend(a3, "objectReferenceNearestToObjectReference:", a5, a4);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v11 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m", 83, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[dataSource objectReferenceNearestToObjectReference:referenceAssetCollectionReference]", v13, v14 object file lineNumber description];
    }
  }
  return v9;
}

- (id)configurationForZoomLevel:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m", 78, @"Method %s is a responsibility of subclass %@", "-[PXCuratedLibraryAssetsDataSourceManagerConfiguration configurationForZoomLevel:]", v7 object file lineNumber description];

  abort();
}

+ (id)configurationWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration alloc] initWithPhotoLibrary:v15 yearsAssetsDataSourceManager:v14 monthsAssetsDataSourceManager:v13 daysAssetsDataSourceManager:v12 allPhotosAssetsDataSourceManager:v11];

  return v16;
}

@end