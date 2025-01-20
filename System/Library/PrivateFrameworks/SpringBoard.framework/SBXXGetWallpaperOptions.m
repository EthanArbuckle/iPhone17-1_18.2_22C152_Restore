@interface SBXXGetWallpaperOptions
@end

@implementation SBXXGetWallpaperOptions

void ___SBXXGetWallpaperOptions_block_invoke(uint64_t a1)
{
  v2 = +[SBWallpaperController sharedInstance];
  id v17 = [v2 wallpaperConfigurationManager];

  v3 = [v17 wallpaperConfigurationForVariant:*(unsigned __int8 *)(a1 + 120) includingValuesForTypes:16];
  v4 = [v3 wallpaperOptions];
  uint64_t v5 = [v4 wallpaperKitData];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [v4 parallaxFactor];
  *(float *)&double v8 = v8;
  **(_DWORD **)(a1 + 40) = LODWORD(v8);
  [v4 zoomScale];
  *(float *)&double v9 = v9;
  **(_DWORD **)(a1 + 48) = LODWORD(v9);
  **(unsigned char **)(a1 + 56) = [v4 supportsCropping];
  [v4 cropRect];
  *(float *)&double v10 = v10;
  v11 = *(_DWORD **)(a1 + 72);
  **(_DWORD **)(a1 + 64) = LODWORD(v10);
  *(float *)&double v10 = v12;
  _DWORD *v11 = LODWORD(v10);
  *(float *)&double v10 = v13;
  v14 = *(_DWORD **)(a1 + 88);
  **(_DWORD **)(a1 + 80) = LODWORD(v10);
  *(float *)&double v10 = v15;
  _DWORD *v14 = LODWORD(v10);
  **(unsigned char **)(a1 + 96) = [v4 isPortrait];
  **(unsigned char **)(a1 + 104) = [v4 hasVideo];
  [v4 stillTimeInVideo];
  **(void **)(a1 + 112) = v16;
}

@end