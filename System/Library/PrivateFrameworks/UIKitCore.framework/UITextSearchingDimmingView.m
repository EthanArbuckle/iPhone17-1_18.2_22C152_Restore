@interface UITextSearchingDimmingView
- (BOOL)_wantsTargetOfKeyboardEventDeferringEnvironment;
- (NSArray)textRects;
- (UIEdgeInsets)contentInset;
- (UITextSearchingDimmingView)initWithFrame:(CGRect)a3;
- (void)_updatePunchoutPathForVisibleRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setTextRects:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITextSearchingDimmingView

- (UITextSearchingDimmingView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UITextSearchingDimmingView;
  v3 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    brighteningLayer = v3->_brighteningLayer;
    v3->_brighteningLayer = v4;

    id v6 = +[UIColor colorWithWhite:1.0 alpha:0.2];
    -[CAShapeLayer setFillColor:](v3->_brighteningLayer, "setFillColor:", [v6 CGColor]);

    [(CAShapeLayer *)v3->_brighteningLayer setCompositingFilter:*MEMORY[0x1E4F3A220]];
    v7 = [(UIView *)v3 layer];
    [v7 addSublayer:v3->_brighteningLayer];

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    dimmingLayer = v3->_dimmingLayer;
    v3->_dimmingLayer = v8;

    id v10 = +[UIColor _dimmingViewColor];
    -[CALayer setBackgroundColor:](v3->_dimmingLayer, "setBackgroundColor:", [v10 CGColor]);

    v11 = [(UIView *)v3 layer];
    [v11 addSublayer:v3->_dimmingLayer];

    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    punchoutLayer = v3->_punchoutLayer;
    v3->_punchoutLayer = v12;

    [(CAShapeLayer *)v3->_punchoutLayer setCompositingFilter:*MEMORY[0x1E4F3A098]];
    [(CALayer *)v3->_dimmingLayer addSublayer:v3->_punchoutLayer];
  }
  return v3;
}

- (void)setTextRects:(id)a3
{
  self->_punchoutPathIsValid = 0;
  objc_storeStrong((id *)&self->_textRects, a3);
  [(UIView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextSearchingDimmingView;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  [(UIView *)self setNeedsLayout];
}

- (void)_updatePunchoutPathForVisibleRect:(CGRect)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v5 = self->_textRects;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    double Height = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) CGRectValue];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double left = self->_contentInset.left;
        [(UIView *)self bounds];
        double v20 = v19;
        double top = self->_contentInset.top;
        [(UIView *)self bounds];
        double v23 = v22;
        v45.origin.x = v11;
        v45.origin.y = v13;
        v45.size.width = v15;
        v45.size.height = v17;
        if (CGRectGetWidth(v45) != 0.0)
        {
          v46.origin.x = v11;
          v46.origin.y = v13;
          v46.size.width = v15;
          v46.size.height = v17;
          if (CGRectIntersectsRect(v46, a3))
          {
            [(UIView *)self contentScaleFactor];
            double v25 = UIRectIntegralWithScale(v11 - v20 - left, v13 - v23 - top, v15, v17, v24);
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
            [v4 addObject:v32];
            v47.origin.x = v25;
            v47.origin.y = v27;
            v47.size.width = v29;
            v47.size.height = v31;
            if (CGRectGetHeight(v47) < Height)
            {
              v48.origin.x = v25;
              v48.origin.y = v27;
              v48.size.width = v29;
              v48.size.height = v31;
              double Height = CGRectGetHeight(v48);
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v7);
  }
  else
  {
    double Height = 1.79769313e308;
  }

  if (Height == 1.79769313e308) {
    double v33 = 3.0;
  }
  else {
    double v33 = Height * 0.25;
  }
  v34 = [[UIPreviewParameters alloc] initWithTextLineRects:v4];
  [(UIPreviewParameters *)v34 _setTextPathCornerRadius:v33];
  -[UIPreviewParameters _setTextPathInsets:](v34, "_setTextPathInsets:", 0.0, 0.0, 0.0, 0.0);
  id v35 = [(UIPreviewParameters *)v34 visiblePath];
  v36 = (const CGPath *)[v35 CGPath];

  [(CAShapeLayer *)self->_punchoutLayer setPath:CGPathCreateMutableCopy(v36)];
}

- (void)layoutSubviews
{
  if (!self->_punchoutPathIsValid)
  {
    [(UIView *)self visibleBounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(UIView *)self _containingScrollView];

    if (v11)
    {
      double v12 = [(UIView *)self _containingScrollView];
      [v12 visibleBounds];
      double v4 = v13;
      double v6 = v14;
      double v8 = v15;
      double v10 = v16;
    }
    -[UITextSearchingDimmingView _updatePunchoutPathForVisibleRect:](self, "_updatePunchoutPathForVisibleRect:", v4, v6, v8, v10);
    self->_punchoutPathIsValid = 1;
  }
  double v17 = [(UIView *)self traitCollection];
  uint64_t v18 = [v17 userInterfaceStyle];

  if (v18 == 2) {
    [(CAShapeLayer *)self->_brighteningLayer setPath:CGPathCreateMutableCopy([(CAShapeLayer *)self->_punchoutLayer path])];
  }
  [(CAShapeLayer *)self->_brighteningLayer setHidden:v18 != 2];
  [(UIView *)self bounds];
  dimmingLayer = self->_dimmingLayer;
  -[CALayer setFrame:](dimmingLayer, "setFrame:");
}

- (BOOL)_wantsTargetOfKeyboardEventDeferringEnvironment
{
  return 1;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSArray)textRects
{
  return self->_textRects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRects, 0);
  objc_storeStrong((id *)&self->_punchoutLayer, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_brighteningLayer, 0);
}

@end