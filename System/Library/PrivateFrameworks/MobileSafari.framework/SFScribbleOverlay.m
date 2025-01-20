@interface SFScribbleOverlay
- (SFScribbleOverlay)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)selectionHandler;
- (id)tapHandler;
- (void)_didReceiveHover:(id)a3;
- (void)_didReceiveTapOrClick:(id)a3;
- (void)_selectionMovedToLocation:(CGPoint)a3;
- (void)endSelection;
- (void)endSelectionWithCompletion:(id)a3;
- (void)moveSelectionToFrame:(CGRect)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setTapHandler:(id)a3;
@end

@implementation SFScribbleOverlay

- (SFScribbleOverlay)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFScribbleOverlay;
  v3 = -[SFScribbleOverlay initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id selectionHandler = v3->_selectionHandler;
    v3->_id selectionHandler = &__block_literal_global_17;

    id tapHandler = v4->_tapHandler;
    v4->_id tapHandler = &__block_literal_global_27;

    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v4 action:sel__didReceiveHover_];
    [(SFScribbleOverlay *)v4 addGestureRecognizer:v7];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__didReceiveTapOrClick_];
    [v8 setAllowedTouchTypes:&unk_1EDA42778];
    [(SFScribbleOverlay *)v4 addGestureRecognizer:v8];
    v9 = [[SFScribbleClickGestureRecognizer alloc] initWithOverlay:v4];
    [(SFScribbleClickGestureRecognizer *)v9 setAllowedTouchTypes:&unk_1EDA42790];
    [(SFScribbleOverlay *)v4 addGestureRecognizer:v9];
    v10 = v4;
  }
  return v4;
}

- (void)_didReceiveHover:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3) {
      [(SFScribbleOverlay *)self endSelectionWithCompletion:0];
    }
  }
  else
  {
    [(SFScribbleSelectionOverlay *)self->_selectionOverlay setShowsHideButton:0];
    [v5 locationInView:self];
    -[SFScribbleOverlay _selectionMovedToLocation:](self, "_selectionMovedToLocation:");
  }
}

- (void)_didReceiveTapOrClick:(id)a3
{
  id v4 = a3;
  selectionOverlay = self->_selectionOverlay;
  id v6 = v4;
  [v4 locationInView:selectionOverlay];
  if (-[SFScribbleSelectionOverlay pointInside:withEvent:](selectionOverlay, "pointInside:withEvent:", 0))
  {
    (*((void (**)(void))self->_tapHandler + 2))();
  }
  else
  {
    [v6 locationInView:self];
    -[SFScribbleOverlay _selectionMovedToLocation:](self, "_selectionMovedToLocation:");
  }
}

- (void)_selectionMovedToLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_lastSelectionLocation = &self->_lastSelectionLocation;
  if (self->_lastSelectionLocation.x != a3.x || self->_lastSelectionLocation.y != a3.y)
  {
    (*((void (**)(double, double))self->_selectionHandler + 2))(a3.x, a3.y);
    p_lastSelectionLocation->CGFloat x = x;
    p_lastSelectionLocation->CGFloat y = y;
  }
}

- (void)endSelection
{
}

- (void)endSelectionWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = self->_selectionOverlay;
  id v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SFScribbleOverlay_endSelectionWithCompletion___block_invoke;
    v8[3] = &unk_1E54E9D50;
    v9 = v5;
    v10 = v4;
    [(SFScribbleSelectionOverlay *)v9 fadeOutWithCompletion:v8];
    selectionOverlaCGFloat y = self->_selectionOverlay;
    self->_selectionOverlaCGFloat y = 0;
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __48__SFScribbleOverlay_endSelectionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)moveSelectionToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SFScribbleSelectionOverlay *)self->_selectionOverlay frame];
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    [(SFScribbleOverlay *)self endSelectionWithCompletion:0];
    v8 = -[SFScribbleSelectionOverlay initWithFrame:]([SFScribbleSelectionOverlay alloc], "initWithFrame:", x, y, width, height);
    selectionOverladouble y = self->_selectionOverlay;
    self->_selectionOverladouble y = v8;

    [(SFScribbleSelectionOverlay *)self->_selectionOverlay setHideButtonHandler:self->_tapHandler];
    [(SFScribbleOverlay *)self addSubview:self->_selectionOverlay];
    v10 = self->_selectionOverlay;
    [(SFScribbleSelectionOverlay *)v10 fadeIn];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFScribbleOverlay *)self endSelection];
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFScribbleOverlay;
    v8 = -[SFScribbleOverlay hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }

  return v8;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_selectionOverlay, 0);
}

@end