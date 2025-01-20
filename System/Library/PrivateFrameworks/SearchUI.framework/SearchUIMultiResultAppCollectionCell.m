@interface SearchUIMultiResultAppCollectionCell
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)hoverHighlightMargins;
- (SearchUIHomeScreenAppIconView)appIconView;
- (int64_t)focusItemDeferralMode;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAppIconView:(id)a3;
- (void)setHoverHighlightMargins:(CGSize)a3;
- (void)updateWithResult:(id)a3;
@end

@implementation SearchUIMultiResultAppCollectionCell

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUIMultiResultAppCollectionCell;
  [(SearchUIMultiResultAppCollectionCell *)&v12 layoutSubviews];
  [(SearchUIMultiResultAppCollectionCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SearchUIMultiResultAppCollectionCell *)self appIconView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)updateWithResult:(id)a3
{
  id v4 = a3;
  [(SearchUIMultiResultAppCollectionCell *)self setBackgroundConfiguration:0];
  double v5 = [(SearchUIMultiResultAppCollectionCell *)self appIconView];

  if (!v5)
  {
    double v6 = objc_opt_new();
    [(SearchUIMultiResultAppCollectionCell *)self setAppIconView:v6];

    double v7 = [(SearchUIMultiResultAppCollectionCell *)self contentView];
    double v8 = [(SearchUIMultiResultAppCollectionCell *)self appIconView];
    [v7 addSubview:v8];
  }
  id v10 = [(SearchUIMultiResultAppCollectionCell *)self appIconView];
  double v9 = [[SearchUIRowModel alloc] initWithResult:v4 itemIdentifier:0];

  [v10 updateWithRowModel:v9];
}

- (SearchUIHomeScreenAppIconView)appIconView
{
  return (SearchUIHomeScreenAppIconView *)objc_getProperty(self, a2, 640, 1);
}

- (void)setHoverHighlightMargins:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_hoverHighlightMargins, &v3, 16, 1, 0);
}

- (void)setAppIconView:(id)a3
{
}

- (void)prepareForReuse
{
  CGSize v3 = [(SearchUIMultiResultAppCollectionCell *)self appIconView];
  [v3 setAddRoundedKeyboardHighlight:0];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIMultiResultAppCollectionCell;
  [(SearchUIMultiResultAppCollectionCell *)&v4 prepareForReuse];
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (CGSize)hoverHighlightMargins
{
  objc_copyStruct(v4, &self->_hoverHighlightMargins, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end