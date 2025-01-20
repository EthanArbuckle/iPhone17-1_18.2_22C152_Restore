@interface PXCMMTileReusableView
- (PXCMMTileReusableView)init;
- (PXCMMTileReusableView)initWithView:(id)a3;
- (UIView)underlyingView;
- (UIView)view;
- (void)becomeReusable;
- (void)prepareForReuse;
@end

@implementation PXCMMTileReusableView

- (void).cxx_destruct
{
}

- (UIView)underlyingView
{
  return self->_underlyingView;
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
}

- (UIView)view
{
  return self->_underlyingView;
}

- (PXCMMTileReusableView)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMTileReusableView;
  v6 = [(PXCMMTileReusableView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingView, a3);
  }

  return v7;
}

- (PXCMMTileReusableView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTileReusableView.m", 20, @"%s is not available as initializer", "-[PXCMMTileReusableView init]");

  abort();
}

@end