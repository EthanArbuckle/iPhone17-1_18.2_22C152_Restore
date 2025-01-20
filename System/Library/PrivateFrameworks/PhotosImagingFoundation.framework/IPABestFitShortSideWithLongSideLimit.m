@interface IPABestFitShortSideWithLongSideLimit
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)a3;
- (IPABestFitShortSideWithLongSideLimit)initWithCoder:(id)a3;
- (IPABestFitShortSideWithLongSideLimit)initWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPABestFitShortSideWithLongSideLimit

- (unint64_t)hash
{
  unint64_t v2 = (16 * self->_nominalShortSide) ^ ((unint64_t)self->_nominalShortSide >> 28) ^ self->_minLongSide;
  return (16 * v2) ^ (v2 >> 28) ^ self->_maxLongSide;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  BOOL v5 = *(_OWORD *)&self->_nominalShortSide == *(_OWORD *)(v4 + 8) && self->_maxLongSide == *((void *)v4 + 3);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_nominalShortSide, @"nominal short", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_minLongSide forKey:@"min long"];
  [v4 encodeInteger:self->_maxLongSide forKey:@"max long"];
}

- (IPABestFitShortSideWithLongSideLimit)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v7 initWithCoder:v3];
  v4->_nominalShortSide = objc_msgSend(v3, "decodeIntegerForKey:", @"nominal short", v7.receiver, v7.super_class);
  v4->_minLongSide = [v3 decodeIntegerForKey:@"min long"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"max long"];

  v4->_maxLongSide = v5;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> nominalShort=%d, minLong=%d, maxLong=%d", objc_opt_class(), self, self->_nominalShortSide, self->_minLongSide, self->_maxLongSide];
}

- (double)transformScaleForSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  if (a3.width >= a3.height) {
    a3.double height = a3.width;
  }
  double result = (double)self->_nominalShortSide / height;
  double v5 = floor(a3.height * result);
  double minLongSide = (double)self->_minLongSide;
  if (v5 < minLongSide || (double minLongSide = (double)self->_maxLongSide, v5 > minLongSide)) {
    double result = minLongSide / a3.height;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (CGSize)transformSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    v8 = (IPABestFitShortSideWithLongSideLimit *)_PFAssertFailHandler();
    [(IPABestFitShortSideWithLongSideLimit *)v8 isBestFitPolicy];
  }
  else
  {
    -[IPABestFitShortSideWithLongSideLimit transformScaleForSize:](self, "transformScaleForSize:", a3.width, a3.height);
    double v6 = height * v5;
    double v7 = width * v5;
  }
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPABestFitShortSideWithLongSideLimit)initWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5
{
  if (a3 <= 0)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  if (a4 <= 0)
  {
LABEL_8:
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  if (a5 <= 0)
  {
LABEL_9:
    SEL v9 = (void *)_PFAssertFailHandler();
    return (IPABestFitShortSideWithLongSideLimit *)+[IPAImageSizePolicy largestPolicyWithPolicies:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  CGSize result = [(IPABestFitShortSideWithLongSideLimit *)&v12 init];
  if (result)
  {
    result->_nominalShortSide = a3;
    result->_double minLongSide = a4;
    result->_maxLongSide = a5;
  }
  return result;
}

@end