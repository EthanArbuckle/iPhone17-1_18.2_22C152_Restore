@interface UITableConstants_Watch
+ (id)sharedConstants;
- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3;
- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6;
- (id)defaultCheckmarkImageForCell:(id)a3;
- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3;
@end

@implementation UITableConstants_Watch

+ (id)sharedConstants
{
  v2 = (void *)sharedConstants___sharedConstants_4;
  if (!sharedConstants___sharedConstants_4)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)sharedConstants___sharedConstants_4;
    sharedConstants___sharedConstants_4 = v3;

    v2 = (void *)sharedConstants___sharedConstants_4;
  }
  return v2;
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  return 0;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  result = +[UIColor blackColor];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  retstr->var1 = result;
  return result;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.PepperUICore"];
  v4 = +[UIImage imageNamed:@"UIPreferencesBlueCheck" inBundle:v3];
  v5 = [v4 imageWithRenderingMode:2];

  return v5;
}

@end