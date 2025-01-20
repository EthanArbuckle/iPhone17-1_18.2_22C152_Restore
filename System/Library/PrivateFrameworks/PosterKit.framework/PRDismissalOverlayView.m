@interface PRDismissalOverlayView
- (CGRect)touchPassthroughRect;
- (PRDismissalOverlayView)initWithFrame:(CGRect)a3;
- (PRDismissalOverlayViewDelegate)delegate;
- (UIView)bottomTapRecognizerView;
- (UIView)leftTapRecognizerView;
- (UIView)rightTapRecognizerView;
- (UIView)topTapRecognizerView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_tapGestureRecognized:(id)a3;
- (void)layoutSubviews;
- (void)setBottomTapRecognizerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftTapRecognizerView:(id)a3;
- (void)setRightTapRecognizerView:(id)a3;
- (void)setTopTapRecognizerView:(id)a3;
- (void)setTouchPassthroughRect:(CGRect)a3;
@end

@implementation PRDismissalOverlayView

- (PRDismissalOverlayView)initWithFrame:(CGRect)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PRDismissalOverlayView;
  v3 = -[PRDismissalOverlayView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_touchPassthroughRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_touchPassthroughRect.size = v5;
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    leftTapRecognizerView = v4->_leftTapRecognizerView;
    v4->_leftTapRecognizerView = v6;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    rightTapRecognizerView = v4->_rightTapRecognizerView;
    v4->_rightTapRecognizerView = v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topTapRecognizerView = v4->_topTapRecognizerView;
    v4->_topTapRecognizerView = v10;

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomTapRecognizerView = v4->_bottomTapRecognizerView;
    v4->_bottomTapRecognizerView = v12;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v28[0] = v4->_leftTapRecognizerView;
    v28[1] = v4->_rightTapRecognizerView;
    v28[2] = v4->_topTapRecognizerView;
    v28[3] = v4->_bottomTapRecognizerView;
    v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 4, 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v20 = [v19 layer];
          [v20 setHitTestsAsOpaque:1];

          v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tapGestureRecognized_];
          [v19 addGestureRecognizer:v21];
          [(PRDismissalOverlayView *)v4 addSubview:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v16);
    }
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.double x = x;
  v12.double y = y;
  if (CGRectContainsPoint(self->_touchPassthroughRect, v12))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PRDismissalOverlayView;
    v8 = -[PRDismissalOverlayView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }

  return v8;
}

- (void)setTouchPassthroughRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_touchPassthroughRect = &self->_touchPassthroughRect;
  if (!CGRectEqualToRect(a3, self->_touchPassthroughRect))
  {
    p_touchPassthroughRect->origin.CGFloat x = x;
    p_touchPassthroughRect->origin.CGFloat y = y;
    p_touchPassthroughRect->size.CGFloat width = width;
    p_touchPassthroughRect->size.CGFloat height = height;
    [(PRDismissalOverlayView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PRDismissalOverlayView;
  [(PRDismissalOverlayView *)&v20 layoutSubviews];
  p_touchPassthroughRect = &self->_touchPassthroughRect;
  if (!CGRectEqualToRect(self->_touchPassthroughRect, *MEMORY[0x1E4F1DB20]))
  {
    [(PRDismissalOverlayView *)self bounds];
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    topTapRecognizerView = self->_topTapRecognizerView;
    double v9 = CGRectGetWidth(v21);
    v22.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v22.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v22.size.double width = self->_touchPassthroughRect.size.width;
    v22.size.double height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](topTapRecognizerView, "setFrame:", 0.0, 0.0, v9, CGRectGetMinY(v22));
    leftTapRecognizerView = self->_leftTapRecognizerView;
    v23.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v23.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v23.size.double width = self->_touchPassthroughRect.size.width;
    v23.size.double height = self->_touchPassthroughRect.size.height;
    double MinY = CGRectGetMinY(v23);
    v24.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v24.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v24.size.double width = self->_touchPassthroughRect.size.width;
    v24.size.double height = self->_touchPassthroughRect.size.height;
    double MinX = CGRectGetMinX(v24);
    v25.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v25.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v25.size.double width = self->_touchPassthroughRect.size.width;
    v25.size.double height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](leftTapRecognizerView, "setFrame:", 0.0, MinY, MinX, CGRectGetHeight(v25));
    rightTapRecognizerView = self->_rightTapRecognizerView;
    v26.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v26.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v26.size.double width = self->_touchPassthroughRect.size.width;
    v26.size.double height = self->_touchPassthroughRect.size.height;
    double MaxX = CGRectGetMaxX(v26);
    v27.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v27.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v27.size.double width = self->_touchPassthroughRect.size.width;
    v27.size.double height = self->_touchPassthroughRect.size.height;
    double v15 = CGRectGetMinY(v27);
    v28.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v28.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v28.size.double width = self->_touchPassthroughRect.size.width;
    v28.size.double height = self->_touchPassthroughRect.size.height;
    double v16 = width - CGRectGetMaxX(v28);
    v29.origin.CGFloat x = p_touchPassthroughRect->origin.x;
    v29.origin.CGFloat y = self->_touchPassthroughRect.origin.y;
    v29.size.double width = self->_touchPassthroughRect.size.width;
    v29.size.double height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](rightTapRecognizerView, "setFrame:", MaxX, v15, v16, CGRectGetHeight(v29));
    bottomTapRecognizerView = self->_bottomTapRecognizerView;
    double MaxY = CGRectGetMaxY(*p_touchPassthroughRect);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    double v19 = CGRectGetWidth(v30);
    -[UIView setFrame:](bottomTapRecognizerView, "setFrame:", 0.0, MaxY, v19, height - CGRectGetMaxY(*p_touchPassthroughRect));
  }
}

- (void)_tapGestureRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissalOverlayViewDidDismiss:self];
}

- (PRDismissalOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRDismissalOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)touchPassthroughRect
{
  double x = self->_touchPassthroughRect.origin.x;
  double y = self->_touchPassthroughRect.origin.y;
  double width = self->_touchPassthroughRect.size.width;
  double height = self->_touchPassthroughRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)leftTapRecognizerView
{
  return self->_leftTapRecognizerView;
}

- (void)setLeftTapRecognizerView:(id)a3
{
}

- (UIView)rightTapRecognizerView
{
  return self->_rightTapRecognizerView;
}

- (void)setRightTapRecognizerView:(id)a3
{
}

- (UIView)topTapRecognizerView
{
  return self->_topTapRecognizerView;
}

- (void)setTopTapRecognizerView:(id)a3
{
}

- (UIView)bottomTapRecognizerView
{
  return self->_bottomTapRecognizerView;
}

- (void)setBottomTapRecognizerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_topTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_leftTapRecognizerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end