@interface CDClientContextClass
@end

@implementation CDClientContextClass

void __get_CDClientContextClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_CDClientContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_CDClientContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    CoreDuetContextLibrary();
  }
}

@end