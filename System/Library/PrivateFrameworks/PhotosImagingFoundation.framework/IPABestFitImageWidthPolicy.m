@interface IPABestFitImageWidthPolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)result;
- (IPABestFitImageWidthPolicy)initWithCoder:(id)a3;
- (IPABestFitImageWidthPolicy)initWithWidth:(double)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPABestFitImageWidthPolicy

- (unint64_t)hash
{
  return (unint64_t)self->_fitWidth;
}

- (BOOL)isEqual:(id)a3
{
  return self->_fitWidth == *((double *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitImageWidthPolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"fit width", self->_fitWidth, v5.receiver, v5.super_class);
}

- (IPABestFitImageWidthPolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IPABestFitImageWidthPolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v8 initWithCoder:v3];
  objc_msgSend(v3, "decodeDoubleForKey:", @"fit width", v8.receiver, v8.super_class);
  double v6 = v5;

  v4->_fitWidth = v6;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> width=%f", objc_opt_class(), self, *(void *)&self->_fitWidth];
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[IPABestFitImageWidthPolicy transformSize:](self, "transformSize:");
  double v7 = v6;
  double result = v6 / width;
  if (result >= v5 / height) {
    double result = v5 / height;
  }
  double v9 = ceil(v7);
  double v10 = ceil(v5);
  while (1)
  {
    double v11 = ceil(height * result);
    if (ceil(width * result) <= v9 && v11 <= v10) {
      break;
    }
    double result = result * 0.999999;
  }
  return result;
}

- (CGSize)transformSize:(CGSize)result
{
  if (result.width < 0.0 || result.height < 0.0)
  {
    NSStringFromSize(result);
    objc_claimAutoreleasedReturnValue();
    double v5 = (IPABestFitImageWidthPolicy *)_PFAssertFailHandler();
    [(IPABestFitImageWidthPolicy *)v5 isBestFitPolicy];
  }
  else
  {
    double fitWidth = self->_fitWidth;
    if (result.width <= fitWidth) {
      double fitWidth = result.width;
    }
    else {
      result.double height = result.height * (fitWidth / result.width);
    }
    double v4 = fitWidth;
  }
  result.double width = v4;
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPABestFitImageWidthPolicy)initWithWidth:(double)a3
{
  if (a3 <= 0.0)
  {
    double v5 = (void *)_PFAssertFailHandler();
    return (IPABestFitImageWidthPolicy *)+[IPAImageSizePolicy bestFitPolicyShortestEdge:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPABestFitImageWidthPolicy;
    double result = [(IPABestFitImageWidthPolicy *)&v8 init];
    if (result) {
      result->_double fitWidth = a3;
    }
  }
  return result;
}

@end