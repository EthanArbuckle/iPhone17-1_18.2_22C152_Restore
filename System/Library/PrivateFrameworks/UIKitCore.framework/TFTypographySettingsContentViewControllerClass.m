@interface TFTypographySettingsContentViewControllerClass
@end

@implementation TFTypographySettingsContentViewControllerClass

Class __get_TFTypographySettingsContentViewControllerClass_block_invoke(uint64_t a1)
{
  TextFormattingUILibraryCore();
  Class result = objc_getClass("_TFTypographySettingsContentViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_TFTypographySettingsContentViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

@end