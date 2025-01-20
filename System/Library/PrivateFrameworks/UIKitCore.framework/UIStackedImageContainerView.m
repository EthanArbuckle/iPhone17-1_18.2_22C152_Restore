@interface UIStackedImageContainerView
@end

@implementation UIStackedImageContainerView

void __50___UIStackedImageContainerView_setFocusDirection___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_block_invoke___s_category_15) + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Please set installsMotionEffectsWhenFocused to NO before manually setting the focus direction of a _UIStackedImageContainerView", v1, 2u);
  }
}

@end