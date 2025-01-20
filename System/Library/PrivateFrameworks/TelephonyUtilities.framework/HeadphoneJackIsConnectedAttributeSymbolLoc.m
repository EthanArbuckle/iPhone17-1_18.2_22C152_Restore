@interface HeadphoneJackIsConnectedAttributeSymbolLoc
@end

@implementation HeadphoneJackIsConnectedAttributeSymbolLoc

void *__getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary_0();
  result = dlsym(v2, "AVSystemController_HeadphoneJackIsConnectedAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

@end