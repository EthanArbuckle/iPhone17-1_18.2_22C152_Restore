@interface SearchUIHeroTitleCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (SearchUIButtonItemStackView)buttonItemStackView;
- (SearchUIImageView)titleImageView;
- (SearchUILabel)subtitleLabel;
- (SearchUILabel)titleLabel;
- (id)setupContentView;
- (void)setButtonItemStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIHeroTitleCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v3 = +[TLKLabel primaryLabel];
  v4 = objc_msgSend(MEMORY[0x1E4FAE090], "cachedFontForTextStyle:isShort:isBold:isMacStyle:", *MEMORY[0x1E4FB2990], TLKSnippetModernizationEnabled() ^ 1, 1, objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS"));
  [v3 setFont:v4];

  [v3 setAutoHideIfNoContent:1];
  [(SearchUIHeroTitleCardSectionView *)self setTitleLabel:v3];
  v5 = objc_opt_new();
  [(SearchUIHeroTitleCardSectionView *)self setTitleImageView:v5];
  v6 = objc_opt_new();
  v27[0] = v3;
  v27[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v6 setArrangedSubviews:v7];

  [v6 setAlignment:1];
  v8 = +[TLKLabel secondaryLabel];
  [v8 setAutoHideIfNoContent:1];
  if ([MEMORY[0x1E4FAE198] isIpad])
  {
    v9 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 isBold:0];
    [v8 setFont:v9];
  }
  [(SearchUIHeroTitleCardSectionView *)self setSubtitleLabel:v8];
  v10 = objc_opt_new();
  [v10 setShouldReverseButtonOrder:1];
  [(SearchUIHeroTitleCardSectionView *)self setButtonItemStackView:v10];
  v11 = objc_opt_new();
  [v11 setAxis:1];
  v26[0] = v6;
  v26[1] = v8;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v11 setArrangedSubviews:v12];

  [v11 setAlignment:1];
  int v13 = [MEMORY[0x1E4FAE198] isMacOS];
  double v14 = 3.0;
  if (v13) {
    double v14 = 2.0;
  }
  [v11 setSpacing:v14];
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = objc_alloc(MEMORY[0x1E4FAE158]);
  v25[0] = v11;
  v25[1] = v10;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v23 = (void *)[v21 initWithArrangedSubviews:v22];

  [v23 setAlignment:3];
  [v23 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
  [v23 setSpacing:8.0];
  [v23 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v23, "setLayoutMargins:", v16, v18, 12.0, v20);

  return v23;
}

- (void)updateWithRowModel:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SearchUIHeroTitleCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v21 updateWithRowModel:v4];
  v5 = [(SearchUICardSectionView *)self section];
  v6 = [v5 title];
  v7 = [v6 icons];
  v8 = [v7 firstObject];

  v9 = [(SearchUIHeroTitleCardSectionView *)self titleImageView];
  [v9 updateWithImage:v8];

  v10 = [(SearchUIHeroTitleCardSectionView *)self titleImageView];
  [v10 setHidden:v8 == 0];

  v11 = [(SearchUIHeroTitleCardSectionView *)self titleImageView];
  objc_msgSend(v11, "setCustomAlignmentRectInsets:", -2.0, 0.0, -8.0, 0.0);

  if (v8)
  {
    v12 = 0;
  }
  else
  {
    v12 = [v5 title];
  }
  int v13 = [(SearchUIHeroTitleCardSectionView *)self titleLabel];
  [v13 setSfText:v12];

  if (!v8) {
  double v14 = [v5 subtitle];
  }
  double v15 = [(SearchUIHeroTitleCardSectionView *)self subtitleLabel];
  [v15 setSfText:v14];

  double v16 = [(SearchUIHeroTitleCardSectionView *)self buttonItemStackView];
  double v17 = [v5 buttonItems];
  int v18 = [v5 maxVisibleButtonItems];
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 2;
  }
  double v20 = [(SearchUICardSectionView *)self feedbackDelegate];
  [v16 updateWithButtonItems:v17 maxButtonItems:v19 buttonItemViewType:1 rowModel:v4 feedbackDelegate:v20];
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SearchUIImageView)titleImageView
{
  return self->_titleImageView;
}

- (void)setTitleImageView:(id)a3
{
}

- (SearchUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end