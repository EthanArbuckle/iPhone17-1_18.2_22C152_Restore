@interface PUImagePickerSessionInfo
- (BOOL)isForAssetPicker;
- (BOOL)isLimitedLibraryPicker;
- (BOOL)isSelectingAssets;
- (PHCollectionList)rootCollectionList;
- (PUImagePickerSessionInfo)initWithPhotosViewDelegate:(id)a3 loadingStatusManager:(id)a4 allowMultipleSelection:(BOOL)a5 limitedLibrary:(BOOL)a6;
- (void)setRootCollectionList:(id)a3;
@end

@implementation PUImagePickerSessionInfo

- (void).cxx_destruct
{
}

- (void)setRootCollectionList:(id)a3
{
}

- (PHCollectionList)rootCollectionList
{
  return self->_rootCollectionList;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (BOOL)isForAssetPicker
{
  return 1;
}

- (BOOL)isSelectingAssets
{
  return 1;
}

- (PUImagePickerSessionInfo)initWithPhotosViewDelegate:(id)a3 loadingStatusManager:(id)a4 allowMultipleSelection:(BOOL)a5 limitedLibrary:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUImagePickerSessionInfo;
  v12 = [(PUSessionInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(PUSessionInfo *)v12 setPhotosViewDelegate:v10];
    [(PUSessionInfo *)v13 setLoadingStatusManager:v11];
    [(PUSessionInfo *)v13 setAllowsMultipleSelection:v7];
    v13->_isLimitedLibraryPicker = a6;
  }

  return v13;
}

@end