@interface SearchUIRichTitleCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)dragSubtitleForCardSection:(id)a3;
+ (id)dragTitleForCardSection:(id)a3;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (SearchUIButtonItemStackView)buttonStackView;
- (TLKHeaderView)headerView;
- (id)setupContentView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)setButtonStackView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIRichTitleCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(SearchUIRichTitleCardSectionView *)self setHeaderView:v3];
  v4 = (void *)MEMORY[0x1E4F4BF00];
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [v4 horizontalContainerStackViewWithArrangedSubviews:v5];

  [v6 setAlignment:3];
  [v6 setLayoutMarginsRelativeArrangement:1];

  return v6;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 cardSection];
  v35.receiver = self;
  v35.super_class = (Class)SearchUIRichTitleCardSectionView;
  [(SearchUICardSectionView *)&v35 updateWithRowModel:v4];
  uint64_t v6 = [v5 isCentered];
  v7 = [(SearchUIRichTitleCardSectionView *)self headerView];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__SearchUIRichTitleCardSectionView_updateWithRowModel___block_invoke;
  v31[3] = &unk_1E6E73598;
  id v8 = v5;
  id v32 = v8;
  id v9 = v7;
  id v33 = v9;
  uint64_t v34 = v6;
  [v9 performBatchUpdates:v31];
  v10 = [v8 buttonItems];
  if (v10)
  {
    v11 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];

    if (!v11)
    {
      v12 = objc_opt_new();
      [(SearchUIRichTitleCardSectionView *)self setButtonStackView:v12];

      v13 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];
      [v13 setShouldReverseButtonOrder:1];

      v14 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];
      +[SearchUIAutoLayout requireIntrinsicSizeForView:v14];

      v15 = [(SearchUICardSectionView *)self contentView];
      v16 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];
      [v15 addArrangedSubview:v16];
    }
    v17 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];
    v18 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v17 updateWithButtonItems:v10 maxButtonItems:0 buttonItemViewType:1 rowModel:v4 feedbackDelegate:v18];
  }
  uint64_t v19 = [v10 count];
  v20 = [(SearchUIRichTitleCardSectionView *)self buttonStackView];
  [v20 setHidden:v19 == 0];

  double v21 = 0.0;
  if (TLKSnippetModernizationEnabled())
  {
    double v22 = 0.0;
    if (([v8 isCentered] & 1) == 0)
    {
      if ([MEMORY[0x1E4FAE198] isMacOS]) {
        double v23 = 14.0;
      }
      else {
        double v23 = 18.0;
      }
      [v9 effectiveLayoutMargins];
      double v25 = v24;
      double v26 = 0.0;
      if (!v19) {
        [v9 effectiveLayoutMargins];
      }
      double v22 = v23 - v25;
      double v21 = v23 - v26;
    }
  }
  else
  {
    double v22 = 0.0;
  }
  [v9 effectiveLayoutMargins];
  double v28 = 8.0 - v27;
  v29 = [(SearchUICardSectionView *)self contentView];
  [v29 setSpacing:v28];

  v30 = [(SearchUICardSectionView *)self contentView];
  objc_msgSend(v30, "setDirectionalLayoutMargins:", 0.0, v22, 0.0, v21);
}

void __55__SearchUIRichTitleCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) title];
  id v22 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v2];

  [v22 setMaxLines:2];
  if ([*(id *)(a1 + 32) isCentered]) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 4;
  }
  id v4 = [*(id *)(a1 + 32) titleImage];
  v5 = +[SearchUIImage imageWithSFImage:v4 variantForAppIcon:v3];

  uint64_t v6 = +[SearchUITLKImageConverter imageForSFImage:v5];
  [*(id *)(a1 + 40) setImage:v6];

  [*(id *)(a1 + 40) setTitle:v22];
  v7 = [*(id *)(a1 + 32) richSubtitle];

  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    id v9 = [v8 richSubtitle];
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4FAE128];
    id v9 = [v8 subtitle];
    [v10 textWithString:v9];
  v11 = };
  [*(id *)(a1 + 40) setSubtitle:v11];

  v12 = [*(id *)(a1 + 32) reviewGlyph];
  v13 = +[SearchUIImage imageWithSFImage:v12 variantForAppIcon:1];
  v14 = +[SearchUITLKImageConverter imageForSFImage:v13];
  [*(id *)(a1 + 40) setSubtitleImage:v14];

  v15 = (void *)MEMORY[0x1E4FAE110];
  v16 = [*(id *)(a1 + 32) footnote];
  v17 = [v15 textWithString:v16];
  [*(id *)(a1 + 40) setFootnote:v17];

  objc_msgSend(*(id *)(a1 + 40), "setSubtitleIsEmphasized:", objc_msgSend(*(id *)(a1 + 32), "subtitleIsEmphasized"));
  v18 = [*(id *)(a1 + 32) contentAdvisory];
  [*(id *)(a1 + 40) setRoundedBorderText:v18];

  uint64_t v19 = (void *)MEMORY[0x1E4FAE110];
  v20 = [*(id *)(a1 + 32) auxiliaryMiddleText];
  double v21 = [v19 textWithString:v20];
  [*(id *)(a1 + 40) setTrailingText:v21];

  [*(id *)(a1 + 40) setAxis:*(void *)(a1 + 48)];
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIRichTitleCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  BOOL v6 = [(SearchUICardSectionView *)self isCompactWidth];
  v7 = [(SearchUIRichTitleCardSectionView *)self headerView];
  [v7 setUseCompactWidth:v6];
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 5;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)[a3 title];
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  return (id)[a3 subtitle];
}

- (TLKHeaderView)headerView
{
  return (TLKHeaderView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setHeaderView:(id)a3
{
}

- (SearchUIButtonItemStackView)buttonStackView
{
  return (SearchUIButtonItemStackView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setButtonStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end