@interface TopBannerView
- (NSArray)items;
- (double)maximumHeight;
- (id)_initialConstraints;
- (id)initAllowingBlurredForButton:(BOOL)a3;
- (void)_commonInit;
- (void)_createSubviews;
- (void)_updateItemViews;
- (void)setItems:(id)a3;
- (void)setMaximumHeight:(double)a3;
@end

@implementation TopBannerView

- (id)initAllowingBlurredForButton:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TopBannerView;
  id v3 = [(CardView *)&v6 initAllowingBlurredForButton:a3];
  v4 = v3;
  if (v3) {
    [v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(CardView *)self setLayoutStyle:6];
  [(TopBannerView *)self _createSubviews];
  id v3 = [(TopBannerView *)self _initialConstraints];
  +[NSLayoutConstraint activateConstraints:v3];

  id v6 = [(OverflowView *)self->_overflowView heightAnchor];
  v4 = [v6 constraintLessThanOrEqualToConstant:-1.0];
  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = v4;
}

- (void)_createSubviews
{
  id v3 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  stackView = self->_stackView;
  self->_stackView = v3;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setSpacing:0.0];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [[OverflowView alloc] initWithContentView:self->_stackView];
  overflowView = self->_overflowView;
  self->_overflowView = v5;

  [(OverflowView *)self->_overflowView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(CardView *)self contentView];
  [v7 addSubview:self->_overflowView];
}

- (id)_initialConstraints
{
  v16 = [(OverflowView *)self->_overflowView topAnchor];
  v15 = [(TopBannerView *)self topAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v17[0] = v14;
  id v3 = [(OverflowView *)self->_overflowView trailingAnchor];
  v4 = [(TopBannerView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v17[1] = v5;
  id v6 = [(OverflowView *)self->_overflowView leadingAnchor];
  id v7 = [(TopBannerView *)self leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v17[2] = v8;
  v9 = [(OverflowView *)self->_overflowView bottomAnchor];
  v10 = [(TopBannerView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v17[3] = v11;
  v12 = +[NSArray arrayWithObjects:v17 count:4];

  return v12;
}

- (void)setItems:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_items != v4)
  {
    v9 = v4;
    unsigned __int8 v6 = -[NSArray isEqualToArray:](v4, "isEqualToArray:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = (NSArray *)[(NSArray *)v9 copy];
      items = self->_items;
      self->_items = v7;

      [(TopBannerView *)self _updateItemViews];
      v5 = v9;
    }
  }
}

- (void)_updateItemViews
{
  id v3 = [(TopBannerView *)self items];
  v4 = [v3 count];
  v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  unsigned __int8 v6 = [v5 count];

  if (v4 - v6 < 0)
  {
    int64_t v7 = v6 - v4;
    do
    {
      v8 = [(UIStackView *)self->_stackView arrangedSubviews];
      v9 = [v8 lastObject];

      [v9 removeFromSuperview];
      --v7;
    }
    while (v7);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(TopBannerView *)self items];
  id v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 0;
    uint64_t v13 = 0;
    uint64_t v29 = *(void *)v31;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v19 = [(UIStackView *)self->_stackView arrangedSubviews];
        v20 = (char *)[v19 count];

        if ((char *)i + v13 >= v20)
        {
          v22 = -[TopBannerItemView initWithFrame:]([TopBannerItemView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
          [(TopBannerItemView *)v22 setItem:v18];
          [(UIStackView *)self->_stackView addArrangedSubview:v22];
        }
        else
        {
          v21 = [(UIStackView *)self->_stackView arrangedSubviews];
          v22 = [v21 objectAtIndexedSubscript:(char *)i + v13];

          [(TopBannerItemView *)v22 setItem:v18];
        }
        v23 = [(TopBannerView *)self items];
        BOOL v24 = (char *)i + v13 != (char *)[v23 count] - 1;

        [(TopBannerItemView *)v22 setHairlineVisible:v24];
        BOOL v25 = 1;
        [(TopBannerItemView *)v22 setFirstItemWithIcon:(v12 & 1) == 0];
        v26 = [v18 artwork];
        if (!v26)
        {
          v27 = [v18 artworkURL];
          BOOL v25 = v27 != 0;
        }
        v12 |= v25;
      }
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      v13 += (uint64_t)i;
    }
    while (v11);
  }

  [(OverflowView *)self->_overflowView resetContentOffset];
  [(TopBannerView *)self setNeedsLayout];
}

- (void)setMaximumHeight:(double)a3
{
  [(NSLayoutConstraint *)self->_maximumHeightConstraint constant];
  if (v5 != a3)
  {
    [(NSLayoutConstraint *)self->_maximumHeightConstraint setConstant:a3];
    maximumHeightConstraint = self->_maximumHeightConstraint;
    [(NSLayoutConstraint *)maximumHeightConstraint setActive:a3 != -1.0];
  }
}

- (double)maximumHeight
{
  [(NSLayoutConstraint *)self->_maximumHeightConstraint constant];
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_overflowView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end