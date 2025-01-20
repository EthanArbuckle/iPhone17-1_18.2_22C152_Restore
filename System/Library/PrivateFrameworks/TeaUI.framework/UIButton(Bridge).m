@interface UIButton(Bridge)
+ (uint64_t)largeButton;
@end

@implementation UIButton(Bridge)

+ (uint64_t)largeButton
{
  return [MEMORY[0x1E4FB14D0] buttonWithType:126];
}

@end