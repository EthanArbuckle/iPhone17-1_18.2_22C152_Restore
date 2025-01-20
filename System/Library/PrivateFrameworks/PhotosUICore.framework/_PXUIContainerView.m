@interface _PXUIContainerView
- (id)deferredAppearingAnimation;
- (void)didMoveToWindow;
- (void)setDeferredAppearingAnimation:(id)a3;
@end

@implementation _PXUIContainerView

- (void).cxx_destruct
{
}

- (void)setDeferredAppearingAnimation:(id)a3
{
}

- (id)deferredAppearingAnimation
{
  return self->_deferredAppearingAnimation;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_PXUIContainerView;
  [(_PXUIContainerView *)&v5 didMoveToWindow];
  v3 = [(_PXUIContainerView *)self deferredAppearingAnimation];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37___PXUIContainerView_didMoveToWindow__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

@end