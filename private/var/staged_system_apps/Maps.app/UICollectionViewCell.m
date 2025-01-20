@interface UICollectionViewCell
- (BOOL)maps_suppressBackgroundColors;
- (void)_maps_setCollectionViewCellBackgroundConfiguration;
- (void)setMaps_suppressBackgroundColors:(BOOL)a3;
@end

@implementation UICollectionViewCell

- (void)_maps_setCollectionViewCellBackgroundConfiguration
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003E8340;
  v3[3] = &unk_1012E8B98;
  objc_copyWeak(&v4, &location);
  [(UICollectionViewCell *)self _setBackgroundViewConfigurationProvider:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setMaps_suppressBackgroundColors:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_10160EF58, v4, (void *)1);

  [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (BOOL)maps_suppressBackgroundColors
{
  v2 = objc_getAssociatedObject(self, &unk_10160EF58);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end