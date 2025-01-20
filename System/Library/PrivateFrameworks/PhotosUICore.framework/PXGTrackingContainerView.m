@interface PXGTrackingContainerView
- (BOOL)isSpriteRemoved;
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXGTrackingContainerView)initWithFrame:(CGRect)a3;
- (void)_removeFromSuperviewIfFinished;
- (void)becomeReusable;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setIsSpriteRemoved:(BOOL)a3;
- (void)setUserData:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation PXGTrackingContainerView

- (void).cxx_destruct
{
}

- (BOOL)isSpriteRemoved
{
  return self->_isSpriteRemoved;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserData:(id)a3
{
}

- (NSCopying)userData
{
  return self->_userData;
}

- (void)_removeFromSuperviewIfFinished
{
  v3 = [(PXGTrackingContainerView *)self superview];
  if (v3 && (v7 = v3, BOOL v4 = [(PXGTrackingContainerView *)self isSpriteRemoved], v3 = v7, v4))
  {
    v5 = [(PXGTrackingContainerView *)self subviews];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      [(PXGTrackingContainerView *)self removeFromSuperview];
    }
  }
  else
  {
  }
}

- (void)willRemoveSubview:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXGTrackingContainerView;
  [(PXGTrackingContainerView *)&v9 willRemoveSubview:a3];
  uint64_t v4 = [(PXGTrackingContainerView *)self superview];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(PXGTrackingContainerView *)self subviews];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PXGTrackingContainerView_willRemoveSubview___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __46__PXGTrackingContainerView_willRemoveSubview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeFromSuperviewIfFinished];
}

- (void)setIsSpriteRemoved:(BOOL)a3
{
  if (self->_isSpriteRemoved != a3)
  {
    self->_isSpriteRemoved = a3;
    [(PXGTrackingContainerView *)self _removeFromSuperviewIfFinished];
  }
}

- (void)prepareForReuse
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGTrackingContainerView.m", 31, @"%@ is not reusable", v6 object file lineNumber description];

  abort();
}

- (void)becomeReusable
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGTrackingContainerView.m", 27, @"%@ is not reusable", v6 object file lineNumber description];

  abort();
}

- (PXGTrackingContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXGTrackingContainerView;
  v3 = -[PXGTrackingContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(PXGTrackingContainerView *)v3 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXGTrackingContainerView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

@end