@interface SBUIRingViewLabelButton
- (SBUIRingViewLabelButton)initWithFrame:(CGRect)a3;
- (TPRevealingRingView)backgroundRing;
- (UILabel)label;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBUIRingViewLabelButton

- (SBUIRingViewLabelButton)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SBUIRingViewLabelButton;
  v3 = -[SBUIRingViewLabelButton initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBUIRingViewLabelButton *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x1E4FADA58]);
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:paddingOutsideRing:", v6, v8, v10, v12, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    ringView = v4->_ringView;
    v4->_ringView = (TPRevealingRingView *)v14;

    [(TPRevealingRingView *)v4->_ringView setAutoresizingMask:18];
    [(TPRevealingRingView *)v4->_ringView setDefaultRingStrokeWidth:1.0];
    [(TPRevealingRingView *)v4->_ringView setRevealAnimationDuration:0.0];
    [(TPRevealingRingView *)v4->_ringView setUnrevealAnimationDuration:0.392500013];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v8, v10, v12);
    label = v4->_label;
    v4->_label = (UILabel *)v16;

    [(UILabel *)v4->_label setTextAlignment:1];
    [(UILabel *)v4->_label setAutoresizingMask:18];
    [(SBUIRingViewLabelButton *)v4 addSubview:v4->_ringView];
    [(SBUIRingViewLabelButton *)v4 addSubview:v4->_label];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBUIRingViewLabelButton *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    double v7 = self;
  }
  else {
    double v7 = 0;
  }
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBUIRingViewLabelButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)SBUIRingViewLabelButton;
  [(SBUIRingViewLabelButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(TPRevealingRingView *)self->_ringView setRevealed:v3 animated:1];
  }
}

- (TPRevealingRingView)backgroundRing
{
  return self->_ringView;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end