@interface EXQueryClass
@end

@implementation EXQueryClass

void __get_EXQueryClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_EXQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_EXQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_EXQueryClass_block_invoke_cold_1();
    ExtensionKitLibrary();
  }
}

uint64_t __get_EXQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_EXQueryControllerClass_block_invoke_cold_1(v0);
}

@end