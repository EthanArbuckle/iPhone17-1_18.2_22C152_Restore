@interface UIImage(PGVibrancyEffects)
- (BOOL)PG_wantsVibrancyEffect;
@end

@implementation UIImage(PGVibrancyEffects)

- (BOOL)PG_wantsVibrancyEffect
{
  return [a1 renderingMode] != 1;
}

@end