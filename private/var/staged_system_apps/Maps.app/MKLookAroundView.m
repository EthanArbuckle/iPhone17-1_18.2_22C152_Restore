@interface MKLookAroundView
- (NSString)expandedSceneTitle;
- (NSString)locationSubtitle;
- (NSString)locationTitle;
- (NSString)sceneTitle;
- (UIImage)snapshotImage;
@end

@implementation MKLookAroundView

- (NSString)locationTitle
{
  v2 = [(MKLookAroundView *)self muninViewState];
  v3 = [v2 locationInfo];

  v4 = [v3 locationName];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 locationName];
  }
  else
  {
    v6 = &stru_101324E70;
  }

  return (NSString *)v6;
}

- (NSString)locationSubtitle
{
  v2 = [(MKLookAroundView *)self muninViewState];
  v3 = [v2 locationInfo];

  v4 = [v3 secondaryLocationName];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 secondaryLocationName];
  }
  else
  {
    v6 = &stru_101324E70;
  }
  v7 = [v3 localityName];
  id v8 = [v7 length];

  if (v8)
  {
    if ([(__CFString *)v6 length])
    {
      uint64_t v9 = [(__CFString *)v6 stringByAppendingString:@", "];

      v6 = (__CFString *)v9;
    }
    v10 = [v3 localityName];
    uint64_t v11 = [(__CFString *)v6 stringByAppendingString:v10];

    v6 = (__CFString *)v11;
  }

  return (NSString *)v6;
}

- (UIImage)snapshotImage
{
  [(MKLookAroundView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  v7 = +[UIScreen mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  [(MKLookAroundView *)self bounds];
  -[MKLookAroundView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v10;
}

- (NSString)expandedSceneTitle
{
  double v3 = [(MKLookAroundView *)self locationTitle];
  CGFloat v4 = [(MKLookAroundView *)self locationSubtitle];
  double v5 = +[NSString stringWithFormat:@"%@ - %@", v3, v4];

  return (NSString *)v5;
}

- (NSString)sceneTitle
{
  v2 = [(MKLookAroundView *)self muninViewState];
  double v3 = [v2 locationInfo];
  CGFloat v4 = [v3 localityName];

  if ([v4 length])
  {
    double v5 = +[NSBundle mainBundle];
    CGFloat v6 = [v5 localizedStringForKey:@"[App switcher title] Look Around — <location>" value:@"localized string not found" table:0];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);
  }
  else
  {
    double v5 = +[NSBundle mainBundle];
    v7 = [v5 localizedStringForKey:@"[App switcher title] Look Around" value:@"localized string not found" table:0];
  }

  return (NSString *)v7;
}

@end