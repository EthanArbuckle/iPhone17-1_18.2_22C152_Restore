@interface PXGBlurEffectViewConfiguration
- (BOOL)isEqual:(id)a3;
- (PXGBlurEffectViewConfiguration)init;
- (PXGBlurEffectViewConfiguration)initWithStyle:(int64_t)a3;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation PXGBlurEffectViewConfiguration

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGBlurEffectViewConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_style == self->_style;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_style;
}

- (PXGBlurEffectViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGBlurEffectView.m", 35, @"%s is not available as initializer", "-[PXGBlurEffectViewConfiguration init]");

  abort();
}

- (PXGBlurEffectViewConfiguration)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGBlurEffectViewConfiguration;
  result = [(PXGBlurEffectViewConfiguration *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

@end