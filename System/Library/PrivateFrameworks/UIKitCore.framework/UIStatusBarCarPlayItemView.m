@interface UIStatusBarCarPlayItemView
- (id)accessibilityHUDRepresentation;
@end

@implementation UIStatusBarCarPlayItemView

- (id)accessibilityHUDRepresentation
{
  v2 = +[UIImage kitImageNamed:@"AXHUD_CarPlay.png"];
  v3 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v2, 1, 0.0, 0.0, 0.0, 0.0);

  return v3;
}

@end