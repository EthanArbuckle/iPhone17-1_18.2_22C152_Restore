@interface PUActivitySharingViewModel
- (BOOL)isActionSheet;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PHFetchResult)collectionListFetchResult;
- (PHPerson)person;
- (PHSocialGroup)socialGroup;
- (PUActivitySharingViewModel)init;
- (PUActivitySharingViewModel)initWithActivitySharingConfiguration:(id)a3;
- (PUPhotoSelectionManager)selectionManager;
- (PXDisplayAsset)keyAsset;
- (PXPhotosDataSource)photosDataSource;
- (int64_t)sourceOrigin;
- (void)performChanges:(id)a3;
- (void)setActionSheet:(BOOL)a3;
- (void)setSelectionManager:(id)a3;
@end

@implementation PUActivitySharingViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (PHPerson)person
{
  return self->_person;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (BOOL)isActionSheet
{
  return self->_actionSheet;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)setSelectionManager:(id)a3
{
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (void)setActionSheet:(BOOL)a3
{
  if (self->_actionSheet != a3)
  {
    self->_actionSheet = a3;
    [(PUActivitySharingViewModel *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUActivitySharingViewModel;
  [(PUActivitySharingViewModel *)&v3 performChanges:a3];
}

- (PUPhotoSelectionManager)selectionManager
{
  if ([(PUActivitySharingViewModel *)self isActionSheet])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUActivitySharingViewModel.m", 44, @"Invalid parameter not satisfying: %@", @"!self.isActionSheet" object file lineNumber description];
  }
  selectionManager = self->_selectionManager;
  return selectionManager;
}

- (PUActivitySharingViewModel)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivitySharingViewModel.m", 39, @"%s is not available as initializer", "-[PUActivitySharingViewModel init]");

  abort();
}

- (PUActivitySharingViewModel)initWithActivitySharingConfiguration:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PUActivitySharingViewModel;
  v5 = [(PUActivitySharingViewModel *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 collectionListFetchResult];
    collectionListFetchResult = v5->_collectionListFetchResult;
    v5->_collectionListFetchResult = (PHFetchResult *)v6;

    uint64_t v8 = [v4 selectionManager];
    selectionManager = v5->_selectionManager;
    v5->_selectionManager = (PUPhotoSelectionManager *)v8;

    uint64_t v10 = [v4 photosDataSource];
    photosDataSource = v5->_photosDataSource;
    v5->_photosDataSource = (PXPhotosDataSource *)v10;

    v12 = [v4 title];
    uint64_t v13 = [v12 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;

    v15 = [v4 subtitle];
    uint64_t v16 = [v15 copy];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v16;

    uint64_t v18 = [v4 keyAsset];
    keyAsset = v5->_keyAsset;
    v5->_keyAsset = (PXDisplayAsset *)v18;

    uint64_t v20 = [v4 person];
    person = v5->_person;
    v5->_person = (PHPerson *)v20;

    uint64_t v22 = [v4 socialGroup];
    socialGroup = v5->_socialGroup;
    v5->_socialGroup = (PHSocialGroup *)v22;

    v5->_sourceOrigin = [v4 sourceOrigin];
    v5->_actionSheet = [v4 wantsActionSheet];
  }

  return v5;
}

@end