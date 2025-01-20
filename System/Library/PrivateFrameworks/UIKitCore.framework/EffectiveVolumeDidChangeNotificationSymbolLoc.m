@interface EffectiveVolumeDidChangeNotificationSymbolLoc
@end

@implementation EffectiveVolumeDidChangeNotificationSymbolLoc

void *__getAVSystemController_EffectiveVolumeDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_EffectiveVolumeDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_EffectiveVolumeDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

@end