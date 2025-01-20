@interface PKAccountEnhancedMerchantBehavior
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEnhancedMerchantBehavior:(id)a3;
- (PKAccountEnhancedMerchantBehavior)init;
- (PKAccountEnhancedMerchantBehavior)initWithCoder:(id)a3;
- (PKAccountEnhancedMerchantBehavior)initWithDictionary:(id)a3;
- (PKAccountEnhancedMerchantBehavior)initWithMinRefreshPeriod:(id)a3;
- (double)cooldownPeriodForLevel:(unint64_t)a3;
- (double)longMinRefreshPeriod;
- (double)minRefreshPeriod;
- (double)shortMinRefreshPeriod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLongMinRefreshPeriod:(double)a3;
- (void)setMinRefreshPeriod:(double)a3;
- (void)setShortMinRefreshPeriod:(double)a3;
@end

@implementation PKAccountEnhancedMerchantBehavior

- (PKAccountEnhancedMerchantBehavior)init
{
  return [(PKAccountEnhancedMerchantBehavior *)self initWithMinRefreshPeriod:0];
}

- (PKAccountEnhancedMerchantBehavior)initWithMinRefreshPeriod:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountEnhancedMerchantBehavior;
  v5 = [(PKAccountEnhancedMerchantBehavior *)&v8 init];
  if (v5)
  {
    if (v4) {
      [v4 doubleValue];
    }
    else {
      uint64_t v6 = 0x4092C00000000000;
    }
    *(void *)&v5->_minRefreshPeriod = v6;
    *(_OWORD *)&v5->_shortMinRefreshPeriod = xmmword_191673AB0;
  }

  return v5;
}

- (PKAccountEnhancedMerchantBehavior)initWithDictionary:(id)a3
{
  id v4 = [a3 PKNumberForKey:@"minRefreshPeriod"];
  v5 = [(PKAccountEnhancedMerchantBehavior *)self initWithMinRefreshPeriod:v4];

  return v5;
}

- (double)cooldownPeriodForLevel:(unint64_t)a3
{
  double result = 0.0;
  uint64_t v4 = 16;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      return *(double *)((char *)&self->super.isa + v4);
    case 3uLL:
      uint64_t v4 = 24;
      return *(double *)((char *)&self->super.isa + v4);
    default:
      uint64_t v4 = 8;
      return *(double *)((char *)&self->super.isa + v4);
  }
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", @"minRefreshPeriod: '%f'; ", *(void *)&self->_minRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", @"shortMinRefreshPeriod: '%f'; ", *(void *)&self->_shortMinRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", @"longRefreshPeriod: '%f'; ", *(void *)&self->_longMinRefreshPeriod);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountEnhancedMerchantBehavior *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountEnhancedMerchantBehavior *)self isEqualToAccountEnhancedMerchantBehavior:v5];

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchantBehavior:(id)a3
{
  uint64_t v4 = (double *)a3;
  BOOL v5 = v4
    && self->_minRefreshPeriod == v4[1]
    && self->_shortMinRefreshPeriod == v4[2]
    && self->_longMinRefreshPeriod == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self->_shortMinRefreshPeriod
     - (unint64_t)self->_minRefreshPeriod
     + 32 * (unint64_t)self->_minRefreshPeriod;
  return (unint64_t)self->_longMinRefreshPeriod - v2 + 32 * v2 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEnhancedMerchantBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountEnhancedMerchantBehavior;
  BOOL v5 = [(PKAccountEnhancedMerchantBehavior *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"minRefreshPeriod"];
    v5->_minRefreshPeriod = v6;
    [v4 decodeDoubleForKey:@"shortMinRefreshPeriod"];
    v5->_shortMinRefreshPeriod = v7;
    [v4 decodeDoubleForKey:@"longMinRefreshPeriod"];
    v5->_longMinRefreshPeriod = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double minRefreshPeriod = self->_minRefreshPeriod;
  id v5 = a3;
  [v5 encodeDouble:@"minRefreshPeriod" forKey:minRefreshPeriod];
  [v5 encodeDouble:@"shortMinRefreshPeriod" forKey:self->_shortMinRefreshPeriod];
  [v5 encodeDouble:@"longMinRefreshPeriod" forKey:self->_longMinRefreshPeriod];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_minRefreshPeriod;
  *((void *)result + 2) = *(void *)&self->_shortMinRefreshPeriod;
  *((void *)result + 3) = *(void *)&self->_longMinRefreshPeriod;
  return result;
}

- (double)minRefreshPeriod
{
  return self->_minRefreshPeriod;
}

- (void)setMinRefreshPeriod:(double)a3
{
  self->_double minRefreshPeriod = a3;
}

- (double)shortMinRefreshPeriod
{
  return self->_shortMinRefreshPeriod;
}

- (void)setShortMinRefreshPeriod:(double)a3
{
  self->_shortMinRefreshPeriod = a3;
}

- (double)longMinRefreshPeriod
{
  return self->_longMinRefreshPeriod;
}

- (void)setLongMinRefreshPeriod:(double)a3
{
  self->_longMinRefreshPeriod = a3;
}

@end