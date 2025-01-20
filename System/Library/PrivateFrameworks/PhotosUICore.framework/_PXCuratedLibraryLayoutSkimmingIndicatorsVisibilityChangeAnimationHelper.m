@interface _PXCuratedLibraryLayoutSkimmingIndicatorsVisibilityChangeAnimationHelper
- (BOOL)wantsDoubleSidedAnimations;
- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
@end

@implementation _PXCuratedLibraryLayoutSkimmingIndicatorsVisibilityChangeAnimationHelper

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  v9 = (objc_class *)MEMORY[0x1E4F28E60];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __187___PXCuratedLibraryLayoutSkimmingIndicatorsVisibilityChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v14[3] = &unk_1E5DC9550;
  v16 = a8;
  id v12 = v11;
  id v15 = v12;
  [v10 enumerateIndexesUsingBlock:v14];

  return v12;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

@end