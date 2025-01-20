@interface UplinkMuteAttributeSymbolLoc
@end

@implementation UplinkMuteAttributeSymbolLoc

void *__getAVSystemController_UplinkMuteAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_UplinkMuteAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_UplinkMuteAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end