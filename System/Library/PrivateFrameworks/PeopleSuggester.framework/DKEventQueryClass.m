@interface DKEventQueryClass
@end

@implementation DKEventQueryClass

Class __get_DKEventQueryClass_block_invoke(uint64_t a1)
{
  CoreDuetLibraryCore();
  Class result = objc_getClass("_DKEventQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKEventQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end