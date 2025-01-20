@interface DASSystemContextClass
@end

@implementation DASSystemContextClass

void __get_DASSystemContextClass_block_invoke(uint64_t a1)
{
  DuetActivitySchedulerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DASSystemContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DASSystemContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_DASSystemContextClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLSearchIndexManager.m", 88, @"Unable to find class %s", "_DASSystemContext");

    __break(1u);
  }
}

@end