@interface VUIVideoAdvisoryLogoImageDownloader
- (TVImageProxy)highMotionWarningImageProxy;
- (TVImageProxy)photoSensitivityImageProxy;
- (TVImageProxy)ratingImageProxy;
- (void)cleanupImageProxies;
- (void)downloadImageWithURL:(id)a3 imageInfo:(id)a4 completion:(id)a5;
- (void)downloadImagesWithAdvisoryImageInfo:(id)a3 photoSensitivityImageInfo:(id)a4 highMotionWarningImageInfo:(id)a5 completion:(id)a6;
- (void)setHighMotionWarningImageProxy:(id)a3;
- (void)setPhotoSensitivityImageProxy:(id)a3;
- (void)setRatingImageProxy:(id)a3;
@end

@implementation VUIVideoAdvisoryLogoImageDownloader

- (void)downloadImageWithURL:(id)a3 imageInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    double v11 = (double)(unint64_t)[v9 width];
    double v12 = (double)(unint64_t)[v9 height];
    id v13 = objc_alloc(MEMORY[0x1E4FA9CC0]);
    v14 = [v9 format];
    v15 = objc_msgSend(v13, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v8, 0, v14, v11, v12, 0.0);

    v16 = [MEMORY[0x1E4FA9CD0] imageURLWithDescription:v15];
    id v17 = objc_alloc(MEMORY[0x1E4FA9CA0]);
    v18 = [MEMORY[0x1E4FA9CC8] sharedInstance];
    v19 = (void *)[v17 initWithObject:v16 imageLoader:v18 groupType:0];

    if (v19)
    {
      v20 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];

      if (v20)
      {
        v21 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
        if ([v21 isEqual:v19])
        {
          v22 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
          char v23 = [v22 isLoading];

          if (v23) {
            goto LABEL_10;
          }
        }
        else
        {
        }
        v24 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
        [v24 cancel];

        v25 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
        [v25 setCompletionHandler:0];

        [(VUIVideoAdvisoryLogoImageDownloader *)self setRatingImageProxy:0];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke;
      v26[3] = &unk_1E6DF89E0;
      id v27 = v10;
      [v19 setCompletionHandler:v26];
      [(VUIVideoAdvisoryLogoImageDownloader *)self setRatingImageProxy:v19];
      [v19 load];
    }
LABEL_10:
  }
}

void __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  v7 = [v6 uiImage];

  if (v7 && a4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v9 = __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke_2;
    id v10 = &unk_1E6DF41E8;
    id v12 = *(id *)(a1 + 32);
    id v11 = v6;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v8[0], 3221225472)) {
      v9((uint64_t)v8);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
  }
}

void __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) uiImage];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)downloadImagesWithAdvisoryImageInfo:(id)a3 photoSensitivityImageInfo:(id)a4 highMotionWarningImageInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v33 = a6;
  dispatch_group_t v12 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__13;
  v55[4] = __Block_byref_object_dispose__13;
  id v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__13;
  v53[4] = __Block_byref_object_dispose__13;
  id v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__13;
  v51[4] = __Block_byref_object_dispose__13;
  id v52 = 0;
  uint64_t v13 = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke((uint64_t)v12, v10);
  v14 = (void *)v13;
  if (v13)
  {
    v15 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];

    if (v15)
    {
      v16 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
      if ([v16 isEqual:v14])
      {
        id v17 = [(VUIVideoAdvisoryLogoImageDownloader *)self ratingImageProxy];
        char v18 = [v17 isLoading];

        if (v18) {
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_33;
    v48[3] = &unk_1E6DF8CF8;
    v19 = v12;
    v49 = v19;
    v50 = v55;
    [v14 setCompletionHandler:v48];
    [(VUIVideoAdvisoryLogoImageDownloader *)self setRatingImageProxy:v14];
    dispatch_group_enter(v19);
    [v14 load];
  }
  uint64_t v20 = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(v13, v11);
  v21 = (void *)v20;
  if (v20)
  {
    v22 = [(VUIVideoAdvisoryLogoImageDownloader *)self photoSensitivityImageProxy];

    if (v22)
    {
      char v23 = [(VUIVideoAdvisoryLogoImageDownloader *)self photoSensitivityImageProxy];
      if ([v23 isEqual:v21])
      {
        v24 = [(VUIVideoAdvisoryLogoImageDownloader *)self photoSensitivityImageProxy];
        char v25 = [v24 isLoading];

        if (v25) {
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_2;
    v45[3] = &unk_1E6DF8CF8;
    v26 = v12;
    v46 = v26;
    v47 = v53;
    [v21 setCompletionHandler:v45];
    [(VUIVideoAdvisoryLogoImageDownloader *)self setPhotoSensitivityImageProxy:v21];
    dispatch_group_enter(v26);
    [v21 load];
  }
  id v27 = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(v20, v34);
  if (v27)
  {
    v28 = [(VUIVideoAdvisoryLogoImageDownloader *)self highMotionWarningImageProxy];

    if (v28)
    {
      v29 = [(VUIVideoAdvisoryLogoImageDownloader *)self highMotionWarningImageProxy];
      if ([v29 isEqual:v21])
      {
        v30 = [(VUIVideoAdvisoryLogoImageDownloader *)self highMotionWarningImageProxy];
        char v31 = [v30 isLoading];

        if (v31) {
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_3;
    v42[3] = &unk_1E6DF8CF8;
    v32 = v12;
    v43 = v32;
    v44 = v51;
    [v27 setCompletionHandler:v42];
    [(VUIVideoAdvisoryLogoImageDownloader *)self setHighMotionWarningImageProxy:v27];
    dispatch_group_enter(v32);
    [v27 load];
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_4;
  block[3] = &unk_1E6DF8D20;
  objc_copyWeak(&v40, &location);
  id v36 = v33;
  v37 = v55;
  v38 = v53;
  v39 = v51;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
LABEL_23:

LABEL_24:
LABEL_25:

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v55, 8);
}

id __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 imageURL];
  if ([v3 length])
  {
    double v4 = (double)(unint64_t)[v2 width];
    double v5 = (double)(unint64_t)[v2 height];
    id v6 = objc_alloc(MEMORY[0x1E4FA9CC0]);
    v7 = [v2 format];
    id v8 = objc_msgSend(v6, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v3, 0, v7, v4, v5, 0.0);

    id v9 = [MEMORY[0x1E4FA9CD0] imageURLWithDescription:v8];
    id v10 = objc_alloc(MEMORY[0x1E4FA9CA0]);
    id v11 = [MEMORY[0x1E4FA9CC8] sharedInstance];
    dispatch_group_t v12 = (void *)[v10 initWithObject:v9 imageLoader:v11 groupType:0];
  }
  else
  {
    dispatch_group_t v12 = 0;
  }

  return v12;
}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_33(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = [v8 uiImage];

  if (v7 && a4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = [v8 uiImage];

  if (v7 && a4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = [v8 uiImage];

  if (v7 && a4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained cleanupImageProxies];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) uiImage];
    double v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uiImage];
    double v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uiImage];
    (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);
  }
}

- (void)cleanupImageProxies
{
  [(VUIVideoAdvisoryLogoImageDownloader *)self setRatingImageProxy:0];
  [(VUIVideoAdvisoryLogoImageDownloader *)self setPhotoSensitivityImageProxy:0];
  [(VUIVideoAdvisoryLogoImageDownloader *)self setHighMotionWarningImageProxy:0];
}

- (TVImageProxy)ratingImageProxy
{
  return self->_ratingImageProxy;
}

- (void)setRatingImageProxy:(id)a3
{
}

- (TVImageProxy)photoSensitivityImageProxy
{
  return self->_photoSensitivityImageProxy;
}

- (void)setPhotoSensitivityImageProxy:(id)a3
{
}

- (TVImageProxy)highMotionWarningImageProxy
{
  return self->_highMotionWarningImageProxy;
}

- (void)setHighMotionWarningImageProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highMotionWarningImageProxy, 0);
  objc_storeStrong((id *)&self->_photoSensitivityImageProxy, 0);
  objc_storeStrong((id *)&self->_ratingImageProxy, 0);
}

@end