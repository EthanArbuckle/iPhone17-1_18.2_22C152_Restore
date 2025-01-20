@interface NTKCompanionCustomPhotosEditor
- (BOOL)addAssetsFromAssetList:(id)a3;
- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4;
- (BOOL)addPhotosFromUIImagePicker:(id)a3;
- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3;
- (BOOL)setOriginalCrop:(CGRect)a3 forPhotoAtIndex:(int64_t)a4;
- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3;
- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3;
- (NTKCompanionCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (id)_copyOrTranscodePhotosTo:(id)a3;
- (id)_fetchAssetsForNewPhotos:(id)a3;
- (int64_t)photosCount;
- (void)_fetchAssetsForPickedPhotos;
- (void)_readPickedPhotosFrom:(id)a3;
- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4;
- (void)deletePhotoAtIndex:(int64_t)a3;
- (void)finalizeWithCompletion:(id)a3;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
@end

@implementation NTKCompanionCustomPhotosEditor

- (NTKCompanionCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NTKCompanionCustomPhotosEditor;
  v4 = [(NTKCompanionResourceDirectoryEditor *)&v16 initWithResourceDirectory:a3 forDevice:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    pickedPhotos = v4->_pickedPhotos;
    v4->_pickedPhotos = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    newPhotos = v4->_newPhotos;
    v4->_newPhotos = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    orderList = v4->_orderList;
    v4->_orderList = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    scaledImageCache = v4->_scaledImageCache;
    v4->_scaledImageCache = (NSCache *)v11;

    v4->_previewIsValid = 0;
    v13 = [(NTKCompanionResourceDirectoryEditor *)v4 resourceDirectory];

    if (v13)
    {
      v14 = [(NTKCompanionResourceDirectoryEditor *)v4 resourceDirectory];
      [(NTKCompanionCustomPhotosEditor *)v4 _readPickedPhotosFrom:v14];

      [(NTKCompanionCustomPhotosEditor *)v4 _fetchAssetsForPickedPhotos];
    }
    [(NTKCompanionResourceDirectoryEditor *)v4 setState:1];
  }
  return v4;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for CustomPhotosEditor", buf, 2u);
  }

  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  int64_t v6 = [(NTKCompanionResourceDirectoryEditor *)self state];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62C21F0;
  v18 = buf;
  int64_t v19 = v6;
  aBlock[4] = self;
  id v7 = v4;
  id v17 = v7;
  v8 = _Block_copy(aBlock);
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2)
  {
    if ([(NTKCompanionResourceDirectoryEditor *)self state] == 1)
    {
      uint64_t v10 = [(NTKCompanionResourceDirectoryEditor *)self resourceDirectory];
    }
    else
    {
      if (!self->_previewIsValid)
      {
        [(NTKCompanionResourceDirectoryEditor *)self setState:3];
        v12 = dispatch_get_global_queue(2, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
        block[3] = &unk_1E62C2218;
        v15 = buf;
        block[4] = self;
        id v14 = v8;
        dispatch_async(v12, block);

        goto LABEL_12;
      }
      uint64_t v10 = [(NTKCompanionResourceDirectoryEditor *)self galleryPreviewResourceDirectory];
    }
    uint64_t v11 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v10;

    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  (*((void (**)(void *, uint64_t))v8 + 2))(v8, v9);
LABEL_12:

  _Block_object_dispose(buf, 8);
}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v5 removeItemAtPath:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:0];

      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;

      uint64_t v4 = 0;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
  block[3] = &unk_1E62C21C8;
  uint64_t v8 = *(void *)(a1 + 32);
  char v14 = a2;
  block[4] = v8;
  uint64_t v13 = v4;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v10;
  long long v12 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = *(unsigned char *)(a1 + 64);
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) galleryPreviewResourceDirectory];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __88__NTKCompanionCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(void *a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NTKPhotosCreateResourceDirectory();
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 64) firstObject];
    if (!v5)
    {
      long long v12 = *(void (**)(void))(a1[5] + 16);
LABEL_14:
      v12();
      goto LABEL_15;
    }
    uint64_t v6 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = objc_opt_class();
      uint64_t v8 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:v5];
      id v9 = [v8 photo];
      long long v10 = [v7 _linkPhoto:v9 to:*(void *)(*(void *)(a1[6] + 8) + 40) previewOnly:1];
    }
    else
    {
      uint64_t v13 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v5];

      if (!v13)
      {
LABEL_13:
        long long v12 = *(void (**)(void))(a1[5] + 16);
        goto LABEL_14;
      }
      char v14 = objc_opt_class();
      uint64_t v8 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v5];
      id v9 = [v8 asset];
      v15 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v5];
      [v15 crop];
      long long v10 = objc_msgSend(v14, "_transcodeAsset:withCrop:into:previewOnly:", v9, *(void *)(*(void *)(a1[6] + 8) + 40), 1);
    }
    if (v10)
    {
      objc_super v16 = [v10 encodeAsDictionary];
      v18[0] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

      NTKPhotosWriteImageList(v17, *(void **)(*(void *)(a1[6] + 8) + 40));
      (*(void (**)(void))(a1[5] + 16))();

LABEL_15:
      return;
    }
    goto LABEL_13;
  }
  uint64_t v11 = *(void (**)(void))(a1[5] + 16);

  v11();
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
      v9[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_2;
      v9[3] = &unk_1E62C0AE8;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v9);
      uint64_t v5 = v10;
    }
    else
    {
      [(NTKCompanionResourceDirectoryEditor *)self setState:4];
      uint64_t v6 = dispatch_get_global_queue(2, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_3;
      v7[3] = &unk_1E62C2290;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(v6, v7);

      uint64_t v5 = v8;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E62C0718;
    id v12 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v5 = v12;
  }
}

uint64_t __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) resourceDirectory];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = NTKPhotosCreateResourceDirectory();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_4;
  aBlock[3] = &unk_1E62C2268;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v4;
  id v14 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = (void (**)(void, void))v6;
  if (v3)
  {
    id v8 = (void *)[*(id *)(a1 + 32) _copyOrTranscodePhotosTo:v3];
    id v9 = v8;
    if (v8 && NTKPhotosWriteImageList(v8, v3))
    {
      [*(id *)(a1 + 32) _reinitializeWithImageList:v9 andResourceDirectory:v3];
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    v7[2](v7, v10);
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }
}

void __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1, char a2)
{
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 removeItemAtPath:v5 error:0];

      uint64_t v5 = 0;
    }
    uint64_t v6 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_5;
  v10[3] = &unk_1E62C2240;
  uint64_t v13 = v6;
  id v8 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __57__NTKCompanionCustomPhotosEditor_finalizeWithCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setResourceDirectory:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (int64_t)photosCount
{
  return [(NSMutableArray *)self->_orderList count];
}

- (BOOL)addPhotosFromUIImagePicker:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2
    && (int64_t v5 = [(NTKCompanionCustomPhotosEditor *)self photosCount],
        (unint64_t)([v4 count] + v5) <= 0x18))
  {
    id v8 = [(NTKCompanionCustomPhotosEditor *)self _fetchAssetsForNewPhotos:v4];
    BOOL v6 = [(NTKCompanionCustomPhotosEditor *)self addAssetsFromAssetList:v8];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  return [(NTKCompanionCustomPhotosEditor *)self addAssetsFromAssetList:a3 maxPhotosCount:24];
}

- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(NTKCompanionResourceDirectoryEditor *)self state]
    || [(NTKCompanionResourceDirectoryEditor *)self state] > 2
    || (int64_t v7 = -[NTKCompanionCustomPhotosEditor photosCount](self, "photosCount"), [v6 count] + v7 > a4))
  {
    BOOL v8 = 0;
    goto LABEL_5;
  }
  v39 = [(NSMutableArray *)self->_orderList firstObject];
  id v40 = v6;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (!v10) {
    goto LABEL_28;
  }
  uint64_t v11 = v10;
  uint64_t v42 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v44 != v42) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      id v14 = [v13 localIdentifier];
      v15 = objc_opt_new();
      objc_super v16 = [(NTKCompanionResourceDirectoryEditor *)self device];
      NTKPhotosDefaultCropForAsset(v13, v16);
      objc_msgSend(v15, "setCrop:");

      [v15 setAsset:v13];
      [v15 setSubsampleFactor:_subsampleFactorForAsset(v13)];
      id v17 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v14];
      v18 = v17;
      if (v17)
      {
        int64_t v19 = [v17 photo];
        v20 = [v19 modificationDate];
        v21 = [v13 modificationDate];
        [v20 timeIntervalSince1970];
        double v23 = v22;
        [v21 timeIntervalSince1970];
        double v25 = vabdd_f64(v23, v24);

        v26 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25 > 2.0)
        {
          if (v27)
          {
            v28 = [v18 photo];
            v29 = [v28 imageURL];
            *(_DWORD *)buf = 138412290;
            v48 = v29;
            _os_log_impl(&dword_1BC5A9000, v26, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: replacing existing photo %@ because it was modified", buf, 0xCu);
          }
          [(NSMutableDictionary *)self->_pickedPhotos removeObjectForKey:v14];
          [(NSMutableDictionary *)self->_newPhotos setObject:v15 forKeyedSubscript:v14];
          goto LABEL_26;
        }
        if (v27)
        {
          v32 = [v18 photo];
          v33 = [v32 imageURL];
          *(_DWORD *)buf = 138412290;
          v48 = v33;
          v34 = v26;
          v35 = "addAssetsFromAssetList: not adding existing photo %@";
LABEL_21:
          _os_log_impl(&dword_1BC5A9000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        }
        goto LABEL_22;
      }
      v30 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v14];

      v26 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      BOOL v31 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v31)
        {
          v32 = [v15 asset];
          v33 = [v32 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v48 = v33;
          v34 = v26;
          v35 = "addAssetsFromAssetList: not adding new asset again %@";
          goto LABEL_21;
        }
LABEL_22:

        goto LABEL_26;
      }
      if (v31)
      {
        v36 = [v15 asset];
        v37 = [v36 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v48 = v37;
        _os_log_impl(&dword_1BC5A9000, v26, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: adding new asset %@", buf, 0xCu);
      }
      [(NSMutableDictionary *)self->_newPhotos setObject:v15 forKeyedSubscript:v14];
      [(NSMutableArray *)self->_orderList addObject:v14];
LABEL_26:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  }
  while (v11);
LABEL_28:

  if (self->_previewIsValid)
  {
    v38 = [(NSMutableArray *)self->_orderList firstObject];
    self->_previewIsValid = NTKEqualStrings(v39, v38);
  }
  [(NTKCompanionResourceDirectoryEditor *)self setState:2];

  BOOL v8 = 1;
  id v6 = v40;
LABEL_5:

  return v8;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NTKCompanionResourceDirectoryEditor *)self state])
  {
    uint64_t v5 = [(NTKCompanionResourceDirectoryEditor *)self state];
    if ((a3 & 0x8000000000000000) == 0
      && v5 <= 2
      && [(NSMutableArray *)self->_orderList count] > (unint64_t)a3)
    {
      id v6 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
      [(NSMutableArray *)self->_orderList removeObject:v6];
      int64_t v7 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v6];

      if (v7)
      {
        BOOL v8 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v6];
          uint64_t v10 = [v9 photo];
          uint64_t v11 = [v10 imageURL];
          int v20 = 138412546;
          v21 = v11;
          __int16 v22 = 2048;
          int64_t v23 = a3;
          _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting existing photo %@ at index %ld", (uint8_t *)&v20, 0x16u);
        }
        [(NSMutableDictionary *)self->_pickedPhotos removeObjectForKey:v6];
      }
      id v12 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v6];
      if (v12)
      {
        uint64_t v13 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v6];
          v15 = [v14 asset];
          objc_super v16 = [v15 localIdentifier];
          int v20 = 138412546;
          v21 = v16;
          __int16 v22 = 2048;
          int64_t v23 = a3;
          _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting new asset id %@ at index %ld", (uint8_t *)&v20, 0x16u);
        }
        scaledImageCache = self->_scaledImageCache;
        v18 = [v12 asset];
        int64_t v19 = [v18 localIdentifier];
        [(NSCache *)scaledImageCache removeObjectForKey:v19];

        [(NSMutableDictionary *)self->_newPhotos removeObjectForKey:v6];
      }
      if (self->_previewIsValid) {
        self->_previewIsValid = a3 != 0;
      }
      [(NTKCompanionResourceDirectoryEditor *)self setState:2];
    }
  }
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(NTKCompanionResourceDirectoryEditor *)self state])
  {
    uint64_t v7 = [(NTKCompanionResourceDirectoryEditor *)self state];
    if ((a3 & 0x8000000000000000) == 0 && v7 <= 2)
    {
      unint64_t v8 = [(NSMutableArray *)self->_orderList count];
      if ((a4 & 0x8000000000000000) == 0
        && v8 > a3
        && [(NSMutableArray *)self->_orderList count] > (unint64_t)a4)
      {
        id v9 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
        uint64_t v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 134218240;
          int64_t v15 = a3;
          __int16 v16 = 2048;
          int64_t v17 = a4;
          _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v14, 0x16u);
        }

        [(NSMutableArray *)self->_orderList removeObjectAtIndex:a3];
        [(NSMutableArray *)self->_orderList insertObject:v9 atIndex:a4];
        if (self->_previewIsValid)
        {
          if (a3) {
            BOOL v11 = a4 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          BOOL v13 = !v11 || a3 == a4;
          self->_previewIsValid = v13;
        }
        [(NTKCompanionResourceDirectoryEditor *)self setState:2];
      }
    }
  }
}

- (BOOL)setOriginalCrop:(CGRect)a3 forPhotoAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int64_t v10 = [(NTKCompanionResourceDirectoryEditor *)self state];
  if (v10)
  {
    uint64_t v11 = [(NTKCompanionResourceDirectoryEditor *)self state];
    LOBYTE(v10) = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 <= 2)
    {
      if ([(NSMutableArray *)self->_orderList count] <= (unint64_t)a4)
      {
        LOBYTE(v10) = 0;
        return v10;
      }
      LODWORD(v10) = [(NTKCompanionCustomPhotosEditor *)self canChangeOriginalCropOfPhotoAtIndex:a4];
      if (v10)
      {
        id v12 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a4];
        BOOL v13 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v12];
        int v14 = v13;
        if (v13)
        {
          int64_t v15 = [v13 photo];
          [v15 originalCrop];
          char v16 = CLKRectEqualsRect();

          if (v16) {
            goto LABEL_13;
          }
          [(NSMutableDictionary *)self->_pickedPhotos removeObjectForKey:v12];
          int64_t v17 = objc_opt_new();
          uint64_t v18 = [v14 asset];
          [v17 setAsset:v18];

          objc_msgSend(v17, "setSubsampleFactor:", objc_msgSend(v14, "subsampleFactor"));
          [(NSMutableDictionary *)self->_newPhotos setObject:v17 forKeyedSubscript:v12];
        }
        else
        {
          int64_t v17 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v12];
        }
        if (v17)
        {
          scaledImageCache = self->_scaledImageCache;
          int v20 = [v17 asset];
          v21 = [v20 localIdentifier];
          [(NSCache *)scaledImageCache removeObjectForKey:v21];

          CGAffineTransformMakeScale(&v24, (double)(unint64_t)[v17 subsampleFactor], (double)(unint64_t)objc_msgSend(v17, "subsampleFactor"));
          v25.origin.CGFloat x = x;
          v25.origin.CGFloat y = y;
          v25.size.CGFloat width = width;
          v25.size.CGFloat height = height;
          CGRect v26 = CGRectApplyAffineTransform(v25, &v24);
          objc_msgSend(v17, "setCrop:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

          BOOL v22 = 0;
LABEL_14:
          if (self->_previewIsValid) {
            self->_previewIsValid = v22;
          }
          [(NTKCompanionResourceDirectoryEditor *)self setState:2];

          LOBYTE(v10) = 1;
          return v10;
        }
LABEL_13:
        BOOL v22 = 1;
        goto LABEL_14;
      }
    }
  }
  return v10;
}

- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSMutableArray *)self->_orderList count] <= (unint64_t)a3) {
    return 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
  id v6 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 asset];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v5];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || [(NSMutableArray *)self->_orderList count] <= (unint64_t)a3)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke;
    v50[3] = &unk_1E62C0718;
    id v51 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v50);
    uint64_t v7 = v51;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
    BOOL v8 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v7];
    id v9 = [v8 photo];

    if (v9)
    {
      int64_t v10 = NTKPhotosImageForPhoto(v9);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2;
      block[3] = &unk_1E62C22B8;
      id v49 = v6;
      id v47 = v10;
      id v48 = v9;
      id v11 = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v12 = v49;
    }
    else
    {
      id v11 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v7];
      scaledImageCache = self->_scaledImageCache;
      int v14 = [v11 asset];
      int64_t v15 = [v14 localIdentifier];
      id v12 = [(NSCache *)scaledImageCache objectForKey:v15];

      [(id)objc_opt_class() _watchPhotoImageSize];
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      if (v12)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_3;
        v39[3] = &unk_1E62C22E0;
        id v41 = v6;
        id v12 = v12;
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        id v40 = v12;
        uint64_t v44 = v17;
        uint64_t v45 = v19;
        dispatch_async(MEMORY[0x1E4F14428], v39);

        int v20 = v41;
      }
      else
      {
        v21 = [v11 asset];
        [v11 crop];
        uint64_t v23 = v22;
        uint64_t v25 = v24;
        uint64_t v27 = v26;
        uint64_t v29 = v28;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_4;
        v32[3] = &unk_1E62C2308;
        v32[4] = self;
        id v11 = v11;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        id v33 = v11;
        uint64_t v37 = v17;
        uint64_t v38 = v19;
        id v34 = v6;
        v30 = v32;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = ___watchSizeImageForAsset_block_invoke;
        v52[3] = &unk_1E62C23D0;
        uint64_t v55 = v23;
        uint64_t v56 = v25;
        uint64_t v57 = v27;
        uint64_t v58 = v29;
        id v53 = v21;
        id v54 = v30;
        id v31 = v21;
        +[NTKCompanionResourceDirectoryEditor _imageDataForAsset:v31 completion:v52];

        int v20 = v33;
      }
    }
  }
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) crop];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v3(v2, v1);
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v16 = *MEMORY[0x1E4F1DB20];
  long long v17 = v4;
  if (v3)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 72);
    id v6 = [*(id *)(a1 + 40) asset];
    uint64_t v7 = [v6 localIdentifier];
    [v5 setObject:v3 forKey:v7];

    long long v8 = *(_OWORD *)(a1 + 72);
    long long v16 = *(_OWORD *)(a1 + 56);
    long long v17 = v8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_5;
  v11[3] = &unk_1E62C22E0;
  id v9 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = v9;
  long long v14 = v16;
  long long v15 = v17;
  id v10 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __73__NTKCompanionCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || [(NSMutableArray *)self->_orderList count] <= (unint64_t)a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke;
    block[3] = &unk_1E62C0718;
    id v20 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v7 = v20;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
    long long v8 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v7];
    id v9 = [v8 asset];

    id v10 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v7];
    uint64_t v11 = [v10 subsampleFactor];

    if (v9) {
      goto LABEL_5;
    }
    id v12 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v7];
    id v9 = [v12 asset];

    id v13 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v7];
    uint64_t v11 = [v13 subsampleFactor];

    if (v9)
    {
LABEL_5:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_3;
      v15[3] = &unk_1E62C2330;
      id v16 = v6;
      long long v14 = v15;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = ___fullSizeImageForAsset_block_invoke;
      v21[3] = &unk_1E62C2380;
      id v22 = v14;
      uint64_t v23 = v11;
      +[NTKCompanionResourceDirectoryEditor _imageDataForAsset:v9 completion:v21];
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_2;
      v17[3] = &unk_1E62C0718;
      id v18 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v17);
      id v9 = v18;
    }
  }
}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_4;
  v6[3] = &unk_1E62C0AE8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __80__NTKCompanionCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSMutableArray *)self->_orderList count] <= (unint64_t)a3)
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_17;
  }
  id v5 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
  id v6 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    id v12 = [v6 asset];
    if (!v12)
    {
      unint64_t v36 = 1;
      goto LABEL_14;
    }
    id v13 = [v7 photo];
    long long v14 = [v13 modificationDate];
    long long v15 = [v12 modificationDate];
    [v14 timeIntervalSince1970];
    double v17 = v16;
    [v15 timeIntervalSince1970];
    double v19 = vabdd_f64(v17, v18);

    if (v19 <= 2.0)
    {
      id v20 = [v7 photo];
      [v20 originalCrop];
      CGFloat x = v21;
      CGFloat y = v22;
      CGFloat width = v23;
      CGFloat height = v24;
    }
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    if (CGRectIsEmpty(v42))
    {
      uint64_t v25 = [(NTKCompanionResourceDirectoryEditor *)self device];
      NTKPhotosDefaultCropForAsset(v12, v25);
      CGFloat x = v26;
      CGFloat y = v27;
      CGFloat width = v28;
      CGFloat height = v29;
    }
    v30 = v7;
  }
  else
  {
    id v31 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v5];
    [v31 crop];
    CGFloat x = v32;
    CGFloat y = v33;
    CGFloat width = v34;
    CGFloat height = v35;

    v30 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v5];
    id v12 = v30;
  }
  unint64_t v36 = [v30 subsampleFactor];
LABEL_14:

  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  if (!CGRectIsEmpty(v43))
  {
    CGAffineTransformMakeScale(&v41, 1.0 / (double)v36, 1.0 / (double)v36);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v41);
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;
  }

LABEL_17:
  double v37 = x;
  double v38 = y;
  double v39 = width;
  double v40 = height;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  double v3 = 1.0;
  if (a3 < 0)
  {
    double v6 = 1.0;
  }
  else
  {
    double v6 = 1.0;
    if ([(NSMutableArray *)self->_orderList count] > (unint64_t)a3)
    {
      id v7 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
      id v8 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v7];
      id v9 = [v8 asset];

      id v10 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v7];
      unint64_t v11 = [v10 subsampleFactor];

      if (v9) {
        goto LABEL_5;
      }
      id v12 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v7];
      id v9 = [v12 asset];

      id v13 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v7];
      unint64_t v11 = [v13 subsampleFactor];

      if (v9)
      {
LABEL_5:
        double v14 = (double)(unint64_t)[v9 pixelWidth];
        double v15 = (double)(unint64_t)[v9 pixelHeight];
        [(id)objc_opt_class() _watchPhotoImageSize];
        double v17 = v16 * (double)v11 / v14;
        double v19 = v18 * (double)v11 / v15;
        if (NTKPhotosIsPHAssetIris(v9))
        {
          id v20 = [(id)objc_opt_class() _videoAssetOf:v9];
          double v21 = NTKPhotosVideoDimensions(v20);
          double v23 = v22;
          [(id)objc_opt_class() _watchPhotoVideoSize];
          double v26 = v25 / v21;
          if (v17 < v26) {
            double v17 = v26;
          }
          if (v19 < v24 / v23) {
            double v19 = v24 / v23;
          }
        }
        if (v17 <= 1.0) {
          double v6 = v17;
        }
        else {
          double v6 = 1.0;
        }
        if (v19 <= 1.0) {
          double v3 = v19;
        }
        else {
          double v3 = 1.0;
        }
      }
    }
  }
  double v27 = v6;
  double v28 = v3;
  result.CGFloat height = v28;
  result.CGFloat width = v27;
  return result;
}

- (void)_readPickedPhotosFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  +[NTKPhotosReader readerForResourceDirectory:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 localIdentifier];
        id v10 = objc_opt_new();
        [v10 setPhoto:v8];
        [v10 setSubsampleFactor:1];
        [(NSMutableDictionary *)self->_pickedPhotos setObject:v10 forKeyedSubscript:v9];
        [(NSMutableArray *)self->_orderList addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_fetchAssetsForPickedPhotos
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_pickedPhotos allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v37 + 1) + 8 * i) photo];
        id v10 = [v9 localIdentifier];

        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v6);
  }

  unint64_t v11 = NTKPHAssetsForLocalIdentifiers(v3);
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        double v19 = [v18 localIdentifier];
        [v12 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v15);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = [(NSMutableDictionary *)self->_pickedPhotos allValues];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        double v25 = *(void **)(*((void *)&v29 + 1) + 8 * k);
        double v26 = [v25 photo];
        double v27 = [v26 localIdentifier];

        if (v27)
        {
          double v28 = [v12 objectForKeyedSubscript:v27];
          [v25 setAsset:v28];
          [v25 setSubsampleFactor:_subsampleFactorForAsset(v28)];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v22);
  }
}

- (id)_fetchAssetsForNewPhotos:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x1E4FB2A30];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v10), "objectForKeyedSubscript:", v9, (void)v20);
        long long v12 = v11;
        if (v11)
        {
          id v13 = [v11 localIdentifier];
          [v4 addObject:v13];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v14 = NTKPHAssetsForLocalIdentifiers(v4);
  uint64_t v15 = [v14 count];
  if (v15 != [v4 count])
  {
    uint64_t v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(NTKCompanionCustomPhotosEditor *)v14 _fetchAssetsForNewPhotos:v16];
    }
  }
  if (objc_msgSend(v14, "count", (void)v20)) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (id)_copyOrTranscodePhotosTo:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = (id)objc_opt_new();
  orderList = self->_orderList;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__NTKCompanionCustomPhotosEditor__copyOrTranscodePhotosTo___block_invoke;
  v9[3] = &unk_1E62C2358;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [(NSMutableArray *)orderList enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__NTKCompanionCustomPhotosEditor__copyOrTranscodePhotosTo___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  id v6 = objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:");
  if (v6)
  {
    id v7 = objc_opt_class();
    uint64_t v8 = [v6 photo];
    uint64_t v9 = [v7 _linkPhoto:v8 to:a1[5] previewOnly:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v17];
  if (v10)
  {
    unint64_t v11 = objc_opt_class();
    uint64_t v12 = [v10 asset];
    [v10 crop];
    uint64_t v13 = objc_msgSend(v11, "_transcodeAsset:withCrop:into:previewOnly:", v12, a1[5], 0);

    uint64_t v9 = (void *)v13;
  }
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  if (v9)
  {
    uint64_t v16 = [v9 encodeAsDictionary];
    [v15 addObject:v16];
  }
  else
  {
    *(void *)(v14 + 40) = 0;

    *a4 = 1;
  }
}

- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  double v27 = (NSMutableDictionary *)objc_opt_new();
  id v7 = (NSMutableArray *)objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = +[NTKPhoto decodeFromDictionary:*(void *)(*((void *)&v29 + 1) + 8 * v11) forResourceDirectory:v28];
        uint64_t v13 = [v12 localIdentifier];
        uint64_t v14 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v13];

        if (v14)
        {
          uint64_t v15 = [(NSMutableDictionary *)self->_pickedPhotos objectForKeyedSubscript:v13];
          uint64_t v14 = [v15 asset];
        }
        uint64_t v16 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v13];

        if (v16)
        {
          id v17 = [(NSMutableDictionary *)self->_newPhotos objectForKeyedSubscript:v13];
          uint64_t v18 = [v17 asset];

          uint64_t v14 = (void *)v18;
        }
        double v19 = objc_opt_new();
        [v19 setPhoto:v12];
        [v19 setAsset:v14];
        [v19 setSubsampleFactor:_subsampleFactorForAsset(v14)];
        [(NSMutableDictionary *)v27 setObject:v19 forKeyedSubscript:v13];
        [(NSMutableArray *)v7 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  orderList = self->_orderList;
  self->_orderList = v7;
  long long v21 = v7;

  pickedPhotos = self->_pickedPhotos;
  self->_pickedPhotos = v27;
  long long v23 = v27;

  double v24 = (NSMutableDictionary *)objc_opt_new();
  newPhotos = self->_newPhotos;
  self->_newPhotos = v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledImageCache, 0);
  objc_storeStrong((id *)&self->_orderList, 0);
  objc_storeStrong((id *)&self->_newPhotos, 0);

  objc_storeStrong((id *)&self->_pickedPhotos, 0);
}

- (void)_fetchAssetsForNewPhotos:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "_fetchAssetsForNewPhotos: could only retrieve %ld assets for %ld local identifiers", (uint8_t *)&v5, 0x16u);
}

@end