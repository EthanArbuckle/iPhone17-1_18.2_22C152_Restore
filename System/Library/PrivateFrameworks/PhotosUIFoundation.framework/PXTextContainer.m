@interface PXTextContainer
- (PXTextContainer)initWithCoder:(id)a3;
- (PXTextContainer)initWithSize:(CGSize)a3;
- (PXTextContainer)initWithSize:(CGSize)a3 layoutOrientation:(int64_t)a4;
- (int64_t)preferredOrientation;
@end

@implementation PXTextContainer

- (int64_t)preferredOrientation
{
  return self->_preferredOrientation;
}

- (PXTextContainer)initWithSize:(CGSize)a3 layoutOrientation:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXTextContainer;
  result = -[PXTextContainer initWithSize:](&v6, sel_initWithSize_, a3.width, a3.height);
  if (result) {
    result->_preferredOrientation = a4;
  }
  return result;
}

- (PXTextContainer)initWithSize:(CGSize)a3
{
  return -[PXTextContainer initWithSize:layoutOrientation:](self, "initWithSize:layoutOrientation:", 0, a3.width, a3.height);
}

- (PXTextContainer)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTextContainer.m", 20, @"%s is not available as initializer", "-[PXTextContainer initWithCoder:]");

  abort();
}

@end