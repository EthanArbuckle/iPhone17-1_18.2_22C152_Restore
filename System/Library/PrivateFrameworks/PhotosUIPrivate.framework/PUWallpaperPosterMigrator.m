@interface PUWallpaperPosterMigrator
- (NSURL)assetDirectory;
- (OS_dispatch_queue)queue;
- (PUWallpaperPosterMigrator)initWithAssetDirectory:(id)a3 configurationType:(unint64_t)a4;
- (unint64_t)configurationType;
- (void)_handleLoadedConfiguration:(id)a3 scale:(double)a4 completionBlock:(id)a5;
- (void)_handleSegmentationItem:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 options:(id)a6 error:(id)a7 completionBlock:(id)a8;
- (void)attemptMigrationWithCompletionBlock:(id)a3;
@end

@implementation PUWallpaperPosterMigrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (void)_handleSegmentationItem:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 options:(id)a6 error:(id)a7 completionBlock:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if (v12)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v12];
    [v16 setResponseQueue:MEMORY[0x1E4F14428]];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
    [v16 setPriority:v17];

    if (PFPosterWantsLowLuminanceContent())
    {
      if ([(PUWallpaperPosterMigrator *)self configurationType] == 1) {
        uint64_t v18 = 71;
      }
      else {
        uint64_t v18 = 67;
      }
    }
    else
    {
      uint64_t v18 = 67;
    }
    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
      uint64_t v20 = v18 | 0x20;
    }
    else {
      uint64_t v20 = v18;
    }
    [v16 setLayerStackOptions:v20];
    if ([v13 supportsCropping])
    {
      [v13 cropRect];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
    }
    else
    {
      CGFloat v22 = *MEMORY[0x1E4F1DB28];
      CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    v62.origin.x = v22;
    v62.origin.y = v24;
    v62.size.width = v26;
    v62.size.height = v28;
    if (!CGRectIsEmpty(v62))
    {
      v63.origin.x = v22;
      v63.origin.y = v24;
      v63.size.width = v26;
      v63.size.height = v28;
      if (!CGRectIsInfinite(v63))
      {
        PXRectScale();
        double v30 = v29;
        double v32 = v31;
        PXRectWithOriginAndSize();
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        PXRectFlippedVertically();
        v66.origin.x = v34;
        v66.origin.y = v36;
        v66.size.width = v38;
        v66.size.height = v40;
        CGRect v65 = CGRectIntersection(v64, v66);
        double v41 = vabdd_f64(v65.size.height, v32);
        if (vabdd_f64(v65.size.width, v30) < 1.0 && v41 < 1.0)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke;
          aBlock[3] = &__block_descriptor_64_e56___PFPosterOrientedLayout_16__0__PFPosterOrientedLayout_8l;
          CGRect v58 = v65;
          v43 = _Block_copy(aBlock);
          v44 = [v12 originalLayout];
          id v49 = objc_alloc(MEMORY[0x1E4F8CD10]);
          v52 = v44;
          v50 = [v44 portraitLayout];
          v51 = v43;
          v45 = (*((void (**)(void *, void *))v43 + 2))(v43, v50);
          v46 = [v44 landscapeLayout];
          v47 = (*((void (**)(void *, void *))v43 + 2))(v43, v46);
          v48 = (void *)[v49 initWithPortraitLayout:v45 landscapeLayout:v47];
          [v16 setLayout:v48];

          [v16 setUpdateClockZPosition:1];
        }
      }
    }
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke_2;
    v53[3] = &unk_1E5F288F0;
    id v54 = v13;
    id v56 = v15;
    id v55 = v12;
    [v16 submit:v53];
  }
  else
  {
    v19 = PLWallpaperGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v60 = v14;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Loading segmentation item failed during migration: %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v14);
  }
}

id __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 deviceResolution];
  PXSizeGetAspectRatio();
  PXRectWithAspectRatioFittingRect();
  v3 = objc_msgSend(v2, "layoutByUpdatingVisibleFrame:");

  return v3;
}

void __99__PUWallpaperPosterMigrator__handleSegmentationItem_imageSize_scale_options_error_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [a2 result:&v9];
  id v4 = v9;
  v5 = PLWallpaperGetLog();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 statistics];
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation stats: %{public}@", buf, 0xCu);
    }
    v6 = [v3 compoundLayerStack];
    v8 = -[NSObject compoundLayerStackByUpdatingParallaxDisabled:](v6, "compoundLayerStackByUpdatingParallaxDisabled:", [*(id *)(a1 + 32) parallaxEnabled] ^ 1);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Segmentation failed during migration: %{public}@", buf, 0xCu);
    }
    v8 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_handleLoadedConfiguration:(id)a3 scale:(double)a4 completionBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 wallpaperOriginalImage];
  id v11 = (CGImage *)[v10 CGImage];

  size_t Width = CGImageGetWidth(v11);
  size_t Height = CGImageGetHeight(v11);
  if (v11 && (double v14 = (double)Width, v15 = (double)Height, (PXSizeIsEmpty() & 1) == 0))
  {
    v17 = [[PUWallpaperPosterLegacyAsset alloc] initWithProxyImage:v11];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v17];
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__PUWallpaperPosterMigrator__handleLoadedConfiguration_scale_completionBlock___block_invoke;
    v19[3] = &unk_1E5F288A8;
    objc_copyWeak(v22, (id *)buf);
    v22[1] = *(id *)&v14;
    v22[2] = *(id *)&v15;
    v22[3] = *(id *)&a4;
    id v20 = v8;
    id v21 = v9;
    [v18 loadSegmentationItemWithCompletion:v19];

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Failed to load original image during poster migration: %{public}@", buf, 0xCu);
    }

    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUWallpaperPosterErrorDomain" code:-111 userInfo:0];
    (*((void (**)(id, void, void, PUWallpaperPosterLegacyAsset *))v9 + 2))(v9, 0, 0, v17);
  }
}

void __78__PUWallpaperPosterMigrator__handleLoadedConfiguration_scale_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  double v8 = *(double *)(a1 + 72);
  id v9 = [*(id *)(a1 + 32) wallpaperOptions];
  objc_msgSend(WeakRetained, "_handleSegmentationItem:imageSize:scale:options:error:completionBlock:", v7, v9, v6, *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), v8);
}

- (void)attemptMigrationWithCompletionBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(PUWallpaperPosterMigrator *)self configurationType];
  objc_initWeak(&location, self);
  id v7 = [(PUWallpaperPosterMigrator *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PUWallpaperPosterMigrator_attemptMigrationWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E5F28880;
  v11[1] = (id)a2;
  v11[2] = v6;
  v9[4] = self;
  objc_copyWeak(v11, &location);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __65__PUWallpaperPosterMigrator_attemptMigrationWithCompletionBlock___block_invoke(uint64_t a1)
{
  if (!dlopen((const char *)[@"/System/Library/PrivateFrameworks/PaperBoardUI.framework/PaperBoardUI" fileSystemRepresentation], 4))
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PUWallpaperPosterMigrator.m" lineNumber:95 description:@"No PaperBoardUI!"];
  }
  id v2 = objc_alloc_init(NSClassFromString(&cfstr_Pbuiwallpaperc.isa));
  uint64_t v3 = *(void *)(a1 + 64);
  id v9 = v2;
  switch(v3)
  {
    case 1:
      uint64_t v5 = [v2 lockScreenWallpaperConfigurationIncludingValuesForTypes:18];
LABEL_9:
      id v4 = (void *)v5;
      goto LABEL_10;
    case 2:
      uint64_t v5 = [v2 homeScreenWallpaperConfigurationIncludingValuesForTypes:18];
      goto LABEL_9;
    case 0:
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PUWallpaperPosterMigrator.m" lineNumber:107 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  id v4 = 0;
LABEL_10:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v9 wallpaperScale];
  objc_msgSend(WeakRetained, "_handleLoadedConfiguration:scale:completionBlock:", v4, *(void *)(a1 + 40));
}

- (PUWallpaperPosterMigrator)initWithAssetDirectory:(id)a3 configurationType:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUWallpaperPosterMigrator;
  id v8 = [(PUWallpaperPosterMigrator *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assetDirectory, a3);
    v9->_configurationType = a4;
    id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.poster-migration", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;
  }
  return v9;
}

@end