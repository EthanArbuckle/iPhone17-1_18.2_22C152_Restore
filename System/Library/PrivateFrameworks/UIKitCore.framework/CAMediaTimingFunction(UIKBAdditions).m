@interface CAMediaTimingFunction(UIKBAdditions)
+ (uint64_t)_kbTimingFunction;
@end

@implementation CAMediaTimingFunction(UIKBAdditions)

+ (uint64_t)_kbTimingFunction
{
  return [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
}

@end