@interface UIStatusBarStudentItemView
- (id)accessibilityHUDRepresentation;
@end

@implementation UIStatusBarStudentItemView

- (id)accessibilityHUDRepresentation
{
  v2 = +[UIImage kitImageNamed:@"AXHUD_Student.png"];
  v3 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v2, 1, 0.0, 0.0, 0.0, 0.0);

  return v3;
}

@end