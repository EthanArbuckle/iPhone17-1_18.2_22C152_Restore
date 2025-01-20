@interface TVProcessInfo
@end

@implementation TVProcessInfo

uint64_t __36___TVProcessInfo_currentProcessInfo__block_invoke()
{
  v0 = objc_alloc_init(_TVProcessInfo);
  uint64_t v1 = currentProcessInfo_currentProcessInfo;
  currentProcessInfo_currentProcessInfo = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end