@interface SystemVolumeDidChangeNotificationSymbolLoc
@end

@implementation SystemVolumeDidChangeNotificationSymbolLoc

void *__getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_SystemVolumeDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_SystemVolumeDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

@end