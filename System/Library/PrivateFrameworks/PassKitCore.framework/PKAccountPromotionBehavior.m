@interface PKAccountPromotionBehavior
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountPromotionBehavior:(id)a3;
- (PKAccountPromotionBehavior)initWithCoder:(id)a3;
- (PKAccountPromotionBehavior)initWithDictionary:(id)a3;
- (PKAccountPromotionBehavior)initWithMinRefreshPeriod:(id)a3 maxImpressionCount:(id)a4 timeVisibleAfterCompleted:(id)a5;
- (double)minRefreshPeriod;
- (double)timeVisibleAfterCompleted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)maxImpressionCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxImpressionCount:(int64_t)a3;
- (void)setMinRefreshPeriod:(double)a3;
- (void)setTimeVisibleAfterCompleted:(double)a3;
@end

@implementation PKAccountPromotionBehavior

- (PKAccountPromotionBehavior)initWithMinRefreshPeriod:(id)a3 maxImpressionCount:(id)a4 timeVisibleAfterCompleted:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPromotionBehavior;
  v11 = [(PKAccountPromotionBehavior *)&v16 init];
  if (v11)
  {
    if (v8) {
      [v8 doubleValue];
    }
    else {
      uint64_t v12 = 0x4092C00000000000;
    }
    *(void *)&v11->_minRefreshPeriod = v12;
    if (v9) {
      uint64_t v13 = [v9 integerValue];
    }
    else {
      uint64_t v13 = 1;
    }
    v11->_maxImpressionCount = v13;
    if (v10) {
      [v10 doubleValue];
    }
    else {
      uint64_t v14 = 0x4122750000000000;
    }
    *(void *)&v11->_timeVisibleAfterCompleted = v14;
  }

  return v11;
}

- (PKAccountPromotionBehavior)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKNumberForKey:@"minRefreshPeriod"];
  v6 = [v4 PKNumberForKey:@"maxImpressionCount"];
  v7 = [v4 PKNumberForKey:@"timeVisibleAfterCompleted"];

  id v8 = [(PKAccountPromotionBehavior *)self initWithMinRefreshPeriod:v5 maxImpressionCount:v6 timeVisibleAfterCompleted:v7];
  return v8;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", @"minRefreshPeriod: '%f'; ", *(void *)&self->_minRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", @"maxImpressionCount: '%ld'; ", self->_maxImpressionCount);
  objc_msgSend(v3, "appendFormat:", @"timeVisibleAfterCompleted: '%f'; ",
    *(void *)&self->_timeVisibleAfterCompleted);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountPromotionBehavior *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountPromotionBehavior *)self isEqualToAccountPromotionBehavior:v5];

  return v6;
}

- (BOOL)isEqualToAccountPromotionBehavior:(id)a3
{
  id v4 = (double *)a3;
  BOOL v5 = v4
    && self->_minRefreshPeriod == v4[1]
    && self->_maxImpressionCount == *((void *)v4 + 2)
    && self->_timeVisibleAfterCompleted == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_maxImpressionCount
     - (unint64_t)self->_minRefreshPeriod
     + 32 * (unint64_t)self->_minRefreshPeriod;
  return (unint64_t)self->_timeVisibleAfterCompleted - v2 + 32 * v2 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotionBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPromotionBehavior;
  BOOL v5 = [(PKAccountPromotionBehavior *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"minRefreshPeriod"];
    v5->_minRefreshPeriod = v6;
    v5->_maxImpressionCount = [v4 decodeIntegerForKey:@"maxImpressionCount"];
    [v4 decodeDoubleForKey:@"timeVisibleAfterCompleted"];
    v5->_timeVisibleAfterCompleted = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double minRefreshPeriod = self->_minRefreshPeriod;
  id v5 = a3;
  [v5 encodeDouble:@"minRefreshPeriod" forKey:minRefreshPeriod];
  [v5 encodeInteger:self->_maxImpressionCount forKey:@"maxImpressionCount"];
  [v5 encodeDouble:@"timeVisibleAfterCompleted" forKey:self->_timeVisibleAfterCompleted];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_minRefreshPeriod;
  *((void *)result + 2) = self->_maxImpressionCount;
  *((void *)result + 3) = *(void *)&self->_timeVisibleAfterCompleted;
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

- (int64_t)maxImpressionCount
{
  return self->_maxImpressionCount;
}

- (void)setMaxImpressionCount:(int64_t)a3
{
  self->_maxImpressionCount = a3;
}

- (double)timeVisibleAfterCompleted
{
  return self->_timeVisibleAfterCompleted;
}

- (void)setTimeVisibleAfterCompleted:(double)a3
{
  self->_timeVisibleAfterCompleted = a3;
}

@end