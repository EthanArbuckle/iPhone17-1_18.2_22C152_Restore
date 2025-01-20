@interface SBXXSetWallpaperOptionsForLocations
@end

@implementation SBXXSetWallpaperOptionsForLocations

void ___SBXXSetWallpaperOptionsForLocations_block_invoke(uint64_t a1)
{
  v2 = +[SBWallpaperController sharedInstance];
  id v5 = [v2 wallpaperConfigurationManager];

  v3 = [NSString stringWithUTF8String:*(void *)(a1 + 32)];
  v4 = objc_msgSend(MEMORY[0x1E4F83C10], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", v3, *(unsigned char *)(a1 + 80) != 0, *(unsigned char *)(a1 + 81) != 0, *(unsigned char *)(a1 + 82) != 0, *(float *)(a1 + 72), *(float *)(a1 + 76), *(float *)(a1 + 56), *(float *)(a1 + 60), *(float *)(a1 + 64), *(float *)(a1 + 68), *(double *)(a1 + 40));
  **(unsigned char **)(a1 + 48) = [v5 setWallpaperOptions:v4 forVariants:*(unsigned __int8 *)(a1 + 83)];
}

@end