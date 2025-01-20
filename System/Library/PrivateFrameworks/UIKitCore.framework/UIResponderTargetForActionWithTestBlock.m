@interface UIResponderTargetForActionWithTestBlock
@end

@implementation UIResponderTargetForActionWithTestBlock

uint64_t ___UIResponderTargetForActionWithTestBlock_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:20];
  v1 = (void *)_MergedGlobals_1000;
  _MergedGlobals_1000 = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:20];
  v3 = (void *)qword_1EB25FF08;
  qword_1EB25FF08 = v2;

  uint64_t result = dyld_program_sdk_at_least();
  uint64_t v5 = 2;
  if (!result) {
    uint64_t v5 = 0;
  }
  qword_1EB25FF10 = v5;
  return result;
}

@end