@interface PXGSingleViewContainerView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (UIView)contentView;
- (void)becomeReusable;
- (void)setClippingRect:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGSingleViewContainerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->userData, 0);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSCopying)userData
{
  return self->userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)becomeReusable
{
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    v7 = [(UIView *)contentView superview];

    if (v7 == self) {
      [(UIView *)self->_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    v5 = v8;
    if (v8)
    {
      [(PXGSingleViewContainerView *)self bounds];
      -[UIView setFrame:](v8, "setFrame:");
      [(UIView *)v8 setAutoresizingMask:18];
      [(PXGSingleViewContainerView *)self addSubview:v8];
      v5 = v8;
    }
  }
}

- (void)setUserData:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXGSingleViewContainerView.m", 34, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v8, v9 object file lineNumber description];
    }
  }
  v5 = [v10 contentView];
  [(PXGSingleViewContainerView *)self setContentView:v5];
}

@end