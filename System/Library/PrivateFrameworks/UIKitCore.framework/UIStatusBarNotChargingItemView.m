@interface UIStatusBarNotChargingItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
@end

@implementation UIStatusBarNotChargingItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = [v6 rawData];

  v9 = (void *)[v7 initWithCString:v8 + 2112 encoding:4];
  p_notChargingString = &self->_notChargingString;
  char v11 = [v9 isEqualToString:*p_notChargingString];
  if ((v11 & 1) == 0) {
    objc_storeStrong((id *)p_notChargingString, v9);
  }

  return v11 ^ 1;
}

- (id)contentsImage
{
  return [(UIStatusBarItemView *)self imageWithText:self->_notChargingString];
}

- (id)accessibilityHUDRepresentation
{
  v2 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_notChargingString, 0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (void).cxx_destruct
{
}

@end