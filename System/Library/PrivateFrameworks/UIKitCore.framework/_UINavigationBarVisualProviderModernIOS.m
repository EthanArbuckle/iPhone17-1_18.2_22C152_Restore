@interface _UINavigationBarVisualProviderModernIOS
- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3;
- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3;
- (BOOL)_allowLargeTitleView;
- (BOOL)_isInInteractiveScroll;
- (BOOL)_isInnerNavigationBarOfNestedNavigationController;
- (BOOL)_shim_disableBlurTinting;
- (BOOL)_shim_hasCustomBackgroundView;
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (BOOL)_shouldEnableNestedNavigationPopForTopItem:(id)a3 backItem:(id)a4;
- (BOOL)_stackWantsBottomPaletteDisplayedForItem:(id)a3;
- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3;
- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3 hideLargeTitleForActiveSearch:(BOOL)a4;
- (BOOL)_stackWantsSearchDisplayedBelowContentViewForItem:(id)a3;
- (BOOL)_useLargeTitleForDisplayMode:(int64_t)a3;
- (BOOL)_wantsWindowMoveClientInteractionInstalled;
- (BOOL)allowLargeTitleView;
- (BOOL)allowsUserInteractionDuringTransitions;
- (BOOL)alwaysEvaluateChromelessTransitionProgress;
- (BOOL)forceScrollEdgeAppearance;
- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (BOOL)isContentView:(id)a3;
- (BOOL)isContentViewHidden;
- (BOOL)isInCustomization;
- (BOOL)navigationItemIsBackItem:(id)a3;
- (BOOL)navigationItemIsTopItem:(id)a3;
- (BOOL)scrollEdgeAppearanceHasChromelessBehavior;
- (BOOL)shouldFadeStaticNavBarButton;
- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3;
- (BOOL)staticNavBarButtonLingers;
- (BOOL)supportsRefreshControlHosting;
- (BOOL)titleRenamer:(id)a3 session:(id)a4 shouldEndRenamingWithTitle:(id)a5;
- (BOOL)topItemHasVariableHeight;
- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3;
- (BOOL)useInlineBackgroundHeightWhenLarge;
- (BOOL)useManualScrollEdgeAppearanceForItem:(id)a3;
- (BOOL)wantsHostedTabBarMetrics;
- (BOOL)wantsLargeTitleDisplayed;
- (CGPoint)contentViewLayoutFrameOrigin;
- (CGPoint)promptViewLayoutFrameOrigin;
- (CGRect)barCustomizer:(id)a3 customizationAreaBoundsForSession:(id)a4;
- (CGRect)barCustomizer:(id)a3 overflowControlBoundsForSession:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDirectionalEdgeInsets)largeSearchBaseMarginsRequiringNavMinimums:(BOOL)a3;
- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins;
- (NSDirectionalEdgeInsets)resolvedSearchBarMargins;
- (double)_contentBackgroundExtension;
- (double)_shim_shadowAlpha;
- (double)backgroundAlpha;
- (double)contentViewVerticalOffsetInTabBarContainer:(id)a3;
- (double)defaultBarHeightForTraitCollection:(id)a3;
- (double)heightForRestoringFromCancelledTransition;
- (double)horizontalMarginAdjustment;
- (double)navItemContentLayoutGuideAnimationDistance;
- (double)titleAlpha;
- (id)_accessibility_HUDItemForPoint:(CGPoint)a3;
- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3;
- (id)_adjustedAppearanceTitleAttributes:(id)a3 allowsLargeTitle:(BOOL)a4;
- (id)_backButtonMenu;
- (id)_backgroundLayoutOfClass:(Class)a3 fromLayout:(id)a4;
- (id)_barCustomizationItemWithBarButtonGroup:(id)a3;
- (id)_barCustomizationItemWithBarButtonItem:(id)a3 identifier:(id)a4;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_centerBarButtonGroupWithIdentifier:(id)a3;
- (id)_compatibleDefaultTextColor;
- (id)_defaultWeeTitleAttributes;
- (id)_effectiveLegacyTitleAttributes;
- (id)_immediatelyFinishRunningTransition;
- (id)_shim_compatibilityBackgroundView;
- (id)_sourceViewProviderForBarButtonItem:(id)a3;
- (id)_staticNavBarButtonFakeBackMenu;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
- (id)_updateBackgroundLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5;
- (id)alternateBarBackground;
- (id)barCustomizer:(id)a3 containerViewForSession:(id)a4;
- (id)barCustomizer:(id)a3 parentTraitEnvironmentForSession:(id)a4;
- (id)emptyLayout;
- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4;
- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4;
- (id)refreshControlHost;
- (id)restingHeights;
- (id)staticNavBarButtonItem;
- (id)tabBarHostedView;
- (id)titleRenamer:(id)a3 session:(id)a4 willBeginRenamingWithTitle:(id)a5 selectedRange:(_NSRange *)a6;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)appearanceAPIVersion;
- (int64_t)currentContentSize;
- (int64_t)statusBarStyle;
- (unint64_t)largeTitleStyle;
- (void)_beginCustomization;
- (void)_beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary;
- (void)_beginRenaming;
- (void)_computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:(id)a3;
- (void)_configureMarginsOnContentViewsAndPalette:(id)a3 withContentMargin:(double)a4;
- (void)_didEncounterFirstTitleWithExcessiveHeightChanged:(id)a3;
- (void)_endRenaming;
- (void)_endTransitionCompleted:(BOOL)a3;
- (void)_enforceLayoutOrdering;
- (void)_ensureLayoutsConfiguredForEntry:(id)a3;
- (void)_ensureLayoutsConfiguredForEntry:(id)a3 forMeasuring:(BOOL)a4;
- (void)_installContentClippingView:(id)a3;
- (void)_installWindowMoveClientInteractionIfNecessary;
- (void)_invalidateIntrinsicContentSizeAndNotifySizeChanged;
- (void)_layoutInBounds:(CGRect)a3;
- (void)_performAnimationWithTransitionCompletion:(id)a3 transition:(int64_t)a4;
- (void)_popToItem:(id)a3;
- (void)_postDidEncounterFirstTitleWithExcessiveHeightChanged;
- (void)_prepareLayouts;
- (void)_presentOrDismissSearch:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)_refreshBackButtonMenu;
- (void)_removeContentClippingView;
- (void)_setUpContentFocusContainerGuide;
- (void)_setupAccessibilityLimitsForView:(id)a3;
- (void)_setupTransitionContextForTransition:(int64_t)a3 completion:(id)a4;
- (void)_shim_setCustomBackgroundView:(id)a3;
- (void)_shim_setDisableBlurTinting:(BOOL)a3;
- (void)_shim_setShadowAlpha:(double)a3;
- (void)_updateAugmentedTitleDataSources;
- (void)_updateBackground;
- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4;
- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5;
- (void)_updateContentPriorities;
- (void)_updateLegacyLayout:(id)a3 forNavigationItem:(id)a4;
- (void)_updateModernLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5;
- (void)_updatePlaceholderFromTabBarContainer:(id)a3;
- (void)_updatePromptViewAndActuallyHide:(BOOL)a3;
- (void)_updateTabBarHost;
- (void)_updateTabBarSuppressionIfNeeded;
- (void)_updateTitleViewForLayout:(id)a3;
- (void)_updateWithCompletion:(id)a3;
- (void)_upgradeAppearanceAPIForItemIfNecessary:(id)a3;
- (void)animateForSearchPresentation:(BOOL)a3;
- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4;
- (void)applyBarBackground:(id)a3 alpha:(double)a4;
- (void)barCustomizer:(id)a3 willEndSession:(id)a4 didReset:(BOOL)a5;
- (void)barDidMoveToWindow;
- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)changeAppearance;
- (void)changeLayout;
- (void)deferSearchSuggestionsMenuRefreshForGeometryChange;
- (void)dismissHostedSearchWithTransitionCoordinator:(id)a3;
- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)layoutSubviews;
- (void)navigationBarContentViewDidChangeTintColor:(id)a3;
- (void)navigationBarContentViewDidTriggerBackAction:(id)a3 fromBackButtonItem:(id)a4;
- (void)navigationBarContentViewDidTriggerTitleRenameAction:(id)a3;
- (void)navigationBarInvalidatedResolvedLayoutMargins;
- (void)navigationControllerRefreshControlHostDidUpdateLayout:(id)a3;
- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5;
- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5;
- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3;
- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3;
- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedBackgroundAppearance:(id)a3;
- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4;
- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedLargeTitleContent:(id)a3;
- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3;
- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3;
- (void)navigationItemUpdatedPromptContent:(id)a3;
- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3;
- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4;
- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4;
- (void)popAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepare;
- (void)prepareForPop;
- (void)prepareForPush;
- (void)prepareForStackChange;
- (void)presentHostedSearchWithTransitionCoordinator:(id)a3;
- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5;
- (void)pushAnimated:(BOOL)a3 completion:(id)a4;
- (void)recordBarSize:(CGSize)a3;
- (void)refreshSearchSuggestionsMenuAfterGeometryChange;
- (void)removeContentForItem:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3;
- (void)setActiveTabBarHost:(BOOL)a3;
- (void)setAppearanceAPIVersion:(int64_t)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setForceScrollEdgeAppearance:(BOOL)a3;
- (void)setNeedsStaticNavBarButtonUpdate;
- (void)setRefreshControlHost:(id)a3;
- (void)setShouldFadeStaticNavBarButton:(BOOL)a3;
- (void)setStaticNavBarButtonItem:(id)a3;
- (void)setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4;
- (void)setStaticNavBarButtonLingers:(BOOL)a3;
- (void)setTabBarHostedView:(id)a3;
- (void)setTitleAlpha:(double)a3;
- (void)setUseInlineBackgroundHeightWhenLarge:(BOOL)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWantsHostedTabBarMetrics:(BOOL)a3;
- (void)stackDidChangeFrom:(id)a3;
- (void)tabBarContainerDidLayoutFloatingTabBar:(id)a3;
- (void)tabBarContainerWillChangeFloatingTabBarVisibility:(id)a3;
- (void)teardown;
- (void)titleRenamer:(id)a3 didCancelSession:(id)a4;
- (void)titleRenamer:(id)a3 session:(id)a4 didEndRenamingWithTitle:(id)a5;
- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidEnd:(id)a5;
- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidFail:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)traitCollectionDidChangeOnSubtree:(id)a3;
- (void)updateArchivedSubviews:(id)a3;
- (void)updateBackgroundGroupName;
- (void)updateBarVisibilityForTopItem;
- (void)updateSearchBarForPlacementChangeIfApplicable;
@end

@implementation _UINavigationBarVisualProviderModernIOS

- (BOOL)_isInnerNavigationBarOfNestedNavigationController
{
  v3 = [(UINavigationBar *)self->super._navigationBar _accessibility_navigationController];
  v4 = [v3 _outermostNavigationController];
  v5 = [v4 navigationBar];

  navigationBar = self->super._navigationBar;
  if (navigationBar == v5)
  {
    BOOL v9 = 0;
  }
  else
  {
    v7 = [(UINavigationBar *)navigationBar topItem];
    v8 = [(UINavigationBar *)v5 topItem];
    BOOL v9 = v7 == v8;
  }
  return v9;
}

- (void)_ensureLayoutsConfiguredForEntry:(id)a3 forMeasuring:(BOOL)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if (![(_UINavigationBarVisualProviderModernIOS *)self _isInnerNavigationBarOfNestedNavigationController])
    {
      v7 = [(UIView *)self->super._navigationBar window];

      if (v7)
      {
        v8 = [v6 item];
        BOOL v9 = [v8 _searchControllerIfAllowed];
        v10 = [v9 searchBar];
        v11 = [v8 _navigationBar];
        if (v11
          || (a4
           || [(_UINavigationBarItemStack *)self->super._stack state] == 1
           || [(_UINavigationBarItemStack *)self->super._stack state] == 2)
          && (v11 = self->super._navigationBar) != 0)
        {
          v12 = [(UIView *)v11 traitCollection];
          uint64_t v13 = [v8 _hasInlineSearchBarForTraits:v12];

          uint64_t v14 = v13;
          if (v13 == [v10 _isHostedInlineByNavigationBar]) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v14 = 0;
          v11 = 0;
          if (([v10 _isHostedInlineByNavigationBar] & 1) == 0) {
            goto LABEL_14;
          }
        }
        uint64_t v15 = v14;
        if (os_variant_has_internal_diagnostics())
        {
          v32 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            navigationBar = self->super._navigationBar;
            *(_DWORD *)buf = 138412290;
            v74 = navigationBar;
            _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "UINavigationBar has changed horizontal size class without updating search bar to new placement. Fixing, but delegate searchBarPlacement callbacks have been skipped. navigationBar = %@", buf, 0xCu);
          }
        }
        else
        {
          v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_ensureLayoutsConfiguredForEntry_forMeasuring____s_category)+ 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = self->super._navigationBar;
            *(_DWORD *)buf = 138412290;
            v74 = v17;
            _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "UINavigationBar has changed horizontal size class without updating search bar to new placement. Fixing, but delegate searchBarPlacement callbacks have been skipped. navigationBar = %@", buf, 0xCu);
          }
        }
        LODWORD(v14) = v15;
        [v10 _setHostedInlineByNavigationBar:v15];
LABEL_14:
        uint64_t v18 = [v6 normalLayout];
        uint64_t v19 = [v6 searchLayout];
        uint64_t v20 = v19;
        if (v10) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        char v22 = v21;
        if (!v10)
        {
          int v28 = 0;
LABEL_28:
          if (self->_transitionContext) {
            BOOL v29 = v18 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (v29) {
            char v30 = 1;
          }
          else {
            char v30 = v22;
          }
          if ((v30 & 1) == 0 && !v28) {
            goto LABEL_105;
          }
LABEL_36:
          if (v18) {
            goto LABEL_37;
          }
LABEL_44:
          v34 = objc_alloc_init(_UINavigationBarLayout);
          uint64_t v18 = (uint64_t)v34;
          if (v34)
          {
            v34->_apiVersion = self->_appearanceAPIVersion;
            v34->_representedSearchLayoutState = 2;
          }
          v69 = v11;
          [v6 setNormalLayout:v34];
          BOOL v31 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
          if (!v18)
          {
            [v8 _isManualScrollEdgeAppearanceEnabled];
            int v35 = 1;
LABEL_48:
            [(_UINavigationBarVisualProviderModernIOS *)self _contentBackgroundExtension];
            uint64_t v37 = v36;
            v72 = [v8 prompt];
            if ((v35 & 1) == 0) {
              *(void *)(v18 + 200) = v37;
            }
            -[_UINavigationBarLayout setBackgroundView:](v18, self->_backgroundView);
            if (v72) {
              promptView = self->_promptView;
            }
            else {
              promptView = 0;
            }
            -[_UINavigationBarLayout setPromptView:](v18, promptView);
            if ((v35 & 1) == 0) {
              *(unsigned char *)(v18 + 114) = v14;
            }
            if (v14) {
              v39 = 0;
            }
            else {
              v39 = v10;
            }
            -[_UINavigationBarLayout setSearchBar:](v18, v39);
            -[_UINavigationBarLayout setHidesSearchBarWhenScrolling:](v18, [v8 _hidesSearchBarWhenScrollingIfAllowed]);
            char v40 = [v8 _preserveSearchBarAcrossTransitions];
            int v67 = v14;
            if (v35)
            {
              [v8 _backgroundHidden];
            }
            else
            {
              *(unsigned char *)(v18 + 115) = v40;
              *(unsigned char *)(v18 + 110) = [v8 _backgroundHidden];
            }
            v41 = self;
            v42 = v41;
            double backgroundAlpha = v41->_backgroundAlpha;
            if (!v41->_usesBarBackground)
            {
              [(_UINavigationBarVisualProviderModernIOS *)v41 alphaForBarBackground:self->_backgroundView preferredAlpha:v8 navigationItem:backgroundAlpha];
              v42->_double backgroundAlpha = backgroundAlpha;
            }
            [(_UINavigationBarVisualProviderModernIOS *)v42 applyBarBackground:self->_backgroundView alpha:backgroundAlpha];

            int v44 = [(_UINavigationBarVisualProviderModernIOS *)v42 useManualScrollEdgeAppearanceForItem:v8];
            if (v35)
            {
              [v8 _manualScrollEdgeAppearanceProgress];
            }
            else
            {
              if (*(unsigned __int8 *)(v18 + 111) != v44)
              {
                *(unsigned char *)(v18 + 111) = v44;
                [(id)v18 _updateLayoutOutputs];
              }
              [v8 _manualScrollEdgeAppearanceProgress];
              *(void *)(v18 + 216) = v45;
              if (*(unsigned char *)(v18 + 111)) {
                [(id)v18 _updateLayoutOutputs];
              }
              int v46 = v42->_tabBarHostedView != 0;
              if (*(unsigned __int8 *)(v18 + 117) != v46)
              {
                *(unsigned char *)(v18 + 117) = v46;
                objc_msgSend((id)v18, "_reorderLayoutItem:toOrder:", *(void *)(v18 + 64), objc_msgSend((id)v18, "_topPaletteOrder"));
              }
            }
            v47 = [(_UINavigationBarVisualProvider *)v42 contentViewVisualProvider];
            -[_UINavigationBarLayout setContentViewVisualProvider:](v18, v47);

            -[_UINavigationBarLayout setContentView:](v18, v42->_contentView);
            v71 = [v8 _topPalette];
            -[_UINavigationBarLayout setTopPalette:](v18, v71);
            v70 = [v8 _bottomPalette];
            -[_UINavigationBarLayout setBottomPalette:](v18, v70);
            if ([(_UINavigationBarVisualProviderModernIOS *)v42 _stackWantsLargeTitleDisplayedForItem:v8 hideLargeTitleForActiveSearch:0])
            {
              -[_UINavigationBarLayout setLargeTitleView:](v18, v42->_largeTitleView);
              weeTitleLabel = v42->_weeTitleLabel;
            }
            else
            {
              -[_UINavigationBarLayout setLargeTitleView:](v18, 0);
              weeTitleLabel = 0;
            }
            -[_UINavigationBarLayout setWeeTitleLabel:](v18, weeTitleLabel);
            if (!v10)
            {
              BOOL v9 = v65;
              v11 = v69;
LABEL_104:

LABEL_105:
              goto LABEL_106;
            }
            if (v20)
            {
              BOOL v49 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
            }
            else
            {
              v50 = objc_alloc_init(_UINavigationBarLayout);
              uint64_t v20 = (uint64_t)v50;
              if (v50)
              {
                v50->_apiVersion = v42->_appearanceAPIVersion;
                v50->_representedSearchLayoutState = 3;
              }
              [v6 setSearchLayout:v50];
              BOOL v49 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
              if (!v20)
              {
                char v51 = 1;
LABEL_80:
                -[_UINavigationBarLayout setBackgroundView:](v20, self->_backgroundView);
                if (v72) {
                  v52 = v42->_promptView;
                }
                else {
                  v52 = 0;
                }
                BOOL v9 = v65;
                -[_UINavigationBarLayout setPromptView:](v20, v52);
                if ((v51 & 1) == 0) {
                  *(unsigned char *)(v20 + 114) = v67;
                }
                -[_UINavigationBarLayout setSearchBar:](v20, v10);
                char v53 = [v8 _preserveSearchBarAcrossTransitions];
                if ((v51 & 1) == 0) {
                  *(unsigned char *)(v20 + 115) = v53;
                }
                -[_UINavigationBarLayout setHidesSearchBarWhenScrolling:](v20, 0);
                char v54 = [v8 _backgroundHidden];
                if ((v51 & 1) == 0) {
                  *(unsigned char *)(v20 + 110) = v54;
                }
                v55 = [(_UINavigationBarVisualProvider *)v42 contentViewVisualProvider];
                -[_UINavigationBarLayout setContentViewVisualProvider:](v20, v55);

                if ([v65 _hidesNavigationBarDuringPresentationRespectingInlineSearch])
                {
                  -[_UINavigationBarLayout setContentView:](v20, 0);
                }
                else
                {
                  if (v35) {
                    v56 = 0;
                  }
                  else {
                    v56 = *(void **)(v18 + 128);
                  }
                  id v57 = v56;
                  -[_UINavigationBarLayout setContentView:](v20, v57);

                  if (!v67)
                  {
                    if (v35)
                    {
                      -[_UINavigationBarLayout setLargeTitleView:](v20, 0);
                      v59 = 0;
                    }
                    else
                    {
                      id v58 = *(id *)(v18 + 144);
                      -[_UINavigationBarLayout setLargeTitleView:](v20, v58);

                      v59 = *(void **)(v18 + 232);
                    }
                    v11 = v69;
                    id v60 = v59;
                    -[_UINavigationBarLayout setWeeTitleLabel:](v20, v60);

LABEL_98:
                    v61 = -[_UINavigationBarPalette _paletteForSearch](v71);
                    -[_UINavigationBarLayout setTopPalette:](v20, v61);

                    v62 = -[_UINavigationBarPalette _paletteForSearch](v70);
                    -[_UINavigationBarLayout setBottomPalette:](v20, v62);

                    if ([(_UINavigationBarVisualProviderModernIOS *)v42 alwaysEvaluateChromelessTransitionProgress])
                    {
                      int v63 = [(_UINavigationBarVisualProviderModernIOS *)v42 useManualScrollEdgeAppearanceForItem:v8];
                      if (v51)
                      {
                        [v8 _manualScrollEdgeAppearanceProgress];
                      }
                      else
                      {
                        if (*(unsigned __int8 *)(v20 + 111) != v63)
                        {
                          *(unsigned char *)(v20 + 111) = v63;
                          [(id)v20 _updateLayoutOutputs];
                        }
                        [v8 _manualScrollEdgeAppearanceProgress];
                        *(void *)(v20 + 216) = v64;
                        if (*(unsigned char *)(v20 + 111)) {
                          [(id)v20 _updateLayoutOutputs];
                        }
                      }
                    }
                    goto LABEL_104;
                  }
                }
                -[_UINavigationBarLayout setLargeTitleView:](v20, 0);
                -[_UINavigationBarLayout setWeeTitleLabel:](v20, 0);
                v11 = v69;
                goto LABEL_98;
              }
            }
            char v51 = 0;
            *(unsigned char *)(v20 + 113) = v49;
            *(void *)(v20 + 200) = v37;
            goto LABEL_80;
          }
LABEL_47:
          *(unsigned char *)(v18 + 113) = v31;
          int v35 = 0;
          *(unsigned char *)(v18 + 112) = [v8 _isManualScrollEdgeAppearanceEnabled];
          goto LABEL_48;
        }
        if (v18)
        {
          if ((v14 ^ (*(unsigned char *)(v18 + 114) != 0)))
          {
LABEL_37:
            v69 = v11;
            BOOL v31 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
            goto LABEL_47;
          }
          if (v19)
          {
LABEL_24:
            if ((v14 ^ (*(unsigned char *)(v19 + 114) != 0))) {
              goto LABEL_36;
            }
            int v66 = v14;
            v68 = v11;
            v23 = v9;
            int v24 = [v9 _hidesNavigationBarDuringPresentationRespectingInlineSearch];
            v25 = *(void **)(v20 + 128);
            goto LABEL_26;
          }
          if (v14) {
            goto LABEL_37;
          }
        }
        else
        {
          if (v14) {
            goto LABEL_44;
          }
          if (v19) {
            goto LABEL_24;
          }
        }
        int v66 = v14;
        v68 = v11;
        v23 = v9;
        int v24 = [v9 _hidesNavigationBarDuringPresentationRespectingInlineSearch];
        v25 = 0;
LABEL_26:
        id v26 = v25;
        BOOL v27 = v26 == 0;

        int v28 = v24 ^ v27;
        BOOL v9 = v23;
        v11 = v68;
        LODWORD(v14) = v66;
        goto LABEL_28;
      }
    }
  }
LABEL_106:
}

- (BOOL)alwaysEvaluateChromelessTransitionProgress
{
  int v3 = _UIBarsApplyChromelessEverywhere();
  if (v3)
  {
    navigationBar = self->super._navigationBar;
    LOBYTE(v3) = [(UINavigationBar *)navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
  }
  return v3;
}

- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 _stackEntry];
  if ([v5 isSearchActive])
  {
    id v6 = [v4 _searchControllerIfAllowed];
    BOOL v7 = -[_UINavigationBarVisualProviderModernIOS _stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:](self, "_stackWantsLargeTitleDisplayedForItem:hideLargeTitleForActiveSearch:", v4, [v6 hidesNavigationBarDuringPresentation]);
  }
  else
  {
    BOOL v7 = [(_UINavigationBarVisualProviderModernIOS *)self _stackWantsLargeTitleDisplayedForItem:v4 hideLargeTitleForActiveSearch:0];
  }

  return v7;
}

- (BOOL)_stackWantsLargeTitleDisplayedForItem:(id)a3 hideLargeTitleForActiveSearch:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = 0;
  if ([(_UINavigationBarVisualProviderModernIOS *)self allowLargeTitleView] && !a4) {
    BOOL v7 = [(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)self->super._stack effectiveDisplayModeForItemInCurrentStack:v6]];
  }

  return v7;
}

- (BOOL)allowLargeTitleView
{
  BOOL v3 = [(_UINavigationBarVisualProviderModernIOS *)self _allowLargeTitleView];
  if (v3) {
    LOBYTE(v3) = [(_UINavigationBarVisualProviderModernIOS *)self largeTitleStyle] == 0;
  }
  return v3;
}

- (BOOL)_allowLargeTitleView
{
  BOOL v3 = [(UIView *)self->super._navigationBar traitCollection];
  if ([v3 verticalSizeClass] == 1)
  {
    char v4 = 0;
  }
  else
  {
    v5 = self->super._navigationBar;
    if (qword_1EB25A3A0 != -1) {
      dispatch_once(&qword_1EB25A3A0, &__block_literal_global_66);
    }
    if (_MergedGlobals_131 == 1) {
      char v4 = HIBYTE(_MergedGlobals_131);
    }
    else {
      char v4 = [(UINavigationBar *)v5 prefersLargeTitles];
    }
  }
  return v4;
}

- (unint64_t)largeTitleStyle
{
  return 0;
}

- (BOOL)_useLargeTitleForDisplayMode:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      return ![(_UITabContainerView *)self->_tabBarHostedView canShowFloatingTabBar];
    case 2:
      return 0;
    case 0:
      return ![(_UITabContainerView *)self->_tabBarHostedView canShowFloatingTabBar];
  }
  return 1;
}

- (BOOL)useManualScrollEdgeAppearanceForItem:(id)a3
{
  id v4 = a3;
  if ([v4 _alwaysUseManualScrollEdgeAppearance])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [v4 _searchControllerIfAllowed];
    if (v6) {
      char v7 = [v4 _hidesSearchBarWhenScrollingIfAllowed];
    }
    else {
      char v7 = 0;
    }

    char v5 = v7 | [(_UINavigationBarVisualProviderModernIOS *)self _stackWantsLargeTitleDisplayedForItem:v4];
  }
  char v8 = [(_UINavigationBarVisualProviderModernIOS *)self alwaysEvaluateChromelessTransitionProgress];
  if ((v8 & 1) == 0 && (v5 & 1) == 0)
  {
    if ([(_UINavigationBarVisualProviderModernIOS *)self forceScrollEdgeAppearance]) {
      char v8 = 1;
    }
    else {
      char v8 = [v4 _isManualScrollEdgeAppearanceEnabled];
    }
  }

  return v8;
}

- (void)applyBarBackground:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  if (!self->_usesBarBackground)
  {
    id v8 = v6;
    [v6 alpha];
    id v6 = v8;
    if (v7 != a4)
    {
      [v8 setAlpha:a4];
      id v6 = v8;
    }
  }
}

- (double)_contentBackgroundExtension
{
  double v3 = 0.0;
  if ([(UINavigationBar *)self->super._navigationBar barPosition] == 3)
  {
    [(UINavigationBar *)self->super._navigationBar _overrideBackgroundExtension];
    double v3 = v4;
    if (v4 == 0.0)
    {
      char v5 = [(UIView *)self->super._navigationBar superview];
      id v6 = v5;
      if (v5)
      {
        [v5 safeAreaInsets];
        double v3 = v7;
      }
      else
      {
        double v3 = 0.0;
      }
    }
  }
  return v3;
}

- (NSDirectionalEdgeInsets)largeSearchBaseMarginsRequiringNavMinimums:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  id v6 = [v5 item];

  [v6 largeTitleInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([v6 useRelativeLargeTitleInsets])
  {
    [(UINavigationBar *)self->super._navigationBar _resolvedLayoutMargins];
    double v10 = v10 + v15;
    double v14 = v14 + v16;
  }
  else if (v10 == 0.0 || v14 == 0.0)
  {
    [(UINavigationBar *)self->super._navigationBar _resolvedLayoutMargins];
    if (v10 == 0.0) {
      double v21 = v19;
    }
    else {
      double v21 = v10;
    }
    if (v14 == 0.0) {
      double v22 = v20;
    }
    else {
      double v22 = v14;
    }
    double v23 = fmax(v21, v19);
    double v24 = fmax(v22, v20);
    if (v3) {
      double v14 = v24;
    }
    else {
      double v14 = v22;
    }
    if (v3) {
      double v10 = v23;
    }
    else {
      double v10 = v21;
    }
  }
  else if (v3)
  {
    [(UINavigationBar *)self->super._navigationBar _resolvedLayoutMargins];
    double v10 = fmax(v10, v17);
    double v14 = fmax(v14, v18);
  }

  double v25 = v8;
  double v26 = v10;
  double v27 = v12;
  double v28 = v14;
  result.trailing = v28;
  result.bottom = v27;
  result.leading = v26;
  result.top = v25;
  return result;
}

- (NSDirectionalEdgeInsets)resolvedSearchBarMargins
{
  if ([(_UINavigationBarVisualProviderModernIOS *)self allowLargeTitleView])
  {
    [(_UINavigationBarVisualProviderModernIOS *)self largeSearchBaseMarginsRequiringNavMinimums:1];
  }
  else
  {
    navigationBar = self->super._navigationBar;
    [(UINavigationBar *)navigationBar _resolvedLayoutMargins];
  }
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (BOOL)forceScrollEdgeAppearance
{
  return self->_forceScrollEdgeAppearance;
}

- (void)navigationBarInvalidatedResolvedLayoutMargins
{
  v2 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v4 = [v2 _searchControllerIfAllowed];

  double v3 = [v4 searchBar];
  [v3 _updateEffectiveContentInset];
}

- (void)_layoutInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v29 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v6 = [v29 item];
  uint64_t v7 = [v29 activeLayout];
  if (self->_backgroundTransparentWhenNotCollapsed)
  {
    char v8 = 1;
  }
  else if (self->_transitionContext {
         || [(_UINavigationBarVisualProviderModernIOS *)self _stackWantsSearchDisplayedBelowContentViewForItem:v6]|| [(_UINavigationBarVisualProviderModernIOS *)self _stackWantsLargeTitleDisplayedForItem:v6])
  }
  {
    char v8 = 0;
  }
  else
  {
    char v8 = ![(_UINavigationBarVisualProviderModernIOS *)self _stackWantsBottomPaletteDisplayedForItem:v6];
  }
  if (v7)
  {
    *(unsigned char *)(v7 + 109) = v8;
    p_double backgroundAlpha = &self->_backgroundAlpha;
    double backgroundAlpha = self->_backgroundAlpha;
    if (*(double *)(v7 + 208) != backgroundAlpha)
    {
      *(double *)(v7 + 208) = backgroundAlpha;
      [(id)v7 _updateLayoutOutputs];
    }
  }
  else
  {
    p_double backgroundAlpha = &self->_backgroundAlpha;
  }
  double v11 = [v29 normalLayout];

  if ((void *)v7 != v11) {
    goto LABEL_32;
  }
  if ([(_UITabContainerView *)self->_tabBarHostedView canShowFloatingTabBar])
  {
LABEL_29:
    if (!v7) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (!v7)
  {
    id v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  id v12 = *(id *)(v7 + 144);
  if (!v12 || [v6 largeTitleDisplayMode] != 3) {
    goto LABEL_28;
  }
  id v13 = *(id *)(v7 + 160);
  double v14 = [v13 backButton];
  if (v14)
  {

    goto LABEL_30;
  }
  staticNavBarButtonItem = self->_staticNavBarButtonItem;

  if (staticNavBarButtonItem)
  {
LABEL_30:
    if (*(unsigned char *)(v7 + 108))
    {
      *(unsigned char *)(v7 + 108) = 0;
      [(id)v7 _updateContentViewLayoutItem];
      [(id)v7 _updateLargeTitleViewLayoutItem];
      [(id)v7 _updateRefreshControlLayoutData];
    }
    goto LABEL_32;
  }
  if (!*(unsigned char *)(v7 + 108))
  {
    *(unsigned char *)(v7 + 108) = 1;
    [(id)v7 _updateContentViewLayoutItem];
    [(id)v7 _updateLargeTitleViewLayoutItem];
    [(id)v7 _updateRefreshControlLayoutData];
  }
  id v16 = *(id *)(v7 + 160);
  if ([v16 leadingGroupsMode] == 1) {
    [v16 setLeadingGroupsMode:2];
  }
  if ([v16 centerGroupsMode] == 1) {
    [v16 setCenterGroupsMode:2];
  }

LABEL_32:
  [(_UINavigationBarLayout *)v7 setLayoutSize:height];
  -[_UINavigationBarLayout layoutViews](v7);
  [(_UINavigationBarVisualProviderModernIOS *)self applyBarBackground:self->_backgroundView alpha:*p_backgroundAlpha];
  if (!self->_transitionContext)
  {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame](v7));
    if (self->_usesBarBackground)
    {
      double v17 = [(_UIBarBackground *)self->_backgroundView layout];
      double v18 = v17;
      if (v7)
      {
        [v17 setBackgroundTransitionProgress:*(double *)(v7 + 288)];
        double v19 = *(double *)(v7 + 296);
      }
      else
      {
        double v19 = 0.0;
        [v17 setBackgroundTransitionProgress:0.0];
      }
      [v18 setBackgroundAlpha:v19];
      [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
    }
    if (!self->_transitionContext)
    {
      double v20 = [(UIView *)self->_weeTitleLabel window];
      if (v20)
      {
      }
      else if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        goto LABEL_49;
      }
      if (v7)
      {
        id v21 = *(id *)(v7 + 144);
        if (v21)
        {
          double v22 = v21;
          id v23 = *(id *)(v7 + 232);
          if (v23)
          {
            double v24 = v23;
            double v25 = [(_UINavigationBarItemStack *)self->super._stack topItem];
            double v26 = [v25 _weeTitle];
            uint64_t v27 = [v26 length];

            double v28 = 1.0;
            if (v27)
            {
LABEL_48:
              [(UIView *)self->_weeTitleLabel setAlpha:v28];
              goto LABEL_49;
            }
          }
          else
          {
          }
        }
      }
      double v28 = 0.0;
      goto LABEL_48;
    }
  }
LABEL_49:
}

- (void)_updateBackground
{
  id v19 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  BOOL v3 = [(UIView *)self->super._navigationBar _canDrawContent];
  [(UIView *)self->_backgroundView setHidden:v3];
  if (v3)
  {
    [(UIView *)self->super._navigationBar setNeedsDisplay];
    goto LABEL_30;
  }
  id v4 = [v19 item];
  int64_t v5 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
  uint64_t v6 = [v19 activeLayout];
  uint64_t v7 = v6;
  BOOL v8 = v5 == 102 || v5 == 1;
  if (v5 == 102 || v5 == 1)
  {
    if (v6)
    {
      double v10 = *(void **)(v6 + 184);
LABEL_15:
      double v11 = v10;
      goto LABEL_16;
    }
  }
  else if (v6)
  {
    double v10 = *(void **)(v6 + 192);
    goto LABEL_15;
  }
  double v10 = 0;
  double v11 = 0;
LABEL_16:
  id v12 = v10;

  id v13 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v12 forNavigationItem:v4 compact:v8];

  if (v7) {
    double v14 = *(double *)(v7 + 288);
  }
  else {
    double v14 = 0.0;
  }
  [v13 setBackgroundTransitionProgress:v14];
  if (v5 != 102 && v5 != 1)
  {
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v7, v13);
    if (v7) {
      goto LABEL_21;
    }
LABEL_23:
    double v15 = 1.0;
    goto LABEL_24;
  }
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v7, v13);
  if (!v7) {
    goto LABEL_23;
  }
LABEL_21:
  double v15 = *(double *)(v7 + 296);
LABEL_24:
  [v13 setBackgroundAlpha:v15];
  if (self->_usesBarBackground)
  {
    [(_UIBarBackground *)self->_backgroundView setLayout:v13];
    [(_UINavigationBarVisualProviderModernIOS *)self updateBackgroundGroupName];
    [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
  }
  else
  {
    id v16 = self;
    double v17 = v16;
    double backgroundAlpha = v16->_backgroundAlpha;
    if (!self->_usesBarBackground)
    {
      [(_UINavigationBarVisualProviderModernIOS *)v16 alphaForBarBackground:self->_backgroundView preferredAlpha:v4 navigationItem:backgroundAlpha];
      v17->_double backgroundAlpha = backgroundAlpha;
    }
    [(_UINavigationBarVisualProviderModernIOS *)v17 applyBarBackground:self->_backgroundView alpha:backgroundAlpha];
  }
  [(UINavigationBar *)self->super._navigationBar _updatePaletteBackgroundIfNecessary];

LABEL_30:
}

- (void)_prepareLayouts
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v3];

  id v4 = [(_UINavigationBarItemStack *)self->super._stack previousTopEntry];
  [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v4];
}

- (BOOL)topItemHasVariableHeight
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  if (v3)
  {
    [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v3];
    uint64_t v4 = [v3 normalLayout];
    int64_t v5 = (void *)v4;
    if (v4)
    {
      if (-[_UINavigationBarLayout isVariableHeight](v4))
      {
        BOOL v6 = 1;
LABEL_9:

        goto LABEL_10;
      }
      if ([v3 isSearchActive])
      {
        uint64_t v7 = [v3 searchLayout];
        BOOL v6 = -[_UINavigationBarLayout isVariableHeight]((BOOL)v7);

        goto LABEL_9;
      }
    }
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 0;
LABEL_10:

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3
{
  int64_t v5 = self->super._itemForMeasuring;
  if (v5)
  {
    BOOL v6 = v5;
    id v7 = [(UINavigationItem *)v5 _stackEntry];
    if (v7) {
      goto LABEL_3;
    }
    goto LABEL_16;
  }
  if ([(_UINavigationBarItemStack *)self->super._stack itemCount])
  {
    double v18 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    char v19 = [v18 cancelledTransition];
    stack = self->super._stack;
    if (v19) {
      [(_UINavigationBarItemStack *)stack previousTopEntry];
    }
    else {
    id v7 = [(_UINavigationBarItemStack *)stack topEntry];
    }

    BOOL v6 = [v7 item];
    if (v7)
    {
LABEL_3:
      if (qword_1EB25A3A8[0] != -1) {
        dispatch_once(qword_1EB25A3A8, &__block_literal_global_651);
      }
      if (!byte_1EB25A38A
        || ([v7 item],
            BOOL v8 = objc_claimAutoreleasedReturnValue(),
            [v8 _navigationBar],
            double v9 = (UINavigationBar *)objc_claimAutoreleasedReturnValue(),
            navigationBar = self->super._navigationBar,
            v9,
            v8,
            v9 == navigationBar))
      {
        [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v7 forMeasuring:1];
      }
      double v11 = [v7 activeLayout];
      id v12 = -[_UINavigationBarLayout layoutForMeasuringWidth:](v11, a3);

      if (v12) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
LABEL_16:
    id v7 = +[_UINavigationBarItemStackEntry newEntryForItem:v6];
    [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v7 forMeasuring:1];
    id v12 = [v7 activeLayout];
    [(_UINavigationBarLayout *)(uint64_t)v12 setLayoutSize:0.0];
    if (v12)
    {
LABEL_9:
      double v13 = -[_UINavigationBarLayout layoutHeights]((uint64_t)v12);
      double v15 = v14;
      double v17 = v16;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    double v22 = [(UIView *)self->super._navigationBar traitCollection];
    [(_UINavigationBarVisualProviderModernIOS *)self defaultBarHeightForTraitCollection:v22];
    double v13 = v23;

    double v15 = v13;
    double v17 = v13;
    goto LABEL_18;
  }
  BOOL v6 = [(UIView *)self->super._navigationBar traitCollection];
  [(_UINavigationBarVisualProviderModernIOS *)self defaultBarHeightForTraitCollection:v6];
  double v13 = v21;
  double v15 = v21;
  double v17 = v21;
LABEL_19:

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (void)_ensureLayoutsConfiguredForEntry:(id)a3
{
}

- (double)defaultBarHeightForTraitCollection:(id)a3
{
  if ([a3 userInterfaceIdiom] == 5) {
    return 39.0;
  }
  int v4 = _UIBarsUseNewPadHeights();
  double result = 44.0;
  if (v4) {
    return 50.0;
  }
  return result;
}

- (BOOL)supportsRefreshControlHosting
{
  return 1;
}

- (void)updateBackgroundGroupName
{
  if (self->_usesBarBackground)
  {
    id v5 = [(UIView *)self->super._navigationBar traitCollection];
    BOOL v3 = self;
    int v4 = [v5 objectForTrait:v3];
    [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
  }
}

- (BOOL)_stackWantsSearchDisplayedBelowContentViewForItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  }
  id v5 = [v4 _searchControllerIfAllowed];
  if (v5)
  {
    BOOL v6 = [v4 _stackEntry];
    if ([v6 isSearchActive]) {
      int v7 = [v5 hidesNavigationBarDuringPresentation] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_stackWantsBottomPaletteDisplayedForItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  }
  id v5 = [v4 _bottomPalette];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)traitCollectionDidChangeOnSubtree:(id)a3
{
  id v21 = a3;
  id v4 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  uint64_t v5 = [v4 activeLayout];
  BOOL v6 = (void *)v5;
  if (v5) {
    int v7 = *(void **)(v5 + 144);
  }
  else {
    int v7 = 0;
  }
  unint64_t v8 = v7;

  double v9 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  uint64_t v10 = [v9 activeLayout];
  double v11 = (void *)v10;
  if (v10) {
    id v12 = *(void **)(v10 + 240);
  }
  else {
    id v12 = 0;
  }
  unint64_t v13 = v12;

  if (v8 | v13)
  {
    double v14 = [v21 preferredContentSizeCategory];
    double v15 = [(UIView *)self->super._navigationBar traitCollection];
    double v16 = [v15 preferredContentSizeCategory];

    id v17 = v14;
    id v18 = v16;
    char v19 = v18;
    if (v17 == v18)
    {
    }
    else
    {
      if (v17 && v18)
      {
        char v20 = [v17 isEqual:v18];

        if (v20) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      [(_UINavigationBarVisualProviderModernIOS *)self changeLayout];
    }
LABEL_14:
  }
}

- (void)recordBarSize:(CGSize)a3
{
  self->_previousBarSize = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (a3.width == 0.0)
  {
    uint64_t v5 = [(UIView *)self->super._navigationBar superview];
    BOOL v6 = v5;
    if (v5)
    {
      [v5 bounds];
      double width = v7;
    }
  }
  [(_UINavigationBarVisualProviderModernIOS *)self layoutHeightsFittingWidth:width];
  double v9 = v8;
  double v10 = width;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (id)refreshControlHost
{
  return self->_refreshControlHost;
}

- (void)setRefreshControlHost:(id)a3
{
  uint64_t v5 = (_UINavigationControllerRefreshControlHost *)a3;
  p_refreshControlHost = &self->_refreshControlHost;
  refreshControlHost = self->_refreshControlHost;
  id v12 = v5;
  if (refreshControlHost != v5)
  {
    [(_UINavigationControllerRefreshControlHost *)refreshControlHost setDelegate:0];
    [(_UINavigationControllerRefreshControlHost *)*p_refreshControlHost stopAnimations];
    double v8 = [(_UINavigationControllerRefreshControlHost *)*p_refreshControlHost hostContainerView];
    [v8 removeFromSuperview];

    objc_storeStrong((id *)&self->_refreshControlHost, a3);
    [(_UINavigationControllerRefreshControlHost *)*p_refreshControlHost setDelegate:self];
    double v9 = objc_opt_new();
    [(_UINavigationControllerRefreshControlHost *)*p_refreshControlHost setHostContainerView:v9];

    double v10 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    double v11 = [v10 normalLayout];
    -[_UINavigationBarLayout setRefreshControlHost:](v11, v12);
  }
}

- (void)safeAreaInsetsDidChange
{
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  largeTitleView = self->_largeTitleView;
  [(UIView *)largeTitleView setNeedsLayout];
}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_hasIdiom
    && ![(_UINavigationBarVisualProviderModernIOS *)self _isInnerNavigationBarOfNestedNavigationController])
  {
    int64_t v10 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
    BOOL v11 = [(_UINavigationBarVisualProviderModernIOS *)self wantsLargeTitleDisplayed];
    int64_t v135 = v10;
    BOOL v137 = v11;
    BOOL v133 = v5;
    if (self->_appearanceAPIVersion < 2)
    {
      uint64_t v15 = 0;
      id v16 = 0;
      goto LABEL_43;
    }
    BOOL v12 = v11;
    int v13 = [v8 _isManualScrollEdgeAppearanceEnabled];
    if ((![(_UINavigationBarVisualProviderModernIOS *)self alwaysEvaluateChromelessTransitionProgress] | v13 | v12))
    {
      BOOL v14 = 0;
    }
    else
    {
      id v17 = [v8 _stackEntry];
      id v18 = [v17 activeLayout];
      if (v18) {
        double v19 = v18[27];
      }
      else {
        double v19 = 0.0;
      }
      BOOL v14 = v19 < 0.25;
    }
    if (v10 == 102 || v10 == 1)
    {
      if (!v14
        || (_nullableCompactScrollEdgeAppearance(self->super._navigationBar, v8),
            (id v16 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        _compactAppearance(self->super._navigationBar, v8);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_42;
    }
    if (v14) {
      goto LABEL_16;
    }
    double v24 = [v8 _stackEntry];
    double v25 = [v24 activeLayout];
    if (dyld_program_sdk_at_least())
    {
      if (v25) {
        double v26 = v25[36];
      }
      else {
        double v26 = 0.0;
      }

      if (v26 <= 0.0) {
        goto LABEL_31;
      }
    }
    else
    {
      if (!v12)
      {

LABEL_31:
        char v20 = self->super._navigationBar;
        char v30 = [v8 standardAppearance];
        BOOL v31 = v30;
        if (v30)
        {
          id v32 = v30;
        }
        else
        {
          id v32 = [(UINavigationBar *)v20 standardAppearance];
        }
        id v16 = v32;

LABEL_41:
LABEL_42:
        uint64_t v15 = [v16 _barTitleData];
LABEL_43:
        v138 = (void *)v15;
        id v136 = v16;
        uint64_t v37 = [v9 _effectiveBackBarButtonItem];
        v38 = [(_UINavigationBarVisualProviderModernIOS *)self _backButtonMenu];
        [v37 setMenu:v38];

        uint64_t v39 = [v8 hidesBackButton];
        uint64_t v40 = [v8 leftItemsSupplementBackButton];
        id v147 = 0;
        id v148 = 0;
        [v8 _getLeadingItems:&v148 groups:&v147];
        id v145 = 0;
        id v146 = 0;
        [v8 _getTrailingItems:&v146 groups:&v145];
        if (v148)
        {
          if (v37) {
            char v41 = v39;
          }
          else {
            char v41 = 1;
          }
          id v131 = v9;
          if ((v41 & 1) != 0 || (v40 & 1) == 0 && [v148 count])
          {
            v42 = v37;
            v43 = objc_msgSend(v8, "_barButtonForBackButtonIndicator", v131);
          }
          else
          {
            v42 = v37;
            v43 = 0;
          }
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          id v44 = v148;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v141 objects:v149 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v142;
            do
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v142 != v47) {
                  objc_enumerationMutation(v44);
                }
                [*(id *)(*((void *)&v141 + 1) + 8 * i) _setShowsChevron:*(void *)(*((void *)&v141 + 1) + 8 * i) == (void)v43];
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v141 objects:v149 count:16];
            }
            while (v46);
          }

          uint64_t v37 = v42;
          id v9 = v131;
        }
        v134 = v37;
        -[_UINavigationBarContentView setBackButtonItem:](self->_contentView, "setBackButtonItem:", v37, v131);
        [(_UINavigationBarContentView *)self->_contentView setBackButtonHidden:v39];
        id v49 = v148;
        if (v148)
        {
          v50 = [(_UINavigationBarContentView *)self->_contentView leadingBarGroups];
          char v51 = [v50 lastObject];
          v52 = -[UIBarButtonItemGroup _items](v51);
          id v53 = v49;
          id v54 = v52;
          if (v53 == v54)
          {

            goto LABEL_68;
          }
          v55 = v54;
          if (v54)
          {
            char v56 = [v53 isEqual:v54];

            if (v56)
            {
LABEL_68:
              [(_UINavigationBarContentView *)self->_contentView setLeadingItemsSupplementBackItem:v40];
              id v57 = [v8 _inlineSearchBarItemGroup];
              [(_UINavigationBarContentView *)self->_contentView setInlineSearchBarGroup:v57];

              -[_UINavigationBarContentView setPlaceInlineSearchBarInCenter:](self->_contentView, "setPlaceInlineSearchBarInCenter:", [v8 searchBarPlacement] == 3);
              if (v146)
              {
                id v58 = [v146 reverseObjectEnumerator];
                v59 = [v58 allObjects];
                id v60 = [(_UINavigationBarContentView *)self->_contentView trailingBarGroups];
                v61 = [v60 lastObject];
                v62 = -[UIBarButtonItemGroup _items](v61);
                id v63 = v59;
                id v64 = v62;
                if (v63 == v64)
                {

                  goto LABEL_77;
                }
                v65 = v64;
                if (v63 && v64)
                {
                  char v66 = [v63 isEqual:v64];

                  if (v66)
                  {
LABEL_77:
                    int v67 = [v8 pinnedTrailingGroup];
                    [(_UINavigationBarContentView *)self->_contentView setFixedTrailingGroup:v67];

                    v68 = [v8 title];
                    [(_UINavigationBarContentView *)self->_contentView setTitle:v68];

                    v69 = [v8 titleView];
                    [(_UINavigationBarContentView *)self->_contentView setTitleView:v69];

                    if (!_UIBarsDesktopNavigationBarEnabled())
                    {
                      [(_UINavigationBarContentView *)self->_contentView setCenterBarGroups:MEMORY[0x1E4F1CBF0]];
                      [(_UINavigationBarContentView *)self->_contentView setToolbarStyle:0];
                      [(_UINavigationBarContentView *)self->_contentView setCustomizationIdentifier:0];
                      [(_UINavigationBarContentView *)self->_contentView setTitleMenuProvider:0];
                      [(_UINavigationBarContentView *)self->_contentView setDocumentProperties:0];
                      [(_UINavigationBarContentView *)self->_contentView setAdditionalItems:0];
                      [(_UINavigationBarContentView *)self->_contentView dci_setRenameHandler:0];
                      [(_UINavigationBarContentView *)self->_contentView setBackAction:0];
                      [(_UINavigationBarContentView *)self->_contentView setEnableAlternatePopItem:0];
                      int64_t v72 = v135;
                      v73 = v138;
LABEL_85:
                      if (!v137) {
                        [(_UINavigationBarContentView *)self->_contentView setInlineTitleViewAlpha:self->_titleAlpha];
                      }
                      [(_UINavigationBarVisualProviderModernIOS *)self _updateAugmentedTitleDataSources];
                      objc_msgSend(v8, "_minimumDesiredHeightForBarMetrics:", -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics"));
                      -[_UINavigationBarContentView setOverrideSize:](self->_contentView, "setOverrideSize:");
                      [(_UINavigationBarContentView *)self->_contentView setBarMetrics:v72];
                      int64_t v83 = [(_UINavigationBarItemStack *)self->super._stack effectiveDisplayModeForItemInCurrentStack:v8];
                      if (v83 == 1)
                      {
                        BOOL v85 = 1;
                        v84 = v136;
                        if (v73) {
                          goto LABEL_94;
                        }
                      }
                      else
                      {
                        v84 = v136;
                        if (!v83)
                        {
                          BOOL v85 = [(_UINavigationBarVisualProviderModernIOS *)self _allowLargeTitleView];
                          if (!v73) {
                            goto LABEL_92;
                          }
LABEL_94:
                          v88 = [v73 titleTextAttributes];
                          v93 = [(_UINavigationBarVisualProviderModernIOS *)self _adjustedAppearanceTitleAttributes:v88 allowsLargeTitle:v85];
                          [(_UINavigationBarContentView *)self->_contentView setTitleAttributes:v93];

                          [v73 titlePositionAdjustment];
                          contentView = self->_contentView;
LABEL_95:
                          -[_UINavigationBarContentView setTitlePositionAdjustment:](contentView, "setTitlePositionAdjustment:", v92, v90);

                          [(_UINavigationBarContentView *)self->_contentView setAllowLeadingAlignedLargeTitle:[(_UINavigationBarVisualProviderModernIOS *)self _allowLargeTitleView]];
                          if (v84)
                          {
                            v94 = [v84 _backButtonAppearanceData];
                            [(_UINavigationBarContentView *)self->_contentView setBackButtonAppearance:v94];

                            v95 = [v84 _plainButtonAppearanceData];
                            [(_UINavigationBarContentView *)self->_contentView setPlainItemAppearance:v95];

                            v96 = [v84 _doneButtonAppearanceData];
                            [(_UINavigationBarContentView *)self->_contentView setDoneItemAppearance:v96];
                          }
                          else
                          {
                            v96 = [(UINavigationBar *)self->super._navigationBar backIndicatorImage];
                            uint64_t v97 = [(UINavigationBar *)self->super._navigationBar backIndicatorTransitionMaskImage];
                            v98 = (void *)v97;
                            if (v96 && v97)
                            {
                              [(_UINavigationBarContentView *)self->_contentView setBackIndicatorImage:v96];
                              [(_UIBarContentView *)self->_contentView setBackIndicatorMaskImage:v98];
                            }
                          }
                          [(UINavigationBar *)self->super._navigationBar _requestedMaxBackButtonWidth];
                          -[_UINavigationBarContentView _setBackButtonMaximumWidth:](self->_contentView, "_setBackButtonMaximumWidth:");
                          v99 = [(_UITabContainerView *)self->_tabBarHostedView floatingTabBar];
                          v100 = [v99 currentSelectionTitle];
                          [(_UINavigationBarVisualProviderModernIOS *)self _updateTabBarSuppressionIfNeeded];
                          if ([(_UITabContainerView *)self->_tabBarHostedView canShowFloatingTabBar])
                          {
                            BOOL v101 = !self->_isSuppressingTabBar;
                          }
                          else
                          {
                            BOOL v101 = 0;
                          }
                          [(_UINavigationBarContentView *)self->_contentView setHostedTabBarEnabled:v101];
                          [(_UITabContainerView *)self->_tabBarHostedView floatingTabBarContentFrameInCoordinateSpace:self->_contentView];
                          -[_UINavigationBarContentView setHostedTabBarFrame:](self->_contentView, "setHostedTabBarFrame:");
                          [(_UINavigationBarContentView *)self->_contentView setWantsHostedTabBarMetrics:self->_wantsHostedTabBarMetrics];
                          [(_UINavigationBarContentView *)self->_contentView setHasLeadingInsetFromTideBar:[(_UITabContainerView *)self->_tabBarHostedView isSidebarOverlappingContent]];
                          v132 = v100;
                          if ([v8 style])
                          {
                            uint64_t v102 = 1;
                          }
                          else if (v9)
                          {
                            v103 = [v8 title];
                            if ([v103 length])
                            {
                              id v104 = [v8 title];
                              id v105 = v100;
                              v106 = v105;
                              if (v104 == v105)
                              {
                                uint64_t v102 = 0;
                              }
                              else
                              {
                                uint64_t v102 = 1;
                                if (v105 && v104) {
                                  uint64_t v102 = [v104 isEqual:v105] ^ 1;
                                }
                              }

                              v73 = v138;
                            }
                            else
                            {
                              uint64_t v102 = 0;
                            }

                            v84 = v136;
                          }
                          else
                          {
                            uint64_t v102 = 0;
                          }
                          [(_UINavigationBarContentView *)self->_contentView setShowTitleWithTabBar:v102];
                          [(_UINavigationBarContentView *)self->_contentView setHostedTabBarVisibilityAffectsTitle:[(_UITabContainerView *)self->_tabBarHostedView sidebarLayout] != 2];
                          [(_UINavigationBarContentView *)self->_contentView setIsHostedTabBarVisible:[(_UITabContainerView *)self->_tabBarHostedView isShowingFloatingTabBar]];
                          -[_UINavigationBarContentView setUseInlineLargeTitleMetrics:](self->_contentView, "setUseInlineLargeTitleMetrics:", [v8 largeTitleDisplayMode] == 3);
                          [(_UINavigationBarContentView *)self->_contentView updateContentAnimated:v133];
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitleType:v137];
                          v108 = [v8 title];
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitle:v108];

                          v109 = [v8 _alternateLargeTitles];
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView setAlternateTitles:v109];

                          v110 = [v8 _largeTitleAccessoryView];
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView setAccessoryView:v110];

                          -[_UINavigationBarLargeTitleView setAlignAccessoryViewToTitleBaseline:](self->_largeTitleView, "setAlignAccessoryViewToTitleBaseline:", [v8 _alignLargeTitleAccessoryViewToBaseline]);
                          -[_UINavigationBarLargeTitleView setAccessoryViewHorizontalAlignment:](self->_largeTitleView, "setAccessoryViewHorizontalAlignment:", [v8 _largeTitleAccessoryViewHorizontalAlignment]);
                          -[_UINavigationBarLargeTitleView setTwoLineMode:](self->_largeTitleView, "setTwoLineMode:", [v8 _largeTitleTwoLineMode]);
                          if (v73)
                          {
                            v111 = [v73 largeTitleTextAttributes];
                            [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitleAttributes:v111];
                          }
                          else
                          {
                            v111 = [(UINavigationBar *)self->super._navigationBar largeTitleTextAttributes];
                            v112 = [(UIView *)self->super._navigationBar traitCollection];
                            v113 = _UINavigationTitleAppearanceAddDefaultLargeTitleAttributes(v111, [v112 userInterfaceIdiom]);
                            [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitleAttributes:v113];

                            v73 = v138;
                          }

                          if (v137) {
                            [(_UINavigationBarVisualProviderModernIOS *)self _computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:v8];
                          }
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView setProvidesExtraSpaceForExcessiveLineHeights:self->_providesExtraSpaceForExcessiveLineHeights];
                          [(_UINavigationBarLargeTitleView *)self->_largeTitleView updateContent];
                          v114 = [v8 prompt];

                          if (v114)
                          {
                            v115 = [v8 prompt];
                            [(_UINavigationBarModernPromptView *)self->_promptView setPrompt:v115];

                            v116 = [(_UINavigationBarVisualProviderModernIOS *)self _compatibleDefaultTextColor];
                            [(_UINavigationBarModernPromptView *)self->_promptView setTextColor:v116];
                          }
                          v117 = [v8 _weeTitle];
                          uint64_t v118 = [v117 length];

                          if (v118)
                          {
                            if (!self->_weeTitleLabel)
                            {
                              v119 = [UILabel alloc];
                              [(UIView *)self->super._navigationBar bounds];
                              v120 = -[UILabel initWithFrame:](v119, "initWithFrame:");
                              weeTitleLabel = self->_weeTitleLabel;
                              self->_weeTitleLabel = v120;
                            }
                            id v122 = objc_alloc(MEMORY[0x1E4F28B18]);
                            v123 = [v8 _weeTitle];
                            v124 = [v123 localizedUppercaseString];
                            v125 = [(_UINavigationBarVisualProviderModernIOS *)self _defaultWeeTitleAttributes];
                            v126 = (void *)[v122 initWithString:v124 attributes:v125];
                            [(UILabel *)self->_weeTitleLabel setAttributedText:v126];

                            v84 = v136;
                            v73 = v138;
                          }
                          v127 = [v8 _searchControllerIfAllowed];
                          v128 = [v127 searchBar];

                          if (([v128 _isHostedInlineByNavigationBar] & 1) != 0 || !v128)
                          {
                            if (!v128)
                            {
LABEL_142:
                              [(UINavigationBar *)self->super._navigationBar _accessibility_navigationBarContentsDidChange];

                              goto LABEL_143;
                            }
                          }
                          else
                          {
                            if (v135 == 102 || v135 == 1) {
                              v129 = @"UICTContentSizeCategoryAccessibilityL";
                            }
                            else {
                              v129 = 0;
                            }
                            [v128 _setMaximumContentSizeCategory:v129];
                          }
                          if ([v128 showsScopeBar])
                          {
                            v130 = [v128 _scopeBar];
                            [v130 setAlpha:1.0];
                          }
                          goto LABEL_142;
                        }
                        BOOL v85 = 0;
                        if (v73) {
                          goto LABEL_94;
                        }
                      }
LABEL_92:
                      v86 = [(_UINavigationBarVisualProviderModernIOS *)self _effectiveLegacyTitleAttributes];
                      v87 = [(_UINavigationBarVisualProviderModernIOS *)self _adjustedAppearanceTitleAttributes:v86 allowsLargeTitle:v85];
                      [(_UINavigationBarContentView *)self->_contentView setTitleAttributes:v87];

                      v88 = [(UINavigationBar *)self->super._navigationBar _appearanceStorage];
                      objc_msgSend(v88, "titleVerticalAdjustmentForBarMetrics:", -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics"));
                      double v90 = v89;
                      contentView = self->_contentView;
                      double v92 = 0.0;
                      goto LABEL_95;
                    }
                    v70 = [v8 centerItemGroups];
                    [(_UINavigationBarContentView *)self->_contentView setCenterBarGroups:v70];

                    -[_UINavigationBarContentView setToolbarStyle:](self->_contentView, "setToolbarStyle:", [v8 style]);
                    v71 = [v8 titleMenuProvider];
                    int64_t v72 = v135;
                    v73 = v138;
                    if (v71)
                    {
LABEL_83:
                      v78 = [v8 customizationIdentifier];
                      [(_UINavigationBarContentView *)self->_contentView setCustomizationIdentifier:v78];

                      [(_UINavigationBarContentView *)self->_contentView setTitleMenuProvider:v71];
                      v79 = [v8 documentProperties];
                      [(_UINavigationBarContentView *)self->_contentView setDocumentProperties:v79];

                      v80 = objc_msgSend(v8, "_dci_renameHandler");
                      [(_UINavigationBarContentView *)self->_contentView dci_setRenameHandler:v80];

                      v81 = [v8 backAction];
                      [(_UINavigationBarContentView *)self->_contentView setBackAction:v81];

                      [(_UINavigationBarContentView *)self->_contentView setEnableAlternatePopItem:[(_UINavigationBarVisualProviderModernIOS *)self _shouldEnableNestedNavigationPopForTopItem:v8 backItem:v9]];
                      v82 = [v8 additionalOverflowItems];
                      [(_UINavigationBarContentView *)self->_contentView setAdditionalItems:v82];

                      goto LABEL_85;
                    }
                    v74 = objc_msgSend(v8, "_dci_documentMenu");

                    if (v74)
                    {
                      uint64_t v75 = objc_msgSend(v8, "_dci_documentMenu");
                      v76 = (id *)v140;
                      v140[0] = MEMORY[0x1E4F143A8];
                      v140[1] = 3221225472;
                      v140[2] = __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke;
                      v140[3] = &unk_1E52DD380;
                      v140[4] = v75;
                      id v77 = v75;
                    }
                    else
                    {
                      v71 = objc_msgSend(v8, "_dci_renameHandler");

                      if (!v71) {
                        goto LABEL_83;
                      }
                      v107 = +[UICommand _defaultCommandForAction:sel_rename_];
                      if (!v107)
                      {
                        id v77 = 0;
                        v71 = 0;
                        goto LABEL_82;
                      }
                      v76 = (id *)v139;
                      v139[0] = MEMORY[0x1E4F143A8];
                      v139[1] = 3221225472;
                      v139[2] = __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke_2;
                      v139[3] = &unk_1E52DD380;
                      id v77 = v107;
                      v139[4] = v77;
                    }
                    v71 = _Block_copy(v76);

LABEL_82:
                    v73 = v138;
                    goto LABEL_83;
                  }
                }
                else
                {
                }
              }
              [(_UINavigationBarContentView *)self->_contentView setTrailingBarButtonItems:v146];
              [(_UINavigationBarContentView *)self->_contentView setTrailingBarGroups:v145];
              goto LABEL_77;
            }
          }
          else
          {
          }
        }
        [(_UINavigationBarContentView *)self->_contentView setLeadingBarButtonItems:v148];
        [(_UINavigationBarContentView *)self->_contentView setLeadingBarGroups:v147];
        goto LABEL_68;
      }
      if (v25) {
        double v29 = v25[35];
      }
      else {
        double v29 = 0.0;
      }

      if (v29 < 0.05) {
        goto LABEL_31;
      }
    }
LABEL_16:
    char v20 = self->super._navigationBar;
    id v21 = v8;
    double v22 = [v21 scrollEdgeAppearance];
    double v23 = v22;
    if (v22)
    {
      id v16 = v22;
    }
    else
    {
      uint64_t v27 = [(UINavigationBar *)v20 scrollEdgeAppearance];
      double v28 = v27;
      if (v27)
      {
        id v16 = v27;
      }
      else
      {
        v33 = v20;
        v34 = [v21 standardAppearance];
        int v35 = v34;
        if (v34)
        {
          id v36 = v34;
        }
        else
        {
          id v36 = [(UINavigationBar *)v33 standardAppearance];
        }
        id v16 = v36;
      }
    }

    goto LABEL_41;
  }
LABEL_143:
}

- (BOOL)wantsLargeTitleDisplayed
{
  return [(_UINavigationBarVisualProviderModernIOS *)self _stackWantsLargeTitleDisplayedForItem:0];
}

- (void)_updateTabBarSuppressionIfNeeded
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v4 = [v3 _stackEntry];
  self->_BOOL isSuppressingTabBar = [v4 isSearchActive];

  if (self->_isActiveTabBarHost)
  {
    BOOL isSuppressingTabBar = self->_isSuppressingTabBar;
    tabBarHostedView = self->_tabBarHostedView;
    [(_UITabContainerView *)tabBarHostedView setSuppressTabBar:isSuppressingTabBar];
  }
}

- (BOOL)_shouldEnableNestedNavigationPopForTopItem:(id)a3 backItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && ([v6 backAction], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [(UINavigationBar *)self->super._navigationBar delegate];
    if (objc_opt_respondsToSelector()) {
      char v10 = [v9 _navigationBarTopItemIsNestedNavigationController:self->super._navigationBar];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_adjustedAppearanceTitleAttributes:(id)a3 allowsLargeTitle:(BOOL)a4
{
  id v4 = a3;
  return v4;
}

- (void)_configureMarginsOnContentViewsAndPalette:(id)a3 withContentMargin:(double)a4
{
  id v32 = a3;
  [(_UINavigationBarVisualProviderModernIOS *)self leadingMarginForContentViewsWithContentMargin:a4];
  double v7 = v6;
  -[_UINavigationBarContentView _setDirectionalLayoutMargins:](self->_contentView, "_setDirectionalLayoutMargins:", 0.0, v6, 0.0, a4);
  -[UIView setDirectionalLayoutMargins:](self->_promptView, "setDirectionalLayoutMargins:", 0.0, v7, 0.0, a4);
  [(_UINavigationBarVisualProviderModernIOS *)self resolvedLargeTitleMargins];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(UIView *)self->super._navigationBar insetsLayoutMarginsFromSafeArea]
    && [(UIView *)self->_largeTitleView insetsLayoutMarginsFromSafeArea])
  {
    BOOL v16 = [(UIView *)self->super._navigationBar _shouldReverseLayoutDirection];
    [(UIView *)self->super._navigationBar safeAreaInsets];
    if (v16) {
      double v21 = v15;
    }
    else {
      double v21 = v11;
    }
    if (v16) {
      double v22 = v11;
    }
    else {
      double v22 = v15;
    }
    double v9 = v9 - v17;
    double v13 = v13 - v19;
    if (v16) {
      double v11 = v22 - v20;
    }
    else {
      double v11 = v21 - v18;
    }
    if (v16) {
      double v15 = v21 - v18;
    }
    else {
      double v15 = v22 - v20;
    }
  }
  -[UIView setDirectionalLayoutMargins:](self->_largeTitleView, "setDirectionalLayoutMargins:", v9, v11, v13, v15);
  double v23 = v32;
  if (v32)
  {
    uint64_t v24 = [v32 _contentViewMarginType];
    if (v24 == 2)
    {
      double v26 = [v32 contentView];
      uint64_t v27 = v26;
      double v28 = v9;
      double v30 = v11;
      double v29 = v13;
      double v31 = v15;
    }
    else
    {
      BOOL v25 = v24 == 1;
      double v23 = v32;
      if (!v25) {
        goto LABEL_22;
      }
      double v26 = [v32 contentView];
      uint64_t v27 = v26;
      double v28 = 0.0;
      double v29 = 0.0;
      double v30 = a4;
      double v31 = a4;
    }
    objc_msgSend(v26, "setDirectionalLayoutMargins:", v28, v30, v29, v31);

    double v23 = v32;
  }
LABEL_22:
}

- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins
{
  if ([(_UINavigationBarVisualProviderModernIOS *)self allowLargeTitleView])
  {
    [(_UINavigationBarVisualProviderModernIOS *)self largeSearchBaseMarginsRequiringNavMinimums:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    [(_UINavigationBarVisualProvider *)&v7 resolvedLargeTitleMargins];
  }
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v4 = [(UIView *)self->super._navigationBar window];
  if (v4)
  {
  }
  else
  {
    id v36 = [v3 item];
    uint64_t v37 = [v36 _navigationBar];
    navigationBar = self->super._navigationBar;

    if (v37 != navigationBar) {
      goto LABEL_24;
    }
  }
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = [(_UIPointerInteractionAssistant *)self->_assistant previewContainer];
  objc_msgSend(v9, "setFrame:", v5, v6, v7, v8);

  [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v3];
  double v10 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v11 = [v10 activeLayout];

  if (!self->_transitionContext)
  {
    if (v11) {
      double v12 = (void *)v11[18];
    }
    else {
      double v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      [(UIView *)self->_largeTitleView removeFromSuperview];
      [(UIView *)self->_weeTitleLabel removeFromSuperview];
    }
    double v14 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    double v15 = [v14 inactiveLayout];

    if (v11 || !v15)
    {
      -[_UINavigationBarLayout removeViewsNotInLayout:]((uint64_t)v15, v11);
LABEL_11:

      goto LABEL_12;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v42 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      v43 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
      int v44 = 138412290;
      uint64_t v45 = v43;
      _os_log_fault_impl(&dword_1853B0000, v42, OS_LOG_TYPE_FAULT, "Unexpected configuration for the top navigation item on the navigation bar (activeLayout is nil with non-nil inactiveLayout). %@", (uint8_t *)&v44, 0xCu);
    }
    else
    {
      uint64_t v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &layoutSubviews___s_category) + 8);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      stack = self->super._stack;
      v42 = v40;
      v43 = [(_UINavigationBarItemStack *)stack topEntry];
      int v44 = 138412290;
      uint64_t v45 = v43;
      _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "Unexpected configuration for the top navigation item on the navigation bar (activeLayout is nil with non-nil inactiveLayout). %@", (uint8_t *)&v44, 0xCu);
    }

LABEL_29:
    goto LABEL_11;
  }
LABEL_12:
  BOOL v16 = [v3 item];
  if ([v16 _hasInlineSearchBar])
  {
    double v17 = [v16 _searchControllerIfAllowed];
    double v18 = [v17 searchBar];

    double v19 = [v18 superview];
    double v20 = self->super._navigationBar;

    if (v19 == v20) {
      [v18 removeFromSuperview];
    }
  }
  [(UIView *)self->super._navigationBar _contentMargin];
  double v22 = v21;
  double v23 = [v16 _topPalette];
  uint64_t v24 = [v16 _bottomPalette];
  [v23 setAssistantIdentifier:@"Palette.itemTop"];
  [v23 setAssistant:self->_assistant];
  [v24 setAssistantIdentifier:@"Palette.itemBottom"];
  [v24 setAssistant:self->_assistant];
  [(_UINavigationBarVisualProviderModernIOS *)self _configureMarginsOnContentViewsAndPalette:v23 withContentMargin:v22];
  [(_UINavigationBarVisualProviderModernIOS *)self _configureMarginsOnContentViewsAndPalette:v24 withContentMargin:v22];
  [(UIView *)self->_contentView setSemanticContentAttribute:[(UIView *)self->super._navigationBar semanticContentAttribute]];
  [(_UINavigationBarVisualProviderModernIOS *)self _updatePromptViewAndActuallyHide:1];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateAugmentedTitleDataSources];
  BOOL v25 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v16 backItem:v25];

  uint64_t v26 = [(_UINavigationBarItemStack *)self->super._stack itemCount];
  [(UIView *)self->super._navigationBar bounds];
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  if (v26 < 1)
  {
    [(_UINavigationBarVisualProviderModernIOS *)self _contentBackgroundExtension];
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v31, v32 - v39, v33, v34 + v39);
  }
  else
  {
    -[_UINavigationBarVisualProviderModernIOS _layoutInBounds:](self, "_layoutInBounds:", v27, v28, v29, v30);
    [(UIView *)self->super._navigationBar _contentMargin];
    if (v22 != v35) {
      -[_UINavigationBarVisualProviderModernIOS _configureMarginsOnContentViewsAndPalette:withContentMargin:](self, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v24);
    }
    [(_UINavigationBarVisualProviderModernIOS *)self _updateTitleViewForLayout:v11];
  }
  [(_UINavigationBarVisualProviderModernIOS *)self updateBarVisibilityForTopItem];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateBackground];
  [(_UINavigationBarVisualProviderModernIOS *)self _enforceLayoutOrdering];
  [(_UIBarCustomizer *)self->_customizer invalidateLayout];

LABEL_24:
}

- (void)updateBarVisibilityForTopItem
{
  v24[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v4 = [v3 item];
  uint64_t v5 = [v4 _navigationBarVisibility];
  BOOL v6 = v5 != 0;

  if (self->_isHidden != v6)
  {
    double v7 = (void *)MEMORY[0x1E4F3A148];
    if (!self->_hiddenFilter)
    {
      double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      hiddenFilter = self->_hiddenFilter;
      self->_hiddenFilter = v8;

      [(CAFilter *)self->_hiddenFilter setName:@"barVisibility"];
      if (self->_isHidden) {
        +[UIColor clearColor];
      }
      else {
      double v10 = +[UIColor whiteColor];
      }
      double v11 = self->_hiddenFilter;
      id v12 = v10;
      -[CAFilter setValue:forKey:](v11, "setValue:forKey:", [v12 CGColor], *v7);
      v24[0] = self->_hiddenFilter;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      double v14 = [(UIView *)self->super._navigationBar layer];
      [v14 setFilters:v13];
    }
    if (v5) {
      +[UIColor clearColor];
    }
    else {
    double v15 = +[UIColor whiteColor];
    }
    BOOL v16 = [(UIView *)self->super._navigationBar layer];
    id v17 = v15;
    uint64_t v18 = [v17 CGColor];
    double v19 = NSString;
    double v20 = [(CAFilter *)self->_hiddenFilter name];
    double v21 = [v19 stringWithFormat:@"filters.%@.%@", v20, *v7];
    [v16 setValue:v18 forKeyPath:v21];

    self->_isHidden = v6;
    double v22 = [(_UINavigationBarVisualProvider *)self navigationBar];
    double v23 = [v22 delegate];

    if (objc_opt_respondsToSelector()) {
      [v23 _navigationBarDidUpdateVisibility:self->super._navigationBar];
    }
  }
}

- (void)_updatePromptViewAndActuallyHide:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  BOOL v6 = [v5 prompt];

  if (v3) {
    [(UIView *)self->_promptView setHidden:v6 == 0];
  }
  double v7 = 0.0;
  if (v6) {
    double v7 = 1.0;
  }
  promptView = self->_promptView;
  [(UIView *)promptView setAlpha:v7];
}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4
{
}

- (void)_enforceLayoutOrdering
{
  if (!dyld_program_sdk_at_least()
    || ([(UIView *)self->super._navigationBar window],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    if (![(_UINavigationBarVisualProviderModernIOS *)self _isInnerNavigationBarOfNestedNavigationController])
    {
      id v8 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
      if (v8)
      {
        double v4 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
        uint64_t v5 = [v4 activeLayout];
        -[_UINavigationBarLayout installViewsInNavigationBar:]((uint64_t)v5, self->super._navigationBar);

        if ((dyld_program_sdk_at_least() & 1) == 0) {
          [(UINavigationBar *)self->super._navigationBar didAddSubview:self->_backgroundView];
        }
      }
      else
      {
        [(UIView *)self->super._navigationBar insertSubview:self->_backgroundView atIndex:0];
      }
      navigationBar = self->super._navigationBar;
      double v7 = [(_UIPointerInteractionAssistant *)self->_assistant previewContainer];
      [(UIView *)navigationBar addSubview:v7];
    }
  }
}

- (void)_updateAugmentedTitleDataSources
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack previousBackItem];
  [v3 _setTitleViewDataSource:0];

  double v4 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  [v4 _setTitleViewDataSource:0];

  uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
  [v5 _setTitleViewDataSource:self->_contentView];

  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  [v6 _setTitleViewDataSource:self->_contentView];
}

- (void)_updateTitleViewForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  char v6 = [v5 isSearchActive];

  if (v6) {
    goto LABEL_30;
  }
  [(UIView *)self->super._navigationBar bounds];
  self->_previousBarSize.double width = v7;
  self->_previousBarSize.double height = v8;
  if (v4) {
    double v9 = (void *)*((void *)v4 + 18);
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (v4)
    {
      double v11 = *((double *)v4 + 35);
      BOOL v12 = v11 < 0.05;
      double v13 = 1.0;
      if (v11 >= 0.05) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
    double v13 = 0.0;
LABEL_8:
    if (v12) {
      double v14 = 1.0;
    }
    else {
      double v14 = 0.0;
    }
    if (self->_transitionContext
      || ![(_UINavigationBarVisualProviderModernIOS *)self _isInInteractiveScroll])
    {
      [(_UINavigationBarContentView *)self->_contentView setInlineTitleViewAlpha:v14];
      [(UIView *)self->_largeTitleView setAlpha:v13];
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __69___UINavigationBarVisualProviderModernIOS__updateTitleViewForLayout___block_invoke;
      v26[3] = &unk_1E52DD178;
      v26[4] = self;
      *(double *)&v26[5] = v14;
      *(double *)&v26[6] = v13;
      +[UIView animateWithDuration:v26 animations:0.2];
    }
    if (!self->_transitionContext)
    {
      double v15 = [(_UINavigationBarItemStack *)self->super._stack topItem];
      BOOL v16 = [v15 _weeTitle];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        [(UIView *)self->super._navigationBar bounds];
        double v19 = v18;
        [(UIView *)self->_contentView frame];
        double v20 = v19 - CGRectGetMaxY(v27);
        [(_UINavigationBarLargeTitleView *)self->_largeTitleView restingHeightOfTitleView];
        double v22 = v21 - v20;
        if (v22 < 0.0) {
          double v22 = 0.0;
        }
        if (v22 >= 10.0) {
          double v23 = 0.0;
        }
        else {
          double v23 = (10.0 - v22) / 10.0;
        }
        if (v23 < 0.0) {
          double v23 = 0.0;
        }
        double v24 = fmin(v23, 1.0);
        weeTitleLabel = self->_weeTitleLabel;
      }
      else
      {
        weeTitleLabel = self->_weeTitleLabel;
        double v24 = 0.0;
      }
      [(UIView *)weeTitleLabel setAlpha:v24];
    }
    goto LABEL_30;
  }
  if (self->_appearanceAPIVersion < 1 || !self->_transitionContext) {
    [(_UINavigationBarContentView *)self->_contentView setInlineTitleViewAlpha:self->_titleAlpha];
  }
LABEL_30:
}

- (BOOL)_isInInteractiveScroll
{
  v2 = [(UINavigationBar *)self->super._navigationBar delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v3 = [v2 _navigationBarLayoutIsInInteractiveScroll];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)changeAppearance
{
  char v3 = [(UINavigationBar *)self->super._navigationBar largeTitleTextAttributes];
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitleAttributes:v3];

  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  [(_UINavigationBarVisualProviderModernIOS *)self _installWindowMoveClientInteractionIfNecessary];
}

- (void)prepare
{
  v37.receiver = self;
  v37.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  [(_UINavigationBarVisualProvider *)&v37 prepare];
  self->_titleAlpha = 1.0;
  self->_double backgroundAlpha = 1.0;
  self->_shadowAlpha = 1.0;
  [(UIView *)self->super._navigationBar bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_UINavigationBarVisualProviderModernIOS *)self alternateBarBackground];
  if (v11)
  {
    objc_storeStrong((id *)&self->_backgroundView, v11);
    BOOL v12 = 0;
  }
  else
  {
    double v13 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v4, v6, v8, v10);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v13;

    BOOL v12 = 1;
    [(_UIBarBackground *)self->_backgroundView setTopAligned:1];
  }
  self->_usesBarBackground = v12;
  objc_initWeak(&location, self);
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  double v33 = __50___UINavigationBarVisualProviderModernIOS_prepare__block_invoke;
  double v34 = &unk_1E52DE810;
  objc_copyWeak(&v35, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:&v31];
  double v15 = [_UINavigationBarContentView alloc];
  BOOL v16 = [(_UINavigationBarVisualProvider *)self contentViewVisualProvider];
  uint64_t v17 = -[_UINavigationBarContentView initWithFrame:visualProvider:](v15, "initWithFrame:visualProvider:", v16, v4, v6, v8, v10);
  contentView = self->_contentView;
  self->_contentView = v17;

  [(_UINavigationBarContentView *)self->_contentView setDelegate:self];
  double v19 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v20 = [v19 _splitViewControllerEnforcingClass:0];
    BOOL v21 = [v20 primaryEdge] == 1;
  }
  else
  {
    BOOL v21 = 0;
  }
  [(_UINavigationBarContentView *)self->_contentView setStaticNavBarButtonTrailing:v21];
  [(_UINavigationBarContentView *)self->_contentView setStaticNavBarButtonItem:self->_staticNavBarButtonItem];
  double v22 = -[_UINavigationBarLargeTitleView initWithFrame:]([_UINavigationBarLargeTitleView alloc], "initWithFrame:", v4, v6, v8, v10);
  largeTitleView = self->_largeTitleView;
  self->_largeTitleView = v22;

  [(UIView *)self->_largeTitleView setClipsToBounds:1];
  double v24 = [(UIView *)self->super._navigationBar traitCollection];
  uint64_t v25 = [v24 userInterfaceIdiom];
  uint64_t v26 = _UINavigationTitleAppearanceAddDefaultLargeTitleAttributes(MEMORY[0x1E4F1CC08], v25);
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView setTitleAttributes:v26];

  CGRect v27 = -[_UINavigationBarModernPromptView initWithFrame:]([_UINavigationBarModernPromptView alloc], "initWithFrame:", v4, v6, v8, v10);
  promptView = self->_promptView;
  self->_promptView = v27;

  double v29 = objc_alloc_init(_UIPointerInteractionAssistant);
  assistant = self->_assistant;
  self->_assistant = v29;

  [(UIView *)self->super._navigationBar addInteraction:self->_assistant];
  [(_UINavigationBarContentView *)self->_contentView setAssistant:self->_assistant];
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView setAssistant:self->_assistant];
  [(UIView *)self->super._navigationBar _setWantsAutolayout];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateContentPriorities];
  if ([(UIView *)self->super._navigationBar translatesAutoresizingMaskIntoConstraints])
  {
    [(UIView *)self->super._navigationBar _setHostsLayoutEngine:1];
  }
  [(_UINavigationBarVisualProviderModernIOS *)self _setUpContentFocusContainerGuide];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (void)_setUpContentFocusContainerGuide
{
  v20[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self->super._navigationBar _focusSystem];

  if (v3)
  {
    if (!self->_contentFocusContainerGuide)
    {
      double v4 = objc_alloc_init(UIFocusContainerGuide);
      contentFocusContainerGuide = self->_contentFocusContainerGuide;
      self->_contentFocusContainerGuide = v4;

      [(UIView *)self->super._navigationBar addLayoutGuide:self->_contentFocusContainerGuide];
      [(UILayoutGuide *)self->_contentFocusContainerGuide setIdentifier:@"UINavigationBarContentFocusContainerGuide"];
      BOOL v16 = (void *)MEMORY[0x1E4F5B268];
      double v19 = [(UILayoutGuide *)self->_contentFocusContainerGuide topAnchor];
      double v18 = [(UIView *)self->super._navigationBar topAnchor];
      uint64_t v17 = [v19 constraintEqualToAnchor:v18];
      v20[0] = v17;
      double v6 = [(UILayoutGuide *)self->_contentFocusContainerGuide leadingAnchor];
      double v7 = [(UIView *)self->super._navigationBar leadingAnchor];
      double v8 = [v6 constraintEqualToAnchor:v7];
      v20[1] = v8;
      double v9 = [(UILayoutGuide *)self->_contentFocusContainerGuide trailingAnchor];
      double v10 = [(UIView *)self->super._navigationBar trailingAnchor];
      double v11 = [v9 constraintEqualToAnchor:v10];
      v20[2] = v11;
      BOOL v12 = [(UILayoutGuide *)self->_contentFocusContainerGuide bottomAnchor];
      double v13 = [(UIView *)self->super._navigationBar bottomAnchor];
      double v14 = [v12 constraintEqualToAnchor:v13];
      v20[3] = v14;
      double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      [v16 activateConstraints:v15];
    }
  }
}

- (id)alternateBarBackground
{
  return 0;
}

- (void)_updateContentPriorities
{
  double v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v4 = [v3 activeLayout];
  if (-[_UINavigationBarLayout isVariableHeight]((BOOL)v4)) {
    float v5 = 250.0;
  }
  else {
    float v5 = 750.0;
  }

  [(UIView *)self->super._navigationBar contentHuggingPriorityForAxis:1];
  float v7 = v6;
  [(UIView *)self->super._navigationBar contentCompressionResistancePriorityForAxis:1];
  float v9 = *(float *)&v8;
  if (v5 == v7)
  {
    if (v5 == *(float *)&v8) {
      return;
    }
  }
  else
  {
    *(float *)&double v8 = v5;
    [(UIView *)self->super._navigationBar setContentHuggingPriority:1 forAxis:v8];
    if (v5 == v9) {
      goto LABEL_9;
    }
  }
  *(float *)&double v8 = v5;
  [(UIView *)self->super._navigationBar setContentCompressionResistancePriority:1 forAxis:v8];
LABEL_9:
  [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
}

- (id)_backButtonMenu
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (_UINavigationBarBackButtonShowsContextMenu())
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke;
    v8[3] = &unk_1E52DE860;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    double v3 = +[UIDeferredMenuElement elementWithProvider:v8];
    double v4 = objc_opt_new();
    [v4 setMaximumNumberOfTitleLines:1];
    v11[0] = v3;
    float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    float v6 = +[UIMenu menuWithChildren:v5];

    [v6 setDisplayPreferences:v4];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    float v6 = 0;
  }
  return v6;
}

- (id)_effectiveLegacyTitleAttributes
{
  double v3 = [(UINavigationBar *)self->super._navigationBar titleTextAttributes];
  uint64_t v4 = *(void *)off_1E52D2048;
  float v5 = [v3 objectForKeyedSubscript:*(void *)off_1E52D2048];

  if (!v5)
  {
    float v6 = (void *)[v3 mutableCopy];
    float v7 = [(_UINavigationBarVisualProviderModernIOS *)self _compatibleDefaultTextColor];
    [v6 setObject:v7 forKeyedSubscript:v4];

    double v3 = v6;
  }
  double v8 = [(UIView *)self->super._navigationBar traitCollection];
  id v9 = _UINavigationTitleAppearanceAddDefaultTitleAttributes(v3, [v8 userInterfaceIdiom]);

  return v9;
}

- (id)_compatibleDefaultTextColor
{
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (unint64_t)([(UINavigationBar *)self->super._navigationBar barStyle] - 1) > 1)
  {
    double v3 = +[UIColor labelColor];
  }
  else
  {
    double v3 = +[UIColor whiteColor];
  }
  return v3;
}

- (void)navigationItemUpdatedLargeTitleDisplayMode:(id)a3
{
  id v6 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];

    if (v4 == v6)
    {
      if (_UIBarsApplyChromelessEverywhere())
      {
        [(_UINavigationBarVisualProviderModernIOS *)self changeLayout];
        float v5 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
        if (objc_opt_respondsToSelector()) {
          [v5 _navigationBar:self->super._navigationBar topItemUpdatedLargeTitleDisplayMode:v6];
        }
      }
    }
  }
}

- (void)changeLayout
{
  [(_UINavigationBarContentView *)self->_contentView setRequestedContentSize:[(UINavigationBar *)self->super._navigationBar requestedContentSize]];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateContentPriorities];
  double v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  id v4 = [v3 activeLayout];
  -[_UINavigationBarLayout updateLayout]((uint64_t)v4);

  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
}

- (void)_invalidateIntrinsicContentSizeAndNotifySizeChanged
{
  [(UINavigationBar *)self->super._navigationBar invalidateIntrinsicContentSize];
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  navigationBar = self->super._navigationBar;
  [(UINavigationBar *)navigationBar _sendNavigationBarResize];
}

- (void)stackDidChangeFrom:(id)a3
{
}

- (void)removeContentForItem:(id)a3
{
  id v5 = [a3 _stackEntry];
  double v3 = [v5 normalLayout];
  -[_UINavigationBarLayout removeAllViews]((uint64_t)v3);

  id v4 = [v5 searchLayout];
  -[_UINavigationBarLayout removeAllViews]((uint64_t)v4);
}

- (void)_installWindowMoveClientInteractionIfNecessary
{
  BOOL v3 = [(_UINavigationBarVisualProviderModernIOS *)self _wantsWindowMoveClientInteractionInstalled];
  windowDragClientInteraction = self->_windowDragClientInteraction;
  if (v3)
  {
    if (!windowDragClientInteraction)
    {
      id v5 = objc_alloc_init(UIWindowSceneDragInteraction);
      id v6 = self->_windowDragClientInteraction;
      self->_windowDragClientInteraction = v5;

      windowDragClientInteraction = self->_windowDragClientInteraction;
    }
    navigationBar = self->super._navigationBar;
    [(UIView *)navigationBar addInteraction:windowDragClientInteraction];
  }
  else if (windowDragClientInteraction)
  {
    double v8 = self->super._navigationBar;
    -[UIView removeInteraction:](v8, "removeInteraction:");
  }
}

- (BOOL)_wantsWindowMoveClientInteractionInstalled
{
  BOOL v3 = [(UIView *)self->super._navigationBar traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  char v5 = _os_feature_enabled_impl();
  if ([(UINavigationBar *)self->super._navigationBar barPosition] == 3) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  return v4 == 1 && v6;
}

- (void)navigationItemUpdatedScrollEdgeProgress:(id)a3
{
  id v17 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state]
    && ![(UIView *)self->super._navigationBar _canDrawContent])
  {
    uint64_t v4 = [v17 _stackEntry];
    if ([(_UINavigationBarVisualProviderModernIOS *)self alwaysEvaluateChromelessTransitionProgress])
    {
      [v4 activeLayout];
    }
    else
    {
      [v4 normalLayout];
    uint64_t v5 = };
    int v6 = [(_UINavigationBarVisualProviderModernIOS *)self useManualScrollEdgeAppearanceForItem:v17];
    int v7 = v6;
    if (v5)
    {
      BOOL v8 = *(unsigned char *)(v5 + 111) != 0;
      if (*(unsigned __int8 *)(v5 + 111) != v6)
      {
        *(unsigned char *)(v5 + 111) = v6;
        [(id)v5 _updateLayoutOutputs];
      }
      [v17 _manualScrollEdgeAppearanceProgress];
      double v10 = v9;
      double v11 = *(double *)(v5 + 216);
      *(double *)(v5 + 216) = v9;
      if (*(unsigned char *)(v5 + 111)) {
        [(id)v5 _updateLayoutOutputs];
      }
    }
    else
    {
      [v17 _manualScrollEdgeAppearanceProgress];
      double v10 = v16;
      BOOL v8 = 0;
      double v11 = 0.0;
    }
    BOOL v12 = v10 == v11;
    if (!v7) {
      BOOL v12 = !v8;
    }
    if (!v12)
    {
      double v13 = [(_UINavigationBarItemStack *)self->super._stack topEntry];

      if (v13 == v4)
      {
        [(_UINavigationBarVisualProviderModernIOS *)self _updateBackground];
        char v14 = [v17 _isManualScrollEdgeAppearanceEnabled];
        if ([(_UINavigationBarVisualProviderModernIOS *)self alwaysEvaluateChromelessTransitionProgress])
        {
          if ((v14 & 1) == 0)
          {
            double v15 = [(_UINavigationBarItemStack *)self->super._stack backItem];
            [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v17 backItem:v15 animated:0];
          }
        }
      }
    }
  }
}

- (int64_t)appearanceAPIVersion
{
  return self->_appearanceAPIVersion;
}

- (void)setAppearanceAPIVersion:(int64_t)a3
{
  int64_t appearanceAPIVersion = self->_appearanceAPIVersion;
  if (appearanceAPIVersion > a3)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:596 description:@"We shouldn't be decreasing the API version... right?"];

    int64_t appearanceAPIVersion = self->_appearanceAPIVersion;
  }
  if (appearanceAPIVersion != a3)
  {
    self->_int64_t appearanceAPIVersion = a3;
    self->_useModernAppearanceAPI = a3 > 1;
    if (a3 >= 2)
    {
      stack = self->super._stack;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67___UINavigationBarVisualProviderModernIOS_setAppearanceAPIVersion___block_invoke;
      v9[3] = &unk_1E52DDF58;
      v9[4] = self;
      [(_UINavigationBarItemStack *)stack iterateEntries:v9];
    }
  }
}

- (void)_updateLegacyLayout:(id)a3 forNavigationItem:(id)a4
{
  id v6 = a3;
  navigationBar = self->super._navigationBar;
  id v8 = a4;
  BOOL v9 = [(UINavigationBar *)navigationBar isTranslucent];
  double v10 = [(UINavigationBar *)self->super._navigationBar backgroundEffects];
  double v11 = [(UINavigationBar *)self->super._navigationBar _effectiveBarTintColor];
  UIBarStyle v12 = [(UINavigationBar *)self->super._navigationBar barStyle];
  UIBarStyle v13 = v12;
  if (v10)
  {
    [v6 configureWithEffects:v10];
  }
  else if (v12 == 4 {
         || (char v14 = self->super._navigationBar,
  }
             id v22 = 0,
             [(UINavigationBar *)v14 _getBackgroundImage:&v22 shouldRespectOversizedBackgroundImage:0 actualBarMetrics:0 actualBarPosition:0], (id v15 = v22) == 0))
  {
    [v6 configureEffectForStyle:v13 backgroundTintColor:v11 forceOpaque:!v9];
  }
  else
  {
    double v16 = v15;
    self->_backgroundTransparentWhenNotCollapsed = 1;
    char v21 = 0;
    [v15 _isInvisibleAndGetIsTranslucent:&v21];
    if (v9)
    {
      [v6 configureImage:v16 forceTranslucent:v21 == 0];
    }
    else
    {
      BOOL v17 = v21 != 0;
      if (v11) {
        [v6 configureImage:v16 forceOpaque:v17 backgroundTintColor:v11];
      }
      else {
        [v6 configureImage:v16 forceOpaque:v17 barStyle:v13];
      }
    }
  }
  double v18 = [(UINavigationBar *)self->super._navigationBar shadowImage];
  char v19 = [v8 _backgroundHidden];

  if ((v19 & 1) == 0)
  {
    BOOL v20 = [(UINavigationBar *)self->super._navigationBar _hidesShadow];
    if (v18 && !v20)
    {
      [v6 configureShadowImage:v18];
      goto LABEL_19;
    }
    if (!v20)
    {
      [v6 configureShadowForBarStyle:v13];
      goto LABEL_19;
    }
  }
  [v6 configureWithoutShadow];
LABEL_19:
  [v6 setShadowAlpha:self->_shadowAlpha];
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_appearanceAPIVersion > 1
    || ((uint64_t v9 = [v7 userInterfaceStyle],
         (unint64_t)([(UINavigationBar *)self->super._navigationBar barStyle] - 3) >= 0xFFFFFFFFFFFFFFFELL)
      ? (BOOL v10 = v9 == 2)
      : (BOOL v10 = 1),
        v10))
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [v8 _traitCollectionByReplacingNSIntegerValue:2 forTraitToken:0x1ED3F5A48];
  }
  UIBarStyle v12 = v11;

  return v12;
}

- (id)_updateBackgroundLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if ([(UIView *)self->super._navigationBar _canDrawContent])
  {
    id v11 = 0;
    goto LABEL_17;
  }
  if (!+[_UIBarBackgroundLayoutPrototyping prototypingEnabled])
  {
    if (self->_appearanceAPIVersion >= 2)
    {
      UIBarStyle v12 = [(_UINavigationBarVisualProviderModernIOS *)self _backgroundLayoutOfClass:objc_opt_class() fromLayout:v9];

      [(_UINavigationBarVisualProviderModernIOS *)self _updateModernLayout:v12 forNavigationItem:v10 compact:v5];
      goto LABEL_16;
    }
    UIBarStyle v12 = [(_UINavigationBarVisualProviderModernIOS *)self _backgroundLayoutOfClass:objc_opt_class() fromLayout:v9];

    int64_t v13 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
    if (v5)
    {
      if (v13 == 1 || v13 == 102) {
        goto LABEL_15;
      }
      char v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = v14;
      double v16 = @"LEGACY: Trying to update background for compact size while bar is not in compact size is not supported";
      SEL v17 = a2;
      double v18 = self;
      uint64_t v19 = 2160;
    }
    else
    {
      if (!v13 || v13 == 101) {
        goto LABEL_15;
      }
      char v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = v14;
      double v16 = @"LEGACY: Trying to update background for default size while bar is not in default size is not supported";
      SEL v17 = a2;
      double v18 = self;
      uint64_t v19 = 2162;
    }
    [v14 handleFailureInMethod:v17 object:v18 file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:v19 description:v16];

LABEL_15:
    [(_UINavigationBarVisualProviderModernIOS *)self _updateLegacyLayout:v12 forNavigationItem:v10];
    goto LABEL_16;
  }
  UIBarStyle v12 = +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:1];

LABEL_16:
  id v9 = v12;
  id v11 = v9;
LABEL_17:

  return v11;
}

- (void)_updateModernLayout:(id)a3 forNavigationItem:(id)a4 compact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  navigationBar = self->super._navigationBar;
  id v22 = v8;
  if (v5)
  {
    id v10 = a3;
    id v11 = _compactAppearance(navigationBar, v22);
    UIBarStyle v12 = [v11 _backgroundData];

    if (![(_UINavigationBarVisualProviderModernIOS *)self alwaysEvaluateChromelessTransitionProgress])
    {
      id v20 = v12;
      UIBarStyle v12 = v20;
      goto LABEL_13;
    }
    int64_t v13 = _nullableCompactScrollEdgeAppearance(self->super._navigationBar, v22);
    if (!v13)
    {
      uint64_t v14 = +[_UIBarBackgroundAppearanceData transparentBackgroundData];
LABEL_12:
      id v20 = (id)v14;

      goto LABEL_13;
    }
LABEL_11:
    uint64_t v14 = [v13 _backgroundData];
    goto LABEL_12;
  }
  id v15 = navigationBar;
  id v16 = a3;
  SEL v17 = [v22 standardAppearance];
  double v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(UINavigationBar *)v15 standardAppearance];
  }
  char v21 = v19;

  UIBarStyle v12 = [v21 _backgroundData];

  int64_t v13 = [v22 scrollEdgeAppearance];
  if (v13) {
    goto LABEL_11;
  }
  int64_t v13 = [(UINavigationBar *)self->super._navigationBar scrollEdgeAppearance];
  if (v13) {
    goto LABEL_11;
  }
  id v20 = +[_UIBarBackgroundAppearanceData transparentBackgroundData];
LABEL_13:
  [a3 setBackgroundData1:v12];
  [a3 setBackgroundData2:v20];
}

- (void)prepareForStackChange
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  [(_UINavigationBarVisualProviderModernIOS *)self _upgradeAppearanceAPIForItemIfNecessary:v3];

  [(_UINavigationBarVisualProviderModernIOS *)self _prepareLayouts];
}

- (void)_upgradeAppearanceAPIForItemIfNecessary:(id)a3
{
  id v4 = a3;
  if (self->_appearanceAPIVersion <= 1)
  {
    id v7 = v4;
    BOOL v5 = [v4 standardAppearance];
    if (v5 || ([v7 compactAppearance], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      [(_UINavigationBarVisualProviderModernIOS *)self setAppearanceAPIVersion:2];
      id v4 = v7;
      goto LABEL_6;
    }
    id v6 = [v7 scrollEdgeAppearance];

    id v4 = v7;
    if (v6) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (BOOL)scrollEdgeAppearanceHasChromelessBehavior
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  uint64_t v4 = [v3 scrollEdgeAppearance];
  if (v4)
  {
    BOOL v5 = (void *)v4;
  }
  else
  {
    BOOL v5 = [(UINavigationBar *)self->super._navigationBar scrollEdgeAppearance];

    if (!v5)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
  }
  id v6 = [v5 _backgroundData];
  int v7 = [v6 hasBackground] ^ 1;

  return v7;
}

- (id)_backgroundLayoutOfClass:(Class)a3 fromLayout:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = (void *)[[a3 alloc] initWithLayout:v6];
  }
  id v8 = [(UIView *)self->super._navigationBar traitCollection];
  objc_msgSend(v7, "setInterfaceIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));
  objc_msgSend(v7, "setInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

  return v7;
}

- (void)_computeProvidesExtraSpaceForExcessiveLineHeightsForTopItem:(id)a3
{
  if (sHasEncounteredNavigationTitleWithExcessiveHeight)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = 1;
    [(_UINavigationBarVisualProviderModernIOS *)self _beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary];
  }
  else
  {
    uint64_t v4 = [a3 title];
    sHasEncounteredNavigationTitleWithExcessiveHeight = _UINavigationBarHasExcessiveLineHeightCharactersInTitle(v4);

    LODWORD(v4) = sHasEncounteredNavigationTitleWithExcessiveHeight;
    self->_providesExtraSpaceForExcessiveLineHeights = sHasEncounteredNavigationTitleWithExcessiveHeight;
    [(_UINavigationBarVisualProviderModernIOS *)self _beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary];
    if (v4)
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _postDidEncounterFirstTitleWithExcessiveHeightChanged];
    }
  }
}

- (void)_beginOrEndObservingDidEncounterFirstTitleWithExcessiveHeightChangedIfNecessary
{
  BOOL v2 = !self->_providesExtraSpaceForExcessiveLineHeights;
  if (v2 != self->_isObservingDidEncounterFirstTitleWithExcessiveHeightChanged)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = v4;
    if (self->_providesExtraSpaceForExcessiveLineHeights) {
      [v4 removeObserver:self name:@"_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged" object:0];
    }
    else {
      [v4 addObserver:self selector:sel__didEncounterFirstTitleWithExcessiveHeightChanged_ name:@"_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged" object:0];
    }
    self->_isObservingDidEncounterFirstTitleWithExcessiveHeightChanged = v2;
  }
}

- (void)navigationBarContentViewDidChangeTintColor:(id)a3
{
  id v4 = [a3 tintColor];
  [(UIView *)self->_customizationContainerView setTintColor:v4];
}

- (void)setStaticNavBarButtonLingers:(BOOL)a3
{
}

- (void)navigationItem:(id)a3 appearance:(id)a4 categoriesChanged:(int64_t)a5
{
  id v7 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v6 == v7)
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _upgradeAppearanceAPIForItemIfNecessary:v7];
      [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
    }
  }
}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  -[_UINavigationBarVisualProviderModernIOS setAppearanceAPIVersion:](self, "setAppearanceAPIVersion:", 2, a4);
  navigationBar = self->super._navigationBar;
  [(UINavigationBar *)navigationBar setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v21 = a3;
  id v4 = [(UIView *)self->super._navigationBar traitCollection];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 userInterfaceIdiom];
    BOOL v7 = v6 == -1;
    p_BOOL hasIdiom = &self->_hasIdiom;
    BOOL hasIdiom = self->_hasIdiom;
    if (!self->_hasIdiom && v6 != -1)
    {
      BOOL *p_hasIdiom = 1;
      [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
      BOOL hasIdiom = 0;
      goto LABEL_16;
    }
  }
  else
  {
    p_BOOL hasIdiom = &self->_hasIdiom;
    BOOL hasIdiom = self->_hasIdiom;
    BOOL v7 = 1;
  }
  if (!hasIdiom || !v7)
  {
    uint64_t v12 = [v5 horizontalSizeClass];
    if (v12 != [v21 horizontalSizeClass]
      || (uint64_t v13 = [v5 verticalSizeClass], v13 != objc_msgSend(v21, "verticalSizeClass")))
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentPriorities];
    }
  }
  else
  {
    BOOL *p_hasIdiom = 0;
    BOOL hasIdiom = 1;
  }
LABEL_16:
  [(_UINavigationBarContentView *)self->_contentView updateAugmentedTitleViewNavigationBarTraitsTo:v5 from:v21];
  [(_UINavigationBarVisualProviderModernIOS *)self _setUpContentFocusContainerGuide];
  if (v21 && hasIdiom && *p_hasIdiom)
  {
    uint64_t v14 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    uint64_t v15 = [v14 _hasInlineSearchBar];
    if (v15 != [v14 _hasInlineSearchBarForTraits:v21])
    {
      id v16 = [v14 _searchControllerIfAllowed];
      SEL v17 = [v16 searchBar];
      [v17 _setHostedInlineByNavigationBar:v15];

      double v18 = [v16 delegate];
      if (objc_opt_respondsToSelector())
      {
        if (v15) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
        [v18 searchController:v16 didChangeFromSearchBarPlacement:v19];
      }
      else if (objc_opt_respondsToSelector())
      {
        if (v15) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = 2;
        }
        objc_msgSend(v18, "_dci_searchController:didChangeToSearchBarPlacement:", v16, v20);
      }
    }
  }
}

- (void)navigationItemUpdatedAdditionalOverflowItems:(id)a3
{
  id v9 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v4 == v9)
    {
      id v5 = [v9 additionalOverflowItems];
      uint64_t v6 = [(_UINavigationBarContentView *)self->_contentView layout];
      int v7 = [v6 canUpdateAdditionalOverflowItemsInPlace];

      if (v7)
      {
        id v8 = [(_UINavigationBarContentView *)self->_contentView layout];
        [v8 setAdditionalOverflowItems:v5];
        [(_UINavigationBarContentView *)self->_contentView setAdditionalItems:v5];
      }
      else
      {
        id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
        [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v9 backItem:v8 animated:0];
      }
    }
  }
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    [(_UINavigationBarVisualProviderModernIOS *)self _performAnimationWithTransitionCompletion:a4 transition:1];
  }
  else {
    [(_UINavigationBarVisualProviderModernIOS *)self _updateWithCompletion:a4];
  }
}

- (void)prepareForPush
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  [(_UINavigationBarVisualProviderModernIOS *)self _upgradeAppearanceAPIForItemIfNecessary:v3];

  [(_UINavigationBarVisualProviderModernIOS *)self _prepareLayouts];
}

- (void)_updateWithCompletion:(id)a3
{
  stack = self->super._stack;
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v6 = [(_UINavigationBarItemStack *)stack backItem];
  [v6 _setTitleViewDataSource:0];

  int v7 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  [v7 _setTitleViewDataSource:self->_contentView];

  id v8 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v8];

  id v9 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  id v14 = [v9 activeLayout];

  id v10 = [(_UINavigationBarItemStack *)self->super._stack previousTopEntry];
  uint64_t v11 = [v10 activeLayout];
  uint64_t v12 = (void *)v11;
  if (v14) {
    -[_UINavigationBarLayout removeViewsNotInLayout:](v11, v14);
  }
  else {
    -[_UINavigationBarLayout removeAllViews](v11);
  }

  [(_UINavigationBarVisualProviderModernIOS *)self layoutSubviews];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateContentPriorities];
  uint64_t v13 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
  v5[2](v5, 0, v13);
}

- (void)barDidMoveToWindow
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(UIView *)self->super._navigationBar subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(_UINavigationBarVisualProviderModernIOS *)self _setupAccessibilityLimitsForView:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if (self->_customizer)
  {
    id v8 = [(UIView *)self->super._navigationBar window];

    if (!v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61___UINavigationBarVisualProviderModernIOS_barDidMoveToWindow__block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView performWithoutAnimation:v9];
    }
  }
}

- (void)_setupAccessibilityLimitsForView:(id)a3
{
  uint64_t v4 = (_UINavigationBarContentView *)a3;
  if (self->_contentView == v4 || (_UINavigationBarContentView *)self->_promptView == v4)
  {
    uint64_t v6 = v4;
    uint64_t v5 = [(UIView *)self->super._navigationBar window];

    uint64_t v4 = v6;
    if (v5)
    {
      _UIBarsSetAccessibilityLimits(v6);
      uint64_t v4 = v6;
    }
  }
}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v6 == v8)
    {
      uint64_t v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v8 backItem:v7 animated:v4];
    }
  }
}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v6 == v8)
    {
      uint64_t v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v8 backItem:v7 animated:v4];
    }
  }
}

- (void)navigationItemUpdatedCenterBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v7 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v7 == v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __94___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedCenterBarButtonItems_animated___block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView performWithoutAnimation:v9];
      id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v6 backItem:v8 animated:v4];
    }
  }
}

- (id)_defaultWeeTitleAttributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedFootnote"];
  uint64_t v3 = *(void *)off_1E52D2048;
  v7[0] = *(void *)off_1E52D2040;
  v7[1] = v3;
  v8[0] = v2;
  BOOL v4 = +[UIColor grayColor];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)teardown
{
  [(UIView *)self->super._navigationBar removeInteraction:self->_assistant];
  uint64_t v3 = [(UIView *)self->super._navigationBar layer];
  [v3 setFilters:0];

  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_contentView removeFromSuperview];
  contentView = self->_contentView;
  self->_contentView = 0;

  [(UIView *)self->_largeTitleView removeFromSuperview];
  largeTitleView = self->_largeTitleView;
  self->_largeTitleView = 0;

  [(UIView *)self->_promptView removeFromSuperview];
  promptView = self->_promptView;
  self->_promptView = 0;

  weeTitleLabel = self->_weeTitleLabel;
  if (weeTitleLabel)
  {
    [(UIView *)weeTitleLabel removeFromSuperview];
    id v9 = self->_weeTitleLabel;
    self->_weeTitleLabel = 0;
  }
  if (self->_contentFocusContainerGuide)
  {
    [(UIView *)self->super._navigationBar removeLayoutGuide:"removeLayoutGuide:"];
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = 0;
  }
  [(_UINavigationBarTransitionContext *)self->_transitionContext setNavigationBar:0];
  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;

  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  [(_UINavigationBarVisualProvider *)&v12 teardown];
}

- (id)_shim_compatibilityBackgroundView
{
  if (self->_usesBarBackground)
  {
    uint64_t v3 = [(_UIBarBackground *)self->_backgroundView customBackgroundView];
    backgroundView = v3;
    if (!v3) {
      backgroundView = self->_backgroundView;
    }
    uint64_t v5 = backgroundView;
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  id v8 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    id v7 = v6;
    if (v5 == v8)
    {
      -[_UINavigationBarVisualProviderModernIOS _updateContentForTopItem:backItem:animated:](self, "_updateContentForTopItem:backItem:animated:", v6);
    }
    else
    {

      if (v7 != v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v7 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
      if (objc_opt_respondsToSelector()) {
        [v7 _navigationBar:self->super._navigationBar itemBackButtonUpdated:v5];
      }
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (void)navigationItemUpdatedSearchController:(id)a3 oldSearchController:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _stackEntry];
  id v9 = [v6 _searchControllerIfAllowed];
  if (v9 == v7) {
    goto LABEL_22;
  }
  if (([v8 isSearchActive] & 1) != 0 || objc_msgSend(v7, "isActive"))
  {
    if (![v8 isSearchActive] || (objc_msgSend(v7, "isActive") & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v32 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "Inconsistent state handled when removing old search controller. Investigate if repro steps are available. Otherwise, ignore.", buf, 2u);
        }
      }
      else
      {
        double v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A390) + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Inconsistent state handled when removing old search controller. Investigate if repro steps are available. Otherwise, ignore.", buf, 2u);
        }
      }
    }
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    long long v11 = [v7 searchBar];
    int v12 = [v11 _isHostedInlineByNavigationBar];
    if (has_internal_diagnostics)
    {
      if (!v12)
      {
        double v30 = [v7 searchBar];
        uint64_t v31 = [v30 window];

        if (!v31) {
          goto LABEL_13;
        }
        long long v11 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          id v16 = [v8 item];
          *(_DWORD *)buf = 138412546;
          id v40 = v7;
          __int16 v41 = 2112;
          v42 = v16;
          _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Someone is removing an active search controller while its search bar is visible. Search controller being removed: %@ from navigation item: %@", buf, 0x16u);
LABEL_11:
        }
      }
    }
    else if (!v12)
    {
      long long v13 = [v7 searchBar];
      id v14 = [v13 window];

      if (!v14) {
        goto LABEL_13;
      }
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A398) + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      long long v11 = v15;
      id v16 = [v8 item];
      *(_DWORD *)buf = 138412546;
      id v40 = v7;
      __int16 v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Someone is removing an active search controller while its search bar is visible. Search controller being removed: %@ from navigation item: %@", buf, 0x16u);
      goto LABEL_11;
    }

LABEL_13:
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    id v35 = __101___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedSearchController_oldSearchController___block_invoke;
    id v36 = &unk_1E52D9F98;
    id v37 = v7;
    id v38 = v8;
    +[UIView performWithoutAnimation:&v33];
  }
  SEL v17 = objc_msgSend(v7, "searchBar", v33, v34, v35, v36);
  if (([v17 isDescendantOfView:self->super._navigationBar] & 1) != 0
    || ([v17 _existingSearchIconBarButtonItem],
        double v18 = objc_claimAutoreleasedReturnValue(),
        [v18 view],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 isDescendantOfView:self->super._navigationBar],
        v19,
        v18,
        v20))
  {
    [v17 _resetIfNecessaryForNavigationBarHosting:0];
    [v17 _setMinimumContentSizeCategory:0];
    [v17 _setMaximumContentSizeCategory:0];
    [v17 removeFromSuperview];
    id v21 = [v17 _existingSearchIconBarButtonItem];
    id v22 = [v21 view];
    [v22 removeFromSuperview];
  }
  double v23 = [v9 searchBar];
  [v23 _resetIfNecessaryForNavigationBarHosting:1];
  id v24 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  if (v24 == v6)
  {
    int v25 = [v6 _hasInlineSearchBar];

    if (v25) {
      [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
    }
  }
  else
  {
  }
LABEL_22:
  if (v9)
  {
    [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v8];
    objc_msgSend(v8, "setSearchActive:", objc_msgSend(v9, "isActive"));
  }
  else
  {
    uint64_t v26 = [v8 normalLayout];
    -[_UINavigationBarLayout setSearchBar:]((uint64_t)v26, 0);

    [v8 setSearchLayout:0];
  }
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  CGRect v27 = [(_UINavigationBarVisualProvider *)self navigationBar];
  double v28 = [v27 delegate];

  if (objc_opt_respondsToSelector()) {
    [v28 _navigationItemDidUpdateSearchController:v6 oldSearchController:v7];
  }
  [(UINavigationBar *)self->super._navigationBar _accessibility_navigationBarContentsDidChange];
}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  stack = self->super._stack;
  id v4 = a3;
  id v5 = [(_UINavigationBarItemStack *)stack topItem];

  return v5 == v4;
}

- (void)navigationItemUpdatedLargeTitleContent:(id)a3
{
  id v11 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v4 == v11)
    {
      id v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v11 backItem:v5 animated:0];

      if ([v11 _largeTitleTwoLineMode] == 2)
      {
        id v6 = [v11 _stackEntry];
        uint64_t v7 = [v6 activeLayout];
        id v8 = (void *)v7;
        id v9 = v7 ? *(void **)(v7 + 144) : 0;
        id v10 = v9;

        if (v10) {
          [(_UINavigationBarVisualProviderModernIOS *)self changeLayout];
        }
      }
    }
  }
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v6 == v9)
    {
      uint64_t v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v9 backItem:v7 animated:v4];

      id v8 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 _navigationBar:self->super._navigationBar itemBackButtonUpdated:v9];
      }
    }
  }
}

- (void)_refreshBackButtonMenu
{
  uint64_t v3 = [(_UINavigationBarContentView *)self->_contentView layout];
  id v10 = [v3 backButton];

  BOOL v4 = v10;
  if (v10)
  {
    id v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    id v6 = [v5 _effectiveBackBarButtonItem];

    uint64_t v7 = [(_UINavigationBarVisualProviderModernIOS *)self _backButtonMenu];
    [v6 setMenu:v7];

    id v8 = [v10 visualProvider];
    LODWORD(v5) = [v8 canUpdateMenuInPlace];

    if (v5)
    {
      id v9 = [v10 visualProvider];
      [v9 updateMenu];
    }
    BOOL v4 = v10;
  }
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  stack = self->super._stack;
  id v4 = a3;
  id v5 = [(_UINavigationBarItemStack *)stack backItem];

  return v5 == v4;
}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  id v8 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v5 == v8)
    {
      id v6 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
      if (objc_opt_respondsToSelector()) {
        [v6 _navigationBar:self->super._navigationBar topItemUpdatedContentLayout:v8];
      }
      uint64_t v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v8 backItem:v7 animated:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControlHost, 0);
  objc_storeStrong((id *)&self->_hiddenFilter, 0);
  objc_storeStrong((id *)&self->_windowDragClientInteraction, 0);
  objc_storeStrong((id *)&self->_titleRenamerSession, 0);
  objc_storeStrong((id *)&self->_titleRenamer, 0);
  objc_storeStrong((id *)&self->_customizationContainerView, 0);
  objc_storeStrong((id *)&self->_currentCustomizationSession, 0);
  objc_storeStrong((id *)&self->_customizer, 0);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_tabBarHostedView, 0);
  objc_storeStrong((id *)&self->_weeTitleLabel, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setNeedsStaticNavBarButtonUpdate
{
  if ([(UIBarButtonItem *)self->_staticNavBarButtonItem _actsAsFakeBackButton])
  {
    uint64_t v3 = [(_UINavigationBarVisualProviderModernIOS *)self _staticNavBarButtonFakeBackMenu];
    [(UIBarButtonItem *)self->_staticNavBarButtonItem setMenu:v3];
  }
  else
  {
    [(UIBarButtonItem *)self->_staticNavBarButtonItem setMenu:0];
  }
  [(_UINavigationBarContentView *)self->_contentView setNeedsStaticNavBarButtonUpdate];
  navigationBar = self->super._navigationBar;
  [(UINavigationBar *)navigationBar _accessibility_navigationBarContentsDidChange];
}

- (void)setTitleAlpha:(double)a3
{
  if (self->_titleAlpha != a3) {
    self->_double titleAlpha = a3;
  }
  if (![(_UINavigationBarVisualProviderModernIOS *)self wantsLargeTitleDisplayed])
  {
    double titleAlpha = self->_titleAlpha;
    contentView = self->_contentView;
    [(_UINavigationBarContentView *)contentView setInlineTitleViewAlpha:titleAlpha];
  }
}

- (void)navigationItem:(id)a3 updatedPalettePart:(int64_t)a4 oldPalette:(id)a5
{
  id v21 = a3;
  id v9 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UINavigationBarVisualProviderModernIOS.m", 4309, @"Unexpected palette part (%li)", a4);
  }
  if (a4 == 6) {
    [v21 _topPalette];
  }
  else {
  id v10 = [v21 _bottomPalette];
  }
  if (v10 != v9)
  {
    id v11 = [v9 superview];
    navigationBar = self->super._navigationBar;

    if (v11 == navigationBar) {
      [v9 removeFromSuperview];
    }
    if (![(_UINavigationBarItemStack *)self->super._stack state]) {
      goto LABEL_12;
    }
    id v13 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    id v14 = v21;
    if (v13 == v21)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v15 = [(_UINavigationBarItemStack *)self->super._stack backItem];

    if (v15 != v21)
    {
LABEL_12:
      id v14 = [v21 _stackEntry];
      uint64_t v16 = [v14 normalLayout];
      SEL v17 = (void *)v16;
      if (a4 == 6)
      {
        -[_UINavigationBarLayout setTopPalette:](v16, v10);

        double v18 = [v14 searchLayout];
        -[_UINavigationBarLayout setTopPalette:]((uint64_t)v18, v10);
      }
      else
      {
        -[_UINavigationBarLayout setBottomPalette:](v16, v10);

        double v18 = [v14 searchLayout];
        -[_UINavigationBarLayout setBottomPalette:]((uint64_t)v18, v10);
      }

      goto LABEL_16;
    }
  }
LABEL_17:
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v19 = [(_UINavigationBarItemStack *)self->super._stack topItem];

    if (v19 == v21) {
      [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
    }
  }
}

- (double)titleAlpha
{
  return self->_titleAlpha;
}

- (void)setStaticNavBarButtonItem:(id)a3
{
  id v7 = a3;
  id v4 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 _splitViewControllerEnforcingClass:0];
    BOOL v6 = [v5 primaryEdge] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(_UINavigationBarVisualProviderModernIOS *)self setStaticNavBarButtonItem:v7 trailingPosition:v6];
}

- (void)setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4
{
  BOOL v4 = a4;
  p_staticNavBarButtonItem = &self->_staticNavBarButtonItem;
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, a3);
  id v8 = a3;
  [(_UINavigationBarContentView *)self->_contentView setStaticNavBarButtonTrailing:v4];
  [(_UINavigationBarContentView *)self->_contentView setStaticNavBarButtonItem:*p_staticNavBarButtonItem];
  [(UINavigationBar *)self->super._navigationBar _accessibility_navigationBarContentsDidChange];
}

- (double)heightForRestoringFromCancelledTransition
{
  BOOL v2 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  uint64_t v3 = [v2 activeLayout];
  -[_UINavigationBarLayout layoutHeights]((uint64_t)v3);
  double v5 = v4;

  return v5;
}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  contentView = self->_contentView;
  id v9 = a4;
  [(_UINavigationBarContentView *)contentView updateAccessibilityContents:v7];
  id v10 = [v9 _stackEntry];

  uint64_t v11 = [v10 activeLayout];
  int v12 = (void *)v11;
  if (v11) {
    id v13 = *(void **)(v11 + 144);
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [v14 accessibilityTitleView];
  [v7 setLargeTitleView:v15];

  [v7 setPromptView:0];
  if (self->_backgroundView)
  {
    v17[0] = self->_backgroundView;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 setViewsRepresentingContentBackground:v16];
  }
}

- (void)updateArchivedSubviews:(id)a3
{
}

- (BOOL)useInlineBackgroundHeightWhenLarge
{
  return self->_useInlineBackgroundHeightWhenLarge;
}

- (void)setUseInlineBackgroundHeightWhenLarge:(BOOL)a3
{
  if (self->_useInlineBackgroundHeightWhenLarge != a3)
  {
    self->_useInlineBackgroundHeightWhenLarge = a3;
    [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  }
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_double backgroundAlpha = a3;
    [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  }
}

- (void)setForceScrollEdgeAppearance:(BOOL)a3
{
  unsigned int v4 = a3 & ~[(UIView *)self->super._navigationBar _canDrawContent];
  if (self->_forceScrollEdgeAppearance != v4)
  {
    self->_forceScrollEdgeAppearance = v4;
    stack = self->super._stack;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72___UINavigationBarVisualProviderModernIOS_setForceScrollEdgeAppearance___block_invoke;
    v6[3] = &unk_1E52DDF58;
    v6[4] = self;
    [(_UINavigationBarItemStack *)stack iterateEntries:v6];
    [(_UINavigationBarVisualProviderModernIOS *)self _updateBackground];
  }
}

- (BOOL)allowsUserInteractionDuringTransitions
{
  return [(UINavigationBar *)self->super._navigationBar _canPreemptTransition];
}

- (void)_popToItem:(id)a3
{
  id v4 = a3;
  double v5 = [(UINavigationBar *)self->super._navigationBar delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 _navigationBar:self->super._navigationBar requestPopToItem:v4];
  }
  else
  {
    BOOL v6 = [MEMORY[0x1E4F1CA48] array];
    stack = self->super._stack;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __54___UINavigationBarVisualProviderModernIOS__popToItem___block_invoke;
    int v12 = &unk_1E52DDF80;
    id v13 = v6;
    id v14 = v4;
    id v8 = v6;
    [(_UINavigationBarItemStack *)stack iterateItems:&v9];
    -[UINavigationBar setItems:animated:](self->super._navigationBar, "setItems:animated:", v8, 1, v9, v10, v11, v12);
  }
}

- (id)_staticNavBarButtonFakeBackMenu
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (_UINavigationBarBackButtonShowsContextMenu())
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74___UINavigationBarVisualProviderModernIOS__staticNavBarButtonFakeBackMenu__block_invoke;
    void v8[3] = &unk_1E52DE860;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    uint64_t v3 = +[UIDeferredMenuElement elementWithProvider:v8];
    id v4 = objc_opt_new();
    [v4 setMaximumNumberOfTitleLines:1];
    v11[0] = v3;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    BOOL v6 = +[UIMenu menuWithChildren:v5];

    [v6 setDisplayPreferences:v4];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (BOOL)isInCustomization
{
  return [(_UIBarCustomizer *)self->_customizer isActive];
}

- (void)_beginCustomization
{
  if (!self->_customizer)
  {
    id v4 = [[_UIBarCustomizer alloc] initWithDelegate:self];
    customizer = self->_customizer;
    self->_customizer = v4;
  }
  BOOL v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(_UINavigationBarContentView *)self->_contentView layout];
  id v9 = [v8 centerBar];
  id v21 = [v9 groupRealizedOrder];
  uint64_t v10 = [v9 groupOrderer];
  if (!v10)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:938 description:@"Began customizing but the customizer is nil!"];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke;
  v30[3] = &unk_1E52DE888;
  v30[4] = self;
  id v11 = v6;
  id v31 = v11;
  id v12 = v7;
  id v32 = v12;
  -[_UIButtonBarGroupOrderer enumerateSourceGroups:](v10, v30);
  id v13 = +[_UIBarCustomizationSession sessionWithVisibleItems:v11 additionalItems:v12];
  currentCustomizationSession = self->_currentCustomizationSession;
  self->_currentCustomizationSession = v13;

  id v15 = [(_UIBarCustomizationSession *)self->_currentCustomizationSession beginAnimationCoordinator];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_2;
  v27[3] = &unk_1E52D9F98;
  id v16 = v9;
  id v28 = v16;
  double v29 = self;
  [v15 addAnimations:v27];

  SEL v17 = [(_UIBarCustomizationSession *)self->_currentCustomizationSession endAnimationCoordinator];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_3;
  v26[3] = &unk_1E52D9F70;
  v26[4] = self;
  [v17 addAnimations:v26];

  objc_initWeak(&location, self);
  double v18 = [(_UIBarCustomizationSession *)self->_currentCustomizationSession endAnimationCoordinator];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_4;
  v22[3] = &unk_1E52DE8B0;
  objc_copyWeak(&v24, &location);
  id v19 = v16;
  id v23 = v19;
  [v18 addCompletion:v22];

  [(_UIBarCustomizer *)self->_customizer beginWithSession:self->_currentCustomizationSession];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (id)_barCustomizationItemWithBarButtonGroup:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  double v5 = -[UIBarButtonItemGroup _customizationIdentifier](v4);
  BOOL v6 = -[UIBarButtonItemGroup _items](v4);
  unint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    uint64_t v26 = -[UIBarButtonItemGroup _items](v4);
    CGRect v27 = [v26 firstObject];
    id v23 = [(_UINavigationBarVisualProviderModernIOS *)self _barCustomizationItemWithBarButtonItem:v27 identifier:v5];
  }
  else
  {
    id v8 = self;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    double v30 = v4;
    -[UIBarButtonItemGroup _items](v4);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [NSString stringWithFormat:@"%@.%i", v5, v12 + i];
          SEL v17 = [(_UINavigationBarVisualProviderModernIOS *)v8 _barCustomizationItemWithBarButtonItem:v15 identifier:v16];
          [v9 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v12 = (v12 + i);
      }
      while (v11);
    }

    id v4 = v30;
    double v18 = [v30 representativeItem];
    id v19 = [v18 image];
    int v20 = [v30 representativeItem];
    id v21 = [v20 title];
    id v22 = v9;
    id v23 = +[_UIBarCustomizationItem groupWithWithIdentifier:v5 icon:v19 name:v21 items:v9];

    objc_msgSend(v23, "setCollapsed:", objc_msgSend(v30, "isDisplayingRepresentativeItem"));
    id v24 = [v30 representativeItem];
    int v25 = [(_UINavigationBarVisualProviderModernIOS *)v8 _sourceViewProviderForBarButtonItem:v24];
    [v23 setSourceViewProvider:v25];
  }
  if (v4) {
    uint64_t v28 = (*((unsigned __int8 *)v4 + 24) >> 5) & 1;
  }
  else {
    uint64_t v28 = 0;
  }
  [v23 setRemovable:v28];

  return v23;
}

- (id)_barCustomizationItemWithBarButtonItem:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 _resolvedImage];
  id v9 = [v7 resolvedTitle];
  uint64_t v10 = [v7 customView];
  uint64_t v11 = +[_UIBarCustomizationItem itemWithIdentifier:v6 icon:v8 name:v9 view:v10];

  uint64_t v12 = [v7 tintColor];
  [v11 setTintColor:v12];

  objc_msgSend(v11, "setEnabled:", objc_msgSend(v7, "isEnabled"));
  uint64_t v13 = [(_UINavigationBarVisualProviderModernIOS *)self _sourceViewProviderForBarButtonItem:v7];

  [v11 setSourceViewProvider:v13];
  return v11;
}

- (id)_sourceViewProviderForBarButtonItem:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UINavigationBarVisualProviderModernIOS__sourceViewProviderForBarButtonItem___block_invoke;
  aBlock[3] = &unk_1E52DE8D8;
  id v8 = v3;
  id v4 = v3;
  double v5 = _Block_copy(aBlock);

  return v5;
}

- (id)barCustomizer:(id)a3 containerViewForSession:(id)a4
{
  customizationContainerView = self->_customizationContainerView;
  if (!customizationContainerView)
  {
    id v6 = [UIView alloc];
    id v7 = [(UIView *)self->super._navigationBar window];
    [v7 bounds];
    id v8 = -[UIView initWithFrame:](v6, "initWithFrame:");

    [(UIView *)v8 setAutoresizingMask:18];
    id v9 = [(UIView *)self->_contentView tintColor];
    [(UIView *)v8 setTintColor:v9];

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_BarCustomizationDebugEnabled, @"BarCustomizationDebugEnabled") & 1) == 0&& byte_1E8FD4F84)
    {
      id v10 = +[UIColor redColor];
      uint64_t v11 = [v10 CGColor];
      uint64_t v12 = [(UIView *)v8 layer];
      [v12 setBorderColor:v11];

      uint64_t v13 = [(UIView *)v8 layer];
      [v13 setBorderWidth:1.0];
    }
    id v14 = self->_customizationContainerView;
    self->_customizationContainerView = v8;

    uint64_t v15 = [(UIView *)self->super._navigationBar window];
    [v15 addSubview:self->_customizationContainerView];

    [(_UINavigationBarVisualProviderModernIOS *)self _setupAccessibilityLimitsForView:self->_customizationContainerView];
    customizationContainerView = self->_customizationContainerView;
  }
  return customizationContainerView;
}

- (id)barCustomizer:(id)a3 parentTraitEnvironmentForSession:(id)a4
{
  return self->_contentView;
}

- (CGRect)barCustomizer:(id)a3 customizationAreaBoundsForSession:(id)a4
{
  contentView = self->_contentView;
  [(UIView *)contentView bounds];
  -[UIView convertRect:toView:](contentView, "convertRect:toView:", self->super._navigationBar);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(UIView *)self->super._navigationBar bounds];
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.double width = v11;
  v24.size.double height = v13;
  double v15 = CGRectGetHeight(v24) + 48.0;
  navigationBar = self->super._navigationBar;
  customizationContainerView = self->_customizationContainerView;
  -[UIView convertRect:toView:](navigationBar, "convertRect:toView:", customizationContainerView, 0.0, -24.0, Width, v15);
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)barCustomizer:(id)a3 overflowControlBoundsForSession:(id)a4
{
  double v5 = [(_UINavigationBarContentView *)self->_contentView layout];
  double v6 = [v5 overflowButton];
  CGFloat v7 = _contentViewFromBarButton(v6);

  [v7 bounds];
  objc_msgSend(v7, "convertRect:toView:", self->_customizationContainerView);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)barCustomizer:(id)a3 willEndSession:(id)a4 didReset:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = [(_UINavigationBarContentView *)self->_contentView layout];
  double v9 = [v8 centerBar];

  v68 = v7;
  v62 = v9;
  if (v5)
  {
    double v10 = [v9 groupOrderer];
    -[_UIButtonBarGroupOrderer reset]((uint64_t)v10);

    double v11 = [v9 view];
    [v11 layoutIfNeeded];

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id obj = [v9 barButtonGroups];
    uint64_t v65 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v65)
    {
      uint64_t v64 = *(void *)v92;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v92 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v91 + 1) + 8 * v12);
          uint64_t v66 = v12;
          if (v13 && (*(unsigned char *)(v13 + 24) & 0x20) != 0)
          {
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v67 = [v7 visibleItems];
            uint64_t v15 = [v67 countByEnumeratingWithState:&v87 objects:v100 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v88;
              while (2)
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v88 != v17) {
                    objc_enumerationMutation(v67);
                  }
                  double v19 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  double v20 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)v13);
                  double v21 = [v19 identifier];
                  int v22 = [v20 isEqual:v21];

                  if (v22)
                  {
                    objc_msgSend(v19, "setCollapsed:", objc_msgSend((id)v13, "isDisplayingRepresentativeItem"));
                    int v14 = 1;
                    goto LABEL_20;
                  }
                }
                uint64_t v16 = [v67 countByEnumeratingWithState:&v87 objects:v100 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
              int v14 = 0;
LABEL_20:
              id v7 = v68;
            }
            else
            {
              int v14 = 0;
            }
          }
          else
          {
            int v14 = 1;
          }
          if ([(id)v13 isDisplayingRepresentativeItem])
          {
            CGRect v23 = [(id)v13 representativeItem];
            v99 = v23;
            CGRect v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
          }
          else
          {
            CGRect v24 = -[UIBarButtonItemGroup _items]((id *)v13);
          }
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v25 = v24;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v98 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v84;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v84 != v28) {
                  objc_enumerationMutation(v25);
                }
                double v30 = *(void **)(*((void *)&v83 + 1) + 8 * j);
                id v31 = [v30 view];
                [v31 setAlpha:0.0];

                long long v32 = [v7 endAnimationCoordinator];
                long long v33 = v32;
                if (v14)
                {
                  v82[0] = MEMORY[0x1E4F143A8];
                  v82[1] = 3221225472;
                  v82[2] = __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke;
                  v82[3] = &unk_1E52DE900;
                  v82[4] = v30;
                  [v32 addCompletion:v82];
                }
                else
                {
                  v81[0] = MEMORY[0x1E4F143A8];
                  v81[1] = 3221225472;
                  v81[2] = __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke_2;
                  v81[3] = &unk_1E52D9F70;
                  v81[4] = v30;
                  [v32 addAnimations:v81];
                }

                id v7 = v68;
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v83 objects:v98 count:16];
            }
            while (v27);
          }

          uint64_t v12 = v66 + 1;
        }
        while (v66 + 1 != v65);
        uint64_t v65 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v65);
    }

    long long v34 = v62;
    long long v35 = [v62 view];
    [v35 setHidden:0];
  }
  else
  {
    long long v35 = objc_opt_new();
    id v36 = objc_opt_new();
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v37 = [v7 visibleItems];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v77 objects:v97 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v78 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          uint64_t v43 = [v42 identifier];

          if (v43)
          {
            int v44 = [v42 identifier];
            [v35 addObject:v44];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v77 objects:v97 count:16];
      }
      while (v39);
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v45 = [v68 additionalItems];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v73 objects:v96 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v47; ++m)
        {
          if (*(void *)v74 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [*(id *)(*((void *)&v73 + 1) + 8 * m) identifier];
          [v36 addObject:v50];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v73 objects:v96 count:16];
      }
      while (v47);
    }

    char v51 = [v62 groupOrderer];
    -[_UIButtonBarGroupOrderer setIncludedIdentifiers:excludedIdentifiers:]((uint64_t)v51, v35, v36);

    v52 = [v62 view];
    [v52 layoutIfNeeded];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v53 = [v68 visibleItems];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v69 objects:v95 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v70;
      do
      {
        for (uint64_t n = 0; n != v55; ++n)
        {
          if (*(void *)v70 != v56) {
            objc_enumerationMutation(v53);
          }
          id v58 = *(void **)(*((void *)&v69 + 1) + 8 * n);
          v59 = [v58 identifier];
          id v60 = [(_UINavigationBarVisualProviderModernIOS *)self _centerBarButtonGroupWithIdentifier:v59];

          objc_msgSend(v58, "setCollapsed:", objc_msgSend(v60, "isDisplayingRepresentativeItem"));
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v69 objects:v95 count:16];
      }
      while (v55);
    }

    long long v34 = v62;
    v61 = [v62 groupOrderer];
    -[_UIButtonBarGroupOrderer save]((uint64_t)v61);

    id v7 = v68;
  }
}

- (id)_centerBarButtonGroupWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = [(_UINavigationBarContentView *)self->_contentView layout];
    double v6 = [v5 centerBar];
    id v7 = [v6 barButtonGroups];

    double v8 = (id *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (id *)((char *)i + 1))
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(id **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = -[UIBarButtonItemGroup _customizationIdentifier](v11);
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            double v8 = v11;
            goto LABEL_12;
          }
        }
        double v8 = (id *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_beginRenaming
{
  id v4 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  BOOL v5 = [v4 item];

  p_titleRenamerSessiouint64_t n = &self->_titleRenamerSession;
  id v7 = [(_UINavigationBarTitleRenamerSession *)self->_titleRenamerSession context];

  if (v7 != v5)
  {
    if (*p_titleRenamerSession)
    {
      id v36 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v37 = [(_UINavigationBarTitleRenamerSession *)*p_titleRenamerSession context];
      [v36 handleFailureInMethod:a2, self, @"_UINavigationBarVisualProviderModernIOS.m", 1204, @"Attempting to begin renaming a navigation item (%@) while already renaming a different navigation item (%@) on navigation bar (%@).", v5, v37, self->super._navigationBar object file lineNumber description];
    }
    double v8 = objc_msgSend(v5, "_dci_renameHandler");
    if (!v8) {
      goto LABEL_27;
    }
    uint64_t v9 = self->_titleRenamer;
    if (!v9)
    {
      uint64_t v9 = (_UINavigationBarTitleRenamer *)objc_opt_new();
      [(_UINavigationBarTitleRenamer *)v9 setDelegate:self];
      objc_storeStrong((id *)&self->_titleRenamer, v9);
    }
    double v10 = [(_UINavigationBarContentView *)self->_contentView documentProperties];
    if ([v10 wantsIconRepresentation])
    {
      uint64_t v11 = [v10 metadata];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v8 _fileURLForRenaming];
    v42 = (void *)v12;
    uint64_t v43 = (void *)v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v40 = v10;
      int v14 = [_UINavigationBarTitleRenamerRemoteSession alloc];
      id v44 = 0;
      long long v15 = [(UIView *)self->_contentView _window];
      uint64_t v16 = [v15 windowScene];
      uint64_t v17 = v13;
      long long v18 = (void *)v16;
      double v19 = [(_UINavigationBarTitleRenamerRemoteSession *)v14 initWithFileURL:v17 iconMetadata:v11 error:&v44 scene:v16];
      id v20 = v44;

      if (!v19)
      {
        uint64_t v26 = _UINSLocalizedStringWithDefaultValue(@"Rename failed", @"Rename failed");
        uint64_t v27 = [v20 localizedDescription];
        uint64_t v28 = +[UIAlertController alertControllerWithTitle:v26 message:v27 preferredStyle:1];

        double v29 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
        double v30 = +[UIAlertAction actionWithTitle:v29 style:0 handler:0];
        [v28 addAction:v30];

        id v31 = [(UIView *)self->super._navigationBar _viewControllerForAncestor];
        [v31 presentViewController:v28 animated:1 completion:0];

        double v19 = 0;
        double v10 = v40;
        long long v32 = v42;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      double v10 = v40;
    }
    else
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceOOPRename, @"ForceOOPRename") & 1) != 0
        || !byte_1E8FD4F8C)
      {
        long long v33 = [_UINavigationBarTitleRenamerSession alloc];
        uint64_t v34 = [v5 title];
        int v22 = (void *)v34;
        if (v34) {
          long long v35 = (__CFString *)v34;
        }
        else {
          long long v35 = &stru_1ED0E84C0;
        }
        double v19 = [(_UINavigationBarTitleRenamerSession *)v33 initWithSuggestedTitle:v35 iconMetadata:v11];
      }
      else
      {
        uint64_t v39 = [_UINavigationBarTitleRenamerRemoteSession alloc];
        uint64_t v21 = [v5 title];
        int v22 = (void *)v21;
        CGRect v23 = &stru_1ED0E84C0;
        if (v21) {
          CGRect v23 = (__CFString *)v21;
        }
        uint64_t v38 = v23;
        CGRect v24 = [(UIView *)self->_contentView _window];
        [v24 windowScene];
        id v25 = v41 = v10;
        double v19 = [(_UINavigationBarTitleRenamerRemoteSession *)v39 initWithSuggestedTitle:v38 iconMetadata:v11 scene:v25];

        double v10 = v41;
      }

      id v20 = 0;
    }
    long long v32 = v42;
    [(_UINavigationBarTitleRenamerSession *)v19 setContext:v5];
    [(_UINavigationBarTitleRenamer *)v9 startSession:v19];
    objc_storeStrong((id *)&self->_titleRenamerSession, v19);
    uint64_t v28 = [(_UINavigationBarContentView *)self->_contentView layout];
    [v28 setActiveRenamerSession:v19];
    goto LABEL_26;
  }
  NSLog(&cfstr_RequestToBegin.isa, v5);
LABEL_28:
}

- (void)_endRenaming
{
  if (!self->_titleRenamerSession)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:1285 description:@"Unable to end a renaming session. No session in progress."];
  }
  -[_UINavigationBarTitleRenamer endSession:](self->_titleRenamer, "endSession:");
  titleRenamerSessiouint64_t n = self->_titleRenamerSession;
  self->_titleRenamerSessiouint64_t n = 0;

  id v6 = [(_UINavigationBarContentView *)self->_contentView layout];
  [v6 setActiveRenamerSession:0];
}

- (id)titleRenamer:(id)a3 session:(id)a4 willBeginRenamingWithTitle:(id)a5 selectedRange:(_NSRange *)a6
{
  id v9 = a5;
  id v10 = a4;
  __ASSERT_RENAMER_SESSION__(self, v10);
  uint64_t v11 = __renameHandler(v10);

  if (v11)
  {
    uint64_t v12 = [v11 _willBeginRenamingWithTitle:v9 selectedRange:a6];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)titleRenamer:(id)a3 session:(id)a4 shouldEndRenamingWithTitle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  id v9 = __renameHandler(v8);

  if (v9) {
    char v10 = [v9 _shouldEndRenamingWithTitle:v7];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)titleRenamer:(id)a3 session:(id)a4 didEndRenamingWithTitle:(id)a5
{
  id v11 = a4;
  __ASSERT_RENAMER_SESSION__(self, v11);
  id v6 = __renameHandler(v11);
  if (v6)
  {
    id v7 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    id v8 = [v7 item];

    id v9 = [v11 title];
    [v8 setTitle:v9];

    char v10 = [v11 title];
    [v6 _didEndRenamingWithTitle:v10];

    [(_UINavigationBarVisualProviderModernIOS *)self _endRenaming];
  }
  else
  {
    [(_UINavigationBarVisualProviderModernIOS *)self _endRenaming];
  }
}

- (void)titleRenamer:(id)a3 didCancelSession:(id)a4
{
  id v5 = a4;
  __renameHandler(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 title];

  [v9 _didEndRenamingWithTitle:v6];
  titleRenamerSessiouint64_t n = self->_titleRenamerSession;
  self->_titleRenamerSessiouint64_t n = 0;

  id v8 = [(_UINavigationBarContentView *)self->_contentView layout];
  [v8 setActiveRenamerSession:0];
}

- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidEnd:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  id v9 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  id v13 = [v9 item];

  char v10 = [v7 lastPathComponent];
  id v11 = [v10 stringByDeletingPathExtension];
  [v13 setTitle:v11];

  uint64_t v12 = __renameHandler(v8);

  [v12 _fileRenameDidEndWithFinalURL:v7];
  [(_UINavigationBarVisualProviderModernIOS *)self _endRenaming];
}

- (void)titleRenamer:(id)a3 session:(id)a4 fileRenameDidFail:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __ASSERT_RENAMER_SESSION__(self, v8);
  __renameHandler(v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 _fileRenameDidFailWithError:v7];
  [(_UINavigationBarVisualProviderModernIOS *)self _endRenaming];
}

- (void)updateSearchBarForPlacementChangeIfApplicable
{
  if (_UIBarsDesktopNavigationBarEnabled())
  {
    id v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    id v6 = [v3 item];

    id v4 = [v6 _searchControllerIfAllowed];
    id v5 = [v4 searchBar];

    objc_msgSend(v5, "_setHostedInlineByNavigationBar:", objc_msgSend(v6, "_hasInlineSearchBar"));
  }
}

- (void)deferSearchSuggestionsMenuRefreshForGeometryChange
{
  if (_UIBarsDesktopNavigationBarEnabled())
  {
    id v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    uint64_t v3 = [v5 activeLayout];
    id v4 = (void *)v3;
    if (v3) {
      [*(id *)(v3 + 160) deferSearchSuggestionsMenuRefreshForGeometryChange];
    }
  }
}

- (void)searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    id v6 = [v5 item];

    id v4 = v8;
    if (v6 == v8)
    {
      id v7 = [(UINavigationBar *)self->super._navigationBar delegate];
      if (objc_opt_respondsToSelector()) {
        [v7 _navigationBarWillChangeHeightForManualShowOrHideOfSearchScopeBar:self->super._navigationBar];
      }

      id v4 = v8;
    }
  }
}

- (void)refreshSearchSuggestionsMenuAfterGeometryChange
{
  if (_UIBarsDesktopNavigationBarEnabled())
  {
    id v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    uint64_t v3 = [v5 activeLayout];
    id v4 = (void *)v3;
    if (v3) {
      [*(id *)(v3 + 160) refreshSearchSuggestionsMenuAfterGeometryChange];
    }
  }
}

- (id)emptyLayout
{
  uint64_t v3 = objc_getAssociatedObject(self, &emptyLayout___emptyLayoutKey);
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
  }
  else
  {
    id v6 = objc_alloc_init(_UINavigationBarLayout);
    uint64_t v4 = (uint64_t)v6;
    if (v6)
    {
      v6->_apiVersiouint64_t n = self->_appearanceAPIVersion;
      v6->_representedSearchLayoutState = 2;
      [(_UINavigationBarVisualProviderModernIOS *)self _contentBackgroundExtension];
      *(void *)(v4 + 200) = v7;
    }
    else
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _contentBackgroundExtension];
    }
    -[_UINavigationBarLayout setBackgroundView:](v4, self->_backgroundView);
    id v8 = [(_UINavigationBarVisualProvider *)self contentViewVisualProvider];
    -[_UINavigationBarLayout setContentViewVisualProvider:](v4, v8);

    -[_UINavigationBarLayout setContentView:](v4, self->_contentView);
    objc_setAssociatedObject(self, &emptyLayout___emptyLayoutKey, (id)v4, (void *)1);
    BOOL v5 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress];
    if (!v4) {
      goto LABEL_7;
    }
  }
  *(unsigned char *)(v4 + 113) = v5;
LABEL_7:
  return (id)v4;
}

- (double)horizontalMarginAdjustment
{
  return 0.0;
}

- (void)_setupTransitionContextForTransition:(int64_t)a3 completion:(id)a4
{
  navigationBar = self->super._navigationBar;
  id v8 = a4;
  id v9 = [(UIView *)navigationBar traitCollection];
  +[_UINavigationBarTransitionContext contextForTransition:withIdiom:completion:](_UINavigationBarTransitionContext, "contextForTransition:withIdiom:completion:", a3, [v9 userInterfaceIdiom], v8);
  char v10 = (_UINavigationBarTransitionContext *)objc_claimAutoreleasedReturnValue();

  transitionContext = self->_transitionContext;
  self->_transitionContext = v10;

  [(_UINavigationBarTransitionContext *)self->_transitionContext setNavigationBar:self->super._navigationBar];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setApiVersion:self->_appearanceAPIVersion];
  int64_t v12 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
  BOOL v14 = v12 == 1 || v12 == 102;
  [(_UINavigationBarTransitionContext *)self->_transitionContext setCompact:v14];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setBackgroundAlpha:self->_backgroundAlpha];
  [(_UINavigationBarVisualProviderModernIOS *)self applyBarBackground:self->_backgroundView alpha:self->_backgroundAlpha];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setStack:self->super._stack];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setAllowLargeTitles:[(_UINavigationBarVisualProviderModernIOS *)self allowLargeTitleView]];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setRTL:[(UIView *)self->super._navigationBar effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setPromptView:self->_promptView];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setContentView:self->_contentView];
  long long v15 = [(_UITabContainerView *)self->_tabBarHostedView floatingTabBar];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setTabBarHostedView:v15];

  [(_UINavigationBarTransitionContext *)self->_transitionContext setBackgroundView:self->_backgroundView isBarBackground:self->_usesBarBackground];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setLargeTitleView:self->_largeTitleView];
  if ((unint64_t)(a3 - 1) < 4)
  {
    uint64_t v16 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    id v46 = (id)v16;
    if (v16)
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v16];
      [v46 activeLayout];
    }
    else
    {
      [(_UINavigationBarVisualProviderModernIOS *)self emptyLayout];
    uint64_t v28 = };
    [(_UINavigationBarTransitionContext *)self->_transitionContext setToLayout:v28];

    [(UINavigationBar *)self->super._navigationBar _incomingNavigationBarFrame];
    double v30 = v29;
    double v32 = v31;
    long long v33 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    [(_UINavigationBarLayout *)(uint64_t)v33 setLayoutSize:v32];

    uint64_t v34 = [(_UINavigationBarItemStack *)self->super._stack previousTopEntry];
    if (v34)
    {
      [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v34];
      uint64_t v35 = [v34 activeLayout];
    }
    else
    {
      if (!v46)
      {
        uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
        [v45 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:2550 description:@"Unexpected transition in the navigation bar with no stack entries"];
      }
      uint64_t v35 = [(_UINavigationBarVisualProviderModernIOS *)self emptyLayout];
    }
    id v36 = (void *)v35;
    [(_UINavigationBarTransitionContext *)self->_transitionContext setFromLayout:v35];

    LODWORD(v36) = [v46 isSearchActive];
    if (v36 != [v34 isSearchActive]) {
      [(_UINavigationBarTransitionContext *)self->_transitionContext setTwoPart:1];
    }
    uint64_t v37 = [(UINavigationBar *)self->super._navigationBar delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v38 = [v37 _navigationBarTransitionOverlay];
      [(_UINavigationBarTransitionContext *)self->_transitionContext setTransitionOverlayView:v38];
    }
    goto LABEL_38;
  }
  if (a3 != 5)
  {
    if (a3 != 6)
    {
      id v46 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UINavigationBarVisualProviderModernIOS.m", 2641, @"Unknown transitiouint64_t n = %ld", a3);
LABEL_38:

      return;
    }
    id v46 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
    [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v46];
    uint64_t v17 = [v46 searchLayout];
    [(_UINavigationBarTransitionContext *)self->_transitionContext setFromLayout:v17];

    long long v18 = [v46 normalLayout];
    uint64_t v19 = [v18 copy];

    if (v19) {
      id v20 = *(void **)(v19 + 160);
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      int v22 = v19 ? *(void **)(v19 + 160) : 0;
      id v23 = v22;
      uint64_t v24 = [v23 expectedInactiveInlineSearchBarLayoutState];

      if (v19)
      {
        if (v24 != -1) {
          *(void *)(v19 + 248) = v24;
        }
      }
    }
    [(_UINavigationBarTransitionContext *)self->_transitionContext setToLayout:v19];
    [v46 setSearchActive:0];
    if (v19)
    {
      if (*(unsigned char *)(v19 + 116) && !*(unsigned char *)(v19 + 114))
      {
        if (![(_UINavigationBarTransitionContext *)self->_transitionContext allowLargeTitles]
          || ![(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)self->super._stack effectiveDisplayModeForItemInCurrentStack:0]])
        {
          goto LABEL_57;
        }
        goto LABEL_54;
      }
      if ([(_UINavigationBarTransitionContext *)self->_transitionContext allowLargeTitles])
      {
        double v25 = *(double *)(v19 + 320);
        goto LABEL_25;
      }
    }
    else
    {
      double v25 = 0.0;
      if ([(_UINavigationBarTransitionContext *)self->_transitionContext allowLargeTitles])
      {
LABEL_25:
        double v26 = -[_UINavigationBarLayout layoutHeights](v19);
        if (vabdd_f64(v27, v25) >= vabdd_f64(v25, v26)) {
          goto LABEL_57;
        }
LABEL_54:
        BOOL v44 = [(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)self->super._stack effectiveDisplayModeForItemInCurrentStack:0]];
LABEL_58:
        [(_UINavigationBarTransitionContext *)self->_transitionContext setEndWithLargeTitle:v44];
        [(_UINavigationBarTransitionContext *)self->_transitionContext setBeginWithLargeTitle:0];

        goto LABEL_38;
      }
    }
LABEL_57:
    BOOL v44 = 0;
    goto LABEL_58;
  }
  uint64_t v39 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v39];
  uint64_t v40 = [v39 normalLayout];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setFromLayout:v40];
  __int16 v41 = [v39 searchLayout];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setToLayout:v41];

  [v39 setSearchActive:1];
  if (!v40) {
    goto LABEL_48;
  }
  if (*(unsigned char *)(v40 + 116) && !*(unsigned char *)(v40 + 114))
  {
    if ([(_UINavigationBarTransitionContext *)self->_transitionContext allowLargeTitles]) {
      goto LABEL_45;
    }
LABEL_48:
    BOOL v42 = 0;
    goto LABEL_49;
  }
  if (*(double *)(v40 + 280) <= 0.0) {
    goto LABEL_48;
  }
LABEL_45:
  BOOL v42 = [(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)self->super._stack effectiveDisplayModeForItemInCurrentStack:0]];
LABEL_49:
  [(_UINavigationBarTransitionContext *)self->_transitionContext setBeginWithLargeTitle:v42];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setEndWithLargeTitle:0];
  uint64_t v43 = [(UINavigationBar *)self->super._navigationBar delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v47 = *MEMORY[0x1E4F1DAD8];
    -[_UINavigationBarTransitionContext setObservedScrollViewOffsetIsApplicable:](self->_transitionContext, "setObservedScrollViewOffsetIsApplicable:", [v43 _navigationBar:self->super._navigationBar getContentOffsetOfObservedScrollViewIfApplicable:&v47]);
    [(_UINavigationBarTransitionContext *)self->_transitionContext setStartingContentOffsetForObservedScrollView:v47];
  }
}

- (void)_endTransitionCompleted:(BOOL)a3
{
  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    BOOL v5 = a3;
    id v13 = [(_UINavigationBarTransitionContext *)transitionContext completionHandler];
    id v6 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    [(_UINavigationBarVisualProviderModernIOS *)self _updateContentPriorities];
    [(_UINavigationBarVisualProviderModernIOS *)self _updateAugmentedTitleDataSources];
    stacuint64_t k = self->super._stack;
    if (v5)
    {
      id v8 = [(_UINavigationBarItemStack *)stack topItem];
      id v9 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v8 backItem:v9 animated:0];

      [(_UINavigationBarTransitionContext *)self->_transitionContext complete];
    }
    else
    {
      char v10 = [(_UINavigationBarItemStack *)stack previousTopItem];
      id v11 = [(_UINavigationBarItemStack *)self->super._stack previousBackItem];
      [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v10 backItem:v11 animated:0];

      [(_UINavigationBarTransitionContext *)self->_transitionContext cancel];
    }
    [(_UINavigationBarVisualProviderModernIOS *)self _updatePromptViewAndActuallyHide:1];
    int64_t v12 = self->_transitionContext;
    self->_transitionContext = 0;

    [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
    if (v13) {
      v13[2](v13, 1, v6);
    }
  }
}

- (void)presentHostedSearchWithTransitionCoordinator:(id)a3
{
}

- (void)dismissHostedSearchWithTransitionCoordinator:(id)a3
{
}

- (void)_presentOrDismissSearch:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v7 = a4;
  if ((unint64_t)(a3 - 7) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v37 = v36;
    if ((unint64_t)(a3 - 1) > 2)
    {
      uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown (transition = %ld)", a3);
      [v37 handleFailureInMethod:a2, self, @"_UINavigationBarVisualProviderModernIOS.m", 2700, @"Unexpected transition type: %@", v38 object file lineNumber description];
    }
    else
    {
      [v36 handleFailureInMethod:a2, self, @"_UINavigationBarVisualProviderModernIOS.m", 2700, @"Unexpected transition type: %@", off_1E52DE9C0[a3 - 1] object file lineNumber description];
    }
  }
  id v8 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  [v8 setSearchActive:a3 == 5];
  [(_UINavigationBarVisualProviderModernIOS *)self _setupTransitionContextForTransition:a3 completion:0];
  id v9 = [v8 item];
  if (a3 != 5)
  {
    uint64_t v10 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    id v11 = (void *)v10;
    if (v10) {
      double v12 = *(double *)(v10 + 312);
    }
    else {
      double v12 = 0.0;
    }
    id v13 = [(UINavigationBar *)self->super._navigationBar delegate];
    if (objc_opt_respondsToSelector())
    {
      -[_UINavigationBarLayout updateLayout]((uint64_t)v11);
      BOOL v14 = [(UINavigationBar *)self->super._navigationBar delegate];
      [v14 _navigationBar:self->super._navigationBar preferredHeightForTransitionToHeightRange:-[_UINavigationBarLayout layoutHeights]((uint64_t)v11)];
      double v16 = v15;

      [(_UINavigationBarLayout *)(uint64_t)v11 setLayoutSize:v16];
    }
  }
  [(_UINavigationBarTransitionContext *)self->_transitionContext setSharesContentViewLayouts:1];
  [(UINavigationBar *)self->super._navigationBar _prepareToAnimateTransition];
  transitionContext = self->_transitionContext;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke;
  v45[3] = &unk_1E52D9F70;
  v45[4] = self;
  [(_UINavigationBarTransitionContext *)transitionContext recordUpdates:v45];
  BOOL v18 = [(_UINavigationBarTransitionContext *)self->_transitionContext compact];
  uint64_t v19 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
  id v20 = (id *)v19;
  if (v18)
  {
    if (v19) {
      id v21 = *(void **)(v19 + 184);
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    id v23 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v22 forNavigationItem:v9 compact:1];
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v20, v23);

    uint64_t v24 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    double v25 = (id *)v24;
    if (v24) {
      double v26 = *(void **)(v24 + 184);
    }
    else {
      double v26 = 0;
    }
    id v27 = v26;
    uint64_t v28 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v27 forNavigationItem:v9 compact:1];
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v25, v28);
  }
  else
  {
    if (v19) {
      double v29 = *(void **)(v19 + 192);
    }
    else {
      double v29 = 0;
    }
    id v30 = v29;
    double v31 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v30 forNavigationItem:v9 compact:0];
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v20, v31);

    uint64_t v32 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    double v25 = (id *)v32;
    if (v32) {
      long long v33 = *(void **)(v32 + 192);
    }
    else {
      long long v33 = 0;
    }
    id v27 = v33;
    uint64_t v28 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v27 forNavigationItem:v9 compact:0];
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v25, v28);
  }

  [(_UINavigationBarTransitionContext *)self->_transitionContext prepare];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_2;
  aBlock[3] = &unk_1E52D9F70;
  void aBlock[4] = self;
  uint64_t v34 = (void (**)(void))_Block_copy(aBlock);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_3;
  v43[3] = &unk_1E52D9F70;
  v43[4] = self;
  uint64_t v35 = (void (**)(void))_Block_copy(v43);
  if ([v7 isAnimated])
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_4;
    v41[3] = &unk_1E52DA110;
    BOOL v42 = v34;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_5;
    v39[3] = &unk_1E52DA110;
    uint64_t v40 = v35;
    [v7 animateAlongsideTransition:v41 completion:v39];
  }
  else
  {
    v34[2](v34);
    v35[2](v35);
  }
}

- (void)_performAnimationWithTransitionCompletion:(id)a3 transition:(int64_t)a4
{
  id v6 = a3;
  if (self->_transitionContext)
  {
    NSLog(&cfstr_AttemptingToBe_0.isa, self->super._navigationBar);
    goto LABEL_53;
  }
  [(_UINavigationBarVisualProviderModernIOS *)self _enforceLayoutOrdering];
  id v7 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
  int64_t v8 = [v7 transition];
  if (!v8)
  {
    id v9 = v6;
    contentView = self->_contentView;
    id v11 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    if ((unint64_t)(-[_UINavigationBarContentView effectiveStyleForStyle:](contentView, "effectiveStyleForStyle:", [v11 style])- 1) > 1)
    {
      double v12 = self->_contentView;
      id v13 = [(_UINavigationBarItemStack *)self->super._stack topItem];
      unint64_t v14 = -[_UINavigationBarContentView effectiveStyleForStyle:](v12, "effectiveStyleForStyle:", [v13 style])- 1;

      int64_t v8 = a4;
      BOOL v15 = v14 > 1;
      id v6 = v9;
      if (v15) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int64_t v8 = 3;
  }
LABEL_8:
  double v16 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  uint64_t v17 = [v16 titleView];
  uint64_t v65 = v7;
  if (_UINavigationBarAugmentedTitleWantsTwoPartCrossfade(v17))
  {
  }
  else
  {
    BOOL v18 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    uint64_t v19 = [v18 titleView];
    int v20 = _UINavigationBarAugmentedTitleWantsTwoPartCrossfade(v19);

    if (!v20) {
      goto LABEL_12;
    }
  }
  [(_UINavigationBarTransitionContext *)self->_transitionContext setTwoPart:1];
  int64_t v8 = 3;
LABEL_12:
  [(_UINavigationBarVisualProviderModernIOS *)self _updateAugmentedTitleDataSources];
  [(_UINavigationBarVisualProviderModernIOS *)self _updateTabBarSuppressionIfNeeded];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke;
  v84[3] = &unk_1E52DE928;
  v84[4] = self;
  id v85 = v6;
  [(_UINavigationBarVisualProviderModernIOS *)self _setupTransitionContextForTransition:v8 completion:v84];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setPushOperation:a4 == 1];
  [(UINavigationBar *)self->super._navigationBar _prepareToAnimateTransition];
  transitionContext = self->_transitionContext;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_2;
  v83[3] = &unk_1E52D9F70;
  v83[4] = self;
  [(_UINavigationBarTransitionContext *)transitionContext recordUpdates:v83];
  id v66 = v6;
  if (![(_UINavigationBarVisualProviderModernIOS *)self allowLargeTitleView])
  {
    BOOL v26 = 0;
LABEL_23:
    BOOL v30 = 0;
    goto LABEL_24;
  }
  stacuint64_t k = self->super._stack;
  id v23 = [(_UINavigationBarItemStack *)stack previousTopItem];
  LODWORD(stack) = [(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)stack effectiveDisplayModeForItemInPreviousStack:v23]];

  if (stack)
  {
    uint64_t v24 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
    if (v24) {
      double v25 = v24[35];
    }
    else {
      double v25 = 0.0;
    }
    BOOL v26 = v25 > 0.0;
  }
  else
  {
    BOOL v26 = 0;
  }
  id v27 = self->super._stack;
  uint64_t v28 = [(_UINavigationBarItemStack *)v27 topItem];
  LODWORD(v27) = [(_UINavigationBarVisualProviderModernIOS *)self _useLargeTitleForDisplayMode:[(_UINavigationBarItemStack *)v27 effectiveDisplayModeForItemInCurrentStack:v28]];

  if (!v27) {
    goto LABEL_23;
  }
  double v29 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
  if (v29) {
    BOOL v30 = v29[35] > 0.0;
  }
  else {
    BOOL v30 = 0;
  }

LABEL_24:
  [(_UINavigationBarTransitionContext *)self->_transitionContext setBeginWithLargeTitle:v26];
  [(_UINavigationBarTransitionContext *)self->_transitionContext setEndWithLargeTitle:v30];
  uint64_t v31 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
  uint64_t v32 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
  double backgroundAlpha = self->_backgroundAlpha;
  if (v31 && *(double *)(v31 + 208) != backgroundAlpha)
  {
    *(double *)(v31 + 208) = backgroundAlpha;
    [(id)v31 _updateLayoutOutputs];
    double backgroundAlpha = self->_backgroundAlpha;
  }
  if (v32 && *(double *)(v32 + 208) != backgroundAlpha)
  {
    *(double *)(v32 + 208) = backgroundAlpha;
    [(id)v32 _updateLayoutOutputs];
  }
  int64_t v64 = v8;
  if ([(_UINavigationBarTransitionContext *)self->_transitionContext compact])
  {
    BOOL v34 = v30;
    if (v31) {
      uint64_t v35 = *(void **)(v31 + 184);
    }
    else {
      uint64_t v35 = 0;
    }
    id v36 = v35;
    uint64_t v37 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    uint64_t v38 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v36 forNavigationItem:v37 compact:1];

    BOOL v39 = v26;
    if (v32) {
      uint64_t v40 = *(void **)(v32 + 184);
    }
    else {
      uint64_t v40 = 0;
    }
    LOBYTE(v30) = v34;
    id v41 = v40;
    BOOL v42 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    uint64_t v43 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v41 forNavigationItem:v42 compact:1];

    -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v31, v38);
    id v67 = v43;
    -[_UINavigationBarLayout setCompactBackgroundViewLayout:](v32, v43);
  }
  else
  {
    if (v31) {
      BOOL v44 = *(void **)(v31 + 192);
    }
    else {
      BOOL v44 = 0;
    }
    id v45 = v44;
    id v46 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    uint64_t v38 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v45 forNavigationItem:v46 compact:0];

    BOOL v39 = v26;
    if (v32) {
      long long v47 = *(void **)(v32 + 192);
    }
    else {
      long long v47 = 0;
    }
    id v48 = v47;
    id v49 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    v50 = [(_UINavigationBarVisualProviderModernIOS *)self _updateBackgroundLayout:v48 forNavigationItem:v49 compact:0];

    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v31, v38);
    id v67 = v50;
    -[_UINavigationBarLayout setStandardBackgroundViewLayout:]((id *)v32, v50);
  }
  int64_t appearanceAPIVersion = self->_appearanceAPIVersion;
  BOOL v52 = v39;
  if (appearanceAPIVersion == 1)
  {
    [(_UINavigationBarTransitionContext *)self->_transitionContext setBeginWithTransparencyAllowed:1];
    int64_t v53 = v64;
LABEL_48:
    [(_UINavigationBarTransitionContext *)self->_transitionContext setEndWithTransparencyAllowed:appearanceAPIVersion == 1];
    goto LABEL_49;
  }
  if (self->_useModernAppearanceAPI)
  {
    uint64_t v54 = [v38 backgroundData2];
    -[_UINavigationBarTransitionContext setBeginWithTransparencyAllowed:](self->_transitionContext, "setBeginWithTransparencyAllowed:", [v54 hasBackground] ^ 1);
  }
  else
  {
    [(_UINavigationBarTransitionContext *)self->_transitionContext setBeginWithTransparencyAllowed:0];
  }
  BOOL v52 = v39;
  int64_t v53 = v64;
  if (!self->_useModernAppearanceAPI) {
    goto LABEL_48;
  }
  uint64_t v55 = [v67 backgroundData2];
  -[_UINavigationBarTransitionContext setEndWithTransparencyAllowed:](self->_transitionContext, "setEndWithTransparencyAllowed:", [v55 hasBackground] ^ 1);

LABEL_49:
  [(_UINavigationBarTransitionContext *)self->_transitionContext prepare];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_3;
  aBlock[3] = &unk_1E52DE950;
  void aBlock[4] = self;
  int64_t v80 = v53;
  BOOL v81 = v52;
  BOOL v82 = v30;
  id v56 = (id)v32;
  id v79 = v56;
  id v57 = _Block_copy(aBlock);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_8;
  v75[3] = &unk_1E52DA660;
  id v58 = v65;
  id v76 = v58;
  long long v77 = self;
  v59 = _Block_copy(v75);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_9;
  v72[3] = &unk_1E52DE978;
  v72[4] = self;
  id v60 = v57;
  id v74 = v60;
  id v61 = v58;
  id v73 = v61;
  v62 = _Block_copy(v72);
  if ([v61 shouldAnimateAlongside])
  {
    id v63 = [v61 transitionCoordinator];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_10;
    v70[3] = &unk_1E52DA110;
    id v71 = v62;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_11;
    v68[3] = &unk_1E52DA110;
    id v69 = v59;
    [v63 _animateAlongsideTransitionInView:0 systemAnimation:0 systemCompletion:1 animation:v70 completion:v68];
  }
  else
  {
    (*((void (**)(void *, void *))v62 + 2))(v62, v59);
  }

  id v6 = v66;
LABEL_53:
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    [(_UINavigationBarVisualProviderModernIOS *)self _performAnimationWithTransitionCompletion:a4 transition:2];
  }
  else {
    [(_UINavigationBarVisualProviderModernIOS *)self _updateWithCompletion:a4];
  }
}

- (void)prepareForPop
{
  uint64_t v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  [(_UINavigationBarVisualProviderModernIOS *)self _upgradeAppearanceAPIForItemIfNecessary:v3];

  [(_UINavigationBarVisualProviderModernIOS *)self _prepareLayouts];
}

- (void)animateForSearchPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  id v7 = [v6 searchLayout];

  if (v7)
  {
    unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderModernIOS.m" lineNumber:3016 description:@"Hosted search should take a different code path"];
  }
  if (!self->_runningPaletteBasedSearchPresentation)
  {
    self->_runningPaletteBasedSearchPresentatiouint64_t n = 1;
    [(UIView *)self->_contentView alpha];
    uint64_t v9 = v8;
    [(UIView *)self->_largeTitleView alpha];
    uint64_t v11 = v10;
    if (v3)
    {
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      id v36 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke;
      uint64_t v37 = &unk_1E52D9F70;
      uint64_t v38 = self;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      double v29 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_4;
      BOOL v30 = &unk_1E52DA6D8;
      uint64_t v31 = self;
      uint64_t v32 = v9;
      uint64_t v33 = v10;
      double v12 = &v34;
      id v13 = &v27;
    }
    else
    {
      [(UIView *)self->_contentView setAlpha:0.0];
      [(UIView *)self->_largeTitleView setAlpha:0.0];
      uint64_t v19 = self;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_5;
      id v23 = &unk_1E52DD178;
      uint64_t v24 = self;
      uint64_t v25 = v9;
      uint64_t v26 = v11;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_8;
      BOOL v18 = &unk_1E52DC3A0;
      double v12 = &v20;
      id v13 = &v15;
    }
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v12, v13, 0.0, 0.0, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38);
  }
}

- (CGPoint)contentViewLayoutFrameOrigin
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)promptViewLayoutFrameOrigin
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)currentContentSize
{
  return [(_UINavigationBarContentView *)self->_contentView currentContentSize];
}

- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_isHidden)
  {
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  [(UIView *)self->_contentView frame];
  v18.double x = x;
  v18.double y = y;
  if (CGRectContainsPoint(v20, v18))
  {
    [(UIView *)self->_largeTitleView frame];
    v19.double x = x;
    v19.double y = y;
    if (CGRectContainsPoint(v21, v19))
    {
      uint64_t v9 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
      uint64_t v10 = [v9 activeLayout];

      if (v10)
      {
        if (*(unsigned char *)(v10 + 108))
        {
          id v11 = *(id *)(v10 + 128);
          if (v11)
          {
            double v12 = v11;
            id v13 = *(id *)(v10 + 144);

            if (v13)
            {
              largeTitleView = self->_largeTitleView;
              -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", largeTitleView, x, y);
              -[UIView hitTest:withEvent:](largeTitleView, "hitTest:withEvent:", 0);
              uint64_t v15 = (_UINavigationBarLargeTitleView *)objc_claimAutoreleasedReturnValue();
              uint64_t v8 = v15;
              if (v15 && v15 != self->_largeTitleView)
              {

                goto LABEL_15;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v8 = (_UINavigationBarLargeTitleView *)v7;
LABEL_15:

  return v8;
}

- (int64_t)statusBarStyle
{
  if (self->_useModernAppearanceAPI)
  {
    double v3 = [(UIView *)self->_backgroundView traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 2) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else
  {
    if ([(UINavigationBar *)self->super._navigationBar barStyle]) {
      return 1;
    }
    if (!self->_usesBarBackground) {
      return 1;
    }
    id v6 = [(_UIBarBackground *)self->_backgroundView layout];
    [v6 topInset];
    double v8 = v7;

    if (v8 > 0.0)
    {
      return 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
      return [(_UINavigationBarVisualProvider *)&v9 statusBarStyle];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->super._navigationBar bounds];
  [(_UINavigationBarVisualProviderModernIOS *)self layoutHeightsFittingWidth:v3];
  double v5 = v4;
  double v6 = -1.0;
  result.double height = v5;
  result.double width = v6;
  return result;
}

- (id)restingHeights
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  itemForMeasuring = self->super._itemForMeasuring;
  if (has_internal_diagnostics)
  {
    if (itemForMeasuring)
    {
      objc_super v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Don’t know how to apply override measurement item when calculating detents!", buf, 2u);
      }
    }
  }
  else if (itemForMeasuring)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &restingHeights___s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Don’t know how to apply override measurement item when calculating detents!", v11, 2u);
    }
  }
  double v5 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v6 = [v5 activeLayout];
  double v7 = -[_UINavigationBarLayout restingHeights](v6);

  return v7;
}

- (void)_didEncounterFirstTitleWithExcessiveHeightChanged:(id)a3
{
  if (!self->_providesExtraSpaceForExcessiveLineHeights)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = 1;
    double v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    double v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    [(_UINavigationBarVisualProviderModernIOS *)self _updateContentForTopItem:v4 backItem:v5 animated:1];

    [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
  }
}

- (void)_postDidEncounterFirstTitleWithExcessiveHeightChanged
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UINavigationBarLargeTitleDidEncounterFirstTitleWithExcessiveHeightChanged" object:0];
}

- (void)navigationControllerRefreshControlHostDidUpdateLayout:(id)a3
{
  double v4 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  double v5 = [v4 activeLayout];
  -[_UINavigationBarLayout updateLayout]((uint64_t)v5);

  [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
}

- (id)tabBarHostedView
{
  return self->_tabBarHostedView;
}

- (void)setTabBarHostedView:(id)a3
{
  p_tabBarHostedView = &self->_tabBarHostedView;
  objc_super v9 = (_UITabContainerView *)a3;
  if (*p_tabBarHostedView != v9
    || ([(_UITabContainerView *)v9 floatingTabBarHost],
        double v6 = (_UINavigationBarVisualProviderModernIOS *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != self))
  {
    if (self->_isSuppressingTabBar)
    {
      double v7 = [(_UITabContainerView *)*p_tabBarHostedView floatingTabBarHost];

      if (v7 == self) {
        [(_UITabContainerView *)*p_tabBarHostedView setSuppressTabBar:0];
      }
      self->_BOOL isSuppressingTabBar = 0;
    }
    double v8 = [(_UITabContainerView *)v9 floatingTabBarHost];

    if (v8 == self) {
      [(_UITabContainerView *)v9 setFloatingTabBarHost:0];
    }
    objc_storeStrong((id *)&self->_tabBarHostedView, a3);
    [(_UINavigationBarVisualProviderModernIOS *)self _updateTabBarHost];
    [(_UINavigationBarVisualProviderModernIOS *)self _updatePlaceholderFromTabBarContainer:*p_tabBarHostedView];
    [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  }
}

- (void)setActiveTabBarHost:(BOOL)a3
{
  if (self->_isActiveTabBarHost != a3)
  {
    self->_isActiveTabBarHost = a3;
    [(_UINavigationBarVisualProviderModernIOS *)self _updateTabBarHost];
  }
}

- (BOOL)wantsHostedTabBarMetrics
{
  return self->_wantsHostedTabBarMetrics;
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
  if (self->_wantsHostedTabBarMetrics != a3)
  {
    self->_wantsHostedTabBarMetrics = a3;
    -[_UINavigationBarContentView setWantsHostedTabBarMetrics:](self->_contentView, "setWantsHostedTabBarMetrics:");
    navigationBar = self->super._navigationBar;
    [(UINavigationBar *)navigationBar setNeedsLayout];
  }
}

- (void)_updateTabBarHost
{
  BOOL isActiveTabBarHost = self->_isActiveTabBarHost;
  tabBarHostedView = self->_tabBarHostedView;
  if (isActiveTabBarHost)
  {
    double v5 = self;
LABEL_3:
    [(_UITabContainerView *)tabBarHostedView setFloatingTabBarHost:v5];
    return;
  }
  double v6 = [(_UITabContainerView *)tabBarHostedView floatingTabBarHost];
  if (v6 == self)
  {
    BOOL v7 = self->_isActiveTabBarHost;

    if (v7) {
      return;
    }
    tabBarHostedView = self->_tabBarHostedView;
    double v5 = 0;
    goto LABEL_3;
  }
}

- (void)_updatePlaceholderFromTabBarContainer:(id)a3
{
  id v5 = a3;
  if ([v5 wantsHostingNavigationBarPlaceholder])
  {
    double v4 = [v5 hostingNavigationBarPlaceholderItem];
    [(_UINavigationBarVisualProviderModernIOS *)self setStaticNavBarButtonItem:v4 trailingPosition:0];

    self->_isHostingPlaceholderFromTabBarContainer = 1;
  }
  else if (self->_isHostingPlaceholderFromTabBarContainer)
  {
    [(_UINavigationBarVisualProviderModernIOS *)self setStaticNavBarButtonItem:0 trailingPosition:0];
    self->_isHostingPlaceholderFromTabBarContainer = 0;
  }
}

- (id)staticNavBarButtonItem
{
  return self->_staticNavBarButtonItem;
}

- (BOOL)isContentView:(id)a3
{
  return self->_contentView == a3;
}

- (BOOL)isContentViewHidden
{
  id v2 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  uint64_t v3 = [v2 activeLayout];
  double v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 128);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = v6 == 0;

  return v7;
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return [(_UINavigationBarContentView *)self->_contentView shouldFadeStaticNavBarButton];
}

- (BOOL)staticNavBarButtonLingers
{
  return [(_UINavigationBarContentView *)self->_contentView staticNavBarButtonLingers];
}

- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return [(_UINavigationBarContentView *)self->_contentView isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  [(_UINavigationBarContentView *)self->_contentView navItemContentLayoutGuideAnimationDistance];
  return result;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return [(_UINavigationBarContentView *)self->_contentView updateNavItemContentLayoutGuideAnimationConstraintConstant:a3];
}

- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
}

- (void)_removeContentClippingView
{
  uint64_t v3 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  uint64_t v4 = [v3 normalLayout];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 136);
  }
  else {
    id v6 = 0;
  }
  BOOL v7 = v6;

  double v8 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  objc_super v9 = [v8 normalLayout];
  -[_UINavigationBarLayout setAnimationContentClippingView:]((uint64_t)v9, 0);

  uint64_t v10 = [(UIView *)self->_contentView superview];
  id v11 = v10;
  if (v10 && v10 != self->super._navigationBar)
  {
    if (v7 && v10 != v7)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v13 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Unexpected container for the content view when trying to remove clipping view", buf, 2u);
        }
      }
      else
      {
        double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_removeContentClippingView___s_category) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unint64_t v14 = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Unexpected container for the content view when trying to remove clipping view", v14, 2u);
        }
      }
    }
    [(UIView *)self->super._navigationBar addSubview:self->_contentView];
    [(UIView *)v7 removeFromSuperview];
  }
}

- (void)_installContentClippingView:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(_UINavigationBarItemStack *)self->super._stack topEntry];
  if (v4)
  {
    [(_UINavigationBarVisualProviderModernIOS *)self _ensureLayoutsConfiguredForEntry:v4];
    id v5 = [v4 normalLayout];
    -[_UINavigationBarLayout setAnimationContentClippingView:]((uint64_t)v5, v8);

    id v6 = [v4 activeLayout];
    BOOL v7 = [v4 normalLayout];

    if (v6 == v7)
    {
      [(UIView *)self->super._navigationBar addSubview:v8];
      [v8 addSubview:self->_contentView];
    }
  }
}

- (void)navigationBarContentViewDidTriggerBackAction:(id)a3 fromBackButtonItem:(id)a4
{
}

- (void)navigationBarContentViewDidTriggerTitleRenameAction:(id)a3
{
}

- (id)presentationSourceForContent:(int64_t)a3 navigationItem:(id)a4
{
  id v6 = a4;
  if (![(_UINavigationBarItemStack *)self->super._stack state]
    && ([(_UINavigationBarItemStack *)self->super._stack topItem],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v6))
  {
    if (a3)
    {
      id v10 = 0;
    }
    else
    {
      id v11 = [(_UINavigationBarContentView *)self->_contentView layout];
      double v12 = [v11 overflowItem];

      id v13 = [v12 buttonGroup];
      char v14 = [v13 isHidden];

      if (v14) {
        id v10 = 0;
      }
      else {
        id v10 = v12;
      }
    }
    id v8 = _UIPopoverPresentationControllerSourceItemObscuredSource(v10);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)navigationItemUpdatedPromptContent:(id)a3
{
  id v12 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];

    if (v4 == v12)
    {
      id v5 = [(_UINavigationBarModernPromptView *)self->_promptView prompt];
      id v6 = [v12 prompt];
      id v7 = v5;
      id v8 = v6;
      objc_super v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        if (v7) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
        }
        else
        {
          char v11 = [v7 isEqual:v8];

          if (v11) {
            goto LABEL_13;
          }
        }
        [(_UINavigationBarModernPromptView *)self->_promptView setPrompt:v9];
        [(UIView *)self->_promptView layoutIfNeeded];
        [(UINavigationBar *)self->super._navigationBar _sendResizeForPromptChange];
        [(UINavigationBar *)self->super._navigationBar _accessibility_navigationBarContentsDidChange];
      }
LABEL_13:
    }
  }
}

- (void)navigationItemUpdatedBackgroundAppearance:(id)a3
{
  id v5 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v4 == v5) {
      [(_UINavigationBarVisualProviderModernIOS *)self _updateBackground];
    }
  }
}

- (void)navigationItemUpdatedNavigationBarVisibility:(id)a3
{
  id v5 = a3;
  if (![(_UINavigationBarItemStack *)self->super._stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    if (v4 == v5) {
      [(_UINavigationBarVisualProviderModernIOS *)self updateBarVisibilityForTopItem];
    }
  }
}

- (void)navigationItemSearchControllerReadyForDeferredAutomaticShowsScopeBar:(id)a3
{
  stacuint64_t k = self->super._stack;
  id v5 = a3;
  id v6 = [(_UINavigationBarItemStack *)stack topItem];

  if (v6 == v5)
  {
    id v7 = [(_UINavigationBarVisualProvider *)self navigationBar];
    id v8 = [v7 delegate];

    if (objc_opt_respondsToSelector()) {
      [v8 _navigationBarWillRunAutomaticDeferredShowsScopeBar:self->super._navigationBar];
    }
  }
}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];

  if (v5 == v4)
  {
    id v7 = [(_UINavigationBarVisualProvider *)self navigationBar];
    id v8 = [v7 delegate];

    if (objc_opt_respondsToSelector()) {
      char v6 = [v8 _navigationItemShouldDeferSearchPresentationOrDismissalForScrollViewAnimation:v4];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)navigationItemUpdatedBottomPalette:(id)a3 oldPalette:(id)a4
{
  id v5 = a4;
  id v8 = v5;
  if (!self->_transitionContext)
  {
    char v6 = [v5 superview];
    navigationBar = self->super._navigationBar;

    if (v6 == navigationBar) {
      [v8 removeFromSuperview];
    }
    [(_UINavigationBarVisualProviderModernIOS *)self _invalidateIntrinsicContentSizeAndNotifySizeChanged];
  }
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
  int v9 = [v8 interactive];

  if (!v9)
  {
    char v14 = 0;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"opacity"])
  {
    id v10 = [(_UINavigationBarTransitionContext *)self->_transitionContext viewUsingEaseInCurve];

    if (v10 != v6)
    {
      [v6 alpha];
      if (v11 < 0.05
        || ([(_UINavigationBarTransitionContext *)self->_transitionContext viewFadingInFromCustomAlpha], id v12 = (id)objc_claimAutoreleasedReturnValue(), v12, v12 == v6))
      {
        uint64_t v13 = +[_UINavigationBarTransitionContext fadeInFunction];
      }
      else
      {
        uint64_t v13 = +[_UINavigationBarTransitionContext fadeOutFunction];
      }
      goto LABEL_12;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F39C10];
    uint64_t v16 = (void *)MEMORY[0x1E4F3A488];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F39C10];
    uint64_t v16 = (void *)MEMORY[0x1E4F3A4A0];
  }
  uint64_t v13 = [v15 functionWithName:*v16];
LABEL_12:
  char v14 = (void *)v13;
LABEL_13:

  return v14;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (void)tabBarContainerWillChangeFloatingTabBarVisibility:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_transitionContext)
  {
    [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
    id v4 = v5;
  }
  [(_UINavigationBarVisualProviderModernIOS *)self _updatePlaceholderFromTabBarContainer:v4];
}

- (void)tabBarContainerDidLayoutFloatingTabBar:(id)a3
{
  if (!self->_transitionContext)
  {
    [(_UITabContainerView *)self->_tabBarHostedView floatingTabBarContentFrameInCoordinateSpace:self->_contentView];
    contentView = self->_contentView;
    -[_UINavigationBarContentView setHostedTabBarFrame:](contentView, "setHostedTabBarFrame:");
  }
}

- (double)contentViewVerticalOffsetInTabBarContainer:(id)a3
{
  return 0.0;
}

- (BOOL)_shim_hasCustomBackgroundView
{
  if (!self->_usesBarBackground) {
    return 0;
  }
  id v2 = [(_UIBarBackground *)self->_backgroundView customBackgroundView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  id v4 = a3;
  if (self->_usesBarBackground)
  {
    id v6 = v4;
    id v5 = [(_UIBarBackground *)self->_backgroundView customBackgroundView];

    id v4 = v6;
    if (v5 != v6)
    {
      [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:v6];
      id v4 = v6;
    }
  }
}

- (double)_shim_shadowAlpha
{
  return self->_shadowAlpha;
}

- (void)_shim_setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
}

- (BOOL)_shim_disableBlurTinting
{
  if (!self->_usesBarBackground) {
    return 0;
  }
  id v2 = [(_UIBarBackground *)self->_backgroundView layout];
  char v3 = [v2 disableTinting];

  return v3;
}

- (void)_shim_setDisableBlurTinting:(BOOL)a3
{
  if (self->_usesBarBackground)
  {
    BOOL v4 = a3;
    id v5 = [(_UIBarBackground *)self->_backgroundView layout];
    [v5 setDisableTinting:v4];
  }
  [(_UINavigationBarVisualProviderModernIOS *)self changeAppearance];
}

- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v7 = [v6 _searchControllerIfAllowed];
  id v8 = [v7 searchBar];

  BOOL v9 = 1;
  if (v8)
  {
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", v8, x, y);
    if (objc_msgSend(v8, "pointInside:withEvent:", 0)) {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", self->_contentView);
  double v7 = v6;
  double v9 = v8;
  id v10 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v11 = [v10 _weeTitle];
  if ([v11 length] && !-[UIView isHidden](self->_weeTitleLabel, "isHidden"))
  {
    weeTitleLabel = self->_weeTitleLabel;
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", weeTitleLabel, x, y);
    LODWORD(weeTitleLabel) = -[UIView pointInside:withEvent:](weeTitleLabel, "pointInside:withEvent:", 0);

    if (weeTitleLabel)
    {
      uint64_t v17 = [UIAccessibilityHUDItem alloc];
      char v14 = [(_UINavigationBarItemStack *)self->super._stack topItem];
      uint64_t v18 = [v14 _weeTitle];
LABEL_16:
      uint64_t v32 = (void *)v18;
      uint64_t v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v17, "initWithTitle:image:imageInsets:", v18, 0, 0.0, 0.0, 0.0, 0.0);

      goto LABEL_17;
    }
  }
  else
  {
  }
  if (![(UIView *)self->_promptView isHidden])
  {
    promptView = self->_promptView;
    -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", promptView, x, y);
    if (-[UIView pointInside:withEvent:](promptView, "pointInside:withEvent:", 0))
    {
      uint64_t v13 = [UIAccessibilityHUDItem alloc];
      char v14 = [(_UINavigationBarModernPromptView *)self->_promptView prompt];
      uint64_t v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v13, "initWithTitle:image:imageInsets:", v14, 0, 0.0, 0.0, 0.0, 0.0);
LABEL_17:

      goto LABEL_18;
    }
  }
  if (-[UIView pointInside:withEvent:](self->_contentView, "pointInside:withEvent:", 0, v7, v9))
  {
    -[_UINavigationBarContentView _accessibility_HUDItemForPoint:](self->_contentView, "_accessibility_HUDItemForPoint:", v7, v9);
    uint64_t v15 = (UIAccessibilityHUDItem *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  largeTitleView = self->_largeTitleView;
  -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", largeTitleView, x, y);
  uint64_t v15 = 0;
  if (-[UIView pointInside:withEvent:](largeTitleView, "pointInside:withEvent:", 0))
  {
    CGRect v20 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];

    if (v20)
    {
      CGRect v21 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];
      navigationBar = self->super._navigationBar;
      id v23 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];
      -[UIView convertPoint:toView:](navigationBar, "convertPoint:toView:", v23, x, y);
      uint64_t v24 = objc_msgSend(v21, "_largeContentViewerItemAtPoint:");

      if (v24)
      {
        uint64_t v25 = [UIAccessibilityHUDItem alloc];
        uint64_t v26 = [v24 largeContentTitle];
        uint64_t v27 = [v24 largeContentImage];
        [v24 largeContentImageInsets];
        uint64_t v15 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v25, "initWithTitle:image:imageInsets:scaleImage:", v26, v27, [v24 scalesLargeContentImage], v28, v29, v30, v31);

        goto LABEL_18;
      }
    }
    uint64_t v17 = [UIAccessibilityHUDItem alloc];
    char v14 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    uint64_t v18 = [v14 title];
    goto LABEL_16;
  }
LABEL_18:
  return v15;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  contentView = self->_contentView;
  -[UIView convertPoint:toView:](self->super._navigationBar, "convertPoint:toView:", contentView);
  -[_UINavigationBarContentView _accessibility_controlToActivateForHUDGestureLiftAtPoint:](contentView, "_accessibility_controlToActivateForHUDGestureLiftAtPoint:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v7 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];

    if (v7)
    {
      double v8 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];
      navigationBar = self->super._navigationBar;
      id v10 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView accessoryView];
      -[UIView convertPoint:toView:](navigationBar, "convertPoint:toView:", v10, x, y);
      double v11 = objc_msgSend(v8, "_largeContentViewerItemAtPoint:");

      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v11;
          if ([v7 isEnabled])
          {
LABEL_8:

            goto LABEL_9;
          }
        }
      }
      id v7 = 0;
      goto LABEL_8;
    }
  }
LABEL_9:
  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"backdropGroupName"])
  {
    UIKVCAccessProhibited((uint64_t)v4, @"UINavigationBar");

    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    id v5 = [(_UINavigationBarVisualProviderModernIOS *)&v7 valueForUndefinedKey:v4];
  }
  return v5;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"backdropGroupName"])
  {
    UIKVCAccessProhibited((uint64_t)v7, @"UINavigationBar");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
    [(_UINavigationBarVisualProviderModernIOS *)&v8 setValue:v6 forUndefinedKey:v7];
  }
}

- (id)_immediatelyFinishRunningTransition
{
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarVisualProviderModernIOS;
  char v3 = [(_UINavigationBarVisualProvider *)&v12 _immediatelyFinishRunningTransition];
  id v4 = v3;
  if (self->_transitionContext)
  {
    +[UIView removePropertyAnimatorAnimationsInView:self->super._navigationBar];
    id v5 = [(_UINavigationBarTransitionContext *)self->_transitionContext prepareForInterruption];
    [(UIView *)self->super._navigationBar _removeAllAnimations:1];
    [(UIView *)self->super._navigationBar _removeAllRetargetableAnimations:1];
    [(_UINavigationBarVisualProviderModernIOS *)self _endTransitionCompleted:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78___UINavigationBarVisualProviderModernIOS__immediatelyFinishRunningTransition__block_invoke;
    v9[3] = &unk_1E52DE9A0;
    id v10 = v4;
    id v11 = v5;
    id v6 = v5;
    id v7 = _Block_copy(v9);
  }
  else
  {
    id v7 = _Block_copy(v3);
  }

  return v7;
}

@end