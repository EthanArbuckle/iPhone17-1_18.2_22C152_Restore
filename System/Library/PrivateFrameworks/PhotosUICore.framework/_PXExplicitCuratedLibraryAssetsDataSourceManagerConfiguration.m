@interface _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration
- (_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7;
- (id)configurationForZoomLevel:(int64_t)a3;
@end

@implementation _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPhotosAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_daysAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_monthsAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_yearsAssetsDataSourceManager, 0);
}

- (id)configurationForZoomLevel:(int64_t)a3
{
  v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__yearsAssetsDataSourceManager;
  switch(a3)
  {
    case 0:
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m" lineNumber:121 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      goto LABEL_5;
    case 2:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__monthsAssetsDataSourceManager;
      goto LABEL_5;
    case 3:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__daysAssetsDataSourceManager;
      goto LABEL_5;
    case 4:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__allPhotosAssetsDataSourceManager;
LABEL_5:
      id v7 = *(id *)((char *)&self->super.super.isa + *v6);
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_7;
    default:
LABEL_6:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m", 136, @"missing assetsDataSourceManager for zoomLevel %li", a3);

      id v7 = 0;
LABEL_7:
      v9 = [[PXCuratedLibraryZoomLevelDataConfiguration alloc] initWithZoomLevel:a3 assetsDataSourceManager:v7];

      return v9;
  }
}

- (_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration;
  v17 = [(PXCuratedLibraryAssetsDataSourceManagerConfiguration *)&v20 initWithPhotoLibrary:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_yearsAssetsDataSourceManager, a4);
    objc_storeStrong((id *)&v18->_monthsAssetsDataSourceManager, a5);
    objc_storeStrong((id *)&v18->_daysAssetsDataSourceManager, a6);
    objc_storeStrong((id *)&v18->_allPhotosAssetsDataSourceManager, a7);
  }

  return v18;
}

@end