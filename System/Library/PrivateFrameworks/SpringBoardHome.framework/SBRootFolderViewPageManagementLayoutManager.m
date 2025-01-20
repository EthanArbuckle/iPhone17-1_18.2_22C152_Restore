@interface SBRootFolderViewPageManagementLayoutManager
- (BOOL)_allowsCloseBoxForIconView:(id)a3;
- (BOOL)_canRasterizeIconView:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)allowsPageHiding;
- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4;
- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5;
- (BOOL)iconShouldAllowCloseBoxTap:(id)a3;
- (BOOL)iconViewCanBecomeFocused:(id)a3;
- (BOOL)isEditing;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isTrackingActiveOrDroppingIconDrags;
- (BOOL)pageContainsBookmarkIcons:(id)a3;
- (BOOL)pageManagementCellViewControllerCanReceiveTap:(id)a3;
- (BOOL)pageManagementCellViewControllerShouldSuppressHighlight:(id)a3;
- (BSInvalidatable)pageDotsVisibilityAssertion;
- (BSInvalidatable)scrollAccessoryBorrowedAssertion;
- (NSURL)completionURL;
- (SBDockOffscreenFractionModifying)dockOffscreenAssertion;
- (SBHFocusMode)activeFocusMode;
- (SBHPageManagementIcon)draggingIcon;
- (SBIconDragManager)iconDragManager;
- (SBIconListModel)pageManagementListModel;
- (SBIconListView)rootListView;
- (SBRootFolderView)rootFolderView;
- (SBRootFolderViewPageManagementLayoutManager)init;
- (SBTitledHomeScreenButton)focusModeOptionsButton;
- (UIImageView)focusModeSymbolView;
- (UIScrollView)pageManagementScrollView;
- (UITapGestureRecognizer)backgroundTapGestureRecognizer;
- (UIViewController)alertPresentationViewController;
- (UIViewImplicitlyAnimating)latestActiveTransitionAnimator;
- (id)backgroundViewForSnapshotForPageManagementCellViewController:(id)a3;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4;
- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4;
- (id)iconListViewForIndexPath:(id)a3;
- (id)iconViewQueryableForIconDragManager:(id)a3;
- (id)newCellBackgroundMaterialViewInFolderView:(id)a3 initialWeighting:(double)a4;
- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3;
- (id)userInfo;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (int64_t)layoutAction;
- (int64_t)layoutConfiguration;
- (unint64_t)activeTransitionCount;
- (unint64_t)folderListIndexToAnimateOutForList:(id)a3 inFolder:(id)a4 avoidingList:(id)a5;
- (unint64_t)transitionCount;
- (void)_removePageIcon:(id)a3;
- (void)_updateCloseBoxVisibilityWithAnimation:(int64_t)a3;
- (void)backgroundTapped:(id)a3;
- (void)cleanUpViewsInFolderView:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dominoPivotAnimator:(id)a3 didLayOutIconView:(id)a4;
- (void)focusModeOptionsButtonTapped:(id)a3;
- (void)folder:(id)a3 listHiddenDidChange:(id)a4;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6;
- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)layoutFooterViewsInFolderView:(id)a3;
- (void)layoutHeaderViewsInFolderView:(id)a3;
- (void)layoutScrollViewAndRootListViewInFolderView:(id)a3;
- (void)makeMaterialViewsVisible;
- (void)makeRootListViewInFolderView:(id)a3 animated:(BOOL)a4;
- (void)pageManagementCellViewControllerDidReceiveTap:(id)a3;
- (void)presentPageDeleteConfirmationAlertForIconView:(id)a3 completion:(id)a4;
- (void)presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView:(id)a3 completion:(id)a4;
- (void)rasterizeIconViewsForImprovedLegibilityInScaledDownListViews;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActiveFocusMode:(id)a3;
- (void)setActiveTransitionCount:(unint64_t)a3;
- (void)setAlertPresentationViewController:(id)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsPageHiding:(BOOL)a3;
- (void)setBackgroundTapGestureRecognizer:(id)a3;
- (void)setCompletionURL:(id)a3;
- (void)setDockOffscreenAssertion:(id)a3;
- (void)setDraggingIcon:(id)a3;
- (void)setFocusModeOptionsButton:(id)a3;
- (void)setFocusModeSymbolView:(id)a3;
- (void)setLatestActiveTransitionAnimator:(id)a3;
- (void)setLayoutAction:(int64_t)a3;
- (void)setLayoutConfiguration:(int64_t)a3;
- (void)setPageDotsVisibilityAssertion:(id)a3;
- (void)setPageManagementListModel:(id)a3;
- (void)setPageManagementScrollView:(id)a3;
- (void)setRootFolderView:(id)a3;
- (void)setRootListView:(id)a3;
- (void)setScrollAccessoryBorrowedAssertion:(id)a3;
- (void)setTransitionCount:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5;
- (void)turnOffIconViewRazterizationForNormalSizeListViews;
@end

@implementation SBRootFolderViewPageManagementLayoutManager

- (SBRootFolderViewPageManagementLayoutManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderViewPageManagementLayoutManager;
  result = [(SBRootFolderViewPageManagementLayoutManager *)&v3 init];
  if (result) {
    result->_allowsPageHiding = 1;
  }
  return result;
}

- (void)setActiveFocusMode:(id)a3
{
  v5 = (SBHFocusMode *)a3;
  if (self->_activeFocusMode != v5)
  {
    objc_storeStrong((id *)&self->_activeFocusMode, a3);
    [(SBRootFolderViewPageManagementLayoutManager *)self setAllowsPageHiding:[(SBHFocusMode *)v5 customizedHomeScreenPagesEnabled] ^ 1];
  }
}

- (void)layoutScrollViewAndRootListViewInFolderView:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v16 = [(SBRootFolderViewPageManagementLayoutManager *)self pageManagementScrollView];
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);
  v12 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  if ([(SBRootFolderViewPageManagementLayoutManager *)self layoutConfiguration] == 5)
  {
    [v12 intrinsicContentSize];
    double Height = v13;
  }
  else
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    double Height = CGRectGetHeight(v18);
  }
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double Width = CGRectGetWidth(v19);
  objc_msgSend(v16, "setContentSize:", Width, Height);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, Height);
}

- (void)layoutHeaderViewsInFolderView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [v4 traitCollection];
  [v13 displayScale];
  uint64_t v30 = v14;

  [v4 safeAreaInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  CGFloat v23 = v6 + v18;
  CGFloat v24 = v8 + v16;
  CGFloat v25 = v10 - (v18 + v22);
  CGFloat v26 = v12 - (v16 + v20);
  v27 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  [v27 rectForIconAtIndex:0];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  double MinY = CGRectGetMinY(v33);
  v34.origin.x = v23;
  v34.origin.y = v24;
  v34.size.width = v25;
  v34.size.height = v26;
  CGFloat v29 = MinY - CGRectGetMinY(v34);
  v35.origin.x = v23;
  v35.origin.y = v24;
  v35.size.width = v25;
  v35.size.height = v26;
  CGRectDivide(v35, &slice, &remainder, v29, CGRectMinYEdge);
  -[UIImageView sizeThatFits:](self->_focusModeSymbolView, "sizeThatFits:", v10, v12);
  UIRectCenteredIntegralRectScale();
  [(UIImageView *)self->_focusModeSymbolView setFrame:v30];
}

- (void)layoutFooterViewsInFolderView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v4 traitCollection];
  [v9 displayScale];
  uint64_t v35 = v10;

  id v36 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  double v11 = [v36 icons];
  objc_msgSend(v36, "rectForIconAtIndex:", objc_msgSend(v11, "count") - 1);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  [v4 maxDockHeight];
  double v21 = v20;

  double v22 = v21 * 0.25;
  -[SBTitledHomeScreenButton sizeThatFits:](self->_focusModeOptionsButton, "sizeThatFits:", v6, v8);
  UIRectCenteredXInRectScale();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v38.origin.x = v13;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  CGFloat v29 = v22 + CGRectGetMaxY(v38);
  uint64_t v30 = [(SBRootFolderViewPageManagementLayoutManager *)self pageManagementScrollView];
  [v30 contentSize];
  double v32 = v31;
  v39.origin.x = v24;
  v39.origin.y = v29;
  v39.size.width = v26;
  v39.size.height = v28;
  objc_msgSend(v30, "setContentSize:", v32, v22 + CGRectGetMaxY(v39));
  -[SBTitledHomeScreenButton setBounds:](self->_focusModeOptionsButton, "setBounds:", v24, v29, v26, v28);
  focusModeOptionsButton = self->_focusModeOptionsButton;
  v40.origin.x = v24;
  v40.origin.y = v29;
  v40.size.width = v26;
  v40.size.height = v28;
  double MidX = CGRectGetMidX(v40);
  v41.origin.x = v24;
  v41.origin.y = v29;
  v41.size.width = v26;
  v41.size.height = v28;
  -[SBTitledHomeScreenButton setCenter:](focusModeOptionsButton, "setCenter:", MidX, CGRectGetMidY(v41));
  [(SBTitledHomeScreenButton *)self->_focusModeOptionsButton setNeedsLayout];
  [(SBTitledHomeScreenButton *)self->_focusModeOptionsButton layoutIfNeeded];
}

- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5
{
  BOOL v145 = a3;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  double v9 = [v7 folder];
  v149 = [v7 scrollView];
  v135 = [v7 widgetButton];
  uint64_t v10 = [v7 scrollAccessoryView];
  double v11 = [v7 rootFolderVisualConfiguration];
  v142 = [(SBRootFolderViewPageManagementLayoutManager *)self focusModeSymbolView];
  v140 = [(SBRootFolderViewPageManagementLayoutManager *)self focusModeOptionsButton];
  double v12 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  v146 = [(SBRootFolderViewPageManagementLayoutManager *)self pageManagementScrollView];
  uint64_t v13 = [(SBRootFolderViewPageManagementLayoutManager *)self backgroundTapGestureRecognizer];
  [v11 pageManagementPageCheckboxVerticalMargin];
  double v15 = v14;
  v138 = v11;
  [v11 pageManagementPageCheckboxDiameter];
  double v17 = v16;
  unint64_t v133 = [(SBRootFolderViewPageManagementLayoutManager *)self activeTransitionCount];
  memset(__src, 0, sizeof(__src));
  [v7 getMetrics:__src];
  v153 = v7;
  uint64_t v18 = objc_msgSend(v7, "iconListModelIndexForPageIndex:", objc_msgSend(v7, "currentPageIndex"));
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = [v7 firstIconPageIndex];
    [v7 setCurrentPageIndex:v19 animated:0];
    uint64_t v18 = [v7 iconListModelIndexForPageIndex:v19];
  }
  if ([v9 isTrailingEmptyListIndex:v18])
  {
    do
    {
      uint64_t v20 = [v9 precedingVisibleListIndexBeforeIndex:v18];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v21 = v20;
      objc_msgSend(v153, "setCurrentPageIndex:animated:", objc_msgSend(v153, "pageIndexForIconListModelIndex:", v20), 0);
      uint64_t v18 = v21;
    }
    while (([v9 isTrailingEmptyListIndex:v21] & 1) != 0);
  }
  double v151 = v15 + v17;
  uint64_t v22 = [v9 listAtIndex:v18];
  double v23 = (void *)v22;
  v139 = v10;
  if (v145)
  {
    v131 = (void *)v22;
    v129 = [v153 currentIconListView];
    [v153 setIncludesHiddenIconListPages:1];
    [v153 setAutomaticallyCreatesIconListViews:0];
    if (!self->_iconViewControllersByIcon)
    {
      double v24 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      iconViewControllersByIcon = self->_iconViewControllersByIcon;
      self->_iconViewControllersByIcon = v24;
    }
    if (!self->_iconViewControllersByListModel)
    {
      double v26 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      iconViewControllersByListModel = self->_iconViewControllersByListModel;
      self->_iconViewControllersByListModel = v26;
    }
    if (!self->_pageIconsByListModel)
    {
      double v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      pageIconsByListModel = self->_pageIconsByListModel;
      self->_pageIconsByListModel = v28;
    }
    if (v146)
    {
      if (v12)
      {
LABEL_15:
        v126 = v9;
        if (!v13)
        {
          uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_backgroundTapped_];
          [v12 addGestureRecognizer:v13];
        }
        v137 = (void *)v13;
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        uint64_t v30 = [v153 additionalIconListViews];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v193 objects:v200 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v194;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v194 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void **)(*((void *)&v193 + 1) + 8 * i);
              [v35 setEditing:0];
              [v35 updateEditingStateAnimated:v8 != 0];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v193 objects:v200 count:16];
          }
          while (v32);
        }

        id v36 = [v153 scalingView];
        v37 = [v146 superview];

        if (!v37)
        {
          [v36 bounds];
          objc_msgSend(v146, "setFrame:");
          [v36 insertSubview:v146 aboveSubview:v149];
        }
        v125 = v36;
        id v127 = v8;
        CGRect v38 = [v12 superview];

        if (v38 != v146) {
          [v146 addSubview:v12];
        }
        [(SBRootFolderViewPageManagementLayoutManager *)self layoutScrollViewAndRootListViewInFolderView:v153];
        v147 = v12;
        [v12 layoutIconsNow];
        long long v191 = 0u;
        long long v192 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        CGRect v39 = self->_iconViewControllersByIcon;
        uint64_t v40 = [(NSMapTable *)v39 countByEnumeratingWithState:&v189 objects:v199 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v190;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v190 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = [(NSMapTable *)self->_iconViewControllersByIcon objectForKey:*(void *)(*((void *)&v189 + 1) + 8 * j)];
              objc_msgSend(v44, "bs_beginAppearanceTransition:animated:", 1, 0);
              objc_msgSend(v44, "bs_endAppearanceTransition:", 1);
              v45 = [v44 listView];
              v187[0] = MEMORY[0x1E4F143A8];
              v187[1] = 3221225472;
              v187[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke;
              v187[3] = &unk_1E6AAD830;
              id v188 = v44;
              id v46 = v44;
              [v45 enumerateKnownIconViewsUsingBlock:v187];
            }
            uint64_t v41 = [(NSMapTable *)v39 countByEnumeratingWithState:&v189 objects:v199 count:16];
          }
          while (v41);
        }

        v47 = [(NSMapTable *)self->_pageIconsByListModel objectForKey:v131];
        v48 = v146;
        if (v47)
        {
          [v12 rectForIcon:v47];
          CGRect v203 = CGRectInset(v202, -8.0, -8.0);
          objc_msgSend(v146, "scrollRectToVisible:animated:", 0, v203.origin.x, v203.origin.y, v203.size.width, v203.size.height);
        }
        v49 = [(SBRootFolderViewPageManagementLayoutManager *)self activeFocusMode];
        double v9 = v126;
        v50 = v129;
        if ([v49 customizedHomeScreenPagesEnabled])
        {
          v51 = v142;
          if (!v142)
          {
            v143 = [v49 symbol];
            v52 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928]];
            v53 = [MEMORY[0x1E4FB1818] systemImageNamed:v143 withConfiguration:v52];
            v54 = v49;
            v55 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v53];
            v56 = [MEMORY[0x1E4FB1618] systemWhiteColor];
            [v55 setTintColor:v56];

            v48 = v146;
            [(SBRootFolderViewPageManagementLayoutManager *)self setFocusModeSymbolView:v55];

            v50 = v129;
            v51 = v55;
            v49 = v54;
          }
          v142 = v51;
          objc_msgSend(v48, "insertSubview:aboveSubview:");
          if (!v140)
          {
            v124 = +[SBIconView componentBackgroundView];
            v57 = SBHBundle();
            v58 = [v57 localizedStringForKey:@"OPTIONS" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

            v50 = v129;
            [v138 pageManagementFocusModeOptionsButtonSize];
            double v60 = v59;
            double v62 = v61;
            v63 = [SBTitledHomeScreenButton alloc];
            v64 = v49;
            v65 = -[SBTitledHomeScreenButton initWithFrame:backgroundView:type:content:](v63, "initWithFrame:backgroundView:type:content:", v124, 1, v58, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            -[SBTitledHomeScreenButton setPreferredContentFittingSize:](v65, "setPreferredContentFittingSize:", v60, v62);
            [(SBTitledHomeScreenButton *)v65 addTarget:self action:sel_focusModeOptionsButtonTapped_ forControlEvents:0x2000];
            [(SBRootFolderViewPageManagementLayoutManager *)self setFocusModeOptionsButton:v65];
            v140 = v65;
            v66 = v65;
            v49 = v64;
            [v48 insertSubview:v66 aboveSubview:v12];
            [(SBRootFolderViewPageManagementLayoutManager *)self layoutFooterViewsInFolderView:v153];
          }
        }
        v67 = [(SBRootFolderViewPageManagementLayoutManager *)self dockOffscreenAssertion];
        if (!v67)
        {
          v67 = [v153 beginModifyingDockOffscreenFractionForReason:@"PageEditing"];
          [(SBRootFolderViewPageManagementLayoutManager *)self setDockOffscreenAssertion:v67];
        }
        v68 = [(SBRootFolderViewPageManagementLayoutManager *)self scrollAccessoryBorrowedAssertion];

        if (!v68)
        {
          v69 = [v153 borrowScrollAccessoryForReason:@"PageEditing"];
          [(SBRootFolderViewPageManagementLayoutManager *)self setScrollAccessoryBorrowedAssertion:v69];
        }
        v70 = [(SBRootFolderViewPageManagementLayoutManager *)self pageDotsVisibilityAssertion];

        if (!v70)
        {
          v71 = [v153 requirePageDotsVisibilityForReason:@"PageEditing"];
          [(SBRootFolderViewPageManagementLayoutManager *)self setPageDotsVisibilityAssertion:v71];
        }
        [(SBRootFolderViewPageManagementLayoutManager *)self layoutHeaderViewsInFolderView:v153];
        if (v8)
        {
          v122 = v67;
          v123 = v49;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          v72 = self->_iconViewControllersByIcon;
          uint64_t v73 = [(NSMapTable *)v72 countByEnumeratingWithState:&v183 objects:v198 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v184;
            do
            {
              for (uint64_t k = 0; k != v74; ++k)
              {
                if (*(void *)v184 != v75) {
                  objc_enumerationMutation(v72);
                }
                v77 = *(void **)(*((void *)&v183 + 1) + 8 * k);
                v78 = -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", v77, v122, v123);
                [v78 setScalesListView:0];
                v79 = [v77 listModel];
                objc_msgSend(v153, "_frameForIconListAtIndex:", objc_msgSend(v126, "indexOfList:", v79));
                objc_msgSend(v147, "convertRect:fromView:", v149);
                CGFloat v81 = v80;
                CGFloat v83 = v82;
                CGFloat v85 = v84;
                CGFloat v87 = v86;
                v88 = [v147 iconViewForIcon:v77];
                [v88 iconImageInfo];
                double v90 = v89;
                v204.origin.x = v81;
                v204.origin.y = v83;
                v204.size.width = v85;
                v204.size.height = v87;
                double Width = CGRectGetWidth(v204);
                v205.origin.x = v81;
                v205.origin.y = v83;
                v205.size.width = v85;
                v205.size.height = v87;
                double v92 = v151 + CGRectGetHeight(v205);
                [v88 _continuousCornerRadius];
                objc_msgSend(v88, "setIconImageInfo:", Width, v92, v90, v93);
                [v88 layoutIfNeeded];
                UIRectGetCenter();
                objc_msgSend(v88, "setCenter:");
              }
              uint64_t v74 = [(NSMapTable *)v72 countByEnumeratingWithState:&v183 objects:v198 count:16];
            }
            while (v74);
          }

          [v142 setAlpha:0.0];
          [v140 setAlpha:0.0];
          v50 = v129;
          v94 = [v129 model];
          char v95 = [v126 isTrailingEmptyList:v94];

          id v8 = v127;
          double v12 = v147;
          v49 = v123;
          v67 = v122;
          if ((v95 & 1) == 0) {
            [v129 addSubview:v139];
          }
        }
        else
        {
          [v12 setEditing:self->_allowsEditing];
          [v12 updateEditingStateAnimated:0];
        }

        double v23 = v131;
        goto LABEL_69;
      }
    }
    else
    {
      id v100 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
      [v100 setDelegate:self];
      [v100 setShowsVerticalScrollIndicator:0];
      [v100 setShowsHorizontalScrollIndicator:0];
      v146 = v100;
      [(SBRootFolderViewPageManagementLayoutManager *)self setPageManagementScrollView:v100];
      if (v12) {
        goto LABEL_15;
      }
    }
    [(SBRootFolderViewPageManagementLayoutManager *)self makeRootListViewInFolderView:v153 animated:v8 != 0];
    double v12 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
    goto LABEL_15;
  }
  [(SBRootFolderViewPageManagementLayoutManager *)self turnOffIconViewRazterizationForNormalSizeListViews];
  if ([v23 isHidden])
  {
    uint64_t v96 = [v9 precedingVisibleListIndexBeforeIndex:v18];
    if (v96 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v96 = [v9 nextVisibleListIndexAfterIndex:v18];
    }
    uint64_t v97 = [v9 listAtIndex:v96];

    objc_msgSend(v153, "setCurrentPageIndex:animated:", objc_msgSend(v153, "pageIndexForIconListModelIndex:", v96), 0);
    double v23 = (void *)v97;
  }
  v137 = (void *)v13;
  [v12 setEditing:0];
  [v12 updateEditingStateAnimated:v8 != 0];
  v50 = [v12 model];
  [v50 removeListObserver:self];
  if (v8)
  {
    v98 = [(NSMapTable *)self->_iconViewControllersByListModel objectForKey:v23];
    v99 = [v98 listView];
    [v99 addSubview:v10];
    [v10 setAlpha:0.0];
    [v99 removeIconViewConfigurationOption:2];
    [v99 enumerateIconViewsUsingBlock:&__block_literal_global_51];
  }
  else
  {
    [(SBRootFolderViewPageManagementLayoutManager *)self cleanUpViewsInFolderView:v153];
  }
LABEL_69:

  unint64_t v130 = [(SBRootFolderViewPageManagementLayoutManager *)self transitionCount] + 1;
  -[SBRootFolderViewPageManagementLayoutManager setTransitionCount:](self, "setTransitionCount:");
  v101 = [(NSMapTable *)self->_iconViewControllersByListModel objectForKey:v23];
  v102 = [(NSMapTable *)self->_pageIconsByListModel objectForKey:v23];
  v148 = v101;
  v128 = [v101 listView];
  [(SBIconListView *)self->_rootListView coordinateForIcon:v102];
  uint64_t v104 = v103;
  unint64_t v105 = [(SBIconListView *)self->_rootListView iconColumnsForCurrentOrientation];
  if (v105)
  {
    unint64_t v106 = v105;
    uint64_t v107 = 0;
    do
    {
      v108 = -[SBIconListView iconViewForCoordinate:](self->_rootListView, "iconViewForCoordinate:", ++v107, v104, v122, v123);
      [(SBIconListView *)self->_rootListView bringSubviewToFront:v108];
    }
    while (v106 != v107);
  }
  v109 = v23;
  if (v8)
  {
    [(SBRootFolderViewPageManagementLayoutManager *)self setActiveTransitionCount:v133 + 1];
    [(SBRootFolderViewPageManagementLayoutManager *)self setLatestActiveTransitionAnimator:v8];
  }
  if (v145) {
    double v110 = 1.0;
  }
  else {
    double v110 = 0.0;
  }
  if (v145) {
    double v111 = 0.0;
  }
  else {
    double v111 = 1.0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_2;
  aBlock[3] = &unk_1E6AB2370;
  id v134 = v8;
  id v174 = v134;
  v175 = self;
  v182[328] = v145;
  id v112 = v153;
  id v176 = v112;
  double v180 = v111;
  id v144 = v142;
  id v177 = v144;
  double v181 = v110;
  id v132 = v140;
  id v178 = v132;
  id v141 = v135;
  id v179 = v141;
  memcpy(v182, __src, 0x148uLL);
  v136 = _Block_copy(aBlock);
  if (v145)
  {
    if (v8)
    {
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_4;
      v172[3] = &unk_1E6AAC810;
      v172[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v172 animations:0 completion:0.2];
      v113 = [[SBIconListViewDominoPivotAnimator alloc] initWithPivotIcon:v102];
      [(SBIconListViewDominoPivotAnimator *)v113 setDelegate:self];
      [v12 setIconsNeedLayout];
      [(SBRootFolderViewPageManagementLayoutManager *)self setLayoutAction:1];
      [v12 layoutIconsIfNeededUsingAnimator:v113 options:0];
      [(SBRootFolderViewPageManagementLayoutManager *)self setLayoutAction:0];
    }
    else
    {
      [(SBRootFolderViewPageManagementLayoutManager *)self makeMaterialViewsVisible];
    }
  }
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_5;
  v160[3] = &unk_1E6AB2398;
  BOOL v171 = v145;
  double v168 = v110;
  v160[4] = self;
  id v161 = v9;
  id v162 = v109;
  id v114 = v112;
  id v163 = v114;
  id v115 = v12;
  id v164 = v115;
  id v165 = v149;
  double v169 = v151;
  id v116 = v128;
  id v166 = v116;
  double v170 = v111;
  v117 = v136;
  id v167 = v117;
  id v152 = v149;
  id v150 = v109;
  id v118 = v9;
  [v134 addAnimations:v160];
  if (!v8)
  {
    [v114 setIncludesHiddenIconListPages:0];
    [(SBRootFolderViewPageManagementLayoutManager *)self _updateCloseBoxVisibilityWithAnimation:0];
    v117[2](v117);
  }
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_8;
  v154[3] = &unk_1E6AB23C0;
  id v157 = v114;
  unint64_t v158 = v130;
  v154[4] = self;
  id v155 = v115;
  BOOL v159 = v145;
  id v156 = v116;
  id v119 = v114;
  id v120 = v116;
  id v121 = v115;
  [v134 addCompletion:v154];
  if (!v8 && v145) {
    [(SBRootFolderViewPageManagementLayoutManager *)self rasterizeIconViewsForImprovedLegibilityInScaledDownListViews];
  }
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 customIconImageViewController];
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:", v4);
    double v5 = SBLogRootController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_cold_1((uint64_t)v4, v5);
    }

    double v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v4 setForcesVisible:1];
    }
  }
  [v3 setCustomIconImageViewControllerPresentationMode:0];
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIconLabelAlpha:0.0];
  [v2 layoutIfNeeded];
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_2(uint64_t a1)
{
  id v2 = +[SBHHomeScreenDomain rootSettings];
  id v3 = [v2 iconEditingSettings];
  [v3 defaultSpringDuration];
  double v5 = v4;
  [v3 defaultSpringDampingRatio];
  double v7 = v6;
  id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_3;
  double v16 = &unk_1E6AB2370;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  double v11 = *(void **)(a1 + 48);
  id v17 = v9;
  uint64_t v18 = v10;
  v25[328] = *(unsigned char *)(a1 + 424);
  id v19 = v11;
  uint64_t v23 = *(void *)(a1 + 80);
  id v20 = *(id *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 88);
  id v21 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 72);
  memcpy(v25, (const void *)(a1 + 96), 0x148uLL);
  double v12 = (void *)[v8 initWithDuration:&v13 dampingRatio:v5 animations:v7];
  objc_msgSend(v12, "startAnimation", v13, v14, v15, v16);
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) dockOffscreenAssertion];
    id v3 = v2;
    double v4 = 1.0;
    if (!*(unsigned char *)(a1 + 424)) {
      double v4 = 0.0;
    }
    [v2 setDockOffscreenFraction:v4];
    [v3 layoutIfNeededForDockOffscreenFractionChanged];
  }
  else
  {
    id v3 = [*(id *)(a1 + 48) dockView];
    [v3 setAlpha:*(double *)(a1 + 80)];
  }

  [*(id *)(a1 + 56) setAlpha:*(double *)(a1 + 88)];
  [*(id *)(a1 + 64) setAlpha:*(double *)(a1 + 88)];
  double v5 = [*(id *)(a1 + 48) scrollAccessoryView];
  [v5 setAlpha:*(double *)(a1 + 80)];

  uint64_t result = [*(id *)(a1 + 72) setAlpha:*(double *)(a1 + 80)];
  if (*(void *)(a1 + 32))
  {
    UIRectGetCenter();
    double v8 = v7;
    double v10 = v9;
    if (*(unsigned char *)(a1 + 424))
    {
      memset(&v12, 0, sizeof(v12));
      CGAffineTransformMakeScale(&v12, 0.01, 0.01);
      objc_msgSend(*(id *)(a1 + 72), "setBounds:", 0.0, 0.0, *(double *)(a1 + 184) * v12.c + v12.a * *(double *)(a1 + 176), *(double *)(a1 + 184) * v12.d + v12.b * *(double *)(a1 + 176));
      return objc_msgSend(*(id *)(a1 + 72), "setCenter:", v8, -v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "setBounds:", 0.0, 0.0, *(double *)(a1 + 176), *(double *)(a1 + 184));
      double v11 = *(void **)(a1 + 72);
      return objc_msgSend(v11, "setCenter:", v8, v10);
    }
  }
  return result;
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeMaterialViewsVisible];
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v22.minimum;
  float maximum = v22.maximum;
  float preferred = v22.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_6;
  v10[3] = &unk_1E6AB2398;
  char v21 = *(unsigned char *)(a1 + 120);
  double v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 96);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 104);
  id v16 = *(id *)(a1 + 80);
  uint64_t v20 = *(void *)(a1 + 112);
  id v17 = *(id *)(a1 + 88);
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114129, v10, v7, v8, v9);
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_6(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 120))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v42 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          double v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v7];
          [v8 setScalesListView:0];
          double v9 = [v8 listBackgroundView];
          [v9 setWeighting:*(double *)(a1 + 96)];
          double v10 = [v7 listModel];
          uint64_t v11 = [*(id *)(a1 + 32) folderListIndexToAnimateOutForList:v10 inFolder:*(void *)(a1 + 40) avoidingList:*(void *)(a1 + 48)];
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v12 = [v8 view];
            [v12 setAlpha:0.0];
          }
          else
          {
            [*(id *)(a1 + 56) _frameForIconListAtIndex:v11];
            objc_msgSend(*(id *)(a1 + 64), "convertRect:fromView:", *(void *)(a1 + 72));
            CGFloat v14 = v13;
            CGFloat v16 = v15;
            CGFloat v18 = v17;
            CGFloat v20 = v19;
            id v12 = [*(id *)(a1 + 64) iconViewForIcon:v7];
            [v12 iconImageInfo];
            double v22 = v21;
            v48.origin.x = v14;
            v48.origin.y = v16;
            v48.size.width = v18;
            v48.size.height = v20;
            double Width = CGRectGetWidth(v48);
            v49.origin.x = v14;
            v49.origin.y = v16;
            v49.size.width = v18;
            v49.size.height = v20;
            CGFloat v24 = CGRectGetHeight(v49) + *(double *)(a1 + 104);
            [v12 _continuousCornerRadius];
            objc_msgSend(v12, "setIconImageInfo:", Width, v24, v22, v25);
            [v12 layoutIfNeeded];
            UIRectGetCenter();
            objc_msgSend(v12, "setCenter:");
          }

          if ([v10 isHidden])
          {
            double v26 = [v8 listView];
            [v26 setAlpha:*(double *)(a1 + 96)];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v4);
    }

    uint64_t v27 = [*(id *)(a1 + 56) isEditing];
    [*(id *)(a1 + 80) setEditing:v27];
    [*(id *)(a1 + 80) updateEditingStateAnimated:1];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v28 = [*(id *)(a1 + 56) additionalIconListViews];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          [v33 setEditing:v27];
          [v33 updateEditingStateAnimated:1];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v30);
    }

    [*(id *)(a1 + 56) setIncludesHiddenIconListPages:0];
  }
  CGRect v34 = *(void **)(a1 + 80);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_7;
  v36[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  v36[4] = *(void *)(a1 + 112);
  [v34 enumerateIconViewsUsingBlock:v36];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setIconLabelAlpha:*(double *)(a1 + 32)];
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActiveTransitionCount:", objc_msgSend(*(id *)(a1 + 32), "activeTransitionCount") - 1);
  [*(id *)(a1 + 32) setLatestActiveTransitionAnimator:0];
  if ([*(id *)(a1 + 32) transitionCount] == *(void *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 72)) {
      BOOL v2 = *(unsigned char *)(*(void *)(a1 + 32) + 48) != 0;
    }
    else {
      BOOL v2 = 0;
    }
    [*(id *)(a1 + 40) setEditing:v2];
    [*(id *)(a1 + 40) updateEditingStateAnimated:1];
    [*(id *)(a1 + 32) _updateCloseBoxVisibilityWithAnimation:0];
    if (*(unsigned char *)(a1 + 72))
    {
      [*(id *)(a1 + 48) addIconViewConfigurationOption:2];
      [*(id *)(a1 + 48) enumerateIconViewsUsingBlock:&__block_literal_global_47_0];
      uint64_t v3 = *(void **)(a1 + 32);
      [v3 rasterizeIconViewsForImprovedLegibilityInScaledDownListViews];
    }
    else
    {
      [*(id *)(a1 + 32) cleanUpViewsInFolderView:*(void *)(a1 + 56)];
      id v4 = [*(id *)(a1 + 32) alertPresentationViewController];
      [v4 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setIconLabelAlpha:1.0];
}

- (void)rasterizeIconViewsForImprovedLegibilityInScaledDownListViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_iconViewControllersByIcon;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [(NSMapTable *)self->_iconViewControllersByIcon objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        double v9 = [v8 listView];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __107__SBRootFolderViewPageManagementLayoutManager_rasterizeIconViewsForImprovedLegibilityInScaledDownListViews__block_invoke;
        v10[3] = &unk_1E6AAEB78;
        v10[4] = self;
        [v9 enumerateIconViewsUsingBlock:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __107__SBRootFolderViewPageManagementLayoutManager_rasterizeIconViewsForImprovedLegibilityInScaledDownListViews__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canRasterizeIconView:"))
  {
    uint64_t v3 = [v14 layer];
    uint64_t v4 = [SBHPageManagementIconViewScalingAttributes alloc];
    uint64_t v5 = [v3 minificationFilter];
    uint64_t v6 = [v3 shouldRasterize];
    [v3 rasterizationScale];
    double v8 = -[SBHPageManagementIconViewScalingAttributes initWithMinificationFilter:shouldRasterize:rasterizationScale:allowsEdgeAntialiasing:](v4, "initWithMinificationFilter:shouldRasterize:rasterizationScale:allowsEdgeAntialiasing:", v5, v6, [v3 allowsEdgeAntialiasing], v7);

    double v9 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      uint64_t v11 = *(void *)(a1 + 32);
      long long v12 = *(void **)(v11 + 32);
      *(void *)(v11 + 32) = v10;

      double v9 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    [v9 setObject:v8 forKey:v14];
    [v3 setMinificationFilter:*MEMORY[0x1E4F39FE0]];
    [v3 setShouldRasterize:1];
    long long v13 = [v14 traitCollection];
    [v13 displayScale];
    objc_msgSend(v3, "setRasterizationScale:");

    [v3 setAllowsEdgeAntialiasing:1];
  }
}

- (void)turnOffIconViewRazterizationForNormalSizeListViews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_initialScalingAttributesByIconView;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = -[NSMapTable objectForKey:](self->_initialScalingAttributesByIconView, "objectForKey:", v8, (void)v12);
        uint64_t v10 = [v8 layer];
        uint64_t v11 = [v9 minificationFilter];
        [v10 setMinificationFilter:v11];

        objc_msgSend(v10, "setShouldRasterize:", objc_msgSend(v9, "shouldRasterize"));
        [v9 rasterizationScale];
        objc_msgSend(v10, "setRasterizationScale:");
        objc_msgSend(v10, "setAllowsEdgeAntialiasing:", objc_msgSend(v9, "allowsEdgeAntialiasing"));
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)makeMaterialViewsVisible
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_iconViewControllersByIcon;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        double v9 = [v8 listBackgroundView];
        uint64_t v10 = [v8 toggleButtonBackgroundView];
        [v9 setWeighting:1.0];
        [v10 setWeighting:1.0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)makeRootListViewInFolderView:(id)a3 animated:(BOOL)a4
{
  v149[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 folder];
  [v6 addFolderObserver:self];
  v113 = [(SBRootFolderViewPageManagementLayoutManager *)self activeFocusMode];
  int v108 = [v113 customizedHomeScreenPagesEnabled];
  if (v108) {
    uint64_t v7 = [v6 visibleListCount];
  }
  else {
    uint64_t v7 = [v6 listCount];
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v6 trailingEmptyListCount];
  unint64_t v10 = v8 - v9;
  if (v9) {
    BOOL v11 = v8 == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    ++v10;
  }
  uint64_t v12 = 2;
  if (v10 >= 5) {
    uint64_t v12 = 3;
  }
  if (v10 >= 3) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v10;
  }
  if (v10 % v13) {
    unint64_t v14 = v10 / v13 + 1;
  }
  else {
    unint64_t v14 = v10 / v13;
  }
  long long v15 = [[SBIconListModel alloc] initWithFolder:0 gridSize:(v14 << 16) | (unint64_t)(unsigned __int16)v13];
  [(SBIconListModel *)v15 setAllowsRotatedLayout:0];
  [(SBIconListModel *)v15 addListObserver:self];
  double v111 = [v5 currentIconListModel];
  v125 = [v5 traitCollection];
  [v5 bounds];
  double v104 = v17;
  double v105 = v16;
  CGFloat rect = v18;
  double v103 = v19;
  [v5 safeAreaInsets];
  double v21 = v20;
  [v5 _iconListViewSize];
  double v23 = v22;
  double v123 = v24;
  double v25 = [v5 rootListLayout];
  double v26 = [v5 firstIconListView];
  uint64_t v27 = [v26 orientation];

  [v25 layoutInsetsForOrientation:v27];
  double v29 = v28;
  double v31 = v30;
  double v121 = v32;
  SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v25, v27, @"SBHIconGridSizeClassSmall");
  double v34 = v33;
  id v118 = v25;
  SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v25, v27, @"SBHIconGridSizeClassDefault");
  double v36 = (v34 - v35) * 0.5;
  long long v37 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v38 = [v37 userInterfaceIdiom];

  if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v39 = v23;
    double v106 = v123 - v29 - v121 + v36 * 2.0 + (v29 - v36) * 2.0;
    double v40 = v123;
  }
  else
  {
    [v5 maxDockHeight];
    double v40 = v123;
    double v106 = v123 - v21 - v41;
    double v39 = v23;
  }
  long long v42 = [v5 rootFolderVisualConfiguration];
  double v43 = 0.0;
  double v44 = 0.0;
  if ([(SBRootFolderViewPageManagementLayoutManager *)self allowsPageHiding])
  {
    [v42 pageManagementPageCheckboxDiameter];
    double v43 = v45;
    [v42 pageManagementPageCheckboxVerticalMargin];
    double v44 = v46;
  }
  double v117 = v21;
  uint64_t v110 = v27;
  double v102 = v31;
  double v107 = v29;
  if (v13 >= 2)
  {
    unint64_t v47 = v14;
    if (v13 == 2)
    {
      if (v14 < 2) {
        uint64_t v48 = 1;
      }
      else {
        uint64_t v48 = 2;
      }
    }
    else if (v14 >= 3)
    {
      if (v14 == 3) {
        uint64_t v48 = 4;
      }
      else {
        uint64_t v48 = 5;
      }
    }
    else
    {
      uint64_t v48 = 3;
    }
  }
  else
  {
    unint64_t v47 = v14;
    uint64_t v48 = 0;
  }
  [(SBRootFolderViewPageManagementLayoutManager *)self setLayoutConfiguration:v48];
  v124 = v42;
  [v42 pageManagementLayoutMetricsForLayoutConfiguration:v48];
  double v109 = v49;
  double v119 = v51;
  double v122 = v50;
  double v53 = v52;
  double v54 = v39;
  double v101 = v39 * 0.03 * 0.5;
  double v55 = v39 * v52;
  double v56 = v40 * v52;
  v57 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v58 = [v57 userInterfaceIdiom];

  double v59 = 0.0;
  if ((v58 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v59 = -(v107 * v53 - (v101 + v102 * v53));
  }
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke;
  v128[3] = &unk_1E6AB23E8;
  id v129 = v6;
  id v60 = v5;
  id v130 = v60;
  BOOL v146 = a4;
  id v112 = v111;
  id v131 = v112;
  id v132 = self;
  id v114 = v113;
  id v133 = v114;
  char v147 = v108;
  double v135 = v54;
  double v136 = v40;
  double v137 = v55;
  double v138 = v56;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  double v143 = v59;
  double v144 = v43;
  double v145 = v44;
  double v61 = v15;
  id v134 = v61;
  id v116 = v129;
  [v129 enumerateListsWithOptions:4 usingBlock:v128];
  double v62 = v43 + v44;
  v63 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v64 = [v63 userInterfaceIdiom];

  if ((v64 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v65 = v62 + v106 * v53;
    unint64_t v66 = v47;
    uint64_t v67 = v110;
    double v68 = v119;
  }
  else
  {
    double v65 = v62 + v106 * (v53 + 0.03);
    [v125 displayCornerRadius];
    unint64_t v66 = v47;
    double v68 = v119;
    if ((BSFloatIsZero() & 1) == 0) {
      [v118 iconImageInfo];
    }
    uint64_t v67 = v110;
  }
  double v69 = 0.0;
  switch(v48)
  {
    case 0:
    case 1:
      goto LABEL_42;
    case 2:
    case 3:
      v70 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v71 = [v70 userInterfaceIdiom];

      if ((v71 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
LABEL_42:
        double v72 = *MEMORY[0x1E4FB2848];
        double v69 = *(double *)(MEMORY[0x1E4FB2848] + 8);
        double v68 = *(double *)(MEMORY[0x1E4FB2848] + 16);
        double v73 = *(double *)(MEMORY[0x1E4FB2848] + 24);
        goto LABEL_53;
      }
      v150.origin.x = v105 + 0.0;
      v150.origin.y = v104 + v117;
      v150.size.width = rect;
      v150.size.height = v103 - (v117 + 0.0);
      double v76 = CGRectGetHeight(v150) - v65 - v122 - v65 - v68;
      if ([(SBRootFolderViewPageManagementLayoutManager *)self allowsPageHiding]) {
        goto LABEL_52;
      }
      [v124 pageManagementPageCheckboxDiameter];
      double v78 = v77;
      [v124 pageManagementPageCheckboxVerticalMargin];
      double v80 = v79 + v79;
      double v81 = 2.0;
      goto LABEL_51;
    case 4:
    case 5:
      uint64_t v74 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v75 = [v74 userInterfaceIdiom];

      if ((v75 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        double v72 = 140.0;
LABEL_46:
        double v73 = 0.0;
      }
      else
      {
        v151.origin.x = v105 + 0.0;
        v151.origin.y = v104 + v117;
        v151.size.width = rect;
        v151.size.height = v103 - (v117 + 0.0);
        double v76 = CGRectGetHeight(v151) - v65 - v122 - v65 - v122 - v65 - v68;
        if (![(SBRootFolderViewPageManagementLayoutManager *)self allowsPageHiding])
        {
          [v124 pageManagementPageCheckboxDiameter];
          double v78 = v82;
          [v124 pageManagementPageCheckboxVerticalMargin];
          double v81 = 3.0;
          double v80 = v83 * 3.0;
LABEL_51:
          double v76 = v76 - (v80 + v78 * v81);
        }
LABEL_52:
        double v72 = v117 + v76;
        double v73 = 0.0;
        double v68 = v119;
      }
LABEL_53:
      double v84 = objc_alloc_init(SBIconListGridLayoutConfiguration);
      CGFloat v85 = v84;
      if ((unint64_t)(v67 - 1) > 1)
      {
        [(SBIconListGridLayoutConfiguration *)v84 setNumberOfLandscapeColumns:v13];
        [(SBIconListGridLayoutConfiguration *)v85 setNumberOfLandscapeRows:v66];
        -[SBIconListGridLayoutConfiguration setLandscapeLayoutInsets:](v85, "setLandscapeLayoutInsets:", v72, v69, v68, v73);
      }
      else
      {
        [(SBIconListGridLayoutConfiguration *)v84 setNumberOfPortraitColumns:v13];
        [(SBIconListGridLayoutConfiguration *)v85 setNumberOfPortraitRows:v66];
        -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v85, "setPortraitLayoutInsets:", v72, v69, v68, v73);
      }
      [v125 displayScale];
      UISizeRoundToScale();
      -[SBIconListGridLayoutConfiguration setIconImageInfo:](v85, "setIconImageInfo:");
      double v86 = [[SBIconListGridLayout alloc] initWithLayoutConfiguration:v85];
      CGFloat v87 = [SBHCustomIconListLayoutProvider alloc];
      v148 = @"SBRootFolderViewPageManagement";
      v149[0] = v86;
      id v120 = v86;
      v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:&v148 count:1];
      double v89 = [(SBHCustomIconListLayoutProvider *)v87 initWithListLayouts:v88];

      double v90 = [[SBIconListView alloc] initWithModel:v61 layoutProvider:v89 iconLocation:@"SBRootFolderViewPageManagement" orientation:v67 iconViewProvider:self];
      v91 = [v60 traitCollection];
      double v92 = objc_msgSend(v91, "sbh_iconImageStyleConfiguration");
      [(SBIconListView *)v90 setOverrideIconImageStyleConfiguration:v92];
      double v93 = (void *)*MEMORY[0x1E4FB2608];
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_3;
      v126[3] = &unk_1E6AAC810;
      v94 = v90;
      id v127 = v94;
      [v93 _performBlockAfterCATransactionCommits:v126];
      char v95 = [(SBRootFolderViewPageManagementLayoutManager *)self iconDragManager];
      [(SBIconListView *)v94 setDragDelegate:v95];

      [(SBIconListView *)v94 setAutomaticallyAdjustsLayoutMetricsToFit:0];
      -[SBIconListView setIconSpacing:](v94, "setIconSpacing:", v109, v122);
      [(SBIconListView *)v94 setLayoutInsetsMode:2];
      [(SBIconListView *)v94 setIconViewConfigurationOptions:82];
      if (self->_allowsEditing) {
        [(SBIconListView *)v94 setIconDragTypeIdentifier:@"com.apple.SpringBoardHome.PageReordering"];
      }
      [v60 bounds];
      -[SBIconListView setFrame:](v94, "setFrame:");
      [(SBRootFolderViewPageManagementLayoutManager *)self setRootListView:v94];
      [(SBRootFolderViewPageManagementLayoutManager *)self setPageManagementListModel:v61];
      uint64_t v96 = [v60 window];
      [v96 rootViewController];
      uint64_t v97 = v60;
      v99 = v98 = v61;
      [(SBRootFolderViewPageManagementLayoutManager *)self setAlertPresentationViewController:v99];

      return;
    default:
      double v72 = 0.0;
      double v68 = 0.0;
      goto LABEL_46;
  }
}

void __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isTrailingEmptyList:v6])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) iconListViewWithList:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      [v7 setEditing:0];
      [v8 updateEditingStateAnimated:*(unsigned __int8 *)(a1 + 200)];
      [v8 ignoreNextWindowChange];
      [*(id *)(a1 + 40) _removeIconListView:v8 purge:0];
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 40) _createIconListViewForList:v6];
    }
    if (*(unsigned char *)(a1 + 200) && *(id *)(a1 + 48) == v6) {
      uint64_t v9 = 20;
    }
    else {
      uint64_t v9 = 22;
    }
    [v8 addIconViewConfigurationOption:v9];
    [v8 showAllIcons];
    [v8 enumerateKnownIconViewsUsingBlock:&__block_literal_global_52];
    unint64_t v10 = (void *)[*(id *)(a1 + 56) newCellBackgroundMaterialViewInFolderView:*(void *)(a1 + 40) initialWeighting:0.0];
    BOOL v11 = (void *)[*(id *)(a1 + 56) newCellBackgroundMaterialViewInFolderView:*(void *)(a1 + 40) initialWeighting:0.0];
    [v10 setGroupNameBase:@"List-And-Toggle-Background"];
    [v11 setGroupNameBase:@"List-And-Toggle-Background"];
    int v12 = [*(id *)(a1 + 64) wantsListVisible:v6];
    if (!*(unsigned char *)(a1 + 201) || v12)
    {
      unint64_t v13 = [SBHPageManagementCellViewController alloc];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 56) allowsPageHiding];
      long long v16 = *(_OWORD *)(a1 + 160);
      v21[4] = *(_OWORD *)(a1 + 144);
      v21[5] = v16;
      v21[6] = *(_OWORD *)(a1 + 176);
      uint64_t v22 = *(void *)(a1 + 192);
      long long v17 = *(_OWORD *)(a1 + 96);
      v21[0] = *(_OWORD *)(a1 + 80);
      v21[1] = v17;
      long long v18 = *(_OWORD *)(a1 + 128);
      v21[2] = *(_OWORD *)(a1 + 112);
      v21[3] = v18;
      double v19 = [(SBHPageManagementCellViewController *)v13 initWithListView:v8 listBackgroundView:v10 toggleButtonBackgroundView:v11 folder:v14 metrics:v21 toggleButtonAllowed:v15];
      [(SBHPageManagementCellViewController *)v19 setDelegate:*(void *)(a1 + 56)];
      double v20 = [[SBHPageManagementIcon alloc] initWithListModel:v6];
      [*(id *)(a1 + 72) addIcon:v20];
      [*(id *)(*(void *)(a1 + 56) + 8) setObject:v19 forKey:v20];
      [*(id *)(*(void *)(a1 + 56) + 16) setObject:v19 forKey:v6];
      [*(id *)(*(void *)(a1 + 56) + 24) setObject:v20 forKey:v6];
    }
  }
}

void __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 customIconImageViewController];
  if (v2)
  {
    id v7 = v2;
    uint64_t v3 = objc_opt_class();
    id v4 = v7;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    [v6 setWantsEditingDisplayStyle:1 animated:0];
    BOOL v2 = v7;
  }
}

uint64_t __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOverrideIconImageStyleConfiguration:0];
}

- (id)newCellBackgroundMaterialViewInFolderView:(id)a3 initialWeighting:(double)a4
{
  id v5 = [a3 traitCollection];
  id v6 = +[SBIconView componentBackgroundViewOfType:2 compatibleWithTraitCollection:v5 initialWeighting:a4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__SBRootFolderViewPageManagementLayoutManager_newCellBackgroundMaterialViewInFolderView_initialWeighting___block_invoke;
  v8[3] = &__block_descriptor_40_e8_d16__0d8l;
  v8[4] = 0x3FC0000000000000;
  [v6 setBackdropScaleAdjustment:v8];
  return v6;
}

double __106__SBRootFolderViewPageManagementLayoutManager_newCellBackgroundMaterialViewInFolderView_initialWeighting___block_invoke(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 32);
  double result = v2 / a2;
  double v4 = v2 * 4.0;
  if (result > v4) {
    return v4;
  }
  return result;
}

- (unint64_t)folderListIndexToAnimateOutForList:(id)a3 inFolder:(id)a4 avoidingList:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 indexOfList:v7];
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_25;
  }
  uint64_t v12 = v10;
  uint64_t v13 = [v8 listAtIndex:v10];
  if (v7 != v9)
  {
    uint64_t v14 = v9;
    if ((id)v13 == v9)
    {
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v15 = v12 - 1;
  uint64_t v14 = (void *)v13;
  while ([v14 isHidden])
  {
    if (v15 == -1) {
      goto LABEL_10;
    }

    uint64_t v16 = [v8 listAtIndex:v15];
    uint64_t v14 = (void *)v16;
    --v15;
    if (v7 != v9 && (id)v16 == v9)
    {
      uint64_t v14 = v9;
      goto LABEL_10;
    }
  }
  unint64_t v11 = [v8 indexOfList:v14];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    unint64_t v17 = [v8 listCount];
    unint64_t v18 = v12 + 1;
    if (v18 >= v17)
    {
LABEL_16:
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v9) {
        goto LABEL_25;
      }
    }
    else
    {
      unint64_t v19 = v17;
      while (1)
      {
        id v20 = [v8 listAtIndex:v18];
        if (v20 == v9)
        {
          unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
          double v21 = v9;
          goto LABEL_22;
        }
        double v21 = v20;
        if (([v20 isHidden] & 1) == 0) {
          break;
        }

        if (v19 == ++v18) {
          goto LABEL_16;
        }
      }
      unint64_t v11 = [v8 indexOfList:v21];
LABEL_22:

      if (!v9) {
        goto LABEL_25;
      }
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v11 = [v8 indexOfList:v9];
    }
  }
LABEL_25:

  return v11;
}

- (void)cleanUpViewsInFolderView:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 folder];
  double v31 = [(SBRootFolderViewPageManagementLayoutManager *)self focusModeSymbolView];
  [v31 removeFromSuperview];
  double v30 = [(SBRootFolderViewPageManagementLayoutManager *)self focusModeOptionsButton];
  [v30 removeFromSuperview];
  id v6 = [v4 widgetButton];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v45[0] = *MEMORY[0x1E4F1DAB8];
  v45[1] = v7;
  v45[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setTransform:v45];
  double v29 = v6;
  [v6 setAlpha:1.0];
  double v28 = [(SBRootFolderViewPageManagementLayoutManager *)self dockOffscreenAssertion];
  [v28 invalidate];
  [(SBRootFolderViewPageManagementLayoutManager *)self setDockOffscreenAssertion:0];
  id v8 = [v4 dockView];
  [v8 setAlpha:1.0];

  uint64_t v27 = [(SBRootFolderViewPageManagementLayoutManager *)self scrollAccessoryBorrowedAssertion];
  [v27 invalidate];
  [(SBRootFolderViewPageManagementLayoutManager *)self setScrollAccessoryBorrowedAssertion:0];
  double v26 = [(SBRootFolderViewPageManagementLayoutManager *)self pageDotsVisibilityAssertion];
  [v26 invalidate];
  id v9 = self;
  [(SBRootFolderViewPageManagementLayoutManager *)self setPageDotsVisibilityAssertion:0];
  [v4 setPageControlAlpha:1.0];
  double v34 = v4;
  uint64_t v10 = [v4 isEditing];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v32 = v5;
  obuint64_t j = [v5 visibleLists];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [(NSMapTable *)v9->_iconViewControllersByListModel objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        uint64_t v16 = [v15 listView];
        [v15 cleanUpListView];
        [v4 _addIconListView:v16 atEnd:0];
        [v16 removeIconViewConfigurationOption:22];
        [v16 setEditing:v10];
        [v16 updateEditingStateAnimated:1];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke;
        v39[3] = &unk_1E6AAD830;
        id v40 = v15;
        id v17 = v15;
        [v16 enumerateKnownIconViewsUsingBlock:v39];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v12);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v18 = [v4 additionalIconListViews];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        [v23 setEditing:v10];
        [v23 updateEditingStateAnimated:1];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v20);
  }

  double v24 = [(SBRootFolderViewPageManagementLayoutManager *)v9 rootListView];
  [v24 removeFromSuperview];
  double v25 = [(SBRootFolderViewPageManagementLayoutManager *)v9 pageManagementScrollView];
  [v25 removeFromSuperview];
  [v34 setAutomaticallyCreatesIconListViews:1];
}

void __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 customIconImageViewController];
  if (v3)
  {
    id v4 = SBLogRootController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke_cold_1((uint64_t)v3, v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", v3);
    uint64_t v5 = objc_opt_class();
    id v6 = v3;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        long long v7 = v6;
      }
      else {
        long long v7 = 0;
      }
    }
    else
    {
      long long v7 = 0;
    }
    id v8 = v7;

    [v8 setWantsEditingDisplayStyle:0 animated:1];
    id v9 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v6 setForcesVisible:0];
    }
  }
}

- (BOOL)pageContainsBookmarkIcons:(id)a3
{
  uint64_t v3 = [a3 listModel];
  id v4 = self;
  uint64_t v5 = [v3 iconsOfClass:v4];

  LOBYTE(v4) = [v5 count] != 0;
  return (char)v4;
}

- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_iconViewControllersByIcon;
  uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = [(NSMapTable *)self->_iconViewControllersByIcon objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v7)];
      objc_msgSend(v8, "bs_beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v8, "bs_endAppearanceTransition:", 1);
      id v9 = [v8 listView];
      uint64_t v17 = 0;
      unint64_t v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __111__SBRootFolderViewPageManagementLayoutManager_parentViewControllerForCustomIconImageViewControllerForIconView___block_invoke;
      v14[3] = &unk_1E6AAD6B8;
      id v15 = v4;
      uint64_t v16 = &v17;
      [v9 enumerateKnownIconViewsUsingBlock:v14];
      int v10 = *((unsigned __int8 *)v18 + 24);
      if (*((unsigned char *)v18 + 24)) {
        id v13 = v8;
      }

      _Block_object_dispose(&v17, 8);
      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v13 = 0;
  }

  return v13;
}

uint64_t __111__SBRootFolderViewPageManagementLayoutManager_parentViewControllerForCustomIconImageViewControllerForIconView___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isTrackingActiveOrDroppingIconDrags
{
  double v2 = [(SBRootFolderViewPageManagementLayoutManager *)self iconDragManager];
  char v3 = [v2 isTrackingActiveOrDroppingIconDrags];

  return v3;
}

- (BOOL)_canRasterizeIconView:(id)a3
{
  char v3 = [a3 icon];
  char v4 = [v3 isFolderIcon] ^ 1;

  return v4;
}

- (void)_removePageIcon:(id)a3
{
  id v4 = a3;
  id v11 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  uint64_t v5 = [v11 model];
  uint64_t v6 = [v4 icon];
  [v4 setAllowsEditingAnimation:0];

  uint64_t v7 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  [v7 markIcon:v6 asNeedingAnimation:0];
  id v8 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  id v9 = [v8 folder];
  int v10 = [v9 startCoalescingContentChangesForReason:@"SBPageManagementIconCoalesceID"];
  [v9 removeIcon:v6 options:0];
  [v5 removeIcon:v6];
  [v10 invalidate];
  [v7 setIconsNeedLayout];
  [v7 layoutIconsIfNeededWithAnimationType:2 options:1];
}

- (void)backgroundTapped:(id)a3
{
  id v15 = a3;
  id v4 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  [v15 locationInView:v4];
  uint64_t v5 = objc_msgSend(v4, "iconAtPoint:index:", 0);
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 iconViewForIcon:v5];
  uint64_t v7 = [v6 customIconImageViewController];
  id v8 = [v7 view];

  if (!v8)
  {

    goto LABEL_6;
  }
  [v15 locationInView:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v8 bounds];
  v17.x = v10;
  v17.y = v12;
  BOOL v13 = CGRectContainsPoint(v18, v17);

  if (!v13)
  {
LABEL_6:
    uint64_t v14 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
    [v14 exitPageManagementUIWithCompletionHandler:0];
  }
}

- (void)focusModeOptionsButtonTapped:(id)a3
{
  id v10 = [(SBRootFolderViewPageManagementLayoutManager *)self activeFocusMode];
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = NSString;
  uint64_t v6 = [v10 identifier];
  uint64_t v7 = [v5 stringWithFormat:@"prefs:root=DO_NOT_DISTURB&path=%@", v6];
  id v8 = [v4 URLWithString:v7];

  [(SBRootFolderViewPageManagementLayoutManager *)self setCompletionURL:v8];
  double v9 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  [v9 exitPageManagementUIWithCompletionHandler:0];
}

- (void)presentPageDeleteConfirmationAlertForIconView:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v7 = SBHBundle();
  id v8 = [v7 localizedStringForKey:@"REMOVE_PAGE_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  double v9 = SBHBundle();
  id v10 = [v9 localizedStringForKey:@"REMOVE_PAGE_BODY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  double v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  CGFloat v12 = (void *)MEMORY[0x1E4FB1410];
  BOOL v13 = SBHBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"REMOVE_PAGE_BUTTON" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__SBRootFolderViewPageManagementLayoutManager_presentPageDeleteConfirmationAlertForIconView_completion___block_invoke;
  v22[3] = &unk_1E6AB2410;
  id v23 = v5;
  id v15 = v5;
  uint64_t v16 = [v12 actionWithTitle:v14 style:2 handler:v22];

  [v11 addAction:v16];
  CGPoint v17 = (void *)MEMORY[0x1E4FB1410];
  CGRect v18 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_1F2FA0300 table:@"SpringBoard"];
  char v20 = [v17 actionWithTitle:v19 style:1 handler:0];

  [v11 addAction:v20];
  [v11 setPreferredAction:v20];
  long long v21 = [(SBRootFolderViewPageManagementLayoutManager *)self alertPresentationViewController];
  [v21 presentViewController:v11 animated:1 completion:0];
}

uint64_t __104__SBRootFolderViewPageManagementLayoutManager_presentPageDeleteConfirmationAlertForIconView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v7 = SBHBundle();
  id v8 = [v7 localizedStringForKey:@"REMOVE_PAGE_BOOKMARKS_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  double v9 = SBHBundle();
  id v10 = [v9 localizedStringForKey:@"REMOVE_PAGE_BOOKMARKS_BODY" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  double v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  CGFloat v12 = (void *)MEMORY[0x1E4FB1410];
  BOOL v13 = SBHBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"REMOVE_PAGE_BUTTON" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__SBRootFolderViewPageManagementLayoutManager_presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView_completion___block_invoke;
  v22[3] = &unk_1E6AB2410;
  id v23 = v5;
  id v15 = v5;
  uint64_t v16 = [v12 actionWithTitle:v14 style:2 handler:v22];

  [v11 addAction:v16];
  CGPoint v17 = (void *)MEMORY[0x1E4FB1410];
  CGRect v18 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_1F2FA0300 table:@"SpringBoard"];
  char v20 = [v17 actionWithTitle:v19 style:1 handler:0];

  [v11 addAction:v20];
  [v11 setPreferredAction:v20];
  long long v21 = [(SBRootFolderViewPageManagementLayoutManager *)self alertPresentationViewController];
  [v21 presentViewController:v11 animated:1 completion:0];
}

uint64_t __124__SBRootFolderViewPageManagementLayoutManager_presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_allowsCloseBoxForIconView:(id)a3
{
  char v3 = [a3 icon];
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 listModel];
    char v7 = [v6 isHidden];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_updateCloseBoxVisibilityWithAnimation:(int64_t)a3
{
  id v5 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__SBRootFolderViewPageManagementLayoutManager__updateCloseBoxVisibilityWithAnimation___block_invoke;
  v6[3] = &unk_1E6AB2438;
  v6[4] = self;
  v6[5] = a3;
  [v5 enumerateIconViewsUsingBlock:v6];
}

void __86__SBRootFolderViewPageManagementLayoutManager__updateCloseBoxVisibilityWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setAllowsCloseBox:withAnimation:", objc_msgSend(v3, "_allowsCloseBoxForIconView:", v4), *(void *)(a1 + 40));
}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5 = a3;
  [v5 setStartsDragMoreQuickly:1];
  [v5 setDelegate:self];
  [v5 setEditingAnimationStrength:0.25];
  [v5 setAllowsCloseBox:0];
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = [a3 icon];
  id v5 = [(NSMapTable *)self->_iconViewControllersByIcon objectForKey:v4];

  return v5;
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self->_allowsEditing)
  {
    uint64_t v6 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
    int v24 = [v6 isPageManagementUIVisible];
    int v23 = [v6 isPageManagementUITransitioningOutOfVisible];
    BOOL v22 = [(SBRootFolderViewPageManagementLayoutManager *)self isTrackingActiveOrDroppingIconDrags];
    double v25 = [v5 icon];
    char v7 = -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:");
    id v8 = [v7 listBackgroundView];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v9 = [v5 gestureRecognizers];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      BOOL v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v15 state] == 1)
          {
            [v15 locationInView:v5];
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            [v8 bounds];
            v32.x = v17;
            v32.y = v19;
            BOOL v13 = CGRectContainsPoint(v33, v32);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }
    else
    {
      BOOL v13 = 1;
    }

    BOOL v20 = ((v24 ^ 1 | v23) & 1) == 0 && !v22 && v13;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (SBIconDragManager)iconDragManager
{
  iconDragManager = self->_iconDragManager;
  if (!iconDragManager)
  {
    id v4 = objc_alloc_init(SBIconDragManager);
    id v5 = self->_iconDragManager;
    self->_iconDragManager = v4;

    [(SBIconDragManager *)self->_iconDragManager setDelegate:self];
    iconDragManager = self->_iconDragManager;
  }
  return iconDragManager;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = [v4 icon];
  uint64_t v6 = SBHIconDragItemWithIconAndIconView(v5, v4, @"com.apple.SpringBoardHome.PageReordering");

  v9[0] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v8 = a5;
  double v9 = [a4 icon];
  uint64_t v10 = [v9 listModel];
  uint64_t v11 = [(NSMapTable *)self->_iconViewControllersByListModel objectForKey:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
  v13[3] = &unk_1E6AAC810;
  id v14 = v11;
  id v12 = v11;
  [v8 addAnimations:v13];

  [(SBRootFolderViewPageManagementLayoutManager *)self setDraggingIcon:v9];
}

uint64_t __112__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToggleButtonAlpha:0.0];
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  -[SBRootFolderViewPageManagementLayoutManager _updateCloseBoxVisibilityWithAnimation:](self, "_updateCloseBoxVisibilityWithAnimation:", 0, a4, a5, a6);
  if ([(SBRootFolderViewPageManagementLayoutManager *)self allowsPageHiding])
  {
    char v7 = [(NSMapTable *)self->_iconViewControllersByListModel objectEnumerator];
    id v8 = [v7 allObjects];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setToggleButtonAlpha:", 1.0, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6
{
  char v7 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  id v8 = [v7 folder];
  id v9 = [(SBRootFolderViewPageManagementLayoutManager *)self draggingIcon];
  uint64_t v10 = [(SBRootFolderViewPageManagementLayoutManager *)self rootListView];
  uint64_t v11 = [v10 model];
  uint64_t v12 = [v9 listModel];
  unint64_t v13 = [v8 indexOfList:v12];

  unint64_t v14 = [v11 indexForIcon:v9];
  long long v15 = [(SBRootFolderViewPageManagementLayoutManager *)self activeFocusMode];
  if ([v15 customizedHomeScreenPagesEnabled])
  {
    long long v16 = [v8 lists];
    CGRect v33 = (void *)[v16 copy];

    double v30 = v15;
    uint64_t v31 = v10;
    if (v14) {
      [v11 iconAtIndex:v14 - 1];
    }
    else {
    long long v17 = [v11 firstIcon];
    }
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v20 = v19;
      }
      else {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
    id v21 = v20;

    double v34 = v21;
    CGPoint v32 = v19;
    if (v21)
    {
      if (v14 + 1 >= [v11 numberOfIcons])
      {
        BOOL v22 = 0;
      }
      else
      {
        BOOL v22 = [v11 iconAtIndex:v14 + 1];
      }
      uint64_t v23 = objc_opt_class();
      id v24 = v22;
      if (v23)
      {
        if (objc_opt_isKindOfClass()) {
          double v25 = v24;
        }
        else {
          double v25 = 0;
        }
      }
      else
      {
        double v25 = 0;
      }
      id v26 = v25;

      if (v24)
      {
        long long v27 = [v26 listModel];
        uint64_t v28 = [v8 indexOfList:v27];

        unint64_t v14 = (__PAIR128__(v28, v13) - (unint64_t)v28) >> 64;
      }
      else
      {
        long long v29 = [v34 listModel];
        unint64_t v14 = [v8 indexOfList:v29];
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
    long long v15 = v30;
    uint64_t v10 = v31;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL) {
      [v8 moveListAtIndex:v13 toIndex:v14];
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __107__SBRootFolderViewPageManagementLayoutManager_iconDragManager_didPerformIconDrop_withIcons_inIconListView___block_invoke;
    v35[3] = &unk_1E6AAF030;
    id v36 = v8;
    [v33 enumerateObjectsWithOptions:2 * (v14 > v13) usingBlock:v35];
  }
  else if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 moveListAtIndex:v13 toIndex:v14];
  }
  if (objc_msgSend(v7, "iconListModelIndexForPageIndex:", objc_msgSend(v7, "currentPageIndex")) == v13) {
    objc_msgSend(v7, "setCurrentPageIndex:animated:", objc_msgSend(v7, "pageIndexForIconListModelIndex:", v14), 0);
  }
  [(SBRootFolderViewPageManagementLayoutManager *)self setDraggingIcon:0];
}

void __107__SBRootFolderViewPageManagementLayoutManager_iconDragManager_didPerformIconDrop_withIcons_inIconListView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ([v6 isHidden])
  {
    uint64_t v5 = [*(id *)(a1 + 32) indexOfList:v6];
    if (v5 != a3) {
      [*(id *)(a1 + 32) moveListAtIndex:v5 toIndex:a3];
    }
  }
}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  return ![(SBRootFolderViewPageManagementLayoutManager *)self isTrackingActiveOrDroppingIconDrags];
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(SBRootFolderViewPageManagementLayoutManager *)self presentPageDeleteConfirmationAlertForIconView:v5 completion:v6];
}

void __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) icon];
  int v3 = [*(id *)(a1 + 40) pageContainsBookmarkIcons:v2];
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke_2;
    v6[3] = &unk_1E6AACA90;
    void v6[4] = v5;
    id v7 = v4;
    [v5 presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView:v7 completion:v6];
  }
  else
  {
    [*(id *)(a1 + 40) _removePageIcon:v4];
  }
}

uint64_t __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePageIcon:*(void *)(a1 + 40)];
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  return 0;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8 = a6;
  id v9 = objc_msgSend(a5, "sbh_appDragLocalContext");
  uint64_t v10 = [v9 uniqueIdentifier];
  uint64_t v11 = [(SBRootFolderViewPageManagementLayoutManager *)self pageManagementListModel];
  uint64_t v12 = [v11 directlyContainedIconWithIdentifier:v10];
  uint64_t v13 = objc_opt_class();
  id v14 = v12;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }
  id v16 = v15;

  long long v17 = [v16 listModel];

  uint64_t v18 = [(NSMapTable *)self->_iconViewControllersByListModel objectForKey:v17];
  [v18 setToggleButtonAlpha:0.0];
  id v19 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke;
  v22[3] = &unk_1E6AAC810;
  id v23 = v18;
  id v20 = v18;
  [v19 animateWithDuration:v22 animations:0.2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke_2;
  v21[3] = &unk_1E6AACB50;
  v21[4] = self;
  [v8 addCompletion:v21];
}

uint64_t __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToggleButtonAlpha:1.0];
}

uint64_t __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloseBoxVisibilityWithAnimation:2];
}

- (BOOL)pageManagementCellViewControllerCanReceiveTap:(id)a3
{
  return 1;
}

- (void)pageManagementCellViewControllerDidReceiveTap:(id)a3
{
  id v4 = a3;
  id v9 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  id v5 = [v9 folder];
  id v6 = [v4 listView];

  id v7 = [v6 model];
  uint64_t v8 = [v5 indexOfList:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v9, "setCurrentPageIndex:animated:", objc_msgSend(v9, "pageIndexForIconListModelIndex:", v8), 0);
  }
  [v9 exitPageManagementUIWithCompletionHandler:0];
}

- (BOOL)pageManagementCellViewControllerShouldSuppressHighlight:(id)a3
{
  id v4 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  char v5 = [v4 isPageManagementUITransitioningOutOfVisible];
  id v6 = [(SBRootFolderViewPageManagementLayoutManager *)self latestActiveTransitionAnimator];
  [v6 fractionComplete];

  int v7 = BSFloatGreaterThanFloat();
  if (v7) {
    LOBYTE(v7) = BSFloatLessThanFloat();
  }
  char v8 = v5 | v7;

  return v8;
}

- (id)backgroundViewForSnapshotForPageManagementCellViewController:(id)a3
{
  id v4 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
  id v5 = [(SBRootFolderViewPageManagementLayoutManager *)self newCellBackgroundMaterialViewInFolderView:v4 initialWeighting:1.0];

  return v5;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4 = a4;
  id v5 = [[SBHPageManagementCellDragPreview alloc] initWithReferenceIconView:v4];
  [v4 iconImageCenter];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v4 window];
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  -[SBHPageManagementCellDragPreview setCenter:](v5, "setCenter:", v12, v14);
  return v5;
}

- (id)iconListViewForIndexPath:(id)a3
{
  return self->_rootListView;
}

- (id)iconViewQueryableForIconDragManager:(id)a3
{
  return self->_rootListView;
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  objc_msgSend(MEMORY[0x1E4FA5E78], "sharedInstance", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 emitEvent:56];
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([v5 isPlaceholder] & 1) == 0)
  {
    double v6 = [(SBRootFolderViewPageManagementLayoutManager *)self rootFolderView];
    double v7 = [v6 folder];
    uint64_t v8 = objc_opt_class();
    id v9 = v5;
    double v30 = v6;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    double v12 = [v7 ignoredList];
    long long v29 = v11;
    double v13 = [v11 listModel];
    double v14 = self;
    long long v15 = [v13 iconsOfClass:v14];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v21 isApplicationIcon]
            && [v12 isAllowedToContainIcon:v21])
          {
            [v12 addIcon:v21];
          }
          if (([v21 isWidgetIcon] & 1) != 0 || objc_msgSend(v21, "isBookmarkIcon"))
          {
            [v21 setUninstalled];
            [v21 completeUninstall];
            [v13 removeIcon:v21];
            BOOL v22 = [v7 model];
            [v22 removeIcon:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v18);
    }

    uint64_t v23 = objc_msgSend(v30, "iconListModelIndexForPageIndex:", objc_msgSend(v30, "currentPageIndex"));
    uint64_t v24 = [v7 indexOfList:v13];
    if (v23 <= v24)
    {
      if (v23 != v24)
      {
LABEL_27:
        [v7 removeList:v13];
        uint64_t v28 = [MEMORY[0x1E4FA5E78] sharedInstance];
        [v28 emitEvent:55];

        goto LABEL_28;
      }
      uint64_t v25 = [v30 firstIconPageIndex];
    }
    else
    {
      uint64_t v25 = [v30 pageIndexForIconListModelIndex:v23 - 1];
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v26 = SBLogCommon();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

        if (v27) {
          NSLog(&cfstr_NoPrecedingPag.isa);
        }
      }
    }
    [v30 setCurrentPageIndex:v25 animated:0];
    goto LABEL_27;
  }
LABEL_28:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_iconViewControllersByIcon;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        [v9 cancelGestures];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)dominoPivotAnimator:(id)a3 didLayOutIconView:(id)a4
{
  id v9 = a4;
  if ([(SBRootFolderViewPageManagementLayoutManager *)self layoutAction] == 1)
  {
    uint64_t v5 = [v9 icon];
    uint64_t v6 = [(NSMapTable *)self->_iconViewControllersByIcon objectForKey:v5];
    [v6 setScalesListView:1];
    uint64_t v7 = [v6 listBackgroundView];
    [v7 setWeighting:1.0];
    [v9 clearIconImageInfo];
    uint64_t v8 = [v6 view];
    [v8 layoutIfNeeded];
  }
}

- (SBRootFolderView)rootFolderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootFolderView);
  return (SBRootFolderView *)WeakRetained;
}

- (void)setRootFolderView:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (SBHFocusMode)activeFocusMode
{
  return self->_activeFocusMode;
}

- (NSURL)completionURL
{
  return self->_completionURL;
}

- (void)setCompletionURL:(id)a3
{
}

- (UIImageView)focusModeSymbolView
{
  return self->_focusModeSymbolView;
}

- (void)setFocusModeSymbolView:(id)a3
{
}

- (SBTitledHomeScreenButton)focusModeOptionsButton
{
  return self->_focusModeOptionsButton;
}

- (void)setFocusModeOptionsButton:(id)a3
{
}

- (SBIconListView)rootListView
{
  return self->_rootListView;
}

- (void)setRootListView:(id)a3
{
}

- (SBIconListModel)pageManagementListModel
{
  return self->_pageManagementListModel;
}

- (void)setPageManagementListModel:(id)a3
{
}

- (UIScrollView)pageManagementScrollView
{
  return self->_pageManagementScrollView;
}

- (void)setPageManagementScrollView:(id)a3
{
}

- (unint64_t)transitionCount
{
  return self->_transitionCount;
}

- (void)setTransitionCount:(unint64_t)a3
{
  self->_transitionCount = a3;
}

- (unint64_t)activeTransitionCount
{
  return self->_activeTransitionCount;
}

- (void)setActiveTransitionCount:(unint64_t)a3
{
  self->_activeTransitionCount = a3;
}

- (UIViewImplicitlyAnimating)latestActiveTransitionAnimator
{
  return self->_latestActiveTransitionAnimator;
}

- (void)setLatestActiveTransitionAnimator:(id)a3
{
}

- (int64_t)layoutAction
{
  return self->_layoutAction;
}

- (void)setLayoutAction:(int64_t)a3
{
  self->_layoutAction = a3;
}

- (int64_t)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(int64_t)a3
{
  self->_layoutConfiguration = a3;
}

- (UITapGestureRecognizer)backgroundTapGestureRecognizer
{
  return self->_backgroundTapGestureRecognizer;
}

- (void)setBackgroundTapGestureRecognizer:(id)a3
{
}

- (SBDockOffscreenFractionModifying)dockOffscreenAssertion
{
  return self->_dockOffscreenAssertion;
}

- (void)setDockOffscreenAssertion:(id)a3
{
}

- (BSInvalidatable)scrollAccessoryBorrowedAssertion
{
  return self->_scrollAccessoryBorrowedAssertion;
}

- (void)setScrollAccessoryBorrowedAssertion:(id)a3
{
}

- (BSInvalidatable)pageDotsVisibilityAssertion
{
  return self->_pageDotsVisibilityAssertion;
}

- (void)setPageDotsVisibilityAssertion:(id)a3
{
}

- (BOOL)allowsPageHiding
{
  return self->_allowsPageHiding;
}

- (void)setAllowsPageHiding:(BOOL)a3
{
  self->_allowsPageHiding = a3;
}

- (UIViewController)alertPresentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setAlertPresentationViewController:(id)a3
{
}

- (SBHPageManagementIcon)draggingIcon
{
  return self->_draggingIcon;
}

- (void)setDraggingIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingIcon, 0);
  objc_destroyWeak((id *)&self->_alertPresentationViewController);
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedAssertion, 0);
  objc_storeStrong((id *)&self->_dockOffscreenAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_latestActiveTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_pageManagementScrollView, 0);
  objc_storeStrong((id *)&self->_pageManagementListModel, 0);
  objc_storeStrong((id *)&self->_rootListView, 0);
  objc_storeStrong((id *)&self->_focusModeOptionsButton, 0);
  objc_storeStrong((id *)&self->_focusModeSymbolView, 0);
  objc_storeStrong((id *)&self->_completionURL, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_rootFolderView);
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_initialScalingAttributesByIconView, 0);
  objc_storeStrong((id *)&self->_pageIconsByListModel, 0);
  objc_storeStrong((id *)&self->_iconViewControllersByListModel, 0);
  objc_storeStrong((id *)&self->_iconViewControllersByIcon, 0);
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Adding %p as a child of page hiding page controller", (uint8_t *)&v2, 0xCu);
}

void __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Removing %p as a child of page hiding page controller", (uint8_t *)&v2, 0xCu);
}

@end