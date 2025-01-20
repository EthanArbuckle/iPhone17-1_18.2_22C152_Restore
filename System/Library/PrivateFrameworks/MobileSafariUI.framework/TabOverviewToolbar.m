@interface TabOverviewToolbar
- (BOOL)_canDisplaySearchBarAndSidebarButton;
- (BOOL)barButtonIsEnabled:(int64_t)a3;
- (BOOL)barButtonIsHidden:(int64_t)a3;
- (BOOL)contentBorrowed;
- (BOOL)isBackgroundHidden;
- (BOOL)shouldReserveSpaceForSidebarButton;
- (CGRect)rectForBarButton:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TabOverviewToolbar)initWithFrame:(CGRect)a3;
- (UISearchBar)searchBar;
- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4;
- (double)searchBarLeadingMargin;
- (id)_buttonForBarButton:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)menuForBarButton:(int64_t)a3;
- (id)resolvedTintColorForBarButton:(int64_t)a3;
- (id)snapshotBarContentsAfterScreenUpdates:(BOOL)a3;
- (id)toolbarContentViewForCapsuleCollectionView:(id)a3;
- (int64_t)placement;
- (int64_t)tabGroupButtonDisplayStyle;
- (void)_layoutForBottomPlacement;
- (void)_layoutForTopPlacement;
- (void)_resizeItemsIfNeeded;
- (void)_setNeedsResizeItems;
- (void)addInteraction:(id)a3 toBarButton:(int64_t)a4;
- (void)addPrimaryAction:(id)a3 forBarButton:(int64_t)a4;
- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4;
- (void)layoutSubviews;
- (void)removeInteraction:(id)a3 fromBarButton:(int64_t)a4;
- (void)removePrimaryAction:(id)a3 forBarButton:(int64_t)a4;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setBarButton:(int64_t)a3 enabled:(BOOL)a4;
- (void)setBarButton:(int64_t)a3 hidden:(BOOL)a4;
- (void)setMenu:(id)a3 forBarButton:(int64_t)a4;
- (void)setPlacement:(int64_t)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchBarLeadingMargin:(double)a3;
- (void)setShouldReserveSpaceForSidebarButton:(BOOL)a3;
- (void)setShowingSearchCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setTabGroupButtonConfiguration:(id)a3;
- (void)setTabGroupButtonDisplayStyle:(int64_t)a3;
- (void)setTabGroupButtonTitle:(id)a3;
@end

@implementation TabOverviewToolbar

- (TabOverviewToolbar)initWithFrame:(CGRect)a3
{
  v43.receiver = self;
  v43.super_class = (Class)TabOverviewToolbar;
  v3 = -[TabOverviewToolbar initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v6 = [v4 initWithEffect:v5];
    background = v3->_background;
    v3->_background = (UIVisualEffectView *)v6;

    [(TabOverviewToolbar *)v3 bounds];
    -[UIVisualEffectView setFrame:](v3->_background, "setFrame:");
    [(UIVisualEffectView *)v3->_background setAutoresizingMask:18];
    [(TabOverviewToolbar *)v3 addSubview:v3->_background];
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(TabOverviewToolbar *)v3 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    contentContainer = v3->_contentContainer;
    v3->_contentContainer = (UIView *)v9;

    [(UIView *)v3->_contentContainer setAutoresizingMask:0];
    [(TabOverviewToolbar *)v3 addSubview:v3->_contentContainer];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(TabOverviewToolbar *)v3 addInteraction:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4FB1F78]);
    [(TabOverviewToolbar *)v3 addInteraction:v12];

    v13 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    uint64_t v14 = +[BarButton buttonWithConfiguration:v13 primaryAction:0];
    tabGroupButton = v3->_tabGroupButton;
    v3->_tabGroupButton = (BarButton *)v14;

    [(BarButton *)v3->_tabGroupButton setEnabled:0];
    [(BarButton *)v3->_tabGroupButton setExclusiveTouch:1];
    [(BarButton *)v3->_tabGroupButton setShouldRespectContextMenuOrdering:1];
    [(BarButton *)v3->_tabGroupButton sf_configureLargeContentViewerForBarItem:2];
    [(BarButton *)v3->_tabGroupButton sizeToFit];
    [(UIView *)v3->_contentContainer addSubview:v3->_tabGroupButton];
    v16 = [(BarButton *)v3->_tabGroupButton titleLabel];
    [v16 setAccessibilityIdentifier:@"TabGroupTitleField"];

    uint64_t v17 = +[BarButton buttonWithType:1];
    addTabButton = v3->_addTabButton;
    v3->_addTabButton = (BarButton *)v17;

    v19 = _SFAccessibilityIdentifierForBarItem();
    [(BarButton *)v3->_addTabButton setAccessibilityIdentifier:v19];

    [(BarButton *)v3->_addTabButton setExclusiveTouch:1];
    v20 = v3->_addTabButton;
    v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
    [(BarButton *)v20 setImage:v21 forState:0];

    [(BarButton *)v3->_addTabButton sf_configureLargeContentViewerForBarItem:7];
    [(BarButton *)v3->_addTabButton sizeToFit];
    uint64_t v22 = *MEMORY[0x1E4FB28C8];
    v23 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    [(BarButton *)v3->_addTabButton setPreferredSymbolConfiguration:v23 forImageInState:0];
    [(UIView *)v3->_contentContainer addSubview:v3->_addTabButton];
    uint64_t v24 = +[BarButton buttonWithType:1];
    doneButton = v3->_doneButton;
    v3->_doneButton = (BarButton *)v24;

    [(BarButton *)v3->_doneButton setExclusiveTouch:1];
    v26 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:symbolicTraits:", v22, 2);
    v27 = [(BarButton *)v3->_doneButton titleLabel];
    [v27 setFont:v26];

    v28 = [(BarButton *)v3->_doneButton titleLabel];
    [v28 setAdjustsFontForContentSizeCategory:1];

    [(BarButton *)v3->_doneButton setAccessibilityIdentifier:@"TabViewDoneButton"];
    v29 = _WBSLocalizedString();
    [(BarButton *)v3->_doneButton setTitle:v29 forState:0];
    [(BarButton *)v3->_doneButton sf_configureLargeContentViewerWithImage:0 title:v29];
    [(BarButton *)v3->_doneButton sizeToFit];
    [(UIView *)v3->_contentContainer addSubview:v3->_doneButton];
    uint64_t v30 = +[BarButton buttonWithType:1];
    cancelSearchButton = v3->_cancelSearchButton;
    v3->_cancelSearchButton = (BarButton *)v30;

    [(BarButton *)v3->_cancelSearchButton setExclusiveTouch:1];
    v32 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v22];
    v33 = [(BarButton *)v3->_cancelSearchButton titleLabel];
    [v33 setFont:v32];

    v34 = [(BarButton *)v3->_cancelSearchButton titleLabel];
    [v34 setAdjustsFontForContentSizeCategory:1];

    v35 = _WBSLocalizedString();
    [(BarButton *)v3->_cancelSearchButton setTitle:v35 forState:0];
    [(BarButton *)v3->_cancelSearchButton sf_configureLargeContentViewerWithImage:0 title:v35];
    [(BarButton *)v3->_cancelSearchButton sizeToFit];
    [(BarButton *)v3->_cancelSearchButton setAlpha:0.0];
    [(UIView *)v3->_contentContainer addSubview:v3->_cancelSearchButton];
    v36 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    toolbarSeparator = v3->_toolbarSeparator;
    v3->_toolbarSeparator = v36;

    v38 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v3->_toolbarSeparator setBackgroundColor:v38];

    [(UIView *)v3->_toolbarSeparator setUserInteractionEnabled:0];
    [(UIView *)v3->_contentContainer addSubview:v3->_toolbarSeparator];
    [(UIView *)v3->_contentContainer sf_applyContentSizeCategoryLimitsForToolbarButton];
    v39 = objc_msgSend(MEMORY[0x1E4FB1E20], "safari_traitsAffectingTextAppearance");
    id v40 = (id)[(TabOverviewToolbar *)v3 registerForTraitChanges:v39 withTarget:v3 action:sel__setNeedsResizeItems];

    v41 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TabOverviewToolbar;
  [(TabOverviewToolbar *)&v5 layoutSubviews];
  if (!self->_contentBorrowed)
  {
    [(TabOverviewToolbar *)self bounds];
    -[UIView setFrame:](self->_contentContainer, "setFrame:");
  }
  [(TabOverviewToolbar *)self _resizeItemsIfNeeded];
  int64_t placement = self->_placement;
  if (placement)
  {
    if (placement == 1) {
      [(TabOverviewToolbar *)self _layoutForBottomPlacement];
    }
  }
  else
  {
    [(TabOverviewToolbar *)self _layoutForTopPlacement];
  }
  BOOL v4 = self->_backgroundHidden || self->_contentBorrowed;
  [(UIView *)self->_toolbarSeparator setHidden:v4];
  [(UIVisualEffectView *)self->_background setHidden:v4];
}

- (void)_layoutForTopPlacement
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  [(TabOverviewToolbar *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  int v9 = [(TabOverviewToolbar *)self _sf_usesLeftToRightLayout];
  [(TabOverviewToolbar *)self bounds];
  CGFloat v14 = v12;
  if (v4 == 0.0) {
    double v15 = 3.0;
  }
  else {
    double v15 = 0.0;
  }
  double v93 = v15;
  CGFloat v99 = v11;
  CGFloat v100 = v10;
  CGFloat rect = v13;
  double v94 = v4;
  double v16 = v4 + v15 + -3.0 + (CGRectGetHeight(*(CGRect *)&v10) - v4) * 0.5;
  if (self->_sidebarButton) {
    double v17 = v16 + 3.0;
  }
  else {
    double v17 = v16;
  }
  [(BarButton *)self->_doneButton bounds];
  double v91 = v8;
  double v92 = v6;
  double v98 = v17;
  _SFRoundRectToPixels();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  -[BarButton setFrame:](self->_doneButton, "setFrame:");
  [(BarButton *)self->_addTabButton bounds];
  CGFloat v89 = v21;
  CGFloat v90 = v19;
  CGFloat v87 = v25;
  CGFloat v88 = v23;
  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  if (v9) {
    CGRectGetMinX(*(CGRect *)&v26);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v26);
  }
  _SFRoundRectToPixels();
  double v31 = v30;
  CGFloat v86 = v32;
  CGFloat v96 = v33;
  CGFloat v97 = v34;
  -[BarButton setFrame:](self->_addTabButton, "setFrame:");
  [(BarButton *)self->_sidebarButton bounds];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  [(TabOverviewToolbar *)self directionalLayoutMargins];
  double v44 = fmax(v43, 20.0);
  CGFloat v85 = v31;
  if ((v9 & 1) == 0)
  {
    v109.origin.y = v99;
    v109.origin.x = v100;
    v109.size.width = v14;
    v109.size.height = rect;
    double Width = CGRectGetWidth(v109);
    v110.origin.x = v36;
    v110.origin.y = v38;
    v110.size.width = v40;
    v110.size.height = v42;
    double v44 = Width - CGRectGetWidth(v110) - v44;
  }
  v111.origin.x = v44;
  v111.origin.y = v38;
  v111.size.width = v40;
  v111.size.height = v42;
  double v46 = v98 + CGRectGetHeight(v111) * -0.5;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_sidebarButton, "setFrame:");
  v112.origin.y = v99;
  v112.origin.x = v100;
  v112.size.width = v14;
  v112.size.height = rect;
  double v47 = CGRectGetWidth(v112);
  v113.origin.x = v86;
  v113.origin.y = v96;
  v113.size.height = v97;
  v113.size.width = v85;
  double v48 = v47 - CGRectGetWidth(v113);
  v114.origin.y = v89;
  v114.origin.x = v90;
  v114.size.height = v87;
  v114.size.width = v88;
  double v49 = v48 - CGRectGetWidth(v114);
  v115.origin.x = v44;
  v115.origin.y = v46;
  v115.size.width = v40;
  v115.size.height = v42;
  fmin(fmin(v49 - CGRectGetWidth(v115) - self->_searchBarMinimumWidth + -180.0, self->_tabGroupButtonPreferredWidth), 350.0);
  [(BarButton *)self->_tabGroupButton frame];
  CGFloat v50 = v86;
  CGFloat v51 = v96;
  CGFloat v52 = v97;
  CGFloat v53 = v85;
  if (v9) {
    CGRectGetMinX(*(CGRect *)&v50);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v50);
  }
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_tabGroupButton, "setFrame:");
  [(BarButton *)self->_tabGroupButton setNeedsLayout];
  [(BarButton *)self->_cancelSearchButton bounds];
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_cancelSearchButton, "setFrame:");
  double searchBarLeadingMargin = self->_searchBarLeadingMargin;
  sidebarButton = self->_sidebarButton;
  if (sidebarButton
    && (self->_shouldReserveSpaceForSidebarButton || ([(BarButton *)sidebarButton isHidden] & 1) == 0))
  {
    if (v9)
    {
      v116.origin.y = v46;
      v116.origin.x = v44;
      v116.size.width = v40;
      v116.size.height = v42;
      double MaxX = CGRectGetMaxX(v116);
    }
    else
    {
      v117.origin.y = v99;
      v117.origin.x = v100;
      v117.size.width = v14;
      v117.size.height = rect;
      double v57 = CGRectGetWidth(v117);
      v118.origin.y = v46;
      v118.origin.x = v44;
      v118.size.width = v40;
      v118.size.height = v42;
      double MaxX = v57 - CGRectGetMinX(v118);
    }
    double searchBarLeadingMargin = searchBarLeadingMargin + fmax(MaxX + 30.0 - searchBarLeadingMargin, 0.0);
  }
  double v58 = fmax(searchBarLeadingMargin, fmax(v92, v91));
  [(BarButton *)self->_tabGroupButton bounds];
  double v59 = CGRectGetWidth(v119);
  [(BarButton *)self->_addTabButton bounds];
  double v60 = v59 + CGRectGetWidth(v120);
  [(BarButton *)self->_doneButton bounds];
  double v61 = v60 + CGRectGetWidth(v121) + 60.0;
  v122.origin.y = v99;
  v122.origin.x = v100;
  v122.size.width = v14;
  v122.size.height = rect;
  double v62 = CGRectGetWidth(v122) + v58 * -2.0 + -30.0 - v61;
  v63 = self->_sidebarButton;
  if (v63)
  {
    [(BarButton *)v63 bounds];
    double v62 = v62 - (CGRectGetWidth(v123) + 30.0);
  }
  double v64 = fmax(self->_searchBarMinimumWidth, fmin(v62, 371.0));
  if ((v9 & 1) == 0)
  {
    v124.origin.y = v99;
    v124.origin.x = v100;
    v124.size.width = v14;
    v124.size.height = rect;
    double v58 = CGRectGetWidth(v124) - v58 - v64;
  }
  if (self->_sidebarButton) {
    double v65 = v94 + v93 + -6.0 + 3.0;
  }
  else {
    double v65 = v94 + v93 + -6.0;
  }
  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v58, v65, v64, v66);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  addTabButton = self->_addTabButton;
  v106[0] = self->_doneButton;
  v106[1] = addTabButton;
  cancelSearchButton = self->_cancelSearchButton;
  v106[2] = self->_tabGroupButton;
  v106[3] = cancelSearchButton;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:4];
  uint64_t v70 = [v69 countByEnumeratingWithState:&v102 objects:v107 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v103;
    double v73 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v103 != v72) {
          objc_enumerationMutation(v69);
        }
        [*(id *)(*((void *)&v102 + 1) + 8 * i) bounds];
        double v73 = fmax(v73, CGRectGetHeight(v125));
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v102 objects:v107 count:16];
    }
    while (v71);
  }
  else
  {
    double v73 = 0.0;
  }

  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __44__TabOverviewToolbar__layoutForTopPlacement__block_invoke;
  v101[3] = &__block_descriptor_40_e22_v24__0__BarButton_8Q16l;
  *(double *)&v101[4] = v73;
  uint64_t v75 = MEMORY[0x1E4E42950](v101);
  v76 = (void *)v75;
  if (v9) {
    uint64_t v77 = 2;
  }
  else {
    uint64_t v77 = 8;
  }
  v78 = (void (**)(void *, BarButton *, uint64_t))(v75 + 16);
  if (v9) {
    uint64_t v79 = 8;
  }
  else {
    uint64_t v79 = 2;
  }
  (*(void (**)(uint64_t, BarButton *, uint64_t))(v75 + 16))(v75, self->_doneButton, v77);
  (*v78)(v76, self->_addTabButton, 10);
  (*v78)(v76, self->_tabGroupButton, v79);
  (*v78)(v76, self->_cancelSearchButton, 0);
  v126.origin.x = v100;
  v126.origin.y = v99;
  v126.size.width = v14;
  v126.size.height = rect;
  double Height = CGRectGetHeight(v126);
  _SFOnePixel();
  double v82 = Height - v81;
  v127.origin.x = v100;
  v127.origin.y = v99;
  v127.size.width = v14;
  v127.size.height = rect;
  double v83 = CGRectGetWidth(v127);
  _SFOnePixel();
  -[UIView setFrame:](self->_toolbarSeparator, "setFrame:", 0.0, v82, v83, v84);
}

void __44__TabOverviewToolbar__layoutForTopPlacement__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  UIEdgeInsetsMakeWithEdges();
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  CGRectGetHeight(v16);
  UIEdgeInsetsMakeWithEdges();
  UIEdgeInsetsMin();
  objc_msgSend(v14, "setBarButtonHitRect:", v3 + v13, v5 + v10, v7 - (v13 + v11), v9 - (v10 + v12));
}

- (void)_layoutForBottomPlacement
{
  [(TabOverviewToolbar *)self safeAreaInsets];
  double v4 = v3;
  int v5 = [(TabOverviewToolbar *)self _sf_usesLeftToRightLayout];
  [(TabOverviewToolbar *)self bounds];
  CGFloat rect = v9;
  double v10 = 6.0;
  if (v4 <= 0.0) {
    double v10 = 0.0;
  }
  CGFloat v64 = v7;
  CGFloat v66 = v6;
  double v11 = v6 + 0.0;
  double v12 = v10 + v7;
  CGFloat v62 = v8;
  double v13 = v8 - (v4 + v10);
  [(BarButton *)self->_addTabButton bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v73 = v15;
  if (v5)
  {
    CGFloat v20 = v15;
    double v21 = 20.0;
  }
  else
  {
    CGFloat v22 = v14;
    v76.origin.x = v11;
    v76.origin.y = v12;
    v76.size.width = rect;
    v76.size.height = v13;
    double Width = CGRectGetWidth(v76);
    v77.origin.x = v22;
    v77.origin.y = v17;
    v77.size.width = v73;
    v77.size.height = v19;
    double v24 = Width - CGRectGetWidth(v77);
    CGFloat v20 = v73;
    double v21 = v24 + -20.0;
  }
  v78.origin.x = v11;
  v78.origin.y = v12;
  v78.size.width = rect;
  v78.size.height = v13;
  double MidY = CGRectGetMidY(v78);
  v79.origin.x = v21;
  v79.origin.y = v17;
  v79.size.width = v20;
  v79.size.height = v19;
  double v67 = MidY + CGRectGetHeight(v79) * -0.5;
  double v68 = v19;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_addTabButton, "setFrame:");
  [(BarButton *)self->_doneButton bounds];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v71 = v31;
  CGFloat v72 = v30;
  double v32 = 20.0;
  double v33 = 20.0;
  if (v5)
  {
    v80.origin.x = v11;
    v80.origin.y = v12;
    v80.size.width = rect;
    v80.size.height = v13;
    double v34 = CGRectGetWidth(v80);
    v81.origin.x = v27;
    v81.origin.y = v29;
    v81.size.height = v71;
    v81.size.width = v72;
    double v33 = v34 - CGRectGetWidth(v81) + -20.0;
    double v32 = v21;
  }
  double v61 = v32;
  v82.origin.x = v11;
  v82.origin.y = v12;
  v82.size.width = rect;
  v82.size.height = v13;
  double v35 = CGRectGetMidY(v82);
  v83.origin.x = v33;
  v83.origin.y = v29;
  CGFloat v70 = v11;
  v83.size.width = v72;
  v83.size.height = v71;
  CGFloat v69 = v12;
  CGFloat v36 = v35 - CGRectGetHeight(v83) * 0.5;
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_doneButton, "setFrame:");
  v84.origin.y = v64;
  v84.origin.x = v66;
  v84.size.width = rect;
  v84.size.height = v62;
  double v37 = CGRectGetWidth(v84);
  v85.origin.x = v21;
  v85.origin.y = v67;
  v85.size.height = v19;
  v85.size.width = v73;
  double v38 = v37 - CGRectGetWidth(v85);
  v86.origin.x = v33;
  double v63 = v36;
  v86.origin.y = v36;
  v86.size.width = v72;
  v86.size.height = v71;
  double v39 = v38 - CGRectGetWidth(v86) + -80.0;
  [(BarButton *)self->_tabGroupButton bounds];
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  v87.origin.y = v69;
  v87.origin.x = v11;
  v87.size.width = rect;
  v87.size.height = v13;
  double v48 = CGRectGetMidY(v87);
  v88.origin.x = v41;
  v88.origin.y = v43;
  v88.size.width = v45;
  CGFloat v65 = v47;
  v88.size.height = v47;
  double v49 = v48 - CGRectGetHeight(v88) * 0.5;
  if (self->_tabGroupButtonPreferredWidth >= v39)
  {
    if (v5) {
      double v54 = v68;
    }
    else {
      double v54 = v71;
    }
    if (v5) {
      double v55 = v73;
    }
    else {
      double v55 = v72;
    }
    double v56 = v67;
    if (!v5) {
      double v56 = v63;
    }
    double v57 = v61;
    CGRectGetMaxX(*(CGRect *)(&v54 - 3));
    CGFloat v52 = rect;
    CGFloat v53 = v13;
    CGFloat v51 = v69;
    CGFloat v50 = v70;
  }
  else
  {
    CGFloat v51 = v69;
    CGFloat v50 = v70;
    v89.origin.x = v70;
    v89.origin.y = v69;
    v89.size.width = rect;
    v89.size.height = v13;
    CGRectGetWidth(v89);
    v90.origin.x = v41;
    v90.origin.y = v49;
    v90.size.width = v45;
    v90.size.height = v65;
    CGRectGetWidth(v90);
    CGFloat v52 = rect;
    CGFloat v53 = v13;
  }
  _SFRoundRectToPixels();
  -[BarButton setFrame:](self->_tabGroupButton, "setFrame:");
  v91.origin.x = v50;
  v91.origin.y = v51;
  v91.size.width = v52;
  v91.size.height = v53;
  double v58 = CGRectGetWidth(v91);
  _SFOnePixel();
  toolbarSeparator = self->_toolbarSeparator;
  -[UIView setFrame:](toolbarSeparator, "setFrame:", 0.0, 0.0, v58, v59);
}

- (void)_setNeedsResizeItems
{
  self->_needsResizeItems = 1;
  [(TabOverviewToolbar *)self setNeedsLayout];
}

- (void)_resizeItemsIfNeeded
{
  if (self->_needsResizeItems)
  {
    id v9 = [(UISearchBar *)self->_searchBar text];
    [(UISearchBar *)self->_searchBar setText:&stru_1F3C268E8];
    double v3 = [(UISearchBar *)self->_searchBar searchField];
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
    self->_searchBarMinimumdouble Width = v6;

    [(UISearchBar *)self->_searchBar setText:v9];
    [(BarButton *)self->_doneButton sizeToFit];
    [(BarButton *)self->_addTabButton sizeToFit];
    [(BarButton *)self->_cancelSearchButton sizeToFit];
    [(BarButton *)self->_sidebarButton sizeToFit];
    -[BarButton sizeThatFits:](self->_tabGroupButton, "sizeThatFits:", v4, v5);
    -[BarButton setBounds:](self->_tabGroupButton, "setBounds:", 0.0, 0.0, v7, v8);
    [(BarButton *)self->_tabGroupButton bounds];
    self->_tabGroupButtonPreferreddouble Width = CGRectGetWidth(v11);
    [(BarButton *)self->_cancelSearchButton sizeToFit];
    self->_needsResizeItems = 0;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(TabOverviewToolbar *)self isUserInteractionEnabled]
    && ([(TabOverviewToolbar *)self bounds], v42.x = x, v42.double y = y, CGRectContainsPoint(v44, v42)))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v8 = [(UIView *)self->_contentContainer subviews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      CGRect v11 = 0;
      uint64_t v12 = *(void *)v36;
      double v34 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v8);
          }
          double v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v14 alpha];
          if (v15 > 0.0 && ([v14 isHidden] & 1) == 0)
          {
            if ([v14 isUserInteractionEnabled])
            {
              [v14 frame];
              CGFloat v16 = v45.origin.x;
              CGFloat v17 = v45.origin.y;
              CGFloat width = v45.size.width;
              CGFloat height = v45.size.height;
              CGFloat v20 = fmin((CGRectGetWidth(v45) + -44.0) * 0.5, 0.0);
              v46.origin.double x = v16;
              v46.origin.double y = v17;
              v46.size.CGFloat width = width;
              v46.size.CGFloat height = height;
              CGFloat v21 = fmin((CGRectGetHeight(v46) + -44.0) * 0.5, 0.0);
              v47.origin.double x = v16;
              v47.origin.double y = v17;
              v47.size.CGFloat width = width;
              v47.size.CGFloat height = height;
              CGRect v48 = CGRectInset(v47, v20, v21);
              CGFloat v22 = v48.origin.x;
              CGFloat v23 = v48.origin.y;
              CGFloat v24 = v48.size.width;
              CGFloat v25 = v48.size.height;
              v43.double x = x;
              v43.double y = y;
              if (CGRectContainsPoint(v48, v43))
              {
                v49.origin.double x = v22;
                v49.origin.double y = v23;
                v49.size.CGFloat width = v24;
                v49.size.CGFloat height = v25;
                double v26 = vabdd_f64(x, CGRectGetMinX(v49));
                v50.origin.double x = v22;
                v50.origin.double y = v23;
                v50.size.CGFloat width = v24;
                v50.size.CGFloat height = v25;
                double v27 = fmin(v26, vabdd_f64(x, CGRectGetMaxX(v50)));
                if (v27 < v34)
                {
                  id v28 = v14;

                  double v34 = v27;
                  CGRect v11 = v28;
                }
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);

      if (v11)
      {
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
        uint64_t v29 = objc_msgSend(v11, "hitTest:withEvent:", v7);
        double v30 = (void *)v29;
        if (v29) {
          double v31 = (void *)v29;
        }
        else {
          double v31 = v11;
        }
        double v32 = v31;

        goto LABEL_22;
      }
    }
    else
    {
    }
    double v32 = self;
  }
  else
  {
    double v32 = 0;
  }
LABEL_22:

  return v32;
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
}

- (void)setPlacement:(int64_t)a3
{
  if (self->_placement != a3)
  {
    self->_int64_t placement = a3;
    if ([(TabOverviewToolbar *)self _canDisplaySearchBarAndSidebarButton])
    {
      if (self->_searchBar) {
        -[UIView addSubview:](self->_contentContainer, "addSubview:");
      }
      if (self->_sidebarButton) {
        -[UIView addSubview:](self->_contentContainer, "addSubview:");
      }
    }
    else
    {
      [(UISearchBar *)self->_searchBar removeFromSuperview];
      [(BarButton *)self->_sidebarButton removeFromSuperview];
    }
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
}

- (void)setShouldReserveSpaceForSidebarButton:(BOOL)a3
{
  if (self->_shouldReserveSpaceForSidebarButton != a3)
  {
    self->_shouldReserveSpaceForSidebarButton = a3;
    if (self->_searchBar)
    {
      if ([(TabOverviewToolbar *)self _canDisplaySearchBarAndSidebarButton])
      {
        [(TabOverviewToolbar *)self setNeedsLayout];
      }
    }
  }
}

- (BOOL)_canDisplaySearchBarAndSidebarButton
{
  return self->_placement == 0;
}

- (id)_buttonForBarButton:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *off_1E6D7F0A0[a3]);
  }
  return (id)(id)a2;
}

- (void)setMenu:(id)a3 forBarButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TabOverviewToolbar *)self _buttonForBarButton:a4];
  [v7 setMenu:v6];
}

- (id)menuForBarButton:(int64_t)a3
{
  uint64_t v3 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  double v4 = [v3 menu];

  return v4;
}

- (void)setTabGroupButtonTitle:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(ToolbarItemConfiguration);
  [(ToolbarItemConfiguration *)v5 setTitle:v4];

  [(TabOverviewToolbar *)self setTabGroupButtonConfiguration:v5];
}

- (void)setTabGroupButtonConfiguration:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 buttonConfigurationWithStyle:self->_tabGroupButtonDisplayStyle];
  [(BarButton *)self->_tabGroupButton setConfiguration:v5];

  id v6 = [v4 accessibilityIdentifier];

  id v7 = _SFAccessibilityIdentifierForBarItem();
  if (v6)
  {
    CGRect v11 = @"Profile";
    double v8 = [v4 accessibilityIdentifier];
    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v10 = WBSMakeAccessibilityIdentifier();
    [(BarButton *)self->_tabGroupButton setAccessibilityIdentifier:v10];
  }
  else
  {
    [(BarButton *)self->_tabGroupButton setAccessibilityIdentifier:v7];
  }

  self->_needsResizeItems = 1;
  [(TabOverviewToolbar *)self setNeedsLayout];
}

- (void)setBarButton:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  [v5 setEnabled:v4];
}

- (BOOL)barButtonIsEnabled:(int64_t)a3
{
  uint64_t v3 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)setBarButton:(int64_t)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  -[TabOverviewToolbar _buttonForBarButton:](self, "_buttonForBarButton:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  int v7 = [v9 isHidden];
  [v9 setHidden:v4];
  if (!v4)
  {
    double v8 = [v9 configurationUpdateHandler];

    if (v8) {
      [v9 setNeedsUpdateConfiguration];
    }
  }
  if (a3 == 4
    && v7 != v4
    && [(TabOverviewToolbar *)self _canDisplaySearchBarAndSidebarButton])
  {
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
}

- (BOOL)barButtonIsHidden:(int64_t)a3
{
  uint64_t v3 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  char v4 = [v3 isHidden];

  return v4;
}

- (void)setShowingSearchCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  [(BarButton *)self->_cancelSearchButton alpha];
  if ((((v7 <= 0.0) ^ v5) & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke;
    v14[3] = &unk_1E6D781E8;
    v14[4] = self;
    BOOL v15 = v5;
    double v8 = (void (**)(void))MEMORY[0x1E4E42950](v14);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke_2;
    v12[3] = &unk_1E6D781E8;
    BOOL v13 = v5;
    v12[4] = self;
    id v9 = (void (**)(void))MEMORY[0x1E4E42950](v12);
    if (!a4)
    {
      v8[2](v8);
      v9[2](v9);
    }
    if (v5) {
      double v10 = 0.1;
    }
    else {
      double v10 = 0.0;
    }
    if (v5) {
      double v11 = 0.0;
    }
    else {
      double v11 = 0.1;
    }
    [MEMORY[0x1E4FB1EB0] animateWithDuration:327686 delay:v8 options:0 animations:0.35 completion:v10];
    [MEMORY[0x1E4FB1EB0] animateWithDuration:327686 delay:v9 options:0 animations:0.35 completion:v11];
  }
}

uint64_t __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __60__TabOverviewToolbar_setShowingSearchCancelButton_animated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:v2];
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:v2];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 472);
  return [v3 setAlpha:v2];
}

- (void)setSearchBarLeadingMargin:(double)a3
{
  if (self->_searchBarLeadingMargin != a3)
  {
    self->_double searchBarLeadingMargin = a3;
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
}

- (void)addPrimaryAction:(id)a3 forBarButton:(int64_t)a4
{
  id v9 = a3;
  if (a4 == 4 && !self->_sidebarButton)
  {
    id v6 = +[BarButton sidebarButtonWithPrimaryAction:0];
    sidebarButton = self->_sidebarButton;
    self->_sidebarButton = v6;

    if ([(TabOverviewToolbar *)self _canDisplaySearchBarAndSidebarButton])
    {
      [(UIView *)self->_contentContainer addSubview:self->_sidebarButton];
      self->_needsResizeItems = 1;
    }
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
  double v8 = [(TabOverviewToolbar *)self _buttonForBarButton:a4];
  [v8 addAction:v9 forControlEvents:0x2000];
}

- (void)removePrimaryAction:(id)a3 forBarButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TabOverviewToolbar *)self _buttonForBarButton:a4];
  [v7 removeAction:v6 forControlEvents:0x2000];
}

- (void)addInteraction:(id)a3 toBarButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TabOverviewToolbar *)self _buttonForBarButton:a4];
  [v7 addInteraction:v6];
}

- (void)removeInteraction:(id)a3 fromBarButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TabOverviewToolbar *)self _buttonForBarButton:a4];
  [v7 removeInteraction:v6];
}

- (CGRect)rectForBarButton:(int64_t)a3
{
  uint64_t v3 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)resolvedTintColorForBarButton:(int64_t)a3
{
  uint64_t v3 = [(TabOverviewToolbar *)self _buttonForBarButton:a3];
  double v4 = [v3 tintColor];
  double v5 = [v3 traitCollection];
  double v6 = [v4 resolvedColorWithTraitCollection:v5];

  return v6;
}

- (void)setSearchBar:(id)a3
{
  id v6 = a3;
  double v5 = self->_searchBar;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchBar, a3);
    if ([(UISearchBar *)v5 isDescendantOfView:self]) {
      [(UISearchBar *)v5 removeFromSuperview];
    }
    if (v6 && [(TabOverviewToolbar *)self _canDisplaySearchBarAndSidebarButton])
    {
      [(UIView *)self->_contentContainer addSubview:v6];
      [(TabOverviewToolbar *)self setNeedsLayout];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int64_t placement = self->_placement;
  switch(placement)
  {
    case 2:
      CGFloat Width = *MEMORY[0x1E4F1DB30];
      double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
    case 1:
      [(TabOverviewToolbar *)self bounds];
      CGFloat Width = CGRectGetWidth(v31);
      double v14 = *MEMORY[0x1E4F78698];
      double v15 = [(TabOverviewToolbar *)self superview];
      [v15 safeAreaInsets];
      double v16 = 0.0;
      if (v17 > 0.0) {
        double v16 = 6.0;
      }
      double v3 = v14 + v16;

      break;
    case 0:
      [(TabOverviewToolbar *)self _resizeItemsIfNeeded];
      [(UISearchBar *)self->_searchBar bounds];
      double Height = CGRectGetHeight(v28);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      doneButton = self->_doneButton;
      v24[0] = self->_addTabButton;
      v24[1] = doneButton;
      v24[2] = self->_tabGroupButton;
      double v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 3, 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * v13) bounds];
            double Height = fmax(Height, CGRectGetHeight(v29));
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      [(TabOverviewToolbar *)self bounds];
      CGFloat Width = CGRectGetWidth(v30);
      double v3 = fmax(Height + 0.0 + -6.0, 44.0);
      break;
  }
  double v18 = Width;
  double v19 = v3;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (id)snapshotBarContentsAfterScreenUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB1F00]);
  [(TabOverviewToolbar *)self bounds];
  id v6 = objc_msgSend(v5, "initWithFrame:");
  double v7 = [(UIVisualEffectView *)self->_background effect];
  [v6 setEffect:v7];

  double v8 = [(UIView *)self->_contentContainer snapshotViewAfterScreenUpdates:v3];
  [(UIView *)self->_contentContainer frame];
  objc_msgSend(v8, "setFrame:");
  [v8 setAutoresizingMask:18];
  double v9 = [v6 contentView];
  [v9 addSubview:v8];

  return v6;
}

- (id)toolbarContentViewForCapsuleCollectionView:(id)a3
{
  if (self->_placement == 2)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }
  else
  {
    self->_contentBorrowed = 1;
    [(TabOverviewToolbar *)self setNeedsLayout];
    BOOL v3 = self->_contentContainer;
  }
  return v3;
}

- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4
{
  double v4 = 0.0;
  if (self->_placement != 2)
  {
    double v5 = *MEMORY[0x1E4F78698];
    id v6 = [(TabOverviewToolbar *)self superview];
    [v6 safeAreaInsets];
    double v7 = 0.0;
    if (v8 > 0.0) {
      double v7 = 6.0;
    }
    double v4 = v5 + v7;
  }
  return v4;
}

- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4
{
  if (self->_placement != 2)
  {
    self->_contentBorrowed = 0;
    [(TabOverviewToolbar *)self addSubview:a4];
    [(TabOverviewToolbar *)self setNeedsLayout];
  }
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (BOOL)contentBorrowed
{
  return self->_contentBorrowed;
}

- (int64_t)placement
{
  return self->_placement;
}

- (double)searchBarLeadingMargin
{
  return self->_searchBarLeadingMargin;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (BOOL)shouldReserveSpaceForSidebarButton
{
  return self->_shouldReserveSpaceForSidebarButton;
}

- (int64_t)tabGroupButtonDisplayStyle
{
  return self->_tabGroupButtonDisplayStyle;
}

- (void)setTabGroupButtonDisplayStyle:(int64_t)a3
{
  self->_tabGroupButtonDisplayStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_toolbarSeparator, 0);
  objc_storeStrong((id *)&self->_tabGroupButton, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_cancelSearchButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_addTabButton, 0);
}

@end