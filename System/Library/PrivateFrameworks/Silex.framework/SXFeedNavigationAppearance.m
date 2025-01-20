@interface SXFeedNavigationAppearance
- (NSString)iconImageIdentifier;
@end

@implementation SXFeedNavigationAppearance

- (NSString)iconImageIdentifier
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v5 = v4;

  if (v5 == 3.0)
  {
    v6 = [(SXFeedNavigationAppearance *)self icon3xImageIdentifier];
  }
  else
  {
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 scale];
    double v9 = v8;

    if (v9 == 2.0) {
      [(SXFeedNavigationAppearance *)self icon2xImageIdentifier];
    }
    else {
    v6 = [(SXFeedNavigationAppearance *)self icon1xImageIdentifier];
    }
  }
  return (NSString *)v6;
}

@end