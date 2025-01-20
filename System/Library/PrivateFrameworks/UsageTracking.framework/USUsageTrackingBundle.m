@interface USUsageTrackingBundle
+ (NSBundle)usageTrackingBundle;
@end

@implementation USUsageTrackingBundle

+ (NSBundle)usageTrackingBundle
{
  return (NSBundle *)[MEMORY[0x263F086E0] bundleForClass:a1];
}

@end