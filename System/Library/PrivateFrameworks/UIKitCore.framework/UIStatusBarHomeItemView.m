@interface UIStatusBarHomeItemView
- (BOOL)extendsHitTestingFrame;
- (BOOL)usesAdvancedActions;
- (double)extraRightPadding;
- (id)contentsImage;
- (id)highlightImage;
- (int64_t)buttonType;
@end

@implementation UIStatusBarHomeItemView

- (double)extraRightPadding
{
  return 8.0;
}

- (id)contentsImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = [v2 untintedImageNamed:@"Home"];
  v4 = +[_UILegibilityImageSet imageFromImage:v3 withShadowImage:0];

  return v4;
}

- (id)highlightImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = [v2 untintedImageNamed:@"Home_Highlight"];
  v4 = +[_UILegibilityImageSet imageFromImage:v3 withShadowImage:0];

  return v4;
}

- (int64_t)buttonType
{
  return 0;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (BOOL)extendsHitTestingFrame
{
  return 1;
}

@end