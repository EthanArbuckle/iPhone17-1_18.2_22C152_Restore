@interface ARParentTechnique
- (BOOL)vioThrottled;
- (BOOL)vlfLocalized;
- (CLLocation)vlfLocation;
- (void)setVioThrottled:(BOOL)a3;
- (void)setVlfLocation:(id)a3;
@end

@implementation ARParentTechnique

- (CLLocation)vlfLocation
{
  return (CLLocation *)objc_getAssociatedObject(self, off_1015EC328);
}

- (void)setVlfLocation:(id)a3
{
}

- (BOOL)vlfLocalized
{
  v2 = [(ARParentTechnique *)self vlfLocation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)vioThrottled
{
  v2 = objc_getAssociatedObject(self, off_1015F1E28);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVioThrottled:(BOOL)a3
{
  v4 = off_1015F1E28;
  id v5 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, v4, v5, (void *)3);
}

@end