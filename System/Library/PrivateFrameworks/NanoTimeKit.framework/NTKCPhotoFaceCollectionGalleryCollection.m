@interface NTKCPhotoFaceCollectionGalleryCollection
- (id)initForDevice:(id)a3;
- (id)newFace;
- (void)dealloc;
- (void)photoAlbumChanged;
@end

@implementation NTKCPhotoFaceCollectionGalleryCollection

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v6 = +[NTKCompanionFaceCollectionsManager sharedInstance];
  v7 = [v6 sharedFaceCollectionForDevice:v5 forCollectionIdentifier:@"PhotosFaces"];

  v9 = NTKCCustomizationLocalizedString(@"GALLERY_TITLE_PHOTOS", @"Photos", v8);
  v22.receiver = self;
  v22.super_class = (Class)NTKCPhotoFaceCollectionGalleryCollection;
  v10 = [(NTKFaceCollectionGalleryCollection *)&v22 initWithTitle:v9 faceCollection:v7];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    [v7 addObserver:v10];
    v12 = NTKCCustomizationLocalizedString(@"GALLERY_PHOTOS_DESCRIPTION", @"description", v11);
    [(NTKGalleryCollection *)v10 setDescriptionText:v12];

    objc_initWeak(&location, v10);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke;
    v19[3] = &unk_1E62C62B8;
    objc_copyWeak(&v20, &location);
    [(NTKGalleryCollection *)v10 setCalloutName:v19];
    albumName = v10->_albumName;
    v10->_albumName = (NSString *)&stru_1F1635E90;

    v14 = dispatch_get_global_queue(17, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_182;
    v16[3] = &unk_1E62C09C0;
    v17 = v10;
    id v18 = v5;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 faceStyle] == 13
    || [v3 faceStyle] == 22
    && ([v3 selectedOptionsForCustomEditModes],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:&unk_1F16E1FE0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        uint64_t v9 = [v8 photosContent],
        v8,
        !v9))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained) {
      id v6 = WeakRetained[7];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_182(uint64_t a1)
{
  v2 = +[NTKSyncedAlbumObserver sharedInstance];
  [v2 addObserver:*(void *)(a1 + 32) forDevice:*(void *)(a1 + 40)];
  id v3 = [v2 syncedAlbumNameForDevice:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_2;
  v5[3] = &unk_1E62C09C0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __58__NTKCPhotoFaceCollectionGalleryCollection_initForDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 galleryCollectionDidChange:*(void *)(a1 + 32) shouldUpdateSnaphots:0];
}

- (void)dealloc
{
  uint64_t v3 = +[NTKSyncedAlbumObserver sharedInstance];
  [v3 removeObserver:self forDevice:self->_device];

  v4.receiver = self;
  v4.super_class = (Class)NTKCPhotoFaceCollectionGalleryCollection;
  [(NTKCPhotoFaceCollectionGalleryCollection *)&v4 dealloc];
}

- (id)newFace
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)photoAlbumChanged
{
  uint64_t v3 = +[NTKSyncedAlbumObserver sharedInstance];
  objc_super v4 = [v3 syncedAlbumNameForDevice:self->_device];
  albumName = self->_albumName;
  self->_albumName = v4;

  id v6 = [(NTKGalleryCollection *)self delegate];
  [v6 galleryCollectionDidChange:self shouldUpdateSnaphots:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end