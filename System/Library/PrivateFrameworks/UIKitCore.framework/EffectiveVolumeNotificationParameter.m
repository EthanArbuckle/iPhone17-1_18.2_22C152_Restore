@interface EffectiveVolumeNotificationParameter
@end

@implementation EffectiveVolumeNotificationParameter

void *__getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_EffectiveVolumeNotificationParameter_Category");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_EffectiveVolumeNotificationParameter_CategorySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                               + 24);
  return result;
}

@end