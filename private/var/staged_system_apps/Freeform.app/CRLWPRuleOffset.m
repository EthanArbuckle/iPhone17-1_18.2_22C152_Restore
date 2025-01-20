@interface CRLWPRuleOffset
+ (id)ruleOffset;
+ (id)ruleOffsetWithDX:(double)a3 dY:(double)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)pointValue;
- (CGSize)sizeValue;
- (CRLWPRuleOffset)init;
- (CRLWPRuleOffset)initWithDX:(double)a3 dY:(double)a4;
- (double)dX;
- (double)dY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CRLWPRuleOffset

+ (id)ruleOffset
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (id)ruleOffsetWithDX:(double)a3 dY:(double)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithDX:a3 dY:a4];

  return v4;
}

- (CRLWPRuleOffset)initWithDX:(double)a3 dY:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLWPRuleOffset;
  result = [(CRLWPRuleOffset *)&v7 init];
  if (result)
  {
    result->_dX = a3;
    result->_dY = a4;
  }
  return result;
}

- (CRLWPRuleOffset)init
{
  return [(CRLWPRuleOffset *)self initWithDX:0.0 dY:0.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double dX = self->_dX;
  double dY = self->_dY;

  return [v4 initWithDX:dX dY:dY];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);
  objc_super v7 = v6;
  if (v6 && (double dX = self->_dX, [v6 dX], dX == v9))
  {
    double dY = self->_dY;
    [v7 dY];
    BOOL v12 = dY == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return 0;
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
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: dY=%+g; dY=%+g>",
    v4,
    *(void *)&self->_dX,
  uint64_t v5 = *(void *)&self->_dY);

  return v5;
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