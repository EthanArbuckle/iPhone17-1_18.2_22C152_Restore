@interface SearchUIInfoCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (BOOL)isExpanded;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableArray)rowStackViews;
- (NUIContainerStackView)baseView;
- (NUIContainerStackView)expandedView;
- (NUIContainerStackView)showMoreStackView;
- (TLKTextButton)showMoreButton;
- (UIEdgeInsets)layoutMargins;
- (UIFont)labelFont;
- (id)setupContentView;
- (void)configureShowMoreViewIfNecessary;
- (void)didInvalidateSizeAnimate:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBaseView:(id)a3;
- (void)setExpandedView:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setLabelFont:(id)a3;
- (void)setRowStackViews:(id)a3;
- (void)setShowMoreButton:(id)a3;
- (void)setShowMoreStackView:(id)a3;
- (void)showMoreButtonPressed;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIInfoCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v3 = objc_opt_new();
  [(SearchUIInfoCardSectionView *)self setRowStackViews:v3];

  v4 = objc_opt_new();
  [v4 setAxis:1];
  double v5 = 8.0;
  if (([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0 && TLKSnippetModernizationEnabled())
  {
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:11.0];
    double v5 = v6;
  }
  [v4 setSpacing:v5];
  [v4 setAlignment:0];
  [(SearchUIInfoCardSectionView *)self setBaseView:v4];
  v7 = objc_opt_new();
  [v7 setAxis:1];
  [v4 spacing];
  objc_msgSend(v7, "setSpacing:");
  [v7 setAlignment:0];
  [(SearchUIInfoCardSectionView *)self setExpandedView:v7];
  [(SearchUIInfoCardSectionView *)self setNeverCacheEffectiveLayoutSize:1];
  v8 = objc_opt_new();
  [v8 addSubview:v4];
  [v8 addSubview:v7];

  return v8;
}

- (void)updateWithRowModel:(id)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)SearchUIInfoCardSectionView;
  id v64 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v67, sel_updateWithRowModel_);
  v4 = [(SearchUICardSectionView *)self section];
  uint64_t v5 = [v4 initiallyVisibleTuples];

  double v6 = [(SearchUICardSectionView *)self section];
  v7 = [v6 infoTuples];

  if ((unint64_t)([v7 count] - v5) <= 1) {
    uint64_t v5 = [v7 count];
  }
  v8 = [(SearchUIInfoCardSectionView *)self rowStackViews];
  unint64_t v9 = [v8 count];
  v66 = v7;
  unint64_t v10 = [v7 count];

  unint64_t v65 = v5;
  if (v9 < v10)
  {
    v11 = (void *)MEMORY[0x1E4FB2950];
    do
    {
      v12 = +[TLKLabel primaryLabel];
      v13 = (void *)MEMORY[0x1E4FAE090];
      char v14 = [MEMORY[0x1E4FAE198] isMacOS];
      v15 = v11;
      if ((v14 & 1) == 0)
      {
        int v16 = TLKSnippetModernizationEnabled();
        v15 = (void *)MEMORY[0x1E4FB28C8];
        if (!v16) {
          v15 = v11;
        }
      }
      v17 = [v13 cachedFontForTextStyle:*v15];
      [v12 setFont:v17];

      LODWORD(v18) = 1148846080;
      [v12 setContentCompressionResistancePriority:0 forAxis:v18];
      LODWORD(v19) = 1148846080;
      [v12 setContentHuggingPriority:0 forAxis:v19];
      [v12 setNumberOfLines:0];
      v20 = [(SearchUIInfoCardSectionView *)self labelFont];

      if (!v20)
      {
        v21 = [v12 font];
        [(SearchUIInfoCardSectionView *)self setLabelFont:v21];
      }
      v22 = objc_opt_new();
      [v22 setSizingDelegate:self];
      v23 = [(SearchUICardSectionView *)self feedbackDelegate];
      [v22 setFeedbackDelegate:v23];

      id v24 = objc_alloc(MEMORY[0x1E4FAE158]);
      v68[0] = v22;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
      v26 = (void *)[v24 initWithArrangedSubviews:v25];

      [v26 setAxis:0];
      [v26 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
      [v26 setSpacing:8.0];
      [v26 setAlignment:1];
      [v26 setDistribution:0];
      v27 = [(SearchUIInfoCardSectionView *)self rowStackViews];
      [v27 addObject:v26];

      if (!v5
        || ([(SearchUIInfoCardSectionView *)self rowStackViews],
            v28 = objc_claimAutoreleasedReturnValue(),
            unint64_t v29 = [v28 count],
            v28,
            BOOL v30 = v65 >= v29,
            uint64_t v5 = v65,
            v30))
      {
        v31 = [(SearchUIInfoCardSectionView *)self baseView];
      }
      else
      {
        v31 = [(SearchUIInfoCardSectionView *)self expandedView];
      }
      v32 = v31;
      [v31 addArrangedSubview:v26];

      v33 = [(SearchUIInfoCardSectionView *)self rowStackViews];
      unint64_t v34 = [v33 count];
      unint64_t v35 = [v7 count];
    }
    while (v34 < v35);
  }
  v36 = [(SearchUIInfoCardSectionView *)self rowStackViews];
  uint64_t v37 = [v36 count];

  v38 = v7;
  if (v37)
  {
    unint64_t v39 = 0;
    do
    {
      v40 = [(SearchUIInfoCardSectionView *)self rowStackViews];
      v41 = [v40 objectAtIndexedSubscript:v39];

      v42 = [v41 arrangedSubviews];
      v43 = [v42 objectAtIndexedSubscript:0];

      unint64_t v44 = [v38 count];
      v45 = [(SearchUIInfoCardSectionView *)self rowStackViews];
      v46 = [v45 objectAtIndexedSubscript:v39];
      [v46 setHidden:v39 >= v44];

      if (v39 < v44)
      {
        v47 = [v38 objectAtIndexedSubscript:v39];
        v48 = (void *)[v47 copy];

        v49 = [v48 key];
        if (v49)
        {
          v50 = [v48 key];
        }
        else
        {
          v50 = &stru_1F40279D8;
        }

        [v43 setRowModel:v64];
        v51 = [v48 values];
        v52 = (void *)[v51 mutableCopy];

        v53 = objc_opt_new();
        v54 = NSString;
        v55 = +[SearchUIUtilities localizedStringForKey:@"LIST_TITLE_COLON"];
        v56 = [v54 stringWithValidatedFormat:v55, @"%@", 0, v50 validFormatSpecifiers error];
        [v53 setTitle:v56];

        [v52 insertObject:v53 atIndex:0];
        if ([v48 initiallyVisibleValues]) {
          objc_msgSend(v48, "setInitiallyVisibleValues:", objc_msgSend(v48, "initiallyVisibleValues") + 1);
        }
        [v48 setValues:v52];
        [v43 setTuple:v48];

        v38 = v66;
      }

      ++v39;
      v57 = [(SearchUIInfoCardSectionView *)self rowStackViews];
      unint64_t v58 = [v57 count];
    }
    while (v39 < v58);
  }
  [(SearchUIInfoCardSectionView *)self configureShowMoreViewIfNecessary];
  if (v65) {
    BOOL v59 = v65 >= [v38 count];
  }
  else {
    BOOL v59 = 1;
  }
  v60 = [(SearchUIInfoCardSectionView *)self showMoreStackView];
  [v60 setHidden:v59];

  v61 = [(SearchUICardSectionView *)self section];
  v62 = [v64 cardSection];
  BOOL v63 = v61 == v62 && [(SearchUIInfoCardSectionView *)self isExpanded];
  [(SearchUIInfoCardSectionView *)self setIsExpanded:v63];

  [(SearchUIInfoCardSectionView *)self invalidateIntrinsicContentSize];
}

- (void)setIsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SearchUIInfoCardSectionView *)self expandedView];
  double v6 = v5;
  double v7 = 0.0;
  if (v3)
  {
    double v7 = 1.0;
    v8 = @"SEARCH_RESULTS_SHOW_LESS_BUTTON_TITLE";
  }
  else
  {
    v8 = @"SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE";
  }
  [v5 setAlpha:v7];

  id v11 = +[SearchUIUtilities localizedStringForKey:v8];
  unint64_t v9 = [MEMORY[0x1E4FAE128] textWithString:v11];
  unint64_t v10 = [(SearchUIInfoCardSectionView *)self showMoreButton];
  [v10 setRichTitle:v9];

  self->_isExpanded = v3;
}

- (void)configureShowMoreViewIfNecessary
{
  v16[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SearchUICardSectionView *)self section];
  v4 = (void *)[v3 initiallyVisibleTuples];

  if (v4)
  {
    uint64_t v5 = [(SearchUIInfoCardSectionView *)self showMoreButton];

    if (!v5)
    {
      double v6 = objc_opt_new();
      if (TLKSnippetModernizationEnabled()) {
        [v6 setProminence:2];
      }
      [v6 addTarget:self action:sel_showMoreButtonPressed];
      [(SearchUIInfoCardSectionView *)self setShowMoreButton:v6];
    }
    double v7 = [(SearchUIInfoCardSectionView *)self labelFont];
    v8 = v7;
    if (!v7)
    {
      v4 = [(SearchUIInfoCardSectionView *)self showMoreButton];
      v8 = [v4 font];
    }
    unint64_t v9 = [(SearchUIInfoCardSectionView *)self showMoreButton];
    [v9 setFont:v8];

    if (!v7)
    {
    }
    unint64_t v10 = [(SearchUIInfoCardSectionView *)self showMoreStackView];

    if (!v10)
    {
      id v11 = (void *)MEMORY[0x1E4F4BF00];
      v12 = [(SearchUIInfoCardSectionView *)self showMoreButton];
      v16[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      char v14 = [v11 horizontalContainerStackViewWithArrangedSubviews:v13];

      [v14 setAlignment:3];
      [v14 setDistribution:6];
      [v14 setSpacing:2.0];
      v15 = [(SearchUICardSectionView *)self contentView];
      [v15 addSubview:v14];

      [(SearchUIInfoCardSectionView *)self setShowMoreStackView:v14];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SearchUIInfoCardSectionView *)self baseView];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  if ([(SearchUIInfoCardSectionView *)self isExpanded])
  {
    id v11 = [(SearchUIInfoCardSectionView *)self expandedView];
    objc_msgSend(v11, "sizeThatFits:", width, height);
    double v13 = v12;

    char v14 = [(SearchUIInfoCardSectionView *)self baseView];
    [v14 spacing];
    double v10 = v10 + v13 + v15;
  }
  int v16 = [(SearchUIInfoCardSectionView *)self showMoreStackView];
  char v17 = [v16 isHidden];

  if ((v17 & 1) == 0)
  {
    double v18 = [(SearchUIInfoCardSectionView *)self showMoreStackView];
    objc_msgSend(v18, "sizeThatFits:", width, height);
    double v20 = v19;

    double v10 = v10 + v20;
  }
  double v21 = v8;
  double v22 = v10;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SearchUIInfoCardSectionView;
  [(SearchUIInfoCardSectionView *)&v36 layoutSubviews];
  BOOL v3 = [(SearchUICardSectionView *)self contentView];
  [(SearchUIInfoCardSectionView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  double v10 = [(SearchUIInfoCardSectionView *)self baseView];
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  double v12 = v11;

  double v13 = [(SearchUIInfoCardSectionView *)self expandedView];
  objc_msgSend(v13, "sizeThatFits:", v7, v9);
  double v15 = v14;

  int v16 = [(SearchUIInfoCardSectionView *)self showMoreStackView];
  objc_msgSend(v16, "sizeThatFits:", v7, v9);
  double v18 = v17;

  double v19 = [(SearchUIInfoCardSectionView *)self baseView];
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v7, v12);

  double v20 = [(SearchUIInfoCardSectionView *)self baseView];
  [v20 frame];
  double v22 = v21;
  v23 = [(SearchUIInfoCardSectionView *)self baseView];
  [v23 frame];
  double MaxY = CGRectGetMaxY(v37);
  v25 = [(SearchUIInfoCardSectionView *)self baseView];
  [v25 spacing];
  double v27 = MaxY + v26;
  v28 = [(SearchUIInfoCardSectionView *)self expandedView];
  objc_msgSend(v28, "setFrame:", v22, v27, v7, v15);

  if ([(SearchUIInfoCardSectionView *)self isExpanded]) {
    [(SearchUIInfoCardSectionView *)self expandedView];
  }
  else {
  unint64_t v29 = [(SearchUIInfoCardSectionView *)self baseView];
  }
  [v29 frame];
  double v30 = CGRectGetMaxY(v38);

  double v31 = 0.0;
  if (([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0)
  {
    if (TLKSnippetModernizationEnabled()) {
      double v31 = 5.0;
    }
    else {
      double v31 = 0.0;
    }
  }
  v32 = [(SearchUIInfoCardSectionView *)self baseView];
  [v32 frame];
  double v34 = v33;
  unint64_t v35 = [(SearchUIInfoCardSectionView *)self showMoreStackView];
  objc_msgSend(v35, "setFrame:", v34, v30 + v31, v7, v18);
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = [(SearchUICardSectionView *)self contentView];

  if (v9 == v8)
  {
    -[SearchUIInfoCardSectionView sizeThatFits:](self, "sizeThatFits:", width, height);
  }
  else
  {
    double v10 = *MEMORY[0x1E4F4BED8];
    double v11 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)didInvalidateSizeAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  [(SearchUIInfoCardSectionView *)self invalidateIntrinsicContentSize];
  v5.receiver = self;
  v5.super_class = (Class)SearchUIInfoCardSectionView;
  [(SearchUICardSectionView *)&v5 didInvalidateSizeAnimate:v3];
}

- (void)showMoreButtonPressed
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SearchUIInfoCardSectionView_showMoreButtonPressed__block_invoke;
  v3[3] = &unk_1E6E72730;
  v3[4] = self;
  +[SearchUIUtilities performAnimatableChanges:v3 animated:1];
  [(SearchUIInfoCardSectionView *)self didInvalidateSizeAnimate:1];
}

uint64_t __52__SearchUIInfoCardSectionView_showMoreButtonPressed__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isExpanded] ^ 1;
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setIsExpanded:v2];
}

- (UIEdgeInsets)layoutMargins
{
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NUIContainerStackView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
}

- (NUIContainerStackView)expandedView
{
  return self->_expandedView;
}

- (void)setExpandedView:(id)a3
{
}

- (NSMutableArray)rowStackViews
{
  return self->_rowStackViews;
}

- (void)setRowStackViews:(id)a3
{
}

- (NUIContainerStackView)showMoreStackView
{
  return self->_showMoreStackView;
}

- (void)setShowMoreStackView:(id)a3
{
}

- (TLKTextButton)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_showMoreStackView, 0);
  objc_storeStrong((id *)&self->_rowStackViews, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
}

@end