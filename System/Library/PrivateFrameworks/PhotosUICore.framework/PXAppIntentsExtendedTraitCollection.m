@interface PXAppIntentsExtendedTraitCollection
- (PXAppIntentsExtendedTraitCollection)initWithUserInterfaceStyle:(int64_t)a3 displayScale:(double)a4;
- (double)displayScale;
- (int64_t)layoutSizeClass;
- (int64_t)layoutSizeSubclass;
- (int64_t)userInterfaceStyle;
- (void)setDisplayScale:(double)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation PXAppIntentsExtendedTraitCollection

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXAppIntentsExtendedTraitCollection *)self signalChange:32];
  }
}

- (int64_t)layoutSizeSubclass
{
  return 2;
}

- (int64_t)layoutSizeClass
{
  return 1;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(PXAppIntentsExtendedTraitCollection *)self signalChange:1024];
  }
}

- (PXAppIntentsExtendedTraitCollection)initWithUserInterfaceStyle:(int64_t)a3 displayScale:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXAppIntentsExtendedTraitCollection;
  result = [(PXExtendedTraitCollection *)&v7 initWithViewController:0];
  if (result)
  {
    result->_userInterfaceStyle = a3;
    result->_displayScale = a4;
  }
  return result;
}

@end