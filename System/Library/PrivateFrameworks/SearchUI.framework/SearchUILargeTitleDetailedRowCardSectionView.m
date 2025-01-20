@interface SearchUILargeTitleDetailedRowCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (SearchUIButtonItemStackView)buttonStackView;
- (SearchUILabel)titleLabel;
- (TLKTextButton)subtitleButton;
- (UIEdgeInsets)layoutMargins;
- (id)setupContentView;
- (void)didSelectSubtitleItem;
- (void)setButtonStackView:(id)a3;
- (void)setSubtitleButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUILargeTitleDetailedRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v3 = +[TLKLabel primaryLabel];
  v4 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2990]];
  [v3 setFont:v4];

  if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    double v5 = 0.0;
    double v6 = 2.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  objc_msgSend(v3, "setCustomAlignmentRectInsets:", v6, v5, v7, v8);
  [v3 setAdjustsFontSizeToFitWidth:1];
  [v3 setMinimumScaleFactor:0.6];
  [(SearchUILargeTitleDetailedRowCardSectionView *)self setTitleLabel:v3];
  v9 = objc_opt_new();
  v10 = (void *)MEMORY[0x1E4FAE090];
  int v11 = [MEMORY[0x1E4FAE198] isMacOS];
  v12 = (void *)MEMORY[0x1E4FB28D0];
  if (!v11) {
    v12 = (void *)MEMORY[0x1E4FB28F0];
  }
  v13 = [v10 cachedFontForTextStyle:*v12];
  [v9 setFont:v13];

  [v9 setProminence:2];
  v14 = [v9 titleLabel];
  [v14 setNumberOfLines:2];

  v15 = [v9 titleLabel];
  [v15 setLineBreakMode:4];

  [(SearchUILargeTitleDetailedRowCardSectionView *)self setSubtitleButton:v9];
  id v16 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v25[0] = v3;
  v25[1] = v9;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v18 = (void *)[v16 initWithArrangedSubviews:v17];

  [v18 setAxis:1];
  [v18 setAlignment:1];
  [v18 setDistribution:0];
  [v18 setSpacing:4.0];
  [v18 setDelegate:self];
  v19 = objc_opt_new();
  [(SearchUILargeTitleDetailedRowCardSectionView *)self setButtonStackView:v19];
  id v20 = objc_alloc(MEMORY[0x1E4FAE158]);
  v24[0] = v18;
  v24[1] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v22 = (void *)[v20 initWithArrangedSubviews:v21];

  [v22 setAlignment:3];
  [v22 setDistribution:3];
  [v22 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
  [v22 setSpacing:*MEMORY[0x1E4FAE1B8]];

  return v22;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SearchUILargeTitleDetailedRowCardSectionView;
  [(SearchUICardSectionView *)&v37 updateWithRowModel:v4];
  double v5 = [v4 cardSection];
  double v6 = [v5 title];
  [v6 setMaxLines:1];
  double v7 = [(SearchUILargeTitleDetailedRowCardSectionView *)self titleLabel];
  [v7 setSfText:v6];

  double v8 = [v5 subtitleButtonItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v5 subtitleButtonItem];
    int v11 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v11 setHidden:0];

    v12 = [v10 title];
    v13 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v13 setTitle:v12];

    v14 = [v10 command];
    v15 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v15 setShowsMenuAsPrimaryAction:v14 == 0];

    id v16 = [(SearchUICardSectionView *)self feedbackDelegate];
    v17 = +[SearchUIUtilities environmentForDelegate:v16];

    v18 = +[SearchUICommandHandler handlerForRowModel:v4 environment:v17];
    v19 = [v5 subtitleButtonItem];
    id v20 = [v18 menuForRowModel:v4 buttonItem:v19 commandEnvironment:v17];
    v21 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v21 setMenu:v20];

    v22 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v22 addTarget:self action:sel_didSelectSubtitleItem];
  }
  else
  {
    v10 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    [v10 setHidden:1];
  }

  v23 = [v5 trailingButtonItems];
  if ([v23 count] != 1)
  {
    BOOL v31 = 0;
    goto LABEL_8;
  }
  v24 = [v5 trailingButtonItems];
  v25 = [v24 objectAtIndexedSubscript:0];
  objc_opt_class();
  char v26 = objc_opt_isKindOfClass();

  if (v26)
  {
    v27 = [v5 trailingButtonItems];
    v23 = [v27 objectAtIndexedSubscript:0];

    v28 = [v23 person];
    v29 = [v28 emailAddresses];
    v30 = [v29 firstObject];
    BOOL v31 = [v30 length] != 0;

LABEL_8:
    goto LABEL_10;
  }
  BOOL v31 = 0;
LABEL_10:
  v32 = [(SearchUILargeTitleDetailedRowCardSectionView *)self buttonStackView];
  [v32 setShouldReverseButtonOrder:v31];

  v33 = [(SearchUILargeTitleDetailedRowCardSectionView *)self buttonStackView];
  v34 = [v5 trailingButtonItems];
  if (v31) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = 3;
  }
  v36 = [(SearchUICardSectionView *)self feedbackDelegate];
  [v33 updateWithButtonItems:v34 maxButtonItems:v35 buttonItemViewType:1 rowModel:v4 feedbackDelegate:v36];
}

- (void)didSelectSubtitleItem
{
  v3 = [(SearchUICardSectionView *)self rowModel];
  id v14 = [v3 cardSection];

  id v4 = [v14 subtitleButtonItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v6 = v14;
  if (isKindOfClass)
  {
    double v7 = [v14 subtitleButtonItem];
    double v8 = [(SearchUICardSectionView *)self feedbackDelegate];
    v9 = +[SearchUIUtilities environmentForDelegate:v8];

    v10 = [v7 command];

    if (v10)
    {
      int v11 = [(SearchUICardSectionView *)self rowModel];
      v12 = +[SearchUICommandHandler handlerForButton:v7 rowModel:v11 environment:v9];

      v13 = [v7 command];
      [v12 performCommand:v13 triggerEvent:3 environment:v9];
    }
    double v6 = v14;
  }
}

- (UIEdgeInsets)layoutMargins
{
  int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  double v3 = 12.0;
  if (v2) {
    double v4 = 12.0;
  }
  else {
    double v4 = 16.0;
  }
  double v5 = 18.0;
  if (v2) {
    double v5 = 16.0;
  }
  else {
    double v3 = 18.0;
  }
  double v6 = v3;
  result.right = v5;
  result.bottom = v6;
  result.left = v3;
  result.top = v4;
  return result;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];

  if (v9 == v8)
  {
    v12 = [(SearchUILargeTitleDetailedRowCardSectionView *)self subtitleButton];
    v13 = [v12 titleLabel];
    objc_msgSend(v13, "effectiveLayoutSizeFittingSize:", width, height);
    double v10 = v14;
    double v11 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F4BED8];
    double v11 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }
  double v16 = v10;
  double v17 = v11;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TLKTextButton)subtitleButton
{
  return self->_subtitleButton;
}

- (void)setSubtitleButton:(id)a3
{
}

- (SearchUIButtonItemStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_subtitleButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end