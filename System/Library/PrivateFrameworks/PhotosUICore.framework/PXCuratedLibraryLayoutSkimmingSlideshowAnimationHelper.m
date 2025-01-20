@interface PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper
@end

@implementation PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper

uint64_t __170___PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke(uint64_t a1, uint64_t a2)
{
  char v9 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48) + 40 * a2;
  long long v6 = *(_OWORD *)(v4 + 56);
  v8[0] = *(_OWORD *)(v4 + 40);
  v8[1] = v6;
  uint64_t result = [(id)v4 _shoulAnimateSpriteWithInfo:v5 matchingSectionIndexPath:v8 spriteKind:&v9];
  if (result) {
    return [*(id *)(a1 + 40) addIndex:a2];
  }
  return result;
}

@end