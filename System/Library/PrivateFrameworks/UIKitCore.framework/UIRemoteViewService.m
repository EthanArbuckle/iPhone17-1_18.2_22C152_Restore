@interface UIRemoteViewService
@end

@implementation UIRemoteViewService

void __38___UIRemoteViewService_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS____UIRemoteViewService;
  id v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)_MergedGlobals_1_28;
  _MergedGlobals_1_28 = (uint64_t)v2;
}

@end