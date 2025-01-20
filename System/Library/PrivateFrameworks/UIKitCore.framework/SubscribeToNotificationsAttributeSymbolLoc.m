@interface SubscribeToNotificationsAttributeSymbolLoc
@end

@implementation SubscribeToNotificationsAttributeSymbolLoc

void *__getAVSystemController_SubscribeToNotificationsAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_SubscribeToNotificationsAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB2601F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end