@interface UIColor(SBPIPVibrancyEffects)
- (BOOL)SBPIP_wantsVibrancyEffect;
@end

@implementation UIColor(SBPIPVibrancyEffects)

- (BOOL)SBPIP_wantsVibrancyEffect
{
  double v2 = 0.0;
  [a1 getRed:0 green:0 blue:0 alpha:&v2];
  return v2 < 1.0 && v2 > 0.0;
}

@end