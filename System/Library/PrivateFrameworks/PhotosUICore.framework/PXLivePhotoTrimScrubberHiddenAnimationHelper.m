@interface PXLivePhotoTrimScrubberHiddenAnimationHelper
- (BOOL)hidden;
- (PXLivePhotoTrimScrubberHiddenAnimationHelper)initWithAnimationBlock:(id)a3;
- (id)animationBlock;
- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 withRequstID:(int64_t)a5;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PXLivePhotoTrimScrubberHiddenAnimationHelper

- (void).cxx_destruct
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 withRequstID:(int64_t)a5
{
  if (self->_hideRequestCounter == a5)
  {
    BOOL v5 = a3;
    if (self->_hidden != a3)
    {
      self->_hidden = a3;
      if (a4)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __81__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_withRequstID___block_invoke;
        v7[3] = &unk_1E5DCFE98;
        v7[4] = self;
        BOOL v8 = a3;
        [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:0];
      }
      else
      {
        v6 = [(PXLivePhotoTrimScrubberHiddenAnimationHelper *)self animationBlock];
        v6[2](v6, v5);
      }
    }
  }
}

void __81__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_withRequstID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) animationBlock];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  int64_t hideRequestCounter = self->_hideRequestCounter;
  BOOL v8 = (void *)(hideRequestCounter + 1);
  self->_int64_t hideRequestCounter = hideRequestCounter + 1;
  if (a5 <= 0.0)
  {
    [(PXLivePhotoTrimScrubberHiddenAnimationHelper *)self _setHidden:a3 animated:a4 withRequstID:hideRequestCounter + 1];
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_afterDelay___block_invoke;
    v11[3] = &unk_1E5DCD8D8;
    objc_copyWeak(v12, &location);
    BOOL v13 = a3;
    BOOL v14 = a4;
    v12[1] = v8;
    dispatch_after(v10, MEMORY[0x1E4F14428], v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __79__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setHidden:*(unsigned __int8 *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 49) withRequstID:*(void *)(a1 + 40)];
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHidden:(BOOL)a3
{
}

- (PXLivePhotoTrimScrubberHiddenAnimationHelper)initWithAnimationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLivePhotoTrimScrubberHiddenAnimationHelper;
  BOOL v5 = [(PXLivePhotoTrimScrubberHiddenAnimationHelper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id animationBlock = v5->_animationBlock;
    v5->_id animationBlock = (id)v6;
  }
  return v5;
}

@end