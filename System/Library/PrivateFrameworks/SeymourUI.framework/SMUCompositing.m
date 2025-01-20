@interface SMUCompositing
+ (id)kCAFilterColorBurnBlendMode;
+ (id)kCAFilterPlusD;
+ (id)kCAFilterPlusL;
+ (id)kCAFilterScreenBlendMode;
+ (id)kCAFilterSourceAtop;
@end

@implementation SMUCompositing

+ (id)kCAFilterSourceAtop
{
  return (id)*MEMORY[0x263F15D80];
}

+ (id)kCAFilterPlusD
{
  return (id)*MEMORY[0x263F15D50];
}

+ (id)kCAFilterPlusL
{
  return (id)*MEMORY[0x263F15D58];
}

+ (id)kCAFilterScreenBlendMode
{
  return (id)*MEMORY[0x263F15D70];
}

+ (id)kCAFilterColorBurnBlendMode
{
  return (id)*MEMORY[0x263F15B18];
}

@end