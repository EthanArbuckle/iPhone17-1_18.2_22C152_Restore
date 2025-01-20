@interface SHUDOnenessUnlockedJindoViewController
- (SHUDOnenessUnlockedJindoViewController)init;
- (id)leadingImage;
- (id)subtitle;
- (id)title;
- (id)trailingButton;
- (int64_t)imageContentMode;
- (int64_t)subtitleAlignment;
@end

@implementation SHUDOnenessUnlockedJindoViewController

- (SHUDOnenessUnlockedJindoViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SHUDOnenessUnlockedJindoViewController;
  return [(SHUDJindoViewController *)&v3 initWithNeedsButton:1];
}

- (id)leadingImage
{
  v2 = +[UIImage _systemImageNamed:@"apps.iphone.and.cursorarrow"];
  objc_super v3 = +[UIColor systemWhiteColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  v5 = objc_msgSend(v4, "imageWithAlignmentRectInsets:", -5.0, -5.0, -5.0, -5.0);

  return v5;
}

- (int64_t)imageContentMode
{
  return 1;
}

- (id)title
{
  return +[SHUDOnenessUnlockedUtilities title];
}

- (id)subtitle
{
  return +[SHUDOnenessUnlockedUtilities subtitle];
}

- (int64_t)subtitleAlignment
{
  return 1;
}

- (id)trailingButton
{
  return +[SHUDOnenessUnlockedUtilities trailingButton];
}

@end