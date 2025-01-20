@interface NTKCompanionTransientCustomPhotosEditor
- (BOOL)addAssetsFromAssetList:(id)a3;
- (BOOL)addImageList:(id)a3;
- (BOOL)addPhotosFromUIImagePicker:(id)a3;
- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3;
- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3;
- (BOOL)setOriginalCrop:(CGRect)a3 forPhotoAtIndex:(int64_t)a4;
- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3;
- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3;
- (NTKCompanionTransientCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (id)_writeTransientPhotosInto:(id)a3;
- (int64_t)photosCount;
- (void)deletePhotoAtIndex:(int64_t)a3;
- (void)finalizeWithCompletion:(id)a3;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
@end

@implementation NTKCompanionTransientCustomPhotosEditor

- (NTKCompanionTransientCustomPhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionTransientCustomPhotosEditor;
  v4 = [(NTKCompanionCustomPhotosEditor *)&v8 initWithResourceDirectory:0 forDevice:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    photos = v4->_photos;
    v4->_photos = (NSMutableArray *)v5;

    v4->_previewIsValid = 0;
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
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for TransientCustomPhotosEditor", buf, 2u);
  }

  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__26;
  v24 = __Block_byref_object_dispose__26;
  id v25 = 0;
  int64_t v6 = [(NTKCompanionResourceDirectoryEditor *)self state];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62C21F0;
  v18 = buf;
  int64_t v19 = v6;
  aBlock[4] = self;
  id v7 = v4;
  id v17 = v7;
  objc_super v8 = _Block_copy(aBlock);
  if ([(NTKCompanionResourceDirectoryEditor *)self state] >= 2
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2)
  {
    if (!self->_previewIsValid)
    {
      [(NTKCompanionResourceDirectoryEditor *)self setState:3];
      v12 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3;
      block[3] = &unk_1E62C2218;
      v15 = buf;
      block[4] = self;
      id v14 = v8;
      dispatch_async(v12, block);

      goto LABEL_7;
    }
    uint64_t v10 = [(NTKCompanionResourceDirectoryEditor *)self galleryPreviewResourceDirectory];
    v11 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v10;

    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  (*((void (**)(void *, uint64_t))v8 + 2))(v8, v9);
LABEL_7:

  _Block_object_dispose(buf, 8);
}

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1, char a2)
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
  block[2] = __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2;
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

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = *(unsigned char *)(a1 + 64);
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) galleryPreviewResourceDirectory];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __97__NTKCompanionTransientCustomPhotosEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke_3(void *a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NTKPhotosCreateResourceDirectory();
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 88) firstObject];
    if (v5)
    {
      [(id)objc_opt_class() _watchPhotoImageSize];
      double v7 = v6;
      double v9 = v8;
      long long v10 = objc_opt_class();
      v11 = [v5 image];
      [v5 originalCrop];
      long long v12 = objc_msgSend(v10, "_cropAndScaleUIImage:cropRect:outputSize:", v11);

      uint64_t v13 = objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", 0, v12, *(void *)(*(void *)(a1[6] + 8) + 40), 0.0, 0.0, v7, v9);
      char v14 = v13;
      if (v13)
      {
        v15 = [v13 encodeAsDictionary];
        v18[0] = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

        NTKPhotosWriteImageList(v16, *(void **)(*(void *)(a1[6] + 8) + 40));
        (*(void (**)(void))(a1[5] + 16))();
      }
      else
      {
        (*(void (**)(void))(a1[5] + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
  else
  {
    id v17 = *(void (**)(void))(a1[5] + 16);
    v17();
  }
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state] >= 2
    && [(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    [(NTKCompanionResourceDirectoryEditor *)self setState:4];
    double v7 = dispatch_get_global_queue(2, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_2;
    v9[3] = &unk_1E62C2290;
    v9[4] = self;
    id v10 = v4;
    id v8 = v4;
    dispatch_async(v7, v9);

    double v6 = v10;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E62C0718;
    id v12 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    double v6 = v12;
  }
}

uint64_t __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = NTKPhotosCreateResourceDirectory();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_3;
  aBlock[3] = &unk_1E62C2268;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = v5;
  double v6 = _Block_copy(aBlock);
  double v7 = (void (**)(void, void))v6;
  if (v3)
  {
    id v8 = [*(id *)(a1 + 32) _writeTransientPhotosInto:v3];
    double v9 = v8;
    if (v8 && NTKPhotosWriteImageList(v8, v3))
    {
      uint64_t v10 = objc_opt_new();
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 88);
      *(void *)(v11 + 88) = v10;

      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    v7[2](v7, v13);
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }
}

void __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = v4;
  if (a2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (v4)
    {
      double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 removeItemAtPath:v5 error:0];

      id v5 = 0;
    }
    uint64_t v6 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_4;
  v10[3] = &unk_1E62C2240;
  uint64_t v13 = v6;
  id v8 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __66__NTKCompanionTransientCustomPhotosEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setResourceDirectory:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (int64_t)photosCount
{
  return [(NSMutableArray *)self->_photos count];
}

- (BOOL)addPhotosFromUIImagePicker:(id)a3
{
  return 0;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  return 0;
}

- (BOOL)addImageList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2
    && (int64_t v5 = [(NTKCompanionTransientCustomPhotosEditor *)self photosCount],
        (unint64_t)([(NSMutableArray *)self->_photos count] + v5) <= 0x18))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          char v14 = objc_opt_new();
          [v14 setImage:v13];
          id v15 = [v14 image];
          uint64_t v16 = [(NTKCompanionResourceDirectoryEditor *)self device];
          NTKPhotosDefaultCropForImage(v15, v16);
          objc_msgSend(v14, "setOriginalCrop:");

          [(NSMutableArray *)self->_photos addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(NTKCompanionResourceDirectoryEditor *)self setState:2];
    self->_previewIsValid = 0;
    BOOL v6 = 1;
    id v4 = v17;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(NTKCompanionResourceDirectoryEditor *)self state])
  {
    uint64_t v5 = [(NTKCompanionResourceDirectoryEditor *)self state];
    if ((a3 & 0x8000000000000000) == 0
      && v5 <= 2
      && [(NSMutableArray *)self->_photos count] > (unint64_t)a3)
    {
      [(NSMutableArray *)self->_photos removeObjectAtIndex:a3];
      BOOL v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        int64_t v8 = a3;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "deletePhotoAtIndex: deleting image at index %ld", (uint8_t *)&v7, 0xCu);
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
      unint64_t v8 = [(NSMutableArray *)self->_photos count];
      if ((a4 & 0x8000000000000000) == 0
        && v8 > a3
        && [(NSMutableArray *)self->_photos count] > (unint64_t)a4)
      {
        uint64_t v9 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
        uint64_t v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 134218240;
          int64_t v15 = a3;
          __int16 v16 = 2048;
          int64_t v17 = a4;
          _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v14, 0x16u);
        }

        [(NSMutableArray *)self->_photos removeObjectAtIndex:a3];
        [(NSMutableArray *)self->_photos insertObject:v9 atIndex:a4];
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
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v10 = [(NTKCompanionResourceDirectoryEditor *)self state];
  if (v10)
  {
    uint64_t v11 = [(NTKCompanionResourceDirectoryEditor *)self state];
    LOBYTE(v10) = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 <= 2)
    {
      if ([(NSMutableArray *)self->_photos count] <= (unint64_t)a4)
      {
        LOBYTE(v10) = 0;
      }
      else
      {
        id v12 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a4];
        [v12 originalCrop];
        if ((CLKRectEqualsRect() & 1) == 0)
        {
          objc_msgSend(v12, "setOriginalCrop:", x, y, width, height);
          if (self->_previewIsValid) {
            self->_previewIsValid = a4 != 0;
          }
          [(NTKCompanionResourceDirectoryEditor *)self setState:2];
        }

        LOBYTE(v10) = 1;
      }
    }
  }
  return v10;
}

- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3
{
  return 1;
}

- (BOOL)isPhotoInPhotoLibraryAtIndex:(int64_t)a3
{
  return 0;
}

- (void)imageAndCropForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || [(NSMutableArray *)self->_photos count] <= (unint64_t)a3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke;
    v14[3] = &unk_1E62C0718;
    id v15 = v6;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v14);
    id v8 = v15;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2;
    block[3] = &unk_1E62C0AE8;
    id v12 = v7;
    id v13 = v6;
    id v8 = v7;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

void __82__NTKCompanionTransientCustomPhotosEditor_imageAndCropForPhotoAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) image];
  [*(id *)(a1 + 32) originalCrop];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)imageInPhotoLibraryForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NTKCompanionTransientCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke;
  block[3] = &unk_1E62C0718;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__NTKCompanionTransientCustomPhotosEditor_imageInPhotoLibraryForPhotoAtIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGRect)originalCropForPhotoAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSMutableArray *)self->_photos count] <= (unint64_t)a3)
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
    [v5 originalCrop];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
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
    if ([(NSMutableArray *)self->_photos count] > (unint64_t)a3)
    {
      double v7 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
      double v8 = [v7 image];

      [v8 size];
      double v10 = v9;
      [v8 scale];
      double v12 = v10 * v11;
      [v8 size];
      double v14 = v13;
      [v8 scale];
      double v16 = v14 * v15;
      [(id)objc_opt_class() _watchPhotoImageSize];
      double v18 = v17 / v12;
      double v20 = v19 / v16;
      if (v18 <= 1.0) {
        double v6 = v18;
      }
      else {
        double v6 = 1.0;
      }
      if (v20 <= 1.0) {
        double v3 = v20;
      }
      else {
        double v3 = 1.0;
      }
    }
  }
  double v21 = v6;
  double v22 = v3;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (id)_writeTransientPhotosInto:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_photos;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v11 = (void *)MEMORY[0x1C1875BE0]();
        [(id)objc_opt_class() _watchPhotoImageSize];
        double v13 = v12;
        double v15 = v14;
        double v16 = objc_opt_class();
        double v17 = [v10 image];
        [v10 originalCrop];
        double v18 = objc_msgSend(v16, "_cropAndScaleUIImage:cropRect:outputSize:", v17);

        double v19 = objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", 0, v18, v4, 0.0, 0.0, v13, v15);
        if (!v19)
        {

          id v5 = 0;
          goto LABEL_11;
        }
        double v20 = v19;
        double v21 = [v19 encodeAsDictionary];
        [v5 addObject:v21];
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void).cxx_destruct
{
}

@end