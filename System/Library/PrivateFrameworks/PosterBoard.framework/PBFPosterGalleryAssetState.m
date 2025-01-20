@interface PBFPosterGalleryAssetState
@end

@implementation PBFPosterGalleryAssetState

void __57___PBFPosterGalleryAssetState_liveAlwaysPostersPredicate__block_invoke()
{
  if (PBFForceLiveWallpapers())
  {
    v0 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v1 = 1;
  }
  else
  {
    int v2 = PBFDebugLiveWallpapers();
    v0 = (void *)MEMORY[0x1E4F28F60];
    if (v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_207];
      goto LABEL_7;
    }
    uint64_t v1 = 0;
  }
  uint64_t v3 = [v0 predicateWithValue:v1];
LABEL_7:
  v4 = (void *)liveAlwaysPostersPredicate_liveAlwaysPostersPredicate;
  liveAlwaysPostersPredicate_liveAlwaysPostersPredicate = v3;
}

uint64_t __57___PBFPosterGalleryAssetState_liveAlwaysPostersPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  v4 = objc_msgSend(v2, "setWithObjects:", @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Earth-Detail", @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Earth-Full", @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Moon-Detail", @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Moon-Full", @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Orrery", @"com.apple.WallpaperKit.CollectionsPoster:5010", @"com.apple.weather.poster:weather-poster-gallery", 0);
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

@end