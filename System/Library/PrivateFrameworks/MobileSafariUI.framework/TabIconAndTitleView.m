@interface TabIconAndTitleView
+ (double)defaultTabIconSize;
- (BOOL)showsUnreadIndicator;
- (double)_tabIconSize;
- (double)_titleInsets;
- (id)icon;
- (id)initWithAlignment:(void *)a1;
- (id)title;
- (id)titleFont;
- (uint64_t)setNumberOfLines:(uint64_t)result;
- (uint64_t)setShowsUnreadIndicator:(uint64_t)result;
- (uint64_t)setTextColor:(uint64_t)result;
- (uint64_t)setTitleFont:(uint64_t)result;
- (void)_preferredContentSizeCategoryDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)layoutSubviews;
- (void)setAlignment:(void *)a1;
- (void)setIcon:(id *)a1;
- (void)setTitle:(id *)a1;
@end

@implementation TabIconAndTitleView

+ (double)defaultTabIconSize
{
  return 16.0;
}

- (id)initWithAlignment:(void *)a1
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)TabIconAndTitleView;
  v3 = objc_msgSendSuper2(&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = v3;
  if (v3)
  {
    v3[56] = a2;
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v6 = (void *)*((void *)v4 + 51);
    *((void *)v4 + 51) = v5;

    [*((id *)v4 + 51) setContentMode:1];
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [*((id *)v4 + 51) setTintColor:v7];

    [v4 addSubview:*((void *)v4 + 51)];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v9 = (void *)*((void *)v4 + 52);
    *((void *)v4 + 52) = v8;

    v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    [*((id *)v4 + 52) setFont:v10];

    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [*((id *)v4 + 52) setBackgroundColor:v11];

    [*((id *)v4 + 52) setOpaque:0];
    [*((id *)v4 + 52) setAccessibilityIdentifier:@"TabOverviewItemTitleLabel"];
    [v4 addSubview:*((void *)v4 + 52)];
    v12 = [v4 traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    *((unsigned char *)v4 + 424) = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v18[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = (id)[v4 registerForTraitChanges:v14 withTarget:v4 action:sel__preferredContentSizeCategoryDidChange_previousTraitCollection_];
  }
  return v4;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)TabIconAndTitleView;
  [(TabIconAndTitleView *)&v32 layoutSubviews];
  double v3 = -[TabIconAndTitleView _titleInsets]((uint64_t)self);
  double v5 = v4;
  double v7 = v6;
  [(TabIconAndTitleView *)self bounds];
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  double v12 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12 - v5 - v7, CGRectGetHeight(v34));
  -[TabIconAndTitleView _tabIconSize]((uint64_t)self);
  v13 = -[TabIconAndTitleView icon]((id *)&self->super.super.super.isa);

  if (self->_alignment == 2) {
    [(TabIconAndTitleView *)self directionalLayoutMargins];
  }
  int v14 = [(TabIconAndTitleView *)self _sf_usesLeftToRightLayout];
  _SFRoundRectToPixels();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  if (v13)
  {
    if (self->_usesAccessibilityContentSizeCategory)
    {
      [(UILabel *)self->_titleLabel _firstLineBaseline];
      if (v14)
      {
LABEL_7:
        _SFRoundRectToPixels();
        -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
        goto LABEL_8;
      }
    }
    else if (v14)
    {
      goto LABEL_7;
    }
    [(UILabel *)self->_titleLabel frame];
    CGRectGetMaxX(v35);
    goto LABEL_7;
  }
LABEL_8:
  if (self->_showsUnreadIndicator)
  {
    uint64_t v23 = v16;
    uint64_t v24 = v18;
    uint64_t v25 = v20;
    uint64_t v26 = v22;
    if (v14)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      double v28 = 8.0;
      if (!self->_usesAccessibilityContentSizeCategory) {
        double v28 = 4.0;
      }
      double v29 = MaxX + v28;
    }
    else
    {
      double v29 = CGRectGetMinX(*(CGRect *)&v23) - v7;
    }
    [(SFUnreadIndicator *)self->_unreadIndicator intrinsicContentSize];
    double v31 = v30;
    [(TabIconAndTitleView *)self bounds];
    -[SFUnreadIndicator ss_setUntransformedFrame:](self->_unreadIndicator, "ss_setUntransformedFrame:", v29, 0.0, v31, CGRectGetHeight(v36));
  }
}

- (double)_titleInsets
{
  if (!a1) {
    return 0.0;
  }
  v2 = (double *)MEMORY[0x1E4FB12A8];
  double v3 = [*(id *)(a1 + 408) image];

  if (v3) {
    -[TabIconAndTitleView _tabIconSize](a1);
  }
  double v4 = *v2;
  if (*(unsigned char *)(a1 + 440)) {
    [*(id *)(a1 + 432) intrinsicContentSize];
  }
  return v4;
}

- (double)_tabIconSize
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 424))
  {
    v1 = [*(id *)(a1 + 416) font];
    [v1 capHeight];
    double v3 = v2;
  }
  else
  {
    self;
    return 16.0;
  }
  return v3;
}

- (id)icon
{
  if (a1)
  {
    a1 = [a1[51] image];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)title
{
  if (a1)
  {
    a1 = [a1[52] text];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTitle:(id *)a1
{
  id v5 = a2;
  if (a1)
  {
    double v3 = [a1[52] text];
    char v4 = WBSIsEqual();

    if ((v4 & 1) == 0)
    {
      [a1[52] setText:v5];
      [a1 setNeedsLayout];
    }
  }
}

- (void)setIcon:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    id v4 = [a1[51] image];

    id v3 = v5;
    if (v4 != v5)
    {
      [a1[51] setImage:v5];
      [a1 setNeedsLayout];
      id v3 = v5;
    }
  }
}

- (id)titleFont
{
  if (a1)
  {
    a1 = [a1[52] font];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)setTitleFont:(uint64_t)result
{
  if (result)
  {
    double v2 = (void *)result;
    [*(id *)(result + 416) setFont:a2];
    return [v2 setNeedsLayout];
  }
  return result;
}

- (uint64_t)setNumberOfLines:(uint64_t)result
{
  if (result)
  {
    double v2 = (void *)result;
    [*(id *)(result + 416) setNumberOfLines:a2];
    return [v2 setNeedsLayout];
  }
  return result;
}

- (uint64_t)setTextColor:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 416) setTextColor:a2];
  }
  return result;
}

- (uint64_t)setShowsUnreadIndicator:(uint64_t)result
{
  if (result)
  {
    char v2 = a2;
    id v3 = (void *)result;
    if (*(unsigned __int8 *)(result + 440) != a2)
    {
      *(unsigned char *)(result + 440) = a2;
      if (a2)
      {
        if (!*(void *)(result + 432))
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F784F8]);
          id v5 = (void *)v3[54];
          v3[54] = v4;

          [v3 addSubview:v3[54]];
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke;
          v10[3] = &unk_1E6D77E20;
          v10[4] = v3;
          [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
        }
      }
      [v3 setNeedsLayout];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_2;
      v9[3] = &unk_1E6D77E20;
      v9[4] = v3;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
      v6[4] = v3;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_3;
      v7[3] = &unk_1E6D781E8;
      v7[4] = v3;
      char v8 = v2;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_4;
      v6[3] = &unk_1E6D77C20;
      return [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:v6];
    }
  }
  return result;
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  char v2 = *(void **)(*(void *)(a1 + 32) + 432);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_3(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:(double)*(unint64_t *)&a2];
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.5;
  }
  CGAffineTransformMakeScale(&v7, v3, v3);
  CGAffineTransform v4 = *(void **)(*(void *)(a1 + 32) + 432);
  CGAffineTransform v6 = v7;
  return [v4 setTransform:&v6];
}

void __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || !*(unsigned char *)(v2 + 440))
  {
    [*(id *)(v2 + 432) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    CGAffineTransform v4 = *(void **)(v3 + 432);
    *(void *)(v3 + 432) = 0;
  }
}

- (BOOL)showsUnreadIndicator
{
  if (result) {
    return *(unsigned char *)(result + 440) != 0;
  }
  return result;
}

- (void)setAlignment:(void *)a1
{
  if (a1)
  {
    if (*((const char **)a1 + 56) != a2)
    {
      *((void *)a1 + 56) = a2;
      return (void *)[a1 setNeedsLayout];
    }
  }
  return a1;
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3 previousTraitCollection:(id)a4
{
  CGAffineTransform v5 = [(TabIconAndTitleView *)self traitCollection];
  CGAffineTransform v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (self->_usesAccessibilityContentSizeCategory != IsAccessibilityCategory)
  {
    self->_usesAccessibilityContentSizeCategorCGFloat y = IsAccessibilityCategory;
    [(TabIconAndTitleView *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end