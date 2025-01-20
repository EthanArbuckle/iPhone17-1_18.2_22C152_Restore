@interface UIColorEffectProcessLuminanceMap
@end

@implementation UIColorEffectProcessLuminanceMap

uint64_t ___UIColorEffectProcessLuminanceMap_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
}

@end