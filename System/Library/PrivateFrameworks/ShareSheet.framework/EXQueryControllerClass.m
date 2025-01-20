@interface EXQueryControllerClass
@end

@implementation EXQueryControllerClass

Class __get_EXQueryControllerClass_block_invoke(uint64_t a1)
{
  ExtensionKitLibrary();
  Class result = objc_getClass("_EXQueryController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_EXQueryControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_EXQueryControllerClass_block_invoke_cold_1();
    return (Class)__getSYIsLinkableUserActivitySymbolLoc_block_invoke(v3);
  }
  return result;
}

uint64_t __get_EXQueryControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSYNotesActivationRequestClass_block_invoke_cold_1(v0);
}

@end