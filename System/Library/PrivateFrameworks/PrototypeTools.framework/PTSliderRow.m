@interface PTSliderRow
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PTSliderRow)init;
- (PTSliderRow)initWithCoder:(id)a3;
- (double)maxValue;
- (double)minValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)minValue:(double)a3 maxValue:(double)a4;
- (id)valueStringFormatter;
- (id)valueStringFormatter:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setValueStringFormatter:(id)a3;
@end

@implementation PTSliderRow

- (PTSliderRow)init
{
  v5.receiver = self;
  v5.super_class = (Class)PTSliderRow;
  v2 = [(PTRow *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PTSliderRow *)v2 setMinValue:0.0];
    [(PTSliderRow *)v3 setMaxValue:1.0];
  }
  return v3;
}

- (id)minValue:(double)a3 maxValue:(double)a4
{
  return self;
}

- (id)valueStringFormatter:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTSliderRow *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTSliderRow;
    BOOL v5 = [(PTRow *)&v7 isEqual:v4]
      && PTEqualFloats(self->_minValue, v4->_minValue)
      && PTEqualFloats(self->_maxValue, v4->_maxValue);
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __19__PTSliderRow_hash__block_invoke;
  v9[3] = &unk_1E63BC570;
  v9[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v9, 0);
  id v5 = (id)[v3 appendDouble:self->_minValue];
  id v6 = (id)[v3 appendDouble:self->_maxValue];
  unint64_t v7 = [v3 hash];

  return v7;
}

id __19__PTSliderRow_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTSliderRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTSliderRow;
  id v4 = [(PTRow *)&v6 copyWithZone:a3];
  [v4 setMinValue:self->_minValue];
  [v4 setMaxValue:self->_maxValue];
  [v4 setValueStringFormatter:self->_valueStringFormatter];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTSliderRow;
  id v4 = a3;
  [(PTRow *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minValue", self->_minValue, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"maxValue" forKey:self->_maxValue];
}

- (PTSliderRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTSliderRow;
  objc_super v5 = [(PTRow *)&v9 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"minValue"];
    v5->_minValue = v6;
    [v4 decodeDoubleForKey:@"maxValue"];
    v5->_maxValue = v7;
  }

  return v5;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (id)valueStringFormatter
{
  return self->_valueStringFormatter;
}

- (void)setValueStringFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end