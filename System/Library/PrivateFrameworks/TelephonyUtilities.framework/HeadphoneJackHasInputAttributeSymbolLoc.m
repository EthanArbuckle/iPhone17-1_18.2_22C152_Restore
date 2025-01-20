@interface HeadphoneJackHasInputAttributeSymbolLoc
@end

@implementation HeadphoneJackHasInputAttributeSymbolLoc

void *__getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary_0();
  result = dlsym(v2, "AVSystemController_HeadphoneJackHasInputAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

@end