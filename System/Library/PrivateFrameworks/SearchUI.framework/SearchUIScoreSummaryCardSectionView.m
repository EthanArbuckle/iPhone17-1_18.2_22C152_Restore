@interface SearchUIScoreSummaryCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)dragTitleForCardSection:(id)a3;
+ (id)titleForScoreBoard:(id)a3 forDisplay:(BOOL)a4;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (BOOL)hasCommandForButtonItem:(id)a3;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (TLKSplitHeaderView)splitHeaderView;
- (id)commandForButtonItem:(id)a3;
- (id)setupContentView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)didPressLeadingButtonForSplitHeader:(id)a3;
- (void)didPressTrailingButtonForSplitHeader:(id)a3;
- (void)performCommandForButtonItem:(id)a3;
- (void)setSplitHeaderView:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIScoreSummaryCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 5;
}

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 disableUnbatchedUpdates];
  [(SearchUIScoreSummaryCardSectionView *)self setSplitHeaderView:v3];
  v4 = [(SearchUIScoreSummaryCardSectionView *)self splitHeaderView];
  [v4 setDelegate:self];

  v5 = objc_opt_new();
  [v5 setHorizontalAlignment:3];
  [v5 setDelegate:self];
  [v5 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v5, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v5 addArrangedSubview:v3];

  return v5;
}

- (void)updateWithRowModel:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v13 updateWithRowModel:v4];
  v5 = [v4 cardSection];

  v6 = [(SearchUIScoreSummaryCardSectionView *)self splitHeaderView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SearchUIScoreSummaryCardSectionView_updateWithRowModel___block_invoke;
  v9[3] = &unk_1E6E72938;
  id v10 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  id v8 = v5;
  [v7 performBatchUpdates:v9];
}

void __58__SearchUIScoreSummaryCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  v49 = [*(id *)(a1 + 32) title];
  v2 = [*(id *)(a1 + 32) team1];
  v3 = [v2 score];
  if (!v3)
  {
    v9 = 0;
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) team2];
  v5 = [v4 score];

  if (v5)
  {

    v6 = [*(id *)(a1 + 32) team1];
    id v7 = [v6 score];
    v3 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v7];

    v2 = [*(id *)(a1 + 32) team2];
    id v8 = [v2 score];
    v9 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v8];

    v49 = @"–";
LABEL_5:

    goto LABEL_7;
  }
  v9 = 0;
  v3 = 0;
LABEL_7:
  id v10 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v49];
  [*(id *)(a1 + 40) setTitle:v10];

  [*(id *)(a1 + 40) setCenterLeadingTitle:v3];
  [*(id *)(a1 + 40) setCenterTrailingTitle:v9];
  id v11 = [*(id *)(a1 + 32) team1];
  v12 = [v11 score];
  if (v12)
  {
    objc_super v13 = [*(id *)(a1 + 32) team2];
    v14 = [v13 score];
    [*(id *)(a1 + 40) setUseLargeTitle:v14 != 0];
  }
  else
  {
    [*(id *)(a1 + 40) setUseLargeTitle:0];
  }

  v15 = [*(id *)(a1 + 32) subtitle];
  v16 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v15];
  [*(id *)(a1 + 40) setSubtitle1:v16];

  v17 = [*(id *)(a1 + 32) eventStatus];
  v18 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v17];
  [*(id *)(a1 + 40) setSubtitle2:v18];

  v19 = [*(id *)(a1 + 32) eventStatus];
  v20 = [*(id *)(a1 + 40) subtitle1];
  [v20 setMaxLines:v19 != 0];

  [*(id *)(a1 + 40) setShouldBadgeSubtitle:1];
  v21 = [*(id *)(a1 + 32) team1];
  v22 = [v21 logo];
  v23 = +[SearchUITLKImageConverter imageForSFImage:v22];
  [*(id *)(a1 + 40) setLeadingImage:v23];

  v24 = *(void **)(a1 + 48);
  v25 = [*(id *)(a1 + 32) team1];
  v26 = [v25 button];
  objc_msgSend(*(id *)(a1 + 40), "setIsLeadingButtonEnabled:", objc_msgSend(v24, "hasCommandForButtonItem:", v26));

  v27 = [*(id *)(a1 + 32) team2];
  v28 = [v27 logo];
  v29 = +[SearchUITLKImageConverter imageForSFImage:v28];
  [*(id *)(a1 + 40) setTrailingImage:v29];

  v30 = *(void **)(a1 + 48);
  v31 = [*(id *)(a1 + 32) team2];
  v32 = [v31 button];
  objc_msgSend(*(id *)(a1 + 40), "setIsTrailingButtonEnabled:", objc_msgSend(v30, "hasCommandForButtonItem:", v32));

  v33 = [*(id *)(a1 + 32) team1];
  v34 = [v33 name];
  v35 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v34];
  [*(id *)(a1 + 40) setLeadingTitle:v35];

  v36 = [*(id *)(a1 + 32) team2];
  v37 = [v36 name];
  v38 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v37];
  [*(id *)(a1 + 40) setTrailingTitle:v38];

  v39 = [*(id *)(a1 + 32) team1];
  v40 = [v39 record];
  if ([v40 isEqualToString:@" "])
  {
    v41 = 0;
  }
  else
  {
    v42 = [*(id *)(a1 + 32) team1];
    v41 = [v42 record];
  }
  v43 = [*(id *)(a1 + 32) team2];
  v44 = [v43 record];
  if ([v44 isEqualToString:@" "])
  {
    v45 = 0;
  }
  else
  {
    v46 = [*(id *)(a1 + 32) team2];
    v45 = [v46 record];
  }
  v47 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v41];
  [*(id *)(a1 + 40) setLeadingSubtitle:v47];

  v48 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v45];
  [*(id *)(a1 + 40) setTrailingSubtitle:v48];
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  BOOL v6 = [(SearchUICardSectionView *)self isCompactWidth];
  id v7 = [(SearchUIScoreSummaryCardSectionView *)self splitHeaderView];
  [v7 setUseCompactWidth:v6];
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = [(SearchUIScoreSummaryCardSectionView *)self splitHeaderView];

  if (v9 == v8)
  {
    BOOL v12 = +[SearchUIUtilities isLargeIpad];
    double v13 = 406.0;
    if (width <= 406.0) {
      double v13 = width;
    }
    if (v12 && width > 474.0) {
      double v11 = 474.0;
    }
    else {
      double v11 = v13;
    }
    objc_msgSend(v8, "effectiveLayoutSizeFittingSize:", v11, height);
    double v10 = v14;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F4BED8];
    double v10 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }

  double v15 = v11;
  double v16 = v10;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  [(SearchUICardSectionView *)&v4 updateChevronVisible:0 leaveSpaceForChevron:0];
}

+ (id)titleForScoreBoard:(id)a3 forDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [v5 team1];
  id v7 = [v5 team2];
  id v8 = [v6 score];
  if (v8)
  {
    id v9 = [v7 score];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  double v11 = [v6 record];
  if (v11)
  {
    BOOL v12 = [v7 record];
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  if (!v4)
  {
    v20 = NSString;
    v18 = [v6 name];
    if (v10)
    {
      v19 = [v6 score];
      v21 = [v7 name];
      v22 = [v7 score];
      v23 = [v5 subtitle];
      v24 = [v20 stringWithFormat:@"%@, %@ – %@, %@\n %@", v18, v19, v21, v22, v23];
    }
    else
    {
      if (!v13)
      {
        v19 = [v7 name];
        [v20 stringWithFormat:@"%@ – %@", v18, v19];
        v24 = LABEL_20:;
LABEL_21:

        if (v24) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      v19 = [v6 record];
      v21 = [v7 name];
      v22 = [v7 record];
      v24 = [v20 stringWithFormat:@"%@, %@ – %@, %@", v18, v19, v21, v22];
    }

    goto LABEL_21;
  }
  if (v10)
  {
    double v14 = [v6 score];
    double v15 = @"%@–%@";
    if ((unint64_t)[v14 length] <= 2)
    {
      double v16 = [v7 score];
      if ((unint64_t)[v16 length] <= 2) {
        double v15 = @"%@ – %@";
      }
    }
    v17 = NSString;
    v18 = [v6 score];
    v19 = [v7 score];
    objc_msgSend(v17, "stringWithFormat:", v15, v18, v19);
    goto LABEL_20;
  }
LABEL_22:
  v24 = [v5 title];
LABEL_23:

  return v24;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)[a1 titleForScoreBoard:a3 forDisplay:0];
}

- (void)didPressLeadingButtonForSplitHeader:(id)a3
{
  BOOL v4 = [(SearchUICardSectionView *)self rowModel];
  id v7 = [v4 cardSection];

  id v5 = [v7 team1];
  BOOL v6 = [v5 button];
  [(SearchUIScoreSummaryCardSectionView *)self performCommandForButtonItem:v6];
}

- (void)didPressTrailingButtonForSplitHeader:(id)a3
{
  BOOL v4 = [(SearchUICardSectionView *)self rowModel];
  id v7 = [v4 cardSection];

  id v5 = [v7 team2];
  BOOL v6 = [v5 button];
  [(SearchUIScoreSummaryCardSectionView *)self performCommandForButtonItem:v6];
}

- (BOOL)hasCommandForButtonItem:(id)a3
{
  v3 = [(SearchUIScoreSummaryCardSectionView *)self commandForButtonItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)performCommandForButtonItem:(id)a3
{
  id v4 = [(SearchUIScoreSummaryCardSectionView *)self commandForButtonItem:a3];
  if (v4)
  {
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 2;
    }
    [v4 executeWithTriggerEvent:v3];
  }
}

- (id)commandForButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardSectionView *)self rowModel];
  BOOL v6 = [(SearchUICardSectionView *)self feedbackDelegate];
  id v7 = +[SearchUIUtilities environmentForDelegate:v6];
  id v8 = +[SearchUICommandHandler handlerForButton:v4 rowModel:v5 environment:v7];

  return v8;
}

- (TLKSplitHeaderView)splitHeaderView
{
  return self->_splitHeaderView;
}

- (void)setSplitHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end