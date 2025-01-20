@interface SearchUICardSectionCollectionViewCell
- (BOOL)highlightFrameMatchesHighlightView;
- (BOOL)needsInternalFocus;
- (BOOL)setupManualFocus;
- (CGRect)highlightFrame;
- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3;
- (NUIContainerBoxView)boxView;
- (SearchUICardSectionView)cardSectionView;
- (double)highlightFrameCornerRadius;
- (id)embeddedViewController;
- (id)highlightReferenceView;
- (id)leadingTextView;
- (id)leadingView;
- (id)presentingViewController;
- (id)rowModelForCustomHighlightBehavior;
- (id)sizingView;
- (id)viewForForcedFocus;
- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6;
- (void)emitInstrumentationEvent:(id)a3;
- (void)performSFCommand:(id)a3;
- (void)removeManualFocus;
- (void)reportSFFeedback:(id)a3;
- (void)returnKeyPressed;
- (void)setBoxView:(id)a3;
- (void)setCardSectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICardSectionCollectionViewCell

- (void)updateWithRowModel:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUICardSectionCollectionViewCell;
  [(SearchUICollectionViewCell *)&v25 updateWithRowModel:v4];
  if (!+[SearchUIContentConfigurator supportsConfigurationFor:v4])
  {
    [(SearchUICollectionViewCell *)self setUseSystemSizing:0];
    v6 = [(SearchUICardSectionCollectionViewCell *)self contentView];
    [v6 setClipsToBounds:0];

    v7 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];

    if (v7)
    {
      v8 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
      [v8 updateWithRowModel:v4];
    }
    else
    {
      v9 = [(SearchUICollectionViewCell *)self delegate];
      v10 = +[SearchUICardSectionCreator cardSectionViewForModel:v4 feedbackDelegate:v9];
      [(SearchUICardSectionCollectionViewCell *)self setCardSectionView:v10];

      v11 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];

      if (!v11)
      {
LABEL_8:
        [v4 minimumLayoutSize];
        double v21 = v20;
        double v23 = v22;
        v24 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
        objc_msgSend(v24, "setMinimumLayoutSize:", v21, v23);

        goto LABEL_9;
      }
      id v12 = objc_alloc(MEMORY[0x1E4F4BEE8]);
      v13 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
      v26[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v15 = (void *)[v12 initWithArrangedSubviews:v14];
      [(SearchUICardSectionCollectionViewCell *)self setBoxView:v15];

      v16 = [(SearchUICardSectionCollectionViewCell *)self boxView];
      [v16 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

      v17 = [(SearchUICardSectionCollectionViewCell *)self boxView];
      [v17 setVerticalAlignment:1];

      v18 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
      [v18 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

      v8 = [(SearchUICardSectionCollectionViewCell *)self contentView];
      v19 = [(SearchUICardSectionCollectionViewCell *)self boxView];
      [v8 addSubview:v19];
    }
    goto LABEL_8;
  }
  +[SearchUIContentConfigurator applyConfigurationTo:self rowModel:v4 interactionDelegate:self];
  v5 = [(SearchUICardSectionCollectionViewCell *)self contentView];
  [v5 setClipsToBounds:1];

  [(SearchUICollectionViewCell *)self setUseSystemSizing:1];
LABEL_9:
}

- (id)embeddedViewController
{
  v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  v3 = [v2 embeddedViewController];

  return v3;
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionCollectionViewCell;
  id v4 = a3;
  [(SearchUICollectionViewCell *)&v6 setDelegate:v4];
  v5 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  [v5 setFeedbackDelegate:v4];
}

- (id)sizingView
{
  v3 = [(SearchUICardSectionCollectionViewCell *)self boxView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SearchUICardSectionCollectionViewCell *)self contentView];
  }
  objc_super v6 = v5;

  return v6;
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  [v6 updateChevronVisible:v5 leaveSpaceForChevron:v4];
}

- (id)leadingView
{
  v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  v3 = [v2 leadingView];

  return v3;
}

- (id)leadingTextView
{
  v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  v3 = [v2 leadingTextView];

  return v3;
}

- (BOOL)needsInternalFocus
{
  v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  char v3 = [v2 needsInternalFocus];

  return v3;
}

- (BOOL)setupManualFocus
{
  v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  char v3 = [v2 setupManualFocus];

  return v3;
}

- (void)removeManualFocus
{
  id v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  [v2 removeManualFocus];
}

- (id)rowModelForCustomHighlightBehavior
{
  char v3 = [(SearchUICollectionViewCell *)self rowModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(SearchUICollectionViewCell *)self rowModel];
    if ([v5 supportsCustomHighlightBehavior]) {
      goto LABEL_5;
    }
  }
  BOOL v5 = 0;
LABEL_5:
  return v5;
}

- (CGRect)highlightFrame
{
  char v3 = [(SearchUICardSectionCollectionViewCell *)self rowModelForCustomHighlightBehavior];
  if (v3)
  {
    BOOL v4 = [(SearchUICardSectionCollectionViewCell *)self contentView];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [v3 intrinsicContentInset];
    +[SearchUIAutoLayout rect:insettedBy:isLTR:](SearchUIAutoLayout, "rect:insettedBy:isLTR:", [(SearchUICardSectionCollectionViewCell *)self effectiveUserInterfaceLayoutDirection] == 0, v6, v8, v10, v12, v13, v14, v15, v16);
  }
  else
  {
    BOOL v4 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
    [v4 highlightFrame];
  }
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)highlightFrameCornerRadius
{
  char v3 = [(SearchUICardSectionCollectionViewCell *)self rowModelForCustomHighlightBehavior];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 highlightReferenceFrameCornerRadius];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUICardSectionCollectionViewCell;
    [(SearchUICollectionViewCell *)&v8 highlightFrameCornerRadius];
  }
  double v6 = v5;

  return v6;
}

- (id)highlightReferenceView
{
  id v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  char v3 = [v2 highlightReferenceView];

  return v3;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  char v3 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  if ([v3 highlightFrameMatchesHighlightView])
  {
    BOOL v4 = [(SearchUICardSectionCollectionViewCell *)self rowModelForCustomHighlightBehavior];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)returnKeyPressed
{
  id v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  [v2 returnKeyPressed];
}

- (id)viewForForcedFocus
{
  id v2 = [(SearchUICardSectionCollectionViewCell *)self cardSectionView];
  char v3 = [v2 viewForForcedFocus];

  return v3;
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  double leading = a3.leading;
  v20.receiver = self;
  v20.super_class = (Class)SearchUICardSectionCollectionViewCell;
  -[SearchUICollectionViewCell _preferredSeparatorInsetsForProposedInsets:](&v20, sel__preferredSeparatorInsetsForProposedInsets_, a3.top, a3.leading, a3.bottom, a3.trailing);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(SearchUICollectionViewCell *)self rowModel];
  double v14 = [v13 cardSection];
  if (+[SnippetUIUtilities supportsConfigurationForCardSection:v14])
  {
    int v15 = [(SearchUICollectionViewCell *)self sfSeparatorStyle];

    if (v15 == 3) {
      double v8 = leading;
    }
  }
  else
  {
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.trailing = v19;
  result.bottom = v18;
  result.double leading = v17;
  result.top = v16;
  return result;
}

- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(SearchUICollectionViewCell *)self rowModel];
  double v13 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities createViewControllersForButtons:v12 buttonFont:v11 isCompact:v6 sourceView:self rowModel:v14 delegate:v13 completionHandler:v10];
}

- (void)performSFCommand:(id)a3
{
  id v4 = a3;
  id v6 = [(SearchUICollectionViewCell *)self rowModel];
  double v5 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities performSFCommand:v4 rowModel:v6 delegate:v5];
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities emitInstrumentationEvent:v4 delegate:v5];
}

- (void)reportSFFeedback:(id)a3
{
  id v4 = a3;
  id v7 = [(SearchUICollectionViewCell *)self rowModel];
  uint64_t v5 = [v7 queryId];
  id v6 = [(SearchUICollectionViewCell *)self delegate];
  +[SnippetUIUtilities reportFeedback:v4 queryId:v5 delegate:v6];
}

- (id)presentingViewController
{
  char v3 = [(SearchUICollectionViewCell *)self delegate];
  id v4 = +[SnippetUIUtilities presentingViewController:self delegate:v3];

  return v4;
}

- (SearchUICardSectionView)cardSectionView
{
  return (SearchUICardSectionView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setCardSectionView:(id)a3
{
}

- (NUIContainerBoxView)boxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setBoxView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_cardSectionView, 0);
}

@end