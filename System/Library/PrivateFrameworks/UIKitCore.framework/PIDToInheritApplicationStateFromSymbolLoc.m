@interface PIDToInheritApplicationStateFromSymbolLoc
@end

@implementation PIDToInheritApplicationStateFromSymbolLoc

void *__getAVSystemController_PIDToInheritApplicationStateFromSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaExperienceLibrary_0();
  result = dlsym(v2, "AVSystemController_PIDToInheritApplicationStateFrom");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_PIDToInheritApplicationStateFromSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

@end