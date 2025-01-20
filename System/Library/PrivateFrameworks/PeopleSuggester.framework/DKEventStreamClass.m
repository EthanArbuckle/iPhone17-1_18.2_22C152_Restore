@interface DKEventStreamClass
@end

@implementation DKEventStreamClass

Class __get_DKEventStreamClass_block_invoke(uint64_t a1)
{
  CoreDuetLibraryCore();
  Class result = objc_getClass("_DKEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end