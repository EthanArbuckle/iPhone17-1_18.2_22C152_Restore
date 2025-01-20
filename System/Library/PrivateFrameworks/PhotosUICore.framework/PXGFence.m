@interface PXGFence
- (PXGFence)init;
- (PXGFence)initWithLayout:(id)a3 type:(unint64_t)a4;
- (PXGLayout)layout;
- (double)timeout;
- (unint64_t)type;
- (void)setTimeout:(double)a3;
@end

@implementation PXGFence

- (unint64_t)type
{
  return self->_type;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (PXGFence)initWithLayout:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGFence;
  v7 = [(PXGFence *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layout, v6);
    v8->_type = a4;
  }

  return v8;
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (PXGFence)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGFence.m", 24, @"%s is not available as initializer", "-[PXGFence init]");

  abort();
}

@end