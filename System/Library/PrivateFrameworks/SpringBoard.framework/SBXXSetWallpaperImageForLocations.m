@interface SBXXSetWallpaperImageForLocations
@end

@implementation SBXXSetWallpaperImageForLocations

void ___SBXXSetWallpaperImageForLocations_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[SBWallpaperController sharedInstance];
  v3 = [v2 wallpaperConfigurationManager];

  v4 = [NSString stringWithUTF8String:*(void *)(a1 + 40)];
  double v5 = *(float *)(a1 + 72);
  double v6 = *(float *)(a1 + 76);
  double v7 = *(float *)(a1 + 80);
  double v8 = *(float *)(a1 + 84);
  double v17 = v5;
  double v18 = v6;
  double v19 = v7;
  double v20 = v8;
  double v9 = *(float *)(a1 + 88);
  double v16 = v9;
  if (*(void *)(a1 + 48) && *(_DWORD *)(a1 + 92))
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*(void *)(a1 + 48) length:*(unsigned int *)(a1 + 92) freeWhenDone:0];
    v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v24.origin.x = v5;
  v24.origin.y = v6;
  v24.size.width = v7;
  v24.size.height = v8;
  if (CGRectIsEmpty(v24) && *(float *)(a1 + 96) != 0.0 && BSFloatIsOne() && !*(unsigned char *)(a1 + 100) && !v4)
  {
    [*(id *)(a1 + 32) size];
    double v17 = 0.0;
    double v18 = 0.0;
    double v19 = v12;
    double v20 = v13;
    objc_msgSend(v3, "getBestCropRect:zoomScale:forImageSize:portrait:parallaxFactor:", &v17, &v16, *(unsigned char *)(a1 + 101) != 0);
    double v9 = v16;
    double v5 = v17;
    double v6 = v18;
    double v7 = v19;
    double v8 = v20;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F83C10], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v4, *(unsigned char *)(a1 + 102) != 0, *(unsigned char *)(a1 + 101) != 0, *(unsigned char *)(a1 + 100) != 0, *(unsigned __int8 *)(a1 + 103), *(unsigned __int8 *)(a1 + 104), *(float *)(a1 + 96), v9, v5, v6, v7, v8, *(double *)(a1 + 56), v11);
  v15 = SBLogWallpaper();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v14;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
  }

  **(unsigned char **)(a1 + 64) = [v3 setWallpaperImage:*(void *)(a1 + 32) adjustedImage:0 thumbnailData:0 imageHashData:0 wallpaperOptions:v14 forVariants:*(unsigned __int8 *)(a1 + 105) wallpaperMode:*(unsigned __int8 *)(a1 + 106)];
}

@end