@interface SearchUIClippableBoxView
+ (Class)layerClass;
@end

@implementation SearchUIClippableBoxView

+ (Class)layerClass
{
  return (Class)[MEMORY[0x1E4FB1EB0] layerClass];
}

@end