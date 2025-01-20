@interface _PUWallpaperSmartAlbumPreviewReloadRequest
- (PXWallpaperSmartAlbumDataSource)smartAlbumDataSource;
- (_PUWallpaperSmartAlbumPreviewReloadRequest)initWithPhotoLibrary:(id)a3 shuffleConfiguration:(id)a4 completion:(id)a5;
- (id)completion;
- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setSmartAlbumDataSource:(id)a3;
@end

@implementation _PUWallpaperSmartAlbumPreviewReloadRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_smartAlbumDataSource, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setSmartAlbumDataSource:(id)a3
{
}

- (PXWallpaperSmartAlbumDataSource)smartAlbumDataSource
{
  return self->_smartAlbumDataSource;
}

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93___PUWallpaperSmartAlbumPreviewReloadRequest_passiveContentDataSourcePreviewAssetsDidChange___block_invoke;
  v3[3] = &unk_1E5F2E530;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (_PUWallpaperSmartAlbumPreviewReloadRequest)initWithPhotoLibrary:(id)a3 shuffleConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PUWallpaperSmartAlbumPreviewReloadRequest;
  v11 = [(_PUWallpaperSmartAlbumPreviewReloadRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    id completion = v11->_completion;
    v11->_id completion = (id)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F908F0]) initWithPhotoLibrary:v8 changeObserver:v11 centerMedia:0];
    smartAlbumDataSource = v11->_smartAlbumDataSource;
    v11->_smartAlbumDataSource = (PXWallpaperSmartAlbumDataSource *)v14;

    v16 = [v9 personLocalIdentifiers];
    v17 = [v16 allObjects];
    [(PXWallpaperSmartAlbumDataSource *)v11->_smartAlbumDataSource setPeopleLocalIdentifiers:v17];

    -[PXWallpaperSmartAlbumDataSource setSelectedTypes:](v11->_smartAlbumDataSource, "setSelectedTypes:", [v9 shuffleSmartAlbums]);
  }

  return v11;
}

@end