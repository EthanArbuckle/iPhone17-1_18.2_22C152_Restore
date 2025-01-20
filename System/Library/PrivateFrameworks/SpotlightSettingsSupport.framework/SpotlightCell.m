@interface SpotlightCell
+ (id)bundle;
+ (int64_t)cellStyle;
- (BOOL)canReload;
@end

@implementation SpotlightCell

+ (int64_t)cellStyle
{
  return 0;
}

+ (id)bundle
{
  v2 = (void *)bundle_sSpotlightBundle;
  if (!bundle_sSpotlightBundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sSpotlightBundle;
    bundle_sSpotlightBundle = v3;

    v2 = (void *)bundle_sSpotlightBundle;
  }
  return v2;
}

- (BOOL)canReload
{
  return 1;
}

@end