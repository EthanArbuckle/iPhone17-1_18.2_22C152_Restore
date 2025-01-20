@interface UIStatusBarAppIconItemView
- (id)_appBundleIdentifier;
- (id)contentsImage;
- (id)highlightImage;
@end

@implementation UIStatusBarAppIconItemView

- (id)_appBundleIdentifier
{
  return 0;
}

- (id)contentsImage
{
  v3 = [(UIStatusBarAppIconItemView *)self _appBundleIdentifier];
  v4 = [(UIStatusBarItemView *)self foregroundStyle];
  [v4 scale];
  v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 9);

  v6 = +[_UILegibilityImageSet imageFromImage:v5 withShadowImage:0];

  return v6;
}

- (id)highlightImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = [v2 untintedImageNamed:@"AppIcon_Highlight"];
  v4 = +[_UILegibilityImageSet imageFromImage:v3 withShadowImage:0];

  return v4;
}

@end