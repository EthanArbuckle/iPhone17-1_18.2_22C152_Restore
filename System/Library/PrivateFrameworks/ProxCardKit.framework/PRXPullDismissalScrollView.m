@interface PRXPullDismissalScrollView
- (BOOL)allowsPullToDismiss;
- (PRXPullDismissalScrollView)initWithFrame:(CGRect)a3;
- (UIView)dismissableContentContainerView;
- (double)dismissalPercent;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAllowsPullToDismiss:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PRXPullDismissalScrollView

- (PRXPullDismissalScrollView)initWithFrame:(CGRect)a3
{
  v34[6] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)PRXPullDismissalScrollView;
  v3 = -[PRXPullDismissalScrollView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PRXPullDismissalScrollView *)v3 setContentInsetAdjustmentBehavior:2];
    [(PRXPullDismissalScrollView *)v4 setKeyboardDismissMode:1];
    [(PRXPullDismissalScrollView *)v4 setPagingEnabled:1];
    [(PRXPullDismissalScrollView *)v4 setClipsToBounds:0];
    [(PRXPullDismissalScrollView *)v4 setShowsVerticalScrollIndicator:0];
    [(PRXPullDismissalScrollView *)v4 setShowsHorizontalScrollIndicator:0];
    [(PRXPullDismissalScrollView *)v4 setUserInteractionEnabled:1];
    [(PRXPullDismissalScrollView *)v4 setAlwaysBounceVertical:1];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    dismissableContentContainerView = v4->_dismissableContentContainerView;
    v4->_dismissableContentContainerView = v5;

    [(UIView *)v4->_dismissableContentContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXPullDismissalScrollView *)v4 addSubview:v4->_dismissableContentContainerView];
    v25 = [(PRXPullDismissalScrollView *)v4 contentLayoutGuide];
    v7 = [(PRXPullDismissalScrollView *)v4 frameLayoutGuide];
    v22 = (void *)MEMORY[0x263F08938];
    [(UIView *)v4->_dismissableContentContainerView heightAnchor];
    v32 = v31 = v7;
    v30 = [v7 heightAnchor];
    v29 = [v32 constraintEqualToAnchor:v30 multiplier:1.0];
    v34[0] = v29;
    v28 = [(UIView *)v4->_dismissableContentContainerView widthAnchor];
    v27 = [v7 widthAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 multiplier:1.0];
    v34[1] = v26;
    v24 = [(UIView *)v4->_dismissableContentContainerView bottomAnchor];
    v23 = [v25 bottomAnchor];
    v21 = [v24 constraintEqualToAnchor:v23];
    v34[2] = v21;
    v20 = [(UIView *)v4->_dismissableContentContainerView leadingAnchor];
    v19 = [v25 leadingAnchor];
    v8 = [v20 constraintEqualToAnchor:v19];
    v34[3] = v8;
    v9 = [(UIView *)v4->_dismissableContentContainerView trailingAnchor];
    v10 = [v25 trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v34[4] = v11;
    v12 = [(PRXPullDismissalScrollView *)v4 contentLayoutGuide];
    v13 = [v12 widthAnchor];
    v14 = [(PRXPullDismissalScrollView *)v4 widthAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v34[5] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
    [v22 activateConstraints:v16];

    v17 = v4;
  }

  return v4;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PRXPullDismissalScrollView;
  [(PRXPullDismissalScrollView *)&v3 didMoveToWindow];
  self->_hasDimissed = 0;
}

- (void)updateConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)PRXPullDismissalScrollView;
  [(PRXPullDismissalScrollView *)&v9 updateConstraints];
  if (!self->_contentHeightConstraint)
  {
    objc_super v3 = [(PRXPullDismissalScrollView *)self contentLayoutGuide];
    v4 = [v3 heightAnchor];
    v5 = [(PRXPullDismissalScrollView *)self heightAnchor];
    double v6 = 2.0;
    if (!self->_allowsPullToDismiss) {
      double v6 = 1.0;
    }
    v7 = [v4 constraintEqualToAnchor:v5 multiplier:v6];
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v7;

    [(NSLayoutConstraint *)self->_contentHeightConstraint setActive:1];
  }
}

- (void)layoutSubviews
{
  if (([(PRXPullDismissalScrollView *)self isDragging] & 1) != 0
    || [(PRXPullDismissalScrollView *)self isDecelerating])
  {
    [(PRXPullDismissalScrollView *)self dismissalPercent];
    char v3 = 1;
    if (v4 >= 1.0) {
      self->_hasDimissed = 1;
    }
  }
  else
  {
    char v3 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PRXPullDismissalScrollView;
  [(PRXPullDismissalScrollView *)&v11 layoutSubviews];
  [(PRXPullDismissalScrollView *)self frame];
  BOOL v9 = self->_lastLayoutFrame.size.width == v7;
  if (self->_lastLayoutFrame.size.height != v8) {
    BOOL v9 = 0;
  }
  if ((v3 & 1) == 0 && !v9)
  {
    self->_lastLayoutFrame.origin.x = v5;
    self->_lastLayoutFrame.origin.y = v6;
    self->_lastLayoutFrame.size.width = v7;
    self->_lastLayoutFrame.size.height = v8;
    double Height = 0.0;
    if (!self->_hasDimissed && self->_allowsPullToDismiss) {
      double Height = CGRectGetHeight(*(CGRect *)&v5);
    }
    -[PRXPullDismissalScrollView setContentOffset:](self, "setContentOffset:", 0.0, Height);
  }
}

- (void)setAllowsPullToDismiss:(BOOL)a3
{
  if (self->_allowsPullToDismiss != a3)
  {
    self->_allowsPullToDismiss = a3;
    [(NSLayoutConstraint *)self->_contentHeightConstraint setActive:0];
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = 0;

    CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->_lastLayoutFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_lastLayoutFrame.size = v5;
    [(PRXPullDismissalScrollView *)self setNeedsUpdateConstraints];
  }
}

- (double)dismissalPercent
{
  if (!self->_allowsPullToDismiss) {
    return 0.0;
  }
  [(PRXPullDismissalScrollView *)self frame];
  double Height = CGRectGetHeight(v7);
  [(PRXPullDismissalScrollView *)self contentOffset];
  double v5 = Height - v4;
  [(PRXPullDismissalScrollView *)self frame];
  return v5 / CGRectGetHeight(v8);
}

- (BOOL)allowsPullToDismiss
{
  return self->_allowsPullToDismiss;
}

- (UIView)dismissableContentContainerView
{
  return self->_dismissableContentContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissableContentContainerView, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
}

@end