@interface SubscribeToNotificationsAttributeSymbolLoc
@end

@implementation SubscribeToNotificationsAttributeSymbolLoc

void *__getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_SubscribeToNotificationsAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

@end