@interface CLKUIQuadViewRenderCoordinator
- (BOOL)isPaused;
- (CLKUIQuadViewRenderCoordinator)initWithQuadView:(id)a3 synchronizeWithClockTimer:(BOOL)a4;
- (unint64_t)preferredFramesPerSecond;
- (void)_renderLinkFired:(id)a3;
- (void)invalidate;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(unint64_t)a3;
@end

@implementation CLKUIQuadViewRenderCoordinator

- (CLKUIQuadViewRenderCoordinator)initWithQuadView:(id)a3 synchronizeWithClockTimer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKUIQuadViewRenderCoordinator;
  v7 = [(CLKUIQuadViewRenderCoordinator *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_quadView, v6);
    if (v4)
    {
      objc_initWeak(&location, v8);
      v9 = [CLKUIClockTimerLink alloc];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __77__CLKUIQuadViewRenderCoordinator_initWithQuadView_synchronizeWithClockTimer___block_invoke;
      v15[3] = &unk_1E609E5A8;
      objc_copyWeak(&v16, &location);
      uint64_t v10 = [(CLKUIClockTimerLink *)v9 initWithUpdateHandler:v15];
      renderFrequencyLink = v8->_renderFrequencyLink;
      v8->_renderFrequencyLink = (CLKUIRenderFrequencyLink *)v10;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = [[CLKUIDisplayLink alloc] initWithTarget:v8 selector:sel__renderLinkFired_];
      v13 = v8->_renderFrequencyLink;
      v8->_renderFrequencyLink = &v12->super;
    }
  }

  return v8;
}

void __77__CLKUIQuadViewRenderCoordinator_initWithQuadView_synchronizeWithClockTimer___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renderLinkFired:WeakRetained];
}

- (void)_renderLinkFired:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quadView);
  if (WeakRetained)
  {
    [v5 timestamp];
    objc_msgSend(WeakRetained, "_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", 0, 1, 0);
  }
}

- (void)invalidate
{
}

- (void)setPaused:(BOOL)a3
{
}

- (BOOL)isPaused
{
  return [(CLKUIRenderFrequencyLink *)self->_renderFrequencyLink isPaused];
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
}

- (unint64_t)preferredFramesPerSecond
{
  return [(CLKUIRenderFrequencyLink *)self->_renderFrequencyLink preferredFramesPerSecond];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderFrequencyLink, 0);
  objc_destroyWeak((id *)&self->_quadView);
}

@end