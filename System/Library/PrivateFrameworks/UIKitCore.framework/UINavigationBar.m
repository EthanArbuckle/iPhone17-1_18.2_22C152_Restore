@interface UINavigationBar
+ (BOOL)_forceLegacyVisualProvider;
+ (BOOL)_requiresModernVisualProvider;
+ (BOOL)_supportsCanvasView;
+ (BOOL)_useCustomBackButtonAction;
+ (CGSize)defaultSize;
+ (CGSize)defaultSizeForOrientation:(int64_t)a3;
+ (CGSize)defaultSizeWithPrompt;
+ (CGSize)defaultSizeWithPromptForOrientation:(int64_t)a3;
+ (Class)_visualProviderClassForNavigationBar:(id)a3;
+ (double)defaultAnimationDuration;
+ (id)_defaultVisualStyleForOrientation:(int64_t)a3;
+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5;
+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5 backgroundImage:(id)a6 viewSize:(CGSize)a7;
+ (id)_visualProviderForNavigationBar:(id)a3;
+ (id)defaultPromptFont;
+ (void)_initializeForIdiom:(int64_t)a3;
+ (void)_setUseCustomBackButtonAction:(BOOL)a3;
- ($1AB5FA073B851C12C2339EC22442E995)_layoutHeightsForNavigationItem:(id)a3 fittingWidth:(double)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_allowInteractionDuringTransition;
- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3;
- (BOOL)_canPreemptTransition;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_deferShadowToSearchBar;
- (BOOL)_delegateWantsNavigationBarHidden;
- (BOOL)_didVisibleItemsChangeWithNewItems:(id)a3 oldItems:(id)a4;
- (BOOL)_disableBlurTinting;
- (BOOL)_effectiveDelegateSupportsScrollEdgeTransitionProgress;
- (BOOL)_forceScrollEdgeAppearance;
- (BOOL)_hasBackButton;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasFixedMaximumHeight;
- (BOOL)_hasLegacyProvider;
- (BOOL)_hasVariableHeight;
- (BOOL)_heightDependentOnOrientation;
- (BOOL)_hidesShadow;
- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO;
- (BOOL)_isActiveTabBarHost;
- (BOOL)_isAlwaysHidden;
- (BOOL)_isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (BOOL)_isAnimationEnabled;
- (BOOL)_isContentViewHidden;
- (BOOL)_lostNavigationControllerDelegate;
- (BOOL)_scrollEdgeAppearanceHasChromelessBehavior;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldCrossFadeBackgroundVisility;
- (BOOL)_shouldDecodeSubviews;
- (BOOL)_shouldFadeStaticNavBarButton;
- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3;
- (BOOL)_shouldShowBackButtonForScreen:(id)a3;
- (BOOL)_startedAnimationTracking;
- (BOOL)_staticNavBarButtonLingers;
- (BOOL)_subclassImplementsDrawRect;
- (BOOL)_suppressBackIndicator;
- (BOOL)_titleAutoresizesToFit;
- (BOOL)_updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3;
- (BOOL)_useInlineBackgroundHeightWhenLarge;
- (BOOL)_wantsHostedTabBarMetrics;
- (BOOL)_wasDecodedUnlockedWithNavigationControllerDelegate;
- (BOOL)alwaysUseDefaultMetrics;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)forceFullHeightInLandscape;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimationEnabled;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isLocked;
- (BOOL)isMinibar;
- (BOOL)isTranslucent;
- (BOOL)isTransparentFocusItem;
- (BOOL)prefersLargeTitles;
- (BOOL)supportsRefreshControlHosting;
- (CGFloat)titleVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics;
- (CGRect)_incomingNavigationBarFrame;
- (CGRect)availableTitleArea;
- (CGRect)promptBounds;
- (CGSize)defaultSizeForOrientation:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)_animationIds;
- (NSArray)backgroundEffects;
- (NSArray)items;
- (NSDictionary)largeTitleTextAttributes;
- (NSDictionary)titleTextAttributes;
- (NSDirectionalEdgeInsets)_resolvedLargeTitleMargins;
- (NSDirectionalEdgeInsets)_resolvedLayoutMargins;
- (NSDirectionalEdgeInsets)_resolvedSearchBarMargins;
- (NSString)_backdropViewLayerGroupName;
- (NSString)description;
- (UIBarButtonItem)_staticNavBarButtonItem;
- (UIBarStyle)barStyle;
- (UIBehavioralStyle)behavioralStyle;
- (UIBehavioralStyle)preferredBehavioralStyle;
- (UIColor)_accessibilityButtonBackgroundTintColor;
- (UIImage)backIndicatorImage;
- (UIImage)backIndicatorTransitionMaskImage;
- (UIImage)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics;
- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)shadowImage;
- (UILayoutGuide)_userContentGuide;
- (UINavigationBar)initWithCoder:(id)a3;
- (UINavigationBar)initWithFrame:(CGRect)a3;
- (UINavigationBarAppearance)compactAppearance;
- (UINavigationBarAppearance)compactScrollEdgeAppearance;
- (UINavigationBarAppearance)scrollEdgeAppearance;
- (UINavigationBarAppearance)standardAppearance;
- (UINavigationBarNSToolbarSection)currentNSToolbarSection;
- (UINavigationItem)backItem;
- (UINavigationItem)popNavigationItemAnimated:(BOOL)animated;
- (UINavigationItem)topItem;
- (UIView)_backgroundView;
- (UIView)currentLeftView;
- (UIView)currentRightView;
- (_UINavigationBarItemStack)_stack;
- (_UINavigationControllerRefreshControlHost)refreshControlHost;
- (_UINavigationItemButtonView)currentBackButton;
- (_UITabContainerView)_tabBarHostedView;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_backIndicatorLeftMargin;
- (double)_backgroundOpacity;
- (double)_defaultAutolayoutSpacing;
- (double)_effectiveBackIndicatorLeftMargin;
- (double)_heightForRestoringFromCancelledTransition;
- (double)_heightIncludingBackground;
- (double)_navItemContentLayoutGuideAnimationDistance;
- (double)_overrideBackgroundExtension;
- (double)_requestedMaxBackButtonWidth;
- (double)_shadowAlpha;
- (double)_titleOpacity;
- (double)defaultBackButtonAlignmentHeight;
- (double)defaultHeight;
- (double)defaultHeightForMetrics:(int64_t)a3;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_accessibility_contentsOfNavigationBar;
- (id)_accessibility_navigationController;
- (id)_allViews;
- (id)_appearanceStorage;
- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4;
- (id)_backgroundViewForPalette:(id)a3;
- (id)_contentView;
- (id)_currentLeftViews;
- (id)_currentRightViews;
- (id)_currentVisualStyle;
- (id)_defaultTitleFont;
- (id)_defaultTitleFontFittingHeight:(double)a3 withScaleAdjustment:(double)a4;
- (id)_defaultTitleFontWithScaleAdjustment:(double)a3;
- (id)_effectiveBarTintColor;
- (id)_effectiveDelegate;
- (id)_effectiveDelegateForItem:(id)a3;
- (id)_immediatelyFinishRunningTransition;
- (id)_popNavigationItemWithTransition:(int)a3;
- (id)_restingHeights;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_titleTextColor;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)animationFactory;
- (id)backButtonViewAtPoint:(CGPoint)a3;
- (id)buttonItemShadowColor;
- (id)createButtonWithContents:(id)a3 width:(double)a4 barStyle:(int64_t)a5 buttonStyle:(int)a6 isRight:(BOOL)a7;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)navigationItemAtPoint:(CGPoint)a3;
- (id)preferredFocusedView;
- (id)prompt;
- (id)promptView;
- (int)_transitionForOldItems:(id)a3 newItems:(id)a4;
- (int)state;
- (int64_t)_activeBarMetrics;
- (int64_t)_backgroundBackdropStyle;
- (int64_t)_barPosition;
- (int64_t)_barStyle;
- (int64_t)_barTranslucence;
- (int64_t)_currentBarStyle;
- (int64_t)_effectiveMetricsForMetrics:(int64_t)a3;
- (int64_t)_itemStackCount;
- (int64_t)_sceneDraggingBehaviorOnPan;
- (int64_t)_statusBarStyle;
- (int64_t)animationDisabledCount;
- (int64_t)barPosition;
- (int64_t)currentContentSize;
- (int64_t)effectiveInterfaceOrientation;
- (int64_t)requestedContentSize;
- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3;
- (void)_accessibilityButtonShapesParametersDidChange;
- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4;
- (void)_accessibility_triggerBackButton;
- (void)_accessibility_triggerBarButtonItem:(id)a3;
- (void)_addItem:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5;
- (void)_addItems:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5;
- (void)_animateForSearchPresentation:(BOOL)a3;
- (void)_applySPIAppearanceToButtons;
- (void)_barSizeDidChange:(CGSize)a3;
- (void)_beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)_beginInteractiveTransition;
- (void)_beginRenaming;
- (void)_beginRenamingIfPossible;
- (void)_cancelInteractiveTransition;
- (void)_cancelInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)_commonNavBarInit;
- (void)_completePopOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4;
- (void)_completePushOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4;
- (void)_configurePaletteConstraintsIfNecessary;
- (void)_customViewChangedForButtonItem:(id)a3;
- (void)_deferSearchSuggestionsMenuRefreshForGeometryChange;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_disableAnimation;
- (void)_dismissHostedSearchWithTransitionCoordinator:(id)a3;
- (void)_displayItemsKeepingOwningNavigationBar:(id)a3;
- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3;
- (void)_enableAnimation;
- (void)_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)_endRenaming;
- (void)_evaluateBackIndicatorForHilightedState:(BOOL)a3 ofBarButtonItem:(id)a4 inNavigationItem:(id)a5;
- (void)_fadeAllViewsIn;
- (void)_fadeAllViewsOut;
- (void)_finishInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)_getBackgroundImage:(id *)a3 shouldRespectOversizedBackgroundImage:(BOOL *)a4 actualBarMetrics:(int64_t *)a5 actualBarPosition:(int64_t *)a6;
- (void)_installContentClippingView:(id)a3;
- (void)_installDefaultAppearance;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_palette:(id)a3 isAttaching:(BOOL)a4 didComplete:(BOOL)a5;
- (void)_performUpdatesIgnoringLock:(id)a3;
- (void)_popNavigationItemWithTransitionAssistant:(id)a3;
- (void)_popNestedNavigationItem;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareToAnimateTransition;
- (void)_presentHostedSearchWithTransitionCoordinator:(id)a3;
- (void)_propagateEffectiveBarTintColorWithPreviousColor:(id)a3;
- (void)_pushNavigationItem:(id)a3 transition:(int)a4;
- (void)_pushNavigationItem:(id)a3 transitionAssistant:(id)a4;
- (void)_pushNavigationItemUsingCurrentTransition:(id)a3;
- (void)_pushNestedNavigationItem:(id)a3;
- (void)_redisplayItems;
- (void)_reenableUserInteraction;
- (void)_reenableUserInteractionWhenReadyWithContext:(id)a3;
- (void)_refreshBackButtonMenu;
- (void)_refreshSearchSuggestionsMenuAfterGeometryChange;
- (void)_removeContentClippingView;
- (void)_searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3;
- (void)_sendNavigationBarAnimateTransition;
- (void)_sendNavigationBarDidChangeStyle;
- (void)_sendNavigationBarResize;
- (void)_sendNavigationPopForBackBarButtonItem:(id)a3;
- (void)_sendResizeForPromptChange;
- (void)_setAccessibilityButtonBackgroundTintColor:(id)a3;
- (void)_setActiveTabBarHost:(BOOL)a3;
- (void)_setAlwaysUseDefaultMetrics:(BOOL)a3;
- (void)_setBackButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5;
- (void)_setBackIndicatorLeftMargin:(double)a3;
- (void)_setBackIndicatorPressed:(BOOL)a3 initialPress:(BOOL)a4;
- (void)_setBackdropViewLayerGroupName:(id)a3;
- (void)_setBackgroundImage:(id)a3 mini:(id)a4;
- (void)_setBackgroundOpacity:(double)a3;
- (void)_setBackgroundView:(id)a3;
- (void)_setBarPosition:(int64_t)a3;
- (void)_setBarStyle:(int64_t)a3;
- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5;
- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4;
- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4 forState:(unint64_t)a5;
- (void)_setButtonTextShadowOffset:(CGSize)a3;
- (void)_setDecodedItems:(id)a3;
- (void)_setDecodedUnlockedWithNavigationControllerDelegate:(BOOL)a3;
- (void)_setDeferShadowToSearchBar:(BOOL)a3;
- (void)_setDisableBlurTinting:(BOOL)a3;
- (void)_setForceScrollEdgeAppearance:(BOOL)a3;
- (void)_setHidesShadow:(BOOL)a3;
- (void)_setItems:(id)a3 transition:(int)a4;
- (void)_setItems:(id)a3 transition:(int)a4 reset:(BOOL)a5;
- (void)_setItemsUpToItem:(id)a3 transition:(int)a4;
- (void)_setNeedsBackgroundViewUpdate;
- (void)_setNeedsStaticNavBarButtonUpdate;
- (void)_setOverrideBackgroundExtension:(double)a3;
- (void)_setPressedButtonItemTextColor:(id)a3 shadowColor:(id)a4;
- (void)_setPrompt:(id)a3;
- (void)_setRequestedMaxBackButtonWidth:(double)a3;
- (void)_setReversesButtonTextShadowOffsetWhenPressed:(BOOL)a3;
- (void)_setShadowAlpha:(double)a3;
- (void)_setShouldFadeStaticNavBarButton:(BOOL)a3;
- (void)_setStaticNavBarButtonItem:(id)a3;
- (void)_setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4;
- (void)_setStaticNavBarButtonLingers:(BOOL)a3;
- (void)_setTabBarHostedView:(id)a3;
- (void)_setTitleOpacity:(double)a3;
- (void)_setUseInlineBackgroundHeightWhenLarge:(BOOL)a3;
- (void)_setWantsHostedTabBarMetrics:(BOOL)a3;
- (void)_setupAXHUDGestureIfNecessary;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4;
- (void)_updateActiveBarMetrics;
- (void)_updateAppearancesForNewVisualProvider;
- (void)_updateBackButtonVisibilityIfTop:(id)a3 animated:(BOOL)a4;
- (void)_updateBackIndicatorImage;
- (void)_updateBarVisibilityForTopItem;
- (void)_updateContentIfTopItem:(id)a3 animated:(BOOL)a4;
- (void)_updateInteractiveTransition:(double)a3;
- (void)_updateNavigationBarItem:(id)a3 forStyle:(int64_t)a4 previousTintColor:(id)a5;
- (void)_updateNavigationBarItemsForStyle:(int64_t)a3;
- (void)_updateNavigationBarItemsForStyle:(int64_t)a3 previousTintColor:(id)a4;
- (void)_updateOpacity;
- (void)_updatePalette:(id)a3;
- (void)_updatePaletteBackgroundIfNecessary;
- (void)_updateSearchBarForPlacementChangeIfApplicable;
- (void)_updateTitleViewIfTop:(id)a3;
- (void)_upgradeAppearanceAPI;
- (void)_willMoveToWindow:(id)a3;
- (void)addConstraint:(id)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)didMoveToWindow;
- (void)drawBackButtonBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4 pressed:(BOOL)a5;
- (void)drawBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)hideButtons;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)popForCarplayPressAtFakePoint:(CGPoint)a3;
- (void)popNavigationItem;
- (void)pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated;
- (void)pushNavigationItem:(id)a3;
- (void)removeConstraint:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage;
- (void)setBackIndicatorTransitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics;
- (void)setBarTintColor:(UIColor *)barTintColor;
- (void)setBounds:(CGRect)a3;
- (void)setButton:(int)a3 enabled:(BOOL)a4;
- (void)setCenter:(CGPoint)a3;
- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance;
- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance;
- (void)setDelegate:(id)delegate;
- (void)setForceFullHeightInLandscape:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setItems:(NSArray *)items;
- (void)setItems:(NSArray *)items animated:(BOOL)animated;
- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes;
- (void)setLocked:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setPrefersLargeTitles:(BOOL)prefersLargeTitles;
- (void)setRefreshControlHost:(id)a3;
- (void)setRequestedContentSize:(int64_t)a3;
- (void)setRightMargin:(double)a3;
- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShadowImage:(UIImage *)shadowImage;
- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes;
- (void)setTitleVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setTitleView:(id)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setTranslucent:(BOOL)translucent;
- (void)showBackButton:(BOOL)a3 animated:(BOOL)a4;
- (void)showButtonsWithLeft:(id)a3 right:(id)a4 leftBack:(BOOL)a5;
- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4;
- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4 leftBack:(BOOL)a5;
- (void)showLeftButton:(id)a3 withStyle:(int)a4 rightButton:(id)a5 withStyle:(int)a6;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updatePrompt;
@end

@implementation UINavigationBar

- (BOOL)_subclassImplementsDrawRect
{
  if (!__drawRectUINavigationBarIMP) {
    __drawRectUINavigationBarIMP = +[UINavigationBar instanceMethodForSelector:sel_drawRect_];
  }
  uint64_t v3 = [(UINavigationBar *)self methodForSelector:sel_drawRect_];
  if (v3) {
    BOOL v4 = v3 == __drawRectUINavigationBarIMP;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    if (a3 == 2 || a3 == 8)
    {
      uint64_t v22 = _UIAppearanceContainerForUserInterfaceIdiom();
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      BOOL v4 = +[UIBarItem appearanceWhenContainedInInstancesOfClasses:v19];

      v5 = objc_msgSend(off_1E52D39B8, "preferredFontForTextStyle:", @"UICTFontTextStyleHeadline", *(void *)off_1E52D2040);
      v21 = v5;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      [v4 setTitleTextAttributes:v6 forState:0];
    }
    else
    {
      if (a3 != 3) {
        return;
      }
      BOOL v4 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:3];
      v5 = +[UIView appearanceForTraitCollection:v4];
      v6 = +[UIBarItem appearanceForTraitCollection:v4];
      v7 = objc_alloc_init(UIImage);
      [v5 setBackgroundImage:v7 forBarMetrics:0];

      v8 = +[UIColor _externalBarBackgroundColor];
      [v5 setBackgroundColor:v8];

      v25[0] = *(void *)off_1E52D2040;
      uint64_t v9 = v25[0];
      v10 = [off_1E52D39B8 systemFontOfSize:17.0];
      v26[0] = v10;
      v25[1] = *(void *)off_1E52D2048;
      v11 = +[UIColor _externalSystemWhiteColor];
      v26[1] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      [v5 setTitleTextAttributes:v12];

      [v5 setTitleVerticalPositionAdjustment:0 forBarMetrics:0.0];
      v13 = +[UIImage _kitImageNamed:@"UINavigationBarBackIndicatorDefault" withTrait:v4];
      v14 = [v13 imageFlippedForRightToLeftLayoutDirection];
      [v5 setBackIndicatorImage:v14];

      v15 = +[UIImage _kitImageNamed:@"UINavigationBarTitleTransitionBackIndicatorMask" withTrait:v4];
      v16 = [v15 imageFlippedForRightToLeftLayoutDirection];
      [v5 setBackIndicatorTransitionMaskImage:v16];

      [v5 _setBackIndicatorLeftMargin:12.0];
      uint64_t v23 = v9;
      v17 = [off_1E52D39B8 systemFontOfSize:17.0];
      v24 = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v6 setTitleTextAttributes:v18 forState:0];
    }
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"filters"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  [(UIView *)&v9 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  objc_super v7 = [(UIView *)self _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  if (v8 != a3 && (a3 == 3 || v8 == 3)) {
    [(UINavigationBar *)self _accessibilityButtonShapesParametersDidChange];
  }
}

- (id)_accessibility_navigationController
{
  v2 = [(UINavigationBar *)self _effectiveDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_effectiveDelegate
{
  uint64_t v3 = [(UINavigationBar *)self topItem];
  id v4 = [(UINavigationBar *)self _effectiveDelegateForItem:v3];

  return v4;
}

- (UINavigationItem)topItem
{
  return [(_UINavigationBarItemStack *)self->_stack topItem];
}

- (id)_effectiveDelegateForItem:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_navbarFlags & 0x40) == 0
    || (id v5 = objc_loadWeakRetained((id *)&self->_delegate),
        [v5 _effectiveDelegateForNavigationItem:v4],
        WeakRetained = objc_claimAutoreleasedReturnValue(),
        v5,
        !WeakRetained))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return WeakRetained;
}

- (BOOL)_effectiveDelegateSupportsScrollEdgeTransitionProgress
{
  return (*(_WORD *)&self->_navbarFlags >> 7) & 1;
}

- (BOOL)prefersLargeTitles
{
  return self->_prefersLargeTitles;
}

- (int64_t)barPosition
{
  return self->_barPosition;
}

- (double)_overrideBackgroundExtension
{
  return self->__overrideBackgroundExtension;
}

- (NSDirectionalEdgeInsets)_resolvedLayoutMargins
{
  p_resolvedLayoutMargins = &self->_resolvedLayoutMargins;
  double leading = self->_resolvedLayoutMargins.leading;
  if (leading == -1.79769313e308 || (double trailing = self->_resolvedLayoutMargins.trailing, trailing == -1.79769313e308))
  {
    [(UIView *)self _rawLayoutMargins];
    BOOL v7 = v6 == -1.79769313e308;
    BOOL v9 = v8 == -1.79769313e308;
    BOOL v10 = [(UIView *)self _shouldReverseLayoutDirection];
    if (v10) {
      BOOL v11 = v7;
    }
    else {
      BOOL v11 = v9;
    }
    if (!v10) {
      BOOL v9 = v7;
    }
    [(UIView *)self directionalLayoutMargins];
    double v13 = v12;
    double v15 = v14;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();
    double v18 = v13;
    double v19 = v15;
    if ((v17 & 1) != 0 && (v9 || v11)) {
      [WeakRetained _layoutMarginsforNavigationBar:self];
    }
    if (v9) {
      double v20 = v18;
    }
    else {
      double v20 = v13;
    }
    p_resolvedLayoutMargins->double leading = v20;
    if (v11) {
      double v21 = v19;
    }
    else {
      double v21 = v15;
    }
    p_resolvedLayoutMargins->double trailing = v21;

    double leading = p_resolvedLayoutMargins->leading;
    double trailing = p_resolvedLayoutMargins->trailing;
  }
  double top = p_resolvedLayoutMargins->top;
  double bottom = p_resolvedLayoutMargins->bottom;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)_resolvedSearchBarMargins
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider resolvedSearchBarMargins];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (BOOL)_forceScrollEdgeAppearance
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider forceScrollEdgeAppearance];
}

- (BOOL)_scrollEdgeAppearanceHasChromelessBehavior
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider scrollEdgeAppearanceHasChromelessBehavior];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UIView *)&v3 layoutMarginsDidChange];
  self->_resolvedLayoutMargins.double trailing = -1.79769313e308;
  self->_resolvedLayoutMargins.double leading = -1.79769313e308;
  [(UINavigationBar *)self setNeedsLayout];
  [(_UINavigationBarVisualProvider *)self->_visualProvider navigationBarInvalidatedResolvedLayoutMargins];
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- ($1AB5FA073B851C12C2339EC22442E995)_layoutHeightsForNavigationItem:(id)a3 fittingWidth:(double)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_visualProvider->_itemForMeasuring, a3);
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider shouldUseHeightRangeFittingWidth])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider layoutHeightsFittingWidth:a4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    -[UINavigationBar sizeThatFits:](self, "sizeThatFits:", a4, 0.0);
    double v13 = v14;
    double v11 = v14;
    double v9 = v14;
  }
  visualProvider = self->_visualProvider;
  itemForMeasuring = visualProvider->_itemForMeasuring;
  visualProvider->_itemForMeasuring = 0;

  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (BOOL)_hasVariableHeight
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider topItemHasVariableHeight];
}

- (BOOL)_hasLegacyProvider
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim];
}

- (BOOL)supportsRefreshControlHosting
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider supportsRefreshControlHosting];
}

- (void)_updatePaletteBackgroundIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__UINavigationBar__updatePaletteBackgroundIfNecessary__block_invoke;
    v4[3] = &unk_1E52DDEB8;
    v4[4] = self;
    [WeakRetained _updatePalettesWithBlock:v4];
  }
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v5, sel__traitCollectionDidChangeOnSubtreeInternal_);
  [(_UINavigationBarVisualProvider *)self->_visualProvider traitCollectionDidChangeOnSubtree:a3->var0];
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self center];
  double v8 = vabdd_f64(y, v7);
  if (vabdd_f64(x, v6) >= 0.00000011920929 || v8 >= 0.00000011920929)
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationBar;
    -[UIView setCenter:](&v10, sel_setCenter_, x, y);
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_updateBackgroundViewIgnoringFlag];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  if ((_UIRectEquivalentToRectWithAccuracy(x, y, width, height, v8, v9, v10, v11, 0.00000011920929) & 1) == 0)
  {
    [(UIView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    v17.receiver = self;
    v17.super_class = (Class)UINavigationBar;
    -[UIView setBounds:](&v17, sel_setBounds_, x, y, width, height);
    if (width != v13 || height != v15) {
      -[UINavigationBar _barSizeDidChange:](self, "_barSizeDidChange:", v13, v15);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  if ((_UIRectEquivalentToRectWithAccuracy(x, y, width, height, v8, v9, v10, v11, 0.00000011920929) & 1) == 0)
  {
    [(UIView *)self frame];
    double v13 = v12;
    double v15 = v14;
    v17.receiver = self;
    v17.super_class = (Class)UINavigationBar;
    -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
    if (width != v13 || height != v15) {
      -[UINavigationBar _barSizeDidChange:](self, "_barSizeDidChange:", v13, v15);
    }
  }
}

- (_UINavigationBarItemStack)_stack
{
  return self->_stack;
}

- (BOOL)isTranslucent
{
  unint64_t barStyle = self->_barStyle;
  double v4 = [(UINavigationBar *)self _effectiveBarTintColor];
  objc_super v5 = [(UIView *)self _screen];
  BOOL IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(barStyle, (uint64_t)v4, v5);

  BOOL v14 = IsTranslucentOnScreen;
  int64_t barTranslucence = self->_barTranslucence;
  if (barTranslucence) {
    return barTranslucence == 1;
  }
  double v8 = [(UIView *)self _screen];
  uint64_t v9 = [v8 _userInterfaceIdiom];

  if (v9 != 3)
  {
    double v10 = self->_appearanceStorage;
    if ([(_UIBarAppearanceStorage *)v10 hasAnyCustomBackgroundImage])
    {
      double v11 = [(UIView *)self _screen];
      double v12 = -[_UINavigationBarAppearanceStorage representativeImageForIdiom:](v10, "representativeImageForIdiom:", [v11 _userInterfaceIdiom]);

      [v12 _isInvisibleAndGetIsTranslucent:&v14];
    }

    return v14;
  }
  return IsTranslucentOnScreen;
}

- (id)_effectiveBarTintColor
{
  double v2 = self->_barTintColor;
  return v2;
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (void)_barSizeDidChange:(CGSize)a3
{
  -[_UINavigationBarVisualProvider recordBarSize:](self->_visualProvider, "recordBarSize:", a3.width, a3.height);
  [(_UINavigationBarVisualProvider *)self->_visualProvider barSizeChanged];
  visualProvider = self->_visualProvider;
  [(_UINavigationBarVisualProvider *)visualProvider _shim_updateBackgroundViewIgnoringFlag];
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_UINavigationBarVisualProvider sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setRefreshControlHost:(id)a3
{
}

- (_UINavigationControllerRefreshControlHost)refreshControlHost
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider refreshControlHost];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UIView *)&v3 safeAreaInsetsDidChange];
  [(_UINavigationBarVisualProvider *)self->_visualProvider safeAreaInsetsDidChange];
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

- (int64_t)_activeBarMetrics
{
  return [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage activeBarMetrics];
}

- (BOOL)_hasFixedMaximumHeight
{
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider wantsLargeTitleDisplayed]) {
    return 0;
  }
  double v4 = [(_UINavigationBarVisualProvider *)self->_visualProvider refreshControlHost];
  BOOL v3 = v4 == 0;

  return v3;
}

- (double)_requestedMaxBackButtonWidth
{
  return self->_requestedMaxBackButtonWidth;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  BOOL v3 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorImage];

  if (v3)
  {
    double v4 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorTransitionMaskImage];
  }
  else
  {
    double v4 = 0;
  }
  return (UIImage *)v4;
}

- (int64_t)_barPosition
{
  return self->_barPosition;
}

- (void)_updateBarVisibilityForTopItem
{
}

- (void)_setBarPosition:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3) {
    int64_t v3 = a3;
  }
  if (self->_barPosition != v3)
  {
    self->_barPosition = v3;
    [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_navbarFlags & 0x10) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v6 = [WeakRetained _freezeLayoutForOrientationChangeOnDismissal],
        WeakRetained,
        (v6 & 1) == 0))
  {
    visualProvider = self->_visualProvider;
    double v8 = [(UINavigationBar *)self topItem];
    uint64_t v9 = [(UINavigationBar *)self backItem];
    [(_UINavigationBarVisualProvider *)visualProvider _shim_updateUserContentGuideForTopItem:v8 backItem:v9];

    v10.receiver = self;
    v10.super_class = (Class)UINavigationBar;
    [(UIView *)&v10 layoutSublayersOfLayer:v4];
  }
}

- (UINavigationItem)backItem
{
  return [(_UINavigationBarItemStack *)self->_stack backItem];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (NSDictionary)largeTitleTextAttributes
{
  return self->_largeTitleTextAttributes;
}

- (NSDictionary)titleTextAttributes
{
  return [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage textAttributes];
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (void)invalidateIntrinsicContentSize
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UIView *)&v3 invalidateIntrinsicContentSize];
  [(_UINavigationBarVisualProvider *)self->_visualProvider invalidateIntrinsicContentSize];
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  BOOL v4 = animated;
  double v12 = items;
  if ([(UINavigationBar *)self isLocked])
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Cannot call %@ directly on a UINavigationBar managed by a controller.", v9 format];
  }
  else
  {
    if (v4)
    {
      objc_super v10 = [(UINavigationBar *)self items];
      uint64_t v11 = [(UINavigationBar *)self _transitionForOldItems:v10 newItems:v12];
    }
    else
    {
      uint64_t v11 = 0;
    }
    [(UINavigationBar *)self _setItems:v12 transition:v11];
  }
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  if ([(UINavigationBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot manually set the delegate on a UINavigationBar managed by a controller."];
  }
  else
  {
    if ((*(_WORD *)&self->_navbarFlags & 0x100) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained != obj) {
        *(_WORD *)&self->_navbarFlags |= 0x200u;
      }
    }
    p_delegate = &self->_delegate;
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 16;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFEF | v7;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFDF | v9;

    id v10 = objc_loadWeakRetained((id *)p_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 64;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFBF | v11;

    id v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFF7F | v13;
  }
}

- (BOOL)isLocked
{
  return (*(_WORD *)&self->_navbarFlags >> 1) & 1;
}

- (void)_setItems:(id)a3 transition:(int)a4
{
}

- (UINavigationBar)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  objc_super v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() _visualProviderForNavigationBar:v3];
    visualProvider = v3->_visualProvider;
    v3->_visualProvider = (_UINavigationBarVisualProvider *)v4;

    id v6 = objc_alloc_init(_UINavigationBarItemStack);
    stack = v3->_stack;
    v3->_stack = v6;

    [(_UINavigationBarVisualProvider *)v3->_visualProvider setStack:v3->_stack];
    [(UINavigationBar *)v3 _updateOpacity];
    [(UINavigationBar *)v3 _commonNavBarInit];
  }
  return v3;
}

- (void)_updateOpacity
{
  int v3 = [(UIView *)self isOpaque];
  int v4 = [(UINavigationBar *)self isTranslucent];
  if (v3 == v4)
  {
    [(UIView *)self setOpaque:v4 ^ 1u];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained navigationBarDidChangeOpacity:self];
    }
  }
}

- (void)_setItems:(id)a3 transition:(int)a4 reset:(BOOL)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = v8;
  if (a5)
  {
    id v10 = [(_UINavigationBarItemStack *)self->_stack items];

    __int16 v11 = 0;
    BOOL v12 = 1;
    goto LABEL_10;
  }
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  if (![(_UINavigationBarItemStack *)self->_stack stackItemsAreEqualTo:v10])
  {
    __int16 v11 = [(_UINavigationBarItemStack *)self->_stack items];
    BOOL v12 = [(UINavigationBar *)self _didVisibleItemsChangeWithNewItems:v10 oldItems:v11]|| (a4 - 3) < 0xFFFFFFFE;
LABEL_10:
    BOOL v62 = v12;
    if (a4 != 2)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v87 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v81 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v80 + 1) + 8 * i) _setNavigationBar:0];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v80 objects:v87 count:16];
        }
        while (v15);
      }
    }
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v10 = v10;
    uint64_t v18 = [v10 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v77 != v20) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v76 + 1) + 8 * j) _setNavigationBar:self];
        }
        uint64_t v19 = [v10 countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v19);
    }

    uint64_t v22 = [(UINavigationBar *)self _effectiveDelegate];
    uint64_t v23 = (void *)v22;
    if (a4 == 1)
    {
      v24 = +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:self delegate:v22 crossfade:0];
      [(_UINavigationBarItemStack *)self->_stack setItems:v10 withTransitionAssistant:v24];
      [(_UINavigationBarVisualProvider *)self->_visualProvider prepareForPush];
      v25 = [(_UINavigationBarItemStack *)self->_stack previousBackItem];
      [v25 _setNavigationBar:self];

      goto LABEL_30;
    }
    if (a4 == 2)
    {
      v24 = +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:self delegate:v22 crossfade:0];
      [(_UINavigationBarItemStack *)self->_stack setItems:v10 withTransitionAssistant:v24];
      [(_UINavigationBarVisualProvider *)self->_visualProvider prepareForPop];
LABEL_30:

      [(UINavigationBar *)self _barStyle];
      BOOL v26 = [(UINavigationBar *)self _isAnimationEnabled];
      if (v26 && (visualProvider = self->_visualProvider) != 0) {
        int v28 = ![(_UINavigationBarVisualProvider *)visualProvider allowsUserInteractionDuringTransitions];
      }
      else {
        int v28 = 0;
      }
      if (a4 == 1)
      {
        if (v28) {
          [(UIView *)self setUserInteractionEnabled:0];
        }
        if (objc_opt_respondsToSelector()) {
          [v23 _navigationBarDidUpdateStack:self];
        }
        v29 = self->_visualProvider;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke_2;
        v64[3] = &unk_1E52DDF30;
        v64[4] = self;
        [(_UINavigationBarVisualProvider *)v29 pushAnimated:v26 completion:v64];
      }
      else
      {
        if (v28) {
          [(UIView *)self setUserInteractionEnabled:0];
        }
        v30 = self->_visualProvider;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke_3;
        v63[3] = &unk_1E52DDF30;
        v63[4] = self;
        [(_UINavigationBarVisualProvider *)v30 popAnimated:v26 completion:v63];
        if (objc_opt_respondsToSelector()) {
          [v23 _navigationBarDidUpdateStack:self];
        }
      }
      v31 = [(_UINavigationBarItemStack *)self->_stack topItem];
      [v31 _updateViewsForBarSizeChangeAndApply:0];
      [(_UINavigationBarVisualProvider *)self->_visualProvider updateTopNavigationItemAnimated:v26];

LABEL_45:
      v32 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
      [v32 finishTrackingInteractiveTransition];

      goto LABEL_46;
    }
    v61 = (void *)v22;
    [(_UINavigationBarItemStack *)self->_stack setItems:v10 withTransitionAssistant:0];
    [(_UINavigationBarVisualProvider *)self->_visualProvider prepareForStackChange];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v33 = v11;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v73 != v36) {
            objc_enumerationMutation(v33);
          }
          [(_UINavigationBarVisualProvider *)self->_visualProvider removeContentForItem:*(void *)(*((void *)&v72 + 1) + 8 * k)];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v35);
    }
    BOOL v60 = a5;

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v38 = v10;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v68 objects:v84 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v69 != v41) {
            objc_enumerationMutation(v38);
          }
          [(_UINavigationBarVisualProvider *)self->_visualProvider removeContentForItem:*(void *)(*((void *)&v68 + 1) + 8 * m)];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v68 objects:v84 count:16];
      }
      while (v40);
    }

    v43 = [v33 lastObject];
    v44 = [v43 _searchControllerIfAllowed];
    v45 = [(_UINavigationBarItemStack *)self->_stack topItem];
    uint64_t v46 = [v45 _searchControllerIfAllowed];
    if (v44 == (void *)v46)
    {
      v47 = v44;
    }
    else
    {
      v47 = (void *)v46;
      v59 = v11;
      v48 = [(_UINavigationBarItemStack *)self->_stack backItem];
      uint64_t v49 = [v48 _searchControllerIfAllowed];
      if (v44 == (void *)v49)
      {

        __int16 v11 = v59;
      }
      else
      {
        v50 = (void *)v49;
        [(_UINavigationBarItemStack *)self->_stack items];
        v58 = v44;
        v52 = v51 = v43;
        char v57 = [v52 containsObject:v51];

        v43 = v51;
        v44 = v58;

        __int16 v11 = v59;
        if (v57) {
          goto LABEL_73;
        }
        if ([v58 isActive])
        {
          v53 = [(UIView *)self _viewControllerForAncestor];
          v54 = [v53 _splitViewControllerEnforcingClass:1];

          if (!v54 || ([v54 _isExpanding] & 1) == 0)
          {
            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            v65[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke;
            v65[3] = &unk_1E52D9F98;
            id v66 = v58;
            id v67 = v43;
            +[UIView performWithoutAnimation:v65];
          }
        }
        v45 = [v58 searchBar];
        v47 = [v45 _viewStackedInNavigationBar];
        [v47 removeFromSuperview];
      }
    }

LABEL_73:
    int64_t v55 = [(UINavigationBar *)self _barStyle];
    if (v62)
    {
      int64_t v56 = v55;
      [(UINavigationBar *)self _disableAnimation];
      [(UINavigationBar *)self _setBarStyle:v56];
      [(_UINavigationBarVisualProvider *)self->_visualProvider setupTopNavigationItem];
      [(UINavigationBar *)self setNeedsLayout];
      [(UINavigationBar *)self _enableAnimation];
      [(_UINavigationBarItemStack *)self->_stack completeOperation];
      [(UINavigationBar *)self _accessibility_navigationBarContentsDidChange];
      uint64_t v23 = v61;
      if (!v60 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v61 _navigationBarDidUpdateStack:self];
      }
    }
    else
    {
      uint64_t v23 = v61;
    }
    goto LABEL_45;
  }
LABEL_46:
}

- (void)setNeedsLayout
{
  if ((*(_WORD *)&self->_navbarFlags & 8) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)UINavigationBar;
    [(UIView *)&v2 setNeedsLayout];
  }
}

- (void)_setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_unint64_t barStyle = a3;
    [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
    [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
    int v4 = [(UINavigationBar *)self _effectiveBarTintColor];

    if (!v4)
    {
      [(UINavigationBar *)self _updateNavigationBarItemsForStyle:[(UINavigationBar *)self _currentBarStyle]];
      [(UINavigationBar *)self _updateOpacity];
      [(UIView *)self setNeedsDisplay];
      [(UINavigationBar *)self _updatePaletteBackgroundIfNecessary];
      [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
    }
    [(UINavigationBar *)self _sendNavigationBarDidChangeStyle];
  }
}

- (void)_enableAnimation
{
}

- (void)_disableAnimation
{
}

- (int64_t)_barStyle
{
  return self->_barStyle;
}

- (BOOL)_didVisibleItemsChangeWithNewItems:(id)a3 oldItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 count];
  int v8 = [v5 count];
  int v9 = v8;
  if (v7 <= 1) {
    int v10 = 1;
  }
  else {
    int v10 = v7;
  }
  if (v8 <= 1) {
    int v11 = 1;
  }
  else {
    int v11 = v8;
  }
  if (v10 == v11)
  {
    BOOL v12 = [v6 lastObject];
    id v13 = [v5 lastObject];

    BOOL v14 = v12 == v13;
    BOOL v15 = v12 != v13;
    if (v14 && v7 >= 2)
    {
      uint64_t v16 = [v6 objectAtIndexedSubscript:(v7 - 2)];
      objc_super v17 = [v5 objectAtIndexedSubscript:v9 - 2];
      BOOL v15 = v16 != v17;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

+ (id)_visualProviderForNavigationBar:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForNavigationBar:", v4)), "initWithNavigationBar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForNavigationBar:(id)a3
{
  id v3 = a3;
  if (([(id)objc_opt_class() _requiresModernVisualProvider] & 1) != 0
    || ([(id)objc_opt_class() _forceLegacyVisualProvider] & 1) == 0)
  {
    id v4 = [v3 traitCollection];
    [v4 userInterfaceIdiom];
  }
  id v5 = objc_opt_class();

  return (Class)v5;
}

+ (BOOL)_requiresModernVisualProvider
{
  return 0;
}

+ (BOOL)_forceLegacyVisualProvider
{
  return _UIUseModernBars() ^ 1;
}

- (BOOL)_lostNavigationControllerDelegate
{
  return (*(_WORD *)&self->_navbarFlags >> 9) & 1;
}

- (void)_upgradeAppearanceAPI
{
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider appearanceAPIVersion] <= 1)
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider setAppearanceAPIVersion:2];
    if ([(_UINavigationBarVisualProvider *)self->_visualProvider appearanceAPIVersion] != 2)
    {
      id v4 = [(UIView *)self window];

      if (v4)
      {
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        id v5 = [(UIView *)self traitCollection];
        id v6 = _NSStringFromUIUserInterfaceIdiom([v5 userInterfaceIdiom]);
        [v7 handleFailureInMethod:a2, self, @"UINavigationBar.m", 911, @"New Bar Appearance API is not supported in this configuration. Are you using a legacy navigation bar? Idiom: %@, Navigation bar: %@", v6, self object file lineNumber description];
      }
    }
  }
}

- (void)_commonNavBarInit
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINavigationBar *)self _isAlwaysHidden];
  if (!self->_barPosition) {
    self->_barPosition = 2;
  }
  if (!v3)
  {
    -[_UINavigationBarVisualProvider _shim_setUseContentView:](self->_visualProvider, "_shim_setUseContentView:", [(id)objc_opt_class() _supportsCanvasView]);
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__accessibilityButtonShapesDidChangeNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];
  }
  *(_OWORD *)&self->_resolvedLayoutMargins.double top = xmmword_186B93660;
  *(_OWORD *)&self->_resolvedLayoutMargins.double bottom = xmmword_186B93660;
  [(_UINavigationBarVisualProvider *)self->_visualProvider prepare];
  if (self->_standardAppearance) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = _UIBarAppearanceAPIVersion();
  }
  [(_UINavigationBarVisualProvider *)self->_visualProvider setAppearanceAPIVersion:v5];
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider appearanceAPIVersion] >= 2) {
    [(UINavigationBar *)self _installDefaultAppearance];
  }
  [(UINavigationBar *)self _setupAXHUDGestureIfNecessary];
  v9[0] = 0x1ED3F5A30;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(UIView *)self _registerForTraitTokenChanges:v6 withTarget:self action:sel__setupAXHUDGestureIfNecessary];

  int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__largeContentViewerEnabledStatusDidChange_ name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)UINavigationBar;
  [(UIView *)&v22 layoutSubviews];
  if (![(UINavigationBar *)self _isAlwaysHidden])
  {
    id v4 = [(_UINavigationBarItemStack *)self->_stack topItem];
    uint64_t v5 = [v4 _navigationBar];

    if ([(UIView *)self isHidden])
    {
      if (v5 != self && v5 != 0) {
        goto LABEL_29;
      }
    }
    if (v5 == self || v5 == 0)
    {
LABEL_13:
      [(_UINavigationBarVisualProvider *)self->_visualProvider _shim];
      if (![(_UINavigationBarItemStack *)self->_stack state])
      {
        *(_WORD *)&self->_navbarFlags |= 8u;
        if ([(_UINavigationBarVisualProvider *)self->_visualProvider _shim]) {
          [(UINavigationBar *)self _updateActiveBarMetrics];
        }
        [(_UINavigationBarVisualProvider *)self->_visualProvider layoutSubviews];
        *(_WORD *)&self->_navbarFlags &= ~8u;
      }
      goto LABEL_29;
    }
    uint64_t v8 = [(UIView *)self window];
    if (v8)
    {
      int v9 = (void *)v8;
      int v10 = [(UIView *)v5 window];
      if (v10)
      {
      }
      else
      {
        char v11 = dyld_program_sdk_at_least();

        if ((v11 & 1) == 0) {
          goto LABEL_13;
        }
      }
    }
    else if (!dyld_program_sdk_at_least())
    {
      goto LABEL_13;
    }
    if (_UIIsPrivateMainBundle())
    {
      if (os_variant_has_internal_diagnostics())
      {
        BOOL v14 = __UIFaultDebugAssertLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          goto LABEL_28;
        }
        BOOL v15 = [(_UINavigationBarItemStack *)self->_stack topItem];
        *(_DWORD *)buf = 138412802;
        v24 = self;
        __int16 v25 = 2112;
        BOOL v26 = v15;
        __int16 v27 = 2112;
        int v28 = v5;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Skipping layout for visible navigation bar, %@, because the top item's navigation bar doesn't match.  topIteuint64_t m = %@, topItem's navigation bar = %@", buf, 0x20u);
      }
      else
      {
        BOOL v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25AEA8) + 8);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
LABEL_29:

          return;
        }
        stacuint64_t k = self->_stack;
        BOOL v14 = v12;
        BOOL v15 = [(_UINavigationBarItemStack *)stack topItem];
        *(_DWORD *)buf = 138412802;
        v24 = self;
        __int16 v25 = 2112;
        BOOL v26 = v15;
        __int16 v27 = 2112;
        int v28 = v5;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Skipping layout for visible navigation bar, %@, because the top item's navigation bar doesn't match.  topIteuint64_t m = %@, topItem's navigation bar = %@", buf, 0x20u);
      }

LABEL_28:
      goto LABEL_29;
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v17 = [(_UINavigationBarItemStack *)self->_stack topItem];
      [v16 handleFailureInMethod:a2, self, @"UINavigationBar.m", 3895, @"Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topIteuint64_t m = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers.", self, v17, v5 object file lineNumber description];

      goto LABEL_13;
    }
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v20 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_37;
      }
      double v21 = [(_UINavigationBarItemStack *)self->_stack topItem];
      *(_DWORD *)buf = 138412802;
      v24 = self;
      __int16 v25 = 2112;
      BOOL v26 = v21;
      __int16 v27 = 2112;
      int v28 = v5;
      _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topIteuint64_t m = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers. This mismatch may cause a layout feedback loop. This will become an assert in a future version.", buf, 0x20u);
    }
    else
    {
      uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25AEB0) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v19 = self->_stack;
      uint64_t v20 = v18;
      double v21 = [(_UINavigationBarItemStack *)v19 topItem];
      *(_DWORD *)buf = 138412802;
      v24 = self;
      __int16 v25 = 2112;
      BOOL v26 = v21;
      __int16 v27 = 2112;
      int v28 = v5;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topIteuint64_t m = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers. This mismatch may cause a layout feedback loop. This will become an assert in a future version.", buf, 0x20u);
    }

LABEL_37:
    goto LABEL_13;
  }
}

- (BOOL)_isAlwaysHidden
{
  return 0;
}

+ (BOOL)_supportsCanvasView
{
  return dyld_program_sdk_at_least();
}

- (void)_setupAXHUDGestureIfNecessary
{
  if (!self->_axHUDGestureManager)
  {
    if (dyld_program_sdk_at_least())
    {
      BOOL v3 = [(UIView *)self traitCollection];
      int v4 = [v3 _isLargeContentViewerEnabled];

      if (v4)
      {
        uint64_t v5 = [[UIAccessibilityHUDGestureManager alloc] initWithView:self delegate:self];
        axHUDGestureManager = self->_axHUDGestureManager;
        self->_axHUDGestureManager = v5;
      }
    }
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  unint64_t v8 = backgroundImage;
  int v9 = (void *)v8;
  if (barPosition == 4)
  {
    if (byte_1EB25AE81) {
      goto LABEL_23;
    }
    byte_1EB25AE81 = 1;
    int v10 = "UIBarPositionBottomAttached";
    goto LABEL_7;
  }
  if (barPosition == UIBarPositionBottom)
  {
    if (_MergedGlobals_41) {
      goto LABEL_23;
    }
    _MergedGlobals_41 = 1;
    int v10 = "UIBarPositionBottom";
LABEL_7:
    id v18 = (id)v8;
    NSLog(&cfstr_SCustomization_0.isa, "UINavigationBar", @"background image", v10);
LABEL_21:
    int v9 = v18;
    goto LABEL_23;
  }
  appearanceStorage = self->_appearanceStorage;
  if (v8 | (unint64_t)appearanceStorage)
  {
    id v18 = (id)v8;
    if (!appearanceStorage)
    {
      BOOL v12 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      id v13 = self->_appearanceStorage;
      self->_appearanceStorage = v12;

      int v9 = v18;
    }
    if (([v9 _isResizable] & 1) == 0)
    {
      [v18 size];
      if (v14 > 1.0)
      {
        uint64_t v15 = objc_msgSend(v18, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

        id v18 = (id)v15;
      }
    }
    if ((unint64_t)(barMetrics - 101) >= 2) {
      UIBarMetrics v16 = UIBarMetricsDefault;
    }
    else {
      UIBarMetrics v16 = barMetrics;
    }
    if ((unint64_t)barMetrics >= 2) {
      barMetrics = v16;
    }
    id v17 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:barPosition barMetrics:barMetrics];

    int v9 = v18;
    if (v18 != v17)
    {
      [(_UIBarAppearanceStorage *)self->_appearanceStorage setBackgroundImage:v18 forBarPosition:barPosition barMetrics:barMetrics];
      [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
      -[UIView _updateNeedsDisplayOnBoundsChange](self);
      [(UINavigationBar *)self _sendNavigationBarDidChangeStyle];
      goto LABEL_21;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_23:
}

- (void)_sendNavigationBarDidChangeStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    int v4 = v6;
    if (v5)
    {
      [v6 _navigationBarDidChangeStyle:self];
      int v4 = v6;
    }
  }
}

- (void)setShadowImage:(UIImage *)shadowImage
{
  unint64_t v4 = shadowImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    id v6 = (void *)v4;
    id v13 = (id)v4;
    if (!appearanceStorage)
    {
      id v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      unint64_t v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      id v6 = v13;
    }
    if (([v6 _isResizable] & 1) == 0)
    {
      [v13 size];
      if (v9 > 1.0)
      {
        uint64_t v10 = objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

        id v13 = (id)v10;
      }
    }
    id v11 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage shadowImage];

    BOOL v12 = v13;
    if (v13 != v11)
    {
      [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setShadowImage:v13];
      [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
      BOOL v12 = v13;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
}

- (void)_setHidesShadow:(BOOL)a3
{
  BOOL v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    id v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    id v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  if ([(_UINavigationBarAppearanceStorage *)appearanceStorage hidesShadow] != v3)
  {
    [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setHidesShadow:v3];
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider changeAppearance];
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  id v6 = [(UIView *)self traitCollection];
  id v7 = [(_UINavigationBarVisualProvider *)visualProvider traitCollectionForChild:v5 baseTraitCollection:v6];

  return v7;
}

- (UIBarStyle)barStyle
{
  return self->_barStyle;
}

- (UIImage)shadowImage
{
  return [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage shadowImage];
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (BOOL)_hidesShadow
{
  return [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage hidesShadow];
}

- (void)_getBackgroundImage:(id *)a3 shouldRespectOversizedBackgroundImage:(BOOL *)a4 actualBarMetrics:(int64_t *)a5 actualBarPosition:(int64_t *)a6
{
  int64_t v11 = [(UINavigationBar *)self _activeBarMetrics];
  int64_t v12 = [(UINavigationBar *)self _barPosition];
  if (dyld_program_sdk_at_least())
  {
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v12 barMetrics:v11];
    if (v13)
    {
LABEL_3:
      int64_t v14 = v12;
      goto LABEL_30;
    }
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:v11];
    if (v13)
    {
      int64_t v14 = 0;
      goto LABEL_30;
    }
    switch(v11)
    {
      case 0:
LABEL_49:
        id v13 = 0;
        goto LABEL_3;
      case 102:
        uint64_t v24 = 1;
        id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v12 barMetrics:1];
        if (v13) {
          goto LABEL_3;
        }
        break;
      case 101:
        id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v12 barMetrics:0];
        if (v13) {
          goto LABEL_3;
        }
        uint64_t v24 = 0;
        break;
      default:
LABEL_50:
        id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v12 barMetrics:0];
        int64_t v14 = v12;
        if (!v13)
        {
          id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:0];
          if (v13) {
            int64_t v14 = 0;
          }
          else {
            int64_t v14 = v12;
          }
        }
        goto LABEL_30;
    }
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:v24];
    int64_t v14 = 0;
    if (v13) {
      goto LABEL_30;
    }
    if (v11 == 101) {
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  __int16 v25 = a3;
  int64_t v26 = v11;
  [(UIView *)self bounds];
  BOOL v16 = v15 == 54.0 || v15 == 74.0;
  BOOL v17 = v15 == 54.0 || v15 <= 32.0;
  int64_t v18 = [(UINavigationBar *)self _barPosition];
  uint64_t v19 = 102;
  if (!v16) {
    uint64_t v19 = 1;
  }
  uint64_t v20 = 101;
  if (!v16) {
    uint64_t v20 = 0;
  }
  if (v17) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v20;
  }
  id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v18 barMetrics:v21];
  if (v18 == 3 && !v13)
  {
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:v21];
  }
  if (v13) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v16;
  }
  if (v22)
  {
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v18 barMetrics:v17];
  }
  if (!v13)
  {
    id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:v21];
    if (!v13)
    {
      id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:v18 barMetrics:0];
      a3 = v25;
      int64_t v11 = v26;
      if (!v13)
      {
        id v13 = [(_UIBarAppearanceStorage *)self->_appearanceStorage backgroundImageForBarPosition:0 barMetrics:0];
      }
      goto LABEL_3;
    }
  }
  int64_t v14 = v12;
  a3 = v25;
  int64_t v11 = v26;
LABEL_30:
  id v23 = v13;
  *a3 = v23;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = v11;
  }
  if (a6) {
    *a6 = v14;
  }
}

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (UINavigationBarAppearance)standardAppearance
{
  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    [(UINavigationBar *)self _installDefaultAppearance];
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UIView *)&v3 updateConstraints];
  [(_UINavigationBarVisualProvider *)self->_visualProvider updateConstraints];
}

- (void)_redisplayItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  stacuint64_t k = self->_stack;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __34__UINavigationBar__redisplayItems__block_invoke;
  v18[3] = &unk_1E52DDF58;
  id v5 = v3;
  id v19 = v5;
  [(_UINavigationBarItemStack *)stack iterateEntries:v18];
  [(UINavigationBar *)self _setItems:0 transition:0 reset:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int64_t v12 = objc_msgSend(v11, "item", (void)v14);
        id v13 = [v12 _stackEntry];
        [v13 updateStateFromCounterpart:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)setLocked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFFD | v3;
}

- (NSArray)items
{
  return [(_UINavigationBarItemStack *)self->_stack items];
}

uint64_t __34__UINavigationBar__redisplayItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)setItems:(NSArray *)items
{
}

void __26__UINavigationBar_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  __int16 v3 = [v5 _navigationBar];
  unint64_t v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    [v5 _removeTitleAndButtonViews];
    [v5 _setNavigationBar:0];
  }
}

void __36__UINavigationBar__setDecodedItems___block_invoke_2(uint64_t a1, void *a2)
{
  __int16 v3 = *(void **)(*(void *)(a1 + 32) + 472);
  id v4 = a2;
  [v3 removeContentForItem:v4];
  [v4 _setNavigationBar:*(void *)(a1 + 32)];
}

void __36__UINavigationBar__setDecodedItems___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 472);
  id v3 = a2;
  [v2 removeContentForItem:v3];
  [v3 _setNavigationBar:0];
}

- (void)setTintColor:(UIColor *)tintColor
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UIView *)&v3 setTintColor:tintColor];
}

- (void)_setStaticNavBarButtonLingers:(BOOL)a3
{
}

- (void)_setNeedsStaticNavBarButtonUpdate
{
}

- (void)_setStaticNavBarButtonItem:(id)a3
{
}

- (UIView)_backgroundView
{
  return (UIView *)[(_UINavigationBarVisualProvider *)self->_visualProvider _shim_compatibilityBackgroundView];
}

- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance
{
  id v4 = scrollEdgeAppearance;
  id v5 = self->_scrollEdgeAppearance;
  id v6 = v4;
  long long v17 = v6;
  if (v5 == v6)
  {

LABEL_17:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    goto LABEL_18;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v8 = self->_scrollEdgeAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  uint64_t v9 = [(UIBarAppearance *)v17 copy];
  uint64_t v10 = self->_scrollEdgeAppearance;
  self->_scrollEdgeAppearance = v9;

  [(UINavigationBar *)self _installDefaultAppearance];
  int64_t v11 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  int64_t v12 = self->_scrollEdgeAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, v11);
  }

  if (!_UIBarsApplyChromelessEverywhere()) {
    goto LABEL_17;
  }
  id v13 = [(_UINavigationBarVisualProvider *)self->_visualProvider stack];
  long long v14 = [v13 topEntry];
  long long v15 = [v14 activeLayout];
  if (!v15)
  {

    goto LABEL_17;
  }
  double v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  [(UINavigationBar *)self _upgradeAppearanceAPI];
  if (v16 == 1.0) {
    [(UINavigationBar *)self setNeedsLayout];
  }
LABEL_18:
}

- (UIImage)backIndicatorImage
{
  objc_super v3 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorTransitionMaskImage];

  if (v3)
  {
    id v4 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorImage];
  }
  else
  {
    id v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)_installDefaultAppearance
{
  if (!self->_standardAppearance)
  {
    objc_super v3 = [UINavigationBarAppearance alloc];
    id v4 = [(UIView *)self traitCollection];
    id v5 = -[UIBarAppearance initWithIdiom:](v3, "initWithIdiom:", [v4 userInterfaceIdiom]);
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v5;

    BOOL v7 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
    uint64_t v8 = self->_standardAppearance;
    if (v8)
    {
      uint64_t v9 = v7;
      objc_storeWeak((id *)&v8->super._changeObserver, v7);
      BOOL v7 = v9;
    }
  }
}

- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance
{
  id v4 = standardAppearance;
  id v5 = self->_standardAppearance;
  id v6 = v4;
  long long v17 = v6;
  if (v5 == v6)
  {

LABEL_16:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    goto LABEL_17;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v8 = self->_standardAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  uint64_t v9 = [(UIBarAppearance *)v17 copy];
  uint64_t v10 = self->_standardAppearance;
  self->_standardAppearance = v9;

  [(UINavigationBar *)self _installDefaultAppearance];
  int64_t v11 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  int64_t v12 = self->_standardAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, v11);
  }

  if (!_UIBarsApplyChromelessEverywhere()) {
    goto LABEL_16;
  }
  id v13 = [(_UINavigationBarVisualProvider *)self->_visualProvider stack];
  long long v14 = [v13 topEntry];
  long long v15 = [v14 activeLayout];
  if (v15)
  {
    double v16 = v15[36];

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    if (v16 == 1.0) {
      goto LABEL_17;
    }
  }
  else
  {

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
  }
  [(UINavigationBar *)self setNeedsLayout];
LABEL_17:
}

- (void)_displayItemsKeepingOwningNavigationBar:(id)a3
{
}

- (void)_sendNavigationBarResize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _navigationBarChangedSize:self];
  }
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  uint64_t v8 = barTintColor;
  BOOL v5 = [(UIColor *)v8 isEqual:self->_barTintColor];
  id v6 = v8;
  if (!v5 && self->_barTintColor != v8)
  {
    BOOL v7 = [(UINavigationBar *)self _effectiveBarTintColor];
    objc_storeStrong((id *)&self->_barTintColor, barTintColor);
    [(UINavigationBar *)self _effectiveBarTintColorDidChangeWithPreviousColor:v7];

    id v6 = v8;
  }
}

- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3
{
  id v6 = a3;
  id v4 = [(UINavigationBar *)self _effectiveBarTintColor];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    [(UINavigationBar *)self _propagateEffectiveBarTintColorWithPreviousColor:v6];
  }
  if (![(UINavigationBar *)self isTranslucent]) {
    [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
  }
}

- (void)_propagateEffectiveBarTintColorWithPreviousColor:(id)a3
{
  id v4 = a3;
  [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
  [(UINavigationBar *)self _updateNavigationBarItemsForStyle:[(UINavigationBar *)self _currentBarStyle] previousTintColor:v4];

  [(UIView *)self setNeedsDisplay];
}

- (void)setTranslucent:(BOOL)translucent
{
  int64_t barTranslucence = self->_barTranslucence;
  int64_t v4 = 1;
  if (!translucent) {
    int64_t v4 = 2;
  }
  self->_int64_t barTranslucence = v4;
  if (barTranslucence != v4)
  {
    int64_t barStyle = self->_barStyle;
    if (translucent || barStyle != 2)
    {
      if (barStyle != 1)
      {
LABEL_12:
        [(UINavigationBar *)self _updateOpacity];
        [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
        [(UIView *)self setNeedsDisplay];
        [(UINavigationBar *)self _updatePaletteBackgroundIfNecessary];
        return;
      }
    }
    else
    {
      self->_int64_t barStyle = 1;
    }
    if (translucent) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(UINavigationBar *)self _updateNavigationBarItemsForStyle:v7];
    goto LABEL_12;
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)UINavigationBar;
  -[UIView _didMoveFromWindow:toWindow:](&v20, sel__didMoveFromWindow_toWindow_, a3);
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[UINavigationBar _setBarPosition:](self, "_setBarPosition:", [WeakRetained positionForBar:self]);
    }
    uint64_t v7 = [a4 screen];
    [v7 scale];
    double v9 = v8;
    uint64_t v10 = [(UIView *)self layer];
    [v10 setRasterizationScale:v9];

    [(UINavigationBar *)self _setNeedsBackgroundViewUpdate];
    [(UINavigationBar *)self _configurePaletteConstraintsIfNecessary];
    int64_t v11 = [(_UINavigationBarVisualStyle *)self->_visualStyle idiom];
    if (v11 != [v7 _userInterfaceIdiom])
    {
      visualStyle = self->_visualStyle;
      self->_visualStyle = 0;
    }
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_updateBackIndicator];
    id v13 = [(_UINavigationBarItemStack *)self->_stack topItem];
    long long v14 = [v13 _searchControllerIfAllowed];
    long long v15 = [v14 searchBar];
    objc_msgSend(v15, "_setHostedInlineByNavigationBar:", objc_msgSend(v13, "_hasInlineSearchBar"));

    if (dyld_program_sdk_at_least())
    {
      os_variant_has_internal_diagnostics();
      double v16 = +[UITraitCollection _currentTraitCollectionIfExists]();
      long long v17 = [(UIView *)self traitCollection];
      +[UITraitCollection setCurrentTraitCollection:v17];

      int64_t v18 = (void *)_UISetCurrentFallbackEnvironment(self);
      [(UINavigationBar *)self traitCollectionDidChange:0];
      _UIRestorePreviousFallbackEnvironment(v18);
      +[UITraitCollection setCurrentTraitCollection:v16];
    }
  }
  else
  {
    if (!self->_visualStyle) {
      return;
    }
    id v19 = [(UINavigationBar *)self currentBackButton];
    [v19 setPressed:0];

    id v13 = self->_visualStyle;
    self->_visualStyle = 0;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UINavigationBar;
  [(UIView *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceIdiom];
  id v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v5 == v7)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = [(id)objc_opt_class() _visualProviderForNavigationBar:self];
    p_visualProvider = &self->_visualProvider;
    if (([v8 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      BOOL v10 = [(UINavigationBar *)self isLocked];
      [(_UINavigationBarVisualProvider *)*p_visualProvider teardown];
      objc_storeStrong((id *)&self->_visualProvider, v8);
      BOOL v11 = [(UINavigationBar *)self _isAlwaysHidden];
      [(UINavigationBar *)self _updateOpacity];
      if (!v11) {
        -[_UINavigationBarVisualProvider _shim_setUseContentView:](*p_visualProvider, "_shim_setUseContentView:", [(id)objc_opt_class() _supportsCanvasView]);
      }
      [(_UINavigationBarVisualProvider *)*p_visualProvider prepare];
      [(_UINavigationBarVisualProvider *)*p_visualProvider setStack:self->_stack];
      [(_UINavigationBarVisualProvider *)*p_visualProvider updateTopNavigationItemAnimated:0];
      [(_UINavigationBarVisualProvider *)*p_visualProvider updateTopNavigationItemTitleView];
      [(UINavigationBar *)self _updateAppearancesForNewVisualProvider];
      [(UINavigationBar *)self setLocked:v10];
      [(UINavigationBar *)self setNeedsLayout];
      [(UIView *)self layoutIfNeeded];
    }
  }
  [(_UINavigationBarVisualProvider *)self->_visualProvider traitCollectionDidChange:v4];
}

- (void)_setNeedsBackgroundViewUpdate
{
  if (![(UIView *)self _isInLayoutSubviews])
  {
    [(UINavigationBar *)self setNeedsLayout];
  }
}

- (void)_configurePaletteConstraintsIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _updatePaletteConstraints];
  }
}

- (void)_addItem:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  [(UINavigationBar *)self setLocked:0];
  id v7 = [(_UINavigationBarItemStack *)self->_stack topItem];

  if (v7 != v8) {
    [(UINavigationBar *)self _pushNavigationItem:v8 transition:v5];
  }
  [(UINavigationBar *)self setLocked:1];
}

- (void)_pushNavigationItem:(id)a3 transition:(int)a4
{
  id v6 = a3;
  self->_currentPushTransition = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__UINavigationBar__pushNavigationItem_transition___block_invoke;
  v8[3] = &unk_1E52DDF08;
  v8[4] = self;
  id v9 = v6;
  int v10 = a4;
  id v7 = v6;
  [(UINavigationBar *)self _performUpdatesIgnoringLock:v8];
}

- (void)_performUpdatesIgnoringLock:(id)a3
{
  __int16 v4 = *(_WORD *)&self->_navbarFlags & 2;
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFF9 | 4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFF9 | v4;
}

uint64_t __50__UINavigationBar__pushNavigationItem_transition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushNavigationItem:*(void *)(a1 + 40) animated:*(_DWORD *)(a1 + 48) != 0];
}

- (void)pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated
{
  BOOL v4 = animated;
  int v10 = item;
  if ([(UINavigationBar *)self isLocked])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    id v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Cannot call %@ directly on a UINavigationBar managed by a controller.", v9 format];
  }
  else
  {
    if ((*(_WORD *)&self->_navbarFlags & 4) == 0) {
      self->_currentPushTransition = v4;
    }
    [(UINavigationBar *)self _pushNavigationItemUsingCurrentTransition:v10];
  }
}

- (void)_pushNavigationItemUsingCurrentTransition:(id)a3
{
  id v4 = a3;
  int currentPushTransition = self->_currentPushTransition;
  id v8 = v4;
  if (currentPushTransition)
  {
    id v6 = [(UINavigationBar *)self _effectiveDelegateForItem:v4];
    id v7 = +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:self delegate:v6 crossfade:currentPushTransition == 6];
  }
  else
  {
    [(UINavigationBar *)self _disableAnimation];
    id v7 = 0;
  }
  [(UINavigationBar *)self _pushNavigationItem:v8 transitionAssistant:v7];
  [v8 _updateViewsForBarSizeChangeAndApply:0];
  if (![(UINavigationBar *)self _isAlwaysHidden])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider updateTopNavigationItemAnimated:[(UINavigationBar *)self _isAnimationEnabled]];
    [(UINavigationBar *)self updatePrompt];
  }
  if (!currentPushTransition) {
    [(UINavigationBar *)self _enableAnimation];
  }
}

- (void)updatePrompt
{
  id v8 = [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_promptText];
  objc_super v3 = [(UINavigationBar *)self topItem];
  id v4 = [v3 prompt];

  if ([(_UINavigationBarItemStack *)self->_stack isPushingOrPopping])
  {
    if (v8) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5)
    {
      if (v8) {
        BOOL v6 = v4 == 0;
      }
      else {
        BOOL v6 = 0;
      }
      if (!v6) {
        goto LABEL_14;
      }
      id v4 = &stru_1ED0E84C0;
    }
    else
    {

      id v4 = 0;
    }
    id v7 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
    [v7 setShouldUpdatePromptAfterTransition:1];
  }
LABEL_14:
  [(UINavigationBar *)self _setPrompt:v4];
}

- (void)_setPrompt:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  [(_UINavigationBarVisualProvider *)visualProvider _shim_setPromptText:v5 animated:[(UINavigationBar *)self _isAnimationEnabled]];
}

- (void)_pushNavigationItem:(id)a3 transitionAssistant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(UINavigationBar *)self _effectiveDelegateForItem:v7];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v9 navigationBar:self shouldPushItem:v7])
  {
    if (_UINavigationBarShouldCheckLegacyViolation(self))
    {
      int v10 = [v7 searchController];

      if (v10)
      {
        BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:2049 description:@"UISearchController integration not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."];
      }
      BOOL v11 = [v7 titleView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:2051 description:@"_UINavigationBarTitleView not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."];
      }
      id v13 = [v7 _weeTitle];

      if (v13)
      {
        uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:2052 description:@"Wee Title not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."];
      }
    }
    [v7 _setNavigationBar:self];
    [(_UINavigationBarItemStack *)self->_stack pushItem:v7 withTransitionAssistant:v8];
    if (objc_opt_respondsToSelector()) {
      [v9 _navigationBarDidUpdateStack:self];
    }
    [(_UINavigationBarVisualProvider *)self->_visualProvider prepareForPush];
    uint64_t v14 = [(_UINavigationBarItemStack *)self->_stack previousTopItem];
    if (v14
      && (long long v15 = (void *)v14,
          BOOL v16 = [(UINavigationBar *)self _isAnimationEnabled],
          v15,
          v16))
    {
      visualProvider = self->_visualProvider;
      if (visualProvider
        && ![(_UINavigationBarVisualProvider *)visualProvider allowsUserInteractionDuringTransitions])
      {
        [(UIView *)self setUserInteractionEnabled:0];
      }
      uint64_t v18 = 1;
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v19 = self->_visualProvider;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __59__UINavigationBar__pushNavigationItem_transitionAssistant___block_invoke;
    v25[3] = &unk_1E52DDF30;
    v25[4] = self;
    [(_UINavigationBarVisualProvider *)v19 pushAnimated:v18 completion:v25];
    objc_super v20 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
    [v20 finishTrackingInteractiveTransition];

    uint64_t v21 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
    [v21 setShouldHideBackButtonDuringTransition:0];
  }
}

- (BOOL)_isAnimationEnabled
{
  if (self->_animationDisabledCount) {
    return 0;
  }
  id v4 = [(UIView *)self superview];
  if (v4)
  {
    id v5 = [(UIView *)self window];
    BOOL v2 = v5 != 0;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

uint64_t __59__UINavigationBar__pushNavigationItem_transitionAssistant___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _completePushOperationAnimated:a2 transitionAssistant:a3];
}

- (void)_completePushOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  BOOL v6 = [(UINavigationBar *)self _effectiveDelegate];
  int v7 = objc_opt_respondsToSelector();
  int v8 = v7;
  if (!v4) {
    goto LABEL_6;
  }
  if ((v7 & 1) == 0) {
    [(UINavigationBar *)self _reenableUserInteraction];
  }
  if ([v10 cancelledTransition])
  {
    [(UINavigationBar *)self _cancelInteractiveTransition];
  }
  else
  {
LABEL_6:
    id v9 = [(_UINavigationBarItemStack *)self->_stack topItem];
    [(_UINavigationBarItemStack *)self->_stack completeOperation];
    [(UINavigationBar *)self _accessibility_navigationBarContentsDidChange];
    if (objc_opt_respondsToSelector()) {
      [v6 navigationBar:self didPushItem:v9];
    }
  }
  if ((v4 & v8) == 1) {
    [v6 _navigationBarDidEndAnimation:self];
  }
}

- (BOOL)isMinibar
{
  int64_t v2 = [(UINavigationBar *)self _activeBarMetrics];
  return v2 == 1 || v2 == 102;
}

- (void)didMoveToWindow
{
  if (dyld_program_sdk_at_least())
  {
    v3.receiver = self;
    v3.super_class = (Class)UINavigationBar;
    [(UIView *)&v3 didMoveToWindow];
  }
  [(_UINavigationBarVisualProvider *)self->_visualProvider barDidMoveToWindow];
}

- (void)tintColorDidChange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)UINavigationBar;
  [(UIView *)&v22 tintColorDidChange];
  objc_super v3 = [(UINavigationBar *)self topItem];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = [v3 leftBarButtonItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v8++) _updateView];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = objc_msgSend(v3, "rightBarButtonItems", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
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
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) _updateView];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v11);
  }

  [(UINavigationBar *)self _updateNavigationBarItemsForStyle:[(UINavigationBar *)self _currentBarStyle]];
}

- (void)didAddSubview:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  [(_UINavigationBarVisualProvider *)visualProvider barDidAddSubview:v5];
  int64_t v6 = [(UINavigationBar *)self _currentBarStyle];
  id v7 = [(UINavigationBar *)self _effectiveBarTintColor];
  [(UINavigationBar *)self _updateNavigationBarItem:v5 forStyle:v6 previousTintColor:v7];
}

- (int64_t)_currentBarStyle
{
  int64_t result = self->_barStyle;
  if (result == 1 && self->_barTranslucence == 1) {
    return 2;
  }
  return result;
}

- (void)_updateNavigationBarItem:(id)a3 forStyle:(int64_t)a4 previousTintColor:(id)a5
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v10, "setControlSize:", -[UINavigationBar isMinibar](self, "isMinibar"));
    [v10 setBarStyle:a4];
    id v7 = [(UINavigationBar *)self _effectiveBarTintColor];
    [v10 setNavigationBarTintColor:v7];

    if ([v10 _wantsAccessibilityButtonShapes]) {
      [v10 setNeedsLayout];
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v10, "setControlSize:", -[UINavigationBar isMinibar](self, "isMinibar"));
LABEL_7:
    [v10 setBarStyle:a4];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setStyle:a4];
  }
  else
  {
    uint64_t v8 = +[UIDevice currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 _updateLabelColor];
      }
    }
  }
LABEL_8:
}

- (void)_updateNavigationBarItemsForStyle:(int64_t)a3
{
  id v5 = [(UINavigationBar *)self _effectiveBarTintColor];
  [(UINavigationBar *)self _updateNavigationBarItemsForStyle:a3 previousTintColor:v5];
}

- (void)_updateNavigationBarItemsForStyle:(int64_t)a3 previousTintColor:(id)a4
{
  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self))
  {
    stacuint64_t k = self->_stack;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__UINavigationBar__updateNavigationBarItemsForStyle_previousTintColor___block_invoke;
    v7[3] = &__block_descriptor_40_e30_v24__0__UINavigationItem_8_B16l;
    v7[4] = a3;
    [(_UINavigationBarItemStack *)stack iterateItems:v7];
  }
}

- (int)state
{
  return [(_UINavigationBarItemStack *)self->_stack state];
}

- (void)setPrefersLargeTitles:(BOOL)prefersLargeTitles
{
  BOOL v3 = prefersLargeTitles;
  if (_UINavigationBarShouldCheckLegacyViolation(self) && v3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:2536 description:@"Large titles not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."];
  }
  if (self->_prefersLargeTitles != v3)
  {
    self->_prefersLargeTitles = v3;
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider changeLayout];
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UINavigationBar *)self isLocked])
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    [v5 raise:v6 format:@"Cannot choose layout method for UINavigationBar managed by a controller"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    [(UIView *)&v7 setTranslatesAutoresizingMaskIntoConstraints:v3];
  }
}

- (BOOL)_shouldDecodeSubviews
{
  int64_t v2 = (void *)[(id)objc_opt_class() _visualProviderClassForNavigationBar:self];
  return [v2 shouldDecodeSubviews];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(_UINavigationBarVisualProvider *)self->_visualProvider setSemanticContentAttribute:a3];
}

- (void)_setTitleOpacity:(double)a3
{
}

- (void)dealloc
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider teardown];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  stacuint64_t k = self->_stack;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__UINavigationBar_dealloc__block_invoke;
  v6[3] = &unk_1E52DDEE0;
  v6[4] = self;
  [(_UINavigationBarItemStack *)stack iterateItems:v6];
  if (self->_navControllerAnimatingContext) {
    [(UINavigationBar *)self _reenableUserInteraction];
  }
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  [(UIView *)&v5 dealloc];
}

- (void)_willMoveToWindow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  [(UIView *)&v9 _willMoveToWindow:v4];
  if (v4)
  {
    objc_super v5 = [v4 screen];
    BOOL v6 = [(UINavigationBar *)self _shouldShowBackButtonForScreen:v5];

    if (!v6)
    {
      objc_super v7 = [(_UINavigationBarItemStack *)self->_stack backItem];
      uint64_t v8 = [v7 existingBackButtonView];

      if (v8)
      {
        [v8 removeFromSuperview];
        [(UINavigationBar *)self setNeedsLayout];
      }
    }
  }
}

- (BOOL)_shouldShowBackButtonForScreen:(id)a3
{
  return ![(UINavigationBar *)self _isAlwaysHidden];
}

- (void)_refreshBackButtonMenu
{
}

- (void)_setRequestedMaxBackButtonWidth:(double)a3
{
  self->_requestedMaxBackButtonWidth = a3;
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  unint64_t v4 = titleTextAttributes;
  appearanceStorage = self->_appearanceStorage;
  if (!(v4 | (unint64_t)appearanceStorage)) {
    return;
  }
  BOOL v6 = (void *)v4;
  if (!appearanceStorage)
  {
    objc_super v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    uint64_t v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;
  }
  objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage textAttributes];
  id v10 = (void *)v9;
  if (v9) {
    BOOL v11 = v14 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setTextAttributes:0];
    goto LABEL_18;
  }
  if (v9) {
    BOOL v12 = v14 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    char v13 = [v14 isEqualToDictionary:v9];
    [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setTextAttributes:v14];
    if (v13) {
      goto LABEL_19;
    }
LABEL_18:
    [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
    goto LABEL_19;
  }
  [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setTextAttributes:v14];
  if (v14 && !v10) {
    goto LABEL_18;
  }
LABEL_19:
}

- (NSString)_backdropViewLayerGroupName
{
  int64_t v2 = [(UIView *)self traitCollection];
  BOOL v3 = self;
  unint64_t v4 = [v2 objectForTrait:v3];

  return (NSString *)v4;
}

- (id)_defaultTitleFont
{
  return [(UINavigationBar *)self _defaultTitleFontWithScaleAdjustment:0.0];
}

- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes
{
  if (self->_largeTitleTextAttributes != largeTitleTextAttributes)
  {
    unint64_t v4 = (NSDictionary *)[(NSDictionary *)largeTitleTextAttributes copy];
    objc_super v5 = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = v4;

    [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider changeLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_navControllerAnimatingContext, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (double)_titleOpacity
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider titleAlpha];
  return result;
}

- (id)_defaultTitleFontWithScaleAdjustment:(double)a3
{
  [(UIView *)self bounds];
  return [(UINavigationBar *)self _defaultTitleFontFittingHeight:v5 withScaleAdjustment:a3];
}

- (void)setForceFullHeightInLandscape:(BOOL)a3
{
  __int16 navbarFlags = (__int16)self->_navbarFlags;
  if (((((navbarFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->___int16 navbarFlags = navbarFlags & 0xFFFE | a3;
    [(UINavigationBar *)self invalidateIntrinsicContentSize];
    [(UINavigationBar *)self setNeedsLayout];
  }
}

- (void)_fadeAllViewsIn
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_displayViewsIncludingHiddenBackButtonViews:0];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setAlpha:1.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setBackgroundEffects:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  backgroundEffects = self->_backgroundEffects;
  if (backgroundEffects != v4)
  {
    long long v9 = v4;
    BOOL v6 = [(NSArray *)backgroundEffects isEqualToArray:v4];
    uint64_t v4 = v9;
    if (!v6)
    {
      long long v7 = (NSArray *)[(NSArray *)v9 copy];
      long long v8 = self->_backgroundEffects;
      self->_backgroundEffects = v7;

      [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
      uint64_t v4 = v9;
    }
  }
}

- (id)_defaultTitleFontFittingHeight:(double)a3 withScaleAdjustment:(double)a4
{
  if (a4 == 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = a4;
  }
  long long v7 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage textAttributes];
  long long v8 = [v7 objectForKey:*(void *)off_1E52D2040];

  long long v9 = [(UINavigationBar *)self _currentVisualStyle];
  if (v8)
  {
    [v8 pointSize];
    if (v10 == 0.0)
    {
      [v9 headingFontSize];
      double v12 = v11;
      char v13 = objc_msgSend(v8, "fontWithSize:");

      if (a3 <= 0.0) {
        goto LABEL_13;
      }
      id v14 = [(_UINavigationBarItemStack *)self->_stack topItem];
      int v15 = [v14 _hasDefaultTitleView];

      if (v15 && ([v13 lineHeight], v16 + 2.0 > a3))
      {
        do
        {
          long long v8 = [v13 fontWithSize:v12];

          double v12 = v12 + -1.0;
          [v8 lineHeight];
          char v13 = v8;
        }
        while (v17 + 2.0 > a3);
      }
      else
      {
LABEL_13:
        long long v8 = v13;
      }
      if (v6 < 1.0) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    long long v18 = [(UIView *)self traitCollection];
    long long v19 = +[_UINavigationBarTitleFontProvider providerForIdiom:](_UINavigationBarTitleFontProvider, "providerForIdiom:", [v18 userInterfaceIdiom]);
    long long v8 = [v19 defaultInlineTitleFont];

    if (v6 < 1.0)
    {
LABEL_15:
      [v8 pointSize];
      uint64_t v21 = [v8 fontWithSize:v6 * v20];

      long long v8 = (void *)v21;
    }
  }

  return v8;
}

- (id)_currentVisualStyle
{
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider _shim])
  {
    visualStyle = self->_visualStyle;
    if (!visualStyle)
    {
      uint64_t v4 = [(UIView *)self _screen];
      uint64_t v5 = v4;
      if (v4) {
        uint64_t v6 = [v4 _userInterfaceIdiom];
      }
      else {
        uint64_t v6 = -1;
      }
      long long v9 = +[_UINavigationBarVisualStyle visualStyleForIdiom:v6];
      double v10 = self->_visualStyle;
      self->_visualStyle = v9;

      visualStyle = self->_visualStyle;
    }
    long long v8 = visualStyle;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Requesting visual style in an implementation that has disabled it, returning nil. Behavior of caller is undefined.", buf, 2u);
      }
    }
    else
    {
      long long v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_currentVisualStyle___s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v13 = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Requesting visual style in an implementation that has disabled it, returning nil. Behavior of caller is undefined.", v13, 2u);
      }
    }
    long long v8 = 0;
  }
  return v8;
}

- (UINavigationBar)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)UINavigationBar;
  uint64_t v5 = [(UIView *)&v49 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _visualProviderForNavigationBar:v5];
    visualProvider = v5->_visualProvider;
    v5->_visualProvider = (_UINavigationBarVisualProvider *)v6;

    v5->_int64_t barStyle = 0;
    if ([v4 containsValueForKey:@"UIBarStyle"]) {
      v5->_int64_t barStyle = [v4 decodeIntegerForKey:@"UIBarStyle"];
    }
    if (dyld_program_sdk_at_least())
    {
      if ([v4 containsValueForKey:@"UIBarPrefersLargeTitles"]) {
        v5->_prefersLargeTitles = [v4 decodeBoolForKey:@"UIBarPrefersLargeTitles"];
      }
      if ([v4 containsValueForKey:@"UIBarBackgroundImages"])
      {
        long long v8 = [v4 decodeObjectForKey:@"UIBarBackgroundImages"];
        appearanceStorage = v5->_appearanceStorage;
        if (!appearanceStorage)
        {
          double v10 = objc_alloc_init(_UINavigationBarAppearanceStorage);
          double v11 = v5->_appearanceStorage;
          v5->_appearanceStorage = v10;

          appearanceStorage = v5->_appearanceStorage;
        }
        [(_UIBarAppearanceStorage *)appearanceStorage setAllBackgroundImages:v8];
      }
      if ([v4 containsValueForKey:@"UIBarLargeTitleTextAttributes"])
      {
        uint64_t v12 = [v4 decodeObjectForKey:@"UIBarLargeTitleTextAttributes"];
        largeTitleTextAttributes = v5->_largeTitleTextAttributes;
        v5->_largeTitleTextAttributes = (NSDictionary *)v12;
      }
    }
    if ([v4 decodeBoolForKey:@"UIIsLocked"]) {
      __int16 v14 = 2;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&v5->___int16 navbarFlags = *(_WORD *)&v5->_navbarFlags & 0xFFFD | v14;
    uint64_t v15 = [v4 decodeObjectForKey:@"UIBarTintColor"];
    barTintColor = v5->_barTintColor;
    v5->_barTintColor = (UIColor *)v15;

    [(UIView *)v5 setClipsToBounds:0];
    double v17 = [v4 decodeObjectForKey:@"UIDelegate"];
    p_delegate = (id *)&v5->_delegate;
    objc_storeWeak((id *)&v5->_delegate, v17);

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20) {
      *(_WORD *)&v5->_navbarFlags |= 0x10u;
    }
    id v21 = objc_loadWeakRetained(p_delegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22) {
      *(_WORD *)&v5->_navbarFlags |= 0x20u;
    }
    id v23 = objc_loadWeakRetained(p_delegate);
    char v24 = objc_opt_respondsToSelector();

    if (v24) {
      *(_WORD *)&v5->_navbarFlags |= 0x40u;
    }
    id v25 = objc_loadWeakRetained(p_delegate);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      *(_WORD *)&v5->_navbarFlags |= 0x80u;
    }
    if ([v4 containsValueForKey:@"UIShadowImage"])
    {
      __int16 v27 = [v4 decodeObjectForKey:@"UIShadowImage"];
      [(UINavigationBar *)v5 setShadowImage:v27];
    }
    if ([v4 containsValueForKey:@"UITitleTextAttributes"])
    {
      int v28 = [v4 decodeObjectForKey:@"UITitleTextAttributes"];
      [(UINavigationBar *)v5 setTitleTextAttributes:v28];
    }
    if ([v4 containsValueForKey:@"UIBarPosition"]) {
      v5->_barPosition = [v4 decodeIntegerForKey:@"UIBarPosition"];
    }
    if ([v4 containsValueForKey:@"UIBarTranslucence"]) {
      v5->_int64_t barTranslucence = [v4 decodeIntegerForKey:@"UIBarTranslucence"];
    }
    if ([v4 containsValueForKey:@"UIBackIndicatorImage"])
    {
      uint64_t v29 = [v4 decodeObjectForKey:@"UIBackIndicatorImage"];
      [(UINavigationBar *)v5 setBackIndicatorImage:v29];
    }
    if ([v4 containsValueForKey:@"UIBackIndicatorTransitionMask"])
    {
      v30 = [v4 decodeObjectForKey:@"UIBackIndicatorTransitionMask"];
      [(UINavigationBar *)v5 setBackIndicatorTransitionMaskImage:v30];
    }
    uint64_t v31 = [v4 decodeObjectForKey:@"UINavigationBarStandardAppearance"];
    standardAppearance = v5->_standardAppearance;
    v5->_standardAppearance = (UINavigationBarAppearance *)v31;

    id v33 = [(_UINavigationBarVisualProvider *)v5->_visualProvider appearanceObserver];
    uint64_t v34 = v5->_standardAppearance;
    if (v34) {
      objc_storeWeak((id *)&v34->super._changeObserver, v33);
    }

    if (v5->_standardAppearance)
    {
      uint64_t v35 = [v4 decodeObjectForKey:@"UINavigationBarCompactAppearance"];
      compactAppearance = v5->_compactAppearance;
      v5->_compactAppearance = (UINavigationBarAppearance *)v35;

      v37 = [(_UINavigationBarVisualProvider *)v5->_visualProvider appearanceObserver];
      id v38 = v5->_compactAppearance;
      if (v38) {
        objc_storeWeak((id *)&v38->super._changeObserver, v37);
      }

      uint64_t v39 = [v4 decodeObjectForKey:@"UINavigationBarScrollEdgeAppearance"];
      scrollEdgeAppearance = v5->_scrollEdgeAppearance;
      v5->_scrollEdgeAppearance = (UINavigationBarAppearance *)v39;

      uint64_t v41 = [(_UINavigationBarVisualProvider *)v5->_visualProvider appearanceObserver];
      v42 = v5->_scrollEdgeAppearance;
      if (v42) {
        objc_storeWeak((id *)&v42->super._changeObserver, v41);
      }

      uint64_t v43 = [v4 decodeObjectForKey:@"UINavigationBarCompactScrollEdgeAppearance"];
      compactScrollEdgeAppearance = v5->_compactScrollEdgeAppearance;
      v5->_compactScrollEdgeAppearance = (UINavigationBarAppearance *)v43;

      v45 = [(_UINavigationBarVisualProvider *)v5->_visualProvider appearanceObserver];
      uint64_t v46 = v5->_compactScrollEdgeAppearance;
      if (v46) {
        objc_storeWeak((id *)&v46->super._changeObserver, v45);
      }

      *(_WORD *)&v5->_navbarFlags |= 0x400u;
    }
    [(UINavigationBar *)v5 _commonNavBarInit];
    v47 = [v4 decodeObjectForKey:@"UIItems"];
    [(UINavigationBar *)v5 _setDecodedItems:v47];
  }
  return v5;
}

- (void)_setDecodedItems:(id)a3
{
  id v4 = a3;
  stacuint64_t k = self->_stack;
  if (stack)
  {
    if ([(_UINavigationBarItemStack *)stack stackItemsAreEqualTo:v4]) {
      goto LABEL_8;
    }
    uint64_t v6 = self->_stack;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__UINavigationBar__setDecodedItems___block_invoke;
    v12[3] = &unk_1E52DDEE0;
    v12[4] = self;
    [(_UINavigationBarItemStack *)v6 iterateItems:v12];
    [(_UINavigationBarItemStack *)self->_stack setItems:v4 withTransitionAssistant:0];
    long long v7 = self->_stack;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__UINavigationBar__setDecodedItems___block_invoke_2;
    v11[3] = &unk_1E52DDEE0;
    v11[4] = self;
    [(_UINavigationBarItemStack *)v7 iterateItems:v11];
  }
  else
  {
    long long v8 = [[_UINavigationBarItemStack alloc] initWithItems:v4];
    long long v9 = self->_stack;
    self->_stacuint64_t k = v8;

    [(_UINavigationBarVisualProvider *)self->_visualProvider setStack:self->_stack];
  }
  double v10 = [(_UINavigationBarItemStack *)self->_stack topItem];
  if (v10) {
    [(_UINavigationBarVisualProvider *)self->_visualProvider setupTopNavigationItem];
  }
  [(_UINavigationBarItemStack *)self->_stack completeOperation];
  [(UINavigationBar *)self _accessibility_navigationBarContentsDidChange];

LABEL_8:
}

- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance
{
  id v4 = compactAppearance;
  uint64_t v5 = self->_compactAppearance;
  uint64_t v6 = v4;
  double v17 = v6;
  if (v5 == v6)
  {

LABEL_17:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    goto LABEL_18;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  long long v8 = self->_compactAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  long long v9 = [(UIBarAppearance *)v17 copy];
  double v10 = self->_compactAppearance;
  self->_compactAppearance = v9;

  [(UINavigationBar *)self _installDefaultAppearance];
  double v11 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  uint64_t v12 = self->_compactAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, v11);
  }

  if (!_UIBarsApplyChromelessEverywhere() || ![(UINavigationBar *)self isMinibar]) {
    goto LABEL_17;
  }
  char v13 = [(_UINavigationBarVisualProvider *)self->_visualProvider stack];
  __int16 v14 = [v13 topEntry];
  uint64_t v15 = [v14 activeLayout];
  if (v15)
  {
    double v16 = v15[36];

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    if (v16 == 1.0) {
      goto LABEL_18;
    }
  }
  else
  {

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
  }
  [(UINavigationBar *)self setNeedsLayout];
LABEL_18:
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)UINavigationBar;
  uint64_t v3 = [(UIView *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", @" delegate=%p", v6);
  }
  if ([(id)objc_opt_class() _forceLegacyVisualProvider]) {
    [v4 appendFormat:@" forcedLegacyProvider"];
  }
  if (self->_standardAppearance) {
    objc_msgSend(v4, "appendFormat:", @" standardAppearance=%p", self->_standardAppearance);
  }
  if (self->_scrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" scrollEdgeAppearance=%p", self->_scrollEdgeAppearance);
  }
  if (self->_compactAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactAppearance=%p", self->_compactAppearance);
  }
  if (self->_compactScrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactScrollEdgeAppearance=%p", self->_compactScrollEdgeAppearance);
  }
  if ((*(_WORD *)&self->_navbarFlags & 0x80) == 0) {
    [v4 appendString:@" no-scroll-edge-support"];
  }
  return (NSString *)v4;
}

- (void)_setDecodedUnlockedWithNavigationControllerDelegate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFEFF | v3;
}

- (BOOL)_wasDecodedUnlockedWithNavigationControllerDelegate
{
  return HIBYTE(*(_WORD *)&self->_navbarFlags) & 1;
}

- (BOOL)_useInlineBackgroundHeightWhenLarge
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider useInlineBackgroundHeightWhenLarge];
}

- (void)_setUseInlineBackgroundHeightWhenLarge:(BOOL)a3
{
}

- (double)_backgroundOpacity
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider backgroundAlpha];
  return result;
}

- (void)_setBackgroundOpacity:(double)a3
{
}

- (void)_setBackgroundView:(id)a3
{
}

- (double)_shadowAlpha
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_shadowAlpha];
  return result;
}

- (void)_setShadowAlpha:(double)a3
{
}

- (BOOL)_disableBlurTinting
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_disableBlurTinting];
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
}

- (void)_applySPIAppearanceToButtons
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [(UIView *)self subviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          long long v9 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage barButtonAppearanceStorage];
          [v8 _applyBarButtonAppearanceStorage:v9 withTaggedSelectors:0];

          [v8 setNeedsDisplay];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_setBackgroundImage:(id)a3 mini:(id)a4
{
  id v6 = a4;
  [(UINavigationBar *)self setBackgroundImage:a3 forBarMetrics:0];
  [(UINavigationBar *)self setBackgroundImage:v6 forBarMetrics:1];
}

- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  id v17 = a3;
  id v9 = a4;
  if (a5 >= 2)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:470 description:@"Normal and Highlighted (pressed) states are the only supported states"];
  }
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    long long v11 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    long long v12 = self->_appearanceStorage;
    self->_appearanceStorage = v11;

    appearanceStorage = self->_appearanceStorage;
  }
  long long v13 = [(_UINavigationBarAppearanceStorage *)appearanceStorage barButtonAppearanceStorage];
  id v14 = [v13 backgroundImageForState:a5 style:8 isMini:0];
  if (v14 == v17)
  {
    id v15 = [v13 backgroundImageForState:a5 style:8 isMini:1];

    if (v15 == v9) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [v13 setBackgroundImage:v17 forState:a5 style:8 isMini:0];
  [v13 setBackgroundImage:v9 forState:a5 style:8 isMini:1];
  [(UINavigationBar *)self _applySPIAppearanceToButtons];
LABEL_9:
}

- (void)_setBackButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  id v17 = a3;
  id v9 = a4;
  if (a5 >= 2)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:486 description:@"Normal and Highlighted (pressed) states are the only supported states"];
  }
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    long long v11 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    long long v12 = self->_appearanceStorage;
    self->_appearanceStorage = v11;

    appearanceStorage = self->_appearanceStorage;
  }
  long long v13 = [(_UINavigationBarAppearanceStorage *)appearanceStorage barButtonAppearanceStorage];
  id v14 = [v13 backButtonBackgroundImageForState:a5 isMini:0];
  if (v14 == v17)
  {
    id v15 = [v13 backButtonBackgroundImageForState:a5 isMini:1];

    if (v15 == v9) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [v13 setBackButtonBackgroundImage:v17 forState:a5 isMini:0];
  [v13 setBackButtonBackgroundImage:v9 forState:a5 isMini:1];
  [(UINavigationBar *)self _applySPIAppearanceToButtons];
LABEL_9:
}

- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4 forState:(unint64_t)a5
{
  id v22 = a3;
  id v8 = a4;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    long long v10 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    long long v11 = self->_appearanceStorage;
    self->_appearanceStorage = v10;

    appearanceStorage = self->_appearanceStorage;
  }
  long long v12 = [(_UINavigationBarAppearanceStorage *)appearanceStorage barButtonAppearanceStorage];
  long long v13 = [v12 textAttributesForState:a5];
  if (v22 || v8 || v13)
  {
    id v14 = (id)[v13 mutableCopy];
    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v15 = *(void *)off_1E52D2048;
    if (v22) {
      [v14 setObject:v22 forKey:v15];
    }
    else {
      [v14 removeObjectForKey:v15];
    }
    uint64_t v16 = *(void *)off_1E52D2238;
    id v17 = [v13 objectForKey:*(void *)off_1E52D2238];
    if (v17)
    {
      if (!v8) {
        goto LABEL_19;
      }
    }
    else
    {
      id v17 = objc_alloc_init((Class)off_1E52D2E28);
      objc_msgSend(v17, "setShadowOffset:", 0.0, -1.0);
      [v17 setShadowColor:0];
      if (!v8) {
        goto LABEL_19;
      }
    }
    if (a5 == 1)
    {
      if ([(_UINavigationBarAppearanceStorage *)self->_appearanceStorage reversesShadowOffset])
      {
        long long v18 = [v12 textAttributeForKey:v16 state:0];
        long long v19 = v18;
        if (v18)
        {
          [v18 shadowOffset];
        }
        else
        {
          double v21 = -1.0;
          double v20 = 0.0;
        }
        objc_msgSend(v17, "setShadowOffset:", -v20, -v21);
      }
      goto LABEL_23;
    }
LABEL_19:
    if (!v8)
    {
      [v14 removeObjectForKey:v16];
LABEL_24:
      if (([v14 isEqualToDictionary:v13] & 1) == 0)
      {
        [v12 setTextAttributes:v14 forState:a5];
        [(UINavigationBar *)self _applySPIAppearanceToButtons];
      }

      goto LABEL_27;
    }
LABEL_23:
    [v14 setObject:v17 forKey:v16];
    goto LABEL_24;
  }
LABEL_27:
}

- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4
{
}

- (void)_setPressedButtonItemTextColor:(id)a3 shadowColor:(id)a4
{
}

- (void)_setButtonTextShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    uint64_t v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    id v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  id v20 = [(_UINavigationBarAppearanceStorage *)appearanceStorage barButtonAppearanceStorage];
  id v9 = [v20 textAttributesForState:0];
  long long v10 = [v20 textAttributesForState:1];
  id v11 = (id)[v9 mutableCopy];
  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = (id)[v10 mutableCopy];
  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  BOOL v13 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage reversesShadowOffset];
  uint64_t v14 = *(void *)off_1E52D2238;
  id v15 = [v9 objectForKey:*(void *)off_1E52D2238];
  uint64_t v16 = [v10 objectForKey:v14];
  id v17 = (id)v16;
  if (v15)
  {
    if (v16) {
      goto LABEL_9;
    }
  }
  else
  {
    id v15 = objc_alloc_init((Class)off_1E52D2E28);
    [v15 setShadowColor:0];
    if (v17) {
      goto LABEL_9;
    }
  }
  id v17 = objc_alloc_init((Class)off_1E52D2E28);
  [v17 setShadowColor:0];
LABEL_9:
  objc_msgSend(v15, "setShadowOffset:", width, height);
  double v18 = -width;
  double v19 = -height;
  if (!v13)
  {
    double v19 = height;
    double v18 = width;
  }
  objc_msgSend(v17, "setShadowOffset:", v18, v19);
  [v11 setObject:v15 forKey:v14];
  [v12 setObject:v17 forKey:v14];
  if (![v11 isEqualToDictionary:v9])
  {
    [v20 setTextAttributes:v11 forState:0];
    if ([v12 isEqual:v10])
    {
LABEL_16:
      [(UINavigationBar *)self _applySPIAppearanceToButtons];
      goto LABEL_17;
    }
LABEL_15:
    [v20 setTextAttributes:v12 forState:1];
    goto LABEL_16;
  }
  if (([v12 isEqual:v10] & 1) == 0) {
    goto LABEL_15;
  }
LABEL_17:
}

- (void)_setReversesButtonTextShadowOffsetWhenPressed:(BOOL)a3
{
  BOOL v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage)
    {
      id v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      uint64_t v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  id v20 = [(_UINavigationBarAppearanceStorage *)appearanceStorage barButtonAppearanceStorage];
  id v8 = [v20 textAttributesForState:0];
  id v9 = [v20 textAttributesForState:1];
  long long v10 = v9;
  if (v3 || (!v8 ? (BOOL v11 = v9 == 0) : (BOOL v11 = 0), !v11))
  {
    id v12 = (id)[v9 mutableCopy];
    if (!v12) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setReversesShadowOffset:v3];
    uint64_t v13 = *(void *)off_1E52D2238;
    uint64_t v14 = [v8 objectForKey:*(void *)off_1E52D2238];
    id v15 = [v10 objectForKey:v13];
    if (v15)
    {
      if (v14)
      {
LABEL_14:
        [v14 shadowOffset];
LABEL_18:
        double v18 = -v16;
        double v19 = -v17;
        if (v3)
        {
          double v16 = -v16;
          double v17 = -v17;
        }
        objc_msgSend(v15, "setShadowOffset:", v16, v17, v18, v19);
        [v12 setObject:v15 forKey:v13];
        if (([v12 isEqual:v10] & 1) == 0)
        {
          [v20 setTextAttributes:v12 forState:1];
          [(UINavigationBar *)self _applySPIAppearanceToButtons];
        }

        goto LABEL_23;
      }
    }
    else
    {
      id v15 = objc_alloc_init((Class)off_1E52D2E28);
      [v15 setShadowColor:0];
      if (v14) {
        goto LABEL_14;
      }
    }
    double v17 = -1.0;
    double v16 = 0.0;
    goto LABEL_18;
  }
LABEL_23:
}

+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5 backgroundImage:(id)a6 viewSize:(CGSize)a7
{
  return 0;
}

+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5
{
  return (id)objc_msgSend(a1, "_statusBarBaseTintColorForStyle:translucent:tintColor:backgroundImage:viewSize:", a3, a4, a5, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (id)_backgroundViewForPalette:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_UIBarBackground alloc];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = -[_UIBarBackground initWithFrame:](v4, "initWithFrame:", v6, v8, v10, v12);
  [(_UIBarBackground *)v13 setTopAligned:1];
  uint64_t v14 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  [(_UIBarBackground *)v13 setLayout:v14];

  return v13;
}

- (void)_palette:(id)a3 isAttaching:(BOOL)a4 didComplete:(BOOL)a5
{
  if (a4) {
    -[UINavigationBar _updatePalette:](self, "_updatePalette:", a3, a4, a5);
  }
}

- (int64_t)_barTranslucence
{
  return self->_barTranslucence;
}

- (double)_heightIncludingBackground
{
  if (self->_barPosition == 3)
  {
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider _shim_backgroundHeight];
  }
  else
  {
    [(UIView *)self frame];
    return v4;
  }
  return result;
}

- (void)_setBackdropViewLayerGroupName:(id)a3
{
  id v7 = a3;
  double v4 = [(UIView *)self traitOverrides];
  double v5 = self;
  if (v7)
  {
    [v4 setObject:v7 forTrait:v5];
  }
  else
  {
    int v6 = [v4 containsTrait:v5];

    if (!v6) {
      goto LABEL_6;
    }
    double v4 = [(UIView *)self traitOverrides];
    double v5 = self;
    [v4 removeTrait:v5];
  }

LABEL_6:
}

- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage
{
  unint64_t v4 = backIndicatorImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    double v9 = (UIImage *)v4;
    if (!appearanceStorage)
    {
      int v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      id v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    double v8 = [(_UINavigationBarAppearanceStorage *)appearanceStorage backIndicatorImage];

    unint64_t v4 = (unint64_t)v9;
    if (v8 != v9)
    {
      [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setBackIndicatorImage:v9];
      [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
      unint64_t v4 = (unint64_t)v9;
    }
  }
}

- (void)setBackIndicatorTransitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage
{
  unint64_t v4 = backIndicatorTransitionMaskImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    double v9 = (UIImage *)v4;
    if (!appearanceStorage)
    {
      int v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      id v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    double v8 = [(_UINavigationBarAppearanceStorage *)appearanceStorage backIndicatorTransitionMaskImage];

    unint64_t v4 = (unint64_t)v9;
    if (v8 != v9)
    {
      [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setBackIndicatorTransitionMaskImage:v9];
      [(_UINavigationBarVisualProvider *)self->_visualProvider changeAppearance];
      unint64_t v4 = (unint64_t)v9;
    }
  }
}

- (double)_backIndicatorLeftMargin
{
  int64_t v2 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorLeftMargin];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)_setBackIndicatorLeftMargin:(double)a3
{
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    int v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    id v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  double v8 = [(_UINavigationBarAppearanceStorage *)appearanceStorage backIndicatorLeftMargin];
  [v8 doubleValue];
  double v10 = v9;

  if (v10 != a3)
  {
    double v11 = self->_appearanceStorage;
    double v12 = [NSNumber numberWithDouble:a3];
    [(_UINavigationBarAppearanceStorage *)v11 setBackIndicatorLeftMargin:v12];

    [(UINavigationBar *)self setNeedsLayout];
  }
}

- (double)_effectiveBackIndicatorLeftMargin
{
  uint64_t v3 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorImage];
  if (v3)
  {
    double v4 = (void *)v3;
    uint64_t v5 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorTransitionMaskImage];
    if (v5)
    {
      int v6 = (void *)v5;
      id v7 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorLeftMargin];

      if (v7)
      {
        double v8 = [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage backIndicatorLeftMargin];
        [v8 doubleValue];
        double v10 = v9;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  double v8 = [(UINavigationBar *)self _currentVisualStyle];
  [(UIView *)self _contentMargin];
  double v12 = v11;
  [v8 horizontalMarginAdjustment];
  double v14 = v12 - v13;
  if (v14 >= 0.0) {
    double v10 = v14;
  }
  else {
    double v10 = 0.0;
  }
LABEL_9:

  return v10;
}

- (UILayoutGuide)_userContentGuide
{
  return (UILayoutGuide *)[(_UINavigationBarVisualProvider *)self->_visualProvider _shim_userContentGuide];
}

- (int64_t)_itemStackCount
{
  return [(_UINavigationBarItemStack *)self->_stack itemCount];
}

- (void)_setAccessibilityButtonBackgroundTintColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_accessibilityButtonBackgroundTintColor != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_accessibilityButtonBackgroundTintColor, a3);
    [(UINavigationBar *)self _accessibilityButtonShapesParametersDidChange];
    uint64_t v5 = v6;
  }
}

uint64_t __54__UINavigationBar__updatePaletteBackgroundIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatePalette:a2];
}

- (void)_updateAppearancesForNewVisualProvider
{
  [(UINavigationBar *)self _installDefaultAppearance];
  uint64_t v3 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  standardAppearance = self->_standardAppearance;
  if (standardAppearance) {
    objc_storeWeak((id *)&standardAppearance->super._changeObserver, v3);
  }

  uint64_t v5 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  compactAppearance = self->_compactAppearance;
  if (compactAppearance) {
    objc_storeWeak((id *)&compactAppearance->super._changeObserver, v5);
  }

  id v7 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  scrollEdgeAppearance = self->_scrollEdgeAppearance;
  if (scrollEdgeAppearance) {
    objc_storeWeak((id *)&scrollEdgeAppearance->super._changeObserver, v7);
  }

  double v9 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
  if (compactScrollEdgeAppearance) {
    objc_storeWeak((id *)&compactScrollEdgeAppearance->super._changeObserver, v9);
  }

  if ((*(_WORD *)&self->_navbarFlags & 0x400) != 0) {
    [(UINavigationBar *)self _upgradeAppearanceAPI];
  }
  [(UINavigationBar *)self setNeedsLayout];
}

- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance
{
  double v4 = compactScrollEdgeAppearance;
  uint64_t v5 = self->_compactScrollEdgeAppearance;
  int v6 = v4;
  double v17 = v6;
  if (v5 == v6)
  {

LABEL_18:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    [(UINavigationBar *)self _upgradeAppearanceAPI];
    goto LABEL_19;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  double v8 = self->_compactScrollEdgeAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  double v9 = [(UIBarAppearance *)v17 copy];
  double v10 = self->_compactScrollEdgeAppearance;
  self->_compactScrollEdgeAppearance = v9;

  [(UINavigationBar *)self _installDefaultAppearance];
  double v11 = [(_UINavigationBarVisualProvider *)self->_visualProvider appearanceObserver];
  double v12 = self->_compactScrollEdgeAppearance;
  if (v12) {
    objc_storeWeak((id *)&v12->super._changeObserver, v11);
  }

  if (!_UIBarsApplyChromelessEverywhere() || ![(UINavigationBar *)self isMinibar]) {
    goto LABEL_18;
  }
  double v13 = [(_UINavigationBarVisualProvider *)self->_visualProvider stack];
  double v14 = [v13 topEntry];
  id v15 = [v14 activeLayout];
  if (!v15)
  {

    goto LABEL_18;
  }
  double v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  [(UINavigationBar *)self _upgradeAppearanceAPI];
  if (v16 == 1.0) {
    [(UINavigationBar *)self setNeedsLayout];
  }
LABEL_19:
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics
{
}

- (UIImage)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics
{
  appearanceStorage = self->_appearanceStorage;
  if ((unint64_t)(barMetrics - 101) >= 2) {
    UIBarMetrics v4 = UIBarMetricsDefault;
  }
  else {
    UIBarMetrics v4 = barMetrics;
  }
  if ((unint64_t)barMetrics >= 2) {
    UIBarMetrics v5 = v4;
  }
  else {
    UIBarMetrics v5 = barMetrics;
  }
  return (UIImage *)[(_UIBarAppearanceStorage *)appearanceStorage backgroundImageForBarPosition:0 barMetrics:v5];
}

- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  if (barPosition == 4)
  {
    if ((byte_1EB25AE83 & 1) == 0)
    {
      byte_1EB25AE83 = 1;
      UIBarMetrics v4 = "UIBarPositionBottomAttached";
      goto LABEL_7;
    }
LABEL_8:
    UIBarMetrics v5 = 0;
    goto LABEL_10;
  }
  if (barPosition == UIBarPositionBottom)
  {
    if ((byte_1EB25AE82 & 1) == 0)
    {
      byte_1EB25AE82 = 1;
      UIBarMetrics v4 = "UIBarPositionBottom";
LABEL_7:
      NSLog(&cfstr_SCustomization_0.isa, a2, "UINavigationBar", @"background image", v4);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  UIBarMetrics v5 = -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:");
LABEL_10:
  return (UIImage *)v5;
}

- (void)setTitleVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  appearanceStorage = self->_appearanceStorage;
  if (adjustment != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      double v9 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      double v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    [(_UINavigationBarAppearanceStorage *)appearanceStorage titleVerticalAdjustmentForBarMetrics:barMetrics];
    if (v11 != adjustment)
    {
      [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setTitleVerticalAdjustment:barMetrics forBarMetrics:adjustment];
      [(UINavigationBar *)self setNeedsLayout];
    }
  }
}

- (CGFloat)titleVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage titleVerticalAdjustmentForBarMetrics:barMetrics];
  return result;
}

- (BOOL)_deferShadowToSearchBar
{
  return [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage deferShadowToSearchBar];
}

- (void)_setDeferShadowToSearchBar:(BOOL)a3
{
  BOOL v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    int v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    BOOL v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  if ([(_UINavigationBarAppearanceStorage *)appearanceStorage deferShadowToSearchBar] != v3)
  {
    [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setDeferShadowToSearchBar:v3];
    visualProvider = self->_visualProvider;
    double v9 = 1.0;
    if (v3) {
      double v9 = 0.0;
    }
    [(_UINavigationBarVisualProvider *)visualProvider _shim_setShadowAlpha:v9];
  }
}

- (void)_setAlwaysUseDefaultMetrics:(BOOL)a3
{
  if (self->_alwaysUseDefaultMetrics != a3)
  {
    self->_alwaysUseDefaultMetrics = a3;
    [(UINavigationBar *)self setNeedsLayout];
  }
}

+ (id)_defaultVisualStyleForOrientation:(int64_t)a3
{
  if (qword_1EB25AE90 != -1) {
    dispatch_once(&qword_1EB25AE90, &__block_literal_global_56);
  }
  [(id)qword_1EB25AE88 setMetrics:_UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2)];
  [(id)qword_1EB25AE88 setInPopover:0];
  UIBarMetrics v4 = (void *)qword_1EB25AE88;
  return v4;
}

void __53__UINavigationBar__defaultVisualStyleForOrientation___block_invoke()
{
  uint64_t v0 = +[_UINavigationBarVisualStyle visualStyleForIdiom:-1];
  v1 = (void *)qword_1EB25AE88;
  qword_1EB25AE88 = v0;
}

- (double)defaultBackButtonAlignmentHeight
{
  BOOL v3 = [(UINavigationBar *)self _currentVisualStyle];
  [v3 buttonHeight];
  double v5 = v4;
  int v6 = [(UINavigationBar *)self currentBackButton];
  unsigned int v7 = [(UINavigationBar *)self isMinibar];
  if ([v6 _wantsAccessibilityButtonShapes]) {
    _UINavigationButtonAccessibilityBackground(1, v7);
  }
  else {
  double v8 = [v6 _backButtonBackgroundImageForState:0 barMetrics:v7];
  }
  double v9 = v8;
  if (v8)
  {
    [v8 alignmentRectInsets];
    double v11 = v10;
    double v13 = v12;
    [v9 size];
    double v5 = v14 - (v11 + v13);
  }

  return v5;
}

- (double)defaultHeightForMetrics:(int64_t)a3
{
  double v4 = [(UINavigationBar *)self _currentVisualStyle];
  double v5 = v4;
  if (v4)
  {
    [v4 barHeightForMetrics:a3];
    double v7 = v6;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "defaultHeightForMetrics: should be avoided as it does not handle many cases for layout of modern bars. If you think you need this, please discuss with UIKit.", buf, 2u);
      }
    }
    else
    {
      double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25AE98) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "defaultHeightForMetrics: should be avoided as it does not handle many cases for layout of modern bars. If you think you need this, please discuss with UIKit.", v11, 2u);
      }
    }
    if (qword_1EB25AEA0 != -1) {
      dispatch_once(&qword_1EB25AEA0, &__block_literal_global_250);
    }
    if (byte_1EB25AE84)
    {
      if (a3)
      {
        double v7 = 32.0;
      }
      else if (_UIBarsUseNewPadHeights())
      {
        double v7 = 50.0;
      }
      else
      {
        double v7 = 44.0;
      }
    }
    else
    {
      double v7 = 0.0;
    }
  }

  return v7;
}

void __43__UINavigationBar_defaultHeightForMetrics___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  byte_1EB25AE84 = [&unk_1ED3EF1E8 containsObject:v1];
}

- (double)defaultHeight
{
  return 50.0;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  double v5 = [(UINavigationBar *)self _currentVisualStyle];
  if (v5)
  {
    double v6 = [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_promptText];
    uint64_t v7 = [v5 navigationBar:self metricsForOrientation:a3 hasPrompt:v6 != 0];

    double v8 = [(UIView *)self _screen];
    [v8 _mainSceneBoundsForInterfaceOrientation:a3];
    double v10 = v9;
    [v5 barHeightForMetrics:v7];
    double v12 = v11;
  }
  else
  {
    -[UINavigationBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v10 = v13;
    double v12 = v14;
  }

  double v15 = v10;
  double v16 = v12;
  result.double height = v16;
  result.double width = v15;
  return result;
}

+ (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  double v4 = objc_msgSend(a1, "_defaultVisualStyleForOrientation:");
  double v5 = +[UIScreen mainScreen];
  [v5 _mainSceneBoundsForInterfaceOrientation:a3];
  double v7 = v6;
  [v4 barHeight];
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)defaultSizeWithPromptForOrientation:(int64_t)a3
{
  double v4 = objc_msgSend(a1, "_defaultVisualStyleForOrientation:");
  double v5 = +[UIScreen mainScreen];
  [v5 _mainSceneBoundsForInterfaceOrientation:a3];
  double v7 = v6;
  [v4 barPromptHeight];
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)defaultSize
{
  [a1 defaultSizeForOrientation:1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CGSize)defaultSizeWithPrompt
{
  [a1 defaultSizeWithPromptForOrientation:1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (id)defaultPromptFont
{
  double v2 = [a1 _defaultVisualStyleForOrientation:1];
  double v3 = [v2 promptFont];

  return v3;
}

+ (double)defaultAnimationDuration
{
  return 0.35;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  id v4 = a3;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  -[_UINavigationBarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, v5.receiver, v5.super_class);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UINavigationBar;
  [(UIView *)&v22 encodeWithCoder:v4];
  int64_t barStyle = self->_barStyle;
  if (barStyle) {
    [v4 encodeInteger:barStyle forKey:@"UIBarStyle"];
  }
  if (dyld_program_sdk_at_least())
  {
    if (self->_prefersLargeTitles) {
      [v4 encodeBool:1 forKey:@"UIBarPrefersLargeTitles"];
    }
    double v6 = [(_UIBarAppearanceStorage *)self->_appearanceStorage allBackgroundImages];
    if (v6) {
      [v4 encodeObject:v6 forKey:@"UIBarBackgroundImages"];
    }
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    if (largeTitleTextAttributes) {
      [v4 encodeObject:largeTitleTextAttributes forKey:@"UIBarLargeTitleTextAttributes"];
    }
  }
  if ((*(_WORD *)&self->_navbarFlags & 2) != 0) {
    [v4 encodeBool:1 forKey:@"UIIsLocked"];
  }
  barTintColor = self->_barTintColor;
  if (barTintColor) {
    [v4 encodeObject:barTintColor forKey:@"UIBarTintColor"];
  }
  double v9 = [(_UINavigationBarItemStack *)self->_stack topItem];

  if (v9)
  {
    double v10 = [(_UINavigationBarItemStack *)self->_stack items];
    [v4 encodeObject:v10 forKey:@"UIItems"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  double v12 = [(UINavigationBar *)self shadowImage];
  if (v12) {
    [v4 encodeObject:v12 forKey:@"UIShadowImage"];
  }
  double v13 = [(UINavigationBar *)self titleTextAttributes];
  if (v13) {
    [v4 encodeObject:v13 forKey:@"UITitleTextAttributes"];
  }
  int64_t barPosition = self->_barPosition;
  if (barPosition) {
    [v4 encodeInteger:barPosition forKey:@"UIBarPosition"];
  }
  int64_t barTranslucence = self->_barTranslucence;
  if (barTranslucence) {
    [v4 encodeInteger:barTranslucence forKey:@"UIBarTranslucence"];
  }
  double v16 = [(UINavigationBar *)self backIndicatorImage];

  if (v16) {
    [v4 encodeObject:v16 forKey:@"UIBackIndicatorImage"];
  }
  double v17 = [(UINavigationBar *)self backIndicatorTransitionMaskImage];

  if (v17) {
    [v4 encodeObject:v17 forKey:@"UIBackIndicatorTransitionMask"];
  }
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider appearanceAPIVersion] >= 2)
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance) {
      [v4 encodeObject:standardAppearance forKey:@"UINavigationBarStandardAppearance"];
    }
    compactAppearance = self->_compactAppearance;
    if (compactAppearance) {
      [v4 encodeObject:compactAppearance forKey:@"UINavigationBarCompactAppearance"];
    }
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance) {
      [v4 encodeObject:scrollEdgeAppearance forKey:@"UINavigationBarScrollEdgeAppearance"];
    }
    compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
    if (compactScrollEdgeAppearance) {
      [v4 encodeObject:compactScrollEdgeAppearance forKey:@"UINavigationBarCompactScrollEdgeAppearance"];
    }
  }
}

- (UINavigationBarNSToolbarSection)currentNSToolbarSection
{
  return 0;
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return 0;
}

- (void)_customViewChangedForButtonItem:(id)a3
{
  id v25 = a3;
  id v4 = [(_UINavigationBarItemStack *)self->_stack topItem];
  objc_super v5 = [v25 view];
  double v6 = [v4 leftBarButtonItems];
  double v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 indexOfObject:v25];
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v9 = [v4 rightBarButtonItems];
  double v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 indexOfObject:v25];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
      uint64_t v12 = indexOfViewForIndexOfItem(v11, v10);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      uint64_t v13 = v12;
      if (v5)
      {
        double v14 = v4;
        uint64_t v15 = v13;
        double v16 = v5;
        uint64_t v17 = 0;
LABEL_14:
        [v14 _replaceCustomLeftRightViewAtIndex:v15 withView:v16 left:v17];
        goto LABEL_18;
      }
      id v20 = [v25 createViewForNavigationItem:v4];
      double v21 = v4;
      uint64_t v22 = v13;
      id v23 = v20;
      uint64_t v24 = 0;
      goto LABEL_17;
    }
  }
  else if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_19;
  }
  uint64_t v18 = indexOfViewForIndexOfItem(v8, v7);
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = v18;
    if (v5)
    {
      double v14 = v4;
      uint64_t v15 = v19;
      double v16 = v5;
      uint64_t v17 = 1;
      goto LABEL_14;
    }
    id v20 = [v25 createViewForNavigationItem:v4];
    double v21 = v4;
    uint64_t v22 = v19;
    id v23 = v20;
    uint64_t v24 = 1;
LABEL_17:
    [v21 _replaceCustomLeftRightViewAtIndex:v22 withView:v23 left:v24];
  }
LABEL_18:
  [v4 updateNavigationBarButtonsAnimated:0];
LABEL_19:
}

- (NSArray)_animationIds
{
  double v2 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  double v3 = [v2 animationIDs];

  return (NSArray *)v3;
}

- (void)_beginInteractiveTransition
{
}

- (void)_updateInteractiveTransition:(double)a3
{
  id v4 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  objc_msgSend(v4, "updateInteractiveTransitionPercent:", fmax(a3, 0.0));
}

- (void)_finishInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  double v9 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  [v9 finishInteractiveTransitionPercent:a5 completionSpeed:a3 completionCurve:a4];

  stacuint64_t k = self->_stack;
  [(_UINavigationBarItemStack *)stack endInteractiveTransition];
}

- (void)_cancelInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  double v9 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  [v9 cancelInteractiveTransitionPercent:a5 completionSpeed:a3 completionCurve:a4];

  [(_UINavigationBarItemStack *)self->_stack endInteractiveTransition];
  double v10 = [(_UINavigationBarItemStack *)self->_stack previousTopItem];
  LODWORD(v9) = [v10 _backgroundHidden];

  if (v9)
  {
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider _shim_setShadowAlpha:0.0];
  }
}

- (double)_heightForRestoringFromCancelledTransition
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider heightForRestoringFromCancelledTransition];
  return result;
}

- (void)pushNavigationItem:(id)a3
{
}

- (UINavigationItem)popNavigationItemAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  if ([(UINavigationBar *)self isLocked])
  {
    double v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Cannot call %@ directly on a UINavigationBar managed by a controller.", v8 format];

    double v9 = 0;
  }
  else
  {
    if (v3)
    {
      if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    double v9 = [(UINavigationBar *)self _popNavigationItemWithTransition:v10];
  }
  return (UINavigationItem *)v9;
}

- (void)_popNestedNavigationItem
{
  id v4 = [(_UINavigationBarItemStack *)self->_stack _shim_popNestedNavigationItem];
  BOOL v3 = [v4 _navigationBar];

  if (v3 == self) {
    [v4 _setNavigationBar:0];
  }
}

- (void)_pushNestedNavigationItem:(id)a3
{
}

- (id)_popNavigationItemWithTransition:(int)a3
{
  objc_super v5 = [(UINavigationBar *)self _effectiveDelegate];
  double v6 = [(_UINavigationBarItemStack *)self->_stack topItem];
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || [v5 navigationBar:self shouldPopItem:v6])
  {
    if (a3)
    {
      uint64_t v7 = [(UINavigationBar *)self _effectiveDelegate];
      uint64_t v8 = +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:self delegate:v7 crossfade:a3 == 6];
    }
    else
    {
      [(UINavigationBar *)self _disableAnimation];
      uint64_t v8 = 0;
    }
    [(UINavigationBar *)self _popNavigationItemWithTransitionAssistant:v8];
    if (![(UINavigationBar *)self _isAlwaysHidden])
    {
      double v9 = [(_UINavigationBarItemStack *)self->_stack topItem];
      [v9 _updateViewsForBarSizeChangeAndApply:0];
      [(_UINavigationBarVisualProvider *)self->_visualProvider updateTopNavigationItemAnimated:[(UINavigationBar *)self _isAnimationEnabled]];
      [(UINavigationBar *)self updatePrompt];
    }
    if (!a3) {
      [(UINavigationBar *)self _enableAnimation];
    }
  }
  return v6;
}

- (void)popNavigationItem
{
}

- (void)_completePopOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4
{
  BOOL v4 = a3;
  id v17 = a4;
  double v6 = [(UINavigationBar *)self _effectiveDelegate];
  int v7 = objc_opt_respondsToSelector();
  int v8 = v7;
  if (!v4) {
    goto LABEL_6;
  }
  if ((v7 & 1) == 0) {
    [(UINavigationBar *)self _reenableUserInteraction];
  }
  if ([v17 cancelledTransition])
  {
    [(UINavigationBar *)self _cancelInteractiveTransition];
  }
  else
  {
LABEL_6:
    double v9 = [(_UINavigationBarItemStack *)self->_stack previousTopItem];
    if ([(id)objc_opt_class() _forceLegacyVisualProvider]) {
      [v9 _removeTitleAndButtonViews];
    }
    uint64_t v10 = [v9 _navigationBar];
    uint64_t v11 = v10;
    if (v10 == self
      || v10
      && ([(UINavigationBar *)v10 items],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 containsObject:v9],
          v12,
          (v13 & 1) == 0))
    {
      [v9 _setNavigationBar:0];
    }
    double v14 = [v9 _searchControllerIfAllowed];
    uint64_t v15 = [v14 searchBar];

    double v16 = [v15 superview];

    if (v16 == self) {
      [v15 removeFromSuperview];
    }
    [(_UINavigationBarItemStack *)self->_stack completeOperation];
    [(UINavigationBar *)self _accessibility_navigationBarContentsDidChange];
    if (objc_opt_respondsToSelector()) {
      [v6 navigationBar:self didPopItem:v9];
    }
  }
  if ((v4 & v8) == 1) {
    [v6 _navigationBarDidEndAnimation:self];
  }
}

- (void)_popNavigationItemWithTransitionAssistant:(id)a3
{
  [(_UINavigationBarItemStack *)self->_stack popItemWithTransitionAssistant:a3];
  BOOL v4 = [(_UINavigationBarItemStack *)self->_stack previousTopItem];
  [(_UINavigationBarVisualProvider *)self->_visualProvider prepareForPop];
  BOOL v5 = [(UINavigationBar *)self _isAnimationEnabled];
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    visualProvider = self->_visualProvider;
    if (visualProvider)
    {
      if (![(_UINavigationBarVisualProvider *)visualProvider allowsUserInteractionDuringTransitions])[(UIView *)self setUserInteractionEnabled:0]; {
    }
      }
  }
  int v8 = self->_visualProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__UINavigationBar__popNavigationItemWithTransitionAssistant___block_invoke;
  v12[3] = &unk_1E52DDF30;
  v12[4] = self;
  [(_UINavigationBarVisualProvider *)v8 popAnimated:v6 completion:v12];
  double v9 = [(UINavigationBar *)self _effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 _navigationBarDidUpdateStack:self];
  }
  uint64_t v10 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  [v10 finishTrackingInteractiveTransition];

  uint64_t v11 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  [v11 setShouldHideBackButtonDuringTransition:0];
}

uint64_t __61__UINavigationBar__popNavigationItemWithTransitionAssistant___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _completePopOperationAnimated:a2 transitionAssistant:a3];
}

- (int)_transitionForOldItems:(id)a3 newItems:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 lastObject];
  int v7 = [v5 lastObject];

  if (v6 == v7)
  {
    int v8 = 0;
  }
  else if ([v5 containsObject:v6])
  {
    int v8 = 2;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

void __46__UINavigationBar__setItems_transition_reset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:0];
  id v2 = [*(id *)(a1 + 40) _stackEntry];
  [v2 setSearchActive:0];
}

uint64_t __46__UINavigationBar__setItems_transition_reset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _completePushOperationAnimated:a2 transitionAssistant:a3];
}

uint64_t __46__UINavigationBar__setItems_transition_reset___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _completePopOperationAnimated:a2 transitionAssistant:a3];
}

- (void)_setItemsUpToItem:(id)a3 transition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![(_UINavigationBarItemStack *)self->_stack state])
  {
    int v7 = [MEMORY[0x1E4F1CA48] array];
    stacuint64_t k = self->_stack;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __48__UINavigationBar__setItemsUpToItem_transition___block_invoke;
    uint64_t v15 = &unk_1E52DDF80;
    id v9 = v6;
    id v16 = v9;
    id v10 = v7;
    id v17 = v10;
    [(_UINavigationBarItemStack *)stack iterateItems:&v12];
    if (v4)
    {
      objc_msgSend(v10, "addObject:", v9, v12, v13, v14, v15, v16);
      [(UINavigationBar *)self _setItems:v10 transition:0 reset:0];
      id v11 = [(UINavigationBar *)self _popNavigationItemWithTransition:v4];
    }
    else
    {
      -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", v10, 0, 0, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __48__UINavigationBar__setItemsUpToItem_transition___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) != a2) {
    return [*(id *)(result + 40) addObject:a2];
  }
  *a3 = 1;
  return result;
}

- (void)_addItems:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 lastObject];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[UINavigationBar _addItem:withEffectiveDelegate:transition:](self, "_addItem:withEffectiveDelegate:transition:", (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (int64_t)_effectiveMetricsForMetrics:(int64_t)a3
{
  BOOL v4 = [(UINavigationBar *)self forceFullHeightInLandscape];
  int64_t v5 = 101;
  if (a3 != 102) {
    int64_t v5 = a3;
  }
  if (a3 == 1) {
    int64_t v5 = 0;
  }
  if (v4) {
    return v5;
  }
  else {
    return a3;
  }
}

- (int64_t)effectiveInterfaceOrientation
{
  if (![(UINavigationBar *)self forceFullHeightInLandscape])
  {
    BOOL v4 = [(UIView *)self window];
    if (v4)
    {
LABEL_4:
      uint64_t v5 = [v4 _windowInterfaceOrientation];
      if (!v5) {
        uint64_t v5 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v4];
      }
      int64_t v3 = v5;
      goto LABEL_11;
    }
    if ((*(_WORD *)&self->_navbarFlags & 0x20) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v4 = [WeakRetained _navigationBarWindowForInterfaceOrientation:self];

      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
    int64_t v3 = 1;
LABEL_11:

    return v3;
  }
  return 1;
}

- (void)setRequestedContentSize:(int64_t)a3
{
  int v6 = _UINavigationBarShouldCheckLegacyViolation(self);
  if (a3 && v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UINavigationBar.m" lineNumber:2525 description:@"Explicit content size not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."];
  }
  if (self->_requestedContentSize != a3)
  {
    self->_requestedContentSize = a3;
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider changeLayout];
  }
}

- (int64_t)currentContentSize
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider currentContentSize];
}

- (id)_restingHeights
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider restingHeights];
}

- (BOOL)_heightDependentOnOrientation
{
  if (self->_requestedContentSize) {
    return 0;
  }
  int64_t v3 = [(UIView *)self window];
  BOOL v4 = [v3 screen];

  if (v4) {
    char v2 = _UIUseMiniHeightInLandscape(1u);
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (NSDirectionalEdgeInsets)_resolvedLargeTitleMargins
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider resolvedLargeTitleMargins];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_cancelInteractiveTransition
{
  double v3 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
  int v4 = [v3 cancelledTransition];

  if (v4)
  {
    if ([(_UINavigationBarItemStack *)self->_stack state] == 1)
    {
      double v5 = [(_UINavigationBarItemStack *)self->_stack topItem];
      int v6 = [v5 _navigationBar];

      if (v6 == self)
      {
        [v5 _removeTitleAndButtonViews];
        [v5 _removeBarButtonItemViews];
        [v5 _setNavigationBar:0];
      }
    }
    [(_UINavigationBarItemStack *)self->_stack cancelOperation];
    id v10 = [(_UINavigationBarItemStack *)self->_stack topItem];
    id v7 = [(_UINavigationBarItemStack *)self->_stack backItem];
    id v8 = [v7 _navigationBar];

    if (v8)
    {
      id v9 = [v7 backButtonView];
      [v9 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    [v10 updateNavigationBarButtonsAnimated:0];
  }
}

- (id)navigationItemAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)_reenableUserInteraction
{
  [(UIView *)self setUserInteractionEnabled:1];
  [(_UIViewControllerTransitionContext *)self->_navControllerAnimatingContext _enableInteractionForDisabledViews];
  navControllerAnimatingContext = self->_navControllerAnimatingContext;
  self->_navControllerAnimatingContext = 0;
}

- (void)_reenableUserInteractionWhenReadyWithContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_navControllerAnimatingContext, a3);
  if (![(_UINavigationBarItemStack *)self->_stack state]) {
    [(UINavigationBar *)self _reenableUserInteraction];
  }
}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return -[_UINavigationBarVisualProvider canHandleStatusBarTouchAtPoint:](self->_visualProvider, "canHandleStatusBarTouchAtPoint:", a3.x, a3.y);
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  visualProvider = self->_visualProvider;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationBar;
  id v7 = -[UIView hitTest:forEvent:](&v10, sel_hitTest_forEvent_, a4);
  id v8 = -[_UINavigationBarVisualProvider hitTest:defaultViewHit:](visualProvider, "hitTest:defaultViewHit:", v7, x, y);

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  visualProvider = self->_visualProvider;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationBar;
  id v7 = -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  id v8 = -[_UINavigationBarVisualProvider hitTest:defaultViewHit:](visualProvider, "hitTest:defaultViewHit:", v7, x, y);

  return v8;
}

- (void)_evaluateBackIndicatorForHilightedState:(BOOL)a3 ofBarButtonItem:(id)a4 inNavigationItem:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  if (v11
    && v8
    && [v11 _showsBackButtonIndicator]
    && ([v11 isHidden] & 1) == 0)
  {
    id v9 = [(_UINavigationBarItemStack *)self->_stack topItem];
    if (v9 != v8)
    {

      goto LABEL_12;
    }
    if ([v8 _leftItemsWantBackButton])
    {
      uint64_t v10 = [(_UINavigationBarItemStack *)self->_stack itemCount];

      if (v10 > 1) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    [(UINavigationBar *)self _setBackIndicatorPressed:v6 initialPress:0];
  }
LABEL_12:
}

- (void)_setBackIndicatorPressed:(BOOL)a3 initialPress:(BOOL)a4
{
}

- (BOOL)_allowInteractionDuringTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained enableBackButtonDuringTransition])
  {
    int v4 = [(_UINavigationBarItemStack *)self->_stack transitionAssistant];
    int v5 = [v4 interactive] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_canPreemptTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained _isCurrentTransitionPreemptable];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldCrossFadeBackgroundVisility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained _shouldCrossFadeNavigationBarBackgroundVisibility];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)popForCarplayPressAtFakePoint:(CGPoint)a3
{
}

- (id)animationFactory
{
  if (objc_opt_respondsToSelector()) {
    visualProvider = self->_visualProvider;
  }
  else {
    visualProvider = 0;
  }
  return visualProvider;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  visualProvider = self->_visualProvider;
  id v7 = a4;
  id v8 = a3;
  if ([(_UINavigationBarVisualProvider *)visualProvider _shim_wantsCustomTouchHandlingForTouches:v8])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_touchesBegan:v8 withEvent:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    [(UIResponder *)&v9 touchesBegan:v8 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  visualProvider = self->_visualProvider;
  id v7 = a4;
  id v8 = a3;
  if ([(_UINavigationBarVisualProvider *)visualProvider _shim_wantsCustomTouchHandlingForTouches:v8])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_touchesMoved:v8 withEvent:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    [(UIResponder *)&v9 touchesMoved:v8 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  visualProvider = self->_visualProvider;
  id v7 = a4;
  id v8 = a3;
  if ([(_UINavigationBarVisualProvider *)visualProvider _shim_wantsCustomTouchHandlingForTouches:v8])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_touchesEnded:v8 withEvent:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    [(UIResponder *)&v9 touchesEnded:v8 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  visualProvider = self->_visualProvider;
  id v7 = a4;
  id v8 = a3;
  if ([(_UINavigationBarVisualProvider *)visualProvider _shim_wantsCustomTouchHandlingForTouches:v8])
  {
    [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_touchesCancelled:v8 withEvent:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    [(UIResponder *)&v9 touchesCancelled:v8 withEvent:v7];
  }
}

- (void)addConstraint:(id)a3
{
  id v4 = a3;
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider _shim_throwConstraintExceptions])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot modify constraints for UINavigationBar managed by a controller"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationBar;
    [(UIView *)&v5 addConstraint:v4];
  }
}

- (void)removeConstraint:(id)a3
{
  id v4 = a3;
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider _shim_throwConstraintExceptions])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot modify constraints for UINavigationBar managed by a controller"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationBar;
    [(UIView *)&v5 removeConstraint:v4];
  }
}

void __71__UINavigationBar__updateNavigationBarItemsForStyle_previousTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 backButtonView];
  [v3 setStyle:*(void *)(a1 + 32)];
  [v3 setNeedsLayout];
}

- (int64_t)_statusBarStyle
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider statusBarStyle];
}

- (BOOL)forceFullHeightInLandscape
{
  return *(_WORD *)&self->_navbarFlags & 1;
}

- (id)buttonItemShadowColor
{
  return +[UIColor clearColor];
}

- (id)_titleTextColor
{
  id v3 = [(UINavigationBar *)self _currentVisualStyle];
  id v4 = [(UIView *)self traitCollection];
  objc_super v5 = objc_msgSend(v3, "defaultTitleColorForUserInterfaceStyle:barStyle:", objc_msgSend(v4, "userInterfaceStyle"), self->_barStyle);

  return v5;
}

- (void)setRightMargin:(double)a3
{
}

- (BOOL)_titleAutoresizesToFit
{
  return 0;
}

- (void)_updateTitleViewIfTop:(id)a3
{
  stacuint64_t k = self->_stack;
  id v5 = a3;
  id v6 = [(_UINavigationBarItemStack *)stack topItem];

  if (v6 == v5)
  {
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider updateTopNavigationItemTitleView];
  }
}

- (void)setTitleView:(id)a3
{
}

- (id)_currentLeftViews
{
  id v3 = [(UINavigationBar *)self topItem];
  id v4 = [v3 _customLeftViews];
  id v5 = (id)[v4 mutableCopy];

  if (![v5 count])
  {
    if (![(UINavigationBar *)self _hasBackButton]) {
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  id v6 = [(UINavigationBar *)self topItem];
  if (![v6 leftItemsSupplementBackButton])
  {
LABEL_10:

    goto LABEL_11;
  }
  BOOL v7 = [(UINavigationBar *)self _hasBackButton];

  if (v7)
  {
LABEL_6:
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v8 = [(UINavigationBar *)self backItem];
    id v6 = [v8 backButtonView];

    if (v6) {
      [v5 insertObject:v6 atIndex:0];
    }
    goto LABEL_10;
  }
LABEL_11:
  return v5;
}

- (UIView)currentLeftView
{
  id v3 = [(UINavigationBar *)self currentBackButton];
  id v4 = [(UINavigationBar *)self _currentLeftViews];
  if ([v4 count])
  {
    id v5 = [(UINavigationBar *)self topItem];
    if ([v5 leftItemsSupplementBackButton])
    {
      id v6 = v3;
    }
    else
    {
      id v6 = [v4 objectAtIndex:0];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = v3;
  }

  return (UIView *)v7;
}

- (id)_currentRightViews
{
  double v2 = [(UINavigationBar *)self topItem];
  id v3 = [v2 _customRightViews];

  return v3;
}

- (UIView)currentRightView
{
  double v2 = [(UINavigationBar *)self _currentRightViews];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }

  return (UIView *)v3;
}

- (id)_contentView
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_contentView];
}

- (void)_setForceScrollEdgeAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  if (_UIBarsApplyChromelessEverywhere()
    && [(UINavigationBar *)self _effectiveDelegateSupportsScrollEdgeTransitionProgress])
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "forceScrollEdgeAppearance IPI should not be used for chromeless-everywhere to avoid possible conflicts", buf, 2u);
      }
    }
    else
    {
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setForceScrollEdgeAppearance____s_category) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "forceScrollEdgeAppearance IPI should not be used for chromeless-everywhere to avoid possible conflicts", v7, 2u);
      }
    }
  }
  [(_UINavigationBarVisualProvider *)self->_visualProvider setForceScrollEdgeAppearance:v3];
}

- (void)_animateForSearchPresentation:(BOOL)a3
{
}

- (void)_presentHostedSearchWithTransitionCoordinator:(id)a3
{
}

- (void)_dismissHostedSearchWithTransitionCoordinator:(id)a3
{
}

- (void)_updateSearchBarForPlacementChangeIfApplicable
{
}

- (void)_refreshSearchSuggestionsMenuAfterGeometryChange
{
}

- (void)_deferSearchSuggestionsMenuRefreshForGeometryChange
{
}

- (void)_searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3
{
}

- (BOOL)_hasBackButton
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->_stack topItem];
  if ([v3 hidesBackButton])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(_UINavigationBarItemStack *)self->_stack backItem];
    if (v5) {
      BOOL v4 = [(UINavigationBar *)self _shouldShowBackButtonForNavigationItem:v5];
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3
{
  return 1;
}

- (_UINavigationItemButtonView)currentBackButton
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->_stack backItem];
  BOOL v4 = [(_UINavigationBarItemStack *)self->_stack topItem];
  id v5 = [(UINavigationBar *)self _backButtonForBackItem:v3 topItem:v4];

  return (_UINavigationItemButtonView *)v5;
}

- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6
    && ([v7 hidesBackButton] & 1) == 0
    && [(UINavigationBar *)self _shouldShowBackButtonForNavigationItem:v6])
  {
    objc_super v9 = [v6 backButtonView];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (BOOL)_delegateWantsNavigationBarHidden
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained isNavigationBarHidden];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)_sendResizeForPromptChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarDidResizeForPrompt:self];
  }
}

- (void)_prepareToAnimateTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _navigationBarPrepareToAnimateTransition:self];
  }
}

- (void)_sendNavigationBarAnimateTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _navigationBarWillBeginCoordinatedTransitionAnimations:self];
  }
}

- (CGRect)_incomingNavigationBarFrame
{
  char v3 = [(UINavigationBar *)self _accessibility_navigationController];
  BOOL v4 = v3;
  if (v3) {
    [v3 _incomingNavigationBarFrame];
  }
  else {
    [(UIView *)self frame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)prompt
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_promptText];
}

- (id)promptView
{
  return 0;
}

- (CGRect)promptBounds
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)isAnimationEnabled
{
  return 1;
}

- (int64_t)animationDisabledCount
{
  return 0;
}

- (void)drawBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4
{
}

- (void)drawBackButtonBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4 pressed:(BOOL)a5
{
}

- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4
{
}

- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4 leftBack:(BOOL)a5
{
}

- (void)showButtonsWithLeft:(id)a3 right:(id)a4 leftBack:(BOOL)a5
{
}

- (void)showLeftButton:(id)a3 withStyle:(int)a4 rightButton:(id)a5 withStyle:(int)a6
{
}

- (void)_updateContentIfTopItem:(id)a3 animated:(BOOL)a4
{
  stacuint64_t k = self->_stack;
  id v7 = a3;
  id v8 = [(_UINavigationBarItemStack *)stack topItem];

  if (v8 == v7)
  {
    if (a4)
    {
      [(_UINavigationBarVisualProvider *)self->_visualProvider updateTopNavigationItemAnimated:[(UINavigationBar *)self _isAnimationEnabled]];
    }
    else
    {
      [(UINavigationBar *)self _disableAnimation];
      [(_UINavigationBarVisualProvider *)self->_visualProvider updateTopNavigationItemAnimated:[(UINavigationBar *)self _isAnimationEnabled]];
      [(UINavigationBar *)self _enableAnimation];
    }
    [(UINavigationBar *)self _accessibility_navigationBarContentsDidChange];
  }
}

- (void)_updateBackButtonVisibilityIfTop:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->_stack topItem];

  id v7 = v8;
  if (v6 == v8)
  {
    -[_UINavigationBarVisualProvider setBackButtonVisible:animated:](self->_visualProvider, "setBackButtonVisible:animated:", [v8 hidesBackButton] ^ 1, v4);
    id v7 = v8;
  }
}

- (void)setButton:(int)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  NSLog(&cfstr_ThisMethodIsDe.isa, a2);
  id v14 = [(_UINavigationBarItemStack *)self->_stack topItem];
  id v7 = [v14 rightBarButtonItem];
  id v8 = [v7 view];

  double v9 = [v14 leftBarButtonItem];
  double v10 = [v9 view];

  if (a3 == 1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v12 = v10;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!a3)
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();
    double v12 = v8;
    if (v11) {
LABEL_6:
    }
      [v12 setEnabled:v4];
  }
LABEL_7:
}

- (id)createButtonWithContents:(id)a3 width:(double)a4 barStyle:(int64_t)a5 buttonStyle:(int)a6 isRight:(BOOL)a7
{
  return 0;
}

- (void)hideButtons
{
}

- (void)showBackButton:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_updatePalette:(id)a3
{
  id v22 = a3;
  double v5 = [v22 _backgroundView];
  if (([v22 _paletteOverridesPinningBar] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [v22 _backgroundViewLayout];
      id v8 = [(UINavigationBar *)self backgroundEffects];
      if (v8)
      {
        [v7 configureWithEffects:v8];
      }
      else if ([v22 _supportsSpecialSearchBarTransitions] {
             && ([(_UINavigationBarItemStack *)self->_stack topItem],
      }
                 double v9 = objc_claimAutoreleasedReturnValue(),
                 double v3 = (void *)[v9 _backgroundHidden],
                 v9,
                 v3))
      {
        [v7 configureAsTransparent];
      }
      else
      {
        int64_t barStyle = self->_barStyle;
        char v11 = [(UINavigationBar *)self backgroundImageForBarMetrics:[(UINavigationBar *)self _activeBarMetrics]];
        double v3 = v11;
        if (v11
          && (([v11 size], v13 == *MEMORY[0x1E4F1DB30])
            ? (BOOL v14 = v12 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
            : (BOOL v14 = 0),
              v14))
        {
          objc_msgSend(v7, "configureImage:forceOpaque:barStyle:", v3, -[UINavigationBar isTranslucent](self, "isTranslucent") ^ 1, self->_barStyle);
        }
        else
        {
          double v15 = [(UINavigationBar *)self _effectiveBarTintColor];
          objc_msgSend(v7, "configureEffectForStyle:backgroundTintColor:forceOpaque:", barStyle, v15, -[UINavigationBar isTranslucent](self, "isTranslucent") ^ 1);
        }
        if (barStyle == 3 || [v22 paletteShadowIsHidden]) {
          [v7 configureWithoutShadow];
        }
        else {
          [v7 configureShadowForBarStyle:barStyle];
        }
      }
      double v16 = [(UINavigationBar *)self _backdropViewLayerGroupName];
      [v6 setGroupName:v16];

      id v17 = [(_UINavigationBarItemStack *)self->_stack topEntry];
      long long v18 = [v17 activeLayout];

      if (v18)
      {
        id v17 = v18[22];
        double v3 = [v17 layout];
        [v3 backgroundAlpha];
        double v20 = v19;
      }
      else
      {
        double v20 = 1.0;
      }
      double v21 = [v6 layout];
      [v21 setBackgroundAlpha:v20];

      if (v18)
      {
      }
      [v6 transitionBackgroundViews];
      [v22 _propagateBackgroundToContents];
    }
  }
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_updateBackIndicator];
  double v3 = [(UINavigationBar *)self currentBackButton];
  BOOL v4 = [(UINavigationBar *)self _accessibilityButtonBackgroundTintColor];
  if (v3 && [v3 _showsAccessibilityBackgroundWhenEnabled])
  {
    [v3 _setWantsBlendModeForAccessibilityBackgrounds:v4 == 0];
    [v3 _setAccessibilityBackgroundTintColor:v4];
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(UIView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v11 _showsAccessibilityBackgroundWhenEnabled])
        {
          [v11 _setWantsBlendModeForAccessibilityBackgrounds:v4 == 0];
          [v11 _setAccessibilityBackgroundTintColor:v4];
          int v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  if ((v12 | v8)) {
    [(UINavigationBar *)self setNeedsLayout];
  }
}

- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3
{
  if (!_AXSButtonShapesEnabled()) {
    [(id)__barButtonAccessibilityBackgroundImages removeAllObjects];
  }
  [(UINavigationBar *)self _accessibilityButtonShapesParametersDidChange];
}

- (BOOL)_suppressBackIndicator
{
  double v3 = [(UIView *)self _screen];
  if (v3)
  {
    BOOL v4 = [(UIView *)self _screen];
    BOOL v5 = ![(UINavigationBar *)self _shouldShowBackButtonForScreen:v4];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateBackIndicatorImage
{
}

- (CGRect)availableTitleArea
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)_allViews
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_displayViewsIncludingHiddenBackButtonViews:1];
}

- (void)_fadeAllViewsOut
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v2 = [(UINavigationBar *)self _allViews];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_updateActiveBarMetrics
{
  if (!self->_appearanceStorage)
  {
    uint64_t v3 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v3;
  }
  id v9 = [(UINavigationBar *)self _currentVisualStyle];
  if (self->_alwaysUseDefaultMetrics)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int64_t v6 = [(UINavigationBar *)self effectiveInterfaceOrientation];
    long long v7 = [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_promptText];
    uint64_t v5 = [v9 navigationBar:self metricsForOrientation:v6 hasPrompt:v7 != 0];
  }
  int64_t v8 = [(UINavigationBar *)self _effectiveMetricsForMetrics:v5];
  [(_UINavigationBarAppearanceStorage *)self->_appearanceStorage setActiveBarMetrics:v8];
  [(_UINavigationBarVisualStyle *)self->_visualStyle setMetrics:v8];
}

+ (void)_setUseCustomBackButtonAction:(BOOL)a3
{
  __useCustomBackButtonAction = a3;
}

+ (BOOL)_useCustomBackButtonAction
{
  return __useCustomBackButtonAction;
}

- (int64_t)_backgroundBackdropStyle
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _shim_backdropStyle];
}

- (void)_sendNavigationPopForBackBarButtonItem:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 action];
  if (__useCustomBackButtonAction) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v9 = [(UINavigationBar *)self _effectiveDelegate];
    if (objc_opt_respondsToSelector())
    {
      int64_t v6 = [(_UINavigationBarItemStack *)self->_stack topItem];
      [v9 _popNavigationBar:self item:v6];
    }
    else
    {
      BOOL v10 = [(UINavigationBar *)self isLocked];
      [(UINavigationBar *)self setLocked:0];
      id v11 = [(UINavigationBar *)self popNavigationItemAnimated:1];
      [(UINavigationBar *)self setLocked:v10];
    }
  }
  else
  {
    uint64_t v7 = v4;
    int64_t v8 = (void *)UIApp;
    id v9 = [v12 target];
    [v8 sendAction:v7 to:v9 from:self forEvent:0];
  }
}

- (_UITabContainerView)_tabBarHostedView
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider tabBarHostedView];
}

- (void)_setTabBarHostedView:(id)a3
{
}

- (BOOL)_isActiveTabBarHost
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider isActiveTabBarHost];
}

- (void)_setActiveTabBarHost:(BOOL)a3
{
}

- (BOOL)_wantsHostedTabBarMetrics
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider wantsHostedTabBarMetrics];
}

- (void)_setWantsHostedTabBarMetrics:(BOOL)a3
{
}

- (void)_setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4
{
}

- (UIBarButtonItem)_staticNavBarButtonItem
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider staticNavBarButtonItem];
}

- (BOOL)_isContentViewHidden
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider isContentViewHidden];
}

- (void)_setShouldFadeStaticNavBarButton:(BOOL)a3
{
}

- (BOOL)_shouldFadeStaticNavBarButton
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider shouldFadeStaticNavBarButton];
}

- (BOOL)_staticNavBarButtonLingers
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider staticNavBarButtonLingers];
}

- (void)_beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
}

- (BOOL)_isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
}

- (double)_navItemContentLayoutGuideAnimationDistance
{
  [(_UINavigationBarVisualProvider *)self->_visualProvider navItemContentLayoutGuideAnimationDistance];
  return result;
}

- (BOOL)_updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider updateNavItemContentLayoutGuideAnimationConstraintConstant:a3];
}

- (void)_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
}

- (void)_removeContentClippingView
{
}

- (void)_installContentClippingView:(id)a3
{
}

- (void)_beginRenamingIfPossible
{
  uint64_t v3 = [(UINavigationBar *)self topItem];
  int v4 = [v3 _canRename];

  if (v4)
  {
    visualProvider = self->_visualProvider;
    [(_UINavigationBarVisualProvider *)visualProvider _beginRenaming];
  }
}

- (void)_beginRenaming
{
}

- (void)_endRenaming
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_rename_ == a3)
  {
    BOOL v5 = [(UINavigationBar *)self topItem];
    char v6 = [v5 _canRename];

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    return -[UIView canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (id)_accessibility_contentsOfNavigationBar
{
  uint64_t v3 = objc_alloc_init(_UINavigationBarContents);
  int v4 = [(_UINavigationBarItemStack *)self->_stack topItem];
  BOOL v5 = [(_UINavigationBarItemStack *)self->_stack backItem];
  [(_UINavigationBarContents *)v3 setTopItem:v4];
  [(_UINavigationBarContents *)v3 setBackItem:v5];
  char v6 = [(UINavigationBar *)self _staticNavBarButtonItem];
  [(_UINavigationBarContents *)v3 setStaticBarButtonItem:v6];

  if (v4)
  {
    objc_super v7 = [MEMORY[0x1E4F1CA48] array];
    int64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __57__UINavigationBar__accessibility_contentsOfNavigationBar__block_invoke;
    double v19 = &unk_1E52DDFC8;
    id v20 = v7;
    id v21 = v8;
    id v9 = v8;
    id v10 = v7;
    id v11 = _Block_copy(&v16);
    id v12 = objc_msgSend(v4, "leftBarButtonItems", v16, v17, v18, v19);
    [v12 enumerateObjectsUsingBlock:v11];

    long long v13 = [v4 rightBarButtonItems];
    [v13 enumerateObjectsUsingBlock:v11];

    [(_UINavigationBarContents *)v3 setCancelBarButtonItems:v10];
    [(_UINavigationBarContents *)v3 setOtherBarButtonItems:v9];
  }
  if (v5)
  {
    long long v14 = [v5 _effectiveBackBarButtonItem];
    [(_UINavigationBarContents *)v3 setBackBarButtonItem:v14];
  }
  if (v4) {
    [(_UINavigationBarVisualProvider *)self->_visualProvider provideViewsForContents:v3 topItem:v4 backItem:v5];
  }

  return v3;
}

void __57__UINavigationBar__accessibility_contentsOfNavigationBar__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 isSystemItem]) {
    goto LABEL_5;
  }
  uint64_t v3 = [v5 systemItem];
  if ((unint64_t)(v3 - 5) < 2) {
    goto LABEL_7;
  }
  if (v3 == 1) {
    int v4 = (id *)(a1 + 32);
  }
  else {
LABEL_5:
  }
    int v4 = (id *)(a1 + 40);
  [*v4 addObject:v5];
LABEL_7:
}

- (void)_accessibility_triggerBackButton
{
  if (![(_UINavigationBarItemStack *)self->_stack state])
  {
    id v4 = [(_UINavigationBarItemStack *)self->_stack topItem];
    uint64_t v3 = [v4 _effectiveBackBarButtonItem];
    [(UINavigationBar *)self _sendNavigationPopForBackBarButtonItem:v3];
  }
}

- (void)_accessibility_triggerBarButtonItem:(id)a3
{
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(_UINavigationBarItemStack *)self->_stack state]) {
    return 0;
  }
  visualProvider = self->_visualProvider;
  return -[_UINavigationBarVisualProvider _accessibility_shouldBeginHUDGestureAtPoint:](visualProvider, "_accessibility_shouldBeginHUDGestureAtPoint:", x, y);
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  return -[_UINavigationBarVisualProvider _accessibility_HUDItemForPoint:](self->_visualProvider, "_accessibility_HUDItemForPoint:", a3, a4.x, a4.y);
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [(_UINavigationBarItemStack *)self->_stack topItem];
  uint64_t v7 = [v6 leftBarButtonItems];
  int64_t v8 = (void *)v7;
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    id v10 = (void *)v7;
  }
  else {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;

  id v12 = [(_UINavigationBarItemStack *)self->_stack topItem];
  uint64_t v13 = [v12 rightBarButtonItems];
  long long v14 = (void *)v13;
  if (v13) {
    long long v15 = (void *)v13;
  }
  else {
    long long v15 = v9;
  }
  id v16 = v15;

  [v11 arrayByAddingObjectsFromArray:v16];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v22 = objc_msgSend(v5, "view", (void)v26);
        id v23 = [v21 view];
        char v24 = [v22 isDescendantOfView:v23];

        if (v24)
        {
          LOBYTE(v18) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v18;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  uint64_t v7 = -[_UINavigationBarVisualProvider _accessibility_controlToActivateForHUDGestureLiftAtPoint:](self->_visualProvider, "_accessibility_controlToActivateForHUDGestureLiftAtPoint:", x, y);
  if (v7)
  {
    int64_t v8 = [v9 view];
    objc_msgSend(v7, "convertPoint:fromView:", v8, x, y);
    objc_msgSend(v7, "_activateForAccessibilityHUDLiftAtPoint:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  visualProvider = self->_visualProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__UINavigationBar_gestureRecognizerShouldBegin___block_invoke;
  v5[3] = &unk_1E52DDFF0;
  v5[4] = self;
  return [(_UINavigationBarVisualProvider *)visualProvider gestureRecognizerShouldBegin:a3 defaultAnswer:v5];
}

id __48__UINavigationBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)UINavigationBar;
  return objc_msgSendSuper2(&v3, sel_gestureRecognizerShouldBegin_, a2);
}

- (id)_systemDefaultFocusGroupIdentifier
{
  objc_super v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x20) != 0)
  {
    id v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    id v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (id)preferredFocusedView
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider preferredFocusedView];
}

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  if ([(_UINavigationBarVisualProvider *)self->_visualProvider isInCustomization]) {
    return 2;
  }
  return [(UINavigationBar *)self barPosition] == 3 && ![(UIView *)self isHidden];
}

- (id)_immediatelyFinishRunningTransition
{
  return [(_UINavigationBarVisualProvider *)self->_visualProvider _immediatelyFinishRunningTransition];
}

- (UIColor)_accessibilityButtonBackgroundTintColor
{
  return self->_accessibilityButtonBackgroundTintColor;
}

- (UINavigationBarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (UINavigationBarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (void)_setOverrideBackgroundExtension:(double)a3
{
  self->__overrideBackgroundExtension = a3;
}

- (BOOL)_startedAnimationTracking
{
  return self->__startedAnimationTracking;
}

- (BOOL)alwaysUseDefaultMetrics
{
  return self->_alwaysUseDefaultMetrics;
}

- (id)backButtonViewAtPoint:(CGPoint)a3
{
  return (id)-[_UINavigationBarVisualProvider backButtonViewAtPoint:](self->_visualProvider, "backButtonViewAtPoint:", a3.x, a3.y);
}

- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasPrefix:@"titleTextAttributes."]
    && (unint64_t)[v7 length] >= 0x15)
  {
    int64_t v8 = [v7 substringFromIndex:20];
    id v9 = [(UINavigationBar *)self titleTextAttributes];
    id v10 = (void *)[v9 mutableCopy];

    [v10 setValue:v6 forKeyPath:v8];
    [(UINavigationBar *)self setTitleTextAttributes:v10];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UINavigationBar;
    [&v11 _uikit_applyValueFromTraitStorage:v6 forKeyPath:v7];
  }
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(void *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end