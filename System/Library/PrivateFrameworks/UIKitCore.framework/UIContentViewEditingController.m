@interface UIContentViewEditingController
@end

@implementation UIContentViewEditingController

void __81___UIContentViewEditingController_updateLabelConfiguration_editingConfiguration___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) numberOfLines] != 1)
  {
    v1 = *(NSObject **)(__UILogGetCategoryCachedImpl("ContentViewEditingConfiguration", &_block_invoke___s_category_4)
                      + 8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1853B0000, v1, OS_LOG_TYPE_ERROR, "Enabling _UIContentViewEditingConfiguration.usesTextInputAsLabel with a corresponding label configuration whose numberOfLines != 1 will result in incorrect positioning of the text input. This message will only be logged once.", v2, 2u);
    }
  }
}

@end