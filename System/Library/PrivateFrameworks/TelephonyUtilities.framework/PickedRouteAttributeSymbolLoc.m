@interface PickedRouteAttributeSymbolLoc
@end

@implementation PickedRouteAttributeSymbolLoc

void *__getAVSystemController_PickedRouteAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_PickedRouteAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_PickedRouteAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end