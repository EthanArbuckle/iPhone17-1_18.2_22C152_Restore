@interface PXGPointReference
- (BOOL)isValid;
- (CGPoint)point;
- (PXGLayout)layout;
- (PXGPointReference)init;
- (PXGPointReference)initWithPoint:(CGPoint)a3 layout:(id)a4;
- (void)invalidate;
@end

@implementation PXGPointReference

- (void).cxx_destruct
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)invalidate
{
  self->_isValid = 0;
  id v3 = [(PXGPointReference *)self layout];
  [v3 removePointReference:self];
}

- (PXGPointReference)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPointReference.m", 35, @"%s is not available as initializer", "-[PXGPointReference init]");

  abort();
}

- (PXGPointReference)initWithPoint:(CGPoint)a3 layout:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXGPointReference;
  v8 = [(PXGPointReference *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_point.CGFloat x = x;
    v8->_point.CGFloat y = y;
    objc_storeWeak((id *)&v8->_layout, v7);
    v9->_isValid = 1;
  }

  return v9;
}

@end