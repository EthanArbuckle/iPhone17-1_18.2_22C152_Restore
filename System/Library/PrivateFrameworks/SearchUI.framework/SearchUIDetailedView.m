@interface SearchUIDetailedView
+ (id)bannerBadgeForRowModel:(id)a3;
+ (void)addViewIfNecessary:(id)a3 toStackView:(id)a4 removeFromStackViews:(id)a5;
- (BOOL)arrangedViewMustCenter:(id)a3;
- (BOOL)configureMenuForFootnoteButton:(id)a3;
- (BOOL)hasSecondLine;
- (BOOL)isCompactWidth;
- (BOOL)isVerticalAlignment;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (NSMutableArray)accessoryViewControllers;
- (NSMutableArray)leadingViewControllers;
- (SearchUIAccessoryViewController)currentAccessoryViewController;
- (SearchUIButtonItemStackView)buttonItemStackView;
- (SearchUIDetailedRowModel)rowModel;
- (SearchUIDetailedView)initWithFeedbackDelegate:(id)a3;
- (SearchUIDetailedViewDelegate)buttonDelegate;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUILeadingViewController)currentLeadingViewController;
- (TLKDetailsView)detailsView;
- (TLKStackView)buttonAndDetailViewStackView;
- (TLKStackView)innerContainer;
- (UIView)leadingView;
- (double)trailingMarginForAccessoryViewController:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)didMoveToWindow;
- (void)footnoteButtonPressed;
- (void)setAccessoryViewControllers:(id)a3;
- (void)setButtonAndDetailViewStackView:(id)a3;
- (void)setButtonDelegate:(id)a3;
- (void)setButtonItemStackView:(id)a3;
- (void)setCurrentAccessoryViewController:(id)a3;
- (void)setCurrentLeadingViewController:(id)a3;
- (void)setDetailsView:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setInnerContainer:(id)a3;
- (void)setIsCompactWidth:(BOOL)a3;
- (void)setIsVerticalAlignment:(BOOL)a3;
- (void)setLeadingViewControllers:(id)a3;
- (void)setRowModel:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutMargins;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIDetailedView

- (SearchUIDetailedView)initWithFeedbackDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIDetailedView;
  v5 = [(SearchUIDetailedView *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(SearchUIDetailedView *)v5 setFeedbackDelegate:v4];
    [(NUIContainerStackView *)v6 setSpacing:*MEMORY[0x1E4FAE1C0]];
    [(SearchUIDetailedView *)v6 setLayoutMarginsRelativeArrangement:1];
    v7 = objc_opt_new();
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v7];
    [v7 setDelegate:v6];
    [(SearchUIDetailedView *)v6 addArrangedSubview:v7];
    [(SearchUIDetailedView *)v6 setInnerContainer:v7];
    v8 = objc_opt_new();
    [v8 setAxis:1];
    [v8 setSpacing:11.0];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v8];
    [(SearchUIDetailedView *)v6 setButtonAndDetailViewStackView:v8];
    v9 = [(SearchUIDetailedView *)v6 innerContainer];
    v10 = [(SearchUIDetailedView *)v6 buttonAndDetailViewStackView];
    [v9 addArrangedSubview:v10];

    v11 = objc_opt_new();
    [v11 setDelegate:v6];
    objc_msgSend(v11, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v11];
    [(SearchUIDetailedView *)v6 setDetailsView:v11];
    v12 = [(SearchUIDetailedView *)v6 buttonAndDetailViewStackView];
    [v12 addArrangedSubview:v11];

    v13 = objc_opt_new();
    [(SearchUIDetailedView *)v6 setLeadingViewControllers:v13];

    v14 = objc_opt_new();
    [(SearchUIDetailedView *)v6 setAccessoryViewControllers:v14];

    [(SearchUIDetailedView *)v6 setIsVerticalAlignment:0];
  }

  return v6;
}

- (void)setIsVerticalAlignment:(BOOL)a3
{
  uint64_t v3 = a3;
  self->_isVerticalAlignment = a3;
  v5 = [(SearchUIDetailedView *)self innerContainer];
  v6 = v5;
  if (v3)
  {
    [v5 setAxis:1];

    [(NUIContainerStackView *)self setAxis:1];
    [(NUIContainerStackView *)self setAlignment:1];
    [(NUIContainerStackView *)self setBaselineRelativeArrangement:1];
    v7 = [(SearchUIDetailedView *)self detailsView];
    id v15 = [v7 viewForFirstBaselineLayout];

    char v8 = objc_opt_respondsToSelector();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4FAE100];
      uint64_t v3 = [v15 font];
      [v9 scaledValueForValue:v3 withFont:self view:22.0];
      double v11 = v10;
    }
    else
    {
      double v11 = *MEMORY[0x1E4FAE1C0];
    }
    v13 = [(SearchUIDetailedView *)self innerContainer];
    [v13 setSpacing:v11];

    if (v8) {
    v14 = [(SearchUIDetailedView *)self innerContainer];
    }
    [v14 setBaselineRelativeArrangement:1];
  }
  else
  {
    [v5 setFlipsToVerticalAxisForAccessibilityContentSizes:1];

    v12 = [(SearchUIDetailedView *)self innerContainer];
    [v12 setBaselineRelativeArrangement:0];

    [(NUIContainerStackView *)self setAxis:0];
    [(NUIContainerStackView *)self setAlignment:3];
    [(NUIContainerStackView *)self setBaselineRelativeArrangement:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIDetailedView;
  [(SearchUIDetailedView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SearchUIDetailedView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIDetailedView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SearchUIDetailedView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIDetailedView;
  [(SearchUIDetailedView *)&v3 didMoveToWindow];
  [(SearchUIDetailedView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedView;
  id v4 = a3;
  [(SearchUIDetailedView *)&v7 tlk_updateForAppearance:v4];
  v5 = [(SearchUIDetailedView *)self currentAccessoryViewController];
  objc_msgSend(v5, "tlk_updateForAppearance:", v4);

  v6 = [(SearchUIDetailedView *)self currentLeadingViewController];
  objc_msgSend(v6, "tlk_updateForAppearance:", v4);
}

- (void)setFeedbackDelegate:(id)a3
{
  p_feedbackDelegate = &self->_feedbackDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_feedbackDelegate, v5);
  v6 = [(SearchUIDetailedView *)self currentLeadingViewController];
  [v6 setFeedbackDelegate:v5];

  id v7 = [(SearchUIDetailedView *)self currentAccessoryViewController];
  [v7 setFeedbackDelegate:v5];
}

- (void)updateWithRowModel:(id)a3
{
  uint64_t v228 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SearchUIDetailedView *)self setRowModel:v5];
  v6 = [(SearchUIDetailedView *)self currentLeadingViewController];
  [v6 hide];

  id v7 = [(SearchUIDetailedView *)self currentAccessoryViewController];
  [v7 hide];

  uint64_t v8 = +[SearchUILeadingViewController leadingViewClassForRowModel:v5];
  if (!v8)
  {
    v13 = 0;
    goto LABEL_17;
  }
  objc_super v9 = v8;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  double v10 = [(SearchUIDetailedView *)self leadingViewControllers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v214 objects:v227 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = 0;
    uint64_t v14 = *(void *)v215;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v215 != v14) {
          objc_enumerationMutation(v10);
        }
        id v3 = *(id *)(*((void *)&v214 + 1) + 8 * i);
        if ((objc_class *)objc_opt_class() == v9)
        {
          id v3 = v3;

          v13 = v3;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v214 objects:v227 count:16];
    }
    while (v12);

    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v13 = objc_opt_new();
  objc_super v16 = [v13 view];
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v16];

  v17 = [(SearchUIDetailedView *)self innerContainer];
  v18 = [v13 view];
  [v17 insertArrangedSubview:v18 atIndex:0];

  v19 = [(SearchUIDetailedView *)self leadingViewControllers];
  [v19 addObject:v13];

LABEL_16:
  [v13 updateWithRowModel:v5];
  v20 = [v13 view];
  [v20 setHidden:0];

  v21 = [v13 view];
  [v21 setAlpha:1.0];

  v22 = [(SearchUIDetailedView *)self feedbackDelegate];
  [v13 setFeedbackDelegate:v22];

LABEL_17:
  [(SearchUIDetailedView *)self setCurrentLeadingViewController:v13];
  v23 = [(SearchUIDetailedView *)self detailsView];
  id v24 = [v5 title];
  int v193 = [MEMORY[0x1E4FAE198] isMacOS];
  v197 = self;
  if (([v5 isLocalApplicationResult] & 1) != 0
    || ([v5 identifyingResult],
        v25 = objc_claimAutoreleasedReturnValue(),
        [v25 contentType],
        v26 = objc_claimAutoreleasedReturnValue(),
        id v3 = (id)[v26 isEqualToString:@"com.apple.application-bundle"],
        v26,
        v25,
        v3))
  {
    v27 = [v5 applicationBundleIdentifier];
    BOOL v28 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:v27];

    if (v28)
    {
      v194 = v23;
      v29 = v24;
      v30 = objc_opt_new();
      v31 = +[SearchUIUtilities imageForBlockedApp];
      [v30 setGlyph:v31];

      v32 = [v5 title];
      v33 = [v32 text];
      v34 = v33;
      if (v193)
      {
        id v3 = [v33 stringByAppendingString:@"  "];

        v35 = [MEMORY[0x1E4F9A0E0] textWithString:v3];
        v226[0] = v35;
        v226[1] = v30;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v226 count:2];

        v37 = [v13 view];
        [v37 setAlpha:0.25];
      }
      else
      {
        id v3 = [@"  " stringByAppendingString:v33];

        v225[0] = v30;
        v37 = [MEMORY[0x1E4F9A0E0] textWithString:v3];
        v225[1] = v37;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v225 count:2];
      }

      v38 = objc_opt_new();
      [v38 setFormattedTextPieces:v36];
      [v38 setMaxLines:1];
      id v24 = v38;

      v23 = v194;
    }
  }
  v39 = [(SearchUIDetailedView *)self rowModel];
  uint64_t v40 = [v39 sectionType];

  if (v40 == 2) {
    [v24 setMaxLines:1];
  }
  id v195 = v24;
  v41 = +[SearchUIAccessoryViewController accessoryViewClassForRowModel:v5];
  char v188 = [(objc_class *)v41 isEqual:objc_opt_class()];
  char v186 = [(objc_class *)v41 isEqual:objc_opt_class()];
  if ([v5 buttonItemsAreTrailing])
  {
    id v42 = 0;
  }
  else
  {
    id v42 = [v5 buttonItems];
  }
  if ([v42 count])
  {
    v43 = [(SearchUIDetailedView *)self buttonItemStackView];

    if (!v43)
    {
      v44 = objc_opt_new();
      [(SearchUIDetailedView *)self setButtonItemStackView:v44];

      v45 = [(SearchUIDetailedView *)self buttonItemStackView];
      [v45 setIsCompact:1];

      v46 = [(SearchUIDetailedView *)self buttonItemStackView];
      [v46 setFlipsToVerticalAxisForAccessibilityContentSizes:1];

      v47 = [(SearchUIDetailedView *)self buttonAndDetailViewStackView];
      v48 = [(SearchUIDetailedView *)self buttonItemStackView];
      [v47 addArrangedSubview:v48];

      v49 = [(SearchUIDetailedView *)self buttonAndDetailViewStackView];
      v50 = [(SearchUIDetailedView *)self buttonItemStackView];
      [v49 setAlignment:1 forView:v50 inAxis:0];
    }
    v41 = 0;
  }
  v51 = [(SearchUIDetailedView *)self buttonItemStackView];
  v52 = [(SearchUIDetailedView *)self feedbackDelegate];
  v191 = v42;
  [v51 updateWithButtonItems:v42 maxButtonItems:3 buttonItemViewType:3 rowModel:v5 feedbackDelegate:v52];

  int v53 = TLKSnippetModernizationEnabled();
  v192 = v13;
  if (v53)
  {
    id v3 = [(SearchUIDetailedView *)self buttonItemStackView];
    BOOL v54 = v3 != 0;
    if (!v3
      || ([(SearchUIDetailedView *)self buttonItemStackView],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 isHidden]))
    {
      uint64_t v55 = 3;
    }
    else
    {
      BOOL v54 = 1;
      uint64_t v55 = 1;
    }
  }
  else
  {
    BOOL v54 = 0;
    uint64_t v55 = 1;
  }
  v56 = [(SearchUIDetailedView *)self innerContainer];
  [v56 setAlignment:v55];

  if (v54)
  {

    if (!v53)
    {
LABEL_42:
      if (v41) {
        goto LABEL_43;
      }
LABEL_56:
      v60 = 0;
      goto LABEL_79;
    }
  }
  else if (!v53)
  {
    goto LABEL_42;
  }

  if (!v41) {
    goto LABEL_56;
  }
LABEL_43:
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  v57 = [(SearchUIDetailedView *)self accessoryViewControllers];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v210 objects:v224 count:16];
  if (!v58)
  {

LABEL_58:
    v60 = objc_opt_new();
    v65 = [(SearchUIDetailedView *)self accessoryViewControllers];
    [v65 addObject:v60];

    v66 = [v60 view];
    +[SearchUIAutoLayout requireIntrinsicSizeForView:v66];

    goto LABEL_59;
  }
  uint64_t v59 = v58;
  v60 = 0;
  uint64_t v61 = *(void *)v211;
  do
  {
    for (uint64_t j = 0; j != v59; ++j)
    {
      if (*(void *)v211 != v61) {
        objc_enumerationMutation(v57);
      }
      v63 = *(void **)(*((void *)&v210 + 1) + 8 * j);
      if ((objc_class *)objc_opt_class() == v41)
      {
        id v64 = v63;

        v60 = v64;
      }
    }
    uint64_t v59 = [v57 countByEnumeratingWithState:&v210 objects:v224 count:16];
  }
  while (v59);

  if (!v60) {
    goto LABEL_58;
  }
LABEL_59:
  [v60 setDelegate:self];
  v67 = [(SearchUIDetailedView *)self feedbackDelegate];
  [v60 setFeedbackDelegate:v67];

  v68 = [v60 view];
  [v68 setHidden:0];

  [v60 updateWithRowModel:v5];
  v69 = [(SearchUIDetailedView *)self rowModel];
  v70 = [v69 secondaryTitle];
  if (v70)
  {
    v71 = [(SearchUIDetailedView *)self rowModel];
    int v72 = [v71 secondaryTitleIsDetached];
  }
  else
  {
    int v72 = 0;
  }

  v73 = [v60 view];
  v74 = [(SearchUIDetailedView *)self innerContainer];
  if ([v74 axis] != 1)
  {

    goto LABEL_67;
  }
  BOOL v75 = [(SearchUIDetailedView *)self isVerticalAlignment];

  if (v75)
  {
LABEL_67:
    BOOL v82 = [(SearchUIDetailedView *)self isVerticalAlignment];
    uint64_t v77 = objc_opt_class();
    uint64_t v83 = [(SearchUIDetailedView *)self innerContainer];
    v79 = (SearchUIDetailedView *)v83;
    if (v82)
    {
      uint64_t v221 = v83;
      v80 = (void *)MEMORY[0x1E4F1C978];
      v81 = &v221;
      goto LABEL_69;
    }
    v220 = self;
    v88 = (void *)MEMORY[0x1E4F1C978];
    v89 = &v220;
LABEL_72:
    v84 = [v88 arrayWithObjects:v89 count:1];
    v85 = (void *)v77;
    v86 = v73;
    v87 = v79;
    goto LABEL_73;
  }
  int v76 = [v60 shouldTopAlignForAccessibilityContentSizes];
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = [(SearchUIDetailedView *)self innerContainer];
  v79 = (SearchUIDetailedView *)v78;
  if (!v76)
  {
    v222 = self;
    v88 = (void *)MEMORY[0x1E4F1C978];
    v89 = &v222;
    goto LABEL_72;
  }
  uint64_t v223 = v78;
  v80 = (void *)MEMORY[0x1E4F1C978];
  v81 = &v223;
LABEL_69:
  v84 = [v80 arrayWithObjects:v81 count:1];
  v85 = (void *)v77;
  v86 = v73;
  v87 = self;
LABEL_73:
  [v85 addViewIfNecessary:v86 toStackView:v87 removeFromStackViews:v84];

  if (v72) {
    v90 = v73;
  }
  else {
    v90 = 0;
  }
  [v23 setAccessoryView:v90];
  if (v72)
  {
    v91 = objc_opt_class();
    v219[0] = self;
    v92 = [(SearchUIDetailedView *)self innerContainer];
    v219[1] = v92;
    v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:2];
    [v91 addViewIfNecessary:v73 toStackView:0 removeFromStackViews:v93];
  }
LABEL_79:
  [(SearchUIDetailedView *)self setCurrentAccessoryViewController:v60];
  v94 = [(SearchUIDetailedView *)self currentLeadingViewController];
  int v95 = [v94 shouldCenterAlignToTitle];

  unint64_t v96 = 0x1E4FAE000;
  v97 = v195;
  if ([(SearchUIDetailedView *)self isVerticalAlignment]) {
    goto LABEL_113;
  }
  int v98 = [v5 isHorizontalInLayout];
  if (v98) {
    int v99 = 8;
  }
  else {
    int v99 = 14;
  }
  if ((v98 & 1) == 0 && ((v193 ^ 1) & 1) == 0)
  {
    if (TLKSnippetModernizationEnabled()) {
      int v99 = 12;
    }
    else {
      int v99 = 10;
    }
  }
  double v100 = 8.0;
  int v101 = TLKBiggerSuggestionsLayoutEnabled();
  if ((v95 & 1) == 0)
  {
    if (v101) {
      double v102 = 14.0;
    }
    else {
      double v102 = 10.0;
    }
    int v103 = [v5 useCompactVersionOfUI];
    double v104 = 8.0;
    if (!v193) {
      double v104 = v102;
    }
    if (v103) {
      double v100 = v104;
    }
    else {
      double v100 = (double)v99;
    }
  }
  self = v197;
  v105 = [(SearchUIDetailedView *)v197 innerContainer];
  [v105 setSpacing:v100];

  if (([v5 useCompactVersionOfUI] & 1) != 0 || !TLKSnippetModernizationEnabled())
  {
    double v106 = *MEMORY[0x1E4F4BEC8];
  }
  else if (v193)
  {
    double v106 = 12.0;
  }
  else
  {
    double v106 = 14.0;
  }
  int v107 = v95;
  v108 = [(SearchUIDetailedView *)v197 innerContainer];
  uint64_t v109 = [v108 axis];

  double v110 = 8.0;
  if (v109 != 1) {
    goto LABEL_112;
  }
  v111 = [v23 viewForFirstBaselineLayout];
  double v106 = 8.0;
  if (objc_opt_respondsToSelector())
  {
    v112 = [v23 viewForFirstBaselineLayout];
    id v113 = [v112 font];

    if (!v113)
    {
      v97 = v195;
      unint64_t v96 = 0x1E4FAE000;
      goto LABEL_108;
    }
    unint64_t v96 = 0x1E4FAE000uLL;
    [MEMORY[0x1E4FAE100] scaledValueForValue:v113 withFont:v197 view:8.0];
    double v106 = v114;
    v111 = v113;
    v97 = v195;
  }

LABEL_108:
  v115 = [v23 viewForLastBaselineLayout];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_111:

    goto LABEL_112;
  }
  v116 = [v23 viewForLastBaselineLayout];
  id v117 = [v116 font];

  if (v117)
  {
    [*(id *)(v96 + 256) scaledValueForValue:v117 withFont:v197 view:8.0];
    double v110 = v118;
    v115 = v117;
    goto LABEL_111;
  }
LABEL_112:
  v119 = [(SearchUIDetailedView *)v197 innerContainer];
  v120 = [(SearchUIDetailedView *)v197 currentLeadingViewController];
  v121 = [v120 view];
  [v119 setCustomSpacing:v121 afterView:v106];

  v122 = [(SearchUIDetailedView *)v197 innerContainer];
  v123 = [(SearchUIDetailedView *)v197 buttonAndDetailViewStackView];
  [v122 setCustomSpacing:v123 afterView:v110];

  int v95 = v107;
LABEL_113:
  int v124 = [*(id *)(v96 + 256) isSuperLargeAccessibilitySize];
  v202[0] = MEMORY[0x1E4F143A8];
  v202[1] = 3221225472;
  v202[2] = __43__SearchUIDetailedView_updateWithRowModel___block_invoke;
  v202[3] = &unk_1E6E74860;
  id v125 = v23;
  id v203 = v125;
  v204 = self;
  id v185 = v5;
  id v205 = v185;
  id v184 = v97;
  id v206 = v184;
  int v196 = v124;
  char v207 = v124;
  char v208 = v188;
  char v209 = v186;
  [v125 performBatchUpdates:v202];
  v126 = [(SearchUIDetailedView *)self detailsView];
  v127 = [v126 viewForFirstBaselineLayout];

  v128 = [(SearchUIDetailedView *)self rowModel];
  LOBYTE(v124) = [v128 useCompactVersionOfUI];

  double v129 = 0.0;
  double v130 = 0.0;
  double v131 = 0.0;
  if ((v124 & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      id v132 = [v127 font];
    }
    else
    {
      id v132 = 0;
    }
    v133 = *(void **)(v96 + 256);
    [v132 ascender];
    double v135 = v134;
    [v132 capHeight];
    [v133 deviceScaledRoundedValue:self forView:v135 - v136];
    double v130 = v137;
    v138 = *(void **)(v96 + 256);
    [v125 viewForLastBaselineLayout];
    v140 = unint64_t v139 = v96;
    [v140 effectiveBaselineOffsetFromContentBottom];
    objc_msgSend(v138, "deviceScaledRoundedValue:forView:", self);
    double v131 = v141;

    unint64_t v96 = v139;
  }
  v142 = [(SearchUIDetailedView *)self rowModel];
  int v143 = [v142 isHorizontalInLayout];

  v144 = (double *)MEMORY[0x1E4FB2848];
  double v145 = v130;
  double v146 = 0.0;
  if (v143)
  {
    double v145 = *MEMORY[0x1E4FB2848];
    double v129 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v131 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v146 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  objc_msgSend(v125, "setCustomAlignmentRectInsets:", v145, v129, v131, v146);
  double v189 = v129;
  if (TLKBiggerSuggestionsLayoutEnabled())
  {
    v147 = [(SearchUIDetailedView *)self rowModel];
    if ([v147 useCompactVersionOfUI])
    {
      double v148 = -3.0;
      double v149 = -4.0;
      double v150 = 0.0;
      double v151 = 0.0;
    }
    else
    {
      double v148 = *v144;
      double v151 = v144[1];
      double v149 = v144[2];
      double v150 = v144[3];
    }
  }
  else
  {
    double v148 = *v144;
    double v151 = v144[1];
    double v149 = v144[2];
    double v150 = v144[3];
  }
  if (((v143 | v95 ^ 1) & 1) == 0)
  {
    [v127 intrinsicContentSize];
    double v153 = v152;
    v154 = [(SearchUIDetailedView *)self currentLeadingViewController];
    v155 = [v154 view];
    [v155 intrinsicContentSize];
    double v148 = v130 + (v153 - v156) * -0.5;

    double v150 = 0.0;
    double v149 = 0.0;
    double v151 = 0.0;
  }
  objc_msgSend(*(id *)(v96 + 256), "deviceScaledRoundedInsets:forView:", self, v148, v151, v149, v150);
  double v158 = v157;
  double v160 = v159;
  double v162 = v161;
  double v164 = v163;
  v165 = [(SearchUIDetailedView *)self currentLeadingViewController];
  v166 = [v165 view];
  objc_msgSend(v166, "setCustomAlignmentRectInsets:", v158, v160, v162, v164);

  v167 = [v125 accessoryView];

  if (!v167)
  {
    v168 = [(SearchUIDetailedView *)self currentAccessoryViewController];
    if ([v168 type] == 1)
    {
      double v169 = v189;
    }
    else
    {
      double v145 = *v144;
      double v169 = v144[1];
      double v131 = v144[2];
      double v146 = v144[3];
    }
    v170 = [(SearchUIDetailedView *)self currentAccessoryViewController];
    v171 = [v170 view];
    objc_msgSend(v171, "setCustomAlignmentRectInsets:", v145, v169, v131, v146);
  }
  v187 = v127;
  v190 = v125;
  v172 = [(SearchUIDetailedView *)self innerContainer];
  BOOL v173 = [v172 axis] == 0;

  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  v174 = [(SearchUIDetailedView *)self innerContainer];
  v175 = [v174 arrangedSubviews];

  uint64_t v176 = [v175 countByEnumeratingWithState:&v198 objects:v218 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v199;
    if (v95) {
      uint64_t v179 = 2;
    }
    else {
      uint64_t v179 = -1;
    }
    do
    {
      for (uint64_t k = 0; k != v177; ++k)
      {
        if (*(void *)v199 != v178) {
          objc_enumerationMutation(v175);
        }
        uint64_t v181 = *(void *)(*((void *)&v198 + 1) + 8 * k);
        v182 = [(SearchUIDetailedView *)v197 innerContainer];
        if (![(SearchUIDetailedView *)v197 arrangedViewMustCenter:v181] | v196) {
          uint64_t v183 = v179;
        }
        else {
          uint64_t v183 = 3;
        }
        [v182 setAlignment:v183 forView:v181 inAxis:v173];
      }
      uint64_t v177 = [v175 countByEnumeratingWithState:&v198 objects:v218 count:16];
    }
    while (v177);
  }

  [(SearchUIDetailedView *)v197 updateLayoutMargins];
  [(SearchUIDetailedView *)v197 tlk_updateWithCurrentAppearance];
}

void __43__SearchUIDetailedView_updateWithRowModel___block_invoke(uint64_t a1)
{
  v64[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() bannerBadgeForRowModel:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setBannerBadge:v2];

  id v3 = [*(id *)(a1 + 48) topText];
  id v4 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v3];
  [*(id *)(a1 + 32) setTopText:v4];

  id v5 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setTitle:v5];

  char v6 = *(unsigned char *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) title];
  objc_msgSend(v7, "setMaxLines:", objc_msgSend(v7, "maxLines") << v6);

  objc_msgSend(*(id *)(a1 + 32), "setTruncateTitleMiddle:", objc_msgSend(*(id *)(a1 + 48), "truncateTitleMiddle"));
  uint64_t v8 = [*(id *)(a1 + 48) secondaryTitle];
  uint64_t v9 = +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:v8];

  double v10 = objc_opt_new();
  v48 = (void *)v9;
  v64[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  [v10 setFormattedTextItems:v11];

  v47 = v10;
  [*(id *)(a1 + 32) setSecondaryTitle:v10];
  uint64_t v12 = [*(id *)(a1 + 48) secondaryTitleImage];
  v13 = +[SearchUIImage imageWithSFImage:v12 variantForAppIcon:0];
  uint64_t v14 = +[SearchUITLKImageConverter imageForSFImage:v13];
  [*(id *)(a1 + 32) setSecondaryTitleImage:v14];

  id v15 = [*(id *)(a1 + 32) secondaryTitleImage];
  [v15 setIsTemplate:1];

  objc_msgSend(*(id *)(a1 + 32), "setSecondaryTitleIsDetached:", objc_msgSend(*(id *)(a1 + 48), "secondaryTitleIsDetached"));
  objc_super v16 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v17 = [*(id *)(a1 + 48) details];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v23 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v22 withCompletionHandler:0];
        id v24 = v23;
        if (v23
          && (([v23 hasContent] & 1) != 0
           || +[SearchUITLKMultilineTextConverter richTextOverridesAsyncLoader:v22]))
        {
          objc_msgSend(v24, "setMaxLines:", objc_msgSend(v24, "maxLines") << v6);
          [v16 addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v19);
  }

  [*(id *)(a1 + 32) setDetails:v16];
  v25 = [*(id *)(a1 + 48) footnote];
  v26 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v25];
  [*(id *)(a1 + 32) setFootnote:v26];

  v27 = [*(id *)(a1 + 48) footnoteButtonText];
  [*(id *)(a1 + 32) setFootnoteButtonText:v27];

  objc_msgSend(*(id *)(a1 + 32), "setUseCompactMode:", objc_msgSend(*(id *)(a1 + 48), "useCompactVersionOfUI"));
  if (*(unsigned char *)(a1 + 65)) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = *(unsigned char *)(a1 + 66) != 0;
  }
  [*(id *)(a1 + 32) setIsAccessoryViewBottomAligned:v28];
  if ([*(id *)(a1 + 48) buttonItemsAreTrailing])
  {
    v29 = [*(id *)(a1 + 48) buttonItems];
  }
  else
  {
    v29 = 0;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
  id v32 = v30;
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v54;
LABEL_20:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v54 != v34) {
        objc_enumerationMutation(v30);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * v35), "_searchUIButtonItemGeneratorClass"), "mayRequireAsyncGenerationForButtonItem:", *(void *)(*((void *)&v53 + 1) + 8 * v35)))break; {
      if (v33 == ++v35)
      }
      {
        uint64_t v33 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v33) {
          goto LABEL_20;
        }
        id v32 = v30;
        goto LABEL_43;
      }
    }

    if (*(unsigned char *)(a1 + 64) || ![*(id *)(a1 + 40) hasSecondLine]) {
      goto LABEL_44;
    }
    v36 = objc_opt_new();
    v37 = [*(id *)(a1 + 32) title];

    if (v37)
    {
      v38 = [*(id *)(a1 + 32) title];
      [v36 addObject:v38];
    }
    v39 = [*(id *)(a1 + 32) details];

    if (v39)
    {
      uint64_t v40 = [*(id *)(a1 + 32) details];
      [v36 addObjectsFromArray:v40];
    }
    v41 = [*(id *)(a1 + 32) footnote];

    if (v41)
    {
      id v42 = [*(id *)(a1 + 32) footnote];
      [v36 addObject:v42];
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v32 = v36;
    uint64_t v43 = [v32 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * j) setMaxLines:1];
        }
        uint64_t v44 = [v32 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v44);
    }
  }
LABEL_43:

LABEL_44:
}

- (BOOL)hasSecondLine
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(SearchUIDetailedView *)self detailsView];
  id v4 = [v3 details];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) hasContent])
        {
          char v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v9 = 0;
LABEL_11:

  double v10 = [(SearchUIDetailedView *)self detailsView];
  uint64_t v11 = [v10 footnote];
  char v12 = [v11 hasContent];

  return v9 | v12;
}

- (void)updateLayoutMargins
{
  id v3 = [(SearchUIDetailedView *)self rowModel];
  int v4 = [v3 useCompactVersionOfUI];

  if (v4)
  {
    if ([MEMORY[0x1E4FAE198] isMacOS])
    {
      double v5 = 14.0;
      double v6 = 5.0;
      if (TLKSnippetModernizationEnabled())
      {
        +[SearchUIUtilities standardTableCellContentInset];
        double v5 = v7;
        double v8 = 5.0;
        double v9 = v7;
      }
      else
      {
        double v8 = 5.0;
        double v9 = 14.0;
      }
    }
    else
    {
      BOOL v20 = [(SearchUIDetailedView *)self hasSecondLine];
      int v21 = TLKBiggerSuggestionsLayoutEnabled();
      double v22 = 11.8;
      if (v20) {
        double v22 = 8.3;
      }
      double v23 = 8.67;
      if (v20) {
        double v23 = 6.84;
      }
      if (v21) {
        double v24 = v22;
      }
      else {
        double v24 = v23;
      }
      v25 = [(SearchUIDetailedView *)self currentAccessoryViewController];
      [(SearchUIDetailedView *)self trailingMarginForAccessoryViewController:v25];
      double v9 = v26;

      double v5 = v9;
      if ([MEMORY[0x1E4FAE100] isLTR])
      {
        +[SearchUIUtilities standardCompactHorizontalMargin];
        double v5 = v27;
      }
      if (([MEMORY[0x1E4FAE100] isLTR] & 1) == 0)
      {
        +[SearchUIUtilities standardCompactHorizontalMargin];
        double v9 = v28;
      }
      int v29 = TLKBiggerSuggestionsLayoutEnabled();
      double v30 = 0.3;
      if (!v29) {
        double v30 = 0.0;
      }
      double v6 = v24 - v30;
      int v31 = TLKBiggerSuggestionsLayoutEnabled();
      double v32 = 0.5;
      if (v31) {
        double v32 = 0.0;
      }
      double v8 = v24 - v32;
    }
    objc_msgSend(MEMORY[0x1E4FAE100], "deviceScaledRoundedInsets:forView:", self, v6, v5, v8, v9);
    double v11 = v33;
    double v13 = v34;
    double v15 = v35;
    double v17 = v36;
  }
  else
  {
    [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [(SearchUIDetailedView *)self rowModel];
    uint64_t v19 = [v18 sectionType];

    if (v19 == 2)
    {
      double v13 = 0.0;
      double v11 = 10.0;
      double v15 = 10.0;
      double v17 = 0.0;
    }
    else if ([MEMORY[0x1E4FAE198] isMacOS] {
           && TLKSnippetModernizationEnabled())
    }
    {
      double v11 = 12.0;
      double v15 = 12.0;
    }
  }
  -[SearchUIDetailedView setLayoutMargins:](self, "setLayoutMargins:", v11, v13, v15, v17);
}

- (double)trailingMarginForAccessoryViewController:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([v4 containsSymbolImage])
  {
    double v6 = [v4 view];
    [v6 intrinsicContentSize];
    double v8 = v7;

    +[SearchUIUtilities imageAccessoryAdditionalCompactHorizontalMargin];
    double v5 = v9 + v8 * -0.5;
  }
  double v10 = [(SearchUIDetailedView *)self rowModel];
  if (![v10 useCompactVersionOfUI])
  {

    goto LABEL_7;
  }
  char v11 = [MEMORY[0x1E4FAE198] isMacOS];

  if (v11)
  {
LABEL_7:
    [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
    double v13 = v14;
    goto LABEL_8;
  }
  +[SearchUIUtilities standardCompactHorizontalMargin];
  double v13 = v5 + v12;
LABEL_8:

  return v13;
}

+ (id)bannerBadgeForRowModel:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 nearbyBusinessesString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    double v6 = objc_opt_new();
    double v7 = [SearchUISymbolImage alloc];
    double v8 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28E0] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
    double v9 = [(SearchUISymbolImage *)v7 initWithSymbolName:@"location.fill" font:v8 scale:1];
    [v6 setGlyph:v9];

    double v10 = objc_opt_new();
    v20[0] = v6;
    char v11 = (void *)MEMORY[0x1E4F9A0E0];
    double v12 = NSString;
    double v13 = [v3 nearbyBusinessesString];
    double v14 = [v13 localizedUppercaseString];
    double v15 = [v12 stringWithFormat:@" %@", v14];
    double v16 = [v11 textWithString:v15];
    v20[1] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v10 setFormattedTextPieces:v17];

    uint64_t v18 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v10];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)arrangedViewMustCenter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUIDetailedView *)self currentLeadingViewController];
  id v6 = [v5 view];

  if (v6 == v4)
  {
    char v11 = [(SearchUIDetailedView *)self currentLeadingViewController];
LABEL_10:
    double v12 = v11;
    char v10 = [v11 shouldVerticallyCenter];
LABEL_15:

    goto LABEL_16;
  }
  id v7 = [(SearchUIDetailedView *)self buttonAndDetailViewStackView];

  if (v7 == v4)
  {
    double v12 = [(SearchUIDetailedView *)self detailsView];
    double v13 = [v12 secondaryTitle];
    if (v13)
    {
      double v14 = [(SearchUIDetailedView *)self detailsView];
      if ([v14 secondaryTitleIsDetached]) {
        char v10 = TLKSnippetModernizationEnabled();
      }
      else {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_15;
  }
  double v8 = [(SearchUIDetailedView *)self currentAccessoryViewController];
  id v9 = [v8 view];

  if (v9 == v4)
  {
    char v11 = [(SearchUIDetailedView *)self currentAccessoryViewController];
    goto LABEL_10;
  }
  char v10 = 1;
LABEL_16:

  return v10;
}

+ (void)addViewIfNecessary:(id)a3 toStackView:(id)a4 removeFromStackViews:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v15 = [v14 arrangedSubviews];
        int v16 = [v15 containsObject:v7];

        if (v16) {
          [v14 removeArrangedSubview:v7];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  double v17 = [v8 arrangedSubviews];
  char v18 = [v17 containsObject:v7];

  if ((v18 & 1) == 0) {
    [v8 addArrangedSubview:v7];
  }
}

- (void)footnoteButtonPressed
{
  id v2 = [(SearchUIDetailedView *)self buttonDelegate];
  [v2 footnoteButtonPressed];
}

- (BOOL)configureMenuForFootnoteButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUIDetailedView *)self buttonDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SearchUIDetailedView *)self buttonDelegate];
    char v8 = [v7 configureMenuForFootnoteButton:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = [(SearchUIDetailedView *)self detailsView];

  if (v11 == v10)
  {
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:0.5];
    double y = y + v12;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  id v6 = a3;
  id v7 = [(SearchUIDetailedView *)self innerContainer];

  if (v7 == v6)
  {
    BOOL v8 = [(SearchUIDetailedView *)self isCompactWidth];
    id v9 = [(SearchUIDetailedView *)self currentLeadingViewController];
    [v9 setUsesCompactWidth:v8];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIDetailedView;
  BOOL v8 = -[SearchUIDetailedView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  if ([v8 isDescendantOfView:self]
    && ([(SearchUIDetailedView *)self currentLeadingViewController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 type],
        v9,
        v10 == 2))
  {
    id v11 = [(SearchUIDetailedView *)self currentLeadingViewController];
    double v12 = [v11 view];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SearchUIDetailedView;
    double v12 = -[SearchUIDetailedView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
  }

  return v12;
}

- (UIView)leadingView
{
  id v2 = [(SearchUIDetailedView *)self innerContainer];
  id v3 = [v2 visibleArrangedSubviews];
  id v4 = [v3 firstObject];

  return (UIView *)v4;
}

- (BOOL)isVerticalAlignment
{
  return self->_isVerticalAlignment;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (SearchUIDetailedViewDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);
  return (SearchUIDetailedViewDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (SearchUIAccessoryViewController)currentAccessoryViewController
{
  return self->_currentAccessoryViewController;
}

- (void)setCurrentAccessoryViewController:(id)a3
{
}

- (SearchUILeadingViewController)currentLeadingViewController
{
  return self->_currentLeadingViewController;
}

- (void)setCurrentLeadingViewController:(id)a3
{
}

- (BOOL)isCompactWidth
{
  return self->_isCompactWidth;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  self->_isCompactWidth = a3;
}

- (SearchUIDetailedRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (TLKStackView)innerContainer
{
  return self->_innerContainer;
}

- (void)setInnerContainer:(id)a3
{
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
}

- (TLKStackView)buttonAndDetailViewStackView
{
  return self->_buttonAndDetailViewStackView;
}

- (void)setButtonAndDetailViewStackView:(id)a3
{
}

- (NSMutableArray)leadingViewControllers
{
  return self->_leadingViewControllers;
}

- (void)setLeadingViewControllers:(id)a3
{
}

- (TLKDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
}

- (NSMutableArray)accessoryViewControllers
{
  return self->_accessoryViewControllers;
}

- (void)setAccessoryViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewControllers, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_leadingViewControllers, 0);
  objc_storeStrong((id *)&self->_buttonAndDetailViewStackView, 0);
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_innerContainer, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_currentLeadingViewController, 0);
  objc_storeStrong((id *)&self->_currentAccessoryViewController, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

@end