@interface _UINavigationBarContentViewLayout
- ($BC0A1C2077D899513996B358CDF2CFD6)currentButtonBarLayoutInfo;
- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange;
- (BOOL)_augmentedTitleViewIgnoresResolvedHeight;
- (BOOL)_canCustomizeBar;
- (BOOL)_inActiveRenameSession;
- (BOOL)_overflowRequired;
- (BOOL)_renameShouldTakeOverContentView;
- (BOOL)_wantsBaselineAlignedTitle;
- (BOOL)_wantsExtendedBarHeightWithTabBar;
- (BOOL)active;
- (BOOL)canUpdateAdditionalOverflowItemsInPlace;
- (BOOL)enableAlternatePopItem;
- (BOOL)hasFakedBackButton;
- (BOOL)keepsSnapshotsInHierarchy;
- (BOOL)placeInlineSearchBarInCenter;
- (BOOL)showTitleWithTabBar;
- (BOOL)trailingGroupsEnabled;
- (BOOL)useInlineLargeTitleMetrics;
- (BOOL)wantsHostedTabBarMetrics;
- (NSArray)centerBarGroups;
- (NSArray)leadingGroups;
- (NSArray)trailingGroups;
- (NSDirectionalEdgeInsets)layoutMargins;
- (NSString)currentBackButtonTitle;
- (NSString)customizationIdentifier;
- (NSString)description;
- (UIBarButtonItem)leadingVisibleItem;
- (UIBarButtonItem)overflowItem;
- (UIBarButtonItem)trailingClippingItem;
- (UIBarButtonItem)trailingVisibleItem;
- (UIBarButtonItemGroup)fixedTrailingGroup;
- (UIDeferredMenuElement)additionalOverflowItems;
- (UIDocumentProperties)documentProperties;
- (UILayoutGuide)backButtonGuide;
- (UILayoutGuide)centerBarGuide;
- (UILayoutGuide)leadingBarGuide;
- (UILayoutGuide)tabBarContentGuide;
- (UILayoutGuide)titleViewGuide;
- (UILayoutGuide)trailingBarGuide;
- (UIOffset)titlePositionAdjustment;
- (UITraitCollection)augmentedTitleNavigationBarTraits;
- (UIView)leadingBarSnapshot;
- (UIView)trailingBarSnapshot;
- (_UIBarButtonItemData)backButtonAppearance;
- (_UIBarButtonItemData)doneItemAppearance;
- (_UIBarButtonItemData)plainItemAppearance;
- (_UIBarButtonItemSearchBarGroup)centerSearchBarGroup;
- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup;
- (_UIBarButtonItemSearchBarGroup)trailingSearchBarGroup;
- (_UIButtonBar)centerBar;
- (_UIButtonBar)leadingBar;
- (_UIButtonBar)trailingBar;
- (_UIButtonBarButton)backButton;
- (_UIButtonBarButton)overflowButton;
- (_UINavigationBarAugmentedTitleView)augmentedTitleView;
- (_UINavigationBarContentView)contentView;
- (_UINavigationBarContentViewLayout)initWithContentView:(id)a3;
- (_UINavigationBarTitleControl)titleControl;
- (_UINavigationBarTitleRenamerSession)activeRenamerSession;
- (_UINavigationItemRenameHandler)renameHandler;
- (double)_additionalTrailingPadding;
- (double)_baseTabBarExtension;
- (double)_contentHeight;
- (double)_idealBackButtonWidth;
- (double)_idealTitleWidth;
- (double)_inlineSearchBarGroupExtraLeadingPadding;
- (double)_inlineSearchBarGroupExtraTrailingPadding;
- (double)_inlineTitleBaselineOffset;
- (double)baseHeight;
- (double)baselineOffsetFromTop;
- (double)inlineTitleViewAlpha;
- (double)largeTitleHeight;
- (double)maximumBackButtonWidth;
- (double)minimumBackButtonWidth;
- (double)overrideHeight;
- (double)preferredHeight;
- (double)resolvedExtension;
- (double)resolvedHeight;
- (double)tabBarExtension;
- (id)_fixedItemsMenu;
- (id)_newButtonBar;
- (id)_overflowItem;
- (id)titleMenuProvider;
- (id)traitOverridesForChild:(id)a3;
- (int64_t)alignment;
- (int64_t)centerGroupsMode;
- (int64_t)expectedInactiveInlineSearchBarLayoutState;
- (int64_t)leadingGroupsMode;
- (int64_t)requestedContentSize;
- (int64_t)resolvedAlignment;
- (int64_t)resolvedContentSize;
- (int64_t)titleAlignment;
- (void)_activateAllConstraints;
- (void)_activateConstraintsAndUpdateViewOrderIfNecessary:(id)a3;
- (void)_applyInlineTitleViewAlphaImmediately;
- (void)_buttonBarLayoutInfoCalculation;
- (void)_createTitleControlIfNecessary;
- (void)_deactivateAllConstraints;
- (void)_deactivateConstraintsIfNecessary:(id)a3;
- (void)_didTriggerRenameAction;
- (void)_disableLayoutFlushing:(BOOL)a3 onlyViews:(id)a4 exceptViews:(id)a5;
- (void)_getInitialLeadingFreeSpace:(double *)a3 trailingFreeSpace:(double *)a4 layoutWidth:(double *)a5 compressibleLeadingAllowance:(double *)a6;
- (void)_maximumTitleAllowance;
- (void)_prepareForNewContentView;
- (void)_prepareOverflowItem;
- (void)_removeContentAndInvalidateConstraints;
- (void)_resolveContentSizeForced:(BOOL)a3;
- (void)_resolvedButtonBarLayoutInfo;
- (void)_setOverflowGroupHidden:(BOOL)a3;
- (void)_setOverflowGroupVisibleForCalculation:(BOOL)a3;
- (void)_updateAlignmentConstraints;
- (void)_updateAugmentedTitleViewConstraints;
- (void)_updateAugmentedTitleViewLayout;
- (void)_updateBackButtonConstraints;
- (void)_updateBackButtonWidthConstraintsAndActivateIfNecessary;
- (void)_updateCenterBarConstraints;
- (void)_updateConditionalGuideConstraintsForActiveLayout:(BOOL)a3;
- (void)_updateDocumentIconViewIfNecessary;
- (void)_updateFixedCenterGroups;
- (void)_updateFixedLeadingGroups;
- (void)_updateFixedTrailingGroups;
- (void)_updateHeightConstraints;
- (void)_updateInlineSearchBarGroupWithLeadingPadding:(double *)a3 trailingPadding:;
- (void)_updateLayoutGuideConstraints;
- (void)_updateLeadingBarConstraints;
- (void)_updateMarginConstraints;
- (void)_updateRenamingContentViewConfiguration;
- (void)_updateRenamingContentViewConstraints;
- (void)_updateRenamingContentViewIfNecessary;
- (void)_updateRenamingContentViewVisibilityIfNecessary;
- (void)_updateSearchGroupLocation;
- (void)_updateSubviewOrder;
- (void)_updateTabBarGuideConstraints;
- (void)_updateTitleControl;
- (void)_updateTitleControlVisibility;
- (void)_updateTitleViewConstraints;
- (void)_updateTrailingBarConstraints;
- (void)buttonBarDidLayout:(id)a3;
- (void)cleanupAfterLayoutTransitionCompleted;
- (void)configureWithTitle:(id)a3 attributes:(id)a4 compressionResistancePriority:(float)a5;
- (void)configureWithTitleView:(id)a3 compressionResistancePriority:(float)a4;
- (void)configureWithoutTitle;
- (void)deferSearchSuggestionsMenuRefreshForGeometryChange;
- (void)freeze;
- (void)layoutSubviews;
- (void)refreshSearchSuggestionsMenuAfterGeometryChange;
- (void)removeAllSnapshots;
- (void)removeContent;
- (void)replaceLeadingBarWithSnapshot;
- (void)replaceTitleViewWithSnapshot;
- (void)replaceTrailingBarWithSnapshot;
- (void)setActive:(BOOL)a3 contentView:(id)a4;
- (void)setActiveRenamerSession:(id)a3;
- (void)setAdditionalOverflowItems:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAugmentedTitleNavigationBarTraits:(id)a3;
- (void)setAugmentedTitleView:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setBackButtonAlpha:(double)a3 titleLabelAlpha:(double)a4 titleViewAlpha:(double)a5 barsAlpha:(double)a6;
- (void)setBackButtonAppearance:(id)a3;
- (void)setBackButtonHidden:(BOOL)a3 titleLabelHidden:(BOOL)a4 titleViewHidden:(BOOL)a5 barsHidden:(BOOL)a6;
- (void)setCenterBarGroups:(id)a3;
- (void)setCenterGroupsMode:(int64_t)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setCustomizationIdentifier:(id)a3;
- (void)setDocumentProperties:(id)a3;
- (void)setDoneItemAppearance:(id)a3;
- (void)setEnableAlternatePopItem:(BOOL)a3;
- (void)setFixedTrailingGroup:(id)a3;
- (void)setHasFakedBackButton:(BOOL)a3;
- (void)setInlineSearchBarGroup:(id)a3;
- (void)setInlineTitleViewAlpha:(double)a3;
- (void)setKeepsSnapshotsInHierarchy:(BOOL)a3;
- (void)setLargeTitleHeight:(double)a3;
- (void)setLargeTitleHeightRange:(id)a3;
- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setLeadingGroups:(id)a3;
- (void)setLeadingGroupsMode:(int64_t)a3;
- (void)setMaximumBackButtonWidth:(double)a3;
- (void)setMinimumBackButtonWidth:(double)a3;
- (void)setOverrideHeight:(double)a3;
- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3;
- (void)setPlainItemAppearance:(id)a3;
- (void)setRenameHandler:(id)a3;
- (void)setRequestedContentSize:(int64_t)a3;
- (void)setShowTitleWithTabBar:(BOOL)a3;
- (void)setTabBarContentGuide:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTitleMenuProvider:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)a3;
- (void)setTrailingGroups:(id)a3;
- (void)setTrailingGroupsEnabled:(BOOL)a3;
- (void)setUseInlineLargeTitleMetrics:(BOOL)a3;
- (void)setWantsHostedTabBarMetrics:(BOOL)a3;
- (void)unfreeze;
- (void)unfreezeExceptViews:(id)a3;
- (void)unfreezeOnlyViews:(id)a3;
- (void)updateAlphas;
- (void)updateAugmentedTitleViewBackButtonConstraints;
- (void)updateAugmentedTitleViewHeight;
- (void)updateAugmentedTitleViewLayout;
- (void)updateBackButtonGeometry;
- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4;
- (void)updateOverflowItemImage;
- (void)updateRenameForHorizontalSizeClassChangeIfNecessary;
- (void)updateSpacingConstraints;
@end

@implementation _UINavigationBarContentViewLayout

- (void)setLargeTitleHeightRange:(id)a3
{
  if (self->_largeTitleHeightRange.minimum != a3.var0 || self->_largeTitleHeightRange.maximum != a3.var1)
  {
    self->_largeTitleHeightRange = ($888842945EE2C7AB0ACD33E179C69952)a3;
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _contentDidChange];
  }
}

- (void)setLargeTitleHeight:(double)a3
{
  if (self->_largeTitleHeight != a3)
  {
    self->_largeTitleHeight = a3;
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _contentDidChange];
  }
}

- (void)_updateLayoutGuideConstraints
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!self->_layoutGuideConstraints)
  {
    v3 = [(UILayoutGuide *)self->_backButtonGuide leadingAnchor];
    v4 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
    v5 = [v4 leadingAnchor];
    v6 = [v3 constraintEqualToAnchor:v5];
    edgeToBackButtonSpacer = self->_edgeToBackButtonSpacer;
    self->_edgeToBackButtonSpacer = v6;

    v8 = [(UILayoutGuide *)self->_backButtonGuide trailingAnchor];
    v9 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
    v10 = [v9 leadingAnchor];
    v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10];
    leadingMarginConstraint = self->_leadingMarginConstraint;
    self->_leadingMarginConstraint = v11;

    v13 = [(UILayoutGuide *)self->_leadingBarGuide leadingAnchor];
    v14 = [(UILayoutGuide *)self->_backButtonGuide trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    backButtonToLeadingBarSpacer = self->_backButtonToLeadingBarSpacer;
    self->_backButtonToLeadingBarSpacer = v15;

    v17 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
    v18 = [(UILayoutGuide *)self->_leadingBarGuide trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    leadingBarToTitleSpacer = self->_leadingBarToTitleSpacer;
    self->_leadingBarToTitleSpacer = v19;

    v21 = [(UILayoutGuide *)self->_centerBarGuide leadingAnchor];
    v22 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    titleToCenterBarSpacer = self->_titleToCenterBarSpacer;
    self->_titleToCenterBarSpacer = v23;

    v25 = [(UILayoutGuide *)self->_trailingBarGuide leadingAnchor];
    v26 = [(UILayoutGuide *)self->_centerBarGuide trailingAnchor];
    v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
    centerBarToTrailingBarSpacer = self->_centerBarToTrailingBarSpacer;
    self->_centerBarToTrailingBarSpacer = v27;

    v29 = [(UILayoutGuide *)self->_trailingBarGuide leadingAnchor];
    v30 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    titleToTrailingBarSpacer = self->_titleToTrailingBarSpacer;
    self->_titleToTrailingBarSpacer = v31;

    v33 = [(UILayoutGuide *)self->_trailingBarGuide trailingAnchor];
    v34 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
    v35 = [v34 trailingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    trailingMarginConstraint = self->_trailingMarginConstraint;
    self->_trailingMarginConstraint = v36;

    LODWORD(v38) = 1148829696;
    [(NSLayoutConstraint *)self->_trailingMarginConstraint setPriority:v38];
    v39 = [(UILayoutGuide *)self->_backButtonGuide widthAnchor];
    v40 = CreateWidthMinimizingConstraint(v39);

    if (!self->_backButtonMinimumWidthConstraint)
    {
      v41 = [(UILayoutGuide *)self->_backButtonGuide widthAnchor];
      v42 = [v41 constraintGreaterThanOrEqualToConstant:0.0];
      backButtonMinimumWidthConstraint = self->_backButtonMinimumWidthConstraint;
      self->_backButtonMinimumWidthConstraint = v42;

      v44 = objc_msgSend(NSString, "stringWithFormat:", @"BackButtonGuide(%p).minimumWidth", self);
      [(NSLayoutConstraint *)self->_backButtonMinimumWidthConstraint setIdentifier:v44];
    }
    if (!self->_backButtonMaximumWidthConstraint)
    {
      v45 = [(UILayoutGuide *)self->_backButtonGuide widthAnchor];
      v46 = [v45 constraintLessThanOrEqualToConstant:0.0];
      backButtonMaximumWidthConstraint = self->_backButtonMaximumWidthConstraint;
      self->_backButtonMaximumWidthConstraint = v46;

      LODWORD(v48) = 1144750080;
      [(NSLayoutConstraint *)self->_backButtonMaximumWidthConstraint setPriority:v48];
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"BackButtonGuide(%p).maximumWidth", self);
      [(NSLayoutConstraint *)self->_backButtonMaximumWidthConstraint setIdentifier:v49];
    }
    v50 = [(UILayoutGuide *)self->_leadingBarGuide widthAnchor];
    v51 = CreateWidthMinimizingConstraint(v50);

    v52 = [(UILayoutGuide *)self->_titleViewGuide widthAnchor];
    v53 = [(UIView *)self->_contentView layoutMarginsGuide];
    v54 = [v53 widthAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    LODWORD(v56) = 1112014848;
    [v55 setPriority:v56];

    v57 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
    v58 = [(UIView *)self->_contentView layoutMarginsGuide];
    v59 = [v58 leadingAnchor];
    v60 = [v57 constraintGreaterThanOrEqualToAnchor:v59];

    v61 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
    v62 = [(UIView *)self->_contentView layoutMarginsGuide];
    v63 = [v62 trailingAnchor];
    v64 = [v61 constraintLessThanOrEqualToAnchor:v63];

    v65 = [(UILayoutGuide *)self->_centerBarGuide widthAnchor];
    v66 = CreateWidthMinimizingConstraint(v65);

    v67 = [(UILayoutGuide *)self->_trailingBarGuide widthAnchor];
    v68 = CreateWidthMinimizingConstraint(v67);

    v69 = self->_trailingMarginConstraint;
    v72[0] = self->_leadingMarginConstraint;
    v72[1] = v69;
    long long v73 = *(_OWORD *)&self->_edgeToBackButtonSpacer;
    v74 = self->_leadingBarToTitleSpacer;
    v75 = v40;
    v76 = v51;
    v77 = v55;
    v78 = v60;
    v79 = v64;
    v80 = v66;
    v81 = v68;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:12];
    layoutGuideConstraints = self->_layoutGuideConstraints;
    self->_layoutGuideConstraints = v70;
  }
  if (self->_active) {
    [MEMORY[0x1E4F5B268] activateConstraints:self->_layoutGuideConstraints];
  }
  [(_UINavigationBarContentViewLayout *)self updateSpacingConstraints];
  [(_UINavigationBarContentViewLayout *)self updateBackButtonGeometry];
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  double resolvedHeight = self->_resolvedHeight;
  v6 = (double *)a3;
  if (v6)
  {
    v6[4] = resolvedHeight;
    v6[5] = self->_resolvedHeight + self->_resolvedExtension;
  }
}

- (int64_t)leadingGroupsMode
{
  return self->_leadingGroupsMode;
}

- (int64_t)centerGroupsMode
{
  return self->_centerGroupsMode;
}

- (void)layoutSubviews
{
  if (_UIBarsDesktopNavigationBarEnabled())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    [(_UINavigationBarContentViewLayout *)(uint64_t)&v18 _resolvedButtonBarLayoutInfo];
    [(_UINavigationBarContentViewLayout *)self _setOverflowGroupHidden:BYTE8(v21) == 0];
    if (self->_leadingGroupsMode == 1) {
      [(_UIButtonBar *)self->_leadingBar setTargetLayoutWidth:*(double *)&v18];
    }
    if (self->_centerGroupsMode == 1) {
      [(_UIButtonBar *)self->_centerBar setTargetLayoutWidth:*((double *)&v18 + 1)];
    }
    if (self->_trailingGroupsEnabled) {
      [(_UIButtonBar *)self->_trailingBar setTargetLayoutWidth:*(double *)&v19];
    }
    [(UIView *)self->_contentView updateConstraintsIfNeeded];
    if (self->_hasFreshlyCreatedOverflowGroupItemView
      && +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51___UINavigationBarContentViewLayout_layoutSubviews__block_invoke;
      v17[3] = &unk_1E52D9F70;
      v17[4] = self;
      +[UIView performWithoutAnimation:v17];
    }
    self->_hasFreshlyCreatedOverflowGroupItemView = 0;
    v3 = [(_UINavigationBarContentViewLayout *)self inlineSearchBarGroup];
    v4 = -[_UIBarButtonItemSearchBarGroup searchBar](v3);

    LODWORD(v5) = v20;
    [v4 setContentCompressionResistancePriority:0 forAxis:v5];
    [v4 _setLeftInsetForInlineSearch:*((double *)&v20 + 1)];
    [v4 _setRightInsetForInlineSearch:*(double *)&v21];
    if (self->_titleEnabled)
    {
      double v6 = 0.0;
      double inlineTitleViewAlpha = 0.0;
      if (!BYTE9(v21)) {
        double inlineTitleViewAlpha = self->_inlineTitleViewAlpha;
      }
      [(_UINavigationBarTitleControl *)self->_titleControl setContentAlpha:inlineTitleViewAlpha];
      if (!self->_titleViewHidden)
      {
        if ([(_UINavigationBarContentViewLayout *)self _inActiveRenameSession]) {
          double v6 = 0.0;
        }
        else {
          double v6 = 1.0;
        }
      }
      [(_UINavigationBarTitleControl *)self->_titleControl setControlAlpha:v6];
      titleIconView = self->_titleIconView;
      if (titleIconView)
      {
        [(UIView *)self->_titleIconView bounds];
        -[UIView convertRect:toView:](titleIconView, "convertRect:toView:", self->_titleControl);
        double v10 = v9;
      }
      else
      {
        double v10 = 0.0;
      }
      -[_UINavigationBarTitleControl setMenuAlignmentInsets:](self->_titleControl, "setMenuAlignmentInsets:", 0.0, v10, 0.0, 0.0);
    }
    long long v11 = v19;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.leadingTargetLayoutWidth = v18;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.trailingTargetLayoutWidth = v11;
    long long v12 = v21;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.searchBarHorizontalCCRPriority = v20;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.searchBarRightInset = v12;
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup && ![(UIBarButtonItemGroup *)inlineSearchBarGroup isHidden])
    {
      v14 = -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
      v15 = self->_inlineSearchBarGroup;
      if ([v14 _isEnabled])
      {
        if (v15) {
          v15->_disabledExpansion = 0;
        }
      }
      else
      {
        v16 = [v14 window];
        if (v15) {
          v15->_disabledExpansion = v16 == 0;
        }
      }
    }
  }
}

- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup
{
  return self->_inlineSearchBarGroup;
}

- (void)_setOverflowGroupHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(_UINavigationBarContentViewLayout *)self _prepareOverflowItem];
  }
  overflowGroup = self->_overflowGroup;
  [(UIBarButtonItemGroup *)overflowGroup setHidden:v3];
}

- (void)_resolvedButtonBarLayoutInfo
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (a2)
  {
    [(_UINavigationBarContentViewLayout *)a1 _buttonBarLayoutInfoCalculation];
    v4 = [a2 inlineSearchBarGroup];
    -[_UIBarButtonItemSearchBarGroup searchBar](v4);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    double v5 = v14;
    if (v14)
    {
      [v14 _leftInsetForInlineSearch];
      double v7 = v6;
      [v14 _rightInsetForInlineSearch];
      double v9 = v7 + v8;
      double v10 = *(double *)(a1 + 48);
      double v11 = *(double *)(a1 + 40) + v10;
      objc_msgSend(v14, "_setLeftInsetForInlineSearch:");
      [v14 _setRightInsetForInlineSearch:v10];
      double v5 = v14;
      if (v9 != v11)
      {
        [(_UINavigationBarContentViewLayout *)(uint64_t)v15 _buttonBarLayoutInfoCalculation];
        double v5 = v14;
        long long v12 = v15[1];
        *(_OWORD *)a1 = v15[0];
        *(_OWORD *)(a1 + 16) = v12;
        long long v13 = v15[3];
        *(_OWORD *)(a1 + 32) = v15[2];
        *(_OWORD *)(a1 + 48) = v13;
      }
    }
  }
}

- (void)_buttonBarLayoutInfoCalculation
{
  v4 = [*(id *)(a2 + 328) traitCollection];
  BOOL v5 = [v4 userInterfaceIdiom] == 6;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(int64x2_t *)a1 = vdupq_n_s64(0x412E848000000000uLL);
  *(void *)(a1 + 16) = 0x412E848000000000;
  *(void *)(a1 + 24) = -1;
  *(_DWORD *)(a1 + 32) = dword_186B936C0[v5];
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 58) = 1;
  double v57 = 0.0;
  double v58 = 0.0;
  double v55 = 0.0;
  double v56 = 0.0;
  [(id)a2 _getInitialLeadingFreeSpace:&v58 trailingFreeSpace:&v57 layoutWidth:&v56 compressibleLeadingAllowance:&v55];
  double v6 = v57;
  double v7 = 0.0;
  if (*(void *)(a2 + 536) == 1)
  {
    [*(id *)(a2 + 304) widthInfo];
    double v9 = v8;
    double v58 = v58 - v10;
    double v11 = fmax(v58, 0.0);
  }
  else
  {
    double v11 = fmax(v58, 0.0);
    double v9 = 0.0;
  }
  uint64_t v12 = [(id)a2 _overflowRequired];
  uint64_t v13 = *(void *)(a2 + 544);
  double v14 = 0.0;
  if (v13 == 1)
  {
    [*(id *)(a2 + 312) widthInfo];
    double v14 = v15;
    double v7 = v16;
  }
  if (v12 && !*(unsigned char *)(a2 + 290)) {
    [(id)a2 setTrailingGroupsEnabled:1];
  }
  if (!*(unsigned char *)(a2 + 290))
  {
    double v19 = 0.0;
    goto LABEL_71;
  }
  if (*(void *)(a2 + 504) != 2)
  {
    double v17 = -0.0;
    if (!*(void *)(a2 + 456)) {
      double v17 = v11;
    }
    double v6 = v6 + v17;
  }
  [(id)a2 _setOverflowGroupVisibleForCalculation:v12];
  double v53 = 0.0;
  double v54 = 0.0;
  -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
  [*(id *)(a2 + 320) widthInfo];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (v13 == 1) {
    char v24 = 1;
  }
  else {
    char v24 = v12;
  }
  if ((v24 & 1) == 0)
  {
    v29 = [(id)a2 trailingGroups];
    unint64_t v30 = [v29 count];

    if (v30 <= 1 && v21 > v6 && v19 == 0.0) {
      goto LABEL_33;
    }
  }
  if (v12) {
    goto LABEL_22;
  }
  if (v19 >= v21 || v21 <= v6)
  {
    if (v13 == 1)
    {
      if (v14 <= (v11 + v57 - v21) * 0.875)
      {
        LODWORD(v12) = 0;
        double v31 = v21;
      }
      else
      {
        LODWORD(v12) = 1;
        [(id)a2 _setOverflowGroupVisibleForCalculation:1];
        -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
        [*(id *)(a2 + 320) widthInfo];
        double v21 = v32;
        double v23 = v33;
        double v19 = v32;
      }
      double v28 = fmax(v21, fmin(v6, v23));
      double v21 = v31;
      goto LABEL_36;
    }
    LODWORD(v12) = 0;
LABEL_33:
    double v28 = fmax(v21, fmin(v6, v23));
    goto LABEL_43;
  }
  [(id)a2 _setOverflowGroupVisibleForCalculation:1];
  -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
  [*(id *)(a2 + 320) widthInfo];
  double v19 = v25;
  double v21 = v26;
  double v23 = v27;
LABEL_22:
  double v28 = fmax(v19, fmin(v6, v23));
  LODWORD(v12) = 1;
  if (v13 == 1)
  {
LABEL_36:
    double v34 = (v11 + v57 - v28) * 0.875;
    if (v34 < 0.0) {
      double v34 = 0.0;
    }
    if (v28 > v21 && v34 < v7)
    {
      double v28 = fmax(v21, fmin(v11 + v57 - v7 * 0.875, v23));
      double v34 = 0.0;
      if ((v11 + v57 - v28) * 0.875 >= 0.0) {
        double v34 = (v11 + v57 - v28) * 0.875;
      }
    }
    *(double *)(a1 + 8) = v34;
  }
LABEL_43:
  *(double *)(a1 + 16) = v28;
  v35 = *(void **)(a2 + 240);
  if (v35 && ([v35 isHidden] & 1) == 0)
  {
    v36 = [*(id *)(a2 + 240) representativeItem];

    if (v36)
    {
      if ([*(id *)(a2 + 240) _shouldAlwaysCollapse])
      {
        uint64_t v37 = 1;
      }
      else
      {
        uint64_t v37 = 2;
        if (v28 < v23) {
          uint64_t v37 = 1;
        }
      }
    }
    else
    {
      uint64_t v37 = 3;
    }
    *(void *)(a1 + 24) = v37;
    if (v54 > 0.0 || v53 > 0.0)
    {
      BOOL v38 = v53 <= 0.0 && v28 < v21;
      BOOL v39 = !v38 && v37 == 3;
      if (v39 || v28 >= v23)
      {
        if (v28 >= v21) {
          double v40 = v54;
        }
        else {
          double v40 = 0.0;
        }
        int v41 = objc_msgSend(*(id *)(a2 + 328), "_shouldReverseLayoutDirection", v54);
        double v42 = v53;
        if (v41) {
          double v43 = v53;
        }
        else {
          double v43 = v40;
        }
        if (v41) {
          double v42 = v40;
        }
        *(double *)(a1 + 40) = v43;
        *(double *)(a1 + 48) = v42;
      }
    }
  }
  LODWORD(v12) = v12 != 0;
LABEL_71:
  double v44 = v56;
  if (!*(unsigned char *)(a2 + 281)) {
    goto LABEL_79;
  }
  BOOL v45 = v19 < 1.79769313e308 && v19 > 2.22507386e-308;
  double v46 = 0.0;
  if (v45) {
    double v46 = v19;
  }
  if (v56 - v46 < v9 + v55) {
LABEL_79:
  }
    *(unsigned char *)(a1 + 57) = 1;
  if (v44 < v19) {
    int v47 = v12;
  }
  else {
    int v47 = 0;
  }
  if (v47 == 1)
  {
    uint64_t v48 = [(id)a2 inlineSearchBarGroup];
    if (v48)
    {
      v49 = (void *)v48;
      v50 = [(id)a2 inlineSearchBarGroup];
      v51 = [v50 representativeItem];

      if (!v51) {
        *(_DWORD *)(a1 + 32) = 1144897536;
      }
    }
  }
  *(unsigned char *)(a1 + 56) = v12;
  uint64_t v52 = *(void *)(a2 + 224);
  if (v52) {
    *(void *)(v52 + 48) = 0;
  }
}

- (void)_updateInlineSearchBarGroupWithLeadingPadding:(double *)a3 trailingPadding:
{
  [(id)a1 _inlineSearchBarGroupExtraLeadingPadding];
  double v7 = v6;
  [(id)a1 _inlineSearchBarGroupExtraTrailingPadding];
  double v9 = *(void **)(a1 + 240);
  if (v9)
  {
    double v10 = v8;
    char v11 = [v9 isHidden];
    double v12 = 0.0;
    double v13 = 0.0;
    if ((v11 & 1) == 0)
    {
      uint64_t v14 = *(void *)(a1 + 224);
      if (v14 && *(void *)(v14 + 48) != 1)
      {
        BOOL v19 = 0;
      }
      else
      {
        double v15 = objc_msgSend((id)a1, "trailingGroups", 0.0, 0.0);
        double v16 = [v15 lastObject];
        double v17 = -[UIBarButtonItemGroup _items](v16);
        double v18 = [v17 lastObject];
        BOOL v19 = __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(v18);
      }
      double v20 = *(void **)(a1 + 552);
      if (v20 && ([v20 isHidden] & 1) == 0)
      {
        double v21 = -[UIBarButtonItemGroup _items](*(id **)(a1 + 552));
        double v22 = [v21 firstObject];
        BOOL v23 = __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(v22);

        double v13 = 0.0;
        if (v19) {
          double v12 = v7;
        }
        else {
          double v12 = 0.0;
        }
        if (v23) {
          double v13 = v10;
        }
      }
      else
      {
        double v13 = 0.0;
        if (v19) {
          double v12 = v7;
        }
        else {
          double v12 = 0.0;
        }
      }
    }
    uint64_t v24 = *(void *)(a1 + 240);
    if (v24) {
      *(double *)(v24 + 96) = v12 + v13;
    }
  }
  else
  {
    double v13 = 0.0;
    double v12 = 0.0;
  }
  if (a2) {
    *a2 = v12;
  }
  if (a3) {
    *a3 = v13;
  }
}

- (void)_setOverflowGroupVisibleForCalculation:(BOOL)a3
{
  if (a3)
  {
    [(_UINavigationBarContentViewLayout *)self _prepareOverflowItem];
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  overflowGroup = self->_overflowGroup;
  if (overflowGroup) {
    overflowGroup->__calculationVisibility = v4;
  }
}

- (BOOL)_overflowRequired
{
  int64_t centerGroupsMode = self->_centerGroupsMode;
  if (centerGroupsMode == 2)
  {
    if (![(_UIButtonBar *)self->_centerBar hasVisibleContent]) {
      return self->_additionalOverflowItems != 0;
    }
  }
  else if (centerGroupsMode != 1 {
         || ![(_UINavigationBarContentViewLayout *)self _canCustomizeBar]
  }
         && ![(_UIButtonBar *)self->_centerBar hasAlwaysOverflowGroups])
  {
    return self->_additionalOverflowItems != 0;
  }
  return 1;
}

- (double)_inlineSearchBarGroupExtraTrailingPadding
{
  uint64_t v3 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  if (!v3) {
    return 10.0;
  }
  uint64_t v4 = (void *)v3;
  BOOL v5 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 10.0;
  }
  double v7 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  [v7 inlineSearchBarGroupExtraTrailingPadding];
  double v9 = v8;

  return v9;
}

- (double)_inlineSearchBarGroupExtraLeadingPadding
{
  uint64_t v3 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  if (!v3) {
    return 14.0;
  }
  uint64_t v4 = (void *)v3;
  BOOL v5 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 14.0;
  }
  double v7 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
  [v7 inlineSearchBarGroupExtraLeadingPadding];
  double v9 = v8;

  return v9;
}

- (void)_getInitialLeadingFreeSpace:(double *)a3 trailingFreeSpace:(double *)a4 layoutWidth:(double *)a5 compressibleLeadingAllowance:(double *)a6
{
  double v12 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
  [v12 layoutFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  double v21 = [(UIView *)self->_contentView layoutMarginsGuide];
  [v21 layoutFrame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v65.origin.CGFloat x = v14;
  v65.origin.CGFloat y = v16;
  v65.size.CGFloat width = v18;
  v65.size.CGFloat height = v20;
  v71.origin.CGFloat x = v23;
  v71.origin.CGFloat y = v25;
  v71.size.CGFloat width = v27;
  v71.size.CGFloat height = v29;
  CGRect v66 = CGRectIntersection(v65, v71);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  CGFloat height = v66.size.height;
  [(UIView *)self->_contentView bounds];
  double MidX = CGRectGetMidX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v68);
  v69.origin.CGFloat x = x;
  v69.origin.CGFloat y = y;
  v69.size.CGFloat width = width;
  v69.size.CGFloat height = height;
  double v36 = MidX - MinX;
  double v37 = CGRectGetMaxX(v69) - MidX;
  UIUserInterfaceLayoutDirection v38 = [(UIView *)self->_contentView effectiveUserInterfaceLayoutDirection];
  int64_t titleAlignment = self->_titleAlignment;
  if (titleAlignment == 2)
  {
    if (self->_backButton) {
      double minimumBackButtonWidth = self->_minimumBackButtonWidth;
    }
    else {
      double minimumBackButtonWidth = 0.0;
    }
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    double v57 = v56;
    [(_UINavigationBarContentViewLayout *)self _idealTitleWidth];
    if (v57 >= v58) {
      double v57 = v58;
    }
    tabBarContentGuide = self->_tabBarContentGuide;
    if (tabBarContentGuide)
    {
      [(UILayoutGuide *)tabBarContentGuide layoutFrame];
      if (v57 < v60) {
        double v57 = v60;
      }
    }
    double v61 = 0.0;
    if (minimumBackButtonWidth > 0.0 && v57 > 0.0) {
      [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
    }
    double v54 = ceil(v57 * 0.5);
    double v50 = minimumBackButtonWidth + v54 + v61;
  }
  else if (titleAlignment == 1)
  {
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    double v47 = v46;
    [(_UINavigationBarContentViewLayout *)self _idealTitleWidth];
    if (v47 >= v48) {
      double v47 = v48;
    }
    [(_UINavigationBarContentViewLayout *)self _idealBackButtonWidth];
    double v50 = v49 + v47;
    v51 = self->_tabBarContentGuide;
    if (v51)
    {
      [(UILayoutGuide *)v51 layoutFrame];
      double v53 = ceil(v52 * 0.5);
      double v50 = v50 + v53;
      double v54 = v53 + 0.0;
    }
    else
    {
      double v54 = 0.0;
    }
  }
  else if (titleAlignment)
  {
    double v55 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UINavigationBarContentViewLayout.m", 2348, @"Unimplemented title alignment =%li", self->_titleAlignment);

    double v54 = 0.0;
    double v50 = 0.0;
  }
  else
  {
    double v40 = 0.0;
    if (self->_backButton) {
      double v40 = self->_minimumBackButtonWidth;
    }
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    double v42 = v41;
    [(_UINavigationBarContentViewLayout *)self _idealTitleWidth];
    if (v42 >= v43) {
      double v42 = v43;
    }
    if (v40 <= 0.0)
    {
      double v44 = 0.0;
    }
    else
    {
      double v44 = 0.0;
      if (v42 > 0.0) {
        [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
      }
    }
    double v50 = v40 + v42 + v44;
    if (v38 == UIUserInterfaceLayoutDirectionRightToLeft) {
      double v62 = v37;
    }
    else {
      double v62 = v36;
    }
    double v54 = fmax(v50 - v62, 0.0);
  }
  if (v38 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v63 = v37;
  }
  else {
    double v63 = v36;
  }
  if (v38 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v64 = v36;
  }
  else {
    double v64 = v37;
  }
  *a3 = v63 - v50;
  *a4 = v64 - v54;
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  *a5 = CGRectGetWidth(v70);
  *a6 = v50;
}

- (void)_maximumTitleAllowance
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 296) visualProvider];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = [*(id *)(a1 + 296) visualProvider];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        char v6 = [*(id *)(a1 + 296) visualProvider];
        [v6 maximumTitleAllowance];
      }
    }
  }
}

- (double)_idealTitleWidth
{
  if (!self->_titleEnabled) {
    return 0.0;
  }
  titleControl = self->_titleControl;
  [(UILayoutGuide *)self->_titleViewGuide layoutFrame];
  -[UIView systemLayoutSizeFittingSize:](titleControl, "systemLayoutSizeFittingSize:", 0.0, CGRectGetHeight(v8));
  double v5 = v4;
  [(_UINavigationBarTitleControl *)self->_titleControl trailingPadding];
  return v5 + v6;
}

- (void)_prepareOverflowItem
{
  uint64_t v3 = [(UIBarButtonItem *)self->_overflowItem image];

  if (!v3)
  {
    [(_UINavigationBarContentViewLayout *)self updateOverflowItemImage];
    self->_hasFreshlyCreatedOverflowGroupItemView = 1;
  }
}

- (void)updateOverflowItemImage
{
  uint64_t v3 = [(UIView *)self->_contentView traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];
  double v5 = @"ellipsis.circle";
  if (v4 == 6) {
    double v5 = @"ellipsis";
  }
  double v6 = v5;

  id v7 = +[UIImage systemImageNamed:v6];

  [(UIBarButtonItem *)self->_overflowItem setImage:v7];
}

- (void)_updateRenamingContentViewConfiguration
{
  if ([(_UINavigationBarContentViewLayout *)self _renameShouldTakeOverContentView]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 4;
  }
  renamingContentView = self->_renamingContentView;
  [(_UINavigationBarTitleRenamerContentView *)renamingContentView setTextAlignment:v3];
}

- (BOOL)_renameShouldTakeOverContentView
{
  uint64_t v2 = [(UIView *)self->_contentView traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == 1;

  return v3;
}

- (void)_activateAllConstraints
{
  [(_UINavigationBarContentViewLayout *)self _updateSubviewOrder];
  [(UIView *)self->_contentView addLayoutGuide:self->_backButtonGuide];
  [(UIView *)self->_contentView addLayoutGuide:self->_leadingBarGuide];
  [(UIView *)self->_contentView addLayoutGuide:self->_titleViewGuide];
  [(UIView *)self->_contentView addLayoutGuide:self->_centerBarGuide];
  [(UIView *)self->_contentView addLayoutGuide:self->_trailingBarGuide];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_layoutGuideConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateTabBarGuideConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateConditionalGuideConstraintsForActiveLayout:1];
  [(_UINavigationBarContentViewLayout *)self _updateAlignmentConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_alignmentConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateHeightConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_heightConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateBackButtonConstraints];
  if (self->_backButtonConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
  [(_UINavigationBarContentViewLayout *)self _updateLeadingBarConstraints];
  if (self->_leadingBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
  if (self->_titleViewConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConfiguration];
  [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConstraints];
  if (self->_renamingContentViewConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateCenterBarConstraints];
  if (self->_centerBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateTrailingBarConstraints];
  if (self->_trailingBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
  [(_UINavigationBarContentViewLayout *)self _updateAugmentedTitleViewConstraints];
  if (self->_augmentedTitleViewConstraints)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F5B268];
    objc_msgSend(v3, "activateConstraints:");
  }
}

- (void)_resolveContentSizeForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t requestedContentSize = self->_requestedContentSize;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    uint64_t requestedContentSize = [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _preferredContentSizeForSize:requestedContentSize];
    if (!self->_resolvedContentSize)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"_UINavigationBarContentViewLayout.m", 1166, @"Augmented title view incorrectly returned UIBarPreferredContentSizeAutomatic, return the value passed for automatic behavior" object file lineNumber description];
    }
  }
  if (requestedContentSize != self->_resolvedContentSize || v3)
  {
    self->_resolvedContentSize = requestedContentSize;
    [(_UINavigationBarContentViewLayout *)self _updateAlignmentConstraints];
    [(_UINavigationBarContentViewLayout *)self _updateHeightConstraints];
    [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
  }
}

- (void)setTabBarContentGuide:(id)a3
{
  double v26 = (UILayoutGuide *)a3;
  if (self->_tabBarContentGuide != v26)
  {
    objc_storeStrong((id *)&self->_tabBarContentGuide, a3);
    [(NSLayoutConstraint *)self->_titleGuideTabBarLeadingConstraint setActive:0];
    if (v26)
    {
      double v5 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
      double v6 = [(UILayoutGuide *)self->_tabBarContentGuide leadingAnchor];
      id v7 = [v5 constraintLessThanOrEqualToAnchor:v6];
      titleGuideTabBarLeadingConstraint = self->_titleGuideTabBarLeadingConstraint;
      self->_titleGuideTabBarLeadingConstraint = v7;

      LODWORD(v9) = 1144750080;
      [(NSLayoutConstraint *)self->_titleGuideTabBarLeadingConstraint setPriority:v9];
      [(NSLayoutConstraint *)self->_titleGuideTabBarTrailingConstraint setActive:0];
      double v10 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
      char v11 = [(UILayoutGuide *)self->_tabBarContentGuide trailingAnchor];
      double v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11];
      titleGuideTabBarTrailingConstraint = self->_titleGuideTabBarTrailingConstraint;
      self->_titleGuideTabBarTrailingConstraint = v12;

      [(NSLayoutConstraint *)self->_centerBarGuideTabBarLeadingConstraint setActive:0];
      CGFloat v14 = [(UILayoutGuide *)self->_centerBarGuide leadingAnchor];
      double v15 = [(UILayoutGuide *)self->_tabBarContentGuide leadingAnchor];
      CGFloat v16 = [v14 constraintEqualToAnchor:v15];
      centerBarGuideTabBarLeadingConstraint = self->_centerBarGuideTabBarLeadingConstraint;
      self->_centerBarGuideTabBarLeadingConstraint = v16;

      [(NSLayoutConstraint *)self->_centerBarGuideTabBarTrailingConstraint setActive:0];
      CGFloat v18 = [(UILayoutGuide *)self->_centerBarGuide trailingAnchor];
      double v19 = [(UILayoutGuide *)self->_tabBarContentGuide trailingAnchor];
      CGFloat v20 = [v18 constraintEqualToAnchor:v19];
      centerBarGuideTabBarTrailingConstraint = self->_centerBarGuideTabBarTrailingConstraint;
      self->_centerBarGuideTabBarTrailingConstraint = v20;

      [(_UINavigationBarContentViewLayout *)self _updateTabBarGuideConstraints];
    }
    else
    {
      double v22 = self->_titleGuideTabBarLeadingConstraint;
      self->_titleGuideTabBarLeadingConstraint = 0;

      [(NSLayoutConstraint *)self->_titleGuideTabBarTrailingConstraint setActive:0];
      CGFloat v23 = self->_titleGuideTabBarTrailingConstraint;
      self->_titleGuideTabBarTrailingConstraint = 0;

      [(NSLayoutConstraint *)self->_centerBarGuideTabBarLeadingConstraint setActive:0];
      double v24 = self->_centerBarGuideTabBarLeadingConstraint;
      self->_centerBarGuideTabBarLeadingConstraint = 0;

      [(NSLayoutConstraint *)self->_centerBarGuideTabBarTrailingConstraint setActive:0];
      CGFloat v25 = self->_centerBarGuideTabBarTrailingConstraint;
      self->_centerBarGuideTabBarTrailingConstraint = 0;
    }
  }
  [(_UINavigationBarContentViewLayout *)self _resolveContentSizeForced:1];
}

- (void)_updateTitleViewConstraints
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (self->_contentView)
  {
    if (!self->_titleEnabled) {
      return;
    }
    BOOL v3 = [(_UINavigationBarContentViewLayout *)self titleControl];
    BOOL v4 = [(_UINavigationBarContentViewLayout *)self _wantsBaselineAlignedTitle];
    BOOL v5 = v4;
    titleViewConstraints = self->_titleViewConstraints;
    if (titleViewConstraints)
    {
      id v7 = [(NSArray *)titleViewConstraints objectAtIndexedSubscript:[(NSArray *)self->_titleViewConstraints count] - 2];
      CGRect v8 = [(NSArray *)self->_titleViewConstraints objectAtIndexedSubscript:[(NSArray *)self->_titleViewConstraints count] - 1];
LABEL_24:
      if (self->_titleAlignment != 1) {
        [v7 setConstant:self->_titlePositionAdjustment.horizontal];
      }
      if (v5) {
        [(_UINavigationBarContentViewLayout *)self _inlineTitleBaselineOffset];
      }
      else {
        double vertical = self->_titlePositionAdjustment.vertical;
      }
      [v8 setConstant:vertical];

      return;
    }
    BOOL v66 = v4;
    double v64 = [v3 leadingAnchor];
    double v62 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
    double v60 = [v64 constraintGreaterThanOrEqualToAnchor:v62];
    v70[0] = v60;
    double v58 = [v3 trailingAnchor];
    double v10 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
    [v58 constraintLessThanOrEqualToAnchor:v10];
    v12 = char v11 = v3;
    v70[1] = v12;
    double v13 = [v11 topAnchor];
    CGFloat v14 = [(UILayoutGuide *)self->_titleViewGuide topAnchor];
    double v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
    v70[2] = v15;
    CGRect v68 = v11;
    CGFloat v16 = [v11 bottomAnchor];
    double v17 = [(UILayoutGuide *)self->_titleViewGuide bottomAnchor];
    CGFloat v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    v70[3] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
    CGRect v67 = (void *)[v19 mutableCopy];

    CGFloat v20 = self->_titleIconView;
    double v21 = v20;
    if (v20)
    {
      CGRect v65 = [(UIView *)v20 leadingAnchor];
      double v63 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
      double v61 = [v65 constraintGreaterThanOrEqualToAnchor:v63];
      v69[0] = v61;
      v59 = [(UIView *)v21 trailingAnchor];
      double v57 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
      double v56 = [v59 constraintLessThanOrEqualToAnchor:v57];
      v69[1] = v56;
      double v55 = [(UIView *)v21 topAnchor];
      double v54 = [(UILayoutGuide *)self->_titleViewGuide topAnchor];
      double v53 = [v55 constraintGreaterThanOrEqualToAnchor:v54];
      v69[2] = v53;
      double v52 = [(UIView *)v21 bottomAnchor];
      v51 = [(UILayoutGuide *)self->_titleViewGuide bottomAnchor];
      double v50 = [v52 constraintLessThanOrEqualToAnchor:v51];
      v69[3] = v50;
      double v49 = [v68 leadingAnchor];
      double v48 = [(UIView *)v21 trailingAnchor];
      double v47 = [v49 constraintEqualToAnchor:v48 constant:8.0];
      v69[4] = v47;
      double v46 = [v68 centerYAnchor];
      double v22 = [(UIView *)v21 centerYAnchor];
      CGFloat v23 = [v46 constraintEqualToAnchor:v22];
      v69[5] = v23;
      double v24 = [(UIView *)v21 widthAnchor];
      CGFloat v25 = [v24 constraintLessThanOrEqualToConstant:24.0];
      v69[6] = v25;
      double v26 = [(UIView *)v21 centerYAnchor];
      CGFloat v27 = [(UILayoutGuide *)self->_titleViewGuide centerYAnchor];
      double v28 = [v26 constraintEqualToAnchor:v27];
      v69[7] = v28;
      CGFloat v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:8];
      [v67 addObjectsFromArray:v29];

      if (self->_titleAlignment == 1)
      {
        unint64_t v30 = [(UIView *)v21 leadingAnchor];
        double v31 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
        id v7 = [v30 constraintEqualToAnchor:v31 constant:0.0];

        double v32 = v67;
        BOOL v3 = v68;
LABEL_20:

        BOOL v5 = v66;
        if (v66)
        {
          double v40 = [v3 firstBaselineAnchor];
          double v41 = [(UILayoutGuide *)self->_titleViewGuide topAnchor];
          [v40 constraintEqualToAnchor:v41 constant:0.0];
        }
        else
        {
          double v40 = [v3 centerYAnchor];
          double v41 = [(UILayoutGuide *)self->_titleViewGuide centerYAnchor];
          [v40 constraintEqualToAnchor:v41];
        CGRect v8 = };

        [v32 addObject:v7];
        [v32 addObject:v8];
        double v42 = (NSArray *)[v32 copy];
        double v43 = self->_titleViewConstraints;
        self->_titleViewConstraints = v42;

        goto LABEL_24;
      }
      p_int64_t titleAlignment = &self->_titleAlignment;
      double v32 = v67;
      BOOL v3 = v68;
    }
    else
    {
      double v32 = v67;
      BOOL v3 = v68;
      if (self->_titleAlignment == 1)
      {
        unint64_t v30 = [v68 leadingAnchor];
        double v33 = [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
        id v7 = [v30 constraintEqualToAnchor:v33 constant:0.0];

        goto LABEL_20;
      }
      p_int64_t titleAlignment = &self->_titleAlignment;
    }
    v35 = [(UIView *)self->_contentView safeAreaLayoutGuide];
    unint64_t v30 = [v35 centerXAnchor];

    if (v21)
    {
      double v36 = [(UIView *)v21 widthAnchor];
      uint64_t v37 = [v30 anchorByOffsettingWithDimension:v36 multiplier:0.5 constant:4.0];

      unint64_t v30 = (void *)v37;
    }
    UIUserInterfaceLayoutDirection v38 = [v3 centerXAnchor];
    id v7 = [v38 constraintEqualToAnchor:v30];

    LODWORD(v39) = 1148846080;
    if (!*p_titleAlignment) {
      *(float *)&double v39 = 275.0;
    }
    [v7 setPriority:v39];
    goto LABEL_20;
  }
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v45 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = self;
      _os_log_fault_impl(&dword_1853B0000, v45, OS_LOG_TYPE_FAULT, "Unexpected nil _contentView in %@", buf, 0xCu);
    }
  }
  else
  {
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateTitleViewConstraints___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v72 = self;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected nil _contentView in %@", buf, 0xCu);
    }
  }
}

- (BOOL)_wantsBaselineAlignedTitle
{
  uint64_t v2 = [(_UINavigationBarContentViewLayout *)self titleControl];
  char v3 = [v2 hasBaseline];

  return v3;
}

- (_UINavigationBarTitleControl)titleControl
{
  if (self->_titleEnabled)
  {
    [(_UINavigationBarContentViewLayout *)self _createTitleControlIfNecessary];
    char v3 = self->_titleControl;
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (void)_createTitleControlIfNecessary
{
  if (!self->_titleControl)
  {
    char v3 = objc_alloc_init(_UINavigationBarTitleControl);
    titleControl = self->_titleControl;
    self->_titleControl = v3;

    [(UIView *)self->_titleControl setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v5 = [(_UINavigationBarContentView *)self->_contentView visualProvider];
    double v6 = [v5 titleControlVisualProvider];
    [(_UINavigationBarTitleControl *)self->_titleControl setVisualProvider:v6];

    [(_UINavigationBarTitleControl *)self->_titleControl setTitleMenuProvider:self->_titleMenuProvider];
    [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:self->_documentProperties];
    titleViewGuide = self->_titleViewGuide;
    CGRect v8 = self->_titleControl;
    [(_UINavigationBarTitleControl *)v8 setTitleLayoutGuide:titleViewGuide];
  }
}

- (void)_updateHeightConstraints
{
  v48[5] = *MEMORY[0x1E4F143B8];
  [(_UINavigationBarContentViewLayout *)self _contentHeight];
  double v4 = v3;
  heightConstraints = self->_heightConstraints;
  if (heightConstraints)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v6 = heightConstraints;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) setConstant:v4];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v8);
    }
  }
  else
  {
    double v6 = [(UILayoutGuide *)self->_backButtonGuide heightAnchor];
    double v42 = [(NSArray *)v6 constraintEqualToConstant:v4];
    v48[0] = v42;
    char v11 = [(UILayoutGuide *)self->_leadingBarGuide heightAnchor];
    double v12 = [v11 constraintEqualToConstant:v4];
    v48[1] = v12;
    double v13 = [(UILayoutGuide *)self->_titleViewGuide heightAnchor];
    CGFloat v14 = [v13 constraintEqualToConstant:v4];
    v48[2] = v14;
    double v15 = [(UILayoutGuide *)self->_centerBarGuide heightAnchor];
    CGFloat v16 = [v15 constraintEqualToConstant:v4];
    v48[3] = v16;
    double v17 = [(UILayoutGuide *)self->_trailingBarGuide heightAnchor];
    CGFloat v18 = [v17 constraintEqualToConstant:v4];
    v48[4] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5];
    CGFloat v20 = self->_heightConstraints;
    self->_heightConstraints = v19;
  }
  [(_UINavigationBarContentViewLayout *)self baseHeight];
  double v22 = v21;
  [(_UINavigationBarContentViewLayout *)self _baseTabBarExtension];
  double v24 = v23;
  if (self->_showTitleWithTabBar)
  {
    int v25 = [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _hideNavigationBarStandardTitle];
    int v26 = v25 ^ 1;
    double v27 = -0.0;
    if (!v25) {
      double v27 = v24;
    }
    double v22 = v22 + v27;
  }
  else
  {
    int v26 = 0;
  }
  if (v22 >= self->_overrideHeight) {
    double overrideHeight = v22;
  }
  else {
    double overrideHeight = self->_overrideHeight;
  }
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _navigationBarContentHeight];
    double v31 = v30;
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _navigationBarContentHeightExtension];
    double v33 = v32;
    if ([(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _navigationBarHeightShouldBeIncreasedByTabBarHeight]&& !self->_useInlineLargeTitleMetrics&& self->_showTitleWithTabBar)
    {
      double v34 = v24 + v31;
      double v35 = v24 + v22;
      if (v24 + v31 >= v24 + v22) {
        double v35 = v24 + v31;
      }
      if (v34 < overrideHeight) {
        double v34 = overrideHeight;
      }
      if (v26) {
        double v31 = v34;
      }
      else {
        double v31 = v35;
      }
    }
    if (v31 > overrideHeight
      || [(_UINavigationBarContentViewLayout *)self _augmentedTitleViewIgnoresResolvedHeight])
    {
      double overrideHeight = v31;
    }
    else
    {
      double v33 = fmax(v33 - (overrideHeight - v31), 0.0);
    }
  }
  else
  {
    double v33 = 0.0;
  }
  double v36 = [(UIView *)self->_contentView _screen];
  [v36 scale];
  double v38 = v37;

  UICeilToScale(overrideHeight, v38);
  double v40 = v39;
  UICeilToScale(v33, v38);
  if (self->_resolvedHeight != v40 || self->_resolvedExtension != v41)
  {
    self->_double resolvedHeight = v40;
    self->_resolvedExtension = v41;
    [(_UINavigationBarContentView *)self->_contentView resolvedHeightDidChange];
  }
}

- (double)_baseTabBarExtension
{
  if (self->_augmentedTitleView)
  {
    if (_UIBarsExtendContentViewForHostedTabBar_onceToken != -1) {
      dispatch_once(&_UIBarsExtendContentViewForHostedTabBar_onceToken, &__block_literal_global_765);
    }
    if (!_UIBarsExtendContentViewForHostedTabBar_extendContentViewForHostedTabBar) {
      return 0.0;
    }
  }
  double result = 0.0;
  if (self->_titleAlignment != 1)
  {
    tabBarContentGuide = self->_tabBarContentGuide;
    if (tabBarContentGuide)
    {
      [(UILayoutGuide *)tabBarContentGuide layoutFrame];
      return v5;
    }
  }
  return result;
}

- (double)_contentHeight
{
  double v3 = [(_UINavigationBarContentView *)self->_contentView visualProvider];

  contentView = self->_contentView;
  if (v3)
  {
    double v5 = [(_UINavigationBarContentView *)contentView visualProvider];
    [v5 contentHeightForContentSize:self->_resolvedContentSize];
    double v7 = v6;

    return v7;
  }
  else
  {
    uint64_t v9 = [(UIView *)contentView traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double result = 32.0;
    if (v10 == 5) {
      double result = 25.0;
    }
    double v11 = 44.0;
    if (v10 == 5) {
      double v11 = 38.0;
    }
    if (self->_resolvedContentSize != 1) {
      return v11;
    }
  }
  return result;
}

- (double)baseHeight
{
  double v3 = [(_UINavigationBarContentView *)self->_contentView visualProvider];

  contentView = self->_contentView;
  if (v3)
  {
    double v5 = [(_UINavigationBarContentView *)contentView visualProvider];
    [v5 baseHeightForContentSize:self->_resolvedContentSize];
    double v7 = v6;

    return v7;
  }
  else
  {
    uint64_t v9 = [(UIView *)contentView traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    int64_t resolvedContentSize = self->_resolvedContentSize;
    if (resolvedContentSize == 3)
    {
      if (v10 == 5) {
        double v15 = 43.0;
      }
      else {
        double v15 = 56.0;
      }
    }
    else
    {
      if (resolvedContentSize == 2)
      {
        int v16 = _UIBarsUseNewPadHeights();
        double v12 = 50.0;
        if (v10 == 5) {
          double v12 = 38.0;
        }
        BOOL v14 = v16 == 0;
        double v13 = 44.0;
      }
      else
      {
        double v12 = 0.0;
        double v13 = 32.0;
        if (v10 == 5) {
          double v13 = 25.0;
        }
        BOOL v14 = resolvedContentSize == 1;
      }
      if (v14) {
        double v15 = v13;
      }
      else {
        double v15 = v12;
      }
    }
    BOOL v17 = [(_UINavigationBarContentViewLayout *)self _wantsExtendedBarHeightWithTabBar];
    double result = v15 + 14.0;
    if (!v17) {
      return v15;
    }
  }
  return result;
}

- (BOOL)_wantsExtendedBarHeightWithTabBar
{
  int v3 = _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar();
  if (v3)
  {
    if (self->_tabBarContentGuide) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = self->_wantsHostedTabBarMetrics;
    }
  }
  return v3;
}

- (void)_updateAlignmentConstraints
{
  v50[5] = *MEMORY[0x1E4F143B8];
  unint64_t alignment = self->_alignment;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    uint64_t v6 = [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _preferredAlignment];
    if (v6) {
      unint64_t alignment = v6;
    }
  }
  if (alignment <= 1) {
    unint64_t alignment = 1;
  }
  if (self->_resolvedAlignment != alignment)
  {
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView setNeedsLayout];
    if (self->_alignmentConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      alignmentConstraints = self->_alignmentConstraints;
      self->_alignmentConstraints = 0;
    }
  }
  self->_resolvedAlignment = alignment;
  if (!self->_alignmentConstraints)
  {
    double v47 = a2;
    switch(alignment)
    {
      case 3uLL:
        long long v46 = [(UILayoutGuide *)self->_backButtonGuide bottomAnchor];
        long long v45 = [(UIView *)self->_contentView bottomAnchor];
        long long v44 = [v46 constraintEqualToAnchor:v45];
        v48[0] = v44;
        long long v43 = [(UILayoutGuide *)self->_leadingBarGuide bottomAnchor];
        double v42 = [(UIView *)self->_contentView bottomAnchor];
        double v41 = [v43 constraintEqualToAnchor:v42];
        v48[1] = v41;
        uint64_t v8 = [(UILayoutGuide *)self->_titleViewGuide bottomAnchor];
        uint64_t v9 = [(UIView *)self->_contentView bottomAnchor];
        uint64_t v10 = [v8 constraintEqualToAnchor:v9];
        v48[2] = v10;
        double v11 = [(UILayoutGuide *)self->_centerBarGuide bottomAnchor];
        double v12 = [(UIView *)self->_contentView bottomAnchor];
        double v13 = [v11 constraintEqualToAnchor:v12];
        v48[3] = v13;
        double v19 = [(UILayoutGuide *)self->_trailingBarGuide bottomAnchor];
        CGFloat v20 = [(UIView *)self->_contentView bottomAnchor];
        double v21 = [v19 constraintEqualToAnchor:v20];
        v48[4] = v21;
        double v22 = (void *)MEMORY[0x1E4F1C978];
        double v23 = v48;
        break;
      case 2uLL:
        long long v46 = [(UILayoutGuide *)self->_backButtonGuide centerYAnchor];
        long long v45 = [(UIView *)self->_contentView centerYAnchor];
        long long v44 = [v46 constraintEqualToAnchor:v45];
        v49[0] = v44;
        long long v43 = [(UILayoutGuide *)self->_leadingBarGuide centerYAnchor];
        double v42 = [(UIView *)self->_contentView centerYAnchor];
        double v41 = [v43 constraintEqualToAnchor:v42];
        v49[1] = v41;
        uint64_t v8 = [(UILayoutGuide *)self->_titleViewGuide centerYAnchor];
        uint64_t v9 = [(UIView *)self->_contentView centerYAnchor];
        uint64_t v10 = [v8 constraintEqualToAnchor:v9];
        v49[2] = v10;
        double v11 = [(UILayoutGuide *)self->_centerBarGuide centerYAnchor];
        double v12 = [(UIView *)self->_contentView centerYAnchor];
        double v13 = [v11 constraintEqualToAnchor:v12];
        v49[3] = v13;
        double v19 = [(UILayoutGuide *)self->_trailingBarGuide centerYAnchor];
        CGFloat v20 = [(UIView *)self->_contentView centerYAnchor];
        double v21 = [v19 constraintEqualToAnchor:v20];
        v49[4] = v21;
        double v22 = (void *)MEMORY[0x1E4F1C978];
        double v23 = v49;
        break;
      case 1uLL:
        long long v46 = [(UILayoutGuide *)self->_backButtonGuide topAnchor];
        long long v45 = [(UIView *)self->_contentView topAnchor];
        long long v44 = [v46 constraintEqualToAnchor:v45];
        v50[0] = v44;
        long long v43 = [(UILayoutGuide *)self->_leadingBarGuide topAnchor];
        double v42 = [(UIView *)self->_contentView topAnchor];
        double v41 = [v43 constraintEqualToAnchor:v42];
        v50[1] = v41;
        uint64_t v8 = [(UILayoutGuide *)self->_titleViewGuide topAnchor];
        uint64_t v9 = [(UIView *)self->_contentView topAnchor];
        uint64_t v10 = [v8 constraintEqualToAnchor:v9];
        v50[2] = v10;
        double v11 = [(UILayoutGuide *)self->_centerBarGuide topAnchor];
        double v12 = [(UIView *)self->_contentView topAnchor];
        double v13 = [v11 constraintEqualToAnchor:v12];
        v50[3] = v13;
        BOOL v14 = [(UILayoutGuide *)self->_trailingBarGuide topAnchor];
        double v15 = [(UIView *)self->_contentView topAnchor];
        int v16 = [v14 constraintEqualToAnchor:v15];
        v50[4] = v16;
        BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
        CGFloat v18 = self->_alignmentConstraints;
        self->_alignmentConstraints = v17;

LABEL_17:
        a2 = v47;
LABEL_19:
        unint64_t alignment = self->_resolvedAlignment;
        goto LABEL_20;
      default:
        int v26 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UINavigationBarContentViewLayout.m", 410, @"Unimplemented alignment (%li)", self->_alignment);

        goto LABEL_19;
    }
    double v24 = [v22 arrayWithObjects:v23 count:5];
    int v25 = self->_alignmentConstraints;
    self->_alignmentConstraints = v24;

    goto LABEL_17;
  }
LABEL_20:
  double v27 = 0.0;
  double v28 = 0.0;
  if (alignment - 2 >= 2)
  {
    if (alignment == 1)
    {
      CGFloat v29 = [(UIView *)self->_contentView traitCollection];
      uint64_t v30 = [v29 userInterfaceIdiom];

      if ((unint64_t)(v30 - 5) >= 2)
      {
        if (self->_resolvedContentSize == 3)
        {
          BOOL v31 = ![(_UINavigationBarContentViewLayout *)self _wantsExtendedBarHeightWithTabBar];
          double v32 = 6.0;
          double v33 = 13.0;
        }
        else
        {
          BOOL v31 = _UIBarsUseNewPadHeights() == 0;
          double v32 = 0.0;
          double v33 = 3.0;
        }
        if (v31) {
          double v28 = v32;
        }
        else {
          double v28 = v33;
        }
      }
    }
    else
    {
      double v34 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UINavigationBarContentViewLayout.m", 442, @"Unimplemented alignment (%li)", self->_alignment);
    }
  }
  double v35 = [(NSArray *)self->_alignmentConstraints objectAtIndexedSubscript:0];
  [v35 setConstant:v28];

  double v36 = [(NSArray *)self->_alignmentConstraints objectAtIndexedSubscript:1];
  [v36 setConstant:v28];

  if (self->_showTitleWithTabBar)
  {
    [(_UINavigationBarContentViewLayout *)self tabBarExtension];
    double v27 = v37;
  }
  double v38 = [(NSArray *)self->_alignmentConstraints objectAtIndexedSubscript:2];
  [v38 setConstant:v28 + v27];

  double v39 = [(NSArray *)self->_alignmentConstraints objectAtIndexedSubscript:3];
  [v39 setConstant:v28];

  double v40 = [(NSArray *)self->_alignmentConstraints objectAtIndexedSubscript:4];
  [v40 setConstant:v28];
}

- (double)_inlineTitleBaselineOffset
{
  int v3 = [(_UINavigationBarContentView *)self->_contentView visualProvider];

  contentView = self->_contentView;
  if (v3)
  {
    double v5 = [(_UINavigationBarContentView *)contentView visualProvider];
    [v5 inlineTitleBaselineOffset];
    double v7 = v6;

    return v7;
  }
  else
  {
    uint64_t v9 = [(UIView *)contentView traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double v11 = 21.0;
    if (v10 == 5) {
      double v11 = 16.0;
    }
    double v12 = 28.0;
    if (v10 == 5) {
      double v12 = 22.0;
    }
    if (self->_resolvedContentSize != 1) {
      double v11 = v12;
    }
    return self->_titlePositionAdjustment.vertical + v11;
  }
}

- (void)_updateBackButtonWidthConstraintsAndActivateIfNecessary
{
  double maximumBackButtonWidth = self->_maximumBackButtonWidth;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _navigationBarBackButtonMaximumWidth];
    if (v5 >= maximumBackButtonWidth) {
      double v6 = maximumBackButtonWidth;
    }
    else {
      double v6 = v5;
    }
    if (v5 <= 0.0) {
      double v6 = maximumBackButtonWidth;
    }
    if (maximumBackButtonWidth == 0.0) {
      double maximumBackButtonWidth = v5;
    }
    else {
      double maximumBackButtonWidth = v6;
    }
  }
  [(NSLayoutConstraint *)self->_backButtonMinimumWidthConstraint setConstant:self->_minimumBackButtonWidth];
  [(NSLayoutConstraint *)self->_backButtonMaximumWidthConstraint setConstant:maximumBackButtonWidth];
  if (self->_active)
  {
    if (self->_backButton) {
      BOOL v7 = self->_minimumBackButtonWidth > 0.0;
    }
    else {
      BOOL v7 = 0;
    }
    [(NSLayoutConstraint *)self->_backButtonMinimumWidthConstraint setActive:v7];
    BOOL v9 = maximumBackButtonWidth > 0.0 && self->_backButton != 0;
    backButtonMaximumWidthConstraint = self->_backButtonMaximumWidthConstraint;
    [(NSLayoutConstraint *)backButtonMaximumWidthConstraint setActive:v9];
  }
}

- (void)updateSpacingConstraints
{
  double v3 = 0.0;
  double v4 = 0.0;
  if (self->_backButton)
  {
    if (self->_leadingGroupsMode == 1)
    {
      leadingBar = self->_leadingBar;
      goto LABEL_4;
    }
    if (self->_titleEnabled) {
      goto LABEL_7;
    }
    if (self->_centerGroupsMode == 1)
    {
      leadingBar = self->_centerBar;
LABEL_4:
      BOOL v6 = [(_UIButtonBar *)leadingBar needsLeadingSpacer];
      double v4 = 0.0;
      if (!v6) {
        goto LABEL_8;
      }
LABEL_7:
      [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
      goto LABEL_8;
    }
    if (self->_trailingGroupsEnabled)
    {
      BOOL v16 = [(_UIButtonBar *)self->_trailingBar needsLeadingSpacer];
      double v4 = 0.0;
      if (v16) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  [(NSLayoutConstraint *)self->_backButtonToLeadingBarSpacer setConstant:v4];
  if (self->_leadingGroupsMode != 1) {
    goto LABEL_22;
  }
  if (self->_titleEnabled)
  {
    if (![(_UIButtonBar *)self->_leadingBar needsTrailingSpacer]) {
      goto LABEL_22;
    }
LABEL_21:
    [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
    double v3 = v7;
    goto LABEL_22;
  }
  if (self->_centerGroupsMode == 1)
  {
    if ([(_UIButtonBar *)self->_leadingBar needsTrailingSpacer]
      || [(_UIButtonBar *)self->_centerBar needsLeadingSpacer])
    {
      goto LABEL_21;
    }
  }
  else if (self->_trailingGroupsEnabled {
         && ([(_UIButtonBar *)self->_leadingBar needsTrailingSpacer]
  }
          || [(_UIButtonBar *)self->_trailingBar needsLeadingSpacer]))
  {
    goto LABEL_21;
  }
LABEL_22:
  [(NSLayoutConstraint *)self->_leadingBarToTitleSpacer setConstant:v3];
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (self->_titleEnabled)
  {
    if (self->_trailingGroupsEnabled
      && [(_UIButtonBar *)self->_trailingBar needsLeadingSpacer])
    {
      [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
      double v10 = v9;
    }
    double v11 = v10;
    if (self->_centerGroupsMode == 1)
    {
      double v11 = 0.0;
      if ([(_UIButtonBar *)self->_centerBar needsLeadingSpacer])
      {
        [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
        double v11 = v12;
      }
    }
    [(_UINavigationBarTitleControl *)self->_titleControl trailingPadding];
    double v14 = v13;
    double v9 = v11 + v13;
    double v10 = v10 + v14;
  }
  [(NSLayoutConstraint *)self->_titleToCenterBarSpacer setConstant:v9];
  [(NSLayoutConstraint *)self->_titleToTrailingBarSpacer setConstant:v10];
  if (self->_centerGroupsMode == 1
    && self->_trailingGroupsEnabled
    && ([(_UIButtonBar *)self->_centerBar needsTrailingSpacer]
     || [(_UIButtonBar *)self->_trailingBar needsLeadingSpacer]))
  {
    [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterGroupSpace];
    double v8 = v15;
  }
  [(NSLayoutConstraint *)self->_centerBarToTrailingBarSpacer setConstant:v8];
  [(_UINavigationBarContentViewLayout *)self _updateConditionalGuideConstraintsForActiveLayout:self->_active];
  [(_UINavigationBarContentViewLayout *)self _updateMarginConstraints];
}

- (void)_updateTrailingBarConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (self->_trailingGroupsEnabled && !self->_trailingBarConstraints)
  {
    double v3 = [(_UINavigationBarContentViewLayout *)self trailingBar];
    double v4 = [v3 view];

    CGFloat v18 = [v4 leadingAnchor];
    BOOL v17 = [(UILayoutGuide *)self->_trailingBarGuide leadingAnchor];
    BOOL v16 = [v18 constraintEqualToAnchor:v17];
    v19[0] = v16;
    double v15 = [v4 trailingAnchor];
    double v5 = [(UILayoutGuide *)self->_trailingBarGuide trailingAnchor];
    BOOL v6 = [v15 constraintEqualToAnchor:v5];
    v19[1] = v6;
    double v7 = [v4 topAnchor];
    double v8 = [(UILayoutGuide *)self->_trailingBarGuide topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v19[2] = v9;
    double v10 = [v4 bottomAnchor];
    double v11 = [(UILayoutGuide *)self->_trailingBarGuide bottomAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    v19[3] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    trailingBarConstraints = self->_trailingBarConstraints;
    self->_trailingBarConstraints = v13;
  }
}

- (void)_updateConditionalGuideConstraintsForActiveLayout:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(UIView *)self->_contentView traitCollection];
    uint64_t v5 = [v4 horizontalSizeClass];
    BOOL v6 = v5 == 1;
    BOOL v7 = v5 != 1;
  }
  else
  {
    BOOL v7 = 0;
    BOOL v6 = 0;
  }
  [(NSLayoutConstraint *)self->_titleToCenterBarSpacer setActive:v7];
  [(NSLayoutConstraint *)self->_centerBarToTrailingBarSpacer setActive:v7];
  titleToTrailingBarSpacer = self->_titleToTrailingBarSpacer;
  [(NSLayoutConstraint *)titleToTrailingBarSpacer setActive:v6];
}

- (void)_updateLeadingBarConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (self->_leadingGroupsMode == 1 && !self->_leadingBarConstraints)
  {
    double v3 = [(_UINavigationBarContentViewLayout *)self leadingBar];
    double v4 = [v3 view];

    CGFloat v18 = [v4 leadingAnchor];
    BOOL v17 = [(UILayoutGuide *)self->_leadingBarGuide leadingAnchor];
    BOOL v16 = [v18 constraintEqualToAnchor:v17];
    v19[0] = v16;
    double v15 = [v4 trailingAnchor];
    uint64_t v5 = [(UILayoutGuide *)self->_leadingBarGuide trailingAnchor];
    BOOL v6 = [v15 constraintEqualToAnchor:v5];
    v19[1] = v6;
    BOOL v7 = [v4 topAnchor];
    double v8 = [(UILayoutGuide *)self->_leadingBarGuide topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v19[2] = v9;
    double v10 = [v4 bottomAnchor];
    double v11 = [(UILayoutGuide *)self->_leadingBarGuide bottomAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    v19[3] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    leadingBarConstraints = self->_leadingBarConstraints;
    self->_leadingBarConstraints = v13;
  }
}

- (void)_updateBackButtonConstraints
{
  v18[4] = *MEMORY[0x1E4F143B8];
  backButton = self->_backButton;
  if (backButton)
  {
    if (!self->_backButtonConstraints)
    {
      BOOL v17 = [(UIView *)backButton leadingAnchor];
      BOOL v16 = [(UILayoutGuide *)self->_backButtonGuide leadingAnchor];
      double v15 = [v17 constraintEqualToAnchor:v16];
      v18[0] = v15;
      double v4 = [(UIView *)self->_backButton trailingAnchor];
      uint64_t v5 = [(UILayoutGuide *)self->_backButtonGuide trailingAnchor];
      BOOL v6 = [v4 constraintEqualToAnchor:v5];
      v18[1] = v6;
      BOOL v7 = [(UIView *)self->_backButton topAnchor];
      double v8 = [(UILayoutGuide *)self->_backButtonGuide topAnchor];
      double v9 = [v7 constraintEqualToAnchor:v8];
      v18[2] = v9;
      double v10 = [(UIView *)self->_backButton bottomAnchor];
      double v11 = [(UILayoutGuide *)self->_backButtonGuide bottomAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11];
      v18[3] = v12;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
      backButtonConstraints = self->_backButtonConstraints;
      self->_backButtonConstraints = v13;
    }
  }
}

- (void)_updateAugmentedTitleViewConstraints
{
  v18[4] = *MEMORY[0x1E4F143B8];
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    if (!self->_augmentedTitleViewConstraints)
    {
      BOOL v17 = [(_UINavigationBarAugmentedTitleView *)augmentedTitleView leadingAnchor];
      BOOL v16 = [(UIView *)self->_contentView leadingAnchor];
      double v15 = [v17 constraintEqualToAnchor:v16];
      v18[0] = v15;
      double v4 = [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView trailingAnchor];
      uint64_t v5 = [(UIView *)self->_contentView trailingAnchor];
      BOOL v6 = [v4 constraintEqualToAnchor:v5];
      v18[1] = v6;
      BOOL v7 = [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView topAnchor];
      double v8 = [(UIView *)self->_contentView topAnchor];
      double v9 = [v7 constraintEqualToAnchor:v8];
      v18[2] = v9;
      double v10 = [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView bottomAnchor];
      double v11 = [(UIView *)self->_contentView bottomAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11];
      v18[3] = v12;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
      augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
      self->_augmentedTitleViewConstraints = v13;
    }
  }
}

- (void)_updateTabBarGuideConstraints
{
  if (self->_tabBarContentGuide)
  {
    int64_t titleAlignment = self->_titleAlignment;
    BOOL v4 = titleAlignment == 1;
    BOOL v5 = titleAlignment != 1;
    [(NSLayoutConstraint *)self->_titleGuideTabBarLeadingConstraint setActive:v5];
    [(NSLayoutConstraint *)self->_titleGuideTabBarTrailingConstraint setActive:v5];
    [(NSLayoutConstraint *)self->_centerBarGuideTabBarLeadingConstraint setActive:v4];
    centerBarGuideTabBarTrailingConstraint = self->_centerBarGuideTabBarTrailingConstraint;
    [(NSLayoutConstraint *)centerBarGuideTabBarTrailingConstraint setActive:v4];
  }
}

- (void)_updateRenamingContentViewConstraints
{
  v78[8] = *MEMORY[0x1E4F143B8];
  if (self->_renamingContentView)
  {
    BOOL v3 = [(_UINavigationBarContentViewLayout *)self _renameShouldTakeOverContentView];
    renamingContentView = self->_renamingContentView;
    if (v3)
    {
      BOOL v5 = [(_UINavigationBarTitleRenamerContentView *)renamingContentView leadingAnchor];
      BOOL v6 = [(UIView *)self->_contentView layoutMarginsGuide];
      BOOL v7 = [v6 leadingAnchor];
      double v8 = [v5 constraintEqualToAnchor:v7];

      v76 = v8;
      LODWORD(v9) = 1132396544;
      [v8 setPriority:v9];
      double v10 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView trailingAnchor];
      double v11 = [(UIView *)self->_contentView layoutMarginsGuide];
      double v12 = [v11 trailingAnchor];
      double v13 = [v10 constraintEqualToAnchor:v12];

      v74 = v13;
      LODWORD(v14) = 1132396544;
      [v13 setPriority:v14];
      v78[0] = v8;
      v78[1] = v13;
      CGRect v70 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView leadingAnchor];
      v72 = [(UIView *)self->_contentView layoutMarginsGuide];
      CGRect v68 = [v72 leadingAnchor];
      BOOL v66 = [v70 constraintGreaterThanOrEqualToAnchor:v68];
      v78[2] = v66;
      double v64 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView trailingAnchor];
      CGRect v65 = [(UIView *)self->_contentView layoutMarginsGuide];
      double v63 = [v65 trailingAnchor];
      double v62 = [v64 constraintLessThanOrEqualToAnchor:v63];
      v78[3] = v62;
      double v60 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView leadingAnchor];
      double v61 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
      v59 = [v61 leadingAnchor];
      double v58 = [v60 constraintGreaterThanOrEqualToAnchor:v59];
      v78[4] = v58;
      double v56 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView trailingAnchor];
      double v57 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
      double v55 = [v57 trailingAnchor];
      double v15 = [v56 constraintLessThanOrEqualToAnchor:v55];
      v78[5] = v15;
      BOOL v16 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView centerYAnchor];
      BOOL v17 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
      CGFloat v18 = [v17 centerYAnchor];
      double v19 = [v16 constraintEqualToAnchor:v18];
      v78[6] = v19;
      CGFloat v20 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView topAnchor];
      double v21 = [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuide];
      double v22 = [v21 topAnchor];
      double v23 = [v20 constraintGreaterThanOrEqualToAnchor:v22];
      v78[7] = v23;
      double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:8];
      renamingContentViewConstraints = self->_renamingContentViewConstraints;
      self->_renamingContentViewConstraints = v24;

      renamingContentViewInsetConstraint = self->_renamingContentViewInsetConstraint;
      self->_renamingContentViewInsetConstraint = 0;
    }
    else
    {
      [(_UINavigationBarTitleRenamerContentView *)renamingContentView horizontalTextInset];
      double v30 = v29;
      BOOL v31 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView widthAnchor];
      double v32 = [v31 constraintEqualToConstant:280.0];

      LODWORD(v33) = 1144750080;
      [v32 setPriority:v33];
      double v34 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView leadingAnchor];
      BOOL titleEnabled = self->_titleEnabled;
      if (self->_titleEnabled)
      {
        BOOL v31 = [(_UINavigationBarContentViewLayout *)self titleControl];
        [v31 leadingAnchor];
      }
      else
      {
        [(UILayoutGuide *)self->_titleViewGuide leadingAnchor];
      double v36 = };
      uint64_t v37 = [v34 constraintEqualToAnchor:v36 constant:-v30];
      if (titleEnabled)
      {

        double v36 = v31;
      }

      v75 = (NSLayoutConstraint *)v37;
      v77[0] = v37;
      uint64_t v73 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView trailingAnchor];
      CGRect v71 = [(UILayoutGuide *)self->_titleViewGuide trailingAnchor];
      CGRect v69 = [v73 constraintLessThanOrEqualToAnchor:v71];
      v77[1] = v69;
      v77[2] = v32;
      v76 = v32;
      CGRect v67 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView topAnchor];
      double v38 = [(UILayoutGuide *)self->_titleViewGuide topAnchor];
      double v39 = [v67 constraintGreaterThanOrEqualToAnchor:v38];
      v77[3] = v39;
      double v40 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView bottomAnchor];
      double v41 = [(UILayoutGuide *)self->_titleViewGuide bottomAnchor];
      double v42 = [v40 constraintLessThanOrEqualToAnchor:v41];
      v77[4] = v42;
      long long v43 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView centerYAnchor];
      long long v44 = [(UILayoutGuide *)self->_titleViewGuide centerYAnchor];
      long long v45 = [v43 constraintEqualToAnchor:v44];
      v77[5] = v45;
      long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:6];

      if (self->_titleEnabled)
      {
        double v47 = [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView trailingAnchor];
        double v48 = [(_UINavigationBarContentViewLayout *)self titleControl];
        double v49 = [v48 trailingAnchor];
        double v50 = [v47 constraintGreaterThanOrEqualToAnchor:v49];
        uint64_t v51 = [(NSArray *)v46 arrayByAddingObject:v50];

        long long v46 = (NSArray *)v51;
      }
      double v52 = self->_renamingContentViewInsetConstraint;
      self->_renamingContentViewInsetConstraint = v75;
      double v53 = v75;

      double v54 = self->_renamingContentViewConstraints;
      self->_renamingContentViewConstraints = v46;
    }
  }
  else
  {
    double v27 = self->_renamingContentViewInsetConstraint;
    self->_renamingContentViewInsetConstraint = 0;

    double v28 = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;
  }
}

- (void)_updateCenterBarConstraints
{
  v24[5] = *MEMORY[0x1E4F143B8];
  if (self->_centerGroupsMode == 1 && !self->_centerBarConstraints)
  {
    BOOL v3 = [(_UINavigationBarContentViewLayout *)self centerBar];
    BOOL v4 = [v3 view];

    BOOL v5 = [v4 centerXAnchor];
    BOOL v6 = [(UIView *)self->_contentView safeAreaLayoutGuide];
    BOOL v7 = [v6 centerXAnchor];
    double v8 = [v5 constraintEqualToAnchor:v7];

    [v8 setIdentifier:@"UI-center-button-bar"];
    LODWORD(v9) = 1144569856;
    [v8 setPriority:v9];
    double v23 = [v4 leadingAnchor];
    double v22 = [(UILayoutGuide *)self->_centerBarGuide leadingAnchor];
    double v21 = [v23 constraintEqualToAnchor:v22];
    v24[0] = v21;
    CGFloat v20 = [v4 trailingAnchor];
    double v19 = [(UILayoutGuide *)self->_centerBarGuide trailingAnchor];
    double v10 = [v20 constraintEqualToAnchor:v19];
    v24[1] = v10;
    double v11 = [v4 topAnchor];
    double v12 = [(UILayoutGuide *)self->_centerBarGuide topAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    double v14 = [v4 bottomAnchor];
    double v15 = [(UILayoutGuide *)self->_centerBarGuide bottomAnchor];
    BOOL v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    v24[4] = v8;
    BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
    centerBarConstraints = self->_centerBarConstraints;
    self->_centerBarConstraints = v17;
  }
}

- (double)tabBarExtension
{
  [(_UINavigationBarContentViewLayout *)self _baseTabBarExtension];
  double v4 = v3;
  if (v3 > 0.0)
  {
    [(UILayoutGuide *)self->_tabBarContentGuide layoutFrame];
    double v4 = v4 + v5;
    if (_UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar()) {
      return v4 + 7.0;
    }
  }
  return v4;
}

- (UILayoutGuide)leadingBarGuide
{
  return self->_leadingBarGuide;
}

- (BOOL)active
{
  return self->_active;
}

- (void)_updateSubviewOrder
{
  v15[8] = *MEMORY[0x1E4F143B8];
  if (self->_active)
  {
    v15[0] = self->_augmentedTitleView;
    if (self->_leadingGroupsMode == 1)
    {
      leadingBarSnapshot = self->_leadingBarSnapshot;
      if (leadingBarSnapshot)
      {
        int v7 = 0;
      }
      else
      {
        uint64_t v2 = [(_UINavigationBarContentViewLayout *)self leadingBar];
        leadingBarSnapshot = [v2 view];
        int v7 = 1;
      }
    }
    else
    {
      int v7 = 0;
      leadingBarSnapshot = 0;
    }
    v15[1] = leadingBarSnapshot;
    int64_t centerGroupsMode = self->_centerGroupsMode;
    if (centerGroupsMode == 1)
    {
      double v3 = [(_UINavigationBarContentViewLayout *)self centerBar];
      double v9 = [v3 view];
    }
    else
    {
      double v9 = 0;
    }
    v15[2] = v9;
    trailingBarSnapshot = self->_trailingBarSnapshot;
    double v11 = trailingBarSnapshot;
    if (!trailingBarSnapshot)
    {
      double v4 = [(_UINavigationBarContentViewLayout *)self trailingBar];
      double v11 = [v4 view];
    }
    backButton = self->_backButton;
    v15[3] = v11;
    _OWORD v15[4] = backButton;
    v15[5] = self->_titleIconView;
    titleViewSnapshot = (_UINavigationBarTitleControl *)self->_titleViewSnapshot;
    if (!titleViewSnapshot) {
      titleViewSnapshot = self->_titleControl;
    }
    renamingContentView = self->_renamingContentView;
    v15[6] = titleViewSnapshot;
    v15[7] = renamingContentView;
    if (!trailingBarSnapshot)
    {
    }
    if (centerGroupsMode == 1)
    {
    }
    if (v7)
    {
    }
    [(UIView *)self->_contentView _ensureViewsAreInstalledInRelativeOrder:v15 viewCount:8 insertionStartIndex:0];
  }
}

- (void)updateAlphas
{
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _navigationBarBackButtonAlpha];
    -[UIView setAlpha:](self->_backButton, "setAlpha:");
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _navigationBarLeadingBarButtonsAlpha];
    double v5 = v4;
    BOOL v6 = [(_UIButtonBar *)self->_leadingBar view];
    [v6 setAlpha:v5];

    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _navigationBarTrailingBarButtonsAlpha];
    double v8 = v7;
    double v9 = [(_UIButtonBar *)self->_trailingBar view];
    id v13 = v9;
    double v10 = v8;
LABEL_8:
    [v9 setAlpha:v10];

    return;
  }
  if (![(_UINavigationBarContentViewLayout *)self _inActiveRenameSession])
  {
    [(UIView *)self->_backButton setAlpha:1.0];
    double v12 = [(_UIButtonBar *)self->_leadingBar view];
    [v12 setAlpha:1.0];

    double v9 = [(_UIButtonBar *)self->_trailingBar view];
    id v13 = v9;
    double v10 = 1.0;
    goto LABEL_8;
  }
  BOOL v11 = [(_UINavigationBarContentViewLayout *)self _renameShouldTakeOverContentView];
  [(_UINavigationBarContentViewLayout *)self setContentHidden:v11];
}

- (BOOL)_inActiveRenameSession
{
  return self->_activeRenamerSession != 0;
}

- (void)configureWithTitle:(id)a3 attributes:(id)a4 compressionResistancePriority:(float)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_titleEnabled)
  {
    double v9 = [(_UINavigationBarTitleControl *)self->_titleControl titleView];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  self->_BOOL titleEnabled = 1;
  [(_UINavigationBarContentViewLayout *)self _createTitleControlIfNecessary];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleView:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitle:v13];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleAttributes:v8];
  *(float *)&double v11 = a5;
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleViewCompressionResistancePriority:v11];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleMenuProvider:self->_titleMenuProvider];
  [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:self->_documentProperties];
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (v10)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_titleViewConstraints];
  }
}

- ($BC0A1C2077D899513996B358CDF2CFD6)currentButtonBarLayoutInfo
{
  long long v3 = *(_OWORD *)&self[10].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var3;
  *(_OWORD *)&retstr->var2 = v3;
  long long v4 = *(_OWORD *)&self[11].var1;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[10].var7;
  *(_OWORD *)&retstr->var6 = v4;
  return self;
}

- (void)setInlineTitleViewAlpha:(double)a3
{
  self->_double inlineTitleViewAlpha = a3;
}

- (void)_applyInlineTitleViewAlphaImmediately
{
}

- (void)setTitleMenuProvider:(id)a3
{
  long long v4 = _Block_copy(a3);
  id titleMenuProvider = self->_titleMenuProvider;
  self->_id titleMenuProvider = v4;

  id v6 = self->_titleMenuProvider;
  titleControl = self->_titleControl;
  [(_UINavigationBarTitleControl *)titleControl setTitleMenuProvider:v6];
}

- (void)setRenameHandler:(id)a3
{
  double v5 = (_UINavigationItemRenameHandler *)a3;
  if (self->_renameHandler != v5)
  {
    id v6 = v5;
    if (self->_activeRenamerSession) {
      [(_UINavigationBarContentViewLayout *)self setActiveRenamerSession:0];
    }
    objc_storeStrong((id *)&self->_renameHandler, a3);
    [(_UINavigationBarContentViewLayout *)self _updateTitleControl];
    double v5 = v6;
  }
}

- (void)setDocumentProperties:(id)a3
{
  double v5 = (UIDocumentProperties *)a3;
  documentProperties = self->_documentProperties;
  if (documentProperties != v5)
  {
    [(UIDocumentProperties *)documentProperties _setWantsIconRepresentationChangedHandler:0];
    objc_storeStrong((id *)&self->_documentProperties, a3);
    [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:self->_documentProperties];
    [(_UINavigationBarContentViewLayout *)self _updateDocumentIconViewIfNecessary];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59___UINavigationBarContentViewLayout_setDocumentProperties___block_invoke;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    [(UIDocumentProperties *)v5 _setWantsIconRepresentationChangedHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)setAugmentedTitleView:(id)a3
{
  double v5 = (_UINavigationBarAugmentedTitleView *)a3;
  if (self->_augmentedTitleView != v5)
  {
    double v7 = v5;
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_augmentedTitleViewConstraints];
    [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView removeFromSuperview];
    objc_storeStrong((id *)&self->_augmentedTitleView, a3);
    augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
    self->_augmentedTitleViewConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _resolveContentSizeForced:0];
    [(_UINavigationBarContentViewLayout *)self _updateAugmentedTitleViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_augmentedTitleViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _updateAugmentedTitleViewLayout];
    double v5 = v7;
  }
}

- (void)_updateMarginConstraints
{
  BOOL v3 = [(_UINavigationBarContentView *)self->_contentView isNavItemContentLayoutGuideFlushLeading];
  double v4 = 0.0;
  double leading = 0.0;
  if (v3) {
    double leading = self->_layoutMargins.leading;
  }
  [(NSLayoutConstraint *)self->_leadingMarginConstraint setConstant:leading];
  [(_UINavigationBarContentViewLayout *)self _additionalTrailingPadding];
  double v7 = v6;
  if ([(_UINavigationBarContentView *)self->_contentView isNavItemContentLayoutGuideFlushTrailing])
  {
    double v4 = v7 - self->_layoutMargins.trailing;
  }
  trailingMarginConstraint = self->_trailingMarginConstraint;
  [(NSLayoutConstraint *)trailingMarginConstraint setConstant:v4];
}

- (double)_additionalTrailingPadding
{
  return 0.0;
}

- (void)updateBackButtonGeometry
{
  BOOL v3 = [(_UINavigationBarContentView *)self->_contentView hasLeadingInsetFromTideBar];
  double v4 = 0.0;
  if (v3)
  {
    [(UIView *)self->_contentView safeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    if ([(UIView *)self->_contentView effectiveUserInterfaceLayoutDirection]) {
      double v4 = v8;
    }
    else {
      double v4 = v6;
    }
  }
  edgeToBackButtonSpacer = self->_edgeToBackButtonSpacer;
  [(NSLayoutConstraint *)edgeToBackButtonSpacer setConstant:v4];
}

- (void)setUseInlineLargeTitleMetrics:(BOOL)a3
{
  self->_useInlineLargeTitleMetrics = a3;
}

- (void)setTitleAlignment:(int64_t)a3
{
  if (self->_titleAlignment != a3)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
    self->_int64_t titleAlignment = a3;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _updateTabBarGuideConstraints];
    double v6 = self->_titleViewConstraints;
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:v6];
  }
}

- (void)setShowTitleWithTabBar:(BOOL)a3
{
  self->_showTitleWithTabBar = a3;
}

- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3
{
  if (self->_placeInlineSearchBarInCenter != a3)
  {
    self->_placeInlineSearchBarInCenter = a3;
    [(_UINavigationBarContentViewLayout *)self _updateSearchGroupLocation];
  }
}

- (void)setOverrideHeight:(double)a3
{
  if (a3 < 0.0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentViewLayout.m" lineNumber:1193 description:@"Negative values are not valid for the override height"];
  }
  if (self->_overrideHeight != a3)
  {
    self->_double overrideHeight = a3;
    [(_UINavigationBarContentViewLayout *)self _updateHeightConstraints];
  }
}

- (void)setInlineSearchBarGroup:(id)a3
{
  double v5 = (_UIBarButtonItemSearchBarGroup *)a3;
  if (self->_inlineSearchBarGroup != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_inlineSearchBarGroup, a3);
    [(_UINavigationBarContentViewLayout *)self _updateSearchGroupLocation];
    double v5 = v6;
  }
}

- (void)setCustomizationIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = self->_customizationIdentifier;
  double v6 = (NSString *)v4;
  id v13 = v6;
  if (v5 == v6)
  {

LABEL_11:
    double v8 = v13;
    goto LABEL_12;
  }
  if (!v6 || !v5)
  {

    double v8 = v13;
LABEL_8:
    double v9 = (NSString *)[(NSString *)v8 copy];
    customizationIdentifier = self->_customizationIdentifier;
    self->_customizationIdentifier = v9;

    double v11 = self->_customizationIdentifier;
    if (v11)
    {
      double v12 = +[_UIButtonBarGroupOrderer groupOrdererForCustomizationIdentifier:]((uint64_t)_UIButtonBarGroupOrderer, v11);
      [(_UIButtonBar *)self->_centerBar setGroupOrderer:v12];
    }
    else
    {
      [(_UIButtonBar *)self->_centerBar setGroupOrderer:0];
    }
    goto LABEL_11;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  double v8 = v13;
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_12:
}

- (_UINavigationBarAugmentedTitleView)augmentedTitleView
{
  return self->_augmentedTitleView;
}

- (void)setAdditionalOverflowItems:(id)a3
{
  double v5 = (UIDeferredMenuElement *)a3;
  if (self->_additionalOverflowItems != v5) {
    objc_storeStrong((id *)&self->_additionalOverflowItems, a3);
  }
  [(UIBarButtonItem *)self->_overflowItem _updateMenuInPlace];
}

- (_UIBarButtonItemSearchBarGroup)trailingSearchBarGroup
{
  if (self->_placeInlineSearchBarInCenter) {
    return (_UIBarButtonItemSearchBarGroup *)0;
  }
  else {
    return self->_inlineSearchBarGroup;
  }
}

- (void)setTrailingGroupsEnabled:(BOOL)a3
{
  if (self->_trailingGroupsEnabled != a3)
  {
    self->_trailingGroupsEnabled = a3;
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    if (self->_trailingGroupsEnabled)
    {
      [(_UINavigationBarContentViewLayout *)self _updateTrailingBarConstraints];
      trailingBarConstraints = self->_trailingBarConstraints;
      [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:trailingBarConstraints];
    }
    else
    {
      [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_trailingBarConstraints];
      double v5 = [(_UIButtonBar *)self->_trailingBar view];
      [v5 removeFromSuperview];

      double v6 = self->_trailingBarConstraints;
      self->_trailingBarConstraints = 0;
    }
  }
}

- (void)setFixedTrailingGroup:(id)a3
{
  double v5 = (UIBarButtonItemGroup *)a3;
  if (self->_fixedTrailingGroup != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_fixedTrailingGroup, a3);
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    double v5 = v6;
  }
}

- (UIDeferredMenuElement)additionalOverflowItems
{
  return self->_additionalOverflowItems;
}

- (void)setLeadingGroupsMode:(int64_t)a3
{
  int64_t leadingGroupsMode = self->_leadingGroupsMode;
  if (leadingGroupsMode != a3)
  {
    self->_int64_t leadingGroupsMode = a3;
    if (a3 != 1 || leadingGroupsMode == 1)
    {
      if (a3 != 1 && leadingGroupsMode == 1)
      {
        [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_leadingBarConstraints];
        double v6 = [(_UIButtonBar *)self->_leadingBar view];
        [v6 removeFromSuperview];

        leadingBarConstraints = self->_leadingBarConstraints;
        self->_leadingBarConstraints = 0;
      }
    }
    else
    {
      [(_UINavigationBarContentViewLayout *)self _updateLeadingBarConstraints];
      double v5 = self->_leadingBarConstraints;
      [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:v5];
    }
  }
}

- (void)setLeadingGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarContentViewLayout *)self leadingBar];
  [v5 setBarButtonGroups:v4];
}

- (void)setTrailingGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarContentViewLayout *)self trailingBar];
  [v5 setBarButtonGroups:v4];
}

- (void)setHasFakedBackButton:(BOOL)a3
{
  if (self->_hasFakedBackButton != a3) {
    self->_hasFakedBackButton = a3;
  }
}

- (void)setEnableAlternatePopItem:(BOOL)a3
{
  if (self->_enableAlternatePopItem != a3)
  {
    self->_enableAlternatePopItem = a3;
    -[_UINavigationBarContentViewLayout _updateFixedLeadingGroups](self);
  }
}

- (void)setCenterGroupsMode:(int64_t)a3
{
  int64_t centerGroupsMode = self->_centerGroupsMode;
  if (centerGroupsMode != a3)
  {
    self->_int64_t centerGroupsMode = a3;
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
    if (a3 != 1 || centerGroupsMode == 1)
    {
      if (a3 != 1 && centerGroupsMode == 1)
      {
        [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_centerBarConstraints];
        char v7 = [(_UIButtonBar *)self->_centerBar view];
        [v7 removeFromSuperview];

        centerBarConstraints = self->_centerBarConstraints;
        self->_centerBarConstraints = 0;
      }
    }
    else
    {
      [(_UINavigationBarContentViewLayout *)self _updateCenterBarConstraints];
      double v6 = self->_centerBarConstraints;
      [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:v6];
    }
  }
}

- (void)setCenterBarGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarContentViewLayout *)self centerBar];
  [v5 setBarButtonGroups:v4];
}

- (_UIBarButtonItemSearchBarGroup)centerSearchBarGroup
{
  if (self->_placeInlineSearchBarInCenter) {
    return self->_inlineSearchBarGroup;
  }
  else {
    return (_UIBarButtonItemSearchBarGroup *)0;
  }
}

- (void)setKeepsSnapshotsInHierarchy:(BOOL)a3
{
  self->_keepsSnapshotsInHierarchCGFloat y = a3;
}

- (void)removeAllSnapshots
{
  if (!self->_keepsSnapshotsInHierarchy)
  {
    [(UIView *)self->_titleViewSnapshot removeFromSuperview];
    titleViewSnapshot = self->_titleViewSnapshot;
    self->_titleViewSnapshot = 0;

    [(UIView *)self->_leadingBarSnapshot removeFromSuperview];
    leadingBarSnapshot = self->_leadingBarSnapshot;
    self->_leadingBarSnapshot = 0;

    [(UIView *)self->_trailingBarSnapshot removeFromSuperview];
    trailingBarSnapshot = self->_trailingBarSnapshot;
    self->_trailingBarSnapshot = 0;
  }
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
  if (self->_wantsHostedTabBarMetrics != a3)
  {
    self->_wantsHostedTabBarMetrics = a3;
    [(_UINavigationBarContentViewLayout *)self updateTitleHeight];
  }
}

- (void)setMaximumBackButtonWidth:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_maximumBackButtonWidth != v3)
  {
    self->_double maximumBackButtonWidth = v3;
    [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
  }
}

- (void)setBackButton:(id)a3
{
  id v5 = (_UIButtonBarButton *)a3;
  if (self->_backButton != v5)
  {
    char v7 = v5;
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_backButtonConstraints];
    [(UIView *)self->_backButton removeFromSuperview];
    objc_storeStrong((id *)&self->_backButton, a3);
    backButtonConstraints = self->_backButtonConstraints;
    self->_backButtonConstraints = 0;

    [(_UIButtonBarButton *)self->_backButton setAppearanceData:self->_backButtonAppearance];
    [(_UINavigationBarContentViewLayout *)self _updateBackButtonConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_backButtonConstraints];
    [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
    id v5 = v7;
  }
}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  if (self->_titlePositionAdjustment.horizontal != a3.horizontal
    || self->_titlePositionAdjustment.vertical != a3.vertical)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
    self->_titlePositionAdjustment.CGFloat horizontal = horizontal;
    self->_titlePositionAdjustment.CGFloat vertical = vertical;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
    double v8 = self->_titleViewConstraints;
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:v8];
  }
}

- (void)configureWithoutTitle
{
  BOOL titleEnabled = self->_titleEnabled;
  self->_BOOL titleEnabled = 0;
  [(_UINavigationBarTitleControl *)self->_titleControl setTitle:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleAttributes:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleView:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleMenuProvider:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:0];
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (titleEnabled)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
    [(UIView *)self->_titleControl removeFromSuperview];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;
  }
}

- (void)setPlainItemAppearance:(id)a3
{
  id v4 = (_UIBarButtonItemData *)[a3 copy];
  plainItemAppearance = self->_plainItemAppearance;
  self->_plainItemAppearance = v4;

  [(_UIButtonBar *)self->_leadingBar setPlainItemAppearance:self->_plainItemAppearance];
  double v6 = self->_plainItemAppearance;
  trailingBar = self->_trailingBar;
  [(_UIButtonBar *)trailingBar setPlainItemAppearance:v6];
}

- (void)setDoneItemAppearance:(id)a3
{
  id v4 = (_UIBarButtonItemData *)[a3 copy];
  doneItemAppearance = self->_doneItemAppearance;
  self->_doneItemAppearance = v4;

  [(_UIButtonBar *)self->_leadingBar setDoneItemAppearance:self->_doneItemAppearance];
  double v6 = self->_doneItemAppearance;
  trailingBar = self->_trailingBar;
  [(_UIButtonBar *)trailingBar setDoneItemAppearance:v6];
}

- (void)setBackButtonAppearance:(id)a3
{
  id v4 = (_UIBarButtonItemData *)[a3 copy];
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v4;

  double v6 = self->_backButtonAppearance;
  backButton = self->_backButton;
  [(_UIButtonBarButton *)backButton setAppearanceData:v6];
}

- (UIBarButtonItem)trailingVisibleItem
{
  if (self->_trailingGroupsEnabled)
  {
    trailingBar = self->_trailingBar;
    if (trailingBar)
    {
      trailingBar = [trailingBar trailingVisibleItem];
    }
  }
  else
  {
    trailingBar = 0;
  }
  return (UIBarButtonItem *)trailingBar;
}

- (UIBarButtonItem)leadingVisibleItem
{
  if (self->_leadingGroupsMode == 1)
  {
    leadingBar = self->_leadingBar;
    if (leadingBar)
    {
      leadingBar = [leadingBar leadingVisibleItem];
    }
  }
  else
  {
    leadingBar = 0;
  }
  return (UIBarButtonItem *)leadingBar;
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double leading = self->_layoutMargins.leading;
  double bottom = self->_layoutMargins.bottom;
  double trailing = self->_layoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)hasFakedBackButton
{
  return self->_hasFakedBackButton;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  BOOL v5 = self->_layoutMargins.leading == a3.leading
    && self->_layoutMargins.top == a3.top
    && self->_layoutMargins.trailing == a3.trailing
    && self->_layoutMargins.bottom == a3.bottom;
  if (!v5 || self->_hasFakedBackButton)
  {
    self->_layoutMargins = a3;
    [(_UINavigationBarContentViewLayout *)self _updateMarginConstraints];
  }
}

- (void)setActive:(BOOL)a3 contentView:(id)a4
{
  int v4 = a3;
  char v7 = (_UINavigationBarContentView *)a4;
  BOOL v10 = v7;
  if (!v7)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentViewLayout.m" lineNumber:2245 description:@"Attempt to activate a layout on a nil contentView"];

    char v7 = 0;
  }
  int active = self->_active;
  if (active == v4)
  {
    if (self->_contentView != v7)
    {
      [(_UINavigationBarContentViewLayout *)self _removeContentAndInvalidateConstraints];
      self->_contentView = v10;
      [(_UINavigationBarContentViewLayout *)self _prepareForNewContentView];
      int active = self->_active;
    }
    if (!active) {
      goto LABEL_12;
    }
LABEL_11:
    [(_UINavigationBarContentViewLayout *)self _activateAllConstraints];
    goto LABEL_12;
  }
  if (!self->_active && v4)
  {
    self->_int active = 1;
    goto LABEL_11;
  }
  if (self->_active && (v4 & 1) == 0)
  {
    self->_int active = 0;
    [(_UINavigationBarContentViewLayout *)self _deactivateAllConstraints];
  }
LABEL_12:
}

- (void)setMinimumBackButtonWidth:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_minimumBackButtonWidth != v3)
  {
    self->_double minimumBackButtonWidth = v3;
    [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
  }
}

- (void)setRequestedContentSize:(int64_t)a3
{
  if (!a3)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentViewLayout.m" lineNumber:1178 description:@"Automatic content size is not valid for layout calculations"];
  }
  self->_uint64_t requestedContentSize = a3;
  [(_UINavigationBarContentViewLayout *)self _resolveContentSizeForced:0];
}

- (_UIButtonBar)trailingBar
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_trailingGroupsEnabled)
  {
    trailingBar = self->_trailingBar;
    if (!trailingBar)
    {
      int v4 = [(_UINavigationBarContentViewLayout *)self _newButtonBar];
      BOOL v5 = self->_trailingBar;
      self->_trailingBar = v4;

      [(_UIButtonBar *)self->_trailingBar setForceFixedSpacing:0];
      [(_UIButtonBar *)self->_trailingBar setSupportsOverflow:_UIBarsDesktopNavigationBarEnabled()];
      [(_UIButtonBar *)self->_trailingBar setGroupOrderer:0];
      [(_UIButtonBar *)self->_trailingBar setDelegate:self];
      if (!self->_overflowGroup)
      {
        double v6 = [UIBarButtonItemGroup alloc];
        char v7 = [(_UINavigationBarContentViewLayout *)self _overflowItem];
        v14[0] = v7;
        double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        double v9 = [(UIBarButtonItemGroup *)v6 initWithBarButtonItems:v8 representativeItem:0];
        overflowGroup = self->_overflowGroup;
        self->_overflowGroup = v9;

        [(_UINavigationBarContentViewLayout *)self _setOverflowGroupHidden:1];
        double v11 = [(_UINavigationBarContentViewLayout *)self _overflowItem];
        [(_UIButtonBar *)self->_trailingBar setPopOverPresentingSourceItem:v11];
      }
      -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
      trailingBar = self->_trailingBar;
    }
    double v12 = trailingBar;
  }
  else
  {
    double v12 = 0;
  }
  return v12;
}

- (_UIButtonBar)leadingBar
{
  if (self->_leadingGroupsMode)
  {
    leadingBar = self->_leadingBar;
    if (!leadingBar)
    {
      int v4 = [(_UINavigationBarContentViewLayout *)self _newButtonBar];
      BOOL v5 = self->_leadingBar;
      self->_leadingBar = v4;

      [(_UIButtonBar *)self->_leadingBar setForceFixedSpacing:0];
      [(_UIButtonBar *)self->_leadingBar setSupportsOverflow:_UIBarsDesktopNavigationBarEnabled()];
      [(_UIButtonBar *)self->_leadingBar setGroupOrderer:0];
      [(_UIButtonBar *)self->_leadingBar setDelegate:self];
      -[_UINavigationBarContentViewLayout _updateFixedLeadingGroups](self);
      leadingBar = self->_leadingBar;
    }
    double v6 = leadingBar;
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (_UIButtonBar)centerBar
{
  if (self->_centerGroupsMode)
  {
    centerBar = self->_centerBar;
    if (!centerBar)
    {
      int v4 = [(_UINavigationBarContentViewLayout *)self _newButtonBar];
      BOOL v5 = self->_centerBar;
      self->_centerBar = v4;

      [(_UIButtonBar *)self->_centerBar setForceFixedSpacing:1];
      [(_UIButtonBar *)self->_centerBar setSupportsOverflow:1];
      [(_UIButtonBar *)self->_centerBar setSupportsAlwaysOverflowGroups:1];
      customizationIdentifier = self->_customizationIdentifier;
      if (customizationIdentifier)
      {
        char v7 = +[_UIButtonBarGroupOrderer groupOrdererForCustomizationIdentifier:]((uint64_t)_UIButtonBarGroupOrderer, customizationIdentifier);
        [(_UIButtonBar *)self->_centerBar setGroupOrderer:v7];
      }
      else
      {
        [(_UIButtonBar *)self->_centerBar setGroupOrderer:0];
      }
      [(_UIButtonBar *)self->_centerBar setDelegate:self];
      -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
      centerBar = self->_centerBar;
    }
    double v8 = centerBar;
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (_UIButtonBarButton)backButton
{
  return self->_backButton;
}

- (id)_overflowItem
{
  v21[1] = *MEMORY[0x1E4F143B8];
  overflowItem = self->_overflowItem;
  if (!overflowItem)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke;
    v18[3] = &unk_1E52DE520;
    objc_copyWeak(&v19, &location);
    BOOL v5 = +[UIDeferredMenuElement elementWithUncachedProvider:v18];
    v21[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    char v7 = +[UIMenu menuWithChildren:v6];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_2;
    BOOL v16 = &unk_1E52DE570;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a2;
    [v7 setHeaderViewProvider:&v13];
    double v8 = [UIBarButtonItem alloc];
    uint64_t v9 = -[UIBarButtonItem initWithImage:menu:](v8, "initWithImage:menu:", 0, v7, v13, v14, v15, v16);
    double v11 = self->_overflowItem;
    p_overflowItem = &self->_overflowItem;
    *p_overflowItem = (UIBarButtonItem *)v9;

    objc_destroyWeak(v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    overflowItem = *p_overflowItem;
  }
  return overflowItem;
}

- (void)_updateFixedLeadingGroups
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (val)
  {
    if (*((void *)val + 67) == 1)
    {
      uint64_t v2 = (void *)*((void *)val + 38);
      if (v2)
      {
        if (*((unsigned char *)val + 289))
        {
          uint64_t v3 = *((void *)val + 31);
          if (!v3)
          {
            objc_initWeak(&location, val);
            int v4 = [UIBarButtonItem alloc];
            BOOL v5 = +[UIImage systemImageNamed:@"sidebar.leading"];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            void v14[2] = __62___UINavigationBarContentViewLayout__updateFixedLeadingGroups__block_invoke;
            v14[3] = &unk_1E52DDB60;
            objc_copyWeak(&v15, &location);
            double v6 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:v5 identifier:0 handler:v14];
            char v7 = [(UIBarButtonItem *)v4 initWithPrimaryAction:v6];

            double v8 = [UIBarButtonItemGroup alloc];
            v18[0] = v7;
            uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
            uint64_t v10 = [(UIBarButtonItemGroup *)v8 initWithBarButtonItems:v9 representativeItem:0];
            double v11 = (void *)*((void *)val + 31);
            *((void *)val + 31) = v10;

            objc_destroyWeak(&v15);
            objc_destroyWeak(&location);
            uint64_t v3 = *((void *)val + 31);
          }
          uint64_t v17 = v3;
          double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          [*((id *)val + 38) setFixedLeadingGroups:v12];
        }
        else
        {
          uint64_t v13 = MEMORY[0x1E4F1CBF0];
          [v2 setFixedLeadingGroups:v13];
        }
      }
    }
  }
}

- (_UINavigationBarContentViewLayout)initWithContentView:(id)a3
{
  int v4 = (_UINavigationBarContentView *)a3;
  v24.receiver = self;
  v24.super_class = (Class)_UINavigationBarContentViewLayout;
  BOOL v5 = [(_UINavigationBarContentViewLayout *)&v24 init];
  double v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    *(int64x2_t *)&v5->_uint64_t requestedContentSize = vdupq_n_s64(2uLL);
    [(_UINavigationBarContentViewLayout *)v5 baseHeight];
    v6->_double resolvedHeight = v7;
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"BackButton(layout=%p)", v6);
    uint64_t v9 = CreateLayoutGuide(v8, v4);
    backButtonGuide = v6->_backButtonGuide;
    v6->_backButtonGuide = (UILayoutGuide *)v9;

    double v11 = objc_msgSend(NSString, "stringWithFormat:", @"LeadingBar(layout=%p)", v6);
    uint64_t v12 = CreateLayoutGuide(v11, v4);
    leadingBarGuide = v6->_leadingBarGuide;
    v6->_leadingBarGuide = (UILayoutGuide *)v12;

    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"TitleView(layout=%p)", v6);
    uint64_t v15 = CreateLayoutGuide(v14, v4);
    titleViewGuide = v6->_titleViewGuide;
    v6->_titleViewGuide = (UILayoutGuide *)v15;

    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"CenterBar(layout=%p)", v6);
    uint64_t v18 = CreateLayoutGuide(v17, v4);
    centerBarGuide = v6->_centerBarGuide;
    v6->_centerBarGuide = (UILayoutGuide *)v18;

    CGFloat v20 = objc_msgSend(NSString, "stringWithFormat:", @"TrailingBar(layout=%p)", v6);
    uint64_t v21 = CreateLayoutGuide(v20, v4);
    trailingBarGuide = v6->_trailingBarGuide;
    v6->_trailingBarGuide = (UILayoutGuide *)v21;

    [(_UINavigationBarContentViewLayout *)v6 _updateLayoutGuideConstraints];
    v6->_double inlineTitleViewAlpha = 1.0;
  }

  return v6;
}

- (NSArray)trailingGroups
{
  trailingBar = self->_trailingBar;
  if (trailingBar)
  {
    uint64_t v3 = [(_UIButtonBar *)trailingBar barButtonGroups];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (BOOL)_augmentedTitleViewIgnoresResolvedHeight
{
  if ([(_UINavigationBarContentView *)self->_contentView toolbarStyle]
    && ![(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _hideNavigationBarCenterBarButtons]|| ![(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _hideNavigationBarBackButton]|| ![(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _hideNavigationBarStandardTitle]|| ![(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _hideNavigationBarLeadingBarButtons])
  {
    return 0;
  }
  augmentedTitleView = self->_augmentedTitleView;
  return [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _hideNavigationBarTrailingBarButtons];
}

- (id)traitOverridesForChild:(id)a3
{
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView) {
    BOOL v4 = augmentedTitleView == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v7 = a3;
    double v8 = [(_UINavigationBarContentViewLayout *)self augmentedTitleNavigationBarTraits];
    BOOL v5 = [v7 _traitCollectionOverridesForNavigationBarTraitCollection:v8];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (UITraitCollection)augmentedTitleNavigationBarTraits
{
  return self->_augmentedTitleNavigationBarTraits;
}

- (void)buttonBarDidLayout:(id)a3
{
  BOOL v4 = (_UIButtonBar *)a3;
  if (self->_trailingBar != v4
    || (v9 = v4, BOOL v5 = [(UIBarButtonItemGroup *)self->_inlineSearchBarGroup isHidden], v4 = v9, v5)
    || self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange)
  {
    if (self->_trailingBar != v4
      || (v10 = v4, BOOL v6 = [(UIBarButtonItemGroup *)self->_inlineSearchBarGroup isHidden], v4 = v10, v6))
    {
      self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 0;
    }
  }
  else
  {
    id v7 = -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
    double v8 = [v7 _searchController];
    [v8 _hostingNavigationBarDidLayoutInlineSearchBar];

    BOOL v4 = v9;
  }
}

- (void)configureWithTitleView:(id)a3 compressionResistancePriority:(float)a4
{
  id v11 = a3;
  if (self->_titleEnabled)
  {
    BOOL v6 = [(_UINavigationBarTitleControl *)self->_titleControl title];
    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [(_UINavigationBarTitleControl *)self->_titleControl titleView];
      BOOL v7 = v8 != v11;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  self->_BOOL titleEnabled = 1;
  [(_UINavigationBarContentViewLayout *)self _createTitleControlIfNecessary];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitle:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleAttributes:0];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleView:v11];
  *(float *)&double v9 = a4;
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleViewCompressionResistancePriority:v9];
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleMenuProvider:self->_titleMenuProvider];
  [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:self->_documentProperties];
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (v7)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_titleViewConstraints];
  }
}

- (void)_updateAugmentedTitleViewLayout
{
  [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_alignmentConstraints];
  alignmentConstraints = self->_alignmentConstraints;
  self->_alignmentConstraints = 0;

  [(_UINavigationBarContentViewLayout *)self _updateAlignmentConstraints];
  [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_alignmentConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
  [(_UINavigationBarContentViewLayout *)self _updateHeightConstraints];
}

- (void)_activateConstraintsAndUpdateViewOrderIfNecessary:(id)a3
{
  if (a3 && self->_active)
  {
    id v4 = a3;
    [(_UINavigationBarContentViewLayout *)self _updateSubviewOrder];
    [MEMORY[0x1E4F5B268] activateConstraints:v4];
  }
}

- (void)_deactivateConstraintsIfNecessary:(id)a3
{
  if (a3)
  {
    if (self->_active) {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    }
  }
}

- (double)maximumBackButtonWidth
{
  return self->_maximumBackButtonWidth;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (UILayoutGuide)tabBarContentGuide
{
  return self->_tabBarContentGuide;
}

- (void)setAugmentedTitleNavigationBarTraits:(id)a3
{
}

- (id)_newButtonBar
{
  uint64_t v3 = objc_alloc_init(_UIButtonBar);
  [(_UINavigationBarContentView *)self->_contentView buttonBarMinimumInterItemSpace];
  -[_UIButtonBar setMinimumInterItemSpace:](v3, "setMinimumInterItemSpace:");
  [(_UIButtonBar *)v3 setAllowsViewWrappers:1];
  id v4 = [(_UIButtonBar *)v3 view];
  objc_msgSend(v4, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);

  BOOL v5 = [(_UIButtonBar *)v3 view];
  [v5 setInsetsLayoutMarginsFromSafeArea:0];

  [(_UIButtonBar *)v3 set_appearanceDelegate:self->_contentView];
  [(_UIButtonBar *)v3 setPlainItemAppearance:self->_plainItemAppearance];
  [(_UIButtonBar *)v3 setDoneItemAppearance:self->_doneItemAppearance];
  BOOL v6 = [(UIView *)self->_contentView traitCollection];
  BOOL v7 = +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", [v6 userInterfaceIdiom]);
  objc_opt_class();
  id v8 = _UIButtonBarButtonMakerForVisualProvider();
  [(_UIButtonBar *)v3 setViewUpdater:v8];

  return v3;
}

- (BOOL)canUpdateAdditionalOverflowItemsInPlace
{
  return ![(UIBarButtonItemGroup *)self->_overflowGroup isHidden];
}

- (void)_updateFixedTrailingGroups
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 290);
    uint64_t v3 = *(void **)(a1 + 320);
    if (v2 && v3)
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      [v5 addObject:*(void *)(a1 + 224)];
      if (!*(unsigned char *)(a1 + 291) && *(void *)(a1 + 240)) {
        objc_msgSend(v5, "addObject:");
      }
      id v4 = v5;
      if (*(void *)(a1 + 552))
      {
        objc_msgSend(v5, "addObject:");
        id v4 = v5;
      }
      [*(id *)(a1 + 320) setFixedTrailingGroups:v4];
    }
    else
    {
      [v3 setFixedTrailingGroups:0];
    }
  }
}

- (void)_updateSearchGroupLocation
{
  if (self->_placeInlineSearchBarInCenter)
  {
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
  }
  else
  {
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
  }
}

- (void)_updateFixedCenterGroups
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 544);
    uint64_t v3 = *(void **)(a1 + 312);
    if (v2 == 1 && v3)
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      id v5 = v4;
      id v6 = v4;
      if (*(unsigned char *)(a1 + 291) && *(void *)(a1 + 240))
      {
        objc_msgSend(v4, "addObject:");
        id v5 = v6;
      }
      [*(id *)(a1 + 312) setFixedLeadingGroups:v5];
    }
    else
    {
      [v3 setFixedLeadingGroups:0];
    }
  }
}

- (void)updateAugmentedTitleViewHeight
{
  if (self->_augmentedTitleView) {
    [(_UINavigationBarContentViewLayout *)self _updateHeightConstraints];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButtonAppearance, 0);
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_storeStrong((id *)&self->_plainItemAppearance, 0);
  objc_storeStrong((id *)&self->_additionalOverflowItems, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_augmentedTitleNavigationBarTraits, 0);
  objc_storeStrong((id *)&self->_augmentedTitleView, 0);
  objc_storeStrong((id *)&self->_activeRenamerSession, 0);
  objc_storeStrong((id *)&self->_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_tabBarContentGuide, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_trailingBarGuide, 0);
  objc_storeStrong((id *)&self->_centerBarGuide, 0);
  objc_storeStrong((id *)&self->_titleViewGuide, 0);
  objc_storeStrong((id *)&self->_leadingBarGuide, 0);
  objc_storeStrong((id *)&self->_backButtonGuide, 0);
  objc_storeStrong((id *)&self->_trailingBar, 0);
  objc_storeStrong((id *)&self->_centerBar, 0);
  objc_storeStrong((id *)&self->_leadingBar, 0);
  objc_storeStrong((id *)&self->_titleControl, 0);
  objc_storeStrong((id *)&self->_trailingBarSnapshot, 0);
  objc_storeStrong((id *)&self->_titleViewSnapshot, 0);
  objc_storeStrong((id *)&self->_leadingBarSnapshot, 0);
  objc_storeStrong((id *)&self->_alternatePopGroup, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarGroup, 0);
  objc_storeStrong((id *)&self->_overflowItem, 0);
  objc_storeStrong((id *)&self->_overflowGroup, 0);
  objc_storeStrong((id *)&self->_trailingBarConstraints, 0);
  objc_storeStrong((id *)&self->_centerBarConstraints, 0);
  objc_storeStrong((id *)&self->_augmentedTitleViewConstraints, 0);
  objc_storeStrong((id *)&self->_renamingContentViewInsetConstraint, 0);
  objc_storeStrong((id *)&self->_renamingContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
  objc_storeStrong((id *)&self->_leadingBarConstraints, 0);
  objc_storeStrong((id *)&self->_backButtonConstraints, 0);
  objc_storeStrong((id *)&self->_heightConstraints, 0);
  objc_storeStrong((id *)&self->_alignmentConstraints, 0);
  objc_storeStrong((id *)&self->_centerBarGuideTabBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_centerBarGuideTabBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideTabBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideTabBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleToTrailingBarSpacer, 0);
  objc_storeStrong((id *)&self->_centerBarToTrailingBarSpacer, 0);
  objc_storeStrong((id *)&self->_titleToCenterBarSpacer, 0);
  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_backButtonMaximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backButtonMinimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarToTitleSpacer, 0);
  objc_storeStrong((id *)&self->_backButtonToLeadingBarSpacer, 0);
  objc_storeStrong((id *)&self->_edgeToBackButtonSpacer, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_renamingContentView, 0);
}

- (NSString)description
{
  v34.receiver = self;
  v34.super_class = (Class)_UINavigationBarContentViewLayout;
  uint64_t v3 = [(_UINavigationBarContentViewLayout *)&v34 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_contentView)
  {
    if (self->_active) {
      id v5 = @" active";
    }
    else {
      id v5 = &stru_1ED0E84C0;
    }
    [v4 appendFormat:@" contentView=%p %@\n", self->_contentView, v5];
    [v4 appendFormat:@" formatting: alignment="];
    unint64_t resolvedAlignment = self->_resolvedAlignment;
    int64_t alignment = self->_alignment;
    id v8 = StringForAlignment(resolvedAlignment);
    if (resolvedAlignment == alignment)
    {
      [v4 appendString:v8];
    }
    else
    {
      double v9 = StringForAlignment(self->_alignment);
      [v4 appendFormat:@"%@[from %@]", v8, v9];
    }
    uint64_t v10 = StringForContentSize(self->_resolvedContentSize);
    [v4 appendFormat:@" contentSize=%@", v10];

    unint64_t requestedContentSize = self->_requestedContentSize;
    if (requestedContentSize != self->_resolvedContentSize)
    {
      uint64_t v12 = StringForContentSize(requestedContentSize);
      [v4 appendFormat:@"(%@)", v12];
    }
    objc_msgSend(v4, "appendFormat:", @" resolvedHeight=%f", *(void *)&self->_resolvedHeight);
    CGFloat top = self->_layoutMargins.top;
    double leading = self->_layoutMargins.leading;
    double bottom = self->_layoutMargins.bottom;
    double trailing = self->_layoutMargins.trailing;
    if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
    {
      uint64_t v17 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
      [v4 appendFormat:@" layoutMargins=%@", v17];
    }
    if (self->_overrideHeight > 0.0) {
      objc_msgSend(v4, "appendFormat:", @" overrideHeight=%f", *(void *)&self->_overrideHeight);
    }
    if (self->_hasFakedBackButton) {
      [v4 appendString:@" hasFakedBackButton"];
    }
    CGFloat horizontal = self->_titlePositionAdjustment.horizontal;
    if (horizontal == 0.0)
    {
      double vertical = self->_titlePositionAdjustment.vertical;
      if (vertical == 0.0)
      {
        CGFloat v20 = NSStringFromUIOffset(*(UIOffset *)&horizontal);
        [v4 appendFormat:@" titlePositionAdjustment=%@", v20];
      }
    }
    [v4 appendFormat:@"\n layoutGuides: backButtonGuide=%p, leadingBarGuide=%p, titleViewGuide=%p, centerBarGuide=%p, trailingBarGuide=%p", self->_backButtonGuide, self->_leadingBarGuide, self->_titleViewGuide, self->_centerBarGuide, self->_trailingBarGuide];
    [v4 appendString:@"\n views:"];
    if (self->_augmentedTitleView) {
      objc_msgSend(v4, "appendFormat:", @" augmentedTitleView=%p", self->_augmentedTitleView);
    }
    backButton = self->_backButton;
    if (backButton)
    {
      objc_msgSend(v4, "appendFormat:", @" backButton=%p minimumWidth=%f maximumWidth=%f", backButton, *(void *)&self->_minimumBackButtonWidth, *(void *)&self->_maximumBackButtonWidth);
    }
    else if (self->_hasFakedBackButton)
    {
      [v4 appendString:@" fakedBackButton"];
    }
    if (self->_leadingGroupsMode)
    {
      leadingBar = self->_leadingBar;
      double v23 = [(_UIButtonBar *)leadingBar view];
      objc_msgSend(v4, "appendFormat:", @" leadingBar=%p view=%p", leadingBar, v23);

      if (self->_leadingGroupsMode == 2) {
        [v4 appendString:@" autospilling"];
      }
    }
    if (self->_titleEnabled)
    {
      titleControl = self->_titleControl;
      int v25 = [(_UINavigationBarTitleControl *)titleControl _debugInfo];
      [v4 appendFormat:@" titleView=%p %@", titleControl, v25];

      if (self->_inlineTitleViewAlpha < 1.0) {
        objc_msgSend(v4, "appendFormat:", @" alpha=%f", *(void *)&self->_inlineTitleViewAlpha);
      }
    }
    if (self->_centerGroupsMode)
    {
      centerBar = self->_centerBar;
      double v27 = [(_UIButtonBar *)centerBar view];
      objc_msgSend(v4, "appendFormat:", @" centerBar=%p view=%p", centerBar, v27);

      if (self->_centerGroupsMode == 2) {
        [v4 appendString:@" autospilling"];
      }
    }
    if (self->_trailingGroupsEnabled)
    {
      trailingBar = self->_trailingBar;
      double v29 = [(_UIButtonBar *)trailingBar view];
      objc_msgSend(v4, "appendFormat:", @" trailingBar=%p view=%p", trailingBar, v29);

      objc_msgSend(v4, "appendFormat:", @" overflowGroup=%p", self->_overflowGroup);
      objc_msgSend(v4, "appendFormat:", @" searchGroup=%p", self->_inlineSearchBarGroup);
    }
    [v4 appendString:@"\n constraints:"];
    if (self->_leadingBarConstraints) {
      objc_msgSend(v4, "appendFormat:", @" leadingBarConstraints=%p", self->_leadingBarConstraints);
    }
    if (self->_titleViewConstraints) {
      objc_msgSend(v4, "appendFormat:", @" titleViewConstraints=%p", self->_titleViewConstraints);
    }
    if (self->_centerBarConstraints) {
      objc_msgSend(v4, "appendFormat:", @" centerBarConstraints=%p", self->_centerBarConstraints);
    }
    if (self->_trailingBarConstraints) {
      objc_msgSend(v4, "appendFormat:", @" trailingBarConstraints=%p", self->_trailingBarConstraints);
    }
    if (self->_alignmentConstraints) {
      objc_msgSend(v4, "appendFormat:", @" alignmentConstraints=%p", self->_alignmentConstraints);
    }
    if (self->_heightConstraints) {
      objc_msgSend(v4, "appendFormat:", @" heightConstraints=%p", self->_heightConstraints);
    }
    if (self->_backButtonConstraints) {
      objc_msgSend(v4, "appendFormat:", @" backButtonConstraints=%p", self->_backButtonConstraints);
    }
    if ([(NSLayoutConstraint *)self->_backButtonMinimumWidthConstraint isActive]) {
      double v30 = "";
    }
    else {
      double v30 = "in";
    }
    backButtonMinimumWidthConstraint = self->_backButtonMinimumWidthConstraint;
    if ([(NSLayoutConstraint *)self->_backButtonMaximumWidthConstraint isActive]) {
      double v32 = "";
    }
    else {
      double v32 = "in";
    }
    objc_msgSend(v4, "appendFormat:", @" backButtonMinimumWidthConstraint[%sactive]=%p backButtonMaximumWidthConstraint[%sactive]=%p", v30, backButtonMinimumWidthConstraint, v32, self->_backButtonMaximumWidthConstraint);
    if (self->_augmentedTitleViewConstraints) {
      objc_msgSend(v4, "appendFormat:", @" augmentedTitleViewConstraints=%p", self->_augmentedTitleViewConstraints);
    }
  }
  else
  {
    [v4 appendString:@" invalid"];
  }
  return (NSString *)v4;
}

- (double)preferredHeight
{
  return self->_resolvedHeight + self->_resolvedExtension;
}

- (void)_disableLayoutFlushing:(BOOL)a3 onlyViews:(id)a4 exceptViews:(id)a5
{
  BOOL v6 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  titleViewSnapshot = (_UINavigationBarTitleControl *)self->_titleViewSnapshot;
  if (!titleViewSnapshot) {
    titleViewSnapshot = self->_titleControl;
  }
  v23[0] = titleViewSnapshot;
  leadingBarSnapshot = self->_leadingBarSnapshot;
  uint64_t v12 = leadingBarSnapshot;
  if (!leadingBarSnapshot)
  {
    uint64_t v12 = [(_UIButtonBar *)self->_leadingBar view];
  }
  v23[1] = v12;
  trailingBarSnapshot = self->_trailingBarSnapshot;
  uint64_t v14 = trailingBarSnapshot;
  if (!trailingBarSnapshot)
  {
    uint64_t v14 = [(_UIButtonBar *)self->_trailingBar view];
  }
  v23[2] = v14;
  v23[3] = self->_backButton;
  if (!trailingBarSnapshot)
  {

    if (leadingBarSnapshot) {
      goto LABEL_9;
    }
LABEL_30:

    goto LABEL_9;
  }
  if (!leadingBarSnapshot) {
    goto LABEL_30;
  }
LABEL_9:
  for (uint64_t i = 0; i != 4; ++i)
  {
    id v16 = (id)v23[i];
    uint64_t v17 = v16;
    if (!v16) {
      goto LABEL_25;
    }
    if (v6)
    {
      uint64_t v18 = [v16 _disableLayoutFlushingCount];
      if (v18 >= 1) {
        uint64_t v19 = v18 + 1;
      }
      else {
        uint64_t v19 = 1;
      }
      [v17 _setDisableLayoutFlushingCount:v19];
      [v17 _disableLayoutFlushing];
      goto LABEL_25;
    }
    if (v8)
    {
      int v20 = [v8 containsObject:v16];
      char v21 = v20;
      if (!v9)
      {
        if (v20) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if (!v9) {
        goto LABEL_24;
      }
      char v21 = 1;
    }
    if (![v9 containsObject:v17] && (v21 & 1) != 0) {
LABEL_24:
    }
      -[UIView _popDisableLayoutFlushing](v17);
LABEL_25:
  }
  for (uint64_t j = 3; j != -1; --j)
}

- (void)freeze
{
}

- (void)unfreeze
{
}

- (void)unfreezeOnlyViews:(id)a3
{
}

- (void)unfreezeExceptViews:(id)a3
{
}

- (void)_deactivateAllConstraints
{
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_layoutGuideConstraints];
  [(NSLayoutConstraint *)self->_titleGuideTabBarLeadingConstraint setActive:0];
  [(NSLayoutConstraint *)self->_titleGuideTabBarTrailingConstraint setActive:0];
  [(_UINavigationBarContentViewLayout *)self _updateConditionalGuideConstraintsForActiveLayout:0];
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_alignmentConstraints];
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_heightConstraints];
  if (self->_backButtonConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  [(NSLayoutConstraint *)self->_backButtonMinimumWidthConstraint setActive:0];
  [(NSLayoutConstraint *)self->_backButtonMaximumWidthConstraint setActive:0];
  if (self->_leadingBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  if (self->_titleViewConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  if (self->_renamingContentViewConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  if (self->_centerBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  if (self->_trailingBarConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  if (self->_augmentedTitleViewConstraints)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F5B268];
    objc_msgSend(v3, "deactivateConstraints:");
  }
}

- (void)cleanupAfterLayoutTransitionCompleted
{
  [(_UINavigationBarContentViewLayout *)self removeAllSnapshots];
  [(_UINavigationBarContentViewLayout *)self _updateSubviewOrder];
  [(_UINavigationBarContentViewLayout *)self _deactivateAllConstraints];
  [(_UINavigationBarContentViewLayout *)self _activateAllConstraints];
}

- (void)setContentAlpha:(double)a3
{
}

- (void)setBackButtonAlpha:(double)a3 titleLabelAlpha:(double)a4 titleViewAlpha:(double)a5 barsAlpha:(double)a6
{
  double v9 = a3;
  double v11 = 0.0;
  BOOL v12 = a3 > 0.0;
  double v13 = 0.0;
  if (v12)
  {
    augmentedTitleView = self->_augmentedTitleView;
    double v13 = v9;
    if (augmentedTitleView) {
      [(_UINavigationBarAugmentedTitleView *)augmentedTitleView _navigationBarBackButtonAlpha];
    }
  }
  -[UIView setAlpha:](self->_backButton, "setAlpha:", v13, v9);
  self->_titleViewHidden = a5 <= 0.0;
  [(UIView *)self->_titleIconView setAlpha:a5];
  [(UIView *)self->_titleIconView setHidden:[(_UINavigationBarContentViewLayout *)self _inActiveRenameSession]];
  if (!self->_titleViewHidden)
  {
    if ([(_UINavigationBarContentViewLayout *)self _inActiveRenameSession]) {
      double v11 = 0.0;
    }
    else {
      double v11 = a5;
    }
  }
  [(_UINavigationBarTitleControl *)self->_titleControl setControlAlpha:v11];
  [(_UINavigationBarTitleControl *)self->_titleControl setContentAlpha:a4];
  if (a6 <= 0.0)
  {
    double v23 = [(_UIButtonBar *)self->_leadingBar view];
    double v16 = 0.0;
    [v23 setAlpha:0.0];

    [(UIView *)self->_leadingBarSnapshot setAlpha:0.0];
    [(UIView *)self->_titleViewSnapshot setAlpha:0.0];
    int v20 = [(_UIButtonBar *)self->_trailingBar view];
    char v21 = v20;
    double v22 = 0.0;
  }
  else
  {
    uint64_t v15 = self->_augmentedTitleView;
    double v16 = a6;
    if (v15)
    {
      [(_UINavigationBarAugmentedTitleView *)v15 _navigationBarLeadingBarButtonsAlpha];
      a6 = v17;
      [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView _navigationBarTrailingBarButtonsAlpha];
      double v16 = v18;
    }
    uint64_t v19 = [(_UIButtonBar *)self->_leadingBar view];
    [v19 setAlpha:a6];

    [(UIView *)self->_leadingBarSnapshot setAlpha:a6];
    [(UIView *)self->_titleViewSnapshot setAlpha:a6];
    int v20 = [(_UIButtonBar *)self->_trailingBar view];
    char v21 = v20;
    double v22 = v16;
  }
  [v20 setAlpha:v22];

  trailingBarSnapshot = self->_trailingBarSnapshot;
  [(UIView *)trailingBarSnapshot setAlpha:v16];
}

- (void)setContentHidden:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(_UINavigationBarContentViewLayout *)self setContentAlpha:v3];
}

- (void)setBackButtonHidden:(BOOL)a3 titleLabelHidden:(BOOL)a4 titleViewHidden:(BOOL)a5 barsHidden:(BOOL)a6
{
  double v6 = 1.0;
  if (a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  if (a4) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  if (a5) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  if (a6) {
    double v6 = 0.0;
  }
  [(_UINavigationBarContentViewLayout *)self setBackButtonAlpha:v7 titleLabelAlpha:v8 titleViewAlpha:v9 barsAlpha:v6];
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_alignmentConstraints];
    self->_int64_t alignment = a3;
    alignmentConstraints = self->_alignmentConstraints;
    self->_alignmentConstraints = 0;

    [(_UINavigationBarContentViewLayout *)self _updateAlignmentConstraints];
    double v6 = self->_alignmentConstraints;
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:v6];
  }
}

- (NSString)currentBackButtonTitle
{
  uint64_t v2 = [(_UIButtonBarButton *)self->_backButton visualProvider];
  double v3 = [v2 contentView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 currentTitle];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)_updateTitleControl
{
  [(_UINavigationBarTitleControl *)self->_titleControl setTitleMenuProvider:self->_titleMenuProvider];
  [(_UINavigationBarTitleControl *)self->_titleControl setDocumentProperties:self->_documentProperties];
  [(_UINavigationBarContentViewLayout *)self _updateTitleControlVisibility];
}

- (void)_updateTitleControlVisibility
{
  double v3 = 0.0;
  if (!self->_titleViewHidden)
  {
    BOOL v4 = [(_UINavigationBarContentViewLayout *)self _inActiveRenameSession];
    double v3 = 1.0;
    if (v4) {
      double v3 = 0.0;
    }
  }
  [(_UINavigationBarTitleControl *)self->_titleControl setControlAlpha:v3];
  [(_UINavigationBarContentViewLayout *)self _applyInlineTitleViewAlphaImmediately];
}

- (void)_updateDocumentIconViewIfNecessary
{
  activeRenamerSession = self->_activeRenamerSession;
  [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_titleViewConstraints];
  titleViewConstraints = self->_titleViewConstraints;
  self->_titleViewConstraints = 0;

  if (activeRenamerSession)
  {
    [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_renamingContentViewConstraints];
    renamingContentViewConstraints = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;
  }
  [(UIView *)self->_titleIconView removeFromSuperview];
  titleIconView = self->_titleIconView;
  self->_titleIconView = 0;

  if ([(UIDocumentProperties *)self->_documentProperties wantsIconRepresentation])
  {
    double v7 = [(UIDocumentProperties *)self->_documentProperties _iconView];
    [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = self->_titleIconView;
    self->_titleIconView = v7;
  }
  [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
  [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_titleViewConstraints];
  if (activeRenamerSession)
  {
    [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConfiguration];
    [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_renamingContentViewConstraints];
    BOOL v9 = [(_UINavigationBarContentViewLayout *)self _renameShouldTakeOverContentView];
    [(_UINavigationBarContentViewLayout *)self setContentHidden:v9];
  }
}

- (void)_updateRenamingContentViewIfNecessary
{
  [(_UINavigationBarContentViewLayout *)self _deactivateConstraintsIfNecessary:self->_renamingContentViewConstraints];
  renamingContentView = self->_renamingContentView;
  if (self->_activeRenamerSession)
  {
    [(_UINavigationBarTitleRenamerContentView *)renamingContentView setHorizontalTextInsetDidChangeCallback:0];
    [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView removeFromSuperview];
    BOOL v4 = [(_UINavigationBarTitleRenamerSession *)self->_activeRenamerSession renamerContentView];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&self->_renamingContentView, v4);
    [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConfiguration];
    [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewConstraints];
    [(_UINavigationBarContentViewLayout *)self _activateConstraintsAndUpdateViewOrderIfNecessary:self->_renamingContentViewConstraints];
    [v4 becomeFirstResponder];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74___UINavigationBarContentViewLayout__updateRenamingContentViewIfNecessary__block_invoke;
    v8[3] = &unk_1E52DE4F8;
    objc_copyWeak(&v11, &location);
    id v5 = v4;
    id v9 = v5;
    uint64_t v10 = self;
    [v5 setHorizontalTextInsetDidChangeCallback:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_UINavigationBarTitleRenamerContentView *)renamingContentView removeFromSuperview];
    double v6 = self->_renamingContentView;
    self->_renamingContentView = 0;

    renamingContentViewConstraints = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;
  }
}

- (void)_updateRenamingContentViewVisibilityIfNecessary
{
  activeRenamerSession = self->_activeRenamerSession;
  renamingContentView = self->_renamingContentView;
  if (activeRenamerSession)
  {
    [(_UINavigationBarTitleRenamerContentView *)renamingContentView setAlpha:1.0];
    BOOL v5 = [(_UINavigationBarContentViewLayout *)self _renameShouldTakeOverContentView];
  }
  else
  {
    [(_UINavigationBarTitleRenamerContentView *)renamingContentView setAlpha:0.0];
    BOOL v5 = 0;
  }
  [(_UINavigationBarContentViewLayout *)self setContentHidden:v5];
}

- (void)setActiveRenamerSession:(id)a3
{
  BOOL v5 = (_UINavigationBarTitleRenamerSession *)a3;
  if (self->_activeRenamerSession != v5)
  {
    objc_storeStrong((id *)&self->_activeRenamerSession, a3);
    if (v5)
    {
      [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewIfNecessary];
      [(_UINavigationBarTitleRenamerContentView *)self->_renamingContentView setAlpha:0.0];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke_2;
    v6[3] = &unk_1E52DA660;
    double v7 = v5;
    double v8 = self;
    +[UIView animateWithDuration:4 delay:v9 options:v6 animations:0.3 completion:0.0];
  }
}

- (void)_didTriggerRenameAction
{
  id v3 = [(_UINavigationBarContentView *)self->_contentView delegate];
  [v3 navigationBarContentViewDidTriggerTitleRenameAction:self->_contentView];
}

- (double)baselineOffsetFromTop
{
  [(_UINavigationBarContentViewLayout *)self _inlineTitleBaselineOffset];
  double v4 = v3;
  [(UILayoutGuide *)self->_titleViewGuide layoutFrame];
  return v4 + v5;
}

- (void)updateAugmentedTitleViewLayout
{
  if (self->_augmentedTitleView) {
    [(_UINavigationBarContentViewLayout *)self _updateAugmentedTitleViewLayout];
  }
}

- (void)updateAugmentedTitleViewBackButtonConstraints
{
  if (self->_augmentedTitleView) {
    [(_UINavigationBarContentViewLayout *)self _updateBackButtonWidthConstraintsAndActivateIfNecessary];
  }
}

- (void)updateRenameForHorizontalSizeClassChangeIfNecessary
{
  if ([(_UINavigationBarContentViewLayout *)self _inActiveRenameSession])
  {
    [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewIfNecessary];
  }
}

- (NSArray)leadingGroups
{
  leadingBar = self->_leadingBar;
  if (leadingBar)
  {
    double v3 = [(_UIButtonBar *)leadingBar barButtonGroups];
  }
  else
  {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (NSArray)centerBarGroups
{
  centerBar = self->_centerBar;
  if (centerBar)
  {
    double v3 = [(_UIButtonBar *)centerBar barButtonGroups];
  }
  else
  {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (BOOL)_canCustomizeBar
{
  if (self->_customizationIdentifier && self->_centerGroupsMode == 1)
  {
    double v3 = [(UIView *)self->_contentView traitCollection];
    if ([v3 userInterfaceIdiom])
    {
      double v4 = [(UIView *)self->_contentView traitCollection];
      uint64_t v5 = [v4 userInterfaceIdiom];

      if (v5 != 6) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (id)_fixedItemsMenu
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v2 = _UINSLocalizedStringWithDefaultValue(@"Customize Toolbar", @"Customize Toolbar");
  double v3 = +[UIImage systemImageNamed:@"wrench"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __52___UINavigationBarContentViewLayout__fixedItemsMenu__block_invoke;
  id v11 = &unk_1E52DDB60;
  objc_copyWeak(&v12, &location);
  double v4 = +[UIAction actionWithTitle:v2 image:v3 identifier:0 handler:&v8];

  v14[0] = v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  double v6 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:0 options:1 children:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (_UIButtonBarButton)overflowButton
{
  return (_UIButtonBarButton *)[(UIBarButtonItem *)self->_overflowItem view];
}

- (UIBarButtonItem)overflowItem
{
  return self->_overflowItem;
}

- (UIBarButtonItem)trailingClippingItem
{
  if (self->_trailingGroupsEnabled)
  {
    trailingBar = self->_trailingBar;
    if (trailingBar)
    {
      trailingBar = [trailingBar trailingClippingItem];
    }
  }
  else
  {
    trailingBar = 0;
  }
  return (UIBarButtonItem *)trailingBar;
}

- (double)_idealBackButtonWidth
{
  backButton = self->_backButton;
  if (!backButton) {
    return 0.0;
  }
  [(UIView *)backButton frame];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (int64_t)expectedInactiveInlineSearchBarLayoutState
{
  uint64_t v3 = -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);

  if (!v3) {
    return -1;
  }
  -[_UIBarButtonItemSearchBarGroup setProvidesRestingMeasurementValues:]((uint64_t)self->_inlineSearchBarGroup, 1);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [(_UINavigationBarContentViewLayout *)(uint64_t)&v6 _resolvedButtonBarLayoutInfo];
  int64_t v4 = *((void *)&v7 + 1);
  -[_UIBarButtonItemSearchBarGroup setProvidesRestingMeasurementValues:]((uint64_t)self->_inlineSearchBarGroup, 0);
  return v4;
}

- (void)replaceTitleViewWithSnapshot
{
  if (self->_titleEnabled)
  {
    uint64_t v3 = [(UIView *)self->_titleControl snapshotViewAfterScreenUpdates:0];
    if (v3)
    {
      long long v6 = v3;
      objc_storeStrong((id *)&self->_titleViewSnapshot, v3);
      [(UIView *)self->_contentView insertSubview:v6 belowSubview:self->_titleControl];
      [(UIView *)self->_titleControl frame];
      -[UIView setFrame:](self->_titleViewSnapshot, "setFrame:");
      [(UIView *)self->_titleControl removeFromSuperview];
      titleViewConstraints = self->_titleViewConstraints;
      self->_titleViewConstraints = 0;

      titleControl = self->_titleControl;
      self->_titleControl = 0;

      uint64_t v3 = v6;
    }
  }
}

- (void)replaceLeadingBarWithSnapshot
{
  if (self->_leadingGroupsMode == 1)
  {
    uint64_t v3 = [(_UIButtonBar *)self->_leadingBar view];
    obuint64_t j = [v3 snapshotViewAfterScreenUpdates:0];

    if (obj)
    {
      objc_storeStrong((id *)&self->_leadingBarSnapshot, obj);
      contentView = self->_contentView;
      uint64_t v5 = [(_UIButtonBar *)self->_leadingBar view];
      [(UIView *)contentView insertSubview:obj belowSubview:v5];

      long long v6 = [(_UIButtonBar *)self->_leadingBar view];
      [v6 frame];
      objc_msgSend(obj, "setFrame:");

      long long v7 = [(UILayoutGuide *)self->_leadingBarGuide widthAnchor];
      long long v8 = [obj widthAnchor];
      long long v9 = [v7 constraintEqualToAnchor:v8];
      [v9 setActive:1];

      uint64_t v10 = [(_UIButtonBar *)self->_leadingBar view];
      [v10 removeFromSuperview];

      leadingBarConstraints = self->_leadingBarConstraints;
      self->_leadingBarConstraints = 0;

      leadingBar = self->_leadingBar;
      self->_leadingBar = 0;
    }
  }
}

- (void)replaceTrailingBarWithSnapshot
{
  if (self->_trailingGroupsEnabled)
  {
    uint64_t v3 = [(_UIButtonBar *)self->_trailingBar view];
    obuint64_t j = [v3 snapshotViewAfterScreenUpdates:0];

    if (obj)
    {
      objc_storeStrong((id *)&self->_trailingBarSnapshot, obj);
      contentView = self->_contentView;
      uint64_t v5 = [(_UIButtonBar *)self->_trailingBar view];
      [(UIView *)contentView insertSubview:obj belowSubview:v5];

      long long v6 = [(_UIButtonBar *)self->_trailingBar view];
      [v6 frame];
      -[UIView setFrame:](self->_trailingBarSnapshot, "setFrame:");

      long long v7 = [(UILayoutGuide *)self->_trailingBarGuide widthAnchor];
      long long v8 = [obj widthAnchor];
      long long v9 = [v7 constraintEqualToAnchor:v8];
      [v9 setActive:1];

      uint64_t v10 = [(_UIButtonBar *)self->_trailingBar view];
      [v10 removeFromSuperview];

      trailingBarConstraints = self->_trailingBarConstraints;
      self->_trailingBarConstraints = 0;

      trailingBar = self->_trailingBar;
      self->_trailingBar = 0;
    }
  }
}

- (void)removeContent
{
  [(_UINavigationBarContentViewLayout *)self _deactivateAllConstraints];
  [(_UINavigationBarContentViewLayout *)self removeAllSnapshots];
  [(UIView *)self->_backButton removeFromSuperview];
  uint64_t v3 = [(_UIButtonBar *)self->_leadingBar view];
  [v3 removeFromSuperview];

  [(UIView *)self->_titleControl removeFromSuperview];
  [(UIView *)self->_titleIconView removeFromSuperview];
  [(_UINavigationBarAugmentedTitleView *)self->_augmentedTitleView removeFromSuperview];
  int64_t v4 = [(_UIButtonBar *)self->_centerBar view];
  [v4 removeFromSuperview];

  uint64_t v5 = [(_UIButtonBar *)self->_trailingBar view];
  [v5 removeFromSuperview];

  [(UIView *)self->_contentView removeLayoutGuide:self->_backButtonGuide];
  [(UIView *)self->_contentView removeLayoutGuide:self->_leadingBarGuide];
  [(UIView *)self->_contentView removeLayoutGuide:self->_titleViewGuide];
  [(UIView *)self->_contentView removeLayoutGuide:self->_centerBarGuide];
  [(UIView *)self->_contentView removeLayoutGuide:self->_trailingBarGuide];
  self->_int active = 0;
}

- (void)_prepareForNewContentView
{
  [(_UINavigationBarContentViewLayout *)self _updateSubviewOrder];
  [(_UINavigationBarContentViewLayout *)self _updateLayoutGuideConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateAlignmentConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateRenamingContentViewIfNecessary];
  [(_UINavigationBarContentViewLayout *)self _updateTitleViewConstraints];
  [(_UINavigationBarContentViewLayout *)self _updateAugmentedTitleViewConstraints];
}

- (void)_removeContentAndInvalidateConstraints
{
  [(_UINavigationBarContentViewLayout *)self removeContent];
  layoutGuideConstraints = self->_layoutGuideConstraints;
  self->_layoutGuideConstraints = 0;

  alignmentConstraints = self->_alignmentConstraints;
  self->_alignmentConstraints = 0;

  renamingContentViewConstraints = self->_renamingContentViewConstraints;
  self->_renamingContentViewConstraints = 0;

  renamingContentViewInsetConstraint = self->_renamingContentViewInsetConstraint;
  self->_renamingContentViewInsetConstraint = 0;

  titleViewConstraints = self->_titleViewConstraints;
  self->_titleViewConstraints = 0;

  augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
  self->_augmentedTitleViewConstraints = 0;
}

- (void)deferSearchSuggestionsMenuRefreshForGeometryChange
{
  if (self->_trailingBar)
  {
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup)
    {
      if (![(UIBarButtonItemGroup *)inlineSearchBarGroup isHidden]) {
        self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 1;
      }
    }
  }
}

- (void)refreshSearchSuggestionsMenuAfterGeometryChange
{
  self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 0;
  if (self->_trailingBar)
  {
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup)
    {
      if (![(UIBarButtonItemGroup *)inlineSearchBarGroup isHidden])
      {
        -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        int64_t v4 = [v5 _searchController];
        [v4 _hostingNavigationBarDidLayoutInlineSearchBar];
      }
    }
  }
}

- (_UINavigationBarContentView)contentView
{
  return self->_contentView;
}

- (UILayoutGuide)backButtonGuide
{
  return self->_backButtonGuide;
}

- (UILayoutGuide)titleViewGuide
{
  return self->_titleViewGuide;
}

- (UILayoutGuide)centerBarGuide
{
  return self->_centerBarGuide;
}

- (UILayoutGuide)trailingBarGuide
{
  return self->_trailingBarGuide;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (int64_t)resolvedContentSize
{
  return self->_resolvedContentSize;
}

- (double)overrideHeight
{
  return self->_overrideHeight;
}

- (double)resolvedHeight
{
  return self->_resolvedHeight;
}

- (double)resolvedExtension
{
  return self->_resolvedExtension;
}

- (int64_t)resolvedAlignment
{
  return self->_resolvedAlignment;
}

- (double)minimumBackButtonWidth
{
  return self->_minimumBackButtonWidth;
}

- (BOOL)showTitleWithTabBar
{
  return self->_showTitleWithTabBar;
}

- (BOOL)useInlineLargeTitleMetrics
{
  return self->_useInlineLargeTitleMetrics;
}

- (BOOL)wantsHostedTabBarMetrics
{
  return self->_wantsHostedTabBarMetrics;
}

- (double)inlineTitleViewAlpha
{
  return self->_inlineTitleViewAlpha;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (_UINavigationItemRenameHandler)renameHandler
{
  return self->_renameHandler;
}

- (_UINavigationBarTitleRenamerSession)activeRenamerSession
{
  return self->_activeRenamerSession;
}

- (UIOffset)titlePositionAdjustment
{
  double horizontal = self->_titlePositionAdjustment.horizontal;
  double vertical = self->_titlePositionAdjustment.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)largeTitleHeight
{
  return self->_largeTitleHeight;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange
{
  double minimum = self->_largeTitleHeightRange.minimum;
  double maximum = self->_largeTitleHeightRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (BOOL)enableAlternatePopItem
{
  return self->_enableAlternatePopItem;
}

- (UIBarButtonItemGroup)fixedTrailingGroup
{
  return self->_fixedTrailingGroup;
}

- (BOOL)trailingGroupsEnabled
{
  return self->_trailingGroupsEnabled;
}

- (BOOL)placeInlineSearchBarInCenter
{
  return self->_placeInlineSearchBarInCenter;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_plainItemAppearance;
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return self->_doneItemAppearance;
}

- (_UIBarButtonItemData)backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (UIView)leadingBarSnapshot
{
  return self->_leadingBarSnapshot;
}

- (UIView)trailingBarSnapshot
{
  return self->_trailingBarSnapshot;
}

- (BOOL)keepsSnapshotsInHierarchy
{
  return self->_keepsSnapshotsInHierarchy;
}

@end