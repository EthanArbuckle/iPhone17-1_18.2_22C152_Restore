@interface NTKCompanionSinglePHAssetEditor
- (BOOL)shouldFinalize;
- (NSString)albumIdentifier;
- (NSString)albumName;
- (NTKCompanionSinglePHAssetEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4 shouldFinalize:(BOOL)a5;
- (id)_createResourceDirectoryForSinglePHAssetWithPreviewOnly:(BOOL)a3;
- (id)_fetchAlbumName;
- (id)_fetchSingleAsset;
- (id)optionsForSingleAsset;
- (void)finalizeWithCompletion:(id)a3;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)setAlbumIdentifier:(id)a3;
- (void)setShouldFinalize:(BOOL)a3;
@end

@implementation NTKCompanionSinglePHAssetEditor

- (NTKCompanionSinglePHAssetEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4 shouldFinalize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKCompanionSinglePHAssetEditor;
  v9 = [(NTKCompanionResourceDirectoryEditor *)&v16 initWithResourceDirectory:v8 forDevice:a4];
  v10 = v9;
  if (v9)
  {
    [(NTKCompanionSinglePHAssetEditor *)v9 setShouldFinalize:v5];
    v11 = +[NTKPhotosReader readerForResourceDirectory:v8];
    uint64_t v12 = [v11 assetCollectionIdentifier];
    albumIdentifier = v10->_albumIdentifier;
    v10->_albumIdentifier = (NSString *)v12;

    albumName = v10->_albumName;
    v10->_albumName = 0;

    v10->_albumNameValid = 0;
  }

  return v10;
}

- (BOOL)shouldFinalize
{
  return [(NTKCompanionResourceDirectoryEditor *)self state] == 2;
}

- (void)setShouldFinalize:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    [(NTKCompanionResourceDirectoryEditor *)self setState:v6];
  }
  else
  {
    BOOL v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionSinglePHAssetEditor setShouldFinalize:](v5);
    }
  }
}

- (NSString)albumName
{
  if (!self->_albumNameValid)
  {
    BOOL v3 = [(NTKCompanionSinglePHAssetEditor *)self _fetchAlbumName];
    albumName = self->_albumName;
    self->_albumName = v3;

    self->_albumNameValid = 1;
  }
  BOOL v5 = self->_albumName;
  return v5;
}

- (void)setAlbumIdentifier:(id)a3
{
  BOOL v5 = (NSString *)a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    albumIdentifier = self->_albumIdentifier;
    if (albumIdentifier != v5 && (!albumIdentifier || !-[NSString isEqualToString:](v5, "isEqualToString:")))
    {
      id v8 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionSinglePHAssetEditor setAlbumIdentifier:]((uint64_t)v5, v8);
      }

      objc_storeStrong((id *)&self->_albumIdentifier, a3);
      v9 = [(NTKCompanionSinglePHAssetEditor *)self _fetchAlbumName];
      albumName = self->_albumName;
      self->_albumName = v9;

      self->_albumNameValid = 1;
      [(NTKCompanionResourceDirectoryEditor *)self setState:2];
    }
  }
  else
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionSinglePHAssetEditor setAlbumIdentifier:](v6);
    }
  }
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__21;
  v24 = __Block_byref_object_dispose__21;
  id v25 = 0;
  int64_t v7 = [(NTKCompanionResourceDirectoryEditor *)self state];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62C3D18;
  p_long long buf = &buf;
  int64_t v20 = v7;
  aBlock[4] = self;
  id v8 = v4;
  id v18 = v8;
  v9 = _Block_copy(aBlock);
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2)
  {
    if ([(NTKCompanionResourceDirectoryEditor *)self state] != 1)
    {
      [(NTKCompanionResourceDirectoryEditor *)self setState:3];
      v13 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
      block[3] = &unk_1E62C3D40;
      objc_super v16 = &buf;
      block[4] = self;
      id v15 = v9;
      dispatch_async(v13, block);

      goto LABEL_7;
    }
    uint64_t v11 = [(NTKCompanionResourceDirectoryEditor *)self resourceDirectory];
    uint64_t v12 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v11;

    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*((void (**)(void *, uint64_t))v9 + 2))(v9, v10);
LABEL_7:

  _Block_object_dispose(&buf, 8);
}

void __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
  block[3] = &unk_1E62C3CF0;
  uint64_t v1 = *(void *)(a1 + 56);
  block[4] = *(void *)(a1 + 32);
  uint64_t v6 = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) galleryPreviewResourceDirectory];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __89__NTKCompanionSinglePHAssetEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createResourceDirectoryForSinglePHAssetWithPreviewOnly:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    if ([(NTKCompanionResourceDirectoryEditor *)self state] == 1)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_2;
      v9[3] = &unk_1E62C0AE8;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v9);
      long long v5 = v10;
    }
    else
    {
      [(NTKCompanionResourceDirectoryEditor *)self setState:4];
      uint64_t v6 = dispatch_get_global_queue(2, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_3;
      v7[3] = &unk_1E62C2290;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(v6, v7);

      long long v5 = v8;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E62C0718;
    id v12 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    long long v5 = v12;
  }
}

uint64_t __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) resourceDirectory];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createResourceDirectoryForSinglePHAssetWithPreviewOnly:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_4;
  block[3] = &unk_1E62C0098;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__NTKCompanionSinglePHAssetEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setResourceDirectory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setState:1];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) resourceDirectory];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)optionsForSingleAsset
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F390A0]);
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3);
  [v2 setPredicate:v3];

  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v9[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v2 setSortDescriptors:v5];

  uint64_t v8 = *MEMORY[0x1E4F39508];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  [v2 addFetchPropertySets:v6];

  [v2 setFetchLimit:1];
  return v2;
}

- (id)_createResourceDirectoryForSinglePHAssetWithPreviewOnly:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(NTKCompanionSinglePHAssetEditor *)self _fetchSingleAsset];
  id v6 = objc_opt_class();
  id v7 = [(NTKCompanionSinglePHAssetEditor *)self albumIdentifier];
  uint64_t v8 = [(NTKCompanionResourceDirectoryEditor *)self device];
  v9 = [v6 _createResourceDirectoryWithAsset:v5 assetCollection:v7 forDevice:v8 previewOnly:v3];

  return v9;
}

- (id)_fetchSingleAsset
{
  return 0;
}

- (id)_fetchAlbumName
{
  return 0;
}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

- (void)setShouldFinalize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "setShouldFinalize: trying to set the state while finalizing or generating a preview", v1, 2u);
}

- (void)setAlbumIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "setAlbumIdentifier: trying to set the albumIdentifier while finalizing or generating a preview", v1, 2u);
}

- (void)setAlbumIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "setAlbumIdentifier: set the albumIdentifier to %@", (uint8_t *)&v2, 0xCu);
}

@end