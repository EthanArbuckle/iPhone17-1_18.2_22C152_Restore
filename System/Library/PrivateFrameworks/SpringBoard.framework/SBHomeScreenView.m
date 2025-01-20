@interface SBHomeScreenView
- (SBFStatusBarLegibilityView)statusBarLegibilityView;
- (SBHomeScreenView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation SBHomeScreenView

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenView;
  [(SBHomeScreenView *)&v12 layoutSubviews];
  [(SBHomeScreenView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBHomeScreenView *)self statusBarLegibilityView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (SBFStatusBarLegibilityView)statusBarLegibilityView
{
  return self->_statusBarLegibilityView;
}

- (SBHomeScreenView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenView;
  double v3 = -[SBHomeScreenView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (SBFStatusBarLegibilityView *)objc_alloc_init(MEMORY[0x1E4FA5FF8]);
    statusBarLegibilityView = v3->_statusBarLegibilityView;
    v3->_statusBarLegibilityView = v4;

    [(SBHomeScreenView *)v3 addSubview:v3->_statusBarLegibilityView];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(SBHomeScreenView *)self window];
  double v9 = v8;
  if (v8)
  {
    [v8 bounds];
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  [(SBHomeScreenView *)self transform];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v16 = *MEMORY[0x1E4F1DAB8];
  long long v17 = v14;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SBHomeScreenView *)self setTransform:&v16];
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenView;
  -[SBHomeScreenView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  long long v16 = v19;
  long long v17 = v20;
  long long v18 = v21;
  [(SBHomeScreenView *)self setTransform:&v16];
}

- (void)didMoveToWindow
{
  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenView;
  [(SBHomeScreenView *)&v13 didMoveToWindow];
  double v3 = [(SBHomeScreenView *)self window];
  double v4 = v3;
  if (v3)
  {
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(SBHomeScreenView *)self frame];
    v15.origin.double x = v6;
    v15.origin.double y = v8;
    v15.size.double width = v10;
    v15.size.double height = v12;
    if (!CGRectEqualToRect(v14, v15)) {
      -[SBHomeScreenView setFrame:](self, "setFrame:", v6, v8, v10, v12);
    }
  }
}

- (void).cxx_destruct
{
}

@end