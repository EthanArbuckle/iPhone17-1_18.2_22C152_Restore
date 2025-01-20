@interface PXLayoutMetrics
- (BOOL)isEqual:(id)a3;
- (CGSize)referenceSize;
- (NSString)diagnosticDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation PXLayoutMetrics

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  [(PXLayoutMetrics *)self referenceSize];
  v4 = NSStringFromCGSize(v8);
  v5 = (void *)[v3 initWithFormat:@"referenceSize=%@", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXLayoutMetrics *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PXLayoutMetrics *)v4 referenceSize];
      double v6 = v5;
      double v8 = v7;
      [(PXLayoutMetrics *)self referenceSize];
      BOOL v11 = v8 == v10 && v6 == v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  [(PXLayoutMetrics *)self referenceSize];
  return (unint64_t)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *(CGSize *)((char *)result + 8) = self->_referenceSize;
  return result;
}

@end