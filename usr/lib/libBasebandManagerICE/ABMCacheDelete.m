@interface ABMCacheDelete
+ (void)RegisterCallback:(__CFString *)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
@end

@implementation ABMCacheDelete

+ (void)RegisterCallback:(__CFString *)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ABMCacheDelete_RegisterCallback___::__block_invoke;
  block[3] = &unk_1E651BAF8;
  block[7] = a7;
  block[8] = a3;
  block[4] = a4;
  block[5] = a5;
  block[6] = a6;
  if (RegisterCallback___::_once != -1) {
    dispatch_once(&RegisterCallback___::_once, block);
  }
}

uint64_t __39__ABMCacheDelete_RegisterCallback___::__block_invoke(void *a1)
{
  return MEMORY[0x1F410DCF0](a1[8], a1[4], a1[5], a1[6], a1[7]);
}

@end