@interface UITextFieldDrawingBackgroundProvider
@end

@implementation UITextFieldDrawingBackgroundProvider

void __54___UITextFieldDrawingBackgroundProvider_drawInBounds___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_block_invoke___s_category_6) + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = v0;
    int v2 = 138412290;
    uint64_t v3 = objc_opt_class();
    _os_log_impl(&dword_1853B0000, v1, OS_LOG_TYPE_ERROR, "%@ does not implement -drawInBounds:, and it should!", (uint8_t *)&v2, 0xCu);
  }
}

@end