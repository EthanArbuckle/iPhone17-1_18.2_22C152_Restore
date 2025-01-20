@interface NTKCompanionKaleidoscopeEditor
+ (id)_fetchAssetForPhoto:(id)a3;
- (NTKCompanionKaleidoscopeEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (int64_t)photosCount;
- (void)_readPickedPhoto;
- (void)_reinitializeWithPhoto:(id)a3 image:(id)a4;
- (void)finalizeWithCompletion:(id)a3;
- (void)imageForPhotoWithCompletion:(id)a3;
- (void)setAsset:(id)a3 completion:(id)a4;
- (void)setPhoto:(id)a3 completion:(id)a4;
- (void)setRawImage:(id)a3 completion:(id)a4;
@end

@implementation NTKCompanionKaleidoscopeEditor

- (NTKCompanionKaleidoscopeEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionKaleidoscopeEditor;
  v4 = [(NTKCompanionResourceDirectoryEditor *)&v8 initWithResourceDirectory:a3 forDevice:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(NTKCompanionResourceDirectoryEditor *)v4 resourceDirectory];

    if (v6) {
      [(NTKCompanionKaleidoscopeEditor *)v5 _readPickedPhoto];
    }
    [(NTKCompanionResourceDirectoryEditor *)v5 setState:1];
  }
  return v5;
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    if ([(NTKCompanionResourceDirectoryEditor *)self state] == 1)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_2;
      v13[3] = &unk_1E62C2290;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v13);
      v5 = v14;
    }
    else if (self->_newAsset || self->_newImage)
    {
      [(NTKCompanionResourceDirectoryEditor *)self setState:4];
      v6 = dispatch_get_global_queue(2, 0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_4;
      v9[3] = &unk_1E62C2290;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(v6, v9);

      v5 = v10;
    }
    else
    {
      pickedPhoto = self->_pickedPhoto;
      self->_pickedPhoto = 0;

      pickedImage = self->_pickedImage;
      self->_pickedImage = 0;

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_3;
      v11[3] = &unk_1E62C2290;
      v11[4] = self;
      id v12 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v11);
      v5 = v12;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke;
    block[3] = &unk_1E62C0718;
    id v16 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v5 = v16;
  }
}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resourceDirectory];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:v2];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) resourceDirectory];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setResourceDirectory:0];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:0];
  [*(id *)(a1 + 32) setState:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_4(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = NTKPhotosCreateResourceDirectory();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_5;
  aBlock[3] = &unk_1E62C2268;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = v5;
  v6 = _Block_copy(aBlock);
  v7 = (void (**)(void, void))v6;
  if (v3)
  {
    objc_super v8 = objc_msgSend((id)objc_opt_class(), "_writeAsset:image:withImageCrop:to:", *(void *)(*(void *)(a1 + 32) + 64), *(void *)(*(void *)(a1 + 32) + 72), v3, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    if (v8)
    {
      v9 = +[NTKKaleidoscopePathfinder pathfinderWithImage:*(void *)(*(void *)(a1 + 32) + 72)];
      if (![v9 writeToDirectory:v3]) {
        goto LABEL_7;
      }
      id v10 = [v8 encodeAsDictionary];
      v18[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      int v12 = NTKPhotosWriteImageList(v11, v3);

      if (v12)
      {
        [*(id *)(a1 + 32) _reinitializeWithPhoto:v8 image:*(void *)(*(void *)(a1 + 32) + 72)];
        uint64_t v13 = 1;
      }
      else
      {
LABEL_7:
        uint64_t v13 = 0;
      }
      v7[2](v7, v13);
    }
    else
    {
      v7[2](v7, 0);
    }
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }
}

void __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_5(uint64_t a1, char a2)
{
  id v4 = *(id *)(a1 + 32);
  v5 = v4;
  if (a2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (v4)
    {
      v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 removeItemAtPath:v5 error:0];

      v5 = 0;
    }
    uint64_t v6 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_6;
  v10[3] = &unk_1E62C2240;
  uint64_t v13 = v6;
  objc_super v8 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __57__NTKCompanionKaleidoscopeEditor_finalizeWithCompletion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setResourceDirectory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setGalleryPreviewResourceDirectory:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)setPhoto:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke;
    aBlock[3] = &unk_1E62C3D68;
    void aBlock[4] = self;
    id v17 = v7;
    objc_super v8 = _Block_copy(aBlock);
    if (v6)
    {
      id v9 = [(id)objc_opt_class() _fetchAssetForPhoto:v6];
      newAsset = self->_newAsset;
      self->_newAsset = v9;

      id v11 = self->_newAsset;
      if (v11)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke_2;
        v14[3] = &unk_1E62C3D90;
        v14[4] = self;
        id v15 = v8;
        _imageForAsset(v11, v14);
      }
      else
      {
        (*((void (**)(void *, void))v8 + 2))(v8, 0);
      }
    }
    else
    {
      id v12 = self->_newAsset;
      self->_newAsset = 0;

      newImage = self->_newImage;
      self->_newImage = 0;

      (*((void (**)(void *, uint64_t))v8 + 2))(v8, 2);
    }
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setState:a2];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;

  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

void __54__NTKCompanionKaleidoscopeEditor_setPhoto_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setAsset:(id)a3 completion:(id)a4
{
  id v7 = a3;
  objc_super v8 = (void (**)(void))a4;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] < 3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke;
    aBlock[3] = &unk_1E62C3D68;
    void aBlock[4] = self;
    id v17 = v8;
    id v9 = _Block_copy(aBlock);
    p_newAsset = &self->_newAsset;
    if (v7)
    {
      objc_storeStrong((id *)&self->_newAsset, a3);
      id v11 = *p_newAsset;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke_2;
      v14[3] = &unk_1E62C3D90;
      v14[4] = self;
      id v15 = v9;
      _imageForAsset(v11, v14);
    }
    else
    {
      id v12 = *p_newAsset;
      *p_newAsset = 0;

      newImage = self->_newImage;
      self->_newImage = 0;

      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 2);
    }
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setState:a2];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

void __54__NTKCompanionKaleidoscopeEditor_setAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setRawImage:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(void))a4;
  if ([(NTKCompanionResourceDirectoryEditor *)self state]
    && [(NTKCompanionResourceDirectoryEditor *)self state] <= 2)
  {
    id v7 = [(id)objc_opt_class() _scaleImage:v12 toLongestEdgeInPixels:768.0];
    newImage = self->_newImage;
    self->_newImage = v7;

    newAsset = self->_newAsset;
    self->_newAsset = 0;

    pickedPhoto = self->_pickedPhoto;
    self->_pickedPhoto = 0;

    pickedImage = self->_pickedImage;
    self->_pickedImage = 0;

    [(NTKCompanionResourceDirectoryEditor *)self setState:2];
  }
  v6[2](v6);
}

- (int64_t)photosCount
{
  return self->_newAsset || self->_newImage || self->_pickedPhoto || self->_pickedImage != 0;
}

- (void)imageForPhotoWithCompletion:(id)a3
{
  id v4 = (void (**)(id, UIImage *))a3;
  int64_t v5 = [(NTKCompanionResourceDirectoryEditor *)self state];
  if (v5 == 1)
  {
    pickedImage = self->_pickedImage;
    if (!pickedImage)
    {
      NTKPhotosImageForPhoto(self->_pickedPhoto);
      id v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_super v8 = self->_pickedImage;
      self->_pickedImage = v7;

      pickedImage = self->_pickedImage;
    }
    v4[2](v4, pickedImage);
  }
  else if (v5 == 2 && !self->_newImage)
  {
    newAsset = self->_newAsset;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__NTKCompanionKaleidoscopeEditor_imageForPhotoWithCompletion___block_invoke;
    v10[3] = &unk_1E62C3D90;
    v10[4] = self;
    id v11 = v4;
    _imageForAsset(newAsset, v10);
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __62__NTKCompanionKaleidoscopeEditor_imageForPhotoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_readPickedPhoto
{
  uint64_t v3 = [(NTKCompanionResourceDirectoryEditor *)self resourceDirectory];
  id v6 = +[NTKPhotosReader readerForResourceDirectory:v3];

  id v4 = [v6 firstObject];
  pickedPhoto = self->_pickedPhoto;
  self->_pickedPhoto = v4;
}

+ (id)_fetchAssetForPhoto:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4FB2A30]];
}

- (void)_reinitializeWithPhoto:(id)a3 image:(id)a4
{
  id v6 = (NTKPhoto *)a3;
  id v7 = (UIImage *)a4;
  pickedPhoto = self->_pickedPhoto;
  self->_pickedPhoto = v6;
  id v9 = v6;

  pickedImage = self->_pickedImage;
  self->_pickedImage = v7;
  id v11 = v7;

  newAsset = self->_newAsset;
  self->_newAsset = 0;

  newImage = self->_newImage;
  self->_newImage = 0;

  [(NTKCompanionResourceDirectoryEditor *)self setState:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newImage, 0);
  objc_storeStrong((id *)&self->_newAsset, 0);
  objc_storeStrong((id *)&self->_pickedImage, 0);
  objc_storeStrong((id *)&self->_pickedPhoto, 0);
}

@end