@interface SPUISearchBarMutableClientSceneSettings
- (double)headerHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHeaderHeight:(double)a3;
@end

@implementation SPUISearchBarMutableClientSceneSettings

- (void)setHeaderHeight:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:1000];
}

- (double)headerHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1000];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [SPUISearchBarClientSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end