@interface SBUIPasscodePillButton
- (NSString)title;
- (SBUIPasscodePillButton)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (double)highlightedAlpha;
- (double)unhighlightedAlpha;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedAlpha:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUnhighlightedAlpha:(double)a3;
@end

@implementation SBUIPasscodePillButton

- (SBUIPasscodePillButton)initWithFrame:(CGRect)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)SBUIPasscodePillButton;
  v3 = -[SBUIPasscodePillButton initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_unhighlightedAlpha = 0.1;
    v3->_highlightedAlpha = 0.65;
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUIPasscodePillButton *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    pillView = v4->_pillView;
    v4->_pillView = (UIView *)v6;

    v8 = v4->_pillView;
    [(SBUIPasscodePillButton *)v4 unhighlightedAlpha];
    -[UIView setAlpha:](v8, "setAlpha:");
    v9 = v4->_pillView;
    v10 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIView *)v9 setBackgroundColor:v10];

    v11 = [(UIView *)v4->_pillView layer];
    uint64_t v12 = *MEMORY[0x1E4F39EA8];
    [v11 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [(SBUIPasscodePillButton *)v4 addSubview:v4->_pillView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    backdropView = v4->_backdropView;
    v4->_backdropView = v13;

    v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v15 setName:@"saturation"];
    [v15 setValue:&unk_1EFCEAE18 forKey:@"inputAmount"];
    v16 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E4F39B40]);
    backdropLayer = v4->_backdropLayer;
    v4->_backdropLayer = v16;

    v18 = v4->_backdropLayer;
    v45[0] = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    [(CABackdropLayer *)v18 setFilters:v19];

    [(CABackdropLayer *)v4->_backdropLayer setCornerCurve:v12];
    v20 = [(UIView *)v4->_backdropView layer];
    [v20 addSublayer:v4->_backdropLayer];

    [(SBUIPasscodePillButton *)v4 addSubview:v4->_backdropView];
    id v21 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v22;

    v24 = v4->_titleLabel;
    v25 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.48];
    [(UILabel *)v24 setTextColor:v25];

    v26 = [(UILabel *)v4->_titleLabel layer];
    v27 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v26 setCompositingFilter:v27];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBUIPasscodePillButton *)v4 addSubview:v4->_titleLabel];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v4->_titleLabel, 0);
    v30 = [v28 constraintsWithVisualFormat:@"|-(>=16)-[_titleLabel]-(>=16)-|" options:0 metrics:0 views:v29];
    [v28 activateConstraints:v30];

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v4->_titleLabel, 0);
    v33 = [v31 constraintsWithVisualFormat:@"V:|-(14)-[_titleLabel]-(14)-|" options:0 metrics:0 views:v32];
    [v31 activateConstraints:v33];

    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UILabel *)v4->_titleLabel centerXAnchor];
    v36 = [(SBUIPasscodePillButton *)v4 centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v44[0] = v37;
    v38 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v39 = [(SBUIPasscodePillButton *)v4 centerYAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v44[1] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    [v34 activateConstraints:v41];
  }
  return v4;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (UIFont)font
{
  return [(UILabel *)self->_titleLabel font];
}

- (void)setFont:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodePillButton;
  -[SBUIPasscodePillButton setHighlighted:](&v10, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 0.85;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F43008]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SBUIPasscodePillButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E5CCC5A8;
  v8[4] = self;
  BOOL v9 = v3;
  v7 = objc_msgSend(v6, "initWithDuration:controlPoint1:controlPoint2:animations:", v8, v5, 0.0, 0.0, 0.0, 1.0);
  [v7 startAnimation];
}

uint64_t __41__SBUIPasscodePillButton_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[58];
  if (*(unsigned char *)(a1 + 40)) {
    [v2 highlightedAlpha];
  }
  else {
    [v2 unhighlightedAlpha];
  }
  return objc_msgSend(v3, "setAlpha:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBUIPasscodePillButton *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    v7 = self;
  }
  else {
    v7 = 0;
  }
  return v7;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodePillButton;
  [(SBUIPasscodePillButton *)&v7 layoutSubviews];
  [(SBUIPasscodePillButton *)self bounds];
  double v4 = v3 * 0.5;
  -[UIView setFrame:](self->_pillView, "setFrame:");
  double v5 = [(UIView *)self->_pillView layer];
  [v5 setCornerRadius:v4];

  backdropLayer = self->_backdropLayer;
  [(UIView *)self->_pillView frame];
  -[CABackdropLayer setFrame:](backdropLayer, "setFrame:");
  [(CABackdropLayer *)self->_backdropLayer setCornerRadius:v4];
}

- (double)unhighlightedAlpha
{
  return self->_unhighlightedAlpha;
}

- (void)setUnhighlightedAlpha:(double)a3
{
  self->_unhighlightedAlpha = a3;
}

- (double)highlightedAlpha
{
  return self->_highlightedAlpha;
}

- (void)setHighlightedAlpha:(double)a3
{
  self->_highlightedAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end