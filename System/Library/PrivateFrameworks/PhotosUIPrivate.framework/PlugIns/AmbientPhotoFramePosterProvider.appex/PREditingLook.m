@interface PREditingLook
- (NSString)pu_timeFontIdentifier;
- (PRPosterColor)pu_timeFontColor;
- (unint64_t)pu_timeAppearance;
@end

@implementation PREditingLook

- (unint64_t)pu_timeAppearance
{
  return 2;
}

- (NSString)pu_timeFontIdentifier
{
  return (NSString *)0;
}

- (PRPosterColor)pu_timeFontColor
{
  return (PRPosterColor *)0;
}

@end