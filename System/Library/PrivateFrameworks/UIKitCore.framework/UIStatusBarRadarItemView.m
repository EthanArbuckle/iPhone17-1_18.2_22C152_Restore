@interface UIStatusBarRadarItemView
- (BOOL)usesAdvancedActions;
- (double)extraRightPadding;
- (id)contentsImage;
- (id)highlightImage;
- (int64_t)buttonType;
@end

@implementation UIStatusBarRadarItemView

- (id)contentsImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = NSString;
  [v2 scale];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"_internal_radar_%ix.png", (int)v4);
  v6 = (void *)MEMORY[0x1E4F28B50];
  v7 = _UIKitResourceBundlePath(@"CarPlayArtwork.bundle");
  v8 = [v6 bundleWithPath:v7];

  id v9 = +[UIImage imageNamed:v5 inBundle:v8];
  uint64_t v10 = [v9 CGImage];
  [v2 scale];
  v11 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 0);

  v12 = +[_UILegibilityImageSet imageFromImage:v11 withShadowImage:0];

  return v12;
}

- (id)highlightImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = [v2 untintedImageNamed:@"Home_Highlight"];
  double v4 = +[_UILegibilityImageSet imageFromImage:v3 withShadowImage:0];

  return v4;
}

- (double)extraRightPadding
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarRadarItemView;
  [(UIStatusBarItemView *)&v4 extraRightPadding];
  return v2 + 1.0;
}

- (int64_t)buttonType
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

@end