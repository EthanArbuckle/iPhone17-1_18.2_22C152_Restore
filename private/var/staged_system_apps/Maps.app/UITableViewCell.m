@interface UITableViewCell
- (void)_maps_setTableViewCellBackgroundConfiguration;
@end

@implementation UITableViewCell

- (void)_maps_setTableViewCellBackgroundConfiguration
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003E84D0;
  v3[3] = &unk_1012E8B98;
  objc_copyWeak(&v4, &location);
  [(UITableViewCell *)self _setBackgroundViewConfigurationProvider:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end