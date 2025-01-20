@interface PLTitledPlatterView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)headerHeedsHorizontalLayoutMargins;
- (BOOL)isDateAllDay;
- (BOOL)isLargerHeaderMarginEnabled;
- (BOOL)isSashHidden;
- (CGRect)_mainContentFrame;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (NSArray)iconButtons;
- (NSArray)icons;
- (NSDate)date;
- (NSString)title;
- (NSTimeZone)timeZone;
- (UIButton)utilityButton;
- (id)_headerContentView;
- (id)utilityView;
- (int64_t)dateFormatStyle;
- (void)_configureHeaderContentView;
- (void)_configureHeaderContentViewIfNecessary;
- (void)_layoutHeaderViews;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setHeaderHeedsHorizontalLayoutMargins:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setLargerHeaderMarginEnabled:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUtilityView:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation PLTitledPlatterView

- (void)setLargerHeaderMarginEnabled:(BOOL)a3
{
  if (self->_largerHeaderMarginEnabled != a3)
  {
    self->_largerHeaderMarginEnabled = a3;
    [(PLTitledPlatterView *)self setNeedsLayout];
  }
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PLTitledPlatterView;
  [(PLPlatterView *)&v16 setBackgroundView:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(PLPlatterHeaderContentView *)self->_headerContentView requiredVisualStyleCategories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) integerValue];
        headerContentView = self->_headerContentView;
        v11 = [(PLPlatterView *)self visualStylingProviderForCategory:v9];
        [(PLPlatterHeaderContentView *)headerContentView setVisualStylingProvider:v11 forCategory:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (int64_t)dateFormatStyle
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView dateFormatStyle];
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if ([(PLPlatterHeaderContentView *)self->_headerContentView dateFormatStyle] != a3)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    headerContentView = self->_headerContentView;
    [(PLPlatterHeaderContentView *)headerContentView setDateFormatStyle:a3];
  }
}

- (NSArray)icons
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView icons];
}

- (void)setIcons:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLTitledPlatterView *)self iconButtons];
  uint64_t v6 = [v5 count];

  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  [(PLPlatterHeaderContentView *)self->_headerContentView setIcons:v4];

  uint64_t v7 = [(PLTitledPlatterView *)self iconButtons];
  uint64_t v8 = [v7 count];

  if (!v6 && v8 || v6 && !v8)
  {
    [(PLTitledPlatterView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView title];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView title];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setTitle:v6];
  }
}

- (NSDate)date
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView date];
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView date];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setDate:v6];
  }
}

- (NSTimeZone)timeZone
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView timeZone];
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView timeZone];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setTimeZone:v6];
  }
}

- (NSArray)iconButtons
{
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView iconButtons];
}

- (UIButton)utilityButton
{
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView utilityButton];
}

- (id)utilityView
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView utilityView];
}

- (void)setUtilityView:(id)a3
{
  id v5 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView utilityView];

  if (v4 != v5)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setUtilityView:v5];
  }
}

- (BOOL)isDateAllDay
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView isDateAllDay];
}

- (void)setDateAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLPlatterHeaderContentView *)self->_headerContentView isDateAllDay] != a3)
  {
    [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
    headerContentView = self->_headerContentView;
    [(PLPlatterHeaderContentView *)headerContentView setDateAllDay:v3];
  }
}

- (id)_headerContentView
{
  return self->_headerContentView;
}

- (BOOL)headerHeedsHorizontalLayoutMargins
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView heedsHorizontalLayoutMargins];
}

- (void)setHeaderHeedsHorizontalLayoutMargins:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  [(PLPlatterHeaderContentView *)headerContentView setHeedsHorizontalLayoutMargins:v3];
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PLTitledPlatterView;
  -[PLPlatterView sizeThatFitsContentWithSize:](&v14, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  if (headerContentView)
  {
    if (self->_largerHeaderMarginEnabled)
    {
      -[PLPlatterHeaderContentView sizeThatFits:](headerContentView, "sizeThatFits:", v5, 0.0);
      double v7 = v7 + v9;
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__PLTitledPlatterView_sizeThatFitsContentWithSize___block_invoke;
      v13[3] = &unk_1E6B5FEB0;
      v13[4] = self;
      *(double *)&v13[5] = v5;
      v13[6] = 0;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v13];
      [(PLPlatterHeaderContentView *)self->_headerContentView contentBaseline];
      double v7 = v7 + v10;
    }
  }
  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

uint64_t __51__PLTitledPlatterView_sizeThatFitsContentWithSize___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 544);
  objc_msgSend(v1, "sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  return objc_msgSend(v1, "setFrame:");
}

- (void)_configureHeaderContentViewIfNecessary
{
  if (!self->_headerContentView) {
    [(PLTitledPlatterView *)self _configureHeaderContentView];
  }
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)PLTitledPlatterView;
  [(PLTitledPlatterView *)&v3 setNeedsLayout];
  [(PLPlatterHeaderContentView *)self->_headerContentView setNeedsLayout];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PLTitledPlatterView;
  [(PLPlatterView *)&v7 layoutSubviews];
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  [(PLTitledPlatterView *)self _layoutHeaderViews];
  [(PLTitledPlatterView *)self _mainContentFrame];
  double x = v8.origin.x;
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  if (!CGRectIsEmpty(v8)) {
    -[UIView setFrame:](self->super._customContentView, "setFrame:", x, y, width, height);
  }
}

- (void)_layoutHeaderViews
{
  [(PLTitledPlatterView *)self bounds];
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  if (!CGRectIsEmpty(v13))
  {
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
    BSRectWithSize();
    PLMainScreenScale();
    UIRectIntegralWithScale();
    double x = v7;
    double y = v8;
    double width = v9;
    double height = v10;
  }
  -[PLPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:", x, y, width, height);
  headerContentView = self->_headerContentView;
  [(PLPlatterHeaderContentView *)headerContentView setNeedsLayout];
}

- (CGRect)_mainContentFrame
{
  [(PLTitledPlatterView *)self bounds];
  CGFloat x = v17.origin.x;
  double y = v17.origin.y;
  CGFloat width = v17.size.width;
  double height = v17.size.height;
  if (!CGRectIsEmpty(v17))
  {
    [(PLTitledPlatterView *)self _layoutHeaderViews];
    headerContentView = self->_headerContentView;
    if (self->_largerHeaderMarginEnabled)
    {
      [(PLPlatterHeaderContentView *)headerContentView frame];
      double v8 = CGRectGetHeight(v18);
    }
    else
    {
      [(PLPlatterHeaderContentView *)headerContentView contentBaseline];
    }
    double y = y + v8;
    double height = height - v8;
  }
  v19.origin.CGFloat x = x;
  v19.origin.double y = y;
  v19.size.CGFloat width = width;
  v19.size.double height = height;
  if (!CGRectIsEmpty(v19))
  {
    PLMainScreenScale();
    UIRectIntegralWithScale();
    CGFloat x = v9;
    double y = v10;
    CGFloat width = v11;
    double height = v12;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  [(PLPlatterHeaderContentView *)headerContentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  [(PLTitledPlatterView *)self _configureHeaderContentViewIfNecessary];
  BOOL v3 = [(PLPlatterHeaderContentView *)self->_headerContentView adjustForContentSizeCategoryChange];
  if (v3) {
    [(PLTitledPlatterView *)self setNeedsLayout];
  }
  return v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PLPlatterView *)self visualStylingProviderForCategory:a4];

  if (v7 != v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLTitledPlatterView;
    [(PLPlatterView *)&v10 setVisualStylingProvider:v6 forCategory:a4];
    headerContentView = self->_headerContentView;
    double v9 = [(PLPlatterView *)self visualStylingProviderForCategory:a4];
    [(PLPlatterHeaderContentView *)headerContentView setVisualStylingProvider:v9 forCategory:a4];
  }
}

- (BOOL)isLargerHeaderMarginEnabled
{
  return self->_largerHeaderMarginEnabled;
}

- (void).cxx_destruct
{
}

- (void)_configureHeaderContentView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(PLPlatterHeaderContentView);
  headerContentView = self->_headerContentView;
  self->_headerContentView = v3;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(PLPlatterHeaderContentView *)self->_headerContentView requiredVisualStyleCategories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) integerValue];
        double v11 = self->_headerContentView;
        double v12 = [(PLPlatterView *)self visualStylingProviderForCategory:v10];
        [(PLPlatterHeaderContentView *)v11 setVisualStylingProvider:v12 forCategory:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(PLPlatterHeaderContentView *)self->_headerContentView setAutoresizesSubviews:1];
  [(PLTitledPlatterView *)self addSubview:self->_headerContentView];
  [(PLTitledPlatterView *)self bringSubviewToFront:self->_headerContentView];
}

- (BOOL)isSashHidden
{
  return 1;
}

@end