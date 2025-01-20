@interface SHUDOnenessUnlockedPillViewController
- (SHUDOnenessUnlockedPillViewController)init;
- (id)leadingImage;
- (id)subtitle;
- (id)title;
- (id)trailingButton;
- (int64_t)imageContentMode;
- (int64_t)subtitleAlignment;
@end

@implementation SHUDOnenessUnlockedPillViewController

- (SHUDOnenessUnlockedPillViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SHUDOnenessUnlockedPillViewController;
  return [(SHUDPillViewController *)&v3 initWithNeedsButton:1];
}

- (id)leadingImage
{
  id v2 = [objc_alloc((Class)UIColor) initWithDynamicProvider:&stru_1000143C8];
  objc_super v3 = +[UIImage _systemImageNamed:@"apps.iphone.and.cursorarrow"];
  v4 = [v3 imageWithTintColor:v2 renderingMode:1];

  return v4;
}

- (int64_t)imageContentMode
{
  return 2;
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
  return 4;
}

- (id)trailingButton
{
  return +[SHUDOnenessUnlockedUtilities trailingButton];
}

@end