@interface SPUIBoxView
+ (Class)layerClass;
@end

@implementation SPUIBoxView

+ (Class)layerClass
{
  return (Class)[MEMORY[0x263F82E00] layerClass];
}

@end