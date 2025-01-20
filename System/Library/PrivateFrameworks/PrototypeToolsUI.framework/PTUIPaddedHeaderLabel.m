@interface PTUIPaddedHeaderLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation PTUIPaddedHeaderLabel

- (void)drawTextInRect:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PTUIPaddedHeaderLabel;
  -[PTUIPaddedHeaderLabel drawTextInRect:](&v3, sel_drawTextInRect_, a3.origin.x + 20.0, a3.origin.y + 15.0, a3.size.width + -40.0, a3.size.height + -30.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTUIPaddedHeaderLabel;
  -[PTUIPaddedHeaderLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3 + 40.0;
  double v6 = v5 + 30.0;
  result.height = v6;
  result.width = v4;
  return result;
}

@end