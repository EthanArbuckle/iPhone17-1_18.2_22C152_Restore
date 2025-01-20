@interface STScreenTimeCoreBundle
+ (NSBundle)bundle;
@end

@implementation STScreenTimeCoreBundle

+ (NSBundle)bundle
{
  return (NSBundle *)[MEMORY[0x1E4F28B50] bundleForClass:a1];
}

@end