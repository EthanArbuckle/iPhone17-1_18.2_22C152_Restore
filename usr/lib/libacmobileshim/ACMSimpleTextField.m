@interface ACMSimpleTextField
- (ACMSimpleTextField)initWithFrame:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
@end

@implementation ACMSimpleTextField

- (ACMSimpleTextField)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ACMSimpleTextField;
  v3 = -[ACMSimpleTextField initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [MEMORY[0x263F1C5C0] currentDevice];
    v4 = @"textField.png";
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = @"textField_iPad.png";
    }
    v5 = (void *)ACMImageWithName((uint64_t)v4);
    [MEMORY[0x263F1C5C0] currentDevice];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 3;
    }
    -[ACMSimpleTextField setBackground:](v3, "setBackground:", [v5 stretchableImageWithLeftCapWidth:v6 topCapHeight:0]);
    [(ACMSimpleTextField *)v3 setBorderStyle:0];
  }
  return v3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  double v5 = v4 + -7.0 + -6.0;
  double v6 = height + -4.0;
  double v7 = 7.0;
  double v8 = 2.0;
  result.size.double height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  double v5 = v4 + -7.0 + -6.0;
  double v6 = height + -4.0;
  double v7 = 7.0;
  double v8 = 2.0;
  result.size.double height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  double v5 = v4 + -7.0 + -6.0;
  double v6 = height + -4.0;
  double v7 = 9.0;
  double v8 = 2.0;
  result.size.double height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

@end