@interface SPPhotoUtilities
+ (BOOL)isImageOrVideoIdentifier:(id)a3;
+ (id)allPhotoBundles;
+ (id)bundlesIndexingPhotos;
@end

@implementation SPPhotoUtilities

+ (id)bundlesIndexingPhotos
{
  if (bundlesIndexingPhotos_onceToken != -1) {
    dispatch_once(&bundlesIndexingPhotos_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)bundlesIndexingPhotos_bundlesIndexingPhotos;
  return v2;
}

void __41__SPPhotoUtilities_bundlesIndexingPhotos__block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F78F38];
  v4[0] = *MEMORY[0x263F78FB0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F78EF8];
  v4[2] = *MEMORY[0x263F79048];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F78F08];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  v3 = (void *)bundlesIndexingPhotos_bundlesIndexingPhotos;
  bundlesIndexingPhotos_bundlesIndexingPhotos = v2;
}

+ (id)allPhotoBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SPPhotoUtilities_allPhotoBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhotoBundles_onceToken != -1) {
    dispatch_once(&allPhotoBundles_onceToken, block);
  }
  uint64_t v2 = (void *)allPhotoBundles_allPhotoBundles;
  return v2;
}

void __35__SPPhotoUtilities_allPhotoBundles__block_invoke(uint64_t a1)
{
  SSBundleIdentifiersForSyndicatedPhotos();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 32) bundlesIndexingPhotos];
  uint64_t v3 = [v5 arrayByAddingObjectsFromArray:v2];
  v4 = (void *)allPhotoBundles_allPhotoBundles;
  allPhotoBundles_allPhotoBundles = v3;
}

+ (BOOL)isImageOrVideoIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263F1D920] typeWithIdentifier:v3];
  }
  else
  {
    v4 = 0;
  }
  if ([v4 conformsToType:*MEMORY[0x263F1DBC8]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 conformsToType:*MEMORY[0x263F1DB18]];
  }

  return v5;
}

@end