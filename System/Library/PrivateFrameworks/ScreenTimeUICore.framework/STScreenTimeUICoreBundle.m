@interface STScreenTimeUICoreBundle
+ (NSBundle)bundle;
@end

@implementation STScreenTimeUICoreBundle

+ (NSBundle)bundle
{
  return (NSBundle *)[MEMORY[0x263F086E0] bundleForClass:a1];
}

@end