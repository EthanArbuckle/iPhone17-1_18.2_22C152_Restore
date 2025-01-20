@interface SXFullscreenNavigationBarView
- (BOOL)expanded;
- (SXFullscreenNavigationBarView)init;
- (SXFullscreenNavigationBarViewDelegate)delegate;
- (UIButton)button;
- (UIVisualEffectView)backgroundView;
- (void)createBackgroundView;
- (void)createDoneButton;
- (void)didMoveToSuperview;
- (void)doneButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)updateFrameAnimated:(BOOL)a3;
@end

@implementation SXFullscreenNavigationBarView

- (SXFullscreenNavigationBarView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenNavigationBarView;
  v2 = [(SXFullscreenNavigationBarView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SXFullscreenNavigationBarView *)v2 createBackgroundView];
    [(SXFullscreenNavigationBarView *)v3 createDoneButton];
  }
  return v3;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenNavigationBarView;
  [(SXFullscreenNavigationBarView *)&v3 didMoveToSuperview];
  [(SXFullscreenNavigationBarView *)self updateFrameAnimated:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenNavigationBarView;
  [(SXFullscreenNavigationBarView *)&v3 layoutSubviews];
  [(SXFullscreenNavigationBarView *)self updateFrameAnimated:0];
}

- (void)updateFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SXFullscreenNavigationBarView *)self superview];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v14 = [(SXFullscreenNavigationBarView *)self traitCollection];
  if ([v14 verticalSizeClass] == 1)
  {
    v15 = [(SXFullscreenNavigationBarView *)self traitCollection];
    if ([v15 horizontalSizeClass] == 1) {
      double v16 = 32.0;
    }
    else {
      double v16 = 44.0;
    }
  }
  else
  {
    double v16 = 44.0;
  }

  [(SXFullscreenNavigationBarView *)self safeAreaInsets];
  double v18 = v16 + v17;
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  CGFloat MinX = CGRectGetMinX(v32);
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  CGFloat Width = CGRectGetWidth(v33);
  BOOL v21 = [(SXFullscreenNavigationBarView *)self expanded];
  double v22 = 0.0;
  if (!v21)
  {
    CGFloat v23 = MinX;
    CGFloat v24 = Width;
    double v25 = v18;
    double v22 = 0.0 - CGRectGetHeight(*(CGRect *)(&v22 - 1));
  }
  CGFloat v26 = MinX;
  CGFloat v27 = Width;
  double v28 = v18;
  CGRect v34 = CGRectIntegral(*(CGRect *)(&v22 - 1));
  -[SXFullscreenNavigationBarView setFrame:](self, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __53__SXFullscreenNavigationBarView_updateFrameAnimated___block_invoke;
  v31[3] = &unk_2646511F8;
  v31[4] = self;
  uint64_t v29 = MEMORY[0x223CA5030](v31);
  v30 = (void *)v29;
  if (v3) {
    [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v29 options:0 animations:0.15 completion:0.0];
  }
  else {
    (*(void (**)(uint64_t))(v29 + 16))(v29);
  }
}

uint64_t __53__SXFullscreenNavigationBarView_updateFrameAnimated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = (double)[v1 expanded];
  return [v1 setAlpha:v2];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SXFullscreenNavigationBarView;
  -[SXFullscreenNavigationBarView setFrame:](&v24, sel_setFrame_);
  double v8 = [(SXFullscreenNavigationBarView *)self backgroundView];
  [(SXFullscreenNavigationBarView *)self bounds];
  objc_msgSend(v8, "setFrame:");

  uint64_t v9 = [(SXFullscreenNavigationBarView *)self superview];
  double v10 = (void *)v9;
  if (v9) {
    CGFloat v11 = (SXFullscreenNavigationBarView *)v9;
  }
  else {
    CGFloat v11 = self;
  }
  double v12 = v11;

  [(SXFullscreenNavigationBarView *)v12 safeAreaInsets];
  double v14 = v13;
  v15 = [(SXFullscreenNavigationBarView *)self traitCollection];
  double v16 = 22.0;
  if ([v15 verticalSizeClass] == 1)
  {
    double v17 = [(SXFullscreenNavigationBarView *)self traitCollection];
    if ([v17 horizontalSizeClass] == 1) {
      double v16 = 16.0;
    }
    else {
      double v16 = 22.0;
    }
  }
  [(SXFullscreenNavigationBarView *)self safeAreaInsets];
  double v19 = v18;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v20 = CGRectGetWidth(v25);
  BOOL v21 = [(SXFullscreenNavigationBarView *)self button];
  [v21 bounds];
  double v22 = v20 + CGRectGetWidth(v26) * -0.5 + -5.0 - v14;

  CGFloat v23 = [(SXFullscreenNavigationBarView *)self button];
  objc_msgSend(v23, "setCenter:", v22, v16 + v19);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  self->_expanded = a3;
  [(SXFullscreenNavigationBarView *)self updateFrameAnimated:a4];
}

- (void)createBackgroundView
{
  id v6 = [MEMORY[0x263F1C480] effectWithStyle:2];
  BOOL v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v6];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  [(UIVisualEffectView *)self->_backgroundView _setGroupName:@"captionBars"];
  objc_super v5 = [(SXFullscreenNavigationBarView *)self backgroundView];
  [(SXFullscreenNavigationBarView *)self addSubview:v5];
}

- (void)createDoneButton
{
  BOOL v3 = [MEMORY[0x263F1C488] buttonWithType:1];
  button = self->_button;
  self->_button = v3;

  objc_super v5 = [(SXFullscreenNavigationBarView *)self button];
  id v6 = SXBundle();
  CGFloat v7 = [v6 localizedStringForKey:@"Done" value:&stru_26D5311C0 table:0];
  [v5 setTitle:v7 forState:0];

  double v8 = [(SXFullscreenNavigationBarView *)self button];
  uint64_t v9 = [MEMORY[0x263F1C550] whiteColor];
  [v8 setTitleColor:v9 forState:0];

  double v10 = [(SXFullscreenNavigationBarView *)self button];
  CGFloat v11 = [v10 titleLabel];
  double v12 = (void *)MEMORY[0x263F1C658];
  [MEMORY[0x263F1C658] systemFontSize];
  double v13 = objc_msgSend(v12, "boldSystemFontOfSize:");
  [v11 setFont:v13];

  double v14 = [(SXFullscreenNavigationBarView *)self button];
  [v14 addTarget:self action:sel_doneButtonPressed_ forControlEvents:64];

  v15 = [(SXFullscreenNavigationBarView *)self button];
  [v15 sizeToFit];

  double v16 = (double *)MEMORY[0x263F00148];
  [(SXFullscreenNavigationBarView *)self frame];
  if (v17 >= 22.0)
  {
    double v19 = *v16;
  }
  else
  {
    [(SXFullscreenNavigationBarView *)self frame];
    double v19 = (22.0 - v18) * 0.5;
  }
  [(SXFullscreenNavigationBarView *)self frame];
  if (v20 >= 44.0)
  {
    double v22 = v16[1];
  }
  else
  {
    [(SXFullscreenNavigationBarView *)self frame];
    double v22 = (44.0 - v21) * 0.5;
  }
  CGFloat v23 = [(SXFullscreenNavigationBarView *)self button];
  objc_super v24 = [(SXFullscreenNavigationBarView *)self button];
  [v24 frame];
  CGRect v28 = CGRectInset(v27, -v19, -v22);
  objc_msgSend(v23, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);

  id v25 = [(SXFullscreenNavigationBarView *)self button];
  [(SXFullscreenNavigationBarView *)self addSubview:v25];
}

- (void)doneButtonPressed:(id)a3
{
  v4 = [(SXFullscreenNavigationBarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXFullscreenNavigationBarView *)self delegate];
    [v6 fullscreenNavigationBarViewDoneButtonPressed:self];
  }
}

- (SXFullscreenNavigationBarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXFullscreenNavigationBarViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end