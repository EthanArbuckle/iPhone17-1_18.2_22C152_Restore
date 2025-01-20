@interface IPABestFitTotalPixelCountImageSizePolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)_transformSize:(CGSize)result scale:(double *)a4;
- (CGSize)transformSize:(CGSize)a3;
- (IPABestFitTotalPixelCountImageSizePolicy)initWithCoder:(id)a3;
- (IPABestFitTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPABestFitTotalPixelCountImageSizePolicy

- (unint64_t)hash
{
  return self->_totalPixelCount;
}

- (BOOL)isEqual:(id)a3
{
  return self->_totalPixelCount == *((void *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_totalPixelCount, @"one side", v5.receiver, v5.super_class);
}

- (IPABestFitTotalPixelCountImageSizePolicy)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"one side", v7.receiver, v7.super_class);

  v4->_totalPixelCount = v5;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> totalPixelCount=%ld", objc_opt_class(), self, self->_totalPixelCount];
}

- (double)transformScaleForSize:(CGSize)a3
{
  double v4 = 0.0;
  -[IPABestFitTotalPixelCountImageSizePolicy _transformSize:scale:](self, "_transformSize:scale:", &v4, a3.width, a3.height);
  return v4;
}

- (CGSize)transformSize:(CGSize)a3
{
  -[IPABestFitTotalPixelCountImageSizePolicy _transformSize:scale:](self, "_transformSize:scale:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_transformSize:(CGSize)result scale:(double *)a4
{
  if (result.width == 0.0 || result.height == 0.0) {
    return result;
  }
  double totalPixelCount = (double)self->_totalPixelCount;
  double v5 = floor(sqrt(totalPixelCount / (result.width / result.height)));
  double v6 = ceil(result.width / result.height * v5);
  double v7 = floor(sqrt(result.width / result.height * totalPixelCount));
  double v8 = ceil(v7 / (result.width / result.height));
  if (v5 * v6 >= v7 * v8)
  {
    if (v5 * v6 <= totalPixelCount) {
      goto LABEL_5;
    }
LABEL_7:
    double v5 = v8;
    double v6 = v7;
    double v9 = v7 / result.width;
    goto LABEL_8;
  }
  if (v7 * v8 <= totalPixelCount) {
    goto LABEL_7;
  }
LABEL_5:
  double v9 = v5 / result.height;
LABEL_8:
  BOOL v10 = v6 > result.width;
  if (v5 > result.height) {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    result.height = v5;
    result.width = v6;
  }
  if (a4)
  {
    double v11 = 1.0;
    if (!v10) {
      double v11 = v9;
    }
    *a4 = v11;
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPABestFitTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3
{
  if (a3 <= 0)
  {
    double v5 = (void *)_PFAssertFailHandler();
    return (IPABestFitTotalPixelCountImageSizePolicy *)+[IPAImageSizePolicy bestFitPolicyWithEvenTotalPixelCount:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
    CGSize result = [(IPABestFitTotalPixelCountImageSizePolicy *)&v8 init];
    if (result) {
      result->_double totalPixelCount = a3;
    }
  }
  return result;
}

@end