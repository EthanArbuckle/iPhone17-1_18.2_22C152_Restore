@interface SFWebpageStatusBarView
- (BOOL)suppressShowingStatusBar;
- (CGPoint)_originForStatusBarContentViewForContentHeight:(double)a3;
- (CGPoint)hoverPoint;
- (SFWebPageStatusBarMessage)statusMessage;
- (SFWebpageStatusBarView)initWithFrame:(CGRect)a3;
- (void)_cancelPendingStatusBarHideIfNeeded;
- (void)_clearStatusBarIsEnabledMessage;
- (void)_hideStatusBar;
- (void)_showStatusBar;
- (void)clearStatus;
- (void)displayStatusBarIsEnabledMessage;
- (void)layoutSubviews;
- (void)setHoverPoint:(CGPoint)a3;
- (void)setStatusMessage:(id)a3;
- (void)setSuppressShowingStatusBar:(BOOL)a3;
@end

@implementation SFWebpageStatusBarView

- (SFWebpageStatusBarView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SFWebpageStatusBarView;
  v3 = -[SFWebpageStatusBarView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFWebpageStatusBarView *)v3 setUserInteractionEnabled:0];
    [(SFWebpageStatusBarView *)v4 setAutoresizingMask:18];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    statusBarContentView = v4->_statusBarContentView;
    v4->_statusBarContentView = v5;

    [(UIView *)v4->_statusBarContentView setAlpha:0.0];
    [(SFWebpageStatusBarView *)v4 addSubview:v4->_statusBarContentView];
    v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
    [v8 setAutoresizingMask:18];
    [v8 _setContinuousCornerRadius:8.0];
    [(UIView *)v4->_statusBarContentView addSubview:v8];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    statusLabel = v4->_statusLabel;
    v4->_statusLabel = v9;

    [(UILabel *)v4->_statusLabel setNumberOfLines:1];
    [(UILabel *)v4->_statusLabel setLineBreakMode:5];
    [(UILabel *)v4->_statusLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v4->_statusLabel setFont:v11];

    [(UIView *)v4->_statusBarContentView addSubview:v4->_statusLabel];
    v12 = (SFWebPageStatusBarMessage *)objc_alloc_init((Class)self);
    statusMessage = v4->_statusMessage;
    v4->_statusMessage = v12;

    v14 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SFWebpageStatusBarView;
  [(SFWebpageStatusBarView *)&v14 layoutSubviews];
  if (([(SFWebPageStatusBarMessage *)self->_statusMessage isEmpty] & 1) == 0)
  {
    [(SFWebpageStatusBarView *)self safeAreaInsets];
    double v4 = v3 * 2.0 + 10.0;
    [(UILabel *)self->_statusLabel frame];
    double v6 = v5;
    [(SFWebpageStatusBarView *)self bounds];
    double v7 = CGRectGetWidth(v15) + -20.0 - v4;
    [(UILabel *)self->_statusLabel bounds];
    -[UILabel setFrame:](self->_statusLabel, "setFrame:", 10.0, 10.0, fmin(CGRectGetWidth(v16), v7), v6);
    [(UILabel *)self->_statusLabel bounds];
    CGFloat v8 = CGRectGetWidth(v17) + 20.0;
    [(UILabel *)self->_statusLabel bounds];
    CGFloat v9 = CGRectGetHeight(v18) + 20.0;
    [(SFWebpageStatusBarView *)self _originForStatusBarContentViewForContentHeight:v9];
    double v11 = v10;
    double v13 = v12;
    [(UIView *)self->_statusBarContentView frame];
    -[UIView setFrame:](self->_statusBarContentView, "setFrame:", v11, v13, v8, v9);
  }
}

- (CGPoint)_originForStatusBarContentViewForContentHeight:(double)a3
{
  char v5 = ![(UIView *)self _sf_usesLeftToRightLayout];
  [(SFWebpageStatusBarView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(UIView *)self->_statusBarContentView frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(SFWebpageStatusBarView *)self safeAreaInsets];
  double v19 = v18;
  v30.origin.CGFloat x = v7;
  v30.origin.CGFloat y = v9;
  v30.size.CGFloat width = v11;
  v30.size.height = v13;
  CGFloat Height = CGRectGetHeight(v30);
  v31.origin.CGFloat x = _SFFlipRectInCoordinateSpace(v5, v19 + 5.0, Height - a3 + -5.0 - v19, v15, v17, v7, v9, v11, v13);
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat v24 = v31.size.height;
  char v25 = CGRectContainsPoint(v31, self->_hoverPoint);

  double v26 = _SFFlipRectInCoordinateSpace(v25, x, y, width, v24, v7, v9, v11, v13);
  result.CGFloat y = v27;
  result.CGFloat x = v26;
  return result;
}

- (void)setStatusMessage:(id)a3
{
  id v14 = a3;
  char v5 = [(SFWebPageStatusBarMessage *)self->_statusMessage isEqual:v14];
  double v6 = v14;
  if ((v5 & 1) == 0)
  {
    int v7 = [v14 isEmpty];
    double v6 = v14;
    int v8 = v7;
    dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
    if (!dismissStatusBarEnabledTimer || (v8 & 1) == 0)
    {
      if (v8)
      {
        char v10 = [(SFWebPageStatusBarMessage *)self->_statusMessage isEmpty];
        double v6 = v14;
        if (v10) {
          goto LABEL_16;
        }
        dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
      }
      if (dismissStatusBarEnabledTimer)
      {
        [(NSTimer *)dismissStatusBarEnabledTimer invalidate];
        CGFloat v11 = self->_dismissStatusBarEnabledTimer;
        self->_dismissStatusBarEnabledTimer = 0;
      }
      objc_storeStrong((id *)&self->_statusMessage, a3);
      if (self->_suppressShowingStatusBar) {
        int v12 = 1;
      }
      else {
        int v12 = v8;
      }
      [(SFWebpageStatusBarView *)self _cancelPendingStatusBarHideIfNeeded];
      if (v12 == 1)
      {
        [(SFWebpageStatusBarView *)self performSelector:sel__hideStatusBar withObject:0 afterDelay:0.2];
      }
      else
      {
        CGFloat v13 = [v14 attributedMessageString];
        [(UILabel *)self->_statusLabel setAttributedText:v13];
        [(UILabel *)self->_statusLabel sizeToFit];
        [(SFWebpageStatusBarView *)self setNeedsLayout];
        [(SFWebpageStatusBarView *)self _showStatusBar];
      }
      double v6 = v14;
    }
  }
LABEL_16:
}

- (void)clearStatus
{
  id v3 = objc_alloc_init((Class)self);
  [(SFWebpageStatusBarView *)self setStatusMessage:v3];
}

- (void)setHoverPoint:(CGPoint)a3
{
  p_hoverPoint = &self->_hoverPoint;
  if (a3.x != self->_hoverPoint.x || a3.y != self->_hoverPoint.y)
  {
    p_hoverPoint->CGFloat x = a3.x;
    self->_hoverPoint.CGFloat y = a3.y;
    if (self->_shouldDodgeHoverPoint)
    {
      [(UIView *)self->_statusBarContentView frame];
      if (CGRectContainsPoint(v7, *p_hoverPoint))
      {
        [(SFWebpageStatusBarView *)self setNeedsLayout];
      }
    }
  }
}

- (void)_showStatusBar
{
  self->_shouldDodgeHoverPoint = 1;
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v4 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SFWebpageStatusBarView__showStatusBar__block_invoke;
  v5[3] = &unk_1E54E9858;
  v5[4] = self;
  objc_msgSend(v3, "sf_animate:withDuration:delay:options:animations:completion:", v4, 0, v5, 0, 0.25, 0.0);
}

uint64_t __40__SFWebpageStatusBarView__showStatusBar__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

- (void)_hideStatusBar
{
  self->_shouldDodgeHoverPoint = 0;
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v4 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SFWebpageStatusBarView__hideStatusBar__block_invoke;
  v5[3] = &unk_1E54E9858;
  v5[4] = self;
  objc_msgSend(v3, "sf_animate:withDuration:delay:options:animations:completion:", v4, 0, v5, 0, 0.25, 0.0);
}

uint64_t __40__SFWebpageStatusBarView__hideStatusBar__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

- (void)_cancelPendingStatusBarHideIfNeeded
{
}

- (void)displayStatusBarIsEnabledMessage
{
  id v3 = [SFWebpageStatusBarInfoMessage alloc];
  uint64_t v4 = _WBSLocalizedString();
  CGRect v7 = -[SFWebpageStatusBarInfoMessage initWithString:]((id *)&v3->super.isa, v4);

  [(SFWebpageStatusBarView *)self setStatusMessage:v7];
  char v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__clearStatusBarIsEnabledMessage selector:0 userInfo:0 repeats:2.0];
  dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
  self->_dismissStatusBarEnabledTimer = v5;
}

- (void)_clearStatusBarIsEnabledMessage
{
  [(NSTimer *)self->_dismissStatusBarEnabledTimer invalidate];
  dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
  self->_dismissStatusBarEnabledTimer = 0;

  [(SFWebpageStatusBarView *)self clearStatus];
}

- (SFWebPageStatusBarMessage)statusMessage
{
  return self->_statusMessage;
}

- (CGPoint)hoverPoint
{
  double x = self->_hoverPoint.x;
  double y = self->_hoverPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)suppressShowingStatusBar
{
  return self->_suppressShowingStatusBar;
}

- (void)setSuppressShowingStatusBar:(BOOL)a3
{
  self->_suppressShowingStatusBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_dismissStatusBarEnabledTimer, 0);
  objc_storeStrong((id *)&self->_statusBarContentView, 0);

  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end