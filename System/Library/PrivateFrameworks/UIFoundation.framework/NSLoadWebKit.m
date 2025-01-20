@interface NSLoadWebKit
@end

@implementation NSLoadWebKit

uint64_t ____NSLoadWebKit_block_invoke()
{
  return softLink_UIApplicationLoadWebKit();
}

void ____NSLoadWebKit_block_invoke_2(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F29060] isMainThread];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = (void (*)(uint64_t))v3[2];
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5);
  }
  else
  {
    v6 = MEMORY[0x1E4F14428];
    dispatch_sync(v6, v3);
  }
}

@end