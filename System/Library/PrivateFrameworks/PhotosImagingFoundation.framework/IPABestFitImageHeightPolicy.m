@interface IPABestFitImageHeightPolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)result;
- (IPABestFitImageHeightPolicy)initWithCoder:(id)a3;
- (IPABestFitImageHeightPolicy)initWithHeight:(double)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPABestFitImageHeightPolicy

- (unint64_t)hash
{
  return (unint64_t)self->_fitHeight;
}

- (BOOL)isEqual:(id)a3
{
  return self->_fitHeight == *((double *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitImageHeightPolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"fit height", self->_fitHeight, v5.receiver, v5.super_class);
}

- (IPABestFitImageHeightPolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IPABestFitImageHeightPolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v8 initWithCoder:v3];
  objc_msgSend(v3, "decodeDoubleForKey:", @"fit height", v8.receiver, v8.super_class);
  double v6 = v5;

  v4->_fitHeight = v6;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> height=%f", objc_opt_class(), self, *(void *)&self->_fitHeight];
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[IPABestFitImageHeightPolicy transformSize:](self, "transformSize:");
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
    double v5 = (IPABestFitImageHeightPolicy *)_PFAssertFailHandler();
    [(IPABestFitImageHeightPolicy *)v5 isBestFitPolicy];
  }
  else
  {
    double fitHeight = self->_fitHeight;
    if (result.height <= fitHeight) {
      double fitHeight = result.height;
    }
    else {
      result.double width = result.width * (fitHeight / result.height);
    }
    double v4 = fitHeight;
  }
  result.double height = v4;
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPABestFitImageHeightPolicy)initWithHeight:(double)a3
{
  if (a3 <= 0.0)
  {
    double v5 = (void *)_PFAssertFailHandler();
    return (IPABestFitImageHeightPolicy *)+[IPAImageSizePolicy bestFitPolicyWithWidth:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPABestFitImageHeightPolicy;
    double result = [(IPABestFitImageHeightPolicy *)&v8 init];
    if (result) {
      result->_double fitHeight = a3;
    }
  }
  return result;
}

@end