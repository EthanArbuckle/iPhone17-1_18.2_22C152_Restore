@interface SBHIconDragAutoScrollAssistant
- (CGPoint)_currentLocation;
- (SBHIconDragAutoScrollAssistant)initWithDelegate:(id)a3 referenceView:(id)a4;
- (SBHIconDragAutoScrollAssistantDelegate)delegate;
- (UIDropSession)activeDropSession;
- (UIView)referenceView;
- (int64_t)_autoScrollDirectionForLocation:(CGPoint)a3;
- (void)_displayLinkFired:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setActiveDropSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReferenceView:(id)a3;
@end

@implementation SBHIconDragAutoScrollAssistant

- (SBHIconDragAutoScrollAssistant)initWithDelegate:(id)a3 referenceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHIconDragAutoScrollAssistant;
  v8 = [(SBHIconDragAutoScrollAssistant *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_referenceView, a4);
    uint64_t v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v9 selector:sel__displayLinkFired_];
    displayLink = v9->_displayLink;
    v9->_displayLink = (CADisplayLink *)v10;

    v12 = v9->_displayLink;
    v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v12 addToRunLoop:v13 forMode:*MEMORY[0x1E4F1C4B0]];

    v14 = v9->_displayLink;
    v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4FB30B0]];

    [(CADisplayLink *)v9->_displayLink setPaused:1];
  }

  return v9;
}

- (void)dealloc
{
  [(SBHIconDragAutoScrollAssistant *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHIconDragAutoScrollAssistant;
  [(SBHIconDragAutoScrollAssistant *)&v3 dealloc];
}

- (void)setActiveDropSession:(id)a3
{
  v5 = (UIDropSession *)a3;
  if (self->_activeDropSession != v5)
  {
    objc_storeStrong((id *)&self->_activeDropSession, a3);
    [(CADisplayLink *)self->_displayLink setPaused:v5 == 0];
  }
}

- (void)invalidate
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (CGPoint)_currentLocation
{
  [(UIDropSession *)self->_activeDropSession locationInView:self->_referenceView];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_displayLinkFired:(id)a3
{
  id v16 = a3;
  [(SBHIconDragAutoScrollAssistant *)self _currentLocation];
  double v5 = v4;
  double v7 = v6;
  self->_location.x = v4;
  self->_location.y = v6;
  UIDistanceBetweenPoints();
  if (!self->_started || v8 <= 40.0)
  {
    if (!self->_started && v8 > 20.0) {
      self->_lastTimestamp = CACurrentMediaTime();
    }
  }
  else
  {
    self->_started = 0;
  }
  double v10 = self->_lastTimestamp + 0.75;
  [v16 timestamp];
  if (!self->_started && v10 < v11) {
    self->_started = 1;
  }
  if (v10 < v11)
  {
    int64_t v12 = -[SBHIconDragAutoScrollAssistant _autoScrollDirectionForLocation:](self, "_autoScrollDirectionForLocation:", v5, v7);
    v13 = [(SBHIconDragAutoScrollAssistant *)self delegate];
    [v13 autoScrollAssistant:self triggeredAutoScrollInDirection:v12];

    [v16 timestamp];
    self->_lastTimestamp = v14;
  }
  if (BSFloatIsZero())
  {
    [v16 timestamp];
    self->_lastTimestamp = v15;
  }
}

- (int64_t)_autoScrollDirectionForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  double v8 = -25.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v8 = -50.0;
  }
  double v9 = x + v8;
  double v10 = y + -50.0;
  double v11 = 0.0 - (v8 + v8);
  [(UIView *)self->_referenceView bounds];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke;
  aBlock[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  aBlock[4] = v12;
  aBlock[5] = v14;
  aBlock[6] = v16;
  aBlock[7] = v18;
  v20 = (unsigned int (**)(void, double, double, double, double))_Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke_2;
  v24[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v24[4] = v13;
  v24[5] = v15;
  v24[6] = v17;
  v24[7] = v19;
  v21 = (unsigned int (**)(void, double, double, double, double))_Block_copy(v24);
  if (v20[2](v20, v9, v10, v11, 100.0))
  {
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      int64_t v22 = 1;
    }
    else {
      int64_t v22 = 2;
    }
  }
  else if (v21[2](v21, v9, v10, v11, 100.0))
  {
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      int64_t v22 = 2;
    }
    else {
      int64_t v22 = 1;
    }
  }
  else
  {
    int64_t v22 = 0;
  }

  return v22;
}

BOOL __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke(CGRect *a1, double a2, double a3, double a4, double a5)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  return MaxX > CGRectGetMaxX(a1[1]) + -5.0;
}

BOOL __66__SBHIconDragAutoScrollAssistant__autoScrollDirectionForLocation___block_invoke_2(CGRect *a1, double a2, double a3, double a4, double a5)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  return MinX < CGRectGetMinX(a1[1]) + 5.0;
}

- (UIDropSession)activeDropSession
{
  return self->_activeDropSession;
}

- (SBHIconDragAutoScrollAssistantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconDragAutoScrollAssistantDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDropSession, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end