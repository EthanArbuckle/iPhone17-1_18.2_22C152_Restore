@interface IPABestFitImageSizePolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)result;
- (IPABestFitImageSizePolicy)initWithCoder:(id)a3;
- (IPABestFitImageSizePolicy)initWithFitSize:(CGSize)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPABestFitImageSizePolicy

- (unint64_t)hash
{
  return (16 * (unint64_t)self->_fitSize.width) ^ ((unint64_t)self->_fitSize.width >> 28) ^ (unint64_t)self->_fitSize.height;
}

- (BOOL)isEqual:(id)a3
{
  return self->_fitSize.height == *((double *)a3 + 2) && self->_fitSize.width == *((double *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitImageSizePolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeSize:forKey:", @"fit size", self->_fitSize.width, self->_fitSize.height, v5.receiver, v5.super_class);
}

- (IPABestFitImageSizePolicy)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IPABestFitImageSizePolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v10 initWithCoder:v3];
  objc_msgSend(v3, "decodeSizeForKey:", @"fit size", v10.receiver, v10.super_class);
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v4->_fitSize.width = v6;
  v4->_fitSize.height = v8;
  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = NSStringFromSize(self->_fitSize);
  CGFloat v6 = [v3 stringWithFormat:@"<%@:%p> size=%@", v4, self, v5];

  return v6;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[IPABestFitImageSizePolicy transformSize:](self, "transformSize:");
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
    CGFloat v8 = (IPABestFitImageSizePolicy *)_PFAssertFailHandler();
    [(IPABestFitImageSizePolicy *)v8 isBestFitPolicy];
    return result;
  }
  if (result.width != 0.0 || result.height != 0.0)
  {
    double width = self->_fitSize.width;
    if (result.width <= width)
    {
      double height = self->_fitSize.height;
      if (result.height <= height) {
        return result;
      }
    }
    else
    {
      double height = self->_fitSize.height;
    }
    double v5 = result.width / result.height;
    if (result.height == 0.0) {
      double v6 = 0.0;
    }
    else {
      double v6 = v5;
    }
    double v7 = width / height;
    if (height == 0.0) {
      double v7 = 0.0;
    }
    if (v6 <= 0.0 || v7 <= 0.0)
    {
      return *(CGSize *)*(void *)&MEMORY[0x1E4F1DB30];
    }
    else if (v6 <= 1.0)
    {
      result.double width = v6 * height;
      result.double height = height;
    }
    else
    {
      result.double width = self->_fitSize.width;
      result.double height = width / v6;
    }
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (IPABestFitImageSizePolicy)initWithFitSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.height <= 0.0 || a3.width <= 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    double v6 = (void *)_PFAssertFailHandler();
    return (IPABestFitImageSizePolicy *)+[IPAImageSizePolicy scalePolicyWithScale:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IPABestFitImageSizePolicy;
    double result = [(IPABestFitImageSizePolicy *)&v9 init];
    if (result)
    {
      result->_fitSize.CGFloat width = width;
      result->_fitSize.CGFloat height = height;
    }
  }
  return result;
}

@end