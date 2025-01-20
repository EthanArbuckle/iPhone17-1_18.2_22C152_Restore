@interface PTEditFloatRow
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PTEditFloatRow)init;
- (PTEditFloatRow)initWithCoder:(id)a3;
- (double)maxValue;
- (double)minValue;
- (id)_validatedValue:(id)a3;
- (id)between:(double)a3 and:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)precision:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)precision;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setPrecision:(unint64_t)a3;
@end

@implementation PTEditFloatRow

- (id)precision:(unint64_t)a3
{
  return self;
}

- (id)between:(double)a3 and:(double)a4
{
  return self;
}

- (PTEditFloatRow)init
{
  v5.receiver = self;
  v5.super_class = (Class)PTEditFloatRow;
  v2 = [(PTRow *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PTEditFloatRow *)v2 setPrecision:2];
    [(PTEditFloatRow *)v3 setMinValue:2.22507386e-308];
    [(PTEditFloatRow *)v3 setMaxValue:1.79769313e308];
  }
  return v3;
}

- (id)_validatedValue:(id)a3
{
  double maxValue = self->_maxValue;
  double minValue = self->_minValue;
  [a3 floatValue];
  double v6 = v5;
  if (minValue >= v6) {
    double v6 = minValue;
  }
  if (maxValue < v6) {
    double v6 = maxValue;
  }
  v7 = (void *)MEMORY[0x1E4F28ED0];

  return (id)[v7 numberWithDouble:v6];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTEditFloatRow *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTEditFloatRow;
    BOOL v5 = [(PTRow *)&v7 isEqual:v4]
      && self->_precision == v4->_precision
      && PTEqualFloats(self->_minValue, v4->_minValue)
      && PTEqualFloats(self->_maxValue, v4->_maxValue);
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __22__PTEditFloatRow_hash__block_invoke;
  v10[3] = &unk_1E63BC570;
  v10[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v10, 0);
  id v5 = (id)[v3 appendInteger:self->_precision];
  id v6 = (id)[v3 appendDouble:self->_minValue];
  id v7 = (id)[v3 appendDouble:self->_maxValue];
  unint64_t v8 = [v3 hash];

  return v8;
}

id __22__PTEditFloatRow_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTEditFloatRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTEditFloatRow;
  id v4 = [(PTRow *)&v6 copyWithZone:a3];
  [v4 setPrecision:self->_precision];
  [v4 setMinValue:self->_minValue];
  [v4 setMaxValue:self->_maxValue];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTEditFloatRow;
  id v4 = a3;
  [(PTRow *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_precision, @"precision", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"minValue" forKey:self->_minValue];
  [v4 encodeDouble:@"maxValue" forKey:self->_maxValue];
}

- (PTEditFloatRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTEditFloatRow;
  objc_super v5 = [(PTRow *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_precision = [v4 decodeIntegerForKey:@"precision"];
    [v4 decodeDoubleForKey:@"minValue"];
    v5->_double minValue = v6;
    [v4 decodeDoubleForKey:@"maxValue"];
    v5->_double maxValue = v7;
  }

  return v5;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_double minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_double maxValue = a3;
}

@end