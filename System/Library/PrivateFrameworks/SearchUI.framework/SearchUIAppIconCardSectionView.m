@interface SearchUIAppIconCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (BOOL)needsInternalFocus;
- (BOOL)setupManualFocus;
- (SearchUIHomeScreenAppIconView)appIconView;
- (TLKAuxilliaryTextView)folderLabelView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)setupContentView;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)dealloc;
- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4;
- (void)removeManualFocus;
- (void)returnKeyPressed;
- (void)setAppIconView:(id)a3;
- (void)setFolderLabelView:(id)a3;
- (void)updateWithRowModel:(id)a3;
- (void)willRemoveIcon:(id)a3;
@end

@implementation SearchUIAppIconCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIAppIconCardSectionView;
  [(NUIContainerStackView *)&v4 dealloc];
}

- (id)setupContentView
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_willRemoveIcon_ name:*MEMORY[0x1E4FA6708] object:0];

  objc_super v4 = objc_opt_new();
  [v4 setHidden:1];
  [(SearchUIAppIconCardSectionView *)self setFolderLabelView:v4];
  v5 = objc_opt_new();
  v6 = [(SearchUICardSectionView *)self feedbackDelegate];
  [v5 setFeedbackDelegate:v6];

  [v5 setEngagementDelegate:self];
  if (+[SearchUIUtilities isIpad]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 5;
  }
  [v5 setVariant:v7];
  [v5 setClipsToBounds:0];
  [(SearchUIAppIconCardSectionView *)self setAppIconView:v5];
  v8 = (void *)MEMORY[0x1E4F4BEE8];
  v12[0] = v5;
  v12[1] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v8 containerBoxViewWithArrangedSubviews:v9];

  [v10 setVerticalAlignment:3];
  [v10 setHorizontalAlignment:3];
  [v10 setAlignment:4 forView:v4 inAxis:0];
  +[SearchUIAppIconUtilities appIconItemSize];
  objc_msgSend(v10, "setMinimumLayoutSize:");
  [v10 setLayoutMarginsRelativeArrangement:1];
  [v10 setDelegate:self];

  return v10;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIAppIconCardSectionView;
  [(SearchUICardSectionView *)&v15 updateWithRowModel:v4];
  v5 = [v4 identifyingResult];
  v6 = [v5 auxiliaryTopText];
  if (![v6 length])
  {

    goto LABEL_5;
  }
  int v7 = [v4 shouldFillAvailableSpace];

  if (!v7)
  {
LABEL_5:
    v9 = [(SearchUIAppIconCardSectionView *)self folderLabelView];
    [v9 setTopText:0];
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1E4FAE128];
  v9 = [v4 identifyingResult];
  v10 = [v9 auxiliaryTopText];
  v11 = [v8 textWithString:v10];
  v12 = [(SearchUIAppIconCardSectionView *)self folderLabelView];
  [v12 setTopText:v11];

LABEL_6:
  v13 = [(SearchUIAppIconCardSectionView *)self appIconView];
  [v13 updateWithRowModel:v4];

  v14 = [(SearchUICardSectionView *)self contentView];
  [v14 layoutBelowIfNeeded];
}

- (void)willRemoveIcon:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA6860]];
  id v12 = [v5 nodeIdentifier];

  v6 = [(SearchUICardSectionView *)self rowModel];
  int v7 = [v6 cardSection];

  v8 = [v7 applicationBundleIdentifier];
  if ([v8 isEqualToString:v12])
  {
    v9 = [(SearchUICardSectionView *)self feedbackDelegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_5;
    }
    v8 = [(SearchUICardSectionView *)self feedbackDelegate];
    v11 = [(SearchUICardSectionView *)self rowModel];
    [v8 removeRowModel:v11 completion:0];
  }
LABEL_5:
}

- (BOOL)needsInternalFocus
{
  return 1;
}

- (BOOL)setupManualFocus
{
  v2 = [(SearchUIAppIconCardSectionView *)self appIconView];
  [v2 setAddRoundedKeyboardHighlight:1];

  return 1;
}

- (void)removeManualFocus
{
  id v2 = [(SearchUIAppIconCardSectionView *)self appIconView];
  [v2 setAddRoundedKeyboardHighlight:0];
}

- (void)returnKeyPressed
{
  id v2 = [(SearchUIAppIconCardSectionView *)self appIconView];
  [v2 launchIcon];
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(SearchUICardSectionView *)self feedbackDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v9 didUpdateKeyboardFocusToResult:v10 cardSection:v6];
  }
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  v9 = (SearchUIAppIconCardSectionView *)a3;
  if (self == v9)
  {
    id v10 = [(SearchUICardSectionView *)self rowModel];
    uint64_t v11 = [v10 sectionType];

    if (v11 == 1)
    {
      double v12 = width
          / (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow];
      v13 = [(SearchUIAppIconCardSectionView *)self appIconView];
      [v13 intrinsicContentSize];
      double v15 = (v12 - v14) * 0.5;

      +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell];
      double v17 = v16;
      v18 = [(SearchUICardSectionView *)self contentView];
      v19 = v18;
      if (v15 >= 0.0) {
        double v20 = v15;
      }
      else {
        double v20 = 0.0;
      }
      if (v15 > 0.0) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 3;
      }
      objc_msgSend(v18, "setDirectionalLayoutMargins:", v17, v20, v17, v20);

      v22 = [(SearchUIAppIconCardSectionView *)self folderLabelView];
      [v22 setHidden:v15 <= 0.0];

      v23 = [(SearchUICardSectionView *)self contentView];
      v24 = [(SearchUIAppIconCardSectionView *)self folderLabelView];
      [v23 setAlignment:4 forView:v24 inAxis:0];

      v25 = [(SearchUICardSectionView *)self contentView];
      v26 = [(SearchUIAppIconCardSectionView *)self appIconView];
      [v25 setAlignment:v21 forView:v26 inAxis:0];
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SearchUIAppIconCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v27, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, v9, a5, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppIconCardSectionView;
  v5 = -[SearchUIAppIconCardSectionView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self])
  {
    id v6 = [(SearchUIAppIconCardSectionView *)self appIconView];
  }
  else
  {
    id v6 = v5;
  }
  int v7 = v6;

  return v7;
}

- (SearchUIHomeScreenAppIconView)appIconView
{
  return (SearchUIHomeScreenAppIconView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setAppIconView:(id)a3
{
}

- (TLKAuxilliaryTextView)folderLabelView
{
  return (TLKAuxilliaryTextView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setFolderLabelView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end