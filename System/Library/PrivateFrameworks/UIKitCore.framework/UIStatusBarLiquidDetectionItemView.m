@interface UIStatusBarLiquidDetectionItemView
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
@end

@implementation UIStatusBarLiquidDetectionItemView

- (id)contentsImage
{
  v2 = [(UIView *)self traitCollection];
  v3 = +[UIImage _kitImageNamed:@"Item_LiquidDetection" withTrait:v2];

  v4 = +[_UILegibilityImageSet imageFromImage:v3 withShadowImage:0];

  return v4;
}

- (id)accessibilityHUDRepresentation
{
  v2 = +[UIImage kitImageNamed:@"Item_LiquidDetection"];
  v3 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v2, 1, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v3 setFlattenImage:0];

  return v3;
}

@end