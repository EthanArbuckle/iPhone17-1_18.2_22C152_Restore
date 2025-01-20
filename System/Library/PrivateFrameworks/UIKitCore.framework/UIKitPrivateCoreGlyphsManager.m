@interface UIKitPrivateCoreGlyphsManager
@end

@implementation UIKitPrivateCoreGlyphsManager

void ___UIKitPrivateCoreGlyphsManager_block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category_0)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Could not initialize the CoreGlyphsPrivate asset bundle. Is it there?", v1, 2u);
  }
}

@end