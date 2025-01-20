@interface NSBundle(ResourcesBundle)
+ (uint64_t)sh_UIBundle;
@end

@implementation NSBundle(ResourcesBundle)

+ (uint64_t)sh_UIBundle
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

@end