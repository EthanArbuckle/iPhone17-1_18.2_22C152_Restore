@interface SearchUITitleCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (NUIContainerBoxView)containerView;
- (TLKLabel)label;
- (id)setupContentView;
- (void)setContainerView:(id)a3;
- (void)setLabel:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUITitleCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4FAE090] boldBodyFont];
  [v3 setFont:v4];

  [v3 setNumberOfLines:2];
  [(SearchUITitleCardSectionView *)self setLabel:v3];
  id v5 = objc_alloc(MEMORY[0x1E4F4BEE8]);
  v20[0] = v3;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v7 = (void *)[v5 initWithArrangedSubviews:v6];
  [(SearchUITitleCardSectionView *)self setContainerView:v7];

  v8 = [(SearchUITitleCardSectionView *)self containerView];
  [v8 setLayoutMarginsRelativeArrangement:1];

  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(SearchUITitleCardSectionView *)self containerView];
  objc_msgSend(v17, "setLayoutMargins:", v10, v12, v14, v16);

  v18 = [(SearchUITitleCardSectionView *)self containerView];

  return v18;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cardSection];
  v14.receiver = self;
  v14.super_class = (Class)SearchUITitleCardSectionView;
  [(SearchUICardSectionView *)&v14 updateWithRowModel:v4];

  int v6 = [v5 isCentered];
  v7 = [(SearchUITitleCardSectionView *)self label];
  v8 = v7;
  if (v6)
  {
    [v7 setTextAlignment:1];

    double v9 = [(SearchUITitleCardSectionView *)self containerView];
    double v10 = v9;
    uint64_t v11 = 3;
  }
  else
  {
    [v7 setTextAlignment:4];

    double v9 = [(SearchUITitleCardSectionView *)self containerView];
    double v10 = v9;
    uint64_t v11 = 1;
  }
  [v9 setHorizontalAlignment:v11];

  double v12 = [v5 title];
  double v13 = [(SearchUITitleCardSectionView *)self label];
  [v13 setText:v12];
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NUIContainerBoxView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end