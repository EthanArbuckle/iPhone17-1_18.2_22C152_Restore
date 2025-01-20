@interface UIStatusBarBatteryPercentItemView
- (BOOL)animatesDataChange;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraRightPadding;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (int64_t)textAlignment;
- (int64_t)textStyle;
@end

@implementation UIStatusBarBatteryPercentItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = [v6 rawData];

  v9 = (void *)[v7 initWithCString:v8 + 2112 encoding:4];
  p_percentString = &self->_percentString;
  char v11 = [v9 isEqualToString:*p_percentString];
  if ((v11 & 1) == 0) {
    objc_storeStrong((id *)p_percentString, v9);
  }

  return v11 ^ 1;
}

- (id)contentsImage
{
  return [(UIStatusBarItemView *)self imageWithText:self->_percentString];
}

- (double)extraRightPadding
{
  [(UIStatusBarItemView *)self standardPadding];
  return -floor(v2 * 0.5);
}

- (BOOL)animatesDataChange
{
  return 1;
}

- (int64_t)textAlignment
{
  return 2;
}

- (int64_t)textStyle
{
  return 0;
}

- (id)accessibilityHUDRepresentation
{
  double v2 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_percentString, 0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (void).cxx_destruct
{
}

@end