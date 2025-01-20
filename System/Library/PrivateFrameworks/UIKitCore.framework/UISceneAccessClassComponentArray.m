@interface UISceneAccessClassComponentArray
@end

@implementation UISceneAccessClassComponentArray

uint64_t ____UISceneAccessClassComponentArray_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ____UISceneAccessClassComponentArray_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ____UISceneAccessClassComponentArray_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = (void *)qword_1EB25EC30;
  qword_1EB25EC30 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.UIKit.UIFrameClassBasedComponentAccess", MEMORY[0x1E4F14430]);
  v3 = (void *)qword_1EB25EC38;
  qword_1EB25EC38 = (uint64_t)v2;
}

@end