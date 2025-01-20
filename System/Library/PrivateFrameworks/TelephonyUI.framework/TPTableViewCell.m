@interface TPTableViewCell
+ (BOOL)requiresConstraintBasedLayout;
+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3;
- (BOOL)isAccessiblityConstraintsEnabled;
- (BOOL)isConstraintsLoaded;
- (BOOL)isForegroundViewLoaded;
- (NSLayoutConstraint)foregroundViewBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)foregroundViewLeadingAnchorLayoutConstraint;
- (NSLayoutConstraint)foregroundViewTopAnchorLayoutConstraint;
- (NSLayoutConstraint)foregroundViewTrailingAnchorLayoutConstraint;
- (TPTableViewCell)init;
- (TPTableViewCell)initWithCoder:(id)a3;
- (TPTableViewCell)initWithFrame:(CGRect)a3;
- (TPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)foregroundColor;
- (UIEdgeInsets)intrinsicSeparatorInset;
- (UIView)foregroundView;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setAccessiblityConstraintsEnabled:(BOOL)a3;
- (void)setConstraintsLoaded:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setForegroundViewLoaded:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unloadConstraints;
- (void)updateConstraints;
@end

@implementation TPTableViewCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (TPTableViewCell)init
{
  return -[TPTableViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (TPTableViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPTableViewCell;
  double v3 = [(TPTableViewCell *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(TPTableViewCell *)v3 commonInit];
  }
  return v4;
}

- (TPTableViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPTableViewCell;
  double v3 = -[TPTableViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(TPTableViewCell *)v3 commonInit];
  }
  return v4;
}

- (TPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPTableViewCell;
  double v4 = [(TPTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4) {
    [(TPTableViewCell *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  double v3 = [(TPTableViewCell *)self traitCollection];
  self->_accessiblityConstraintsEnabled = [v3 isPreferredContentSizeCategoryAccessible];

  [(TPTableViewCell *)self loadContentView];
}

- (void)unloadConstraints
{
  double v3 = [(TPTableViewCell *)self constraints];
  [(TPTableViewCell *)self removeConstraints:v3];

  [(TPTableViewCell *)self setConstraintsLoaded:0];
}

- (void)updateConstraints
{
  if (![(TPTableViewCell *)self isConstraintsLoaded])
  {
    [(TPTableViewCell *)self updateFonts];
    [(TPTableViewCell *)self loadConstraints];
    [(TPTableViewCell *)self intrinsicSeparatorInset];
    -[TPTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
    [(TPTableViewCell *)self setConstraintsLoaded:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)TPTableViewCell;
  [(TPTableViewCell *)&v3 updateConstraints];
}

- (UIColor)foregroundColor
{
  if ([(TPTableViewCell *)self isForegroundViewLoaded])
  {
    objc_super v3 = [(TPTableViewCell *)self foregroundView];
    double v4 = [v3 backgroundColor];
  }
  else
  {
    double v4 = 0;
  }
  return (UIColor *)v4;
}

- (void)setForegroundColor:(id)a3
{
  id v10 = a3;
  if (v10
    && ([MEMORY[0x1E4FB1618] clearColor],
        double v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v10 isEqual:v4],
        v4,
        (v5 & 1) == 0))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(TPTableViewCell *)self setForegroundView:v7];

    v8 = [(TPTableViewCell *)self foregroundView];
    [v8 setBackgroundColor:v10];

    v9 = [(TPTableViewCell *)self foregroundView];
    [(TPTableViewCell *)self addSubview:v9];
  }
  else
  {
    objc_super v6 = [(TPTableViewCell *)self foregroundView];
    [v6 removeFromSuperview];

    [(TPTableViewCell *)self setForegroundView:0];
  }
}

- (UIEdgeInsets)intrinsicSeparatorInset
{
  objc_super v3 = objc_opt_class();
  double v4 = [(TPTableViewCell *)self traitCollection];
  char v5 = [v4 preferredContentSizeCategory];
  [v3 separatorInsetForContentSizeCategory:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TPTableViewCell;
  [(TPTableViewCell *)&v13 layoutSubviews];
  if ([(TPTableViewCell *)self isForegroundViewLoaded])
  {
    [(TPTableViewCell *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(TPTableViewCell *)self foregroundView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    double v12 = [(TPTableViewCell *)self foregroundView];
    [(TPTableViewCell *)self bringSubviewToFront:v12];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TPTableViewCell;
  id v4 = a3;
  [(TPTableViewCell *)&v11 traitCollectionDidChange:v4];
  double v5 = [(TPTableViewCell *)self traitCollection];
  double v6 = [v4 preferredContentSizeCategory];

  double v7 = [v5 preferredContentSizeCategory];

  if (v6 != v7)
  {
    uint64_t v8 = [v5 isPreferredContentSizeCategoryAccessible];
    double v9 = (void *)*MEMORY[0x1E4FB27F0];
    int v10 = v8 ^ [(TPTableViewCell *)self isAccessiblityConstraintsEnabled];
    if (v6 == v9)
    {
      if (v10) {
        self->_accessiblityConstraintsEnabled = v8;
      }
    }
    else
    {
      if (v10) {
        [(TPTableViewCell *)self setAccessiblityConstraintsEnabled:v8];
      }
      [(TPTableViewCell *)self updateFonts];
      [(TPTableViewCell *)self updateConstraintsConstants];
      [(TPTableViewCell *)self intrinsicSeparatorInset];
      -[TPTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
    }
  }
}

- (void)setAccessiblityConstraintsEnabled:(BOOL)a3
{
  if (self->_accessiblityConstraintsEnabled != a3)
  {
    self->_accessiblityConstraintsEnabled = a3;
    [(TPTableViewCell *)self unloadConstraints];
    [(TPTableViewCell *)self setNeedsUpdateConstraints];
    [(TPTableViewCell *)self layoutIfNeeded];
  }
}

- (void)setForegroundView:(id)a3
{
  double v5 = (UIView *)a3;
  foregroundView = self->_foregroundView;
  double v7 = v5;
  if (foregroundView != v5)
  {
    [(UIView *)foregroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_foregroundView, a3);
    if (self->_foregroundView) {
      -[TPTableViewCell addSubview:](self, "addSubview:");
    }
  }
}

- (BOOL)isForegroundViewLoaded
{
  return self->_foregroundView != 0;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (BOOL)isAccessiblityConstraintsEnabled
{
  return self->_accessiblityConstraintsEnabled;
}

- (BOOL)isConstraintsLoaded
{
  return self->_constraintsLoaded;
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

- (void)setForegroundViewLoaded:(BOOL)a3
{
  self->_foregroundViewLoaded = a3;
}

- (NSLayoutConstraint)foregroundViewLeadingAnchorLayoutConstraint
{
  return self->_foregroundViewLeadingAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewTrailingAnchorLayoutConstraint
{
  return self->_foregroundViewTrailingAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewTopAnchorLayoutConstraint
{
  return self->_foregroundViewTopAnchorLayoutConstraint;
}

- (NSLayoutConstraint)foregroundViewBottomAnchorLayoutConstraint
{
  return self->_foregroundViewBottomAnchorLayoutConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundViewBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end