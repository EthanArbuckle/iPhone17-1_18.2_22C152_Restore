@interface SBXXSetWallpaperVariant
@end

@implementation SBXXSetWallpaperVariant

uint64_t ___SBXXSetWallpaperVariant_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActiveVariant:*(unsigned __int8 *)(a1 + 40)];
}

@end