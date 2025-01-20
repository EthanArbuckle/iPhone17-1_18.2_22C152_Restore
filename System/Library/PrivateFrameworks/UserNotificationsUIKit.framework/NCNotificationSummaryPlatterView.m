@interface NCNotificationSummaryPlatterView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isIconViewLeading;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationSummaryPlatterView)initWithRecipe:(int64_t)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSArray)summaryIconViews;
- (NSDate)summaryDate;
- (NSString)summary;
- (NSString)summaryIconSymbolName;
- (NSString)summaryTitle;
- (NSString)summaryTitleFontName;
- (void)_configureSummaryContentViewIfNecessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateStackDimmingVisualStyling;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setIconViewLeading:(BOOL)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryDate:(id)a3;
- (void)setSummaryIconSymbolName:(id)a3;
- (void)setSummaryIconViews:(id)a3;
- (void)setSummaryTitle:(id)a3;
- (void)setSummaryTitleFontName:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation NCNotificationSummaryPlatterView

- (NCNotificationSummaryPlatterView)initWithRecipe:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    a3 = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryPlatterView;
  v3 = [(PLPlatterView *)&v6 initWithRecipe:a3];
  v4 = v3;
  if (v3)
  {
    [(PLPlatterView *)v3 _setContinuousCornerRadius:23.5];
    [(NCNotificationSummaryPlatterView *)v4 _configureSummaryContentViewIfNecessary];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[NCNotificationSummaryContentView sizeThatFits:](self->_summaryContentView, "sizeThatFits:", a3.width + -31.0, a3.height);
  v5 = [(NCNotificationSummaryPlatterView *)self traitCollection];
  [v5 displayScale];
  UICeilToScale();
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)didMoveToSuperview
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationSummaryPlatterView;
  [(NCNotificationSummaryPlatterView *)&v15 didMoveToSuperview];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NCNotificationSummaryContentView *)self->_summaryContentView requiredVisualStyleCategories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) integerValue];
        summaryContentView = self->_summaryContentView;
        v10 = [(PLPlatterView *)self visualStylingProviderForCategory:v8];
        [(NCNotificationSummaryContentView *)summaryContentView setVisualStylingProvider:v10 forCategory:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationSummaryPlatterView;
  [(PLPlatterView *)&v12 layoutSubviews];
  if (self->_summaryContentView)
  {
    [(NCNotificationSummaryPlatterView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(NCNotificationSummaryContentView *)self->_summaryContentView frame];
    [(NCNotificationSummaryPlatterView *)self _shouldReverseLayoutDirection];
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.CGFloat width = v8;
    v13.size.height = v10;
    CGFloat v11 = CGRectGetWidth(v13) + -31.0;
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.CGFloat width = v8;
    v14.size.height = v10;
    -[NCNotificationSummaryContentView sizeThatFits:](self->_summaryContentView, "sizeThatFits:", v11, CGRectGetHeight(v14));
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_summaryContentView, "setFrame:");
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryPlatterView;
  [(NCNotificationSummaryPlatterView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(NCNotificationSummaryPlatterView *)self _updateStackDimmingVisualStyling];
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  if (a3->a <= 0.94) {
    double v4 = dbl_1D7D95CC0[a3->a < 0.94];
  }
  else {
    double v4 = 0.0;
  }
  if (v4 > 0.0 && !self->_stackDimmingView)
  {
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    stackDimmingView = self->_stackDimmingView;
    self->_stackDimmingView = v5;

    [(UIView *)self->_stackDimmingView setUserInteractionEnabled:0];
    double v7 = self->_stackDimmingView;
    [(NCNotificationSummaryPlatterView *)self bounds];
    -[UIView setFrame:](v7, "setFrame:");
    [(UIView *)self->_stackDimmingView setAutoresizingMask:18];
    CGFloat v8 = self->_stackDimmingView;
    [(PLPlatterView *)self _continuousCornerRadius];
    -[UIView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__NCNotificationSummaryPlatterView_configureStackDimmingForTransform___block_invoke;
    v9[3] = &unk_1E6A91BB0;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
  }
  [(UIView *)self->_stackDimmingView setAlpha:v4];
}

uint64_t __70__NCNotificationSummaryPlatterView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:0.0];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 552)];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateStackDimmingVisualStyling];
}

- (NSString)summaryTitle
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summaryTitle];
}

- (void)setSummaryTitle:(id)a3
{
}

- (NSString)summary
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summary];
}

- (void)setSummary:(id)a3
{
}

- (NSArray)summaryIconViews
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summaryIconViews];
}

- (void)setSummaryIconViews:(id)a3
{
}

- (BOOL)isIconViewLeading
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView isIconViewLeading];
}

- (void)setIconViewLeading:(BOOL)a3
{
}

- (NSString)summaryTitleFontName
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summaryTitleFontName];
}

- (void)setSummaryTitleFontName:(id)a3
{
}

- (NSDate)summaryDate
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summaryDate];
}

- (void)setSummaryDate:(id)a3
{
}

- (NSString)summaryIconSymbolName
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView summaryIconSymbolName];
}

- (void)setSummaryIconSymbolName:(id)a3
{
}

- (NSArray)requiredVisualStyleCategories
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA80];
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummaryPlatterView;
  double v4 = [(PLPlatterView *)&v9 requiredVisualStyleCategories];
  double v5 = [v3 setWithArray:v4];

  CGFloat v6 = [(NCNotificationSummaryContentView *)self->_summaryContentView requiredVisualStyleCategories];
  [v5 addObjectsFromArray:v6];

  double v7 = [v5 allObjects];

  return (NSArray *)v7;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummaryPlatterView;
  id v6 = a3;
  [(PLPlatterView *)&v7 setVisualStylingProvider:v6 forCategory:a4];
  -[NCNotificationSummaryContentView setVisualStylingProvider:forCategory:](self->_summaryContentView, "setVisualStylingProvider:forCategory:", v6, a4, v7.receiver, v7.super_class);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return [(NCNotificationSummaryContentView *)self->_summaryContentView adjustForContentSizeCategoryChange];
}

- (void)_configureSummaryContentViewIfNecessary
{
  if (!self->_summaryContentView)
  {
    id v6 = [(PLPlatterView *)self customContentView];
    objc_super v3 = [NCNotificationSummaryContentView alloc];
    [v6 bounds];
    double v4 = -[NCNotificationSummaryContentView initWithFrame:](v3, "initWithFrame:");
    summaryContentView = self->_summaryContentView;
    self->_summaryContentView = v4;

    [v6 addSubview:self->_summaryContentView];
  }
}

- (void)_updateStackDimmingVisualStyling
{
  if (self->_stackDimmingView)
  {
    objc_super v3 = [(NCNotificationSummaryPlatterView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];
    double v5 = @"stackDimmingLight";
    if (v4 == 2) {
      double v5 = @"stackDimmingDark";
    }
    id v6 = v5;

    objc_super v7 = (void *)MEMORY[0x1E4F743E8];
    CGFloat v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v13 = [v7 _visualStylingProviderForStyleSetNamed:v6 inBundle:v8];

    [(UIView *)self->_stackDimmingView alpha];
    double v10 = v9;
    stackDimmingView = self->_stackDimmingView;
    objc_super v12 = [v13 _visualStylingForStyle:1];
    [(UIView *)stackDimmingView mt_replaceVisualStyling:v12];

    [(UIView *)self->_stackDimmingView setAlpha:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackDimmingView, 0);

  objc_storeStrong((id *)&self->_summaryContentView, 0);
}

@end