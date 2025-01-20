@interface UICAPackageViewClass
@end

@implementation UICAPackageViewClass

Class __get_UICAPackageViewClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("_UICAPackageView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_UICAPackageViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_UICAPackageViewClass_block_invoke_cold_1();
    return __getUIImageClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_UICAPackageViewClass_block_invoke_cold_1()
{
  return __getUIImageClass_block_invoke_cold_1();
}

@end