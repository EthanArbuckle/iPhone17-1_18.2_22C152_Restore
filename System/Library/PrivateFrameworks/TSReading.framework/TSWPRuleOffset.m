@interface TSWPRuleOffset
+ (id)ruleOffset;
- (BOOL)isEqual:(id)a3;
- (CGPoint)pointValue;
- (CGSize)sizeValue;
- (TSWPRuleOffset)init;
- (TSWPRuleOffset)initWithDX:(double)a3 dY:(double)a4;
- (double)dX;
- (double)dY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TSWPRuleOffset

+ (id)ruleOffset
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (TSWPRuleOffset)init
{
  return [(TSWPRuleOffset *)self initWithDX:0.0 dY:0.0];
}

- (TSWPRuleOffset)initWithDX:(double)a3 dY:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPRuleOffset;
  result = [(TSWPRuleOffset *)&v7 init];
  if (result)
  {
    result->_dX = a3;
    result->_dY = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double dX = self->_dX;
  double dY = self->_dY;

  return (id)[v4 initWithDX:dX dY:dY];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    double dX = self->_dX;
    [v4 dX];
    if (dX == v7)
    {
      double dY = self->_dY;
      [v5 dY];
      LOBYTE(v4) = dY == v9;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (CGPoint)pointValue
{
  double dX = self->_dX;
  double dY = self->_dY;
  result.y = dY;
  result.x = dX;
  return result;
}

- (CGSize)sizeValue
{
  double dX = self->_dX;
  double dY = self->_dY;
  result.height = dY;
  result.width = dX;
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: dY=%+g; dY=%+g>",
               NSStringFromClass(v4),
               *(void *)&self->_dX,
               *(void *)&self->_dY);
}

- (double)dX
{
  return self->_dX;
}

- (double)dY
{
  return self->_dY;
}

@end