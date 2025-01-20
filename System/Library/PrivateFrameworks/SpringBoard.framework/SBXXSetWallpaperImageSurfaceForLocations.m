@interface SBXXSetWallpaperImageSurfaceForLocations
@end

@implementation SBXXSetWallpaperImageSurfaceForLocations

void ___SBXXSetWallpaperImageSurfaceForLocations_block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithMachPort:*(unsigned int *)(a1 + 80)];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithMachPort:*(unsigned int *)(a1 + 84)];
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(a1 + 32) length:*(unsigned int *)(a1 + 88) freeWhenDone:0];
  v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)(a1 + 40) length:*(unsigned int *)(a1 + 92) freeWhenDone:0];
  if (!v2)
  {
    v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_22;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageWithIOSurface:scale:orientation:", v2, 0, SBScreenScale());
  if (!v3) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageWithIOSurface:scale:orientation:", v3, 0, SBScreenScale());
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = +[SBWallpaperController sharedInstance];
    v26 = [v9 wallpaperConfigurationManager];

    uint64_t v10 = [NSString stringWithUTF8String:*(void *)(a1 + 48)];
    v11 = (void *)v10;
    double v12 = *(float *)(a1 + 96);
    double v13 = *(float *)(a1 + 100);
    double v14 = *(float *)(a1 + 104);
    double v15 = *(float *)(a1 + 108);
    double v28 = v12;
    double v29 = v13;
    double v30 = v14;
    double v31 = v15;
    double v16 = *(float *)(a1 + 112);
    double v27 = v16;
    if (*(void *)(a1 + 56) && *(_DWORD *)(a1 + 116))
    {
      uint64_t v17 = v10;
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*(void *)(a1 + 56) length:*(unsigned int *)(a1 + 116) freeWhenDone:0];
      v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:0 error:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }

      v11 = (void *)v17;
    }
    else
    {
      v19 = 0;
    }
    v35.origin.x = v12;
    v35.origin.y = v13;
    v35.size.width = v14;
    v35.size.height = v15;
    if (CGRectIsEmpty(v35)
      && *(float *)(a1 + 120) != 0.0
      && BSFloatIsOne()
      && !*(unsigned char *)(a1 + 124)
      && !v11)
    {
      [v6 size];
      double v28 = 0.0;
      double v29 = 0.0;
      double v30 = v20;
      double v31 = v21;
      objc_msgSend(v26, "getBestCropRect:zoomScale:forImageSize:portrait:parallaxFactor:", &v28, &v27, *(unsigned char *)(a1 + 125) != 0);
      double v16 = v27;
      double v12 = v28;
      double v13 = v29;
      double v14 = v30;
      double v15 = v31;
    }
    v25 = v19;
    v22 = v11;
    v23 = objc_msgSend(MEMORY[0x1E4F83C10], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v11, *(unsigned char *)(a1 + 126) != 0, *(unsigned char *)(a1 + 125) != 0, *(unsigned char *)(a1 + 124) != 0, *(unsigned __int8 *)(a1 + 127), *(unsigned __int8 *)(a1 + 128), *(float *)(a1 + 120), v16, v12, v13, v14, v15, *(double *)(a1 + 64), v19);
    v24 = SBLogWallpaper();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
    }

    **(unsigned char **)(a1 + 72) = [v26 setWallpaperImage:v6 adjustedImage:v8 thumbnailData:v4 imageHashData:v5 wallpaperOptions:v23 forVariants:*(unsigned __int8 *)(a1 + 129) wallpaperMode:*(unsigned __int8 *)(a1 + 130)];
  }
LABEL_22:
}

void ___SBXXSetWallpaperImageSurfaceForLocations_block_invoke_158(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

@end