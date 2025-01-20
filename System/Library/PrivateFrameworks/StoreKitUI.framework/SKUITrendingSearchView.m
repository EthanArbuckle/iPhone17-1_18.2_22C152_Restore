@interface SKUITrendingSearchView
- (NSArray)trendingSearchViews;
- (NSArray)verticalMarginRelatedConstraints;
- (SKUITrendingSearchView)initWithCoder:(id)a3;
- (SKUITrendingSearchView)initWithFrame:(CGRect)a3;
- (UIStackView)titleStackView;
- (UIStackView)trendingSearchesStackView;
- (UIView)trendingTitleView;
- (void)commonInitWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitleStackView:(id)a3;
- (void)setTrendingSearchViews:(id)a3;
- (void)setTrendingSearchesStackView:(id)a3;
- (void)setTrendingTitleView:(id)a3;
- (void)setVerticalMarginRelatedConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation SKUITrendingSearchView

- (SKUITrendingSearchView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SKUITrendingSearchView;
  v7 = -[SKUITrendingSearchView initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7) {
    -[SKUITrendingSearchView commonInitWithFrame:](v7, "commonInitWithFrame:", x, y, width, height);
  }
  return v8;
}

- (SKUITrendingSearchView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUITrendingSearchView;
  v3 = [(SKUITrendingSearchView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(SKUITrendingSearchView *)v3 frame];
    -[SKUITrendingSearchView commonInitWithFrame:](v4, "commonInitWithFrame:");
  }
  return v4;
}

- (void)commonInitWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29[1] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrendingSearchView commonInitWithFrame:]();
  }
  [(SKUITrendingSearchView *)self setPreservesSuperviewLayoutMargins:1];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", x, y, width, height);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setAxis:1];
  [v8 setAlignment:3];
  [v8 setDistribution:3];
  [v8 setSpacing:18.0];
  objc_storeWeak((id *)&self->_titleStackView, v8);
  [(SKUITrendingSearchView *)self addSubview:v8];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", x, y, width, height);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAxis:1];
  [v9 setAlignment:3];
  [v9 setDistribution:3];
  [v9 setSpacing:2.0];
  [v8 addArrangedSubview:v9];
  objc_storeWeak((id *)&self->_trendingSearchesStackView, v9);
  objc_super v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = [(SKUITrendingSearchView *)self titleStackView];
    objc_super v10 = [v13 constraintWithItem:v14 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

    LODWORD(v15) = 1144733696;
    [v10 setPriority:v15];
    v29[0] = v10;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [(SKUITrendingSearchView *)self addConstraints:v16];

LABEL_8:
  }
  v17 = _NSDictionaryOfVariableBindings(&cfstr_Titlestackview.isa, v8, 0);
  [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(>=TITLE_MINIMUM_ORIGIN_Y)-[titleStackView]" options:0 metrics:&unk_1F1D62198 views:v17];
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  verticalMarginRelatedConstraints = self->_verticalMarginRelatedConstraints;
  self->_verticalMarginRelatedConstraints = v18;

  [(SKUITrendingSearchView *)self addConstraints:self->_verticalMarginRelatedConstraints];
  v20 = [v8 leadingAnchor];
  v21 = [(SKUITrendingSearchView *)self leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [v8 trailingAnchor];
  v24 = [(SKUITrendingSearchView *)self trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [v8 widthAnchor];
  v27 = [(SKUITrendingSearchView *)self widthAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];
}

- (void)setTrendingTitleView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_trendingTitleView removeFromSuperview];
  trendingTitleView = self->_trendingTitleView;
  self->_trendingTitleView = v4;
  objc_super v6 = v4;

  [(UIView *)self->_trendingTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1148846080;
  [(UIView *)self->_trendingTitleView setContentCompressionResistancePriority:1 forAxis:v7];
  id v8 = [(SKUITrendingSearchView *)self titleStackView];
  [v8 insertArrangedSubview:v6 atIndex:0];
}

- (void)setTrendingSearchViews:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_trendingSearchViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  objc_super v10 = (NSArray *)[v4 copy];
  trendingSearchViews = self->_trendingSearchViews;
  self->_trendingSearchViews = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_trendingSearchViews;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
        v18 = [(SKUITrendingSearchView *)self trendingSearchesStackView];
        [v18 addArrangedSubview:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [(SKUITrendingSearchView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SKUITrendingSearchView;
  [(SKUITrendingSearchView *)&v11 layoutSubviews];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 != 1)
  {
LABEL_5:
    [(SKUITrendingSearchView *)self bounds];
    double v7 = v6;
    uint64_t v8 = [(SKUITrendingSearchView *)self titleStackView];
    [v8 bounds];
    double MaxY = CGRectGetMaxY(v12);
    [(SKUITrendingSearchView *)self safeAreaInsets];
    -[SKUITrendingSearchView setContentSize:](self, "setContentSize:", v7, MaxY + v10);
  }
}

- (void)updateConstraints
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(SKUITrendingSearchView *)self verticalMarginRelatedConstraints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        [(SKUITrendingSearchView *)self safeAreaInsets];
        objc_msgSend(v8, "setConstant:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SKUITrendingSearchView;
  [(SKUITrendingSearchView *)&v9 updateConstraints];
}

- (UIView)trendingTitleView
{
  return self->_trendingTitleView;
}

- (NSArray)trendingSearchViews
{
  return self->_trendingSearchViews;
}

- (UIStackView)trendingSearchesStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchesStackView);

  return (UIStackView *)WeakRetained;
}

- (void)setTrendingSearchesStackView:(id)a3
{
}

- (UIStackView)titleStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleStackView);

  return (UIStackView *)WeakRetained;
}

- (void)setTitleStackView:(id)a3
{
}

- (NSArray)verticalMarginRelatedConstraints
{
  return self->_verticalMarginRelatedConstraints;
}

- (void)setVerticalMarginRelatedConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalMarginRelatedConstraints, 0);
  objc_destroyWeak((id *)&self->_titleStackView);
  objc_destroyWeak((id *)&self->_trendingSearchesStackView);
  objc_storeStrong((id *)&self->_trendingSearchViews, 0);

  objc_storeStrong((id *)&self->_trendingTitleView, 0);
}

- (void)commonInitWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITrendingSearchView commonInitWithFrame:]";
}

@end