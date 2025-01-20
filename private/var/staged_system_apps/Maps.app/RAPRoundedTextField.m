@interface RAPRoundedTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (RAPRoundedTextField)init;
@end

@implementation RAPRoundedTextField

- (RAPRoundedTextField)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAPRoundedTextField;
  v2 = [(RAPRoundedTextField *)&v6 init];
  if (v2)
  {
    v3 = +[UIColor systemGray6Color];
    [(RAPRoundedTextField *)v2 setBackgroundColor:v3];

    v4 = [(RAPRoundedTextField *)v2 layer];
    [v4 setCornerRadius:7.5];

    [(RAPRoundedTextField *)v2 setClipsToBounds:1];
  }
  return v2;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  -[RAPRoundedTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  -[RAPRoundedTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RAPRoundedTextField;
  -[RAPRoundedTextField textRectForBounds:](&v11, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3 + 15.0;
  double v6 = v5 + 7.5;
  double v8 = v7 + -15.0;
  double v10 = v9 + -15.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

@end