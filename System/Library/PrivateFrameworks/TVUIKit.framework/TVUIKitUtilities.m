@interface TVUIKitUtilities
+ (BOOL)isJ42;
+ (id)TVUIKitBundle;
+ (id)preferredGraphicsRenderFormat;
@end

@implementation TVUIKitUtilities

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1) {
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global);
  }
  v2 = (void *)TVUIKitBundle_bundle;
  return v2;
}

uint64_t __33__TVUIKitUtilities_TVUIKitBundle__block_invoke()
{
  TVUIKitBundle_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TVUIKit"];
  return MEMORY[0x270F9A758]();
}

+ (id)preferredGraphicsRenderFormat
{
  v2 = (void *)MEMORY[0x263F1C688];
  v3 = [MEMORY[0x263F1C920] mainScreen];
  v4 = [v3 traitCollection];
  v5 = [v2 formatForTraitCollection:v4];

  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];

  return v5;
}

+ (BOOL)isJ42
{
  return 0;
}

@end