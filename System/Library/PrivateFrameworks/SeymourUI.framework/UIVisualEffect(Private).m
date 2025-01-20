@interface UIVisualEffect(Private)
+ (uint64_t)sessionColorDark;
+ (uint64_t)sessionColorLight;
@end

@implementation UIVisualEffect(Private)

+ (uint64_t)sessionColorDark
{
  return [MEMORY[0x263F825D8] sessionColorEffectDark];
}

+ (uint64_t)sessionColorLight
{
  return [MEMORY[0x263F825D8] sessionColorEffectLight];
}

@end